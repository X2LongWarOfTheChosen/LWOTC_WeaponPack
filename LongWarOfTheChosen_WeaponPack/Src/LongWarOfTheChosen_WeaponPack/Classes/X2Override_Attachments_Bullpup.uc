class X2Override_Attachments_Bullpup extends X2Override_LongWar;

//add MR to the DefaultUpgrades Templates so that upgrades work with new weapon
//this doesn't make the upgrade available, it merely configures the art
static function UpdateBullpupAttachmentTemplates(X2ItemTemplateManager ItemTemplateManager)
{
	/* AddBullpupCritUpgrade(ItemTemplateManager, 'CritUpgrade_Bsc');
	AddBullpupCritUpgrade(ItemTemplateManager, 'CritUpgrade_Adv');
	AddBullpupCritUpgrade(ItemTemplateManager, 'CritUpgrade_Sup');

	AddBullpupAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Bsc');
	AddBullpupAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Adv');
	AddBullpupAimBonusUpgrade(ItemTemplateManager, 'AimUpgrade_Sup');

	AddBullpupClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Bsc');
	AddBullpupClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Adv');
	AddBullpupClipSizeBonusUpgrade(ItemTemplateManager, 'ClipSizeUpgrade_Sup');

	AddBullpupFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Bsc');
	AddBullpupFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Adv');
	AddBullpupFreeFireBonusUpgrade(ItemTemplateManager, 'FreeFireUpgrade_Sup');

	AddBullpupReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Bsc');
	AddBullpupReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Adv');
	AddBullpupReloadUpgrade(ItemTemplateManager, 'ReloadUpgrade_Sup');

	AddBullpupMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Bsc');
	AddBullpupMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Adv');
	AddBullpupMissDamageUpgrade(ItemTemplateManager, 'MissDamageUpgrade_Sup');

	AddBullpupFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Bsc');
	AddBullpupFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Adv');
	AddBullpupFreeKillUpgrade(ItemTemplateManager, 'FreeKillUpgrade_Sup'); */
}

static function AddBullpupCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticB", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_C", "", 'Bullpup_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticB", "", 'Bullpup_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticB", "", 'Bullpup_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticB", "", 'Bullpup_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddBullpupAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticC", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_B", "", 'Bullpup_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticC", "img:///UILibrary_LW_LaserPack.Inv_LaserSniper_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticC", "", 'Bullpup_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticC", "", 'Bullpup_CG', ,  "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticC", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticC", "", 'Bullpup_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}


static function AddBullpupClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagB", "", 'Bullpup_CG', ,  "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_MagB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagB", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddBullpupFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvReargripB", "", 'Bullpup_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', '', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'Bullpup_CV');
	
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAttachments.Meshes.SM_MagReargripB", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', '', "MagAttachments.Meshes.SM_MagTriggerB", "", 'Bullpup_MG');
	
	Template.AddUpgradeAttachment('Trigger', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'Bullpup_CG', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAccessories_CG.Meshes.LW_Coil_ReargripB", "", 'Bullpup_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_ReargripB", "img://UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgunSniper_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	Template.AddUpgradeAttachment('Core', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreB", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_CoreB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core_Teeth', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_TeethA", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Teeth", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_Teeth_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
}

static function AddBullpupReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagD", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagD", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagC", "", 'Bullpup_CG', ,  "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_MagC", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagD", "", 'Bullpup_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_MagD", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('AutoLoader', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_AutoLoader", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddBullpupMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockB", "", 'Bullpup_CV', , "img:///UILibrary_BRPack.Attach.MR_CV_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "ConvAttachments.Meshes.SM_ConvCrossbar", "", 'Bullpup_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_CrossbarA", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "MagSniper.Meshes.SM_MagSniper_StockB", "", 'Bullpup_MG', , "img:///UILibrary_BRPack.Attach.MR_MG_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "MagAttachments.Meshes.SM_MagCrossbar", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Crossbar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", "", 'Bullpup_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSMG_StockB", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMGShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	Template.AddUpgradeAttachment('HeatSink', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatsinkB", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_HeatsinkB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
}

static function AddBullpupFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LW Bullpup : Failed to find upgrade template " $ string(TemplateName));
		return;
	}
	
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'Bullpup_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'Bullpup_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'Bullpup_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'Bullpup_CG', , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_Suppressor", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'Bullpup_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}
