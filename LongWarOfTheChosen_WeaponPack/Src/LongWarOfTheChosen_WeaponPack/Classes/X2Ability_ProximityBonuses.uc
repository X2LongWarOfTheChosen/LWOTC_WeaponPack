class X2Ability_ProximityBonuses extends XMBAbility config(LongWar_WeaponPack_Abilities);

struct ProximityBonus
{
	var string Affix;
	var int Distance;
	var array<int> Damage;
};

var config array<ProximityBonus> ProximityBonuses;

var string ProximityBonus_Icon;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	local ProximityBonus Bonus;

	foreach default.ProximityBonuses(Bonus)
	{
		`LOG("LWOTC_WeaponPack - Creating Proximity Bonus with affix '" $ Bonus.Affix $ "'");
		Templates.AddItem(AddProximityBonus(Bonus.Affix, Bonus.Distance, Bonus.Damage));
	}
	
	return Templates;
}

static function X2AbilityTemplate AddProximityBonus(string Affix, int Distance, array<int> DamageBonuses)
{
	local X2AbilityTemplate Template;
	local XMBEffect_ConditionalBonus Effect;

	Effect = new class'XMBEffect_ConditionalBonus';
	Effect.EffectName = 'LWOTC_Shotgun_ProximityBonus';

	Effect.AddDamageModifier(DamageBonuses[0], eHit_Success, 'conventional');
	Effect.AddDamageModifier(DamageBonuses[1], eHit_Success, 'magnetic');
	Effect.AddDamageModifier(DamageBonuses[2], eHit_Success, 'laser');
	Effect.AddDamageModifier(DamageBonuses[3], eHit_Success, 'coil');
	Effect.AddDamageModifier(DamageBonuses[4], eHit_Success, 'beam');

	Effect.AbilityTargetConditions.AddItem(TargetWithinTiles(Distance));

	// Create the template using a helper function
	Template = Passive(name('LWOTC_ProximityBonus_' $ Affix), "img:///UILibrary_LW_PerkPack.LW_AbilityCloseCombatSpecialist", false, Effect);

	Template.bDontDisplayInAbilitySummary = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	return Template;
}