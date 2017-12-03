//---------------------------------------------------------------------------------------
//  FILE:    X2Item_BRSchematics.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Configures schematic upgrades for BRs
//           
//---------------------------------------------------------------------------------------
class X2Item_BRSchematics extends X2Item config(LW_WeaponPack);


var config int BR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int BR_BEAM_SCHEMATIC_SUPPLYCOST;

var config int BR_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int BR_BEAM_SCHEMATIC_ALLOYCOST;

var config int BR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int BR_BEAM_SCHEMATIC_ELERIUMCOST;

var config int MR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int MR_BEAM_SCHEMATIC_SUPPLYCOST;

var config int MR_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int MR_BEAM_SCHEMATIC_ALLOYCOST;

var config int MR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int MR_BEAM_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	
	// Weapon Schematics

	Schematics.AddItem(CreateTemplate_BR_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_BR_Beam_Schematic());
	Schematics.AddItem(CreateTemplate_MR_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_MR_Beam_Schematic());

	return Schematics;
}

static function X2DataTemplate CreateTemplate_BR_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'BR_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Rifle"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('BR_CV');

	// Items being created
	Template.ReferenceItemTemplate = 'BR_MG';
	Template.HideIfPurchased = 'BR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.BR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.BR_MAGNETIC_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);
	
	// only add elerium cost if configured value greater than 0
	if (default.BR_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.BR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_BR_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'BR_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Rifle"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('BR_CV');
	//Template.ItemsToUpgrade.AddItem('BR_MG');

	//Items being created
	Template.ReferenceItemTemplate = 'BR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.BR_BEAM_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.BR_BEAM_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumDust';
	Artifacts.Quantity = default.BR_BEAM_SCHEMATIC_ELERIUMCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateTemplate_MR_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MR_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Sniper_Rifle"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('MR_CV');

	// Items being created
	Template.ReferenceItemTemplate = 'MR_MG';
	Template.HideIfPurchased = 'MR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.MR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.MR_MAGNETIC_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);
	
	// only add elerium cost if configured value greater than 0
	if (default.MR_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.MR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateTemplate_MR_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MR_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Sniper_Rifle"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('MR_CV');
	//Template.ItemsToUpgrade.AddItem('MR_MG');

	//Items being created
	Template.ReferenceItemTemplate = 'MR_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaSniper');
	Template.Requirements.RequiredEngineeringScore = 25;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.MR_BEAM_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.MR_BEAM_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumDust';
	Artifacts.Quantity = default.MR_BEAM_SCHEMATIC_ELERIUMCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	return Template;
}