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

var config int COIL_WEAPONS_SUPPLYCOST;
var config int COIL_WEAPONS_ALLOYCOST;
var config int COIL_WEAPONS_ELERIUMCOST;
var config int COIL_RESEARCH_POINTS;

var config int ADVANCED_COIL_WEAPONS_SUPPLYCOST;
var config int ADVANCED_COIL_WEAPONS_ALLOYCOST;
var config int ADVANCED_COIL_WEAPONS_ELERIUMCOST;
var config int ADVANCED_COIL_RESEARCH_POINTS;

var array<name> LaserWeaponTech_Tier;
var array<name> CoilWeaponTech_Tier;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Weapon Techs
	Techs.AddItem(CreateLaserWeaponsTemplate());
	Techs.AddItem(CreatePulseLaserWeaponsTemplate());
	Techs.AddItem(CreateCoilWeaponsTemplate());
	Techs.AddItem(CreateAdvancedCoilWeaponsTemplate());

	return Techs;
}

static function X2DataTemplate CreateLaserWeaponsTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.LaserWeaponTech_Tier[0]);
	Template.PointsToComplete = default.LASER_WEAPONS_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_LaserPack.TECH_LaserWeapons"; 
    Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');
		
	// Cost
	// only add if configured value greater than 0
	if (default.LASER_WEAPONS_SUPPLYCOST > 0)
	{
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.LASER_WEAPONS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	// only add if configured value greater than 0
	if (default.LASER_WEAPONS_ALLOYCOST > 0)
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.LASER_WEAPONS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	// only add if configured value greater than 0
	if (default.LASER_WEAPONS_ELERIUMCOST > 0)
	{
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.LASER_WEAPONS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreatePulseLaserWeaponsTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, default.LaserWeaponTech_Tier[1]);
	Template.PointsToComplete = default.PULSE_LASER_WEAPONS_RESEARCH_POINTS;
	Template.SortingTier = 1;
	Template.strImage = "img:///UILibrary_LW_LaserPack.TECH_AdvancedLaserWeapons";  
    Template.bWeaponTech = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);

	// Cost
	// only add if configured value greater than 0
	if (default.PULSE_LASER_WEAPONS_SUPPLYCOST > 0) 
	{
		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.PULSE_LASER_WEAPONS_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	// only add if configured value greater than 0
	if (default.PULSE_LASER_WEAPONS_ALLOYCOST > 0) 
	{
		Artifacts.ItemTemplateName = 'AlienAlloy';
		Artifacts.Quantity = default.PULSE_LASER_WEAPONS_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}
	// only add if configured value greater than 0
	if (default.PULSE_LASER_WEAPONS_ELERIUMCOST > 0) 
	{
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.PULSE_LASER_WEAPONS_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
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
	LaserWeaponTech_Tier[0]="LaserWeaponsTech_LW";
	LaserWeaponTech_Tier[1]="AdvancedLaserWeaponsTech_LW";
	CoilWeaponTech_Tier[0]="Coilguns";
	CoilWeaponTech_Tier[1]="AdvancedCoilguns";
}