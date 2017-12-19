class X2Item_LongWar_SparkRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_SparkRifle);

var config array<WeaponDamageValue> SparkRifle_Damage;
var config array<int> SparkRifle_Aim;
var config array<int> SparkRifle_CritChance;
var config array<int> SparkRifle_ClipSize;
var config array<int> SparkRifle_SoundRange;
var config array<int> SparkRifle_EnvironmentDamage;
var config array<int> SparkRifle_SellValue;
var config array<int> SparkRifle_UpgradeSlots;
var config array<int> SparkRifle_SupplyCost;
var config array<int> SparkRifle_AlloyCost;
var config array<int> SparkRifle_EleriumCost;
var config array<int> SparkRifle_Engineering;
var config array<name> SparkRifle_RequiredTech;
var config array<string> SparkRifle_ImagePath;

var name SparkRifleLaser;
var name SparkRifleCoil;

defaultproperties
{
	SparkRifleLaser = "SparkRifle_LS"
	SparkRifleCoil = "SparkRifle_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_SparkRifle_Laser(default.SparkRifleLaser));
	Weapons.AddItem(Create_SparkRifle_Coil(default.SparkRifleCoil));
	return Weapons;
}

static function Create_SparkRifle_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'sparkrifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.SparkRifle_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	//Stats
	Template.BaseDamage = default.SparkRifle_Damage[tier];
	Template.Aim = default.SparkRifle_Aim[tier];
	Template.CritChance = default.SparkRifle_CritChance[tier];
	Template.iClipSize = default.SparkRifle_ClipSize[tier];
	Template.iSoundRange = default.SparkRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.SparkRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.SparkRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.SparkRifle_UpgradeSlots[tier];
}

static function X2DataTemplate Create_SparkRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SparkRifle_Template(Template, 1);
	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;

	// Model
	Template.GameArchetype = "DLC_3_WP_SparkRifle_MG.WP_SparkRifle_MG";
	
	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SparkRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SparkRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SparkRifle_RequiredTech[Template.Tier], 
			default.SparkRifle_SupplyCost[Template.Tier], default.SparkRifle_AlloyCost[Template.Tier], 
			default.SparkRifle_EleriumCost[Template.Tier], default.SparkRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_SparkRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SparkRifle_Template(Template, 3);
	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;
	
	// Model
	Template.GameArchetype = "DLC_3_WP_SparkRifle_MG.WP_SparkRifle_MG";

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SparkRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SparkRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SparkRifle_RequiredTech[Template.Tier], 
			default.SparkRifle_SupplyCost[Template.Tier], default.SparkRifle_AlloyCost[Template.Tier], 
			default.SparkRifle_EleriumCost[Template.Tier], default.SparkRifle_Engineering[Template.Tier]);
	}

	return Template;
}