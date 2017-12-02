//---------------------------------------------------------------------------------------
//  FILE:    X2Item_LaserSchematics.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Configures schematic upgrades for Laser Weapons
//
//---------------------------------------------------------------------------------------
class X2Item_LaserSchematics extends X2Item config(LW_WeaponPack);

var config bool USE_SCHEMATICS;

var config int AssaultRifle_LASER_SCHEMATIC_SUPPLYCOST;
var config int AssaultRifle_LASER_SCHEMATIC_ALLOYCOST;
var config int AssaultRifle_LASER_SCHEMATIC_ELERIUMCOST;

var config int SMG_LASER_SCHEMATIC_SUPPLYCOST;
var config int SMG_LASER_SCHEMATIC_ALLOYCOST;
var config int SMG_LASER_SCHEMATIC_ELERIUMCOST;

var config int Shotgun_LASER_SCHEMATIC_SUPPLYCOST;
var config int Shotgun_LASER_SCHEMATIC_ALLOYCOST;
var config int Shotgun_LASER_SCHEMATIC_ELERIUMCOST;

var config int Cannon_LASER_SCHEMATIC_SUPPLYCOST;
var config int Cannon_LASER_SCHEMATIC_ALLOYCOST;
var config int Cannon_LASER_SCHEMATIC_ELERIUMCOST;

var config int SniperRifle_LASER_SCHEMATIC_SUPPLYCOST;
var config int SniperRifle_LASER_SCHEMATIC_ALLOYCOST;
var config int SniperRifle_LASER_SCHEMATIC_ELERIUMCOST;

var config int Pistol_LASER_SCHEMATIC_SUPPLYCOST;
var config int Pistol_LASER_SCHEMATIC_ALLOYCOST;
var config int Pistol_LASER_SCHEMATIC_ELERIUMCOST;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics

	if (default.USE_SCHEMATICS)
	{

		Schematics.AddItem(CreateTemplate_AssaultRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_SMG_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Shotgun_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Cannon_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_SniperRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Pistol_Laser_Schematic());

		return Schematics;
	}
}

static function X2DataTemplate CreateTemplate_AssaultRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'AssaultRifle_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Assault_Rifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'AssaultRifle_LS';
	Template.HideIfPurchased = 'AssaultRifle_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.AssaultRifle_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.AssaultRifle_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.AssaultRifle_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.AssaultRifle_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_SMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SMG_LS';
	Template.HideIfPurchased = 'SMG_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SMG_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.SMG_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.SMG_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SMG_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Shotgun_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Shotgun_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Shotgun";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Shotgun_LS';
	Template.HideIfPurchased = 'Shotgun_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Shotgun_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Shotgun_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Shotgun_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Shotgun_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Cannon_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Cannon";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Cannon_LS';
	Template.HideIfPurchased = 'Cannon_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Cannon_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Cannon_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Cannon_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Cannon_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_SniperRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SniperRifle_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Sniper_Rifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SniperRifle_LS';
	Template.HideIfPurchased = 'SniperRifle_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SniperRifle_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.SniperRifle_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.SniperRifle_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SniperRifle_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Pistol_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Pistol_LS_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Pistol";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Pistol_LS';
	Template.HideIfPurchased = 'Pistol_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Pistol_LASER_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Pistol_LASER_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Pistol_LASER_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Pistol_LASER_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

	return Template;
}
