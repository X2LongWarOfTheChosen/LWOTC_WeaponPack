class X2Ability_LMGAbilities extends X2Ability_DefaultAbilitySet
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);

var config int LMG_Aim_Bonus_When_Mounted;
var config string Mount_LMG_Ability_Icon;

var name MountedEffectName;
var name MountLMGAbility;

DefaultProperties
{
	MountLMGAbility="MountLMGAbility"
	MountedEffectName="MountLMG"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddLMG_MountAbility());

	return Templates;
}

static function X2AbilityTemplate AddLMG_MountAbility()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_PlayerInput InputTrigger;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2Condition_UnitProperty ShooterPropertyCondition;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;
	local X2Effect_Persistent LongWatchToggleEffect;
	local X2Condition_UnitEffects MountedCondition;
	local X2Effect_Squadsight Squadsight;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.MountLMGAbility);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///" $ default.Mount_LMG_Ability_Icon;
	Template.ShotHUDPriority = 150;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;
	Template.Hostility = eHostility_Neutral;
	Template.CinescriptCameraType = "GenericAccentCam";
	Template.bDontDisplayInAbilitySummary = true;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';
	ShooterPropertyCondition.ExcludeNoCover = true;
	ShooterPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	MountedCondition = new class'X2Condition_UnitEffects';
	MountedCondition.AddExcludeEffect(default.MountedEffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(MountedCondition);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = default.MountedEffectName;
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.LMG_Aim_Bonus_When_Mounted);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	LongWatchToggleEffect = new class'X2Effect_Persistent';
	LongWatchToggleEffect.EffectName = class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchEffect;
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, false);
	Template.AddTargetEffect(LongWatchToggleEffect);

	Squadsight = new class'X2Effect_Squadsight';
	Squadsight.BuildPersistentEffect(1, true, true, true);
	Template.AddTargetEffect(Squadsight);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = HunkerDownAbility_BuildVisualization;

	return Template;
}
