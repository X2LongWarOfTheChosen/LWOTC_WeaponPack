class X2Item_LongWar_SniperRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_SniperRifle);

var config array<WeaponDamageValue> SniperRifle_Damage;
var config array<int> SniperRifle_Aim;
var config array<int> SniperRifle_CritChance;
var config array<int> SniperRifle_ClipSize;
var config array<int> SniperRifle_SoundRange;
var config array<int> SniperRifle_EnvironmentDamage;
var config array<int> SniperRifle_SellValue;
var config array<int> SniperRifle_UpgradeSlots;
var config array<int> SniperRifle_SupplyCost;
var config array<int> SniperRifle_AlloyCost;
var config array<int> SniperRifle_EleriumCost;
var config array<int> SniperRifle_Engineering;
var config array<name> SniperRifle_RequiredTech;
var config array<string> SniperRifle_ImagePath;
var config array<int> SniperRifle_Mobility;

var name SniperRifleLaser;
var name SniperRifleCoil;

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
	SniperRifleLaser = "SniperRifle_LS"
	SniperRifleCoil = "SniperRifle_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_SniperRifle_Laser(default.SniperRifleLaser));
	Weapons.AddItem(Create_SniperRifle_Coil(default.SniperRifleCoil));
	return Weapons;
}

static function Create_SniperRifle_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

	//Default Settings
	Template.WeaponCat = 'sniper_rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.strImage = "img:///" $ default.SniperRifle_ImagePath[tier];
	Assign_Tier_Values(Template);
	Template.iTypicalActionCost = 2;

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
	
	if(default.SniperRifle_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.SniperRifle_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.SniperRifle_Mobility[tier]);
	}
	if(default.SniperRifle_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.SniperRifle_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.SniperRifle_Mobility[tier]);
	}

	//Stats
	Template.BaseDamage = default.SniperRifle_Damage[tier];
	Template.Aim = default.SniperRifle_Aim[tier];
	Template.CritChance = default.SniperRifle_CritChance[tier];
	Template.iClipSize = default.SniperRifle_ClipSize[tier];
	Template.iSoundRange = default.SniperRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.SniperRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.SniperRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.SniperRifle_UpgradeSlots[tier];
}

static function X2DataTemplate Create_SniperRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SniperRifle_Template(Template, 1);
	Template.RangeAccuracy = default.LONG_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWSniperRifle_LS.Archetype.WP_SniperRifle_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_OpticA");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SniperRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SniperRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SniperRifle_RequiredTech[Template.Tier],
			default.SniperRifle_SupplyCost[Template.Tier], default.SniperRifle_AlloyCost[Template.Tier], 
			default.SniperRifle_EleriumCost[Template.Tier], default.SniperRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_SniperRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_SniperRifle_Template(Template, 3);
	Template.RangeAccuracy = default.LONG_COIL_RANGE;

	// Model
	Template.GameArchetype = "LWSniperRifle_CG.Archetypes.WP_SniperRifle_CG";
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_OpticA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_StockB");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'SniperRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SniperRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.SniperRifle_RequiredTech[Template.Tier],
			default.SniperRifle_SupplyCost[Template.Tier], default.SniperRifle_AlloyCost[Template.Tier], 
			default.SniperRifle_EleriumCost[Template.Tier], default.SniperRifle_Engineering[Template.Tier]);
	}

	return Template;
}