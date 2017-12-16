//---------------------------------------------------------------------------------------
//  FILE:    X2Item_SMGSchematics.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Defines weapon templates and updates base-game upgrade templates for SMGs
//
//---------------------------------------------------------------------------------------
class X2Item_LWBeamWeapons extends X2Item config(LW_WeaponPack);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****
var config WeaponDamageValue BATTLERIFLE_BEAM_BASEDAMAGE;
var config WeaponDamageValue SMG_BEAM_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_BEAM_BASEDAMAGE;
var config WeaponDamageValue LMG_BEAM_BASEDAMAGE;

// ***** Core properties and variables for weapons *****

var config int BATTLERIFLE_BEAM_AIM;
var config int BATTLERIFLE_BEAM_CRITCHANCE;
var config int BATTLERIFLE_BEAM_ICLIPSIZE;
var config int BATTLERIFLE_BEAM_ISOUNDRANGE;
var config int BATTLERIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_BEAM_TRADINGPOST;
var config int BATTLERIFLE_BEAM_IPOINTS;
var config int BATTLERIFLE_BEAM_UPGRADESLOTS;

var config int SMG_BEAM_AIM;
var config int SMG_BEAM_CRITCHANCE;
var config int SMG_BEAM_ICLIPSIZE;
var config int SMG_BEAM_ISOUNDRANGE;
var config int SMG_BEAM_IENVIRONMENTDAMAGE;
var config int SMG_BEAM_ISUPPLIES;
var config int SMG_BEAM_TRADINGPOSTVALUE;
var config int SMG_BEAM_IPOINTS;
var config int SMG_BEAM_UPGRADESLOTS;

var config int MARKSMANRIFLE_BEAM_AIM;
var config int MARKSMANRIFLE_BEAM_CRITCHANCE;
var config int MARKSMANRIFLE_BEAM_ICLIPSIZE;
var config int MARKSMANRIFLE_BEAM_ISOUNDRANGE;
var config int MARKSMANRIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_BEAM_TRADINGPOST;
var config int MARKSMANRIFLE_BEAM_IPOINTS;
var config int MARKSMANRIFLE_BEAM_UPGRADESLOTS;

var config int LMG_BEAM_AIM;
var config int LMG_BEAM_CRITCHANCE;
var config int LMG_BEAM_ICLIPSIZE;
var config int LMG_BEAM_ISOUNDRANGE;
var config int LMG_BEAM_IENVIRONMENTDAMAGE;
var config int LMG_BEAM_TRADINGPOST;
var config int LMG_BEAM_IPOINTS;
var config int LMG_BEAM_UPGRADESLOTS;

// ***** Range Modifier Tables *****
var config array<int> SHORT_BEAM_RANGE;
var config array<int> MIDSHORT_BEAM_RANGE;
var config array<int> MEDIUM_BEAM_RANGE;
var config array<int> MEDLONG_BEAM_RANGE;
var config array<int> LONG_BEAM_RANGE;

// ***** Image Paths *****
var config string LMG_Beam_ImagePath;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	//create all three tech tiers of weapons
	Weapons.AddItem(CreateTemplate_BR_Beam());
	Weapons.AddItem(CreateTemplate_SMG_Beam());
	Weapons.AddItem(CreateTemplate_MR_Beam());
	Weapons.AddItem(CreateTemplate_LMG_Beam());

	return Weapons;
}

static function X2DataTemplate CreateTemplate_BR_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BR_BM');
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.BATTLERIFLE_BEAM_BASEDAMAGE;
	Template.Aim = default.BATTLERIFLE_BEAM_AIM;
	Template.CritChance = default.BATTLERIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = default.BATTLERIFLE_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.BATTLERIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BATTLERIFLE_BEAM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.BATTLERIFLE_BEAM_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_BR_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_BM_OpticA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'BR_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'BR_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	Template.Abilities.AddItem('BR_BM_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_BRAbilities'.default.BR_BEAM_MOBILITY_BONUS);

	return Template;
}

static function X2DataTemplate CreateTemplate_SMG_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SMG_BM');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_SMG.Beam.LWBeamSMG_Base";
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 4;

	Template.Abilities.AddItem('SMG_BM_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SMGAbilities'.default.SMG_BEAM_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MIDSHORT_BEAM_RANGE;
	Template.BaseDamage = default.SMG_BEAM_BASEDAMAGE;
	Template.Aim = default.SMG_BEAM_AIM;
	Template.CritChance = default.SMG_BEAM_CRITCHANCE;
	Template.iClipSize = default.SMG_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.SMG_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMG_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SMG_BEAM_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWSMG_BM.WP_SMG_BM";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_SMG.Beam.LWBeamSMG_MagA");
	//Template.AddDefaultAttachment('Suppressor', "LWSMG_BM.Meshes.SM_LWBeamSMG_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "LWSMG_BM.Meshes.SK_LWBeamSMG_CoreB", , "img:///UILibrary_SMG.Beam.LWBeamSMG_CoreA");
	Template.AddDefaultAttachment('HeatSink', "LWSMG_BM.Meshes.SK_LWBeamSMG_HeatsinkA", , "img:///UILibrary_SMG.Beam.LWBeamSMG_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'SMG_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'SMG_MG'; // Which item this will be upgraded from
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_MR_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MR_BM');
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Base";
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDLONG_BEAM_RANGE;
	Template.BaseDamage = default.MARKSMANRIFLE_BEAM_BASEDAMAGE;
	Template.Aim = default.MARKSMANRIFLE_BEAM_AIM;
	Template.CritChance = default.MARKSMANRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = default.MARKSMANRIFLE_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.MARKSMANRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MARKSMANRIFLE_BEAM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.MARKSMANRIFLE_BEAM_UPGRADESLOTS;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "BRPack.Archetypes.WP_BR_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_BM_OpticA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'MR_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MR_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

// **************************************************************************
// ***                          LMG                                        ***
// **************************************************************************
static function X2DataTemplate CreateTemplate_LMG_Beam()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'LMG_BM');
	Template.WeaponPanelImage = "_ConventionalRifle";	

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
Template.strImage = "img:///" $ default.LMG_Beam_ImagePath;
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.Abilities.AddItem(class'X2Ability_LMGAbilities'.default.MountedEffectName);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.LongOverwatchReserveActionPoint);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchEffect);	

	Template.RangeAccuracy = default.MEDLONG_BEAM_RANGE;
	Template.BaseDamage = default.LMG_BEAM_BASEDAMAGE;
	Template.Aim = default.LMG_BEAM_AIM + class'X2Ability_LMGAbilities'.default.LMG_AIM_BONUS_WHEN_NOT_SET_UP;
	Template.CritChance = default.LMG_BEAM_CRITCHANCE;
	Template.iClipSize = default.LMG_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.LMG_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.LMG_BEAM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.LMG_BEAM_UPGRADESLOTS;
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

	Template.CreatorTemplateName = 'LMG_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'LMG_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}

