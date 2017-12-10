//---------------------------------------------------------------------------------------
//  FILE:    X2Item_LaserWeapons.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Defines weapon templates and updates base-game upgrade templates for Laser Weapons
//
//---------------------------------------------------------------------------------------
class X2Item_LaserWeapons extends X2Item config(LW_WeaponPack);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****

var config WeaponDamageValue ASSAULTRIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue BATTLERIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue SMG_LASER_BASEDAMAGE;
var config WeaponDamageValue LMG_LASER_BASEDAMAGE;
var config WeaponDamageValue SHOTGUN_LASER_BASEDAMAGE;
var config WeaponDamageValue SNIPERRIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue PISTOL_LASER_BASEDAMAGE;
var config WeaponDamageValue BULLPUP_LASER_BASEDAMAGE;
var config WeaponDamageValue VEKTORRIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue SIDEARM_LASER_BASEDAMAGE;
var config WeaponDamageValue SPARKRIFLE_LASER_BASEDAMAGE;

// ***** Core properties and variables for weapons *****
var config int ASSAULTRIFLE_LASER_AIM;
var config int ASSAULTRIFLE_LASER_CRITCHANCE;
var config int ASSAULTRIFLE_LASER_ICLIPSIZE;
var config int ASSAULTRIFLE_LASER_ISOUNDRANGE;
var config int ASSAULTRIFLE_LASER_IENVIRONMENTDAMAGE;
var config int ASSAULTRIFLE_LASER_TRADINGPOSTVALUE;
var config int ASSAULTRIFLE_LASER_IPOINTS;
var config int ASSAULTRIFLE_LASER_UPGRADESLOTS;

var config int BATTLERIFLE_LASER_AIM;
var config int BATTLERIFLE_LASER_CRITCHANCE;
var config int BATTLERIFLE_LASER_ICLIPSIZE;
var config int BATTLERIFLE_LASER_ISOUNDRANGE;
var config int BATTLERIFLE_LASER_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_LASER_TRADINGPOSTVALUE;
var config int BATTLERIFLE_LASER_IPOINTS;
var config int BATTLERIFLE_LASER_UPGRADESLOTS;

var config int SMG_LASER_AIM;
var config int SMG_LASER_CRITCHANCE;
var config int SMG_LASER_ICLIPSIZE;
var config int SMG_LASER_ISOUNDRANGE;
var config int SMG_LASER_IENVIRONMENTDAMAGE;
var config int SMG_LASER_TRADINGPOSTVALUE;
var config int SMG_LASER_IPOINTS;
var config int SMG_LASER_UPGRADESLOTS;

var config int LMG_LASER_AIM;
var config int LMG_LASER_CRITCHANCE;
var config int LMG_LASER_ICLIPSIZE;
var config int LMG_LASER_ISOUNDRANGE;
var config int LMG_LASER_IENVIRONMENTDAMAGE;
var config int LMG_LASER_TRADINGPOSTVALUE;
var config int LMG_LASER_IPOINTS;
var config int LMG_LASER_UPGRADESLOTS;

var config int SHOTGUN_LASER_AIM;
var config int SHOTGUN_LASER_CRITCHANCE;
var config int SHOTGUN_LASER_ICLIPSIZE;
var config int SHOTGUN_LASER_ISOUNDRANGE;
var config int SHOTGUN_LASER_IENVIRONMENTDAMAGE;
var config int SHOTGUN_LASER_TRADINGPOSTVALUE;
var config int SHOTGUN_LASER_IPOINTS;
var config int SHOTGUN_LASER_UPGRADESLOTS;

var config int SNIPERRIFLE_LASER_AIM;
var config int SNIPERRIFLE_LASER_CRITCHANCE;
var config int SNIPERRIFLE_LASER_ICLIPSIZE;
var config int SNIPERRIFLE_LASER_ISOUNDRANGE;
var config int SNIPERRIFLE_LASER_IENVIRONMENTDAMAGE;
var config int SNIPERRIFLE_LASER_TRADINGPOSTVALUE;
var config int SNIPERRIFLE_LASER_IPOINTS;
var config int SNIPERRIFLE_LASER_UPGRADESLOTS;

var config int MARKSMANRIFLE_LASER_AIM;
var config int MARKSMANRIFLE_LASER_CRITCHANCE;
var config int MARKSMANRIFLE_LASER_ICLIPSIZE;
var config int MARKSMANRIFLE_LASER_ISOUNDRANGE;
var config int MARKSMANRIFLE_LASER_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_LASER_TRADINGPOSTVALUE;
var config int MARKSMANRIFLE_LASER_IPOINTS;
var config int MARKSMANRIFLE_LASER_UPGRADESLOTS;

var config int PISTOL_LASER_AIM;
var config int PISTOL_LASER_CRITCHANCE;
var config int PISTOL_LASER_ICLIPSIZE;
var config int PISTOL_LASER_ISOUNDRANGE;
var config int PISTOL_LASER_IENVIRONMENTDAMAGE;
var config int PISTOL_LASER_TRADINGPOSTVALUE;
var config int PISTOL_LASER_IPOINTS;
var config int PISTOL_LASER_UPGRADESLOTS;

var config int BULLPUP_LASER_AIM;
var config int BULLPUP_LASER_CRITCHANCE;
var config int BULLPUP_LASER_ICLIPSIZE;
var config int BULLPUP_LASER_ISOUNDRANGE;
var config int BULLPUP_LASER_IENVIRONMENTDAMAGE;
var config int BULLPUP_LASER_TRADINGPOSTVALUE;
var config int BULLPUP_LASER_IPOINTS;
var config int BULLPUP_LASER_UPGRADESLOTS;

var config int VEKTORRIFLE_LASER_AIM;
var config int VEKTORRIFLE_LASER_CRITCHANCE;
var config int VEKTORRIFLE_LASER_ICLIPSIZE;
var config int VEKTORRIFLE_LASER_ISOUNDRANGE;
var config int VEKTORRIFLE_LASER_IENVIRONMENTDAMAGE;
var config int VEKTORRIFLE_LASER_TRADINGPOSTVALUE;
var config int VEKTORRIFLE_LASER_IPOINTS;
var config int VEKTORRIFLE_LASER_UPGRADESLOTS;

var config int SIDEARM_LASER_AIM;
var config int SIDEARM_LASER_CRITCHANCE;
var config int SIDEARM_LASER_ICLIPSIZE;
var config int SIDEARM_LASER_ISOUNDRANGE;
var config int SIDEARM_LASER_IENVIRONMENTDAMAGE;
var config int SIDEARM_LASER_TRADINGPOSTVALUE;
var config int SIDEARM_LASER_IPOINTS;
var config int SIDEARM_LASER_UPGRADESLOTS;

var config int SPARKRIFLE_LASER_AIM;
var config int SPARKRIFLE_LASER_CRITCHANCE;
var config int SPARKRIFLE_LASER_ICLIPSIZE;
var config int SPARKRIFLE_LASER_ISOUNDRANGE;
var config int SPARKRIFLE_LASER_IENVIRONMENTDAMAGE;
var config int SPARKRIFLE_LASER_TRADINGPOSTVALUE;
var config int SPARKRIFLE_LASER_IPOINTS;
var config int SPARKRIFLE_LASER_UPGRADESLOTS;

var config array<int> SHORT_LASER_RANGE;
var config array<int> MIDSHORT_LASER_RANGE;
var config array<int> MEDIUM_LASER_RANGE;
var config array<int> MEDLONG_LASER_RANGE;
var config array<int> LONG_LASER_RANGE;
var config array<int> VEKTOR_LASER_RANGE;

var config int ASSAULTRIFLE_LS_SUPPLYCOST;
var config int ASSAULTRIFLE_LS_ALLOYCOST;
var config int ASSAULTRIFLE_LS_ELERIUMCOST;

var config int BATTLERIFLE_LS_SUPPLYCOST;
var config int BATTLERIFLE_LS_ALLOYCOST;
var config int BATTLERIFLE_LS_ELERIUMCOST;

var config int SMG_LS_SUPPLYCOST;
var config int SMG_LS_ALLOYCOST;
var config int SMG_LS_ELERIUMCOST;

var config int CANNON_LS_SUPPLYCOST;
var config int CANNON_LS_ALLOYCOST;
var config int CANNON_LS_ELERIUMCOST;

var config int SHOTGUN_LS_SUPPLYCOST;
var config int SHOTGUN_LS_ALLOYCOST;
var config int SHOTGUN_LS_ELERIUMCOST;

var config int SNIPERRIFLE_LS_SUPPLYCOST;
var config int SNIPERRIFLE_LS_ALLOYCOST;
var config int SNIPERRIFLE_LS_ELERIUMCOST;

var config int MARKSMANRIFLE_LS_SUPPLYCOST;
var config int MARKSMANRIFLE_LS_ALLOYCOST;
var config int MARKSMANRIFLE_LS_ELERIUMCOST;

var config int PISTOL_LS_SUPPLYCOST;
var config int PISTOL_LS_ALLOYCOST;
var config int PISTOL_LS_ELERIUMCOST;

var config int BULLPUP_LS_SUPPLYCOST;
var config int BULLPUP_LS_ALLOYCOST;
var config int BULLPUP_LS_ELERIUMCOST;

var config int VEKTORRIFLE_LS_SUPPLYCOST;
var config int VEKTORRIFLE_LS_ALLOYCOST;
var config int VEKTORRIFLE_LS_ELERIUMCOST;

var config int SIDEARM_LS_SUPPLYCOST;
var config int SIDEARM_LS_ALLOYCOST;
var config int SIDEARM_LS_ELERIUMCOST;

var config int SPARKRIFLE_LS_SUPPLYCOST;
var config int SPARKRIFLE_LS_ALLOYCOST;
var config int SPARKRIFLE_LS_ELERIUMCOST;

var config string AssaultRifle_Laser_ImagePath;
var config string BattleRifle_Laser_ImagePath;
var config string SMG_Laser_ImagePath;
var config string Cannon_Laser_ImagePath;
var config string Shotgun_Laser_ImagePath;
var config string SniperRifle_Laser_ImagePath;
var config string MarksmanRifle_Laser_ImagePath;
var config string Pistol_Laser_ImagePath;
var config string Bullpup_Laser_ImagePath;
var config string VektorRifle_Laser_ImagePath;
var config string Sidearm_Laser_ImagePath;
var config string SparkRifle_Laser_ImagePath;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	//create weapon templates for laser tier
	Weapons.AddItem(CreateTemplate_AssaultRifle_Laser());
	Weapons.AddItem(CreateTemplate_BattleRifle_Laser());
	Weapons.AddItem(CreateTemplate_SMG_Laser());
	Weapons.AddItem(CreateTemplate_Cannon_Laser());
	Weapons.AddItem(CreateTemplate_Shotgun_Laser());
	Weapons.AddItem(CreateTemplate_SniperRifle_Laser());
	Weapons.AddItem(CreateTemplate_MarksmanRifle_Laser());
	Weapons.AddItem(CreateTemplate_Pistol_Laser());
	Weapons.AddItem(CreateTemplate_Bullpup_Laser());
	Weapons.AddItem(CreateTemplate_Vektor_Laser());
	Weapons.AddItem(CreateTemplate_Sidearm_Laser());
	Weapons.AddItem(CreateTemplate_SparkRifle_Laser());

	return Weapons;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}

// **********************************************************************************************************
// ***                                            Laser Weapons                                           ***
// **********************************************************************************************************

static function X2DataTemplate CreateTemplate_AssaultRifle_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AssaultRifle_LS');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.AssaultRifle_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;
	Template.BaseDamage = default.ASSAULTRIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.ASSAULTRIFLE_LASER_AIM;
	Template.CritChance = default.ASSAULTRIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.ASSAULTRIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.ASSAULTRIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ASSAULTRIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.ASSAULTRIFLE_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	//Template.AddDefaultAttachment('Optic', "LWRifle_LS.Meshes.SK_LaserRifle_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserRifle__OpticA"); // no default optic

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'AssaultRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.ASSAULTRIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.ASSAULTRIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.ASSAULTRIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_BattleRifle_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BattleRifle_LS');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.BattleRifle_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;
	Template.BaseDamage = default.BATTLERIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.BATTLERIFLE_LASER_AIM;
	Template.CritChance = default.BATTLERIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.BATTLERIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.BATTLERIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BATTLERIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BATTLERIFLE_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_BRPack.Attach.BR_LS_OpticA");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'BattleRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'BR_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.BATTLERIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.BATTLERIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.BATTLERIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SMG_LS');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.SMG_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.Abilities.AddItem('SMG_LS_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SMGAbilities'.default.SMG_LASER_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MIDSHORT_LASER_RANGE;
	Template.BaseDamage = default.SMG_LASER_BASEDAMAGE;
	Template.Aim = default.SMG_LASER_AIM;
	Template.CritChance = default.SMG_LASER_CRITCHANCE;
	Template.iClipSize = default.SMG_LASER_ICLIPSIZE;
	Template.iSoundRange = default.SMG_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMG_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SMG_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWSMG_LS.Archetype.WP_SMG_LS";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_StockA"); // switching to use the shotgun-style stock to differentiate better from rifle
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserSMG_ForegripA");
	//Template.AddDefaultAttachment('Optic', "LWSMG_LS.Meshes.SK_LaserSMG_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserSMG__OpticA");  // no default optic
	Template.AddDefaultAttachment('Light', "LWAttachments_LS.Meshes.SK_Laser_Flashlight", , );

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'SMG_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SMG_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SMG_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SMG_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SMG_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_LS');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.Cannon_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;
	Template.BaseDamage = default.LMG_LASER_BASEDAMAGE;
	Template.Aim = default.LMG_LASER_AIM;
	Template.CritChance = default.LMG_LASER_CRITCHANCE;
	Template.iClipSize = default.LMG_LASER_ICLIPSIZE;
	Template.iSoundRange = default.LMG_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.LMG_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.LMG_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWCannon_LS.Archetype.WP_Cannon_LS";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWCannon_LS.Meshes.SK_LaserCannon_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWCannon_LS.Meshes.SK_LaserCannon_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "LWAttachments_LS.Meshes.SK_Laser_Flashlight", , );

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Cannon_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.CANNON_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.CANNON_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.CANNON_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 10;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_Shotgun_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Shotgun_LS');

	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.Shotgun_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.SHORT_LASER_RANGE;
	Template.BaseDamage = default.SHOTGUN_LASER_BASEDAMAGE;
	Template.Aim = default.SHOTGUN_LASER_AIM;
	Template.CritChance = default.SHOTGUN_LASER_CRITCHANCE;
	Template.iClipSize = default.SHOTGUN_LASER_ICLIPSIZE;
	Template.iSoundRange = default.SHOTGUN_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SHOTGUN_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SHOTGUN_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWShotgun_LS.Archetype.WP_Shotgun_LS";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
	Template.AddDefaultAttachment('Mag', "LWShotgun_LS.Meshes.SK_LaserShotgun_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_ForegripA");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Shotgun_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Shotgun_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SHOTGUN_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SHOTGUN_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SHOTGUN_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 10;
	}


	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_SniperRifle_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SniperRifle_LS');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.SniperRifle_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.LONG_LASER_RANGE;
	Template.BaseDamage = default.SNIPERRIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.SNIPERRIFLE_LASER_AIM;
	Template.CritChance = default.SNIPERRIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.SNIPERRIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.SNIPERRIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SNIPERRIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SNIPERRIFLE_LASER_UPGRADESLOTS;
	Template.iTypicalActionCost = 2;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO : update for Sniper Rifle laser model and default attachments
	Template.GameArchetype = "LWSniperRifle_LS.Archetype.WP_SniperRifle_LS";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserSniper_OpticA");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'SniperRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SniperRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SNIPERRIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SNIPERRIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SNIPERRIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 10;
	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_MarksmanRifle_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MarksmanRifle_LS');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.LaserRifle_Base";
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDLONG_LASER_RANGE;
	Template.BaseDamage = default.MARKSMANRIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.MARKSMANRIFLE_LASER_AIM;
	Template.CritChance = default.MARKSMANRIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.MARKSMANRIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.MARKSMANRIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MARKSMANRIFLE_LASER_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.MARKSMANRIFLE_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO : update for Sniper Rifle laser model and default attachments
		// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A", , "img:///UILibrary_BRPack.Attach.BR_LS_OpticA");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'MarksmanRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'MR_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.MARKSMANRIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.MARKSMANRIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.MARKSMANRIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 10;
	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_Pistol_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Pistol_LS');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///" $ default.Pistol_Laser_ImagePath;
	Template.EquipSound = "Secondary_Weapon_Equip_Beam"; // TODO: update with new equip sound
	Template.Tier = 2;

	Template.RangeAccuracy = default.SHORT_LASER_RANGE;
	Template.BaseDamage = default.PISTOL_LASER_BASEDAMAGE;
	Template.Aim = default.PISTOL_LASER_AIM;
	Template.CritChance = default.PISTOL_LASER_CRITCHANCE;
	Template.iClipSize = default.PISTOL_LASER_ICLIPSIZE;
	Template.iSoundRange = default.PISTOL_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.PISTOL_LASER_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.PISTOL_LASER_UPGRADESLOTS;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotBeamA'); // TODO : update with new animation if necessary

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWPistol_LS.Archetype.WP_Pistol_LS";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Pistol_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Pistol_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.PISTOL_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.PISTOL_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.PISTOL_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 10;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_Bullpup_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Bullpup_LS');

	Template.WeaponCat = 'bullpup';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.Bullpup_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.SHORT_LASER_RANGE;
	Template.BaseDamage = default.BULLPUP_LASER_BASEDAMAGE;
	Template.Aim = default.BULLPUP_LASER_AIM;
	Template.CritChance = default.BULLPUP_LASER_CRITCHANCE;
	Template.iClipSize = default.BULLPUP_LASER_ICLIPSIZE;
	Template.iSoundRange = default.BULLPUP_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BULLPUP_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BULLPUP_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Placeholder, replace with assets when completed
	Template.GameArchetype = "WP_SkirmisherSMG_MG.WP_SkirmisherSMG_MG";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun'; // the base game does this as well

	// TODO: Placeholders, replace with assets when completed
	Template.AddDefaultAttachment('Mag', "MagSMG.Meshes.SM_HOR_Mag_SMG_MagA", , "img:///UILibrary_XPACK_Common.MagSMG_MagazineA");
	Template.AddDefaultAttachment('Reargrip', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_StockA", , "img:///UILibrary_XPACK_Common.MagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_TriggerA", , "img:///UILibrary_XPACK_Common.MagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Bullpup_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Bullpup_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.BULLPUP_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.BULLPUP_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.BULLPUP_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_Vektor_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'VektorRifle_LS');

	Template.WeaponCat = 'vektor_rifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.VektorRifle_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.VEKTOR_LASER_RANGE;
	Template.BaseDamage = default.VEKTORRIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.VEKTORRIFLE_LASER_AIM;
	Template.CritChance = default.VEKTORRIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.VEKTORRIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.VEKTORRIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.VEKTORRIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.VEKTORRIFLE_LASER_UPGRADESLOTS; 

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Placeholder, replace with assets when completed
	Template.GameArchetype = "WP_ReaperRifle_MG.WP_ReaperRifle_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	
	// TODO: Placeholders, replace with assets when completed
	Template.AddDefaultAttachment('Mag', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.MagVektor_MagazineA");
	Template.AddDefaultAttachment('Optic', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.MagVektor_OpticA");
	Template.AddDefaultAttachment('Reargrip', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.MagVektor_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.MagVektor_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Vektor_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'VektorRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.VEKTORRIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.VEKTORRIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.VEKTORRIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_Sidearm_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Sidearm_LS');

	Template.WeaponCat = 'sidearm';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.Sidearm_Laser_ImagePath;
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Secondary_Weapon_Equip_Beam";
	Template.Tier = 2;

	Template.RangeAccuracy = default.SHORT_LASER_RANGE;
	Template.BaseDamage = default.SIDEARM_LASER_BASEDAMAGE;
	Template.Aim = default.SIDEARM_LASER_AIM;
	Template.CritChance = default.SIDEARM_LASER_CRITCHANCE;
	Template.iClipSize = default.SIDEARM_LASER_ICLIPSIZE;
	Template.iSoundRange = default.SIDEARM_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SIDEARM_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SIDEARM_LASER_UPGRADESLOTS;

	Template.InfiniteAmmo = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Placeholder, replace with assets when completed
	Template.GameArchetype = "WP_TemplarAutoPistol_MG.WP_TemplarAutoPistol_MG";

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = false;

	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Sidearm_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Sidearm_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SIDEARM_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SIDEARM_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SIDEARM_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.bHideClipSizeStat = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}

static function X2DataTemplate CreateTemplate_SparkRifle_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SparkRifle_LS');

	Template.WeaponCat = 'sparkrifle';
	Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///" $ default.SparkRifle_Laser_ImagePath;
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDIUM_LASER_RANGE;
	Template.BaseDamage = default.SPARKRIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.SPARKRIFLE_LASER_AIM;
	Template.CritChance = default.SPARKRIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.SPARKRIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.SPARKRIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SPARKRIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SPARKRIFLE_LASER_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	// TODO: Placeholder, replace with assets when completed
	Template.GameArchetype = "DLC_3_WP_SparkRifle_MG.WP_SparkRifle_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = !class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'SparkRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SparkRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SPARKRIFLE_LS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SPARKRIFLE_LS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SPARKRIFLE_LS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 5;

	}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type

	return Template;
}