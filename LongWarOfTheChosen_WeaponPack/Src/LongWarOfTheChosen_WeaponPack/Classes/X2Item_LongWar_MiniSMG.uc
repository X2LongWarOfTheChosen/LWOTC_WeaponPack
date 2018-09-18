class X2Item_LongWar_MiniSMG extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_MiniSMG);

var config array<WeaponDamageValue> MiniSMG_Damage;
var config array<int> MiniSMG_Aim;
var config array<int> MiniSMG_CritChance;
var config array<int> MiniSMG_ClipSize;
var config array<int> MiniSMG_SoundRange;
var config array<int> MiniSMG_EnvironmentDamage;
var config array<int> MiniSMG_SellValue;
var config array<int> MiniSMG_UpgradeSlots;
var config array<int> MiniSMG_SupplyCost;
var config array<int> MiniSMG_AlloyCost;
var config array<int> MiniSMG_EleriumCost;
var config array<int> MiniSMG_Engineering;
var config array<name> MiniSMG_RequiredTech;
var config array<string> MiniSMG_ImagePath;
var config array<int> MiniSMG_Mobility;

var name MiniSMGLaser;
var name MiniSMGCoil;

var bool CreateNewMachinePistols;

var config array<name> CommonAbilities;
var config array<name> BallisticAbilities;
var config array<name> LaserAbilities;
var config array<name> MagneticAbilities;
var config array<name> CoilgunAbilities;
var config array<name> PlasmaAbilities;

var config bool RemoveStandardShot;
var config bool RemoveOverwatch;
var config bool RemoveReload;

defaultproperties
{
	MiniSMGLaser = "Sidearm_LS"
	MiniSMGCoil = "Sidearm_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	if(default.CreateNewMachinePistols)
	{
		Weapons.AddItem(Create_MiniSMG_Laser(default.MiniSMGLaser));
		Weapons.AddItem(Create_MiniSMG_Coil(default.MiniSMGCoil));
	}

	return Weapons;
}

static function Create_MiniSMG_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

	//Default Settings
	Template.WeaponCat = 'sidearm';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_MiniSMG';
	Template.strImage = "img:///" $ default.MiniSMG_ImagePath[tier];
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Assign_Tier_Values(Template);
	// Overrides
	Template.WeaponPanelImage = "_Pistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Beam";

	//Abilities
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	if(!default.RemoveStandardShot)
	{
		Template.Abilities.AddItem('PistolStandardShot');
	}
	if(!default.RemoveOverwatch)
	{
		Template.Abilities.AddItem('PistolOverwatch');
	}
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');

	foreach default.CommonAbilities(Ability)
	{
		Template.Abilities.AddItem(Ability);
	}
	
	if(default.MiniSMG_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.MiniSMG_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.MiniSMG_Mobility[tier]);
	}
	if(default.MiniSMG_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.MiniSMG_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.MiniSMG_Mobility[tier]);
	}


	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotConvA');

	//Stats
	Template.BaseDamage = default.MiniSMG_Damage[tier];
	Template.Aim = default.MiniSMG_Aim[tier];
	Template.CritChance = default.MiniSMG_CritChance[tier];
	Template.iClipSize = default.MiniSMG_ClipSize[tier];
	Template.iSoundRange = default.MiniSMG_SoundRange[tier];
	Template.iEnvironmentDamage = default.MiniSMG_EnvironmentDamage[tier];
	Template.TradingPostValue = default.MiniSMG_SellValue[tier];
	Template.NumUpgradeSlots = default.MiniSMG_UpgradeSlots[tier];
}

static function X2DataTemplate Create_MiniSMG_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MiniSMG_Template(Template, 1);
	Template.RangeAccuracy = default.SHORT_LASER_RANGE;

	// Model
	Template.GameArchetype = "WP_TemplarAutoPistol_MG.WP_TemplarAutoPistol_MG";

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Sidearm_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Sidearm_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.MiniSMG_RequiredTech[Template.Tier], 
			default.MiniSMG_SupplyCost[Template.Tier], default.MiniSMG_AlloyCost[Template.Tier], 
			default.MiniSMG_EleriumCost[Template.Tier], default.MiniSMG_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_MiniSMG_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_MiniSMG_Template(Template, 3);
	Template.RangeAccuracy = default.SHORT_COIL_RANGE;
	
	// Model
	Template.GameArchetype = "WP_TemplarAutoPistol_MG.WP_TemplarAutoPistol_MG";

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Sidearm_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Sidearm_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.MiniSMG_RequiredTech[Template.Tier], 
			default.MiniSMG_SupplyCost[Template.Tier], default.MiniSMG_AlloyCost[Template.Tier], 
			default.MiniSMG_EleriumCost[Template.Tier], default.MiniSMG_Engineering[Template.Tier]);
	}
	return Template;
}