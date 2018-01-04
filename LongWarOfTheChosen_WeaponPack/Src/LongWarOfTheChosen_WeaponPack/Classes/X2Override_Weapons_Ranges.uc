class X2Override_Weapons_Ranges extends X2Override_LongWar config(LongWar_WeaponPack_RangeOverride);

var config array<int> SHOTGUN_RANGE;
var config array<int> PISTOL_RANGE;
var config array<int> SMG_RANGE;
var config array<int> CARBINE_RANGE;
var config array<int> RIFLE_RANGE;
var config array<int> BATTLE_RIFLE_RANGE;
var config array<int> MARKSMAN_RIFLE_RANGE;
var config array<int> SNIPER_RIFLE_RANGE;

static function UpdateStockWeaponRanges(X2ItemTemplateManager ItemTemplateManager)
{
	ChangeRangeOnWeapon(ItemTemplateManager, 'AssaultRifle_CV', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'AssaultRifle_LS', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'AssaultRifle_MG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'AssaultRifle_CG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'AssaultRifle_BM', default.RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'BattleRifle_CV', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'BattleRifle_LS', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'BattleRifle_MG', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'BattleRifle_CG', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'BattleRifle_BM', default.BATTLE_RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Bullpup_CV', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Bullpup_LS', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Bullpup_MG', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Bullpup_CG', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Bullpup_BM', default.CARBINE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Cannon_CV', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Cannon_LS', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Cannon_MG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Cannon_CG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Cannon_BM', default.RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Carbine_CV', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Carbine_LS', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Carbine_MG', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Carbine_CG', default.CARBINE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Carbine_BM', default.CARBINE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'LMG_CV', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'LMG_LS', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'LMG_MG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'LMG_CG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'LMG_BM', default.RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'MarksmanRifle_CV', default.MARKSMAN_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'MarksmanRifle_LS', default.MARKSMAN_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'MarksmanRifle_MG', default.MARKSMAN_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'MarksmanRifle_CG', default.MARKSMAN_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'MarksmanRifle_BM', default.MARKSMAN_RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Sidearm_CV', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Sidearm_LS', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Sidearm_MG', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Sidearm_CG', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Sidearm_BM', default.SMG_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Pistol_CV', default.PISTOL_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Pistol_LS', default.PISTOL_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Pistol_MG', default.PISTOL_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Pistol_CG', default.PISTOL_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Pistol_BM', default.PISTOL_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'SAW_CV', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SAW_LS', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SAW_MG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SAW_CG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SAW_BM', default.RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'Shotgun_CV', default.SHOTGUN_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Shotgun_LS', default.SHOTGUN_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Shotgun_MG', default.SHOTGUN_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Shotgun_CG', default.SHOTGUN_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'Shotgun_BM', default.SHOTGUN_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'SMG_CV', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SMG_LS', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SMG_MG', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SMG_CG', default.SMG_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SMG_BM', default.SMG_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'SniperRifle_CV', default.SNIPER_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SniperRifle_LS', default.SNIPER_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SniperRifle_MG', default.SNIPER_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SniperRifle_CG', default.SNIPER_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SniperRifle_BM', default.SNIPER_RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'SparkRifle_CV', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SparkRifle_LS', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SparkRifle_MG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SparkRifle_CG', default.RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'SparkRifle_BM', default.RIFLE_RANGE);

	ChangeRangeOnWeapon(ItemTemplateManager, 'VektorRifle_CV', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'VektorRifle_LS', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'VektorRifle_MG', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'VektorRifle_CG', default.BATTLE_RIFLE_RANGE);
	ChangeRangeOnWeapon(ItemTemplateManager, 'VektorRifle_BM', default.BATTLE_RIFLE_RANGE);
}

static function ChangeRangeOnWeapon(X2ItemTemplateManager ItemTemplateManager, Name TemplateName, array<int> rangeValues)
{
	local X2WeaponTemplate Template;

	Template = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate(TemplateName));
	if(Template == none)
	{
		`Redscreen("LWOTC: Failed to find weapon template " $ string(TemplateName));
		return;
	}

	Template.RangeAccuracy = rangeValues;
}