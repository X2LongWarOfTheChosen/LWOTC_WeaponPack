class X2Item_LongWar_BattleRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_BattleRifle);

var config array<WeaponDamageValue> BattleRifle_Damage;
var config array<int> BattleRifle_Aim;
var config array<int> BattleRifle_CritChance;
var config array<int> BattleRifle_ClipSize;
var config array<int> BattleRifle_SoundRange;
var config array<int> BattleRifle_EnvironmentDamage;
var config array<int> BattleRifle_SellValue;
var config array<int> BattleRifle_UpgradeSlots;
var config array<int> BattleRifle_SupplyCost;
var config array<int> BattleRifle_AlloyCost;
var config array<int> BattleRifle_EleriumCost;
var config array<int> BattleRifle_Engineering;
var config array<name> BattleRifle_RequiredTech;
var config array<string> BattleRifle_ImagePath;

var name BattleRifleConventional;
var name BattleRifleLaser;
var name BattleRifleMagnetic;
var name BattleRifleCoil;
var name BattleRifleBeam;

defaultproperties
{
	BattleRifleConventional = "BattleRifle_CV"
	BattleRifleLaser = "BattleRifle_LS"
	BattleRifleMagnetic = "BattleRifle_MG"
	BattleRifleCoil = "BattleRifle_CG"
	BattleRifleBeam = "BattleRifle_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_BattleRifle_Conventional(default.BattleRifleConventional));
	Weapons.AddItem(Create_BattleRifle_Laser(default.BattleRifleLaser));
	Weapons.AddItem(Create_BattleRifle_Magnetic(default.BattleRifleMagnetic));
	Weapons.AddItem(Create_BattleRifle_Coil(default.BattleRifleCoil));
	Weapons.AddItem(Create_BattleRifle_Beam(default.BattleRifleBeam));
	return Weapons;
}

static function Create_BattleRifle_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.BattleRifle_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem(class'X2Ability_BattleRifleAbilities'.default.BattleRifleStatBonusAbilityName);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_BattleRifleAbilities'.default.BattleRifle_MobilityBonus);

	//Stats
	Template.BaseDamage = default.BattleRifle_Damage[tier];
	Template.Aim = default.BattleRifle_Aim[tier];
	Template.CritChance = default.BattleRifle_CritChance[tier];
	Template.iClipSize = default.BattleRifle_ClipSize[tier];
	Template.iSoundRange = default.BattleRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.BattleRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.BattleRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.BattleRifle_UpgradeSlots[tier];
}

static function X2DataTemplate Create_BattleRifle_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_BattleRifle_Template(Template, 0);
	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_BR_CV";
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_BRPack.Attach.BR_CV_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_CV_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvSniper.Meshes.SM_ConvSniper_StockA", , "img:///UILibrary_BRPack.Attach.BR_CV_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	// Building info
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_BattleRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_BattleRifle_Template(Template, 1);
	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_BRPack.Attach.BR_LS_OpticA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'BattleRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.BattleRifleConventional; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.BattleRifle_RequiredTech[Template.Tier], 
			default.BattleRifle_SupplyCost[Template.Tier], default.BattleRifle_AlloyCost[Template.Tier], 
			default.BattleRifle_EleriumCost[Template.Tier], default.BattleRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_BattleRifle_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_BattleRifle_Template(Template, 2);
	Template.RangeAccuracy = default.MEDIUM_MAGNETIC_RANGE;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_BR_MG";
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_MG_OpticA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagShotgun.Meshes.SM_MagShotgun_StockA", , "img:///UILibrary_BRPack.Attach.BR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	Template.CreatorTemplateName = 'BR_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.BattleRifleConventional; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate Create_BattleRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_BattleRifle_Template(Template, 3);
	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;

	// Model
	Template.GameArchetype = "RM_BattleRiflePack.Archetypes.WP_BattleRifle_CG";
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'BattleRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.BattleRifleMagnetic; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.BattleRifle_RequiredTech[Template.Tier], 
			default.BattleRifle_SupplyCost[Template.Tier], default.BattleRifle_AlloyCost[Template.Tier], 
			default.BattleRifle_EleriumCost[Template.Tier], default.BattleRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_BattleRifle_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_BattleRifle_Template(Template, 4);
	Template.RangeAccuracy = default.MEDIUM_BEAM_RANGE;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_BR_BM";
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_BM_OpticA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.CreatorTemplateName = 'BR_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.BattleRifleMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}