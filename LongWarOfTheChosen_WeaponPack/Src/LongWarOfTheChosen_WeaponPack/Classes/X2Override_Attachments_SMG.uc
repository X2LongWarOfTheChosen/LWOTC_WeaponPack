class X2Override_Attachments_SMG extends X2Override_LongWar;

//add SMG to the DefaultUpgrades Templates so that upgrades work with new weapon
//this doesn't make the upgrade available, it merely configures the art
static function UpdateSMGAttachmentTemplates(X2ItemTemplateManager ItemTemplateManager)
{
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

