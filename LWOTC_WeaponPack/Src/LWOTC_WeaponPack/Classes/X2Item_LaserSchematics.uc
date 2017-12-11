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

var config int BattleRifle_LASER_SCHEMATIC_SUPPLYCOST;
var config int BattleRifle_LASER_SCHEMATIC_ALLOYCOST;
var config int BattleRifle_LASER_SCHEMATIC_ELERIUMCOST;

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

var config int MarksmanRifle_LASER_SCHEMATIC_SUPPLYCOST;
var config int MarksmanRifle_LASER_SCHEMATIC_ALLOYCOST;
var config int MarksmanRifle_LASER_SCHEMATIC_ELERIUMCOST;

var config int Pistol_LASER_SCHEMATIC_SUPPLYCOST;
var config int Pistol_LASER_SCHEMATIC_ALLOYCOST;
var config int Pistol_LASER_SCHEMATIC_ELERIUMCOST;

var config int Bullpup_LASER_SCHEMATIC_SUPPLYCOST;
var config int Bullpup_LASER_SCHEMATIC_ALLOYCOST;
var config int Bullpup_LASER_SCHEMATIC_ELERIUMCOST;

var config int Vektor_LASER_SCHEMATIC_SUPPLYCOST;
var config int Vektor_LASER_SCHEMATIC_ALLOYCOST;
var config int Vektor_LASER_SCHEMATIC_ELERIUMCOST;

var config int Sidearm_LASER_SCHEMATIC_SUPPLYCOST;
var config int Sidearm_LASER_SCHEMATIC_ALLOYCOST;
var config int Sidearm_LASER_SCHEMATIC_ELERIUMCOST;

var config int SparkRifle_LASER_SCHEMATIC_SUPPLYCOST;
var config int SparkRifle_LASER_SCHEMATIC_ALLOYCOST;
var config int SparkRifle_LASER_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics

	if (default.USE_SCHEMATICS)
	{

		Schematics.AddItem(CreateTemplate_AssaultRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_BattleRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_SMG_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Shotgun_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Cannon_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_SniperRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_MarksmanRifle_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Pistol_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Bullpup_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Vektor_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_Sidearm_Laser_Schematic());
		Schematics.AddItem(CreateTemplate_SparkRifle_Laser_Schematic());

		return Schematics;
	}
}

static function CreateTemplateCost(out X2SchematicTemplate Template, int supplyCost, int alloyCost, int eleriumCost)
{
	local ArtifactCost Resources;

	if (supplyCost > 0)
	{
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = supplyCost;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (alloyCost > 0)
	{
		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = alloyCost;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	if (eleriumCost > 0)
	{
		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = eleriumCost;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
}

static function X2DataTemplate CreateTemplate_AssaultRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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

	CreateTemplateCost(Template, default.AssaultRifle_LASER_SCHEMATIC_SUPPLYCOST, default.AssaultRifle_LASER_SCHEMATIC_ALLOYCOST, default.AssaultRifle_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_BattleRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'BattleRifle_LS_Schematic');

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
	Template.ReferenceItemTemplate = 'BattleRifle_LS';
	Template.HideIfPurchased = 'BattleRifle_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.BattleRifle_LASER_SCHEMATIC_SUPPLYCOST, default.BattleRifle_LASER_SCHEMATIC_ALLOYCOST, default.BattleRifle_LASER_SCHEMATIC_ELERIUMCOST);
	
	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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

	CreateTemplateCost(Template, default.SMG_LASER_SCHEMATIC_SUPPLYCOST, default.SMG_LASER_SCHEMATIC_ALLOYCOST, default.SMG_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Shotgun_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.Shotgun_LASER_SCHEMATIC_SUPPLYCOST, default.Shotgun_LASER_SCHEMATIC_ALLOYCOST, default.Shotgun_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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

	CreateTemplateCost(Template, default.Cannon_LASER_SCHEMATIC_SUPPLYCOST, default.Cannon_LASER_SCHEMATIC_ALLOYCOST, default.Cannon_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_SniperRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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

	CreateTemplateCost(Template, default.SniperRifle_LASER_SCHEMATIC_SUPPLYCOST, default.SniperRifle_LASER_SCHEMATIC_ALLOYCOST, default.SniperRifle_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_MarksmanRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MarksmanRifle_LS_Schematic');

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
	Template.ReferenceItemTemplate = 'MarksmanRifle_LS';
	Template.HideIfPurchased = 'MarksmanRifle_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]); 
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.MarksmanRifle_LASER_SCHEMATIC_SUPPLYCOST, default.MarksmanRifle_LASER_SCHEMATIC_ALLOYCOST, default.MarksmanRifle_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Pistol_Laser_Schematic()
{
	local X2SchematicTemplate Template;

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

	CreateTemplateCost(Template, default.Pistol_LASER_SCHEMATIC_SUPPLYCOST, default.Pistol_LASER_SCHEMATIC_ALLOYCOST, default.Pistol_LASER_SCHEMATIC_ELERIUMCOST);

	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

	return Template;
}

static function X2DataTemplate CreateTemplate_Bullpup_Laser_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Bullpup_LS_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Bullpup: Mag Bullpup, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagSMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Bullpup_LS';
	Template.HideIfPurchased = 'Bullpup_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Skirmisher';

	CreateTemplateCost(Template, default.Bullpup_LASER_SCHEMATIC_SUPPLYCOST, default.Bullpup_LASER_SCHEMATIC_ALLOYCOST, default.Bullpup_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Vektor_Laser_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Vektor_LS_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Vektor: Mag Vektor, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagVektor";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'VektorRifle_LS';
	Template.HideIfPurchased = 'VektorRifle_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Reaper';

	CreateTemplateCost(Template, default.Vektor_LASER_SCHEMATIC_SUPPLYCOST, default.Vektor_LASER_SCHEMATIC_ALLOYCOST, default.Vektor_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Sidearm_Laser_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Sidearm_LS_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Vektor: Mag Vektor, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagTPistol_Base";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Sidearm_LS';
	Template.HideIfPurchased = 'Sidearm_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Templar';

	CreateTemplateCost(Template, default.Sidearm_LASER_SCHEMATIC_SUPPLYCOST, default.Sidearm_LASER_SCHEMATIC_ALLOYCOST, default.Sidearm_LASER_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_SparkRifle_Laser_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SparkRifle_LS_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Vektor: Mag Vektor, replace once image is available
	Template.strImage = "img:///UILibrary_DLC3Images.MagSparkRifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SparkRifle_LS';
	Template.HideIfPurchased = 'SparkRifle_MG';

	// Narrative Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Spark';
	Template.Requirements.SpecialRequirementsFn = class'X2Helpers_DLC_Day90'.static.IsLostTowersNarrativeContentComplete;

	// Non-Narrative Requirements
	AltReq.RequiredTechs.AddItem('MechanizedWarfare');
	AltReq.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	AltReq.RequiredEngineeringScore = 10;
	AltReq.RequiredSoldierClass = 'Spark';
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	CreateTemplateCost(Template, default.SparkRifle_LASER_SCHEMATIC_SUPPLYCOST, default.SparkRifle_LASER_SCHEMATIC_ALLOYCOST, default.SparkRifle_LASER_SCHEMATIC_ELERIUMCOST);
	return Template;
}
