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

var name CannonLaser;
var name CannonCoil;

defaultproperties
{
	CannonLaser = "Cannon_LS"
	CannonCoil = "Cannon_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_Cannon_Laser(default.CannonLaser));
	Weapons.AddItem(Create_Cannon_Coil(default.CannonCoil));
	return Weapons;
}

static function Create_Cannon_Template(out X2WeaponTemplate Template, int tier)
{
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
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('LWotC_MountLMG');
	Template.Abilities.AddItem('LWotC_CannonAreaSuppression');
	Template.Abilities.AddItem('LWotC_CannonFullReload');

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

static function X2DataTemplate Create_Cannon_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Cannon_Template(Template, 3);
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