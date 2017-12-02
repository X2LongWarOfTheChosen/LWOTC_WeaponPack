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

var config int SMG_COIL_SCHEMATIC_SUPPLYCOST;
var config int SMG_COIL_SCHEMATIC_ALLOYCOST;
var config int SMG_COIL_SCHEMATIC_ELERIUMCOST;

var config int Shotgun_COIL_SCHEMATIC_SUPPLYCOST;
var config int Shotgun_COIL_SCHEMATIC_ALLOYCOST;
var config int Shotgun_COIL_SCHEMATIC_ELERIUMCOST;

var config int Cannon_COIL_SCHEMATIC_SUPPLYCOST;
var config int Cannon_COIL_SCHEMATIC_ALLOYCOST;
var config int Cannon_COIL_SCHEMATIC_ELERIUMCOST;

var config int SniperRifle_COIL_SCHEMATIC_SUPPLYCOST;
var config int SniperRifle_COIL_SCHEMATIC_ALLOYCOST;
var config int SniperRifle_COIL_SCHEMATIC_ELERIUMCOST;

var config int Pistol_COIL_SCHEMATIC_SUPPLYCOST;
var config int Pistol_COIL_SCHEMATIC_ALLOYCOST;
var config int Pistol_COIL_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics

	if (default.USE_SCHEMATICS)
	{
		Schematics.AddItem(CreateTemplate_AssaultRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_SMG_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Shotgun_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Cannon_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_SniperRifle_Coil_Schematic());
		Schematics.AddItem(CreateTemplate_Pistol_Coil_Schematic());

		return Schematics;
	}
}

static function X2DataTemplate CreateTemplate_AssaultRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.AssaultRifle_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.AssaultRifle_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.AssaultRifle_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.AssaultRifle_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SMG_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.SMG_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.SMG_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SMG_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Shotgun_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Shotgun_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Shotgun_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Shotgun_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Shotgun_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Cannon_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Cannon_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Cannon_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Cannon_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_SniperRifle_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SniperRifle_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.SniperRifle_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.SniperRifle_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.SniperRifle_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_Pistol_Coil_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

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

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.Pistol_Coil_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.Pistol_Coil_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	// only add elerium cost if configured value greater than 0
	if (default.Pistol_Coil_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.Pistol_Coil_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}
