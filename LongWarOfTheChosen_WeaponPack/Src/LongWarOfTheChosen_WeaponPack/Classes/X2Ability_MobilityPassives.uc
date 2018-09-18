class X2Ability_MobilityPassives extends XMBAbility
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);

var config int Highest_Mobility_Bonus;
var config int Highest_Mobility_Penalty;
var config string Mobility_Bonus_Icon;
var config string Mobility_Penalty_Icon;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	local int i;

	for(i = 0; i < default.Highest_Mobility_Bonus; i++)
	{
		Templates.AddItem(AddMobilityBonusAbility(i + 1));
	}

	for(i = 0; i < default.Highest_Mobility_Penalty; i++)
	{
		Templates.AddItem(AddMobilityPenaltyAbility(i + 1));
	}
	
	return Templates;
}

static function X2AbilityTemplate AddMobilityBonusAbility(int Bonus)
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, name('LWOTC_MobilityBonus_' $ Bonus));
	Template.IconImage = "img:///" $ default.Mobility_Bonus_Icon;

	`LOG("LWOTC_WeaponPack - Creating Mobility Bonus with strength " $ string(Bonus));

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

static function X2AbilityTemplate AddMobilityPenaltyAbility(int Penalty)
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, name('LWOTC_MobilityPenalty_' $ Penalty));
	Template.IconImage = "img:///" $ default.Mobility_Penalty_Icon;

	`LOG("LWOTC_WeaponPack - Creating Mobility Penalty with strength " $ string(Penalty));

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -Penalty);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}