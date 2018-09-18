class X2Item_LongWar_Cannon extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_Cannon);

var config array<WeaponDamageValue> Cannon_Damage;
var config array<int> Cannon_Aim;
var config array<int> Cannon_CritChance;
var config array<int> Cannon_ClipSize;
var config array<int> Cannon_SoundRange;
var config array<int> Cannon_EnvironmentDamage;
var config array<int> Cannon_SellValue;
var config array<int> Cannon_UpgradeSlots;
var config array<int> Cannon_SupplyCost;
var config array<int> Cannon_AlloyCost;
var config array<int> Cannon_EleriumCost;
var config array<int> Cannon_Engineering;
var config array<name> Cannon_RequiredTech;
var config array<string> Cannon_ImagePath;
var config array<int> Cannon_Mobility;

var config array<int> CANNON_CONV_RANGE;
var config array<int> CANNON_LASER_RANGE;
var config array<int> CANNON_MAGN_RANGE;
var config array<int> CANNON_COIL_RANGE;
var config array<int> CANNON_BEAM_RANGE;

var name CannonConv;
var name CannonLaser;
var name CannonMagn;
var name CannonCoil;
var name CannonBeam;

var config array<name> CommonAbilities;
var config array<name> BallisticAbilities;
var config array<name> LaserAbilities;
var config array<name> MagneticAbilities;
var config array<name> CoilgunAbilities;
var config array<name> PlasmaAbilities;

var config bool RemoveStandardShot;
var config bool RemoveOverwatch;
var config bool RemoveReload;

defaultproperties
{
	CannonConv = "Cannon_CV"
	CannonLaser = "Cannon_LS"
	CannonMagn = "Cannon_MG"
	CannonCoil = "Cannon_CG"
	CannonBeam = "Cannon_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_Cannon_Conv(default.CannonConv));
	Weapons.AddItem(Create_Cannon_Laser(default.CannonLaser));
	Weapons.AddItem(Create_Cannon_Magn(default.CannonMagn));
	Weapons.AddItem(Create_Cannon_Coil(default.CannonCoil));
	Weapons.AddItem(Create_Cannon_Beam(default.CannonBeam));
	return Weapons;
}

static function Create_Cannon_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

	//Default Settings
	Template.WeaponCat = 'cannon';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.strImage = "img:///" $ default.Cannon_ImagePath[tier];
	Template.bIsLargeWeapon = true;
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	
	if(!default.RemoveStandardShot)
	{
		Template.Abilities.AddItem('StandardShot');
	}
	if(!default.RemoveOverwatch)
	{
		Template.Abilities.AddItem('Overwatch');
	}
	if(!default.RemoveReload)
	{
		Template.Abilities.AddItem('Reload');
	}
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('HotLoadAmmo');

	foreach default.CommonAbilities(Ability)
	{
		Template.Abilities.AddItem(Ability);
	}
	
	if(default.Cannon_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.Cannon_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Cannon_Mobility[tier]);
	}
	if(default.Cannon_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.Cannon_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Cannon_Mobility[tier]);
	}

	//Stats
	Template.BaseDamage = default.Cannon_Damage[tier];
	Template.Aim = default.Cannon_Aim[tier];
	Template.CritChance = default.Cannon_CritChance[tier];
	Template.iClipSize = default.Cannon_ClipSize[tier];
	Template.iSoundRange = default.Cannon_SoundRange[tier];
	Template.iEnvironmentDamage = default.Cannon_EnvironmentDamage[tier];
	Template.TradingPostValue = default.Cannon_SellValue[tier];
	Template.NumUpgradeSlots = default.Cannon_UpgradeSlots[tier];
}

static function X2DataTemplate Create_Cannon_Conv(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 0);
	Template.RangeAccuracy = default.CANNON_CONV_RANGE;

	// Model
	Template.GameArchetype = "WP_Cannon_CV.WP_Cannon_CV";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	// Building info
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_Cannon_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 1);
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
		Template.CreatorTemplateName = 'Cannon_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Cannon_RequiredTech[Template.Tier],
			default.Cannon_SupplyCost[Template.Tier], default.Cannon_AlloyCost[Template.Tier], 
			default.Cannon_EleriumCost[Template.Tier], default.Cannon_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Cannon_Magn(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 2);
	Template.RangeAccuracy = default.CANNON_MAGN_RANGE;

	// Model
	Template.GameArchetype = "WP_Cannon_MG.WP_Cannon_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', "MagCannon.Meshes.SM_MagCannon_MagA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_MagA");
	Template.AddDefaultAttachment('Reargrip',   "MagCannon.Meshes.SM_MagCannon_ReargripA");
	Template.AddDefaultAttachment('Foregrip', "MagCannon.Meshes.SM_MagCannon_StockA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_StockA");
	Template.AddDefaultAttachment('Trigger', "MagCannon.Meshes.SM_MagCannon_TriggerA", , "img:///UILibrary_Common.UI_MagCannon.MagCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Cannon_MG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_LS'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Cannon_RequiredTech[Template.Tier],
		default.Cannon_SupplyCost[Template.Tier], default.Cannon_AlloyCost[Template.Tier], 
		default.Cannon_EleriumCost[Template.Tier], default.Cannon_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Cannon_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 3);
	Template.RangeAccuracy = default.CANNON_COIL_RANGE;

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
		Template.CreatorTemplateName = 'Cannon_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Cannon_RequiredTech[Template.Tier],
			default.Cannon_SupplyCost[Template.Tier], default.Cannon_AlloyCost[Template.Tier], 
			default.Cannon_EleriumCost[Template.Tier], default.Cannon_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Cannon_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 4);
	Template.RangeAccuracy = default.CANNON_BEAM_RANGE;

	// Model
	Template.GameArchetype = "WP_Cannon_BM.WP_Cannon_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', "BeamCannon.Meshes.SM_BeamCannon_MagA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_MagA");
	Template.AddDefaultAttachment('Core', "BeamCannon.Meshes.SM_BeamCannon_CoreA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_CoreA");
	Template.AddDefaultAttachment('Core_Center',"BeamCannon.Meshes.SM_BeamCannon_CoreA_Center");
	Template.AddDefaultAttachment('HeatSink', "BeamCannon.Meshes.SM_BeamCannon_HeatSinkA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_HeatsinkA");
	Template.AddDefaultAttachment('Suppressor', "BeamCannon.Meshes.SM_BeamCannon_SuppressorA", , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_SupressorA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Cannon_BM_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_CG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Cannon_RequiredTech[Template.Tier],
		default.Cannon_SupplyCost[Template.Tier], default.Cannon_AlloyCost[Template.Tier], 
		default.Cannon_EleriumCost[Template.Tier], default.Cannon_Engineering[Template.Tier]);
	}

	return Template;
}
