class X2Item_Schematic_LWMagnetic extends X2Item_Schematic_LongWar config(LW_WeaponPack);

var config int BattleRifle_Magnetic_Schematic_SupplyCost;
var config int BattleRifle_Magnetic_Schematic_AlloyCost;
var config int BattleRifle_Magnetic_Schematic_EleriumCost;

var config int SMG_Magnetic_Schematic_SupplyCost;
var config int SMG_Magnetic_Schematic_AlloyCost;
var config int SMG_Magnetic_Schematic_EleriumCost;

var config int MarksmanRifle_Magnetic_Schematic_SupplyCost;
var config int MarksmanRifle_Magnetic_Schematic_AlloyCost;
var config int MarksmanRifle_Magnetic_Schematic_EleriumCost;

var config int LMG_Magnetic_Schematic_SupplyCost;
var config int LMG_Magnetic_Schematic_AlloyCost;
var config int LMG_Magnetic_Schematic_EleriumCost;

var config int Carbine_Magnetic_Schematic_SupplyCost;
var config int Carbine_Magnetic_Schematic_AlloyCost;
var config int Carbine_Magnetic_Schematic_EleriumCost;

var config int SAW_Magnetic_Schematic_SupplyCost;
var config int SAW_Magnetic_Schematic_AlloyCost;
var config int SAW_Magnetic_Schematic_EleriumCost;

var name BattleRifleMagneticSchematic;
var name SMGMagneticSchematic;
var name MarksmanRifleMagneticSchematic;
var name LMGMagneticSchematic;
var name CarbineMagneticSchematic;
var name SAWMagneticSchematic;

defaultproperties
{
	BattleRifleMagneticSchematic = "BattleRifle_MG_Schematic"
	SMGMagneticSchematic = "SMG_MG_Schematic"
	MarksmanRifleMagneticSchematic = "MarksmanRifle_MG_Schematic"
	LMGMagneticSchematic = "LMG_MG_Schematic"
	CarbineMagneticSchematic = "Carbine_MG_Schematic"
	SAWMagneticSchematic = "SAW_MG_Schematic"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	Schematics.AddItem(Create_BattleRifle_Magnetic_Schematic(default.BattleRifleMagneticSchematic));
	Schematics.AddItem(Create_SMG_Magnetic_Schematic(default.SMGMagneticSchematic));
	Schematics.AddItem(Create_MarksmanRifle_Magnetic_Schematic(default.MarksmanRifleMagneticSchematic));
	Schematics.AddItem(Create_LMG_Magnetic_Schematic(default.LMGMagneticSchematic));
	Schematics.AddItem(Create_Carbine_Magnetic_Schematic(default.CarbineMagneticSchematic));
	Schematics.AddItem(Create_SAW_Magnetic_Schematic(default.SAWMagneticSchematic));
	return Schematics;
}

static function Create_Magnetic_Schematic(out X2SchematicTemplate Template)
{
	Template.ItemCat = 'weapon';
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 2;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
}

static function X2DataTemplate Create_BattleRifle_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Rifle";
	Template.Requirements.RequiredEngineeringScore = 10;
	
	Template.ItemsToUpgrade.AddItem('BattleRifle_CV');
	Template.ReferenceItemTemplate = 'BattleRifle_MG';
	Template.HideIfPurchased = 'BattleRifle_BM';

	CreateTemplateCost(Template, default.BattleRifle_Magnetic_Schematic_SupplyCost, default.BattleRifle_Magnetic_Schematic_AlloyCost, default.BattleRifle_Magnetic_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SMG_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_SMG.magnetic.Inv_LWMagSMG";
	Template.Requirements.RequiredEngineeringScore = 10;

	Template.ItemsToUpgrade.AddItem('SMG_CV');
	Template.ReferenceItemTemplate = 'SMG_MG';
	Template.HideIfPurchased = 'SMG_BM';

	CreateTemplateCost(Template, default.SMG_Magnetic_Schematic_SupplyCost, default.SMG_Magnetic_Schematic_AlloyCost, default.SMG_Magnetic_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_MarksmanRifle_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Sniper_Rifle"; // Don't know what img to use here
	Template.Requirements.RequiredEngineeringScore = 15;

	Template.ItemsToUpgrade.AddItem('MarksmanRifle_CV');
	Template.ReferenceItemTemplate = 'MarksmanRifle_MG';
	Template.HideIfPurchased = 'MarksmanRifle_BM';

	CreateTemplateCost(Template, default.MarksmanRifle_Magnetic_Schematic_SupplyCost, default.MarksmanRifle_Magnetic_Schematic_AlloyCost, default.MarksmanRifle_Magnetic_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_LMG_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // Don't know what img to use here
	Template.Requirements.RequiredEngineeringScore = 15;

	Template.ItemsToUpgrade.AddItem('LMG_CV');
	Template.ReferenceItemTemplate = 'LMG_MG';
	Template.HideIfPurchased = 'LMG_BM';

	CreateTemplateCost(Template, default.LMG_Magnetic_Schematic_SupplyCost, default.LMG_Magnetic_Schematic_AlloyCost, default.LMG_Magnetic_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_Carbine_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // Don't know what img to use here
	Template.Requirements.RequiredEngineeringScore = 10;

	Template.ItemsToUpgrade.AddItem('Carbine_CV');
	Template.ReferenceItemTemplate = 'Carbine_MG';
	Template.HideIfPurchased = 'Carbine_BM';

	CreateTemplateCost(Template, default.Carbine_Magnetic_Schematic_SupplyCost, default.Carbine_Magnetic_Schematic_AlloyCost, default.Carbine_Magnetic_Schematic_EleriumCost);
	return Template;
}

static function X2DataTemplate Create_SAW_Magnetic_Schematic(name TemplateName)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);
	Create_Magnetic_Schematic(Template);
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base"; // Don't know what img to use here
	Template.Requirements.RequiredEngineeringScore = 15;

	Template.ItemsToUpgrade.AddItem('SAW_CV');
	Template.ReferenceItemTemplate = 'SAW_MG';
	Template.HideIfPurchased = 'SAW_BM';

	CreateTemplateCost(Template, default.SAW_Magnetic_Schematic_SupplyCost, default.SAW_Magnetic_Schematic_AlloyCost, default.SAW_Magnetic_Schematic_EleriumCost);
	return Template;
}