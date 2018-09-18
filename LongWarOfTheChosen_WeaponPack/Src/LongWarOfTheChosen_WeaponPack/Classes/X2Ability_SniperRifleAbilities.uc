class X2Ability_SniperRifleAbilities extends XMBAbility config (LongWar_WeaponPack_SniperRifle);

var config int PRECISION_SHOT_COOLDOWN;
var config int PRECISION_SHOT_AMMO_COST;
var config int PRECISION_SHOT_CRIT_BONUS;
var config int PRECISION_SHOT_CRIT_DAMAGE_PERCENT_BONUS;

var config int SNAPSHOT_COOLDOWN;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddMarksmanRiflePrecisionShot());
	Templates.AddItem(AddSniperRifleSnapshot());

	return Templates;
}

static function X2AbilityTemplate AddMarksmanRiflePrecisionShot()
{
	local X2AbilityTemplate				Template;
	local X2Condition_Visibility		SurpriseCondition;

	// Create the template using a helper function
	Template = Attack('LWOTC_MarksmanRiflePrecisionShot', "img:///UILibrary_LW_PerkPack.LW_AbilityPrecisionShot", true, none, class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY, eCost_WeaponConsumeAll, default.PRECISION_SHOT_AMMO_COST);

	// Add a cooldown.
	AddCooldown(Template, default.PRECISION_SHOT_COOLDOWN);

	// Add a secondary ability to provide bonuses on the shot
	AddSecondaryAbility(Template, PrecisionShotBonuses());

	// Precision Shot can only be used while the user is concealed to the target or at squadsight
	SurpriseCondition = new class'X2Condition_Visibility';
	SurpriseCondition.bExcludeGameplayVisible = true;
	Template.AbilityTargetConditions.AddItem(SurpriseCondition);

	return Template;
}

// This is part of the Precision Shot effect, above
static function X2AbilityTemplate PrecisionShotBonuses()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_AbilityName Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LW2WotC_PrecisionShot_Bonuses';
    
	// The bonus increases crit chance
	Effect.AddToHitModifier(default.PRECISION_SHOT_CRIT_BONUS, eHit_Crit);

	// The bonus increases crit damage by a percentage
	Effect.AddPercentDamageModifier(default.PRECISION_SHOT_CRIT_DAMAGE_PERCENT_BONUS, eHit_Crit);

	// The bonus only applies to the Precision Shot ability
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('LWotC_MarksmanRiflePrecisionShot');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('LW2WotC_PrecisionShot_Bonuses', "img:///UILibrary_LW_PerkPack.LW_Ability_PrecisionShot", false, Effect);

	// Precision Shot will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

	return Template;
}


static function X2AbilityTemplate AddSniperRifleSnapshot()
{
	local X2AbilityTemplate				Template;
	local X2AbilityCost_ActionPoints	Cost;

	// Create the template using a helper function
	Template = Attack('LWOTC_SniperRifleSnapshot', "img:///UILibrary_LW_PerkPack.LW_AbilitySnapShot", true, none, class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY, eCost_SingleConsumeAll, default.PRECISION_SHOT_AMMO_COST);

	// Add a cooldown.
	AddCooldown(Template, default.SNAPSHOT_COOLDOWN);

	// Only show SnapShot if StandardShot is not available
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('SniperStandardFire');

	// Applies the aim penalty at extreme distances
	AddSecondaryAbility(Template, SnapShotAimModifier());

	return Template;
}

// This is part of the SnapShot effect, above
static function X2AbilityTemplate SnapShotAimModifier()
{
	local X2AbilityTemplate 			Template;
	local X2Effect_LWOTC_SnapShotPenalties Effect;

	// This effect lowers the user's aim at extreme ranges when using SnapShot
	Effect = new class'X2Effect_LWOTC_SnapShotPenalties';

	// Create the template using a helper function
	Template = Passive('LWOTC_SnapShotPenalties', "img:///UILibrary_LW_PerkPack.LW_AbilitySnapShot", false, Effect);

	// SnapShot will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

	return Template;
}