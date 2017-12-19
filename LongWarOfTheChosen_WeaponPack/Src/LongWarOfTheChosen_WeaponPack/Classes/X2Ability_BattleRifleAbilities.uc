class X2Ability_BattleRifleAbilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);
	
var config int BattleRifle_MobilityBonus;
var config string BattleRifle_MobilityBonus_ImagePath;
var name BattleRifleStatBonusAbilityName;

DefaultProperties
{
	BattleRifleStatBonusAbilityName="BattleRifle_StatBonus"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(BattleRifleMobilityBonus());
	return Templates;
}

static function X2AbilityTemplate BattleRifleMobilityBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		BonusMobilityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.BattleRifleStatBonusAbilityName);
	Template.IconImage = "img:///" $ default.BattleRifle_MobilityBonus_ImagePath;

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	BonusMobilityEffect = new class'X2Effect_PersistentStatChange';
	BonusMobilityEffect.BuildPersistentEffect(1, true, false, false);
	BonusMobilityEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	BonusMobilityEffect.AddPersistentStatChange(eStat_Mobility, default.BattleRifle_MobilityBonus);
	Template.AddTargetEffect(BonusMobilityEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}