class X2Item_LongWar_Vektor extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_Vektor);

var config array<WeaponDamageValue> Vektor_Damage;
var config array<int> Vektor_Aim;
var config array<int> Vektor_CritChance;
var config array<int> Vektor_ClipSize;
var config array<int> Vektor_SoundRange;
var config array<int> Vektor_EnvironmentDamage;
var config array<int> Vektor_SellValue;
var config array<int> Vektor_UpgradeSlots;
var config array<int> Vektor_SupplyCost;
var config array<int> Vektor_AlloyCost;
var config array<int> Vektor_EleriumCost;
var config array<int> Vektor_Engineering;
var config array<name> Vektor_RequiredTech;
var config array<string> Vektor_ImagePath;

var name VektorLaser;
var name VektorCoil;

defaultproperties
{
	VektorLaser = "VektorRifle_LS"
	VektorCoil = "VektorRifle_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_Vektor_Laser(default.VektorLaser));
	Weapons.AddItem(Create_Vektor_Coil(default.VektorCoil));
	return Weapons;
}

static function Create_Vektor_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'vektor_rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.strImage = "img:///" $ default.Vektor_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	//Stats
	Template.BaseDamage = default.Vektor_Damage[tier];
	Template.Aim = default.Vektor_Aim[tier];
	Template.CritChance = default.Vektor_CritChance[tier];
	Template.iClipSize = default.Vektor_ClipSize[tier];
	Template.iSoundRange = default.Vektor_SoundRange[tier];
	Template.iEnvironmentDamage = default.Vektor_EnvironmentDamage[tier];
	Template.TradingPostValue = default.Vektor_SellValue[tier];
	Template.NumUpgradeSlots = default.Vektor_UpgradeSlots[tier];
}

static function X2DataTemplate Create_Vektor_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Vektor_Template(Template, 1);
	Template.RangeAccuracy = default.VEKTOR_LASER_RANGE;


	// Model
	Template.GameArchetype = "WP_ReaperRifle_MG.WP_ReaperRifle_MG";
	Template.AddDefaultAttachment('Mag', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.MagVektor_MagazineA");
	Template.AddDefaultAttachment('Optic', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.MagVektor_OpticA");
	Template.AddDefaultAttachment('Reargrip', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.MagVektor_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.MagVektor_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Vektor_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'VektorRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Vektor_RequiredTech[Template.Tier], 
			default.Vektor_SupplyCost[Template.Tier], default.Vektor_AlloyCost[Template.Tier], 
			default.Vektor_EleriumCost[Template.Tier], default.Vektor_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_Vektor_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_Vektor_Template(Template, 3);
	Template.RangeAccuracy = default.VEKTOR_COIL_RANGE;
	
	// Model
	Template.GameArchetype = "WP_ReaperRifle_MG.WP_ReaperRifle_MG";
	Template.AddDefaultAttachment('Mag', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.MagVektor_MagazineA");
	Template.AddDefaultAttachment('Optic', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.MagVektor_OpticA");
	Template.AddDefaultAttachment('Reargrip', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.MagVektor_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.MagVektor_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'Vektor_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'VektorRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.Vektor_RequiredTech[Template.Tier], 
			default.Vektor_SupplyCost[Template.Tier], default.Vektor_AlloyCost[Template.Tier], 
			default.Vektor_EleriumCost[Template.Tier], default.Vektor_Engineering[Template.Tier]);
	}

	return Template;
}