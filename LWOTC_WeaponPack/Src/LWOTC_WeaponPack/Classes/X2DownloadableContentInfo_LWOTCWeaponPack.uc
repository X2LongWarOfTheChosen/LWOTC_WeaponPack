//---------------------------------------------------------------------------------------
//  FILE:    X2DownloadableContentInfo_LWSMGPack.uc
//  AUTHOR:  Amineri / Pavonis Interactive
//  PURPOSE: Initializes Officer mod settings on campaign start or when loading campaign without mod previously active
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_LWOTCWeaponPack extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	UpdateConventionalStorage();

	AddLaserAndCoilTechGameStates();
}
/// <summary>
/// This method is run when the player loads a saved game directly into Strategy while this DLC is installed
/// </summary>
static event OnLoadedSavedGameToStrategy()
{
	AddLaserAndCoilTechGameStates();
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed. When a new campaign is started the initial state of the world
/// is contained in a strategy start state. Never add additional history frames inside of InstallNewCampaign, add new state objects to the start state
/// or directly modify start state objects
/// </summary>
//static event InstallNewCampaign(XComGameState StartState);



// ******** HANDLE UPDATING STORAGE ************* //
// This handles updating storage in order to create conventional weapons
static function UpdateConventionalStorage()
{
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateMgr;
	local X2ItemTemplate ItemTemplate;
	local XComGameState_Item NewItemState;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add SMGs");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	//add Conventional SMG always
	`Log("LW SMGPack : Updated Conventional SMG");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('SMG_CV');
	if(ItemTemplate != none)
	{
		`Log("LW SMGPack : Found SMG_CV item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW SMGPack : SMG_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW SMGPack : SMG_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//schematics should be handled already, as the BuildItem UI draws from ItemTemplates, which are automatically loaded
}

/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	UpdateSMGAttachmentTemplates();

	UpdateLaserAttachmentTemplates();
	UpdateBaseGameLaserAndCoilTechTemplates();
	UpdateLaserWeaponTemplates();

	UpdateCoilAttachmentTemplates();

}

static function CopySchematicLoc (X2ItemTemplateManager ItemTemplateMgr, Name NewItem, Name BaseItem)
{
	local X2SchematicTemplate NewTemplate, BaseTemplate;

	BaseTemplate = X2SchematicTemplate (ItemTemplateMgr.FindItemTemplate (BaseItem));
	NewTemplate = X2SchematicTemplate (ItemTemplateMgr.FindItemTemplate (NewItem));

	if (NewTemplate != none && BaseTemplate != none)
	{
		NewTemplate.m_strClassLabel = BaseTemplate.m_strClassLabel;
	}
	else
	{
		`REDSCREEN ("Missing something from" @ NewItem @ BaseItem);
	}
}

// This adds the soldier class to the schematic string [SHARPSHOOTER UPGRADE] draws from vanilla so we don't have to rewrite a ton of loc
static function AddSchematicLoc (X2ItemTemplateManager ItemTemplateMgr)
{
	CopySchematicLoc (ItemTemplateMgr, 'AssaultRifle_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'AssaultRifle_CG_Schematic', 'AssaultRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Cannon_LS_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Cannon_CG_Schematic', 'Cannon_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SniperRifle_LS_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SniperRifle_CG_Schematic', 'SniperRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Shotgun_LS_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Shotgun_CG_Schematic', 'SniperRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Pistol_LS_Schematic', 'Pistol_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Pistol_CG_Schematic', 'Pistol_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SMG_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_MG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_CG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_BM_Schematic', 'AssaultRifle_MG_Schematic');

}

// *************************************************************************
// ************  SMG Section ***********************************************
// *************************************************************************

static function UpdateSMGAttachmentTemplates()
{
	local X2ItemTemplateManager ItemTemplateManager;

	//get access to item template manager to update existing upgrades
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	if (ItemTemplateManager == none) {
		`Redscreen("LW SMGPack : failed to retrieve ItemTemplateManager to configure upgrades");
		return;
	}

	//add SMG to the DefaultUpgrades Templates so that upgrades work with new weapon
	//this doesn't make the upgrade available, it merely configures the art
	AddSMGCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');
	AddSMGCritUpgrade(ItemTemplateManager, 'CritUpgrade_Adv');
	AddSMGCritUpgrade(ItemTemplateManager, 'CritUpgrade_Sup');

	AddSMGAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Bsc');
	AddSMGAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Adv');
	AddSMGAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Sup');

	AddSMGClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Bsc');
	AddSMGClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Adv');
	AddSMGClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Sup');

	AddSMGFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Bsc');
	AddSMGFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Adv');
	AddSMGFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Sup');

	AddSMGReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Bsc');
	AddSMGReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Adv');
	AddSMGReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Sup');

	AddSMGMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Bsc');
	AddSMGMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Adv');
	AddSMGMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Sup');

	AddSMGFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Bsc');
	AddSMGFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Adv');
	AddSMGFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Sup');

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		AddSchematicLoc (ItemTemplateManager);
	}
}

static function AddSMGCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW Crit UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_OpticB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_MG.Meshes.SK_LWMagSMG_OpticB", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_BM.Meshes.SK_LWBeamSMG_OpticB", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddSMGAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW Aim UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_OpticC", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_MG.Meshes.SK_LWMagSMG_OpticC", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_BM.Meshes.SK_LWBeamSMG_OpticC", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddSMGClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW ClipSize UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_MagB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_MagB", "img:///UILibrary_SMG.conventional.LWConvSMG_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagB", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddSMGFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW FreeFire UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Trigger', '', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_TriggerA", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger"); // use conventional trigger attachment
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAttachments.Meshes.SM_MagReargripB", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_BM.Meshes.SK_LWBeamSMG_CoreA", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_CoreB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_CoreB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core_Teeth', '', "LWSMG_BM.Meshes.SK_LWBeamSMG_TeethA", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_TeethA", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_Teeth_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	Template.AddUpgradeAttachment('Trigger', '', "MagAttachments.Meshes.SM_MagTriggerB", "", 'SMG_MG');

}

static function AddSMGReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW Reload UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_MagC", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_MagC", "img:///UILibrary_SMG.conventional.LWConvSMG_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_MagD", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_MagD", "img:///UILibrary_SMG.conventional.LWConvSMG_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagD", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('AutoLoader', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddSMGMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW MissDamage UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	//Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWSMG_CV.Meshes.SM_LWConvSMG_StockB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_StockB", "img:///UILibrary_SMG.conventional.LWConvSMG_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('StockB', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_StockB_alt", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockB", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('HeatSink', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_BM.Meshes.SK_LWBeamSMG_HeatsinkB", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_HeatsinkB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_HeatsinkB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	//Template.AddUpgradeAttachment('Crossbar', '', "ConvAttachments.Meshes.SM_ConvCrossbar", "", 'SMG_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_CrossbarA", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "MagAttachments.Meshes.SM_MagCrossbar", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_Crossbar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
}

static function AddSMGFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	// NEW FreeKill UPGRADE CONFIGURATION
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWSMG_CV.Meshes.SK_LWConvSMG_SuppressorB", "", 'SMG_CV', , "img:///UILibrary_SMG.conventional.LWConvSMG_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('SuppressorB', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagShotgun.Meshes.SM_MagShotgun_SuppressorB", "", 'SMG_MG', , "img:///UILibrary_SMG.magnetic.LWMagSMG_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWSMG_BM.Meshes.SK_LWBeamSMG_SuppressorA", "", 'SMG_BM', , "img:///UILibrary_SMG.Beam.LWBeamSMG_SuppressorA", "img:///UILibrary_SMG.Beam.Inv_LWBeamSMG_SuppressorA", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}

// *************************************************************************
// ************  Laser Section *********************************************
// *************************************************************************

static function UpdateLaserAttachmentTemplates()
{
	local X2ItemTemplateManager ItemTemplateManager;

	//get access to item template manager to update existing upgrades
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	if (ItemTemplateManager == none)
	{
		`Redscreen("LW LaserWeapons : failed to retrieve ItemTemplateManager to configure upgrades");
		return;
	}

	//add Laser Weapons to the DefaultUpgrades Templates so that upgrades work with new weapons
	//this doesn't make the upgrade available, it merely configures the art
	AddLaserCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');
	AddLaserCritUpgrade(ItemTemplateManager, 'CritUpgrade_Adv');
	AddLaserCritUpgrade(ItemTemplateManager, 'CritUpgrade_Sup');

	AddLaserAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Bsc');
	AddLaserAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Adv');
	AddLaserAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Sup');

	AddLaserClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Bsc');
	AddLaserClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Adv');
	AddLaserClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Sup');

	AddLaserFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Bsc');
	AddLaserFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Adv');
	AddLaserFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Sup');

	AddLaserReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Bsc');
	AddLaserReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Adv');
	AddLaserReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Sup');

	AddLaserMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Bsc');
	AddLaserMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Adv');
	AddLaserMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Sup');

	AddLaserFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Bsc');
	AddLaserFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Adv');
	AddLaserFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Sup');
}

static function AddLaserCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Optic_C", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_OpticC", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	//SMG
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_LS.Meshes.SK_LaserSMG_Optic_C", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_OpticC", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Shotgun
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "LWShotgun_LS.Meshes.SK_LaserShotgun_Optic_B", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_OpticC", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_C", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_OpticC", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannon
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "LWCannon_LS.Meshes.SK_LaserCannon_Optic_B", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

}

static function AddLaserAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Optic_B", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	//SMG
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSMG_LS.Meshes.SK_LaserSMG_Optic_B", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Shotgun
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "LWShotgun_LS.Meshes.SK_LaserShotgun_Optic_A", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_B", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_OpticB", "img:///UILibrary_LW_LaserPack.Inv_LaserSniper_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannon
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "LWCannon_LS.Meshes.SK_LaserCannon_Optic_A", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_OpticA", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_OpticA", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddLaserClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	//SMG
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Shotgun
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_LS.Meshes.SK_LaserShotgun_Mag_B", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_MagB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Cannon
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_B", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_MagB", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddLaserFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	//SMG
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Shotgun
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Sniper
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Cannon
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Trigger_B", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
}

static function AddLaserReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	//SMG
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Shotgun
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Sniper
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Cannon
	Template.AddUpgradeAttachment('Reload', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Reload", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_Reload", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_Reload", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddLaserMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_B", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	//SMG -- switching to shared Shotgun stock to better differentiate profile compared to rifle
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	// Shotgun
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	// Sniper Rifle
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Sniper_Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_B", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	// Cannon
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "LWCannon_LS.Meshes.SK_LaserCannon_Stock_B", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
}

static function AddLaserFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'AssaultRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	//SMG
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWSMG_LS.Meshes.SK_LaserSMG_Suppressor", "", 'SMG_LS', , "img:///UILibrary_LW_LaserPack.LaserSMG_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Shotgun
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "LWShotgun_LS.Meshes.SK_LaserShotgun_Suppressor", "", 'Shotgun_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Suppressor", "", 'SniperRifle_LS', , "img:///UILibrary_LW_LaserPack.LaserSniper_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserSniper_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Cannon
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "LWCannon_LS.Meshes.SK_LaserCannon_Suppressor", "", 'Cannon_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}

// This handles creating necessary XCGS_Tech items, which are used to load templates in various places
static function AddLaserAndCoilTechGameStates()
{
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local X2StrategyElementTemplateManager StrategyElementTemplateMgr;
	local XComGameState_Tech TechState;
	local X2TechTemplate TechTemplate;
	local name TechName;
	local bool bFoundTech;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Laser Weapon Techs");
	StrategyElementTemplateMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();


	// Grab all new Tech Templates
	foreach class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier(TechName)
	{
		bFoundTech = false;
		TechTemplate = X2TechTemplate(StrategyElementTemplateMgr.FindStrategyElementTemplate(TechName));
		if(TechTemplate == none)
		{
			`REDSCREEN("X2DLCInfo_LWLaserPack: Unable to find template" @ string(TechName));
			continue;
		}

		foreach History.IterateByClassType(class'XComGameState_Tech', TechState)
		{
			if(TechState.GetMyTemplateName() == TechName)
			{
				bFoundTech = true;
				break;
			}
		}
		if(bFoundTech)
			continue;

		//`LOG("X2DLCInfo_LWLaserPack: Create Tech GameState from" @ string(TechName));
		TechState = XComGameState_Tech(NewGameState.CreateStateObject(class'XComGameState_Tech'));
		TechState.OnCreation(TechTemplate);
		NewGameState.AddStateObject(TechState);
	}

	// Grab all new Tech Templates
	foreach class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier(TechName)
	{
		bFoundTech = false;
		TechTemplate = X2TechTemplate(StrategyElementTemplateMgr.FindStrategyElementTemplate(TechName));
		if(TechTemplate == none)
		{
			`REDSCREEN("X2DLCInfo_LWLaserPack: Unable to find template" @ string(TechName));
			continue;
		}

		foreach History.IterateByClassType(class'XComGameState_Tech', TechState)
		{
			if(TechState.GetMyTemplateName() == TechName)
			{
				bFoundTech = true;
				break;
			}
		}
		if(bFoundTech)
			continue;

		//`LOG("X2DLCInfo_LWLaserPack: Create Tech GameState from" @ string(TechName));
		TechState = XComGameState_Tech(NewGameState.CreateStateObject(class'XComGameState_Tech'));
		TechState.OnCreation(TechTemplate);
		NewGameState.AddStateObject(TechState);
	}

	if(NewGameState.GetNumGameStateObjects() > 0)
		History.AddGameStateToHistory(NewGameState);
	else
		History.CleanupPendingGameState(NewGameState);
}

// Rewire tech tree
static function UpdateBaseGameLaserAndCoilTechTemplates()
{
	local X2TechTemplate TechTemplate;
	local array<X2TechTemplate> TechTemplates;

	// rewire tech tree if schematics are used

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		FindTechTemplateAllDifficulties('MagnetizedWeapons', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier.Length - 1];
		}
		FindTechTemplateAllDifficulties('PlasmaRifle', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier.Length - 1];
		}
	}

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		FindTechTemplateAllDifficulties('PlasmaRifle', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier.Length - 1];
		}
	}
	//`LOG("LW LaserPack: Updated PlasmaRifle Tech");
}

static function UpdateLaserWeaponTemplates()
{
	local X2ItemTemplateManager ItemTemplateManager;
	local bool HasSMG;

	`Log("X2DLCInfo_LWLaserPack: Updating Weapon Templates");

	//get access to item element template manager
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	if (ItemTemplateManager == none) {
		`Redscreen("X2DLCInfo_LWLaserPack: failed to retrieve ItemTemplateManager to modify schematics");
		return;
	}

	HasSMG = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('SMG_CV')) != none;
	`LOG("LW Laser Weapons : Found item SMG_CV = " $ HasSMG);

	//update weapon templates so they upgrade from the correct weapon
	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		UpdateWeaponTemplate(ItemTemplateManager, 'AssaultRifle_MG', 'AssaultRifle_LS');

		if(HasSMG)
		{
			UpdateWeaponTemplate(ItemTemplateManager, 'SMG_MG', 'SMG_LS');
		}

		UpdateWeaponTemplate(ItemTemplateManager, 'Shotgun_MG', 'Shotgun_LS');

		UpdateWeaponTemplate(ItemTemplateManager, 'SniperRifle_MG', 'SniperRifle_LS');

		UpdateWeaponTemplate(ItemTemplateManager, 'Cannon_MG', 'Cannon_LS');

		UpdateWeaponTemplate(ItemTemplateManager, 'Pistol_MG', 'Pistol_LS');
	}

	//update weapon templates so they upgrade from the correct weapon
	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		if(HasSMG)
		{
			UpdateWeaponTemplate(ItemTemplateManager, 'SMG_BM', 'SMG_CG');
		}

		UpdateWeaponTemplate(ItemTemplateManager, 'Shotgun_BM', 'Shotgun_CG');

		UpdateWeaponTemplate(ItemTemplateManager, 'SniperRifle_BM', 'SniperRifle_CG');

		UpdateWeaponTemplate(ItemTemplateManager, 'Cannon_BM', 'Cannon_CG');

		UpdateWeaponTemplate(ItemTemplateManager, 'Pistol_BM', 'Pistol_CG');

		//update magnetic schematics so they are hidden if Coil tier is purchased
		UpdateSchematicTemplate(ItemTemplateManager, 'AssaultRifle_MG_Schematic',	'AssaultRifle_CG');
		if(HasSMG)
			UpdateSchematicTemplate(ItemTemplateManager, 'SMG_MG_Schematic',				'SMG_CG');
		UpdateSchematicTemplate(ItemTemplateManager, 'Shotgun_MG_Schematic',			'Shotgun_CG');
		UpdateSchematicTemplate(ItemTemplateManager, 'SniperRifle_MG_Schematic',		'SniperRifle_CG');
		UpdateSchematicTemplate(ItemTemplateManager, 'Cannon_MG_Schematic',			'Cannon_CG');
		UpdateSchematicTemplate(ItemTemplateManager, 'Pistol_MG_Schematic',			'Pistol_CG');
	}
}

static function UpdateWeaponTemplate(X2ItemTemplateManager ItemTemplateMgr, name Weapon, name BaseItem)
{
	local array<X2ItemTemplate> ItemTemplates;
	local X2WeaponTemplate WeaponTemplate;
	local X2ItemTemplate ItemTemplate;

	FindItemTemplateAllDifficulties(Weapon, ItemTemplates, ItemTemplateMgr);

	foreach ItemTemplates(ItemTemplate)
	{
		WeaponTemplate = X2WeaponTemplate(ItemTemplate);
		if(WeaponTemplate!=none)
		{
			WeaponTemplate.BaseItem = BaseItem; // Which item this will be upgraded from
		}
	}
}

static function UpdateSchematicTemplate(X2ItemTemplateManager ItemTemplateMgr, name Schematic, name HideIfPurchased)
{
	local array<X2ItemTemplate> ItemTemplates;
	local X2SchematicTemplate SchematicTemplate;
	local X2ItemTemplate ItemTemplate;

	FindItemTemplateAllDifficulties(Schematic, ItemTemplates, ItemTemplateMgr);

	foreach ItemTemplates(ItemTemplate)
	{
		SchematicTemplate = X2SchematicTemplate(ItemTemplate);
		if(SchematicTemplate!=none)
		{
			SchematicTemplate.HideIfPurchased = HideIfPurchased;
		}
	}
}

// *************************************************************************
// ************  Coil Section **********************************************
// *************************************************************************

static function UpdateCoilAttachmentTemplates()
{
	local X2ItemTemplateManager ItemTemplateManager;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	AddCoilCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');
	AddCoilCritUpgrade(ItemTemplateManager, 'CritUpgrade_Adv');
	AddCoilCritUpgrade(ItemTemplateManager, 'CritUpgrade_Sup');

	AddCoilAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Bsc');
	AddCoilAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Adv');
	AddCoilAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Sup');

	AddCoilClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Bsc');
	AddCoilClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Adv');
	AddCoilClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Sup');

	AddCoilFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Bsc');
	AddCoilFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Adv');
	AddCoilFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Sup');

	AddCoilReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Bsc');
	AddCoilReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Adv');
	AddCoilReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Sup');

	AddCoilMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Bsc');
	AddCoilMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Adv');
	AddCoilMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Sup');

	AddCoilFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Bsc');
	AddCoilFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Adv');
	AddCoilFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Sup');

}

static function AddCoilCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticB", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_OpticB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	//SMG
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticB", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_OpticB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Shotgun
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "BeamShotgun.Meshes.SM_BeamShotgun_OpticB", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_OpticB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticB", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_OpticB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannon
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "LWCannon_CG.Meshes.LW_CoilCannon_OpticB", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_OpticB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

}

static function AddCoilAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticC", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_OpticC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	//SMG
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticC", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_OpticC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Shotgun
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Shotgun_Optic', "BeamShotgun.Meshes.SM_BeamShotgun_OpticC", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_OpticC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Sniper_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticC", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_OpticC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	// Cannon
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_Cannon_Optic', "LWCannon_CG.Meshes.LW_CoilCannon_OpticC", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_OpticC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

}

static function AddCoilClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagB", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	//SMG
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagB", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	// Shotgun
	//Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_CG.Meshes.LW_CoilShotgun_MagB", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_CG.Meshes.LW_CoilShotgun_MagB", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	// Sniper Rifle
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagB", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	// Cannon
	//Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagB", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagB", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

}

static function AddCoilFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_ReargripB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	//SMG
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_ReargripB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Shotgun
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_ReargripB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Sniper
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_ReargripB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	// Cannon
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_ReargripB", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_ReargripB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_ReargripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

}

static function AddCoilReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagC", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagD", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagD", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	//SMG
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagC", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagD", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagD", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	// Shotgun
	//Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_CG.Meshes.LW_CoilShotgun_MagC", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_CG.Meshes.LW_CoilShotgun_MagC", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Shotgun_Mag', "LWShotgun_CG.Meshes.LW_CoilShotgun_MagD", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_MagD", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	// Sniper
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagC", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Sniper_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagD", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_MagD", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	// Cannon
	//Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagC", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagC", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagD", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagD", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

}

static function AddCoilMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_StockB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	//SMG
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_StockB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// Shotgun
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_StockB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMGShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Sniper_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockC", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_StockC", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_StockC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	// Cannon
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Cannon_Stock', "LWCannon_CG.Meshes.LW_CoilCannon_StockB", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_StockB", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('StockSupport', '', "LWCannon_CG.Meshes.LW_CoilCannon_StockSupportB", "", 'Cannon_CG');

}

static function AddCoilFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SMGPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	// Assault Rifle
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'AssaultRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_Suppressor", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	//SMG
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'SMG_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_Suppressor", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Shotgun
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "LWShotgun_CG.Meshes.LW_CoilShotgun_Suppressor", "", 'Shotgun_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_Suppressor", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilShotgun_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Sniper Rifle
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "LWSniperRifle_CG.Meshes.LW_CoilSniper_Suppressor", "", 'SniperRifle_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_Suppressor", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilSniperRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Cannon
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "LWCannon_CG.Meshes.LW_CoilCannon_Suppressor", "", 'Cannon_CG', , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_Suppressor", "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_CoilCannon_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

}

//=================================================================================
//================= UTILITY CLASSES ===============================================
//=================================================================================

//retrieves all difficulty variants of a given tech template -- future proofing in case difficulty variants get added
static function FindTechTemplateAllDifficulties(name DataName, out array<X2TechTemplate> TechTemplates, optional X2StrategyElementTemplateManager StrategyTemplateMgr)
{
	local array<X2DataTemplate> DataTemplates;
	local X2DataTemplate DataTemplate;
	local X2TechTemplate TechTemplate;

	if(StrategyTemplateMgr == none)
		StrategyTemplateMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	StrategyTemplateMgr.FindDataTemplateAllDifficulties(DataName, DataTemplates);
	TechTemplates.Length = 0;
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if( TechTemplate != none )
		{
			TechTemplates.AddItem(TechTemplate);
		}
	}
}

//retrieves all difficulty variants of a given item template
static function FindItemTemplateAllDifficulties(name DataName, out array<X2ItemTemplate> ItemTemplates, optional X2ItemTemplateManager ItemTemplateMgr)
{
	local array<X2DataTemplate> DataTemplates;
	local X2DataTemplate DataTemplate;
	local X2ItemTemplate ItemTemplate;

	if(ItemTemplateMgr == none)
		ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplateMgr.FindDataTemplateAllDifficulties(DataName, DataTemplates);
	ItemTemplates.Length = 0;
	foreach DataTemplates(DataTemplate)
	{
		ItemTemplate = X2ItemTemplate(DataTemplate);
		if( ItemTemplate != none )
		{
			ItemTemplates.AddItem(ItemTemplate);
		}
	}
}
