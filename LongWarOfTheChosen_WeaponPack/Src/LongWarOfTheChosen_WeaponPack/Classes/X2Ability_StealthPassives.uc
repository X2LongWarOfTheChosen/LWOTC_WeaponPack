class X2Ability_StealthPassives extends XMBAbility
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);

struct DetectionModifier
{
	var string Affix;
	var float Modifier;
};

var config array<DetectionModifier> DetectionModifiers;

var string DetectionModifier_Icon;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	local DetectionModifier Mod;

	foreach default.DetectionModifiers(Mod)
	{
		`LOG("LWOTC_WeaponPack - Creating Detection Modifier with affix '" $ Mod.Affix $ "' and strength " $ string(Mod.Modifier) $ "f");
		Templates.AddItem(AddDetectionModifierAbility(Mod.Affix, Mod.Modifier));
	}
	
	return Templates;
}
	
static function X2AbilityTemplate AddDetectionModifierAbility(string Affix, float Modifier)
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, name('LWOTC_DetectionModifier_' $ Affix));
	Template.IconImage = "img:///" $ default.DetectionModifier_Icon;

	//`LOG("LWOTC_WeaponPack - Creating Detection Modifier with affix '" $ Affix $ "' and strength " $ string(Modifier) $ "f");

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, Modifier);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
 