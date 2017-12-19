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

	// Model
	Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";
	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

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
	Template.GameArchetype = "LWCannon_LS.Archetype.WP_Cannon_LS";
	Template.AddDefaultAttachment('Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWCannon_LS.Meshes.SK_LaserCannon_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWCannon_LS.Meshes.SK_LaserCannon_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "LWAttachments_LS.Meshes.SK_Laser_Flashlight", , );

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
	Template.GameArchetype = "WP_Cannon_MG.WP_Cannon_MG";
	Template.AddDefaultAttachment('Mag', "MagCannon.Meshes.SM_MagCannon_MagA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagA");
	Template.AddDefaultAttachment('Reargrip',   "MagCannon.Meshes.SM_MagCannon_ReargripA");
	Template.AddDefaultAttachment('Foregrip', "MagCannon.Meshes.SM_MagCannon_StockA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_StockA");
	Template.AddDefaultAttachment('Trigger', "MagCannon.Meshes.SM_MagCannon_TriggerA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_TriggerA");
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
	Template.GameArchetype = "LWCannon_CG.Archetypes.WP_Cannon_CG";
	Template.AddDefaultAttachment('Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWCannon_CG.Meshes.LW_CoilCannon_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_StockA");
	Template.AddDefaultAttachment('StockSupport', "LWCannon_CG.Meshes.LW_CoilCannon_StockSupportA");
	Template.AddDefaultAttachment('Reargrip', "LWCannon_CG.Meshes.LW_CoilCannon_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

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
	Template.GameArchetype = "WP_Cannon_BM.WP_Cannon_BM";
	Template.AddDefaultAttachment('Mag', "BeamCannon.Meshes.SM_BeamCannon_MagA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_MagA");
	Template.AddDefaultAttachment('Core', "BeamCannon.Meshes.SM_BeamCannon_CoreA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_CoreA");
	Template.AddDefaultAttachment('Core_Center',"BeamCannon.Meshes.SM_BeamCannon_CoreA_Center");
	Template.AddDefaultAttachment('HeatSink', "BeamCannon.Meshes.SM_BeamCannon_HeatSinkA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_HeatsinkA");
	Template.AddDefaultAttachment('Suppressor', "BeamCannon.Meshes.SM_BeamCannon_SuppressorA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_SupressorA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	// Building info
	Template.CreatorTemplateName = 'SAW_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.SAWMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}