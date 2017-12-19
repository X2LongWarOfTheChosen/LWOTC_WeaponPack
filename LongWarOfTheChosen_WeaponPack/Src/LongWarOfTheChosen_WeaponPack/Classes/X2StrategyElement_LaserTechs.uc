//---------------------------------------------------------------------------------------
//  FILE:    X2StrategyElement_LaserTechs.uc
//  AUTHOR:  Amineri / Pavonis Interactive
//---------------------------------------------------------------------------------------
class X2StrategyElement_LaserTechs extends X2StrategyElement config(LW_WeaponPack);

var config int LASER_WEAPONS_SUPPLYCOST;
var config int LASER_WEAPONS_ALLOYCOST;
var config int LASER_WEAPONS_ELERIUMCOST;
var config int LASER_WEAPONS_RESEARCH_POINTS;

var config int PULSE_LASER_WEAPONS_SUPPLYCOST;
var config int PULSE_LASER_WEAPONS_ALLOYCOST;
var config int PULSE_LASER_WEAPONS_ELERIUMCOST;
var config int PULSE_LASER_WEAPONS_RESEARCH_POINTS;

var array<name> LaserWeaponTech_Tier;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Weapon Techs
	Techs.AddItem(CreateLaserWeaponsTemplate());
	Techs.AddItem(CreatePulseLaserWeaponsTemplate());

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

static function X2DataTemplate CreateLaserWeaponsTemplate()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.LaserWeaponTech_Tier[0]);
	Template.PointsToComplete = default.LASER_WEAPONS_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_LaserPack.TECH_LaserWeapons";
	Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');

	CreateTemplateCost(Template, default.LASER_WEAPONS_SUPPLYCOST, default.LASER_WEAPONS_ALLOYCOST, default.LASER_WEAPONS_ELERIUMCOST);

	return Template;
}

static function X2DataTemplate CreatePulseLaserWeaponsTemplate()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.LaserWeaponTech_Tier[1]);
	Template.PointsToComplete = default.PULSE_LASER_WEAPONS_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_LaserPack.TECH_AdvancedLaserWeapons";
    Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

	CreateTemplateCost(Template, default.PULSE_LASER_WEAPONS_SUPPLYCOST, default.PULSE_LASER_WEAPONS_ALLOYCOST, default.PULSE_LASER_WEAPONS_ELERIUMCOST);

	return Template;
}

defaultProperties
{
	LaserWeaponTech_Tier[0]="LaserWeaponsTech";
	LaserWeaponTech_Tier[1]="AdvancedLaserWeaponsTech";
}
