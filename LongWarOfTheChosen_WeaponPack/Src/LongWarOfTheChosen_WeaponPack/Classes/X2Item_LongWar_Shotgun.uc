class X2Item_LongWar_Shotgun extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_Shotgun);

var config array<WeaponDamageValue> Shotgun_Damage;
var config array<int> Shotgun_Aim;
var config array<int> Shotgun_CritChance;
var config array<int> Shotgun_ClipSize;
var config array<int> Shotgun_SoundRange;
var config array<int> Shotgun_EnvironmentDamage;
var config array<int> Shotgun_SellValue;
var config array<int> Shotgun_UpgradeSlots;
var config array<int> Shotgun_SupplyCost;
var config array<int> Shotgun_AlloyCost;
var config array<int> Shotgun_EleriumCost;
var config array<int> Shotgun_Engineering;
var config array<name> Shotgun_RequiredTech;
var config array<string> Shotgun_ImagePath;

var name ShotgunLaser;
var name ShotgunCoil;

defaultproperties
{
	ShotgunLaser = "Shotgun_LS"
	ShotgunCoil = "Shotgun_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_Shotgun_Laser(default.ShotgunLaser));
	Weapons.AddItem(Create_Shotgun_Coil(default.ShotgunCoil));
	return Weapons;
}

static function Create_Shotgun_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'shotgun';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
	Template.strImage = "img:///" $ default.Shotgun_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	//Stats
	Template.BaseDamage = default.Shotgun_Damage[tier];
	Template.Aim = default.Shotgun_Aim[tier];
	Template.CritChance = default.Shotgun_CritChance[tier];
	Template.iClipSize = default.Shotgun_ClipSize[tier];
	Template.iSoundRange = default.Shotgun_SoundRange[tier];
	Template.iEnvironmentDamage = default.Shotgun_EnvironmentDamage[tier];
	Template.TradingPostValue = default.Shotgun_SellValue[tier];
	Template.NumUpgradeSlots = default.Shotgun_UpgradeSlots[tier];
}

static function X2DataTemplate Create_Shotgun_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Shotgun_Template(Template, 1);
	Template.RangeAccuracy = default.SHORT_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWShotgun_LS.Archetype.WP_Shotgun_LS";
	Template.AddDefaultAttachment('Mag', "LWShotgun_LS.Meshes.SK_LaserShotgun_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_ForegripA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Shotgun_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Shotgun_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Shotgun_RequiredTech[Template.Tier],
			default.Shotgun_SupplyCost[Template.Tier], default.Shotgun_AlloyCost[Template.Tier], 
			default.Shotgun_EleriumCost[Template.Tier], default.Shotgun_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Shotgun_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Shotgun_Template(Template, 1);
	Template.RangeAccuracy = default.SHORT_COIL_RANGE;

	// Model
	Template.GameArchetype = "LWShotgun_CG.Archetypes.WP_Shotgun_CG";
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Shotgun_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Shotgun_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Shotgun_RequiredTech[Template.Tier],
			default.Shotgun_SupplyCost[Template.Tier], default.Shotgun_AlloyCost[Template.Tier], 
			default.Shotgun_EleriumCost[Template.Tier], default.Shotgun_Engineering[Template.Tier]);
	}

	return Template;
}