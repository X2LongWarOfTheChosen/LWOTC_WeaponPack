class X2Item_LongWar_AssaultRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_AssaultRifle);

var config array<WeaponDamageValue> AssaultRifle_Damage;
var config array<int> AssaultRifle_Aim;
var config array<int> AssaultRifle_CritChance;
var config array<int> AssaultRifle_ClipSize;
var config array<int> AssaultRifle_SoundRange;
var config array<int> AssaultRifle_EnvironmentDamage;
var config array<int> AssaultRifle_SellValue;
var config array<int> AssaultRifle_UpgradeSlots;
var config array<int> AssaultRifle_SupplyCost;
var config array<int> AssaultRifle_AlloyCost;
var config array<int> AssaultRifle_EleriumCost;
var config array<int> AssaultRifle_Engineering;
var config array<name> AssaultRifle_RequiredTech;
var config array<string> AssaultRifle_ImagePath;

var name AssaultRifleLaser;
var name AssaultRifleCoil;

defaultproperties
{
	AssaultRifleLaser = "AssaultRifle_LS"
	AssaultRifleCoil = "AssaultRifle_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_AssaultRifle_Laser(default.AssaultRifleLaser));
	Weapons.AddItem(Create_AssaultRifle_Coil(default.AssaultRifleCoil));
	return Weapons;
}

static function Create_AssaultRifle_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.AssaultRifle_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	//Stats
	Template.BaseDamage = default.AssaultRifle_Damage[tier];
	Template.Aim = default.AssaultRifle_Aim[tier];
	Template.CritChance = default.AssaultRifle_CritChance[tier];
	Template.iClipSize = default.AssaultRifle_ClipSize[tier];
	Template.iSoundRange = default.AssaultRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.AssaultRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.AssaultRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.AssaultRifle_UpgradeSlots[tier];
}

static function X2DataTemplate Create_AssaultRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 1);
	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	//Template.AddDefaultAttachment('Optic', "LWRifle_LS.Meshes.SK_LaserRifle_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserRifle__OpticA"); // no default optic

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
			default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
			default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_AssaultRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 3);
	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;

	// Model
	Template.GameArchetype = "LWAssaultRifle_CG.Archetypes.WP_AssaultRifle_CG";
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
			default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
			default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}