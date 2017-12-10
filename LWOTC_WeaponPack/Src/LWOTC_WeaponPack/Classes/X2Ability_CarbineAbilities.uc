//---------------------------------------------------------------------------------------
//  FILE:    X2Ability_CarbineAbilities.uc
//  AUTHOR:  BibiFloris
//  PURPOSE: Adds stat modifier abilities for all tech tiers of Carbine
//           
//---------------------------------------------------------------------------------------
class X2Ability_CarbineAbilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(LW_WeaponPack);
	
// ***** Mobility bonuses for Carbines
var config int Carbine_CONVENTIONAL_MOBILITY_BONUS;
var config int Carbine_LASER_MOBILITY_BONUS;
var config int Carbine_MAGNETIC_MOBILITY_BONUS;
var config int Carbine_COIL_MOBILITY_BONUS;
var config int Carbine_BEAM_MOBILITY_BONUS;

// *****Aim bonuses for Carbines
var config float Carbine_CONVENTIONAL_AimBonus;
var config float Carbine_LASER_AimBonus;
var config float Carbine_MAGNETIC_AimBonus;
var config float Carbine_COIL_AimBonus;
var config float Carbine_BEAM_AimBonus;

/// Creates the abilities that add passive Mobility and aim for Carbines
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(AddCarbineConventionalBonusAbility());
	//Templates.AddItem(AddCarbineMagneticBonusAbility());
	//Templates.AddItem(AddCarbineCoilBonusAbility());
	//Templates.AddItem(AddCarbineBeamBonusAbility());
	//Templates.AddItem(AddCarbineLaserBonusAbility());

	return Templates;
}

// ******************* Stat Bonuses **********************

static function X2AbilityTemplate AddCarbineConventionalBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Carbine_CV_StatBonus');
	Template.IconImage = "img:///gfxXComIcons.NanofiberVest";  // TODO : replace with Carbine Bonus HP icon? may not need, since icon is hidden

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Carbine_CONVENTIONAL_MOBILITY_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.Carbine_CONVENTIONAL_AimBonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}


