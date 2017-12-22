class X2Override_Attachments_SAW extends X2Override_LongWar;

//add SAW to the DefaultUpgrades Templates so that upgrades work with new weapon
//this doesn't make the upgrade available, it merely configures the art
static function UpdateSAWAttachmentTemplates(X2ItemTemplateManager ItemTemplateManager)
{
	AddSAWCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');
	AddSAWCritUpgrade(ItemTemplateManager, 'CritUpgrade_Adv');
	AddSAWCritUpgrade(ItemTemplateManager, 'CritUpgrade_Sup');

	AddSAWAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Bsc');
	AddSAWAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Adv');
	AddSAWAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Sup');

	AddSAWClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Bsc');
	AddSAWClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Adv');
	AddSAWClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Sup');

	AddSAWFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Bsc');
	AddSAWFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Adv');
	AddSAWFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Sup');

	AddSAWReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Bsc');
	AddSAWReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Adv');
	AddSAWReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Sup');

	AddSAWMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Bsc');
	AddSAWMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Adv');
	AddSAWMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Sup');

	AddSAWFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Bsc');
	AddSAWFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Adv');
	AddSAWFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Sup');
}

static function AddSAWCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticB", "", 'SAW_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Optic_C", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_OpticC", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_OpticB", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticB", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_OpticB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgun_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticB", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_OpticA", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

}

static function AddSAWAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticC", "", 'SAW_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MrKX1WTier1.SkeletalMeshes.SM_CentralARScope", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Optic_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_OpticC", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticC", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_OpticC", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgun_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticC", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddSAWClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "RM_BattleRiflePack.Meshes.SM_ConvSAW_MagB", "", 'SAW_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_ETCSAW.SkeletalMeshes.SM_X1SAW_MagB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserCannon_MagB", "img:///UILibrary_LW_LaserPack.Inv_LaserCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "MagCannon.Meshes.SM_MagCannon_MagB", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagCannon_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_BattleRiflePack.Meshes.LW_CoilSAW_MagB", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilCannon_MagB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "BeamCannon.Meshes.SM_BeamCannon_MagB", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamCannon_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddSAWFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvReargripB", "", 'SAW_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAttachments.Meshes.SM_MagReargripB", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreB", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_CoreB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core_Teeth', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_TeethA", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Teeth", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_Teeth_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	Template.AddUpgradeAttachment('Trigger', '', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'SAW_CV');
	Template.AddUpgradeAttachment('Trigger', '', "MagAttachments.Meshes.SM_MagTriggerB", "", 'SAW_MG');
}

static function AddSAWReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_BattleRiflePack.Meshes.SM_ConvSAW_MagC", "", 'SAW_CV', , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_BattleRiflePack.Meshes.SM_ConvSAW_MagD", "", 'SAW_CV', , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "BRMeshPack.Meshes.SM_SAW_CV_MagD", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_ETCSAW.SkeletalMeshes.SM_X1SAW_MagB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "MagCannon.Meshes.SM_MagCannon_MagC", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagCannon_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "MagCannon.Meshes.SM_MagCannon_MagD", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagCannon_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_BattleRiflePack.Meshes.LW_CoilSAW_MagC", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilCannon_MagC", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "RM_BattleRiflePack.Meshes.LW_CoilSAW_MagD", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilCannon_MagD", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilCannon_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('AutoLoader', 'UIPawnLocation_WeaponUpgrade_Cannon_Mag', "BeamCannon.Meshes.SM_BeamCannon_MagC", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_AutoLoader", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamCannon_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddSAWMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSMG_StockB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockB", "", 'SAW_CV', , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_Shotgun_Stock', "MagShotgun.Meshes.SM_MagShotgun_StockB", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagShotgun_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	Template.AddUpgradeAttachment('HeatSink', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatsinkB", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_HeatsinkB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "ConvAttachments.Meshes.SM_ConvCrossbar", "", 'SAW_CV', , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_CrossbarA", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "MagAttachments.Meshes.SM_MagCrossbar", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_Crossbar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
}

static function AddSAWFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW SAWPack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'SAW_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_Suppressor", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'SAW_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'SAW_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'SAW_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'SAW_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'SAW_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}

