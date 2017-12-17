//---------------------------------------------------------------------------------
//  FILE:   X2Item_CoilSchematics.uc
//  AUTHOR: Broscope (LWOTC Port Team)
//  PURPOSE: Configures schematic upgrades for Coil Weapons
//
//---------------------------------------------------------------------------------

class X2Item_CoilSchematics extends X2Item config(LW_WeaponPack);

var config bool USE_SCHEMATICS;

var config int AssaultRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int AssaultRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int AssaultRifle_COIL_SCHEMATIC_ELERIUMCOST;

var config int BattleRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int BattleRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int BattleRifle_COIL_SCHEMATIC_ELERIUMCOST;

var config int SMG_COIL_SCHEMATIC_SUPPLYCOST;
var config int SMG_COIL_SCHEMATIC_ALLOYCOST;
var config int SMG_COIL_SCHEMATIC_ELERIUMCOST;

var config int Shotgun_COIL_SCHEMATIC_SUPPLYCOST;
var config int Shotgun_COIL_SCHEMATIC_ALLOYCOST;
var config int Shotgun_COIL_SCHEMATIC_ELERIUMCOST;

var config int Cannon_COIL_SCHEMATIC_SUPPLYCOST;
var config int Cannon_COIL_SCHEMATIC_ALLOYCOST;
var config int Cannon_COIL_SCHEMATIC_ELERIUMCOST;

var config int LMG_COIL_SCHEMATIC_SUPPLYCOST;
var config int LMG_COIL_SCHEMATIC_ALLOYCOST;
var config int LMG_COIL_SCHEMATIC_ELERIUMCOST;

var config int SniperRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int SniperRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int SniperRifle_COIL_SCHEMATIC_ELERIUMCOST;

var config int MarksmanRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int MarksmanRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int MarksmanRifle_COIL_SCHEMATIC_ELERIUMCOST;

var config int Pistol_COIL_SCHEMATIC_SUPPLYCOST;
var config int Pistol_COIL_SCHEMATIC_ALLOYCOST;
var config int Pistol_COIL_SCHEMATIC_ELERIUMCOST;

var config int Bullpup_COIL_SCHEMATIC_SUPPLYCOST;
var config int Bullpup_COIL_SCHEMATIC_ALLOYCOST;
var config int Bullpup_COIL_SCHEMATIC_ELERIUMCOST;

var config int Vektor_COIL_SCHEMATIC_SUPPLYCOST;
var config int Vektor_COIL_SCHEMATIC_ALLOYCOST;
var config int Vektor_COIL_SCHEMATIC_ELERIUMCOST;

var config int Sidearm_COIL_SCHEMATIC_SUPPLYCOST;
var config int Sidearm_COIL_SCHEMATIC_ALLOYCOST;
var config int Sidearm_COIL_SCHEMATIC_ELERIUMCOST;

var config int SparkRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int SparkRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int SparkRifle_COIL_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics

	if (default.USE_SCHEMATICS)
	{
		Schematics.AddItem(CreateTemplate_AssaultRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_BattleRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_SMG_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Shotgun_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Cannon_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_LMG_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_SniperRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_MarksmanRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Pistol_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Bullpup_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Vektor_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Sidearm_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_SparkRifle_Coil_Schematic());

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

static function X2DataTemplate CreateTemplate_AssaultRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'AssaultRifle_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_AssaultRifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'AssaultRifle_CG';
	Template.HideIfPurchased = 'AssaultRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.AssaultRifle_COIL_SCHEMATIC_SUPPLYCOST, default.AssaultRifle_COIL_SCHEMATIC_ALLOYCOST, default.AssaultRifle_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_BattleRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'BattleRifle_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_AssaultRifle"; 
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'BattleRifle_CG';
	Template.HideIfPurchased = 'BattleRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.BattleRifle_COIL_SCHEMATIC_SUPPLYCOST, default.BattleRifle_COIL_SCHEMATIC_ALLOYCOST, default.BattleRifle_COIL_SCHEMATIC_ELERIUMCOST);
	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_SMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SMG_CG';
	Template.HideIfPurchased = 'SMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.SMG_COIL_SCHEMATIC_SUPPLYCOST, default.SMG_COIL_SCHEMATIC_ALLOYCOST, default.SMG_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Shotgun_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Shotgun_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_Shotgun";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Shotgun_CG';
	Template.HideIfPurchased = 'Shotgun_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.Shotgun_COIL_SCHEMATIC_SUPPLYCOST, default.Shotgun_COIL_SCHEMATIC_ALLOYCOST, default.Shotgun_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Cannon_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_Cannon";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Cannon_CG';
	Template.HideIfPurchased = 'Cannon_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.Cannon_COIL_SCHEMATIC_SUPPLYCOST, default.Cannon_COIL_SCHEMATIC_ALLOYCOST, default.Cannon_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_SniperRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SniperRifle_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_SniperRifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SniperRifle_CG';
	Template.HideIfPurchased = 'SniperRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.SniperRifle_COIL_SCHEMATIC_SUPPLYCOST, default.SniperRifle_COIL_SCHEMATIC_ALLOYCOST, default.SniperRifle_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_MarksmanRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MarksmanRifle_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_SniperRifle"; 
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'MarksmanRifle_CG';
	Template.HideIfPurchased = 'MarksmanRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]); 
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.MarksmanRifle_COIL_SCHEMATIC_SUPPLYCOST, default.MarksmanRifle_COIL_SCHEMATIC_ALLOYCOST, default.MarksmanRifle_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Pistol_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Pistol_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_Pistol";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Pistol_CG';
	Template.HideIfPurchased = 'Pistol_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.Pistol_COIL_SCHEMATIC_SUPPLYCOST, default.Pistol_COIL_SCHEMATIC_ALLOYCOST, default.Pistol_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Bullpup_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Bullpup_CG_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Bullpup: Mag Bullpup, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_BeamSMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Bullpup_CG';
	Template.HideIfPurchased = 'Bullpup_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Skirmisher';

	CreateTemplateCost(Template, default.Bullpup_COIL_SCHEMATIC_SUPPLYCOST, default.Bullpup_COIL_SCHEMATIC_ALLOYCOST, default.Bullpup_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_Vektor_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Vektor_CG_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Bullpup: Mag Bullpup, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagVektor";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'VektorRifle_CG';
	Template.HideIfPurchased = 'VektorRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Reaper';

	CreateTemplateCost(Template, default.Vektor_COIL_SCHEMATIC_SUPPLYCOST, default.Vektor_COIL_SCHEMATIC_ALLOYCOST, default.Vektor_COIL_SCHEMATIC_ELERIUMCOST);
	return Template;
}

static function X2DataTemplate CreateTemplate_Sidearm_Coil_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'Sidearm_CG_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Bullpup: Mag Bullpup, replace once image is available
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagTPistol_Base";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Sidearm_CG';
	Template.HideIfPurchased = 'Sidearm_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Templar';

	CreateTemplateCost(Template, default.Sidearm_COIL_SCHEMATIC_SUPPLYCOST, default.Sidearm_COIL_SCHEMATIC_ALLOYCOST, default.Sidearm_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_SparkRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SparkRifle_CG_Schematic');

	Template.ItemCat = 'weapon';
	// Placeholder image for Laser Bullpup: Mag Bullpup, replace once image is available
	Template.strImage = "img:///UILibrary_DLC3Images.MagSparkRifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'SparkRifle_CG';
	Template.HideIfPurchased = 'SparkRifle_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
	Template.Requirements.RequiredSoldierClass = 'Spark';
	Template.Requirements.SpecialRequirementsFn = class'X2Helpers_DLC_Day90'.static.IsLostTowersNarrativeContentComplete;

	// Non-Narrative Requirements
	AltReq.RequiredTechs.AddItem('MechanizedWarfare');
	AltReq.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);
	AltReq.RequiredEngineeringScore = 20;
	AltReq.RequiredSoldierClass = 'Spark';
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	CreateTemplateCost(Template, default.SparkRifle_COIL_SCHEMATIC_SUPPLYCOST, default.SparkRifle_COIL_SCHEMATIC_ALLOYCOST, default.SparkRifle_COIL_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_LMG_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'LMG_CG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_Cannon";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'LMG_CG';
	Template.HideIfPurchased = 'LMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.LMG_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.LMG_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.LMG_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.LMG_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}