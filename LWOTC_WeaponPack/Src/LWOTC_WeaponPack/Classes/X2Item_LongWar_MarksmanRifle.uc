class X2Item_LongWar_MarksmanRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_MarksmanRifle);

var config array<WeaponDamageValue> MarksmanRifle_Damage;
var config array<int> MarksmanRifle_Aim;
var config array<int> MarksmanRifle_CritChance;
var config array<int> MarksmanRifle_ClipSize;
var config array<int> MarksmanRifle_SoundRange;
var config array<int> MarksmanRifle_EnvironmentDamage;
var config array<int> MarksmanRifle_SellValue;
var config array<int> MarksmanRifle_UpgradeSlots;
var config array<int> MarksmanRifle_SupplyCost;
var config array<int> MarksmanRifle_AlloyCost;
var config array<int> MarksmanRifle_EleriumCost;
var config array<int> MarksmanRifle_Engineering;
var config array<name> MarksmanRifle_RequiredTech;
var config array<string> MarksmanRifle_ImagePath;

var name MarksmanRifleConventional;
var name MarksmanRifleLaser;
var name MarksmanRifleMagnetic;
var name MarksmanRifleCoil;
var name MarksmanRifleBeam;

defaultproperties
{
	MarksmanRifleConventional = "MarksmanRifle_CV"
	MarksmanRifleLaser = "MarksmanRifle_LS"
	MarksmanRifleMagnetic = "MarksmanRifle_MG"
	MarksmanRifleCoil = "MarksmanRifle_CG"
	MarksmanRifleBeam = "MarksmanRifle_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_MarksmanRifle_Conventional(default.MarksmanRifleConventional));
	Weapons.AddItem(Create_MarksmanRifle_Laser(default.MarksmanRifleLaser));
	Weapons.AddItem(Create_MarksmanRifle_Magnetic(default.MarksmanRifleMagnetic));
	Weapons.AddItem(Create_MarksmanRifle_Coil(default.MarksmanRifleCoil));
	Weapons.AddItem(Create_MarksmanRifle_Beam(default.MarksmanRifleBeam));
	return Weapons;
}

static function Create_MarksmanRifle_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'sniper_rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.MarksmanRifle_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	//Stats
	Template.BaseDamage = default.MarksmanRifle_Damage[tier];
	Template.Aim = default.MarksmanRifle_Aim[tier];
	Template.CritChance = default.MarksmanRifle_CritChance[tier];
	Template.iClipSize = default.MarksmanRifle_ClipSize[tier];
	Template.iSoundRange = default.MarksmanRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.MarksmanRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.MarksmanRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.MarksmanRifle_UpgradeSlots[tier];
}

static function X2DataTemplate Create_MarksmanRifle_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MarksmanRifle_Template(Template, 0);
	Template.RangeAccuracy = default.MEDLONG_CONVENTIONAL_RANGE;
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_MR_CV";
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_BRPack.Attach.BR_CV_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_CV_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockA", , "img:///UILibrary_BRPack.Attach.MR_CV_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MarksmanRifle_Template(Template, 1);
	Template.RangeAccuracy = default.MEDLONG_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWSniperRifle_LS.Archetype.WP_SniperRifle_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_BRPack.Attach.BR_LS_OpticA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'MarksmanRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.MarksmanRifleConventional; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.MarksmanRifle_RequiredTech[Template.Tier],
			default.MarksmanRifle_SupplyCost[Template.Tier], default.MarksmanRifle_AlloyCost[Template.Tier], 
			default.MarksmanRifle_EleriumCost[Template.Tier], default.MarksmanRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MarksmanRifle_Template(Template, 2);
	Template.RangeAccuracy = default.MEDLONG_MAGNETIC_RANGE;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_MR_MG";
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_MG_OpticA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagSniper.Meshes.SM_MagSniper_StockA", , "img:///UILibrary_BRPack.Attach.MR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.CreatorTemplateName = 'BR_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.MarksmanRifleConventional; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MarksmanRifle_Template(Template, 3);
	Template.RangeAccuracy = default.MEDLONG_COIL_RANGE;

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
		Template.CreatorTemplateName = 'MarksmanRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.MarksmanRifleMagnetic; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.MarksmanRifle_RequiredTech[Template.Tier],
			default.MarksmanRifle_SupplyCost[Template.Tier], default.MarksmanRifle_AlloyCost[Template.Tier], 
			default.MarksmanRifle_EleriumCost[Template.Tier], default.MarksmanRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MarksmanRifle_Template(Template, 4);
	Template.RangeAccuracy = default.MEDLONG_BEAM_RANGE;

	// Model
	Template.GameArchetype = "BRPack.Archetypes.WP_BR_BM";
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_BM_OpticA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.CreatorTemplateName = 'MR_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.MarksmanRifleMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}