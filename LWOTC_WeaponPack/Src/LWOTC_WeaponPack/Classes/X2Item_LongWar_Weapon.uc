class X2Item_LongWar_Weapon extends X2Item config(LongWar_WeaponPack_Range);

var config array<int> SHORT_LASER_RANGE;
var config array<int> SHORT_COIL_RANGE;

var config array<int> MIDSHORT_CONVENTIONAL_RANGE;
var config array<int> MIDSHORT_LASER_RANGE;
var config array<int> MIDSHORT_MAGNETIC_RANGE;
var config array<int> MIDSHORT_COIL_RANGE;
var config array<int> MIDSHORT_BEAM_RANGE;

var config array<int> MEDIUM_CONVENTIONAL_RANGE;
var config array<int> MEDIUM_LASER_RANGE;
var config array<int> MEDIUM_MAGNETIC_RANGE;
var config array<int> MEDIUM_COIL_RANGE;
var config array<int> MEDIUM_BEAM_RANGE;

var config array<int> MEDLONG_CONVENTIONAL_RANGE;
var config array<int> MEDLONG_LASER_RANGE;
var config array<int> MEDLONG_MAGNETIC_RANGE;
var config array<int> MEDLONG_COIL_RANGE;
var config array<int> MEDLONG_BEAM_RANGE;

var config array<int> LONG_LASER_RANGE;
var config array<int> LONG_COIL_RANGE;

var config array<int> VEKTOR_LASER_RANGE;
var config array<int> VEKTOR_COIL_RANGE;

static function CreateTemplateCost(out X2WeaponTemplate Template, name requiredTech, int supplyCost, int alloyCost, int eleriumCost, int engineeringCost)
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
	Template.Requirements.RequiredTechs.AddItem(requiredTech);
	Template.Requirements.RequiredEngineeringScore = engineeringCost;
}

static function bool BuildWeaponSchematics(out X2WeaponTemplate Template)
{
	local bool UseSchematics;

	if (Template.Tier == 1)
	{
		UseSchematics = class'X2Item_LaserSchematics'.default.USE_SCHEMATICS;

	}
	else if (Template.Tier == 3)
	{
		UseSchematics = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	}
	else
	{
		// Bail out if not a custom tier for some reason
		return false;
	}

	Template.CanBeBuilt = !UseSchematics;
	Template.bInfiniteItem = UseSchematics;
	return UseSchematics;
}

static function Assign_Tier_Values(out X2WeaponTemplate Template)
{
	if (Template.Tier == 0)
	{
		Template.WeaponTech = 'conventional';
		Template.EquipSound = "Conventional_Weapon_Equip";
		Template.DamageTypeTemplateName = 'Projectile_Conventional';
		Template.WeaponPanelImage = "_ConventionalRifle";
	}
	if (Template.Tier == 1)
	{
		Template.WeaponTech = 'beam'; //'pulse'; // TODO: fix up any effects that rely on hard-coded techs
		Template.EquipSound = "Beam_Weapon_Equip";
		Template.DamageTypeTemplateName = 'Projectile_BeamXCom';  // TODO : update with new damage type
		Template.WeaponPanelImage = "_BeamRifle"; // used by the UI. Probably determines iconview of the weapon.
	}
	if (Template.Tier == 2)
	{
		Template.WeaponTech = 'magnetic';
		Template.EquipSound = "Magnetic_Weapon_Equip";
		Template.DamageTypeTemplateName = 'Projectile_MagXCom';
		Template.WeaponPanelImage = "_MagneticRifle";
	}
	if (Template.Tier == 3)
	{
		Template.WeaponTech = 'coilgun_lw';
		Template.EquipSound = "Magnetic_Weapon_Equip";
		Template.WeaponPanelImage = "";
		Template.DamageTypeTemplateName = 'Projectile_MagXCom';
	}
	if (Template.Tier == 4)
	{
		Template.WeaponTech = 'beam';
		Template.EquipSound = "Beam_Weapon_Equip";
		Template.DamageTypeTemplateName = 'Projectile_BeamXCom';
		Template.WeaponPanelImage = "_BeamRifle";
	}
}