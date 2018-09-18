class X2Ability_LMGAbilities extends XMBAbility
	dependson (XComGameStateContext_Ability) config(LongWar_WeaponPack_Abilities);

var config int LMG_Aim_Bonus_When_Mounted;
var config string Mount_LMG_Ability_Icon;

var config int Spray_Aim_Penalty;
var config int Spray_Crit_Penalty;
var config float Spray_Damage_Penalty;
var config int Spray_Ammo_Cost;

var config string LMG_Mobility_Bonus_Icon;
var config int Conv_Cannon_Mobility_Bonus;
var config int Mag_Cannon_Mobility_Bonus;
var config int Laser_Cannon_Mobility_Bonus;
var config int Coil_Cannon_Mobility_Bonus;
var config int Beam_Cannon_Mobility_Bonus;

var name MountedEffectName;

var config int AREA_SUPPRESSION_AMMO_COST;
var config int AREA_SUPPRESSION_MAX_SHOTS;
var config int AREA_SUPPRESSION_SHOT_AMMO_COST;
var config float AREA_SUPPRESSION_RADIUS;
var config int AREA_SUPPRESSION_LW_SHOT_AIM_BONUS;
var config array<name> SUPPRESSION_LW_INVALID_WEAPON_CATEGORIES;
var config float DANGER_ZONE_BONUS_RADIUS;

DefaultProperties
{
	MountedEffectName="MountLMG"
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddConvCannonBonusAbility());
	Templates.AddItem(AddMagCannonBonusAbility());
	Templates.AddItem(AddLaserCannonBonusAbility());
	Templates.AddItem(AddCoilCannonBonusAbility());
	Templates.AddItem(AddBeamCannonBonusAbility());
	Templates.AddItem(AddLMG_MountAbility());
	Templates.AddItem(AreaSuppression());
    Templates.AddItem(AreaSuppressionShot()); //Additional Ability
	Templates.AddItem(AddFullReloadCannonAbility());
	Templates.AddItem(AddMountedLMGShot());
	Templates.AddItem(AddNonMountedLMGShot());

	return Templates;
}

static function X2AbilityTemplate AddConvCannonBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWOTC_ConvCannonBonusAbility');
	Template.IconImage = "img:///" $ default.LMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Conv_Cannon_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddMagCannonBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWOTC_MagCannonBonusAbility');
	Template.IconImage = "img:///" $ default.LMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Mag_Cannon_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddLaserCannonBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWOTC_LaserCannonBonusAbility');
	Template.IconImage = "img:///" $ default.LMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Laser_Cannon_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddCoilCannonBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWOTC_CoilCannonBonusAbility');
	Template.IconImage = "img:///" $ default.LMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Coil_Cannon_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate AddBeamCannonBonusAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWOTC_BeamCannonBonusAbility');
	Template.IconImage = "img:///" $ default.LMG_Mobility_Bonus_Icon;

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
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.Beam_Cannon_Mobility_Bonus);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
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

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWotC_MountLMG');

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

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = HunkerDownAbility_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate AddNonMountedLMGShot()
{
	local X2AbilityTemplate				Template;
	local X2Condition_UnitEffects		MountedCondition;

	Template = Attack('LWOTC_LMG_NonMountedShot', "", false, none, class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY, eCost_SingleConsumeAll, default.Spray_Ammo_Cost);

	MountedCondition = new class'X2Condition_UnitEffects';
	MountedCondition.AddExcludeEffect(default.MountedEffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(MountedCondition);

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('LWOTC_LMG_MountedShot');

	AddSecondaryAbility(Template, NonMountedLMGShotPenalties());

	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	return Template;
}

static function X2AbilityTemplate NonMountedLMGShotPenalties()
{
	local X2AbilityTemplate				Template;
	local XMBEffect_ConditionalBonus	Effect;
	local XMBCondition_AbilityName		Condition;

	// Create a conditional bonus effect
	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LW2WotC_PrecisionShot_Bonuses';
    
	// Spray decreases hit chance
	Effect.AddToHitModifier(default.Spray_Aim_Penalty);

	// Spray can also decrease crit chance
	Effect.AddToHitModifier(default.Spray_Crit_Penalty, eHit_Crit);

	// Spray can also decrease damage
	Effect.AddPercentDamageModifier(default.Spray_Damage_Penalty);

	// The bonus only applies to the Precision Shot ability
	Condition = new class'XMBCondition_AbilityName';
	Condition.IncludeAbilityNames.AddItem('LWotC_LMG_NonMountedShot');
	Effect.AbilityTargetConditions.AddItem(Condition);

	// Create the template using a helper function
	Template = Passive('LWotC_LMG_NonMountedShot_Penalties', "", false, Effect);

	// The main Shot will show up as an active ability, so hide the icon for the passive damage effect
	HidePerkIcon(Template);

	return Template;
}

static function X2AbilityTemplate AddMountedLMGShot()
{
	local X2AbilityTemplate				Template;
	local X2Condition_UnitEffects		MountedCondition;

	Template = Attack('LWOTC_LMG_MountedShot', "", false, none, class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY, eCost_SingleConsumeAll);

	MountedCondition = new class'X2Condition_UnitEffects';
	MountedCondition.AddRequireEffect(default.MountedEffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(MountedCondition);

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('LWOTC_LMG_NonMountedShot');

	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	return Template;
}

simulated function HunkerDownAbility_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          InteractingUnitRef;
	local X2AbilityTemplate             AbilityTemplate;
	local XComGameState_Unit            UnitState;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;
	local int EffectIndex;
	local name ApplyResult;

	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************	
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	UnitState = XComGameState_Unit(ActionMetadata.StateObject_NewState);
	
	//Civilians on the neutral team are not allowed to have sound + flyover for hunker down
	if( UnitState.GetTeam() != eTeam_Neutral )
	{
		
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		if (UnitState.HasSoldierAbility('SharpshooterAim'))
		{
			AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate('SharpshooterAim');
		}
		else if (UnitState.HasSoldierAbility('DeepCover') && XComGameState_Unit(ActionMetadata.StateObject_OldState).ActionPoints.Find(class'X2CharacterTemplateManager'.default.DeepCoverActionPoint) != INDEX_NONE)
		{
			AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate('DeepCover');
		}
		else
		{
			AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);
		}
		SoundAndFlyOver.SetSoundAndFlyOverParameters(SoundCue'SoundUI.HunkerDownCue', AbilityTemplate.LocFlyOverText, 'HunkerDown', eColor_Good, AbilityTemplate.IconImage, 1.0, true);
	}
	//****************************************************************************************
}

static function X2AbilityTemplate AreaSuppression()
{
    local X2AbilityTemplate                             Template;
    local X2AbilityCost_Ammo                            AmmoCost;
    local X2AbilityCost_ActionPoints                    ActionPointCost;
    local X2AbilityMultiTarget_Radius                   RadiusMultiTarget;
    local X2Effect_ReserveActionPoints                  ReserveActionPointsEffect;
    local X2Condition_UnitInventory                     InventoryCondition, InventoryCondition2;
    local X2Effect_LW2WotC_AreaSuppression              SuppressionEffect;
    local X2AbilityTarget_Single                        PrimaryTarget;
    local AbilityGrantedBonusRadius                     DangerZoneBonus;
    local X2Condition_UnitProperty                      ShooterCondition;
	local X2Condition_UnitEffects						MountedCondition;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'LWotC_CannonAreaSuppression');
    Template.IconImage = "img:///UILibrary_LW_PerkPack.LW_AreaSuppression";
    Template.AbilitySourceName = 'eAbilitySource_Perk';
    Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
    Template.Hostility = eHostility_Offensive;
    Template.bDisplayInUITooltip = false;
    Template.AbilityToHitCalc = default.DeadEye;
    Template.bCrossClassEligible = false;
    Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
    Template.ActivationSpeech='Suppressing';
    Template.bIsASuppressionEffect = true;
	Template.bFriendlyFireWarning = false;

    Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);   
    Template.AddShooterEffectExclusions();
    
	// Cannot use while suppressed, if configured
	HandleSuppressionRestriction(Template);

    ShooterCondition = new class'X2Condition_UnitProperty';
    ShooterCondition.ExcludeConcealed = true;
    Template.AbilityShooterConditions.AddItem(ShooterCondition);

	MountedCondition = new class'X2Condition_UnitEffects';
	MountedCondition.AddRequireEffect(default.MountedEffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(MountedCondition);

    Template.AssociatedPassives.AddItem('HoloTargeting');

    AmmoCost = new class'X2AbilityCost_Ammo';   
    AmmoCost.iAmmo = default.AREA_SUPPRESSION_AMMO_COST;
    Template.AbilityCosts.AddItem(AmmoCost);

    ActionPointCost = new class'X2AbilityCost_ActionPoints';
    ActionPointCost.bConsumeAllPoints = true;   //  this will guarantee the unit has at least 1 action point
    ActionPointCost.bFreeCost = true;           //  ReserveActionPoints effect will take all action points away
    Template.AbilityCosts.AddItem(ActionPointCost);

    ReserveActionPointsEffect = new class'X2Effect_ReserveActionPoints';
    ReserveActionPointsEffect.ReserveType = 'Suppression';
    ReserveActionPointsEffect.NumPoints = default.AREA_SUPPRESSION_MAX_SHOTS;
    Template.AddShooterEffect(ReserveActionPointsEffect);

    Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
    Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

    PrimaryTarget = new class'X2AbilityTarget_Single';
    PrimaryTarget.OnlyIncludeTargetsInsideWeaponRange = false;
    PrimaryTarget.bAllowInteractiveObjects = false;
    PrimaryTarget.bAllowDestructibleObjects = false;
    PrimaryTarget.bIncludeSelf = false;
    PrimaryTarget.bShowAOE = true;
    Template.AbilityTargetSTyle = PrimaryTarget;

    RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.bIgnoreBlockingCover = true;
    RadiusMultiTarget.bAllowDeadMultiTargetUnits = false;
    RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
    RadiusMultiTarget.bUseWeaponRadius = false;
    RadiusMultiTarget.ftargetradius = default.AREA_SUPPRESSION_RADIUS;
    
    DangerZoneBonus.RequiredAbility = 'LW2WotC_DangerZone';
    DangerZoneBonus.fBonusRadius = default.DANGER_ZONE_BONUS_RADIUS;
    RadiusMultiTarget.AbilityBonusRadii.AddItem (DangerZoneBonus);
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;
    
    Template.AbilityMultiTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);

    SuppressionEffect = new class'X2Effect_LW2WotC_AreaSuppression';
    SuppressionEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    SuppressionEffect.bRemoveWhenTargetDies = true;
    SuppressionEffect.bRemoveWhenSourceDamaged = true;
    SuppressionEffect.bBringRemoveVisualizationForward = true;
    SuppressionEffect.DuplicateResponse=eDupe_Allow;
    SuppressionEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, class'X2Ability_GrenadierAbilitySet'.default.SuppressionTargetEffectDesc, Template.IconImage);
    SuppressionEffect.SetSourceDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, class'X2Ability_GrenadierAbilitySet'.default.SuppressionSourceEffectDesc, Template.IconImage);
    Template.AddTargetEffect(SuppressionEffect);
    Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
    Template.AddMultiTargetEffect(SuppressionEffect);
    Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
    
    Template.AdditionalAbilities.AddItem('LW2WotC_AreaSuppressionShot');
    Template.AdditionalAbilities.AddItem('LW2WotC_Lockdown_Bonuses');
    Template.AdditionalAbilities.AddItem('LW2WotC_Mayhem_Bonuses');

    Template.TargetingMethod = class'X2TargetingMethod_LW2WotC_AreaSuppression';

    Template.BuildVisualizationFn = AreaSuppressionBuildVisualization_LW;
    Template.BuildAppliedVisualizationSyncFn = AreaSuppressionBuildVisualizationSync;
    Template.CinescriptCameraType = "StandardSuppression";  
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

    Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

    return Template;
}

//Adds multitarget visualization
simulated function AreaSuppressionBuildVisualization_LW(XComGameState VisualizeGameState)
{
    local XComGameStateHistory History;
    local XComGameStateContext_Ability  Context;
    local StateObjectReference          InteractingUnitRef;
    local VisualizationActionMetadata      EmptyTrack;
    local VisualizationActionMetadata        BuildTrack;
    local XComGameState_Ability         Ability;
    local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

    History = `XCOMHISTORY;

    Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
    InteractingUnitRef = Context.InputContext.SourceObject;

    //Configure the visualization track for the shooter
    //****************************************************************************************
    BuildTrack = EmptyTrack;
    BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
    BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
    
    class'X2Action_ExitCover'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded);
    class'X2Action_StartSuppression'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded);
    //****************************************************************************************
    //Configure the visualization track for the primary target

    InteractingUnitRef = Context.InputContext.PrimaryTarget;
    Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1));
    BuildTrack = EmptyTrack;
    BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
    BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
    BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
    SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded));
    SoundAndFlyOver.SetSoundAndFlyOverParameters(None, Ability.GetMyTemplate().LocFlyOverText, '', eColor_Bad);
    if (XComGameState_Unit(BuildTrack.StateObject_OldState).ReserveActionPoints.Length != 0 && XComGameState_Unit(BuildTrack.StateObject_NewState).ReserveActionPoints.Length == 0)
    {
        SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded));
        SoundAndFlyOver.SetSoundAndFlyOverParameters(none, class'XLocalizedData'.default.OverwatchRemovedMsg, '', eColor_Bad);
    }

    //Configure for the rest of the targets in AOE Suppression
    if (Context.InputContext.MultiTargets.Length > 0)
    {
        foreach Context.InputContext.MultiTargets(InteractingUnitRef)
        {
            Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1));
            BuildTrack = EmptyTrack;
            BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
            BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
            BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
            SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded));
            SoundAndFlyOver.SetSoundAndFlyOverParameters(None, Ability.GetMyTemplate().LocFlyOverText, '', eColor_Bad);
            if (XComGameState_Unit(BuildTrack.StateObject_OldState).ReserveActionPoints.Length != 0 && XComGameState_Unit(BuildTrack.StateObject_NewState).ReserveActionPoints.Length == 0)
            {
                SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(BuildTrack, Context, false, BuildTrack.LastActionAdded));
                SoundAndFlyOver.SetSoundAndFlyOverParameters(none, class'XLocalizedData'.default.OverwatchRemovedMsg, '', eColor_Bad);
            }
        }
    }
}

simulated function AreaSuppressionBuildVisualizationSync(name EffectName, XComGameState VisualizeGameState, out VisualizationActionMetadata BuildTrack)
{
    local X2Action_ExitCover ExitCover;

    if (EffectName == class'X2Effect_LW2WotC_AreaSuppression'.default.EffectName)
    {
        ExitCover = X2Action_ExitCover(class'X2Action_ExitCover'.static.AddToVisualizationTree( BuildTrack, VisualizeGameState.GetContext(), false, BuildTrack.LastActionAdded ));
        ExitCover.bIsForSuppression = true;

        class'X2Action_StartSuppression'.static.AddToVisualizationTree( BuildTrack, VisualizeGameState.GetContext(), false, BuildTrack.LastActionAdded );
    }
}

// Ability for the shot that fires from LW2WotC_AreaSuppression
static function X2AbilityTemplate AreaSuppressionShot()
{
    local X2AbilityTemplate                 Template;   
    local X2AbilityCost_ReserveActionPoints ReserveActionPointCost;
    local X2AbilityToHitCalc_StandardAim    StandardAim;
    local X2Condition_Visibility            TargetVisibilityCondition;
    //local X2AbilityTrigger_Event            Trigger;
    local X2AbilityTrigger_EventListener    Trigger;
    local X2Condition_UnitEffectsWithAbilitySource TargetEffectCondition;
    local X2Effect_LW2WotC_RemoveAreaSuppressionEffect  RemoveAreaSuppression;
    local X2Effect                          ShotEffect;
    local X2AbilityCost_Ammo                AmmoCost;

    `CREATE_X2ABILITY_TEMPLATE(Template, 'LWotC_CannonAreaSuppressionShot');

    Template.bDontDisplayInAbilitySummary = true;
    ReserveActionPointCost = new class'X2AbilityCost_ReserveActionPoints';
    ReserveActionPointCost.iNumPoints = 1;
    ReserveActionPointCost.AllowedTypes.AddItem('Suppression');
    Template.AbilityCosts.AddItem(ReserveActionPointCost);
    
    AmmoCost = new class'X2AbilityCost_Ammo';   
    AmmoCost.iAmmo = default.AREA_SUPPRESSION_SHOT_AMMO_COST;
    Template.AbilityCosts.AddItem(AmmoCost);

    StandardAim = new class'X2AbilityToHitCalc_StandardAim';
    StandardAim.BuiltInHitMod = default.AREA_SUPPRESSION_LW_SHOT_AIM_BONUS;
    StandardAim.bReactionFire = true;

    Template.AbilityToHitCalc = StandardAim;
    Template.AbilityToHitOwnerOnMissCalc = StandardAim;

    Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

    TargetEffectCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
    TargetEffectCondition.AddRequireEffect(class'X2Effect_LW2WotC_AreaSuppression'.default.EffectName, 'AA_UnitIsNotSuppressed');
    Template.AbilityTargetConditions.AddItem(TargetEffectCondition);

    TargetVisibilityCondition = new class'X2Condition_Visibility';  
    TargetVisibilityCondition.bRequireGameplayVisible = true;
    Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

    Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
    Template.bAllowAmmoEffects = true;

    // this handles the logic for removing just from the target (if should continue), or removing from all targets if running out of ammo
    RemoveAreaSuppression = new class'X2Effect_LW2WotC_RemoveAreaSuppressionEffect';
    RemoveAreaSuppression.EffectNamesToRemove.AddItem(class'X2Effect_LW2WotC_AreaSuppression'.default.EffectName);
    RemoveAreaSuppression.bCheckSource =  true;
    RemoveAreaSuppression.SetupEffectOnShotContextResult(true, true);
    Template.AddTargetEffect(RemoveAreaSuppression);

    Template.AbilityTargetStyle = default.SimpleSingleTarget;

    //Trigger on movement - interrupt the move
    //Trigger = new class'X2AbilityTrigger_Event';
    //Trigger.EventObserverClass = class'X2TacticalGameRuleset_MovementObserver';
    //Trigger.MethodName = 'InterruptGameState';
    //Template.AbilityTriggers.AddItem(Trigger);

    //Trigger on movement - interrupt the move
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'ObjectMoved';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
    Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalOverwatchListener;
	Template.AbilityTriggers.AddItem(Trigger);

    Template.AbilitySourceName = 'eAbilitySource_Standard';
    Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
    Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_supression";
    Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
    Template.bDisplayInUITooltip = false;
    Template.bDisplayInUITacticalText = false;

    //don't want to exit cover, we are already in suppression/alert mode.
    Template.bSkipExitCoverWhenFiring = true;

    Template.bAllowFreeFireWeaponUpgrade = true;    
//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
    ShotEffect = class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect();
    ShotEffect.TargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());
    Template.AddTargetEffect(ShotEffect);
    //  Various Soldier ability specific effects - effects check for the ability before applying    
    ShotEffect = class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect();
    ShotEffect.TargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());
    Template.AddTargetEffect(ShotEffect);
    
    Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
    Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

    Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

    return Template;    
}

static function X2AbilityTemplate AddFullReloadCannonAbility()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          ShooterPropertyCondition;
	local X2Condition_AbilitySourceWeapon   WeaponCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local array<name>                       SkipExclusions;
	local X2Condition_UnitInventory			InventoryCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LWotC_CannonFullReload');
	
	Template.bDontDisplayInAbilitySummary = false;
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 2;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';	
	ShooterPropertyCondition.ExcludeDead = true;                    //Can't reload while dead
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);
	WeaponCondition = new class'X2Condition_AbilitySourceWeapon';
	WeaponCondition.WantsReload = true;
	Template.AbilityShooterConditions.AddItem(WeaponCondition);
	Template.DefaultKeyBinding = class'UIUtilities_Input'.const.FXS_KEY_R;

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	InventoryCondition = new class'X2Condition_UnitInventory';
	InventoryCondition.RelevantSlot=eInvSlot_PrimaryWeapon;
	InventoryCondition.RequireWeaponCategory = 'cannon';
	Template.AbilityShooterConditions.AddItem(InventoryCondition);

	Template.AbilityToHitCalc = default.DeadEye;
	
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reload";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.bNoConfirmationWithHotKey = true;
	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;
	Template.DisplayTargetHitChance = false;

	Template.ActivationSpeech = 'Reloading';

	Template.BuildNewGameStateFn = FullReloadCannonAbility_BuildGameState;
	Template.BuildVisualizationFn = SingleReloadAbility_BuildVisualization;

	Template.Hostility = eHostility_Neutral;

	Template.CinescriptCameraType="GenericAccentCam";
	//Template.OverrideAbilityAvailabilityFn = Reload_OverrideAbilityAvailability;

	return Template;	
}

simulated function XComGameState FullReloadCannonAbility_BuildGameState( XComGameStateContext Context )
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Ability AbilityState;
	local XComGameState_Item WeaponState, NewWeaponState;
	local array<X2WeaponUpgradeTemplate> WeaponUpgrades;
	local bool bFreeReload;
	local int i;

	NewGameState = `XCOMHISTORY.CreateNewGameState(true, Context);	
	AbilityContext = XComGameStateContext_Ability(Context);	
	AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID( AbilityContext.InputContext.AbilityRef.ObjectID ));

	WeaponState = AbilityState.GetSourceWeapon();
	NewWeaponState = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', WeaponState.ObjectID));

	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));	

	//  check for free reload upgrade
	bFreeReload = false;
	WeaponUpgrades = WeaponState.GetMyWeaponUpgradeTemplates();
	for (i = 0; i < WeaponUpgrades.Length; ++i)
	{
		if (WeaponUpgrades[i].FreeReloadCostFn != none && WeaponUpgrades[i].FreeReloadCostFn(WeaponUpgrades[i], AbilityState, UnitState))
		{
			bFreeReload = true;
			break;
		}
	}
	if (!bFreeReload)
		AbilityState.GetMyTemplate().ApplyCost(AbilityContext, AbilityState, UnitState, NewWeaponState, NewGameState);	

	//  refill the weapon's ammo	
	NewWeaponState.Ammo = NewWeaponState.GetClipSize();
	
	return NewGameState;	
}

simulated function SingleReloadAbility_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          ShootingUnitRef;	
	local X2Action_PlayAnimation		PlayAnimation;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	local XComGameState_Ability Ability;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	ShootingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(ShootingUnitRef.ObjectID);
					
	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimation.Params.AnimName = 'HL_Reload';

	Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID));
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", Ability.GetMyTemplate().ActivationSpeech, eColor_Good);

		//****************************************************************************************
}