//---------------------------------------------------------------------------------------
//  FILE:    X2Item_LWConventionalWeapons.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Defines weapon templates and updates base-game upgrade templates for Laser Weapons
//
//---------------------------------------------------------------------------------------
class X2Item_LWConventionalWeapons extends X2Item config(LW_WeaponPack);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****
var config WeaponDamageValue BATTLERIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue SMG_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue LMG_CONVENTIONAL_BASEDAMAGE;

// ***** Core properties and variables for weapons *****
var config int BATTLERIFLE_CONVENTIONAL_AIM;
var config int BATTLERIFLE_CONVENTIONAL_CRITCHANCE;
var config int BATTLERIFLE_CONVENTIONAL_ICLIPSIZE;
var config int BATTLERIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int BATTLERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int SMG_CONVENTIONAL_AIM;
var config int SMG_CONVENTIONAL_CRITCHANCE;
var config int SMG_CONVENTIONAL_ICLIPSIZE;
var config int SMG_CONVENTIONAL_ISOUNDRANGE;
var config int SMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int SMG_CONVENTIONAL_UPGRADESLOTS;

var config int MARKSMANRIFLE_CONVENTIONAL_AIM;
var config int MARKSMANRIFLE_CONVENTIONAL_CRITCHANCE;
var config int MARKSMANRIFLE_CONVENTIONAL_ICLIPSIZE;
var config int MARKSMANRIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int MARKSMANRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int LMG_CONVENTIONAL_AIM;
var config int LMG_CONVENTIONAL_CRITCHANCE;
var config int LMG_CONVENTIONAL_ICLIPSIZE;
var config int LMG_CONVENTIONAL_ISOUNDRANGE;
var config int LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int LMG_CONVENTIONAL_UPGRADESLOTS;

// ***** Range Modifier Tables *****
var config array<int> SHORT_CONVENTIONAL_RANGE;
var config array<int> MIDSHORT_CONVENTIONAL_RANGE;
var config array<int> MEDIUM_CONVENTIONAL_RANGE;
var config array<int> MEDLONG_CONVENTIONAL_RANGE;
var config array<int> LONG_CONVENTIONAL_RANGE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	//create all three tech tiers of weapons
	Weapons.AddItem(CreateTemplate_BR_Conventional());
	Weapons.AddItem(CreateTemplate_SMG_Conventional());
	Weapons.AddItem(CreateTemplate_MR_Conventional());
	Weapons.AddItem(CreateTemplate_LMG_Conventional());

	return Weapons;
}

// **********************************************************************************************************
// ***                                            Player Weapons                                          ***
// **********************************************************************************************************

static function X2DataTemplate CreateTemplate_BR_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BR_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";
	Template.Tier = 0;

	Template.Abilities.AddItem('BR_CV_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_BRAbilities'.default.BR_CONVENTIONAL_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.BATTLERIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.BATTLERIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.BATTLERIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.BATTLERIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.BATTLERIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BATTLERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.BATTLERIFLE_CONVENTIONAL_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_BR_CV";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_BRPack.Attach.BR_CV_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_CV_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvSniper.Meshes.SM_ConvSniper_StockA", , "img:///UILibrary_BRPack.Attach.BR_CV_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

// Initial SMG uses Assault Rifle model and artwork until new artwork is complete
static function X2DataTemplate CreateTemplate_SMG_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SMG_CV');
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_SMG.conventional.LWConvSMG_Base";
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.Tier = 0;

	Template.Abilities.AddItem('SMG_CV_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SMGAbilities'.default.SMG_CONVENTIONAL_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MIDSHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.SMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.SMG_CONVENTIONAL_AIM;
	Template.CritChance = default.SMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.SMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.SMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMG_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SMG_CONVENTIONAL_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWSMG_CV.WP_SMG_CV";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWSMG_CV.Meshes.SK_LWConvSMG_MagA", , "img:///UILibrary_SMG.conventional.LWConvSMG_MagA");
	Template.AddDefaultAttachment('Optic', "LWSMG_CV.Meshes.SK_LWConvSMG_OpticA", , "img:///UILibrary_SMG.conventional.LWConvSMG_OpticA");
	Template.AddDefaultAttachment('Stock', "LWSMG_CV.Meshes.SK_LWConvSMG_Stock");  // renamed to just 'Stock' when fixing seaming issues for TTP 52
	Template.AddDefaultAttachment('StockB', "", , "img:///UILibrary_SMG.conventional.LWConvSMG_StockA");  // attach image to StockB so it gets replaced with ugprade
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_SMG.conventional.LWConvSMG_TriggerA"); // re-use Assault Rifle trigger
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.bInfiniteItem = true;  // post-AlienHunters, Starting items are no longer assumed to be infinite
	Template.CanBeBuilt = false;

	//Template.UpgradeItem = 'SMG_MG';

	Template.fKnockbackDamageAmount = 4.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_MR_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MR_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";
	Template.Tier = 0;

	Template.RangeAccuracy = default.MEDLONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.MARKSMANRIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.MARKSMANRIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.MARKSMANRIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.MARKSMANRIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.MARKSMANRIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MARKSMANRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.MARKSMANRIFLE_CONVENTIONAL_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_MR_CV";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_BRPack.Attach.BR_CV_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_CV_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockA", , "img:///UILibrary_BRPack.Attach.MR_CV_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

// **************************************************************************
// ***                          LMG										  ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_LMG_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'LMG_CV');
	Template.WeaponPanelImage = "_ConventionalRifle";
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;

	Template.Abilities.AddItem('LMG_CV_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_LMGAbilities'.default.LMG_CONVENTIONAL_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MEDLONG_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.LMG_CONVENTIONAL_AIM;
	Template.CritChance = default.LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.LMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.LMG_CONVENTIONAL_UPGRADESLOTS;

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

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
		
	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}
