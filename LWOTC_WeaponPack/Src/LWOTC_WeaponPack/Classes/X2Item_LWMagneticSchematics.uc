//---------------------------------------------------------------------------------------
//  FILE:    X2Item_SMGSchematics.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Configures schematic upgrades for SMGs
//
//---------------------------------------------------------------------------------------
class X2Item_LWMagneticSchematics extends X2Item config(LW_WeaponPack);

var config int BR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int SMG_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int MR_MAGNETIC_SCHEMATIC_SUPPLYCOST;
var config int LMG_MAGNETIC_SCHEMATIC_SUPPLYCOST;

var config int BR_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int SMG_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int MR_MAGNETIC_SCHEMATIC_ALLOYCOST;
var config int LMG_MAGNETIC_SCHEMATIC_ALLOYCOST;

var config int BR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int SMG_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int MR_MAGNETIC_SCHEMATIC_ELERIUMCOST;
var config int LMG_MAGNETIC_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;

	// Weapon Schematics
	Schematics.AddItem(CreateTemplate_BR_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_SMG_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_MR_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_LMG_Magnetic_Schematic());

	return Schematics;
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

static function X2DataTemplate CreateTemplate_BR_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'BR_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Rifle";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
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

	CreateTemplateCost(Template, default.BR_MAGNETIC_SCHEMATIC_SUPPLYCOST, default.BR_MAGNETIC_SCHEMATIC_ALLOYCOST, default.BR_MAGNETIC_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'SMG_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SMG.magnetic.Inv_LWMagSMG";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('SMG_CV');

	// Items being created
	Template.ReferenceItemTemplate = 'SMG_MG';
	Template.HideIfPurchased = 'SMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	CreateTemplateCost(Template, default.SMG_MAGNETIC_SCHEMATIC_SUPPLYCOST, default.SMG_MAGNETIC_SCHEMATIC_ALLOYCOST, default.SMG_MAGNETIC_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_MR_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'MR_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Sniper_Rifle"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
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

	CreateTemplateCost(Template, default.MR_MAGNETIC_SCHEMATIC_SUPPLYCOST, default.MR_MAGNETIC_SCHEMATIC_ALLOYCOST, default.MR_MAGNETIC_SCHEMATIC_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateTemplate_LMG_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'LMG_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // Don't know what img to use here
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Items to upgrade
	//Template.ItemsToUpgrade.AddItem('MR_CV');

	// Items being created
	Template.ReferenceItemTemplate = 'LMG_MG';
	Template.HideIfPurchased = 'LMG_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.LMG_MAGNETIC_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.LMG_MAGNETIC_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);
	
	// only add elerium cost if configured value greater than 0
	if (default.LMG_MAGNETIC_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.LMG_MAGNETIC_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}