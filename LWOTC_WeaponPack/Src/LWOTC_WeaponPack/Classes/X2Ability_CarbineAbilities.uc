//---------------------------------------------------------------------------------------
//  FILE:    X2Ability_CarbineAbilities.uc
//  AUTHOR:  BibiFloris
//  PURPOSE: Adds stat modifier abilities for all tech tiers of Carbine
//
//---------------------------------------------------------------------------------------
class X2Ability_CarbineAbilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(LW_WeaponPack);

// ***** Mobility bonuses for CARBINEs
var config int CARBINE_CONVENTIONAL_MOBILITY_BONUS;
var config int CARBINE_LASER_MOBILITY_BONUS;
var config int CARBINE_MAGNETIC_MOBILITY_BONUS;
var config int CARBINE_COIL_MOBILITY_BONUS;
var config int CARBINE_BEAM_MOBILITY_BONUS;

// *****Aim bonuses for CARBINEs
var config float CARBINE_CONVENTIONAL_AIM_BONUS;
var config float CARBINE_LASER_AIM_BONUS;
var config float CARBINE_MAGNETIC_AIM_BONUS;
var config float CARBINE_COIL_AIM_BONUS;
var config float CARBINE_BEAM_AIM_BONUS;

/// Creates the abilities that add passive Mobility and aim for Carbines
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddCarbineConventionalBonusAbility());
	Templates.AddItem(AddCarbineLaserBonusAbility());
	Templates.AddItem(AddCarbineMagneticBonusAbility());
	Templates.AddItem(AddCarbineCoilBonusAbility());
	Templates.AddItem(AddCarbineBeamBonusAbility());

	return Templates;
}

// ******************* Stat Bonuses **********************

static function X2AbilityTemplate AddCarbineConventionalBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CARBINE_CV_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with CARBINE Bonus HP icon? may not need, since icon is hidden

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to Mobility and Offense stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.CARBINE_CONVENTIONAL_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.CARBINE_CONVENTIONAL_AIM_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddCarbineLaserBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CARBINE_LS_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with CARBINE Bonus HP icon? may not need, since icon is hidden

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to Mobility and Offense stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.CARBINE_LASER_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.CARBINE_LASER_AIM_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddCarbineMagneticBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CARBINE_MG_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with CARBINE Bonus HP icon? may not need, since icon is hidden

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to Mobility and Offense stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.CARBINE_MAGNETIC_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.CARBINE_MAGNETIC_AIM_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddCarbineCoilBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CARBINE_CG_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with CARBINE Bonus HP icon? may not need, since icon is hidden

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to Mobility and Offense stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.CARBINE_COIL_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.CARBINE_COIL_AIM_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddCarbineBeamBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CARBINE_BM_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with CARBINE Bonus HP icon? may not need, since icon is hidden

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to Mobility and Offense stat effects
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.CARBINE_BEAM_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.CARBINE_BEAM_AIM_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}
