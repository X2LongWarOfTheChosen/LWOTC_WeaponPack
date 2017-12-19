class X2Item_Schematic_Laser extends X2Item_Schematic_LongWar config(LW_WeaponPack);

var config int AssaultRifle_Laser_Schematic_SupplyCost;
var config int AssaultRifle_Laser_Schematic_AlloyCost;
var config int AssaultRifle_Laser_Schematic_EleriumCost;

var config int BattleRifle_Laser_Schematic_SupplyCost;
var config int BattleRifle_Laser_Schematic_AlloyCost;
var config int BattleRifle_Laser_Schematic_EleriumCost;

var config int SMG_Laser_Schematic_SupplyCost;
var config int SMG_Laser_Schematic_AlloyCost;
var config int SMG_Laser_Schematic_EleriumCost;

var config int Shotgun_Laser_Schematic_SupplyCost;
var config int Shotgun_Laser_Schematic_AlloyCost;
var config int Shotgun_Laser_Schematic_EleriumCost;

var config int Cannon_Laser_Schematic_SupplyCost;
var config int Cannon_Laser_Schematic_AlloyCost;
var config int Cannon_Laser_Schematic_EleriumCost;

var config int SniperRifle_Laser_Schematic_SupplyCost;
var config int SniperRifle_Laser_Schematic_AlloyCost;
var config int SniperRifle_Laser_Schematic_EleriumCost;

var config int MarksmanRifle_Laser_Schematic_SupplyCost;
var config int MarksmanRifle_Laser_Schematic_AlloyCost;
var config int MarksmanRifle_Laser_Schematic_EleriumCost;

var config int LMG_Laser_Schematic_SupplyCost;
var config int LMG_Laser_Schematic_AlloyCost;
var config int LMG_Laser_Schematic_EleriumCost;

var config int Carbine_Laser_Schematic_SupplyCost;
var config int Carbine_Laser_Schematic_AlloyCost;
var config int Carbine_Laser_Schematic_EleriumCost;

var config int SAW_Laser_Schematic_SupplyCost;
var config int SAW_Laser_Schematic_AlloyCost;
var config int SAW_Laser_Schematic_EleriumCost;

var config int Pistol_Laser_Schematic_SupplyCost;
var config int Pistol_Laser_Schematic_AlloyCost;
var config int Pistol_Laser_Schematic_EleriumCost;

var config int Bullpup_Laser_Schematic_SupplyCost;
var config int Bullpup_Laser_Schematic_AlloyCost;
var config int Bullpup_Laser_Schematic_EleriumCost;

var config int Vektor_Laser_Schematic_SupplyCost;
var config int Vektor_Laser_Schematic_AlloyCost;
var config int Vektor_Laser_Schematic_EleriumCost;

var config int Sidearm_Laser_Schematic_SupplyCost;
var config int Sidearm_Laser_Schematic_AlloyCost;
var config int Sidearm_Laser_Schematic_EleriumCost;

var config int SparkRifle_Laser_Schematic_SupplyCost;
var config int SparkRifle_Laser_Schematic_AlloyCost;
var config int SparkRifle_Laser_Schematic_EleriumCost;

var name AssaultRifleLaserSchematic;
var name BattleRifleLaserSchematic;
var name SMGLaserSchematic;
var name ShotgunLaserSchematic;
var name CannonLaserSchematic;
var name SniperRifleLaserSchematic;
var name MarksmanRifleLaserSchematic;
var name LMGLaserSchematic;
var name CarbineLaserSchematic;
var name SAWLaserSchematic;
var name PistolLaserSchematic;
var name BullpupLaserSchematic;
var name VektorLaserSchematic;
var name SidearmLaserSchematic;
var name SparkRifleLaserSchematic;

defaultproperties
{
	AssaultRifleLaserSchematic = "AssaultRifle_LS_Schematic"
	BattleRifleLaserSchematic = "BattleRifle_LS_Schematic"
	SMGLaserSchematic = "SMG_LS_Schematic"
	ShotgunLaserSchematic = "Shotgun_LS_Schematic"
	CannonLaserSchematic = "Cannon_LS_Schematic"
	SniperRifleLaserSchematic = "SniperRifle_LS_Schematic"
	MarksmanRifleLaserSchematic = "MarksmanRifle_LS_Schematic"
	LMGLaserSchematic = "LMG_LS_Schematic"
	CarbineLaserSchematic = "Carbine_LS_Schematic"
	SAWLaserSchematic = "SAW_LS_Schematic"
	PistolLaserSchematic = "Pistol_LS_Schematic"
	BullpupLaserSchematic = "Bullpup_LS_Schematic"
	VektorLaserSchematic = "Vektor_LS_Schematic"
	SidearmLaserSchematic = "Sidearm_LS_Schematic"
	SparkRifleLaserSchematic = "SparkRifle_LS_Schematic"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	Schematics.AddItem(Create_AssaultRifle_Laser_Schematic(default.AssaultRifleLaserSchematic));
	Schematics.AddItem(Create_BattleRifle_Laser_Schematic(default.BattleRifleLaserSchematic));
	Schematics.AddItem(Create_SMG_Laser_Schematic(default.SMGLaserSchematic));
	Schematics.AddItem(Create_Shotgun_Laser_Schematic(default.ShotgunLaserSchematic));
	Schematics.AddItem(Create_Cannon_Laser_Schematic(default.CannonLaserSchematic));
	Schematics.AddItem(Create_SniperRifle_Laser_Schematic(default.SniperRifleLaserSchematic));
	Schematics.AddItem(Create_MarksmanRifle_Laser_Schematic(default.MarksmanRifleLaserSchematic));
	Schematics.AddItem(Create_LMG_Laser_Schematic(default.LMGLaserSchematic));
	Schematics.AddItem(Create_Carbine_Laser_Schematic(default.CarbineLaserSchematic));
	Schematics.AddItem(Create_SAW_Laser_Schematic(default.SAWLaserSchematic));
	Schematics.AddItem(Create_Pistol_Laser_Schematic(default.PistolLaserSchematic));
	Schematics.AddItem(Create_Bullpup_Laser_Schematic(default.BullpupLaserSchematic));
	Schematics.AddItem(Create_Vektor_Laser_Schematic(default.VektorLaserSchematic));
	Schematics.AddItem(Create_Sidearm_Laser_Schematic(default.SidearmLaserSchematic));
	Schematics.AddItem(Create_SparkRifle_Laser_Schematic(default.SparkRifleLaserSchematic));
	return Schematics;
}

static function Create_Laser_Schematic(out X2SchematicTemplate Template, name RequiredTech)
{
	Template.ItemCat = 'weapon';
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem(RequiredTech);
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
}

static function X2DataTemplate Create_AssaultRifle_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Assault_Rifle";
	
	Template.ReferenceItemTemplate = 'AssaultRifle_LS';
	Template.HideIfPurchased = 'AssaultRifle_MG';

	CreateTemplateCost(Template, default.AssaultRifle_Laser_Schematic_SupplyCost, default.AssaultRifle_Laser_Schematic_AlloyCost, default.AssaultRifle_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_BattleRifle_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Assault_Rifle"; 

	Template.ReferenceItemTemplate = 'BattleRifle_LS';
	Template.HideIfPurchased = 'BattleRifle_MG';

	CreateTemplateCost(Template, default.BattleRifle_Laser_Schematic_SupplyCost, default.BattleRifle_Laser_Schematic_AlloyCost, default.BattleRifle_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SMG_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_SMG";

	Template.ReferenceItemTemplate = 'SMG_LS';
	Template.HideIfPurchased = 'SMG_MG';

	CreateTemplateCost(Template, default.SMG_Laser_Schematic_SupplyCost, default.SMG_Laser_Schematic_AlloyCost, default.SMG_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Shotgun_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Shotgun";

	Template.ReferenceItemTemplate = 'Shotgun_LS';
	Template.HideIfPurchased = 'Shotgun_MG';

	CreateTemplateCost(Template, default.Shotgun_Laser_Schematic_SupplyCost, default.Shotgun_Laser_Schematic_AlloyCost, default.Shotgun_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Cannon_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Cannon";

	Template.ReferenceItemTemplate = 'Cannon_LS';
	Template.HideIfPurchased = 'Cannon_MG';

	CreateTemplateCost(Template, default.Cannon_Laser_Schematic_SupplyCost, default.Cannon_Laser_Schematic_AlloyCost, default.Cannon_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SniperRifle_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Sniper_Rifle";

	Template.ReferenceItemTemplate = 'SniperRifle_LS';
	Template.HideIfPurchased = 'SniperRifle_MG';

	CreateTemplateCost(Template, default.SniperRifle_Laser_Schematic_SupplyCost, default.SniperRifle_Laser_Schematic_AlloyCost, default.SniperRifle_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Sniper_Rifle";

	Template.ReferenceItemTemplate = 'MarksmanRifle_LS';
	Template.HideIfPurchased = 'MarksmanRifle_MG';

	CreateTemplateCost(Template, default.MarksmanRifle_Laser_Schematic_SupplyCost, default.MarksmanRifle_Laser_Schematic_AlloyCost, default.MarksmanRifle_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Carbine_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Assault_Rifle";
	
	Template.ReferenceItemTemplate = 'Carbine_LS';
	Template.HideIfPurchased = 'Carbine_MG';

	CreateTemplateCost(Template, default.Carbine_Laser_Schematic_SupplyCost, default.Carbine_Laser_Schematic_AlloyCost, default.Carbine_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_LMG_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_Laserguns.InventoryArt.Inv_Laser_Cannon";

	Template.ReferenceItemTemplate = 'LMG_LS';
	Template.HideIfPurchased = 'LMG_MG';

	CreateTemplateCost(Template, default.LMG_Laser_Schematic_SupplyCost, default.LMG_Laser_Schematic_AlloyCost, default.LMG_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SAW_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[1]);
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.strImage = "img:///UILibrary_LW_Laserguns.InventoryArt.Inv_Laser_Cannon";

	Template.ReferenceItemTemplate = 'SAW_LS';
	Template.HideIfPurchased = 'SAW_MG';

	CreateTemplateCost(Template, default.SAW_Laser_Schematic_SupplyCost, default.SAW_Laser_Schematic_AlloyCost, default.SAW_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Pistol_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_LW_LaserPack.Inv_Laser_Pistol";

	Template.ReferenceItemTemplate = 'Pistol_LS';
	Template.HideIfPurchased = 'Pistol_MG';

	CreateTemplateCost(Template, default.Pistol_Laser_Schematic_SupplyCost, default.Pistol_Laser_Schematic_AlloyCost, default.Pistol_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Bullpup_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagSMG";

	Template.ReferenceItemTemplate = 'Bullpup_LS';
	Template.HideIfPurchased = 'Bullpup_MG';
	Template.Requirements.RequiredSoldierClass = 'Skirmisher';

	CreateTemplateCost(Template, default.Bullpup_Laser_Schematic_SupplyCost, default.Bullpup_Laser_Schematic_AlloyCost, default.Bullpup_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Vektor_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagVektor";

	Template.ReferenceItemTemplate = 'VektorRifle_LS';
	Template.HideIfPurchased = 'VektorRifle_MG';
	Template.Requirements.RequiredSoldierClass = 'Reaper';

	CreateTemplateCost(Template, default.Vektor_Laser_Schematic_SupplyCost, default.Vektor_Laser_Schematic_AlloyCost, default.Vektor_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Sidearm_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.Inv_MagTPistol_Base";

	Template.ReferenceItemTemplate = 'Sidearm_LS';
	Template.HideIfPurchased = 'Sidearm_MG';
	Template.Requirements.RequiredSoldierClass = 'Templar';

	CreateTemplateCost(Template, default.Sidearm_Laser_Schematic_SupplyCost, default.Sidearm_Laser_Schematic_AlloyCost, default.Sidearm_Laser_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SparkRifle_Laser_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Laser_Schematic(Template, class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	Template.Requirements.RequiredEngineeringScore = 5;
	Template.strImage = "img:///UILibrary_DLC3Images.MagSparkRifle";

	Template.ReferenceItemTemplate = 'SparkRifle_LS';
	Template.HideIfPurchased = 'SparkRifle_MG';

	Template.Requirements.RequiredSoldierClass = 'Spark';
	Template.Requirements.SpecialRequirementsFn = class'X2Helpers_DLC_Day90'.static.IsLostTowersNarrativeContentComplete;

	// Non-Narrative Requirements
	AltReq.RequiredTechs.AddItem('MechanizedWarfare');
	AltReq.RequiredTechs.AddItem(class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[0]);
	AltReq.RequiredEngineeringScore = 10;
	AltReq.RequiredSoldierClass = 'Spark';
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	CreateTemplateCost(Template, default.SparkRifle_Laser_Schematic_SupplyCost, default.SparkRifle_Laser_Schematic_AlloyCost, default.SparkRifle_Laser_Schematic_EleriumCost);
	return Template;
}