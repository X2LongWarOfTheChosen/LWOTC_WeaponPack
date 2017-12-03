//---------------------------------------------------------------------------------------
//  FILE:   X2Item_BR_MR_Pack.uc
//---------------------------------------------------------------------------------------
class X2Item_BR_MR_Pack extends X2Item config(LW_WeaponPack);

var config WeaponDamageValue BATTLERIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue BATTLERIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue BATTLERIFLE_BEAM_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_BEAM_BASEDAMAGE;

var config int BATTLERIFLE_CONVENTIONAL_AIM;
var config int BATTLERIFLE_CONVENTIONAL_CRITCHANCE;
var config int BATTLERIFLE_CONVENTIONAL_ICLIPSIZE;
var config int BATTLERIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int BATTLERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int MARKSMANRIFLE_CONVENTIONAL_AIM;
var config int MARKSMANRIFLE_CONVENTIONAL_CRITCHANCE;
var config int MARKSMANRIFLE_CONVENTIONAL_ICLIPSIZE;
var config int MARKSMANRIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int MARKSMANRIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int BATTLERIFLE_MAGNETIC_AIM;
var config int BATTLERIFLE_MAGNETIC_CRITCHANCE;
var config int BATTLERIFLE_MAGNETIC_ICLIPSIZE;
var config int BATTLERIFLE_MAGNETIC_ISOUNDRANGE;
var config int BATTLERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_MAGNETIC_UPGRADESLOTS;

var config int MARKSMANRIFLE_MAGNETIC_AIM;
var config int MARKSMANRIFLE_MAGNETIC_CRITCHANCE;
var config int MARKSMANRIFLE_MAGNETIC_ICLIPSIZE;
var config int MARKSMANRIFLE_MAGNETIC_ISOUNDRANGE;
var config int MARKSMANRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_MAGNETIC_UPGRADESLOTS;

var config int BATTLERIFLE_BEAM_AIM;
var config int BATTLERIFLE_BEAM_CRITCHANCE;
var config int BATTLERIFLE_BEAM_ICLIPSIZE;
var config int BATTLERIFLE_BEAM_ISOUNDRANGE;
var config int BATTLERIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_BEAM_UPGRADESLOTS;

var config int MARKSMANRIFLE_BEAM_AIM;
var config int MARKSMANRIFLE_BEAM_CRITCHANCE;
var config int MARKSMANRIFLE_BEAM_ICLIPSIZE;
var config int MARKSMANRIFLE_BEAM_ISOUNDRANGE;
var config int MARKSMANRIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_BEAM_UPGRADESLOTS;

var config array<int> MEDIUM_CONVENTIONAL_RANGE;
var config array<int> MEDLONG_CONVENTIONAL_RANGE;
var config array<int> MEDIUM_MAGNETIC_RANGE;
var config array<int> MEDLONG_MAGNETIC_RANGE;
var config array<int> MEDIUM_BEAM_RANGE;
var config array<int> MEDLONG_BEAM_RANGE;

//Template classes are searched for by the game when it starts. Any derived classes have their CreateTemplates function called
//on the class default object. The game expects CreateTemplates to return a list of templates that it will add to the manager
//reponsible for those types of templates. Later, these templates will be automatically picked up by the game mechanics and systems.
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	local X2ItemTemplateManager ItemTemplateManager;

	Weapons.AddItem(CreateTemplate_BR_Conventional());
	Weapons.AddItem(CreateTemplate_BR_Magnetic());
	Weapons.AddItem(CreateTemplate_BR_Beam());

	Weapons.AddItem(CreateTemplate_MR_Conventional());
	Weapons.AddItem(CreateTemplate_MR_Magnetic());
	Weapons.AddItem(CreateTemplate_MR_Beam());
}

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
	
	Template.Abilities.AddItem('BR_BM_Stat_Bonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_BRAbilities'.default.BR_BEAM_MOBILITY_BONUS);

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

	Template.CreatorTemplateName = 'BR_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MR_MG'; // Which item this will be upgraded from
	
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}

static function AddCritUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticB", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticB", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticB", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticB", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticB", "", 'BR_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticB", "", 'MR_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_C", "", 'BR_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_C", "", 'MR_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticB", "img:///UILibrary_LW_LaserPack.Inv_Laser_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticB", "", 'BR_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticB", "", 'MR_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

}

static function AddAimBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticC", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticC", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticC", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "ConvSniper.Meshes.SM_ConvSniper_OpticC", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticC", "", 'BR_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "MagSniper.Meshes.SM_MagSniper_OpticC", "", 'MR_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_B", "", 'BR_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticC", "img:///UILibrary_LW_LaserPack.Inv_LaserSniper_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_B", "", 'MR_LS', , "img:///UILibrary_BRPack.Attach.BR_LS_OpticC", "img:///UILibrary_LW_LaserPack.Inv_LaserSniper_OpticB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticC", "", 'BR_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
	Template.AddUpgradeAttachment('Optic', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticC", "", 'MR_BM', , "img:///UILibrary_BRPack.Attach.BR_BM_OpticC", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_scope");
}

static function AddClipSizeBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
		
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoReloadUpgradePresent);

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_MagB", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagB", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagB", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddFreeFireBonusUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvReargripB", "", 'BR_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvReargripB", "", 'MR_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', '', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'BR_CV');
	Template.AddUpgradeAttachment('Trigger', '', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'MR_CV');

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	Template.AddUpgradeAttachment('Trigger', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvAttachments.Meshes.SM_ConvTriggerB", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_ReargripB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAttachments.Meshes.SM_MagReargripB", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAttachments.Meshes.SM_MagReargripB", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Trigger', '', "MagAttachments.Meshes.SM_MagTriggerB", "", 'BR_MG');
	Template.AddUpgradeAttachment('Trigger', '', "MagAttachments.Meshes.SM_MagTriggerB", "", 'MR_MG');

	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Reargrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Trigger_B", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerB", "img:///UILibrary_LW_LaserPack.Inv_Laser_TriggerB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	
	Template.AddUpgradeAttachment('Core', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreB", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_CoreB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreB", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_CoreB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core_Teeth', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_TeethA", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Teeth", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_Teeth_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	Template.AddUpgradeAttachment('Core_Teeth', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_TeethA", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_Teeth", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_Teeth_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
}

static function AddReloadUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagD", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagD", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagD", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "ConvSniper.Meshes.SM_ConvSniper_MagD", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
		
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.NoClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagD", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);
	Template.AddUpgradeAttachment('Mag', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagD", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagD", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip", class'X2Item_DefaultUpgrades'.static.ClipSizeUpgradePresent);

	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('Foregrip', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripB", "img:///UILibrary_LW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	
	Template.AddUpgradeAttachment('AutoLoader', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_AutoLoader", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
	Template.AddUpgradeAttachment('AutoLoader', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_AutoLoader", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
}

static function AddMissDamageUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvSniper.Meshes.SM_ConvSniper_StockB", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockB", "", 'MR_CV', , "img:///UILibrary_BRPack.Attach.MR_CV_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "ConvAttachments.Meshes.SM_ConvCrossbar", "", 'BR_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_CrossbarA", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "ConvAttachments.Meshes.SM_ConvCrossbar", "", 'MR_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_CrossbarA", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	
	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvAssaultRifle.Meshes.SM_ConvASsaultRifle_StockB", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "ConvShotgun.Meshes.SM_ConvShotgun_StockB", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
			
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "MagSniper.Meshes.SM_MagSniper_StockB", "", 'BR_MG', , "img:///UILibrary_BRPack.Attach.BR_MG_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "MagSniper.Meshes.SM_MagSniper_StockB", "", 'MR_MG', , "img:///UILibrary_BRPack.Attach.MR_MG_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_StockB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "MagAttachments.Meshes.SM_MagCrossbar", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Crossbar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "MagAttachments.Meshes.SM_MagCrossbar", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_Crossbar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);

	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Stock', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_B", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockB", "img:///UILibrary_LW_LaserPack.Inv_LaserShotgun_StockB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	Template.AddUpgradeAttachment('Crossbar', '', "LWAttachments_LS.Meshes.SK_Laser_Crossbar", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserShotgun_CrossBar", , , class'X2Item_DefaultUpgrades'.static.FreeFireUpgradePresent);
	
	Template.AddUpgradeAttachment('HeatSink', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatsinkB", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_HeatsinkB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	Template.AddUpgradeAttachment('HeatSink', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Stock', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatsinkB", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_HeatsinkB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
}

static function AddFreeKillUpgrade(X2ItemTemplateManager ItemTemplateManager, Name TemplateName)
{
	local X2WeaponUpgradeTemplate Template;

	Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none) 
	{
		`Redscreen("BattleRiflePack : Failed to find upgrade template " $ string(TemplateName));
		return;
	}

	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvShotgun.Meshes.SM_ConvShotgun_SuppressorB", "", 'BR_CV', , "img:///UILibrary_BRPack.Attach.BR_CV_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'MR_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	Template.AddUpgradeAttachment('', '', "", "", 'BR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('', '', "", "", 'MR_AW', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'MR_ETC', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'MR_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'MR_LS', , "img:///UILibrary_LW_LaserPack.LaserRifle_Suppressor", "img:///UILibrary_LW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'BR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'MR_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true;
}