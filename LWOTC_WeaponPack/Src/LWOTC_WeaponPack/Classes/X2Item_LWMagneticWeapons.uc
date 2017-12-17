//---------------------------------------------------------------------------------------
//  FILE:    X2Item_LWMagneticWeapons.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Defines weapon templates and updates base-game upgrade templates for Laser Weapons
//
//---------------------------------------------------------------------------------------
class X2Item_LWMagneticWeapons extends X2Item config(LW_WeaponPack);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****
var config WeaponDamageValue BATTLERIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue SMG_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue LMG_MAGNETIC_BASEDAMAGE;

// ***** Core properties and variables for weapons *****
var config int BATTLERIFLE_MAGNETIC_AIM;
var config int BATTLERIFLE_MAGNETIC_CRITCHANCE;
var config int BATTLERIFLE_MAGNETIC_ICLIPSIZE;
var config int BATTLERIFLE_MAGNETIC_ISOUNDRANGE;
var config int BATTLERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_MAGNETIC_TRADINGPOST;
var config int BATTLERIFLE_MAGNETIC_IPOINTS;
var config int BATTLERIFLE_MAGNETIC_UPGRADESLOTS;

var config int SMG_MAGNETIC_AIM;
var config int SMG_MAGNETIC_CRITCHANCE;
var config int SMG_MAGNETIC_ICLIPSIZE;
var config int SMG_MAGNETIC_ISOUNDRANGE;
var config int SMG_MAGNETIC_IENVIRONMENTDAMAGE;
var config int SMG_MAGNETIC_ISUPPLIES;
var config int SMG_MAGNETIC_TRADINGPOSTVALUE;
var config int SMG_MAGNETIC_IPOINTS;
var config int SMG_MAGNETIC_UPGRADESLOTS;

var config int MARKSMANRIFLE_MAGNETIC_AIM;
var config int MARKSMANRIFLE_MAGNETIC_CRITCHANCE;
var config int MARKSMANRIFLE_MAGNETIC_ICLIPSIZE;
var config int MARKSMANRIFLE_MAGNETIC_ISOUNDRANGE;
var config int MARKSMANRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_MAGNETIC_TRADINGPOST;
var config int MARKSMANRIFLE_MAGNETIC_IPOINTS;
var config int MARKSMANRIFLE_MAGNETIC_UPGRADESLOTS;

var config int LMG_MAGNETIC_AIM;
var config int LMG_MAGNETIC_CRITCHANCE;
var config int LMG_MAGNETIC_ICLIPSIZE;
var config int LMG_MAGNETIC_ISOUNDRANGE;
var config int LMG_MAGNETIC_IENVIRONMENTDAMAGE;
var config int LMG_MAGNETIC_TRADINGPOST;
var config int LMG_MAGNETIC_IPOINTS;
var config int LMG_MAGNETIC_UPGRADESLOTS;

// ***** Range Modifier Tables *****
var config array<int> SHORT_MAGNETIC_RANGE;
var config array<int> MIDSHORT_MAGNETIC_RANGE;
var config array<int> MEDIUM_MAGNETIC_RANGE;
var config array<int> MEDLONG_MAGNETIC_RANGE;
var config array<int> LONG_MAGNETIC_RANGE;

// ***** Image Paths *****
var config string LMG_Magnetic_ImagePath;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	//create all three tech tiers of weapons
	Weapons.AddItem(CreateTemplate_BR_Magnetic());
	Weapons.AddItem(CreateTemplate_SMG_Magnetic());
	Weapons.AddItem(CreateTemplate_MR_Magnetic());
	Weapons.AddItem(CreateTemplate_LMG_Magnetic());

	return Weapons;
}

// **************************************************************************
// ***                        Battle Rifle                                ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_BR_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BR_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.Abilities.AddItem('BR_MG_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_BRAbilities'.default.BR_MAGNETIC_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MEDIUM_MAGNETIC_RANGE;
	Template.BaseDamage = default.BATTLERIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.BATTLERIFLE_MAGNETIC_AIM;
	Template.CritChance = default.BATTLERIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.BATTLERIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.BATTLERIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BATTLERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.BATTLERIFLE_MAGNETIC_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_BR_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_MG_OpticA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagShotgun.Meshes.SM_MagShotgun_StockA", , "img:///UILibrary_BRPack.Attach.BR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'BR_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'BR_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

// **************************************************************************
// ***                          SMG                                       ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_SMG_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SMG_MG');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SMG.magnetic.LWMagSMG_Base";
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.Abilities.AddItem('SMG_MG_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SMGAbilities'.default.SMG_MAGNETIC_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MIDSHORT_MAGNETIC_RANGE;
	Template.BaseDamage = default.SMG_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.SMG_MAGNETIC_AIM;
	Template.CritChance = default.SMG_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.SMG_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.SMG_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMG_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SMG_MAGNETIC_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWSMG_MG.WP_SMG_MG";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_MagA");
	Template.AddDefaultAttachment('Optic', "LWSMG_MG.Meshes.SK_LWMagSMG_OpticA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_OpticA");
	//turn off SuppressorA, as it is built in to the base mesh now
	//Template.AddDefaultAttachment('Suppressor', "LWSMG_MG.Meshes.SK_LWMagSMG_SuppressorA"); //, , "img://UILibrary_SMG.magnetic.LWMagSMG_SuppressorA"); // included with base
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_SMG.magnetic.LWMagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "LWSMG_MG.Meshes.SK_MagFlashLight");  // alternative -- use mag flashlight, unused in base-game, converted to skeletal mesh

	Template.iPhysicsImpulse = 5;

	//Template.UpgradeItem = 'SMG_BM';
	Template.CreatorTemplateName = 'SMG_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'SMG_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

// **************************************************************************
// ***                         Marksman Rifle                             ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_MR_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MR_MG');
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Base";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.MEDLONG_MAGNETIC_RANGE;
	Template.BaseDamage = default.MARKSMANRIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.MARKSMANRIFLE_MAGNETIC_AIM;
	Template.CritChance = default.MARKSMANRIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.MARKSMANRIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.MARKSMANRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MARKSMANRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.MARKSMANRIFLE_MAGNETIC_UPGRADESLOTS;
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_MR_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_MG_OpticA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagSniper.Meshes.SM_MagSniper_StockA", , "img:///UILibrary_BRPack.Attach.MR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'BR_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MR_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

// **************************************************************************
// ***                          LMG                                        ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_LMG_Magnetic()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'LMG_MG');
	Template.WeaponPanelImage = "_ConventionalRifle";	

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///" $ default.LMG_Magnetic_ImagePath;
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 2;

	Template.Abilities.AddItem(class'X2Ability_LMGAbilities'.default.MountedEffectName);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.LongOverwatchReserveActionPoint);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchEffect);	

	Template.RangeAccuracy = default.MEDLONG_MAGNETIC_RANGE;
	Template.BaseDamage = default.LMG_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.LMG_MAGNETIC_AIM + class'X2Ability_LMGAbilities'.default.LMG_AIM_BONUS_WHEN_NOT_SET_UP;;
	Template.CritChance = default.LMG_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.LMG_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.LMG_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.LMG_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.LMG_MAGNETIC_UPGRADESLOTS;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');	
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'LMG_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'LMG_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}
