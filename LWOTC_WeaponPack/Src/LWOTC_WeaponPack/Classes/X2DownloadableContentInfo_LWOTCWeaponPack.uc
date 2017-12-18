//---------------------------------------------------------------------------------------
//  FILE:    X2DownloadableContentInfo_LWOTCWeaponPack.uc
//  AUTHOR:  Amineri / Pavonis Interactive
//  PURPOSE: Initializes Officer mod settings on campaign start or when loading campaign without mod previously active
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_LWOTCWeaponPack extends X2DownloadableContentInfo;

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed. When a new campaign is started the initial state of the world
/// is contained in a strategy start state. Never add additional history frames inside of InstallNewCampaign, add new state objects to the start state
/// or directly modify start state objects
/// </summary>
//static event InstallNewCampaign(XComGameState StartState);

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

	//add Conventional Battle Rifle always
	`Log("LWOTC WeaponPack : Updated Conventional BR");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('BattleRifle_CV');
	if(ItemTemplate != none)
	{
		`Log("LW SMGPack : Found BattleRifle_CV item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW SMGPack : BattleRifle_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW SMGPack : BattleRifle_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//add Conventional Marksman Rifle always
	`Log("LWOTC WeaponPack : Updated Conventional MR");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('MarksmanRifle_CV');
	if(ItemTemplate != none)
	{
		`Log("LW SMGPack : Found MarksmanRifle_CV item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW SMGPack : MarksmanRifle_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW SMGPack : MarksmanRifle_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//add Conventional LMG always
	`Log("LWOTC WeaponPack : Updated Conventional LMG");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('LMG_CV');
	if(ItemTemplate != none)
	{
		`Log("LW LMGPack : Found LMG item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW LMGPack : LMG_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW LMGPack : LMG_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//add Conventional SAW always
	`Log("LWOTC WeaponPack : Updated Conventional SAW");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('SAW_CV');
	if(ItemTemplate != none)
	{
		`Log("LW SAWPack : Found SAW item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW SAWPack : SAW_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW SAWPack : SAW_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//add Conventional Carbine always
	`Log("LWOTC WeaponPack : Updated Conventional Carbine");
	ItemTemplate = ItemTemplateMgr.FindItemTemplate('Carbine_CV');
	if(ItemTemplate != none)
	{
		`Log("LW WeaponPack : Found Carbine item template");
		if (!XComHQ.HasItem(ItemTemplate))
		{
			`Log("LW WeaponPack : Carbine_CV not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else {
			`Log("LW WeaponPack : Carbine_CV found, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}

	//schematics should be handled already, as the BuildItem UI draws from ItemTemplates, which are automatically loaded
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

/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager ItemTemplateManager;

	//get access to item template manager to update existing upgrades
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	if (ItemTemplateManager == none) {
		`Redscreen("LW SMGPack : failed to retrieve ItemTemplateManager to configure upgrades");
		return;
	}

	class'X2Override_Attachments_SMG'.static.UpdateSMGAttachmentTemplates(ItemTemplateManager);
	class'X2Override_Attachments_Carbine'.static.UpdateCARBINEAttachmentTemplates(ItemTemplateManager);
	class'X2Override_Attachments_Laser'.static.UpdateLaserAttachmentTemplates(ItemTemplateManager);
	class'X2Override_Attachments_Coil'.static.UpdateCoilAttachmentTemplates(ItemTemplateManager);

	class'X2Override_LongWar_Tech'.static.UpdateBaseGameLaserAndCoilTechTemplates();
	class'X2Override_LongWar_Tech'.static.UpdateLaserWeaponTemplates(ItemTemplateManager);
	class'X2Override_LongWar_Tech'.static.UpdateCoilWeaponTemplates(ItemTemplateManager);

	AddSchematicLoc (ItemTemplateManager);
}

// This adds the soldier class to the schematic string [SHARPSHOOTER UPGRADE] draws from vanilla so we don't have to rewrite a ton of loc
static function AddSchematicLoc (X2ItemTemplateManager ItemTemplateMgr)
{
	CopySchematicLoc (ItemTemplateMgr, 'AssaultRifle_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'AssaultRifle_CG_Schematic', 'AssaultRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'BattleRifle_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'BattleRifle_MG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'BattleRifle_CG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'BattleRifle_BM_Schematic', 'AssaultRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Bullpup_LS_Schematic', 'Bullpup_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Bullpup_CG_Schematic', 'Bullpup_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Cannon_LS_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Cannon_CG_Schematic', 'Cannon_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Carbine_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Carbine_MG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Carbine_CG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Carbine_BM_Schematic', 'AssaultRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'LMG_LS_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'LMG_MG_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'LMG_CG_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'LMG_BM_Schematic', 'Cannon_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'MarksmansRifle_LS_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'MarksmansRifle_MG_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'MarksmansRifle_CG_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'MarksmansRifle_BM_Schematic', 'SniperRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Sidearm_LS_Schematic', 'Sidearm_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Sidearm_CG_Schematic', 'Sidearm_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Pistol_LS_Schematic', 'Pistol_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Pistol_CG_Schematic', 'Pistol_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SAW_LS_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SAW_MG_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SAW_CG_Schematic', 'Cannon_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SAW_BM_Schematic', 'Cannon_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Shotgun_LS_Schematic', 'Shotgun_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Shotgun_CG_Schematic', 'Shotgun_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SMG_LS_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_MG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_CG_Schematic', 'AssaultRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SMG_BM_Schematic', 'AssaultRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SniperRifle_LS_Schematic', 'SniperRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SniperRifle_CG_Schematic', 'SniperRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'SparkRifle_LS_Schematic', 'SparkRifle_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'SparkRifle_CG_Schematic', 'SparkRifle_MG_Schematic');

	CopySchematicLoc (ItemTemplateMgr, 'Vektor_LS_Schematic', 'Vektor_MG_Schematic');
	CopySchematicLoc (ItemTemplateMgr, 'Vektor_CG_Schematic', 'Vektor_MG_Schematic');
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