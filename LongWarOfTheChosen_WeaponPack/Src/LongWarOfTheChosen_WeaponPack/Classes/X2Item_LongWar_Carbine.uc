class X2Item_LongWar_Carbine extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_Carbine);

var config bool Create_Carbines;
var config array<WeaponDamageValue> Carbine_Damage;
var config array<int> Carbine_Aim;
var config array<int> Carbine_CritChance;
var config array<int> Carbine_ClipSize;
var config array<int> Carbine_SoundRange;
var config array<int> Carbine_EnvironmentDamage;
var config array<int> Carbine_SellValue;
var config array<int> Carbine_UpgradeSlots;
var config array<int> Carbine_SupplyCost;
var config array<int> Carbine_AlloyCost;
var config array<int> Carbine_EleriumCost;
var config array<int> Carbine_Engineering;
var config array<name> Carbine_RequiredTech;
var config array<string> Carbine_ImagePath;

var name CarbineConventional;
var name CarbineLaser;
var name CarbineMagnetic;
var name CarbineCoil;
var name CarbineBeam;

defaultproperties
{
	CarbineConventional = "Carbine_CV"
	CarbineLaser = "Carbine_LS"
	CarbineMagnetic = "Carbine_MG"
	CarbineCoil = "Carbine_CG"
	CarbineBeam = "Carbine_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	if(default.Create_Carbines)
	{
		Weapons.AddItem(Create_Carbine_Conventional(default.CarbineConventional));
		Weapons.AddItem(Create_Carbine_Laser(default.CarbineLaser));
		Weapons.AddItem(Create_Carbine_Magnetic(default.CarbineMagnetic));
		Weapons.AddItem(Create_Carbine_Coil(default.CarbineCoil));
		Weapons.AddItem(Create_Carbine_Beam(default.CarbineBeam));
	}
	return Weapons;
}

static function Create_Carbine_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.Carbine_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem(class'X2Ability_CarbineAbilities'.default.CarbineBonusAbility);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_CarbineAbilities'.default.Carbine_Mobility_Bonus);

	//Stats
	Template.BaseDamage = default.Carbine_Damage[tier];
	Template.Aim = default.Carbine_Aim[tier];
	Template.CritChance = default.Carbine_CritChance[tier];
	Template.iClipSize = default.Carbine_ClipSize[tier];
	Template.iSoundRange = default.Carbine_SoundRange[tier];
	Template.iEnvironmentDamage = default.Carbine_EnvironmentDamage[tier];
	Template.TradingPostValue = default.Carbine_SellValue[tier];
	Template.NumUpgradeSlots = default.Carbine_UpgradeSlots[tier];
}

static function X2DataTemplate Create_Carbine_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Carbine_Template(Template, 0);
	Template.RangeAccuracy = default.MIDSHORT_CONVENTIONAL_RANGE;
	Template.fKnockbackDamageAmount = 4.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	// Model
	Template.GameArchetype = "LWSMG_CV.WP_SMG_CV";
	Template.AddDefaultAttachment('Mag', "LWSMG_CV.Meshes.SK_LWConvSMG_MagA", , "img:///UILibrary_SMG.conventional.LWConvSMG_MagA");
	Template.AddDefaultAttachment('Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_OpticA", , "img:///UILibrary_SMG.conventional.LWConvSMG_OpticA");
	Template.AddDefaultAttachment('Stock', "LWSMG_CV.Meshes.SK_LWConvSMG_Stock");  // renamed to just 'Stock' when fixing seaming issues for TTP 52
	Template.AddDefaultAttachment('StockB', "", , "img:///UILibrary_SMG.conventional.LWConvSMG_StockA");  // attach image to StockB so it gets replaced with ugprade
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_SMG.conventional.LWConvSMG_TriggerA"); // re-use Assault Rifle trigger
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_Carbine_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Carbine_Template(Template, 1);
	Template.RangeAccuracy = default.MIDSHORT_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWSMG_LS.Archetype.WP_SMG_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_StockA"); // switching to use the shotgun-style stock to differentiate better from rifle
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_ForegripA");
	//Template.AddDefaultAttachment('Optic', "LWSMG_LS.Meshes.SK_LaserSMG_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserSMG__OpticA");  // no default optic
	Template.AddDefaultAttachment('Light', "LWAttachments_LS.Meshes.SK_Laser_Flashlight", , );

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Carbine_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.CarbineConventional; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Carbine_RequiredTech[Template.Tier],
			default.Carbine_SupplyCost[Template.Tier], default.Carbine_AlloyCost[Template.Tier],
			default.Carbine_EleriumCost[Template.Tier], default.Carbine_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Carbine_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Carbine_Template(Template, 2);
	Template.RangeAccuracy = default.MIDSHORT_MAGNETIC_RANGE;

	// Model
	Template.GameArchetype = "LWSMG_MG.WP_SMG_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_MagA");
	Template.AddDefaultAttachment('Optic', "LWSMG_MG.Meshes.SK_LWMagSMG_OpticA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_OpticA");
	//turn off SuppressorA, as it is built in to the base mesh now
	//Template.AddDefaultAttachment('Suppressor', "LWSMG_MG.Meshes.SK_LWMagSMG_SuppressorA"); //, , "img://UILibrary_SMG.magnetic.LWMagSMG_SuppressorA"); // included with base
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "LWSMG_MG.Meshes.SK_MagFlashLight");  // alternative -- use mag flashlight, unused in base-game, converted to skeletal mesh

	Template.CreatorTemplateName = 'Carbine_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.CarbineConventional; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate Create_Carbine_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Carbine_Template(Template, 3);
	Template.RangeAccuracy = default.MIDSHORT_COIL_RANGE;

	// Model
	Template.GameArchetype = "LWSMG_CG.Archetypes.WP_SMG_CG";
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Carbine_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.CarbineMagnetic; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Carbine_RequiredTech[Template.Tier],
			default.Carbine_SupplyCost[Template.Tier], default.Carbine_AlloyCost[Template.Tier],
			default.Carbine_EleriumCost[Template.Tier], default.Carbine_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Carbine_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Carbine_Template(Template, 4);
	Template.RangeAccuracy = default.MIDSHORT_BEAM_RANGE;

	// Model
	Template.GameArchetype = "LWSMG_BM.WP_SMG_BM";
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_SMG.Beam.LWBeamSMG_MagA");
	//Template.AddDefaultAttachment('Suppressor', "LWSMG_BM.Meshes.SM_LWBeamSMG_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "LWSMG_BM.Meshes.SK_LWBeamSMG_CoreB", , "img:///UILibrary_SMG.Beam.LWBeamSMG_CoreA");
	Template.AddDefaultAttachment('HeatSink', "LWSMG_BM.Meshes.SK_LWBeamSMG_HeatsinkA", , "img:///UILibrary_SMG.Beam.LWBeamSMG_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.CreatorTemplateName = 'Carbine_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.CarbineMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}
