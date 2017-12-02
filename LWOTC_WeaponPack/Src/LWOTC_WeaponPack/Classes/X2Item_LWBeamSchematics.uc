//---------------------------------------------------------------------------------------
//  FILE:    X2Item_SMGBeamSchematics.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Configures schematic upgrades for Beam
//
//---------------------------------------------------------------------------------------
class X2Item_LWBeamSchematics extends X2Item config(LW_WeaponPack);

var config int SMG_BEAM_SCHEMATIC_SUPPLYCOST;

var config int SMG_BEAM_SCHEMATIC_ALLOYCOST;

var config int SMG_BEAM_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics
	Schematics.AddItem(CreateTemplate_SMG_Beam_Schematic());

	return Schematics;
}

static function X2DataTemplate CreateTemplate_SMG_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SMG.Beam.Inv_LWBeamSMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('SMG_CV');
	//Template.ItemsToUpgrade.AddItem('SMG_MG');

	//Items being created
	Template.ReferenceItemTemplate = 'SMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.SMG_BEAM_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.SMG_BEAM_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumDust';
	Artifacts.Quantity = default.SMG_BEAM_SCHEMATIC_ELERIUMCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	return Template;
}
