class X2Item_LongWar_Bullpup extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_Bullpup);

var config array<WeaponDamageValue> Bullpup_Damage;
var config array<int> Bullpup_Aim;
var config array<int> Bullpup_CritChance;
var config array<int> Bullpup_ClipSize;
var config array<int> Bullpup_SoundRange;
var config array<int> Bullpup_EnvironmentDamage;
var config array<int> Bullpup_SellValue;
var config array<int> Bullpup_UpgradeSlots;
var config array<int> Bullpup_SupplyCost;
var config array<int> Bullpup_AlloyCost;
var config array<int> Bullpup_EleriumCost;
var config array<int> Bullpup_Engineering;
var config array<name> Bullpup_RequiredTech;
var config array<string> Bullpup_ImagePath;
var config array<int> Bullpup_Mobility;

var name BullpupLaser;
var name BullpupCoil;

var bool CreateNewBullpups;

var config array<name> CommonAbilities;
var config array<name> BallisticAbilities;
var config array<name> LaserAbilities;
var config array<name> MagneticAbilities;
var config array<name> CoilgunAbilities;
var config array<name> PlasmaAbilities;

var config bool RemoveStandardShot;
var config bool RemoveOverwatch;
var config bool RemoveReload;

defaultproperties
{
	BullpupLaser = "Bullpup_LS"
	BullpupCoil = "Bullpup_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	if(default.CreateNewBullpups)
	{
		Weapons.AddItem(Create_Bullpup_Laser(default.BullpupLaser));
		Weapons.AddItem(Create_Bullpup_Coil(default.BullpupCoil));
	}

	return Weapons;
}

static function Create_Bullpup_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

	//Default Settings
	Template.WeaponCat = 'bullpup';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
	Template.strImage = "img:///" $ default.Bullpup_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	
	if(!default.RemoveStandardShot)
	{
		Template.Abilities.AddItem('StandardShot');
	}
	if(!default.RemoveOverwatch)
	{
		Template.Abilities.AddItem('Overwatch');
	}
	if(!default.RemoveReload)
	{
		Template.Abilities.AddItem('Reload');
	}
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('HotLoadAmmo');

	foreach default.CommonAbilities(Ability)
	{
		Template.Abilities.AddItem(Ability);
	}
	
	if(default.Bullpup_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.Bullpup_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Bullpup_Mobility[tier]);
	}
	if(default.Bullpup_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.Bullpup_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Bullpup_Mobility[tier]);
	}

	//Stats
	Template.BaseDamage = default.Bullpup_Damage[tier];
	Template.Aim = default.Bullpup_Aim[tier];
	Template.CritChance = default.Bullpup_CritChance[tier];
	Template.iClipSize = default.Bullpup_ClipSize[tier];
	Template.iSoundRange = default.Bullpup_SoundRange[tier];
	Template.iEnvironmentDamage = default.Bullpup_EnvironmentDamage[tier];
	Template.TradingPostValue = default.Bullpup_SellValue[tier];
	Template.NumUpgradeSlots = default.Bullpup_UpgradeSlots[tier];
}

static function X2DataTemplate Create_Bullpup_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Bullpup_Template(Template, 1);
	Template.RangeAccuracy = default.SHORT_LASER_RANGE;

	// Model
	Template.GameArchetype = "WP_SkirmisherSMG_MG.WP_SkirmisherSMG_MG";
	Template.AddDefaultAttachment('Mag', "MagSMG.Meshes.SM_HOR_Mag_SMG_MagA", , "img:///UILibrary_XPACK_Common.MagSMG_MagazineA");
	Template.AddDefaultAttachment('Reargrip', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_StockA", , "img:///UILibrary_XPACK_Common.MagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_TriggerA", , "img:///UILibrary_XPACK_Common.MagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Bullpup_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Bullpup_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Bullpup_RequiredTech[Template.Tier], 
			default.Bullpup_SupplyCost[Template.Tier], default.Bullpup_AlloyCost[Template.Tier], 
			default.Bullpup_EleriumCost[Template.Tier], default.Bullpup_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Bullpup_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Bullpup_Template(Template, 3);
	Template.RangeAccuracy = default.SHORT_COIL_RANGE;

	// Model
	Template.GameArchetype = "WP_SkirmisherSMG_MG.WP_SkirmisherSMG_MG";
	Template.AddDefaultAttachment('Mag', "MagSMG.Meshes.SM_HOR_Mag_SMG_MagA", , "img:///UILibrary_XPACK_Common.MagSMG_MagazineA");
	Template.AddDefaultAttachment('Reargrip', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_StockA", , "img:///UILibrary_XPACK_Common.MagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_TriggerA", , "img:///UILibrary_XPACK_Common.MagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'BULLPUP_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'BULLPUP_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Bullpup_RequiredTech[Template.Tier], 
			default.Bullpup_SupplyCost[Template.Tier], default.Bullpup_AlloyCost[Template.Tier], 
			default.Bullpup_EleriumCost[Template.Tier], default.Bullpup_Engineering[Template.Tier]);
	}

	return Template;
}