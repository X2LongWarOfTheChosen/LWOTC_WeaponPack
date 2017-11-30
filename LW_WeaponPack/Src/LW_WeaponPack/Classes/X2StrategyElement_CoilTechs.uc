//---------------------------------------------------------------------------------------
//  FILE:    X2StrategyElement_CoilTechs.uc
//  AUTHOR:  Broscope / LWOTC Port Team
//---------------------------------------------------------------------------------------
class X2StrategyElement_CoilTechs extends X2StrategyElement config(LW_WeaponPack);

var config int COIL_WEAPONS_SUPPLYCOST;
var config int COIL_WEAPONS_ALLOYCOST;
var config int COIL_WEAPONS_ELERIUMCOST;
var config int COIL_RESEARCH_POINTS;

var config int ADVANCED_COIL_WEAPONS_SUPPLYCOST;
var config int ADVANCED_COIL_WEAPONS_ALLOYCOST;
var config int ADVANCED_COIL_WEAPONS_ELERIUMCOST;
var config int ADVANCED_COIL_RESEARCH_POINTS;

var array<name> CoilWeaponTech_Tier;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Weapon Techs
	Techs.AddItem(CreateCoilWeaponsTemplate());
	Techs.AddItem(CreateAdvancedCoilWeaponsTemplate());

	return Techs;
}

static function X2DataTemplate CreateCoilWeaponsTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.CoilWeaponTech_Tier[0]);
	Template.PointsToComplete = default.COIL_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_Coilguns.TECH_CoilWeapons";

	Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');

	// Cost
	// only add if configured value greater than 0
	if (default.COIL_WEAPONS_SUPPLYCOST > 0)
	{
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.COIL_WEAPONS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	// only add if configured value greater than 0
	if (default.COIL_WEAPONS_ALLOYCOST > 0)
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.COIL_WEAPONS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	// only add if configured value greater than 0
	if (default.COIL_WEAPONS_ELERIUMCOST > 0)
	{
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.COIL_WEAPONS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateAdvancedCoilWeaponsTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.CoilWeaponTech_Tier[1]);
	Template.PointsToComplete = default.ADVANCED_COIL_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_Coilguns.TECH_AdvancedCoilWeapons";
	Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.CoilWeaponTech_Tier[0]);

	// Cost
	// only add if configured value greater than 0
	if (default.ADVANCED_COIL_WEAPONS_SUPPLYCOST > 0)
	{
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.ADVANCED_COIL_WEAPONS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	// only add if configured value greater than 0
	if (default.ADVANCED_COIL_WEAPONS_ALLOYCOST > 0)
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.ADVANCED_COIL_WEAPONS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	// only add if configured value greater than 0
	if (default.ADVANCED_COIL_WEAPONS_ELERIUMCOST > 0)
	{
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.ADVANCED_COIL_WEAPONS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

defaultProperties
{
	CoilWeaponTech_Tier[0]="Coilguns";
	CoilWeaponTech_Tier[1]="AdvancedCoilguns";
}
