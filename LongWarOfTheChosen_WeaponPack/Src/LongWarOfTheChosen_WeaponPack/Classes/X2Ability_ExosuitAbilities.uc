class X2Ability_ExosuitAbilities extends X2Ability config(LWOTC_ArmorStats);

var config int EXOSUIT_KEVLAR_HEALTH;
var config int EXOSUIT_KEVLAR_ABLATIVE;
var config int EXOSUIT_KEVLAR_ARMOR;
var config int EXOSUIT_KEVLAR_MOBILITY;
var config float EXOSUIT_KEVLAR_DETECTION;

var config int EXOSUIT_PLATED_HEALTH;
var config int EXOSUIT_PLATED_ABLATIVE;
var config int EXOSUIT_PLATED_ARMOR;
var config int EXOSUIT_PLATED_MOBILITY;
var config float EXOSUIT_PLATED_DETECTION;

var config int EXOSUIT_POWERED_HEALTH;
var config int EXOSUIT_POWERED_ABLATIVE;
var config int EXOSUIT_POWERED_ARMOR;
var config int EXOSUIT_POWERED_MOBILITY;
var config float EXOSUIT_POWERED_DETECTION;

var config int EXOSUIT_SMOKE_TILE_RADIUS;
var config int EXOSUIT_SMOKE_CHARGES;
var config int EXOSUIT_SMOKE_COOLDOWN;
var config int EXOSUIT_SMOKE_HITMOD;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(GunnerExosuitKevlarStats());
	Templates.AddItem(GunnerExosuitSmoke());
	Templates.AddItem(GunnerExosuitPlatedStats());
	Templates.AddItem(GunnerExosuitPoweredStats());

	return Templates;
}

static function X2AbilityTemplate GunnerExosuitKevlarStats()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GunnerExosuitKevlarStats');
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.EXOSUIT_KEVLAR_HEALTH);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.EXOSUIT_KEVLAR_ABLATIVE);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.EXOSUIT_KEVLAR_ARMOR);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.EXOSUIT_KEVLAR_MOBILITY);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.EXOSUIT_KEVLAR_DETECTION);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate GunnerExosuitPlatedStats()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GunnerExosuitPlatedStats');
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.EXOSUIT_PLATED_HEALTH);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.EXOSUIT_PLATED_ABLATIVE);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.EXOSUIT_PLATED_ARMOR);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.EXOSUIT_PLATED_MOBILITY);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.EXOSUIT_PLATED_DETECTION);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate GunnerExosuitSmoke()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2Effect_ApplySmokeGrenadeToWorld SmokeEffect;
	local X2AbilityCharges              Charges;
	local X2AbilityCost_Charges         ChargeCost;
	local X2AbilityCooldown                 Cooldown;
			
	`CREATE_X2ABILITY_TEMPLATE(Template, 'GunnerExosuitSmoke');
	//IconImage needs to be changed once there is an icon for this
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Defensive;
	
	Template.AbilityToHitCalc = default.DeadEye;

	Template.AbilityCosts.AddItem(default.FreeActionCost);
	
	//Triggered by player or AI
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	if(default.EXOSUIT_SMOKE_CHARGES > 0)
	{
		Charges = new class'X2AbilityCharges';
		Charges.InitialCharges = default.EXOSUIT_SMOKE_CHARGES;
		Template.AbilityCharges = Charges;

		ChargeCost = new class'X2AbilityCost_Charges';
		ChargeCost.NumCharges = default.EXOSUIT_SMOKE_CHARGES;
		Template.AbilityCosts.AddItem(ChargeCost);
	}

	if(default.EXOSUIT_SMOKE_COOLDOWN > 0)
	{
		Cooldown = new class'X2AbilityCooldown';
		Cooldown.iNumTurns = default.EXOSUIT_SMOKE_COOLDOWN;
		Template.AbilityCooldown = Cooldown;
	}

	//fire from self, with a radius amount
	Template.AbilityTargetStyle = default.SelfTarget;
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = default.EXOSUIT_SMOKE_TILE_RADIUS * class'XComWorldData'.const.WORLD_StepSize;
	RadiusMultiTarget.bIgnoreBlockingCover = false;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	SmokeEffect = new class'X2Effect_ApplySmokeGrenadeToWorld';	
	Template.AddTargetEffect(SmokeEffect);
	Template.AddTargetEffect(SmokeGrenadeEffect());
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = false;
	Template.bSkipFireAction = true;
	Template.ActivationSpeech = 'SmokeGrenade';
	
	return Template;
}

static function X2Effect SmokeGrenadeEffect()
{
	local X2Effect_SmokeGrenade Effect;

	Effect = new class'X2Effect_SmokeGrenade';
	//Must be at least as long as the duration of the smoke effect on the tiles. Will get "cut short" when the tile stops smoking or the unit moves. -btopp 2015-08-05
	Effect.BuildPersistentEffect(class'X2Effect_ApplySmokeGrenadeToWorld'.default.Duration + 1, false, false, false, eGameRule_PlayerTurnBegin);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayName, class'X2Item_DefaultGrenades'.default.SmokeGrenadeEffectDisplayDesc, "img:///UILibrary_PerkIcons.UIPerk_grenade_smoke");
	Effect.HitMod = default.EXOSUIT_SMOKE_HITMOD;
	Effect.DuplicateResponse = eDupe_Refresh;
	return Effect;
}

static function X2AbilityTemplate GunnerExosuitPoweredStats()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GunnerExosuitPoweredStats');
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	
	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
	
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	// PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, default.MediumPlatedHealthBonusName, default.MediumPlatedHealthBonusDesc, Template.IconImage);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, default.EXOSUIT_POWERED_HEALTH);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.EXOSUIT_POWERED_ABLATIVE);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, default.EXOSUIT_POWERED_ARMOR);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.EXOSUIT_POWERED_MOBILITY);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.EXOSUIT_POWERED_DETECTION);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}
