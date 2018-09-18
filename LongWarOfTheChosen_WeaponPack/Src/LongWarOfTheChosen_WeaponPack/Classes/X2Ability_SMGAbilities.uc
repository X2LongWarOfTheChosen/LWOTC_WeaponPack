class X2Ability_SMGAbilities extends XMBAbility
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);
	
var config int SMG_Mobility_Bonus;
var config float SMG_Detection_Radius_Modifier;
var config string SMG_Mobility_Bonus_Icon;

var name SMGBonusAbility;

DefaultProperties
{
	SMGBonusAbility="SMGBonusAbility"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddSMGStrafingShot());
	Templates.AddItem(AddSMGBonusAbility());
	return Templates;
}

static function X2AbilityTemplate AddSMGStrafingShot()
{
	local X2Effect_LWOTC_StrafingShot				HitandRunEffect;
	local X2AbilityTemplate							Template;

	HitandRunEffect = new class'X2Effect_LWotC_StrafingShot';
	HitandRunEffect.DuplicateResponse = eDupe_Ignore;

	// Create the template using a helper function
	Template = Passive('LWOTC_SMG_StrafingShot', "img:///UILibrary_LW_PerkPack.LW_AbilityHitandRun", false, HitandRunEffect);

	Template.bDontDisplayInAbilitySummary = false;
	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;

	return Template;
}

static function X2AbilityTemplate AddSMGBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.SMGBonusAbility);
	Template.IconImage = "img:///" $ default.SMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.SMG_Mobility_Bonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SMG_Detection_Radius_Modifier);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
