class X2Ability_ShotgunAbilities extends XMBAbility
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);

var config int Conv_Shotgun_Bonus_Mobility;
var config int Laser_Shotgun_Bonus_Mobility;
var config int Mag_Shotgun_Bonus_Mobility;
var config int Coil_Shotgun_Bonus_Mobility;
var config int Beam_Shotgun_Bonus_Mobility;

var config string Mobility_Bonus_Icon;

var config int Shotgun_LowCoverPenalty;
var config int Shotgun_HighCoverPenalty;
var config array<int> Shotgun_CloseRangeDamage;
var config array<int> Shotgun_MidRangeDamage;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddMobilityBonusAbility('LWOTC_Shotgun_MobBonus_Conv', default.Conv_Shotgun_Bonus_Mobility));
	Templates.AddItem(AddMobilityBonusAbility('LWOTC_Shotgun_MobBonus_Laser', default.Laser_Shotgun_Bonus_Mobility));
	Templates.AddItem(AddMobilityBonusAbility('LWOTC_Shotgun_MobBonus_Mag', default.Mag_Shotgun_Bonus_Mobility));
	Templates.AddItem(AddMobilityBonusAbility('LWOTC_Shotgun_MobBonus_Coil', default.Coil_Shotgun_Bonus_Mobility));
	Templates.AddItem(AddMobilityBonusAbility('LWOTC_Shotgun_MobBonus_Beam', default.Beam_Shotgun_Bonus_Mobility));

	Templates.AddItem(AddProximityBonus('LWOTC_Shotgun_ProxBonus_CloseRange', 4, default.Shotgun_CloseRangeDamage));
	Templates.AddItem(AddProximityBonus('LWOTC_Shotgun_ProxBonus_MidRange', 8, default.Shotgun_MidRangeDamage));
	Templates.AddItem(AddLowCoverDamagePenalty());
	Templates.AddItem(AddHighCoverDamagePenalty());

	return Templates;
}

static function X2AbilityTemplate AddMobilityBonusAbility(name PerkName, int Bonus)
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, PerkName);
	Template.IconImage = "img:///" $ default.Mobility_Bonus_Icon;

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddProximityBonus(name PerkName, int Distance, array<int> DamageBonuses)
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LWOTC_Shotgun_ProximityBonus';

	Effect.AddDamageModifier(DamageBonuses[1], eHit_Success, 'conventional');
	Effect.AddDamageModifier(DamageBonuses[2], eHit_Success, 'magnetic');
	Effect.AddDamageModifier(DamageBonuses[3], eHit_Success, 'laser');
	Effect.AddDamageModifier(DamageBonuses[4], eHit_Success, 'coil');
	Effect.AddDamageModifier(DamageBonuses[5], eHit_Success, 'beam');

	Effect.AbilityTargetConditions.AddItem(TargetWithinTiles(Distance));

	// Create the template using a helper function
	Template = Passive(PerkName, "img:///UILibrary_LW_PerkPack.LW_AbilityCloseCombatSpecialist", false, Effect);

	Template.bDontDisplayInAbilitySummary = false;
	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;

	return Template;
}

static function X2AbilityTemplate AddLowCoverDamagePenalty()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_CoverType CoverCondition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LWOTC_Shotgun_LowCoverDamagePenalty';

	Effect.AddPercentDamageModifier(default.Shotgun_LowCoverPenalty);

	Effect.AbilityTargetConditions.AddItem(default.HalfCoverCondition);
	Effect.AbilityShooterConditions.AddItem(default.MatchingWeaponCondition);

	return Passive('LWOTC_Shotgun_LowCoverDamagePenalty', "img:///UILibrary_PerkIcons.UIPerk_command", true, Effect);
}

static function X2AbilityTemplate AddHighCoverDamagePenalty()
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;
	local XMBCondition_CoverType CoverCondition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LWOTC_Shotgun_HighCoverDamagePenalty';

	Effect.AddPercentDamageModifier(default.Shotgun_HighCoverPenalty);

	Effect.AbilityTargetConditions.AddItem(default.FullCoverCondition);
	Effect.AbilityShooterConditions.AddItem(default.MatchingWeaponCondition);

	return Passive('LWOTC_Shotgun_HighCoverDamagePenalty', "img:///UILibrary_PerkIcons.UIPerk_command", true, Effect);
}

