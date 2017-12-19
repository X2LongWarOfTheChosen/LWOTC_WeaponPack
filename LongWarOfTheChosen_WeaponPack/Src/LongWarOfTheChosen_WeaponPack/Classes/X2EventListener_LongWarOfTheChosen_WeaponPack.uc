class X2EventListener_LongWarOfTheChosen_WeaponPack extends X2EventListener;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(CreateUnmountLMGTemplate());
	return Templates;
}

static function X2EventListenerTemplate CreateUnmountLMGTemplate()
{
	local X2EventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'UnmountLMG');

	Template.RegisterInTactical = true;
	Template.AddEvent('UnitMoveFinished', CheckForUnmountLMG);

	return Template;
}

static protected function EventListenerReturn CheckForUnmountLMG(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState NewGameState;
	local X2TacticalGameRuleset Ruleset;
	local XComGameState_Unit MovingUnit;
	local XComGameState_Effect MountedEffect;
	local XComGameState_Effect ToggleLongWatchEffect;
	local XComGameState_Effect SquadSightEffect;
	
	Ruleset = X2TacticalGameRuleset(`XCOMGAME.GameRuleset);
	MovingUnit = XComGameState_Unit(EventSource);
	MountedEffect = MovingUnit.GetUnitAffectedByEffectState(class'X2Ability_LMGAbilities'.default.MountedEffectName);

	if (MountedEffect != none && !MountedEffect.bRemoved)
	{
		ToggleLongWatchEffect = MovingUnit.GetUnitAffectedByEffectState(class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchEffect);
		SquadSightEffect = MovingUnit.GetUnitAffectedByEffectState(class'X2Effect_Squadsight'.default.EffectName);
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("RemoveMountedStatus");
		MountedEffect.RemoveEffect(NewGameState, GameState);
		ToggleLongWatchEffect.RemoveEffect(NewGameState, GameState);
		SquadSightEffect.RemoveEffect(NewGameState, GameState);
		Ruleset.SubmitGameState(NewGameState);
	}
	return ELR_NoInterrupt;
}
