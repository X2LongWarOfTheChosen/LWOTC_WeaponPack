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

static function CreateTemplateCost(out X2TechTemplate Template, int supplyCost, int alloyCost, int eleriumCost)
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

static function X2DataTemplate CreateCoilWeaponsTemplate()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.CoilWeaponTech_Tier[0]);
	Template.PointsToComplete = default.COIL_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_Coilguns.TECH_CoilWeapons";

	Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');

	CreateTemplateCost(Template, default.COIL_WEAPONS_SUPPLYCOST, default.COIL_WEAPONS_ALLOYCOST, default.COIL_WEAPONS_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreateAdvancedCoilWeaponsTemplate()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.CoilWeaponTech_Tier[1]);
	Template.PointsToComplete = default.ADVANCED_COIL_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_Coilguns.TECH_AdvancedCoilWeapons";
	Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.CoilWeaponTech_Tier[0]);

	CreateTemplateCost(Template, default.ADVANCED_COIL_WEAPONS_SUPPLYCOST, default.ADVANCED_COIL_WEAPONS_ALLOYCOST, default.ADVANCED_COIL_WEAPONS_ELERIUMCOST);

	return Template;
}

defaultProperties
{
	CoilWeaponTech_Tier[0]="Coilguns";
	CoilWeaponTech_Tier[1]="AdvancedCoilguns";
}
