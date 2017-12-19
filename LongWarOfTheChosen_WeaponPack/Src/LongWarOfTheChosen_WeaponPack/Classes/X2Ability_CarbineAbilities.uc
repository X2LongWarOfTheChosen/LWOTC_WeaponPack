class X2Ability_CarbineAbilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(LW_WeaponPack);

var config int Carbine_Mobility_Bonus;
var config string Carbine_Mobility_Bonus_Icon;

var name CarbineBonusAbility;

DefaultProperties
{
	CarbineBonusAbility="CarbineBonusAbility"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(AddCarbineBonusAbility());
	return Templates;
}

static function X2AbilityTemplate AddCarbineBonusAbility()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.CarbineBonusAbility);
	Template.IconImage = "img:///" $ default.Carbine_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Carbine_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}