class X2Item_LongWar_SAW extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_SAW);

var config array<WeaponDamageValue> SAW_Damage;
var config array<int> SAW_Aim;
var config array<int> SAW_CritChance;
var config array<int> SAW_ClipSize;
var config array<int> SAW_SoundRange;
var config array<int> SAW_EnvironmentDamage;
var config array<int> SAW_SellValue;
var config array<int> SAW_UpgradeSlots;
var config array<int> SAW_SupplyCost;
var config array<int> SAW_AlloyCost;
var config array<int> SAW_EleriumCost;
var config array<int> SAW_Engineering;
var config array<name> SAW_RequiredTech;
var config array<string> SAW_ImagePath;

var name SAWConventional;
var name SAWLaser;
var name SAWMagnetic;
var name SAWCoil;
var name SAWBeam;

defaultproperties
{
	SAWConventional = "SAW_CV"
	SAWLaser = "SAW_LS"
	SAWMagnetic = "SAW_MG"
	SAWCoil = "SAW_CG"
	SAWBeam = "SAW_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_SAW_Conventional(default.SAWConventional));
	Weapons.AddItem(Create_SAW_Laser(default.SAWLaser));
	Weapons.AddItem(Create_SAW_Magnetic(default.SAWMagnetic));
	Weapons.AddItem(Create_SAW_Coil(default.SAWCoil));
	Weapons.AddItem(Create_SAW_Beam(default.SAWBeam));
	return Weapons;
}

static function Create_SAW_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'cannon';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.strImage = "img:///" $ default.SAW_ImagePath[tier];
	Template.bIsLargeWeapon = true;
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem(class'X2Ability_SAWAbilities'.default.SawBonusAbility);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SAWAbilities'.default.SAW_Mobility_Bonus);

	//Stats
	Template.BaseDamage = default.SAW_Damage[tier];
	Template.Aim = default.SAW_Aim[tier];
	Template.CritChance = default.SAW_CritChance[tier];
	Template.iClipSize = default.SAW_ClipSize[tier];
	Template.iSoundRange = default.SAW_SoundRange[tier];
	Template.iEnvironmentDamage = default.SAW_EnvironmentDamage[tier];
	Template.TradingPostValue = default.SAW_SellValue[tier];
	Template.NumUpgradeSlots = default.SAW_UpgradeSlots[tier];
}

static function X2DataTemplate Create_SAW_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SAW_Template(Template, 0);
	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.GameArchetype = "BRMeshPack.Archetypes.WP_AR_CV_Long";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvSniper.Meshes.SM_ConvSniper_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvSniper.Meshes.SM_ConvSniper_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	// Model
	//Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";
	//Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
	//Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
	//Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
	//Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
	//Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
	//Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	//Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_SAW_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SAW_Template(Template, 1);
	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;
	
	// Model
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SAW_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.SAWConventional; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SAW_RequiredTech[Template.Tier],
			default.SAW_SupplyCost[Template.Tier], default.SAW_AlloyCost[Template.Tier], 
			default.SAW_EleriumCost[Template.Tier], default.SAW_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_SAW_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SAW_Template(Template, 2);
	Template.RangeAccuracy = default.MEDIUM_MAGNETIC_RANGE;

	// Model
	Template.GameArchetype = "RM_BattleRiflePack.WP_SAW_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagCannon.Meshes.SM_MagCannon_MagA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagShotgun.Meshes.SM_MagShotgun_StockA", , "img:///UILibrary_BRPack.Attach.BR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	Template.CreatorTemplateName = 'SAW_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.SAWConventional; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate Create_SAW_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SAW_Template(Template, 3);
	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;

	// Model
	Template.GameArchetype = "RM_BattleRiflePack.Archetypes.WP_SAW_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "RM_BattleRiflePack.Meshes.LW_CoilSAW_MagA", ,  "img:///UILibrary_LW_Overhaul.InventoryArt.CoilCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA"); 
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA"); 
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SAW_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.SAWMagnetic; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SAW_RequiredTech[Template.Tier],
			default.SAW_SupplyCost[Template.Tier], default.SAW_AlloyCost[Template.Tier], 
			default.SAW_EleriumCost[Template.Tier], default.SAW_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_SAW_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SAW_Template(Template, 4);
	Template.RangeAccuracy = default.MEDIUM_BEAM_RANGE;

	// Model
	Template.GameArchetype = "RM_BattleRiflePack.WP_SAW_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamCannon.Meshes.SM_BeamCannon_MagA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_MagA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	// Building info
	Template.CreatorTemplateName = 'SAW_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.SAWMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}
