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
var config array<int> Vektor_Mobility;

var name VektorLaser;
var name VektorCoil;

var bool CreateNewVektorRifles;

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
	VektorLaser = "VektorRifle_LS"
	VektorCoil = "VektorRifle_CG"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	if(default.CreateNewVektorRifles)
	{
		Weapons.AddItem(Create_Vektor_Laser(default.VektorLaser));
		Weapons.AddItem(Create_Vektor_Coil(default.VektorCoil));
	}

	return Weapons;
}

static function Create_Vektor_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

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
	
	if(default.Vektor_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.Vektor_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Vektor_Mobility[tier]);
	}
	if(default.Vektor_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.Vektor_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.Vektor_Mobility[tier]);
	}

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
	// Template.GameArchetype = "WP_ReaperRifle_BM.WP_ReaperRifle_BM";
	// Template.AddDefaultAttachment('Mag', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.MagVektor_MagazineA");
	// Template.AddDefaultAttachment('Optic', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.MagVektor_OpticA");
	// Template.AddDefaultAttachment('Reargrip', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_ReargripA");
	// Template.AddDefaultAttachment('Stock', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.MagVektor_StockA");
	// Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.MagVektor_TriggerA");
	// Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.GameArchetype = "WP_ReaperRifle_BM.WP_ReaperRifle_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.AddDefaultAttachment('Optic', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.BeamVektor_OpticA");
	Template.AddDefaultAttachment('Mag', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.BeamVektor_MagazineA");
	Template.AddDefaultAttachment('Suppressor', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_SuppressorB", , "img:///UILibrary_XPACK_Common.BeamVektor_SuppressorB");
	Template.AddDefaultAttachment('Reargrip', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_ReargripA");
	Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.BeamVektor_TriggerA");
	Template.AddDefaultAttachment('Stock', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.BeamVektor_StockA");
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
	Template.GameArchetype = "WP_ReaperRifle.WP_ReaperRifle";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Sniper';
	Template.AddDefaultAttachment('Mag', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_MagA", , "img:///UILibrary_XPACK_Common.MagVektor_MagazineA");
	Template.AddDefaultAttachment('Optic', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_OpticA", , "img:///UILibrary_XPACK_Common.BeamVektor_OpticA");
	Template.AddDefaultAttachment('Reargrip', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_StockA", , "img:///UILibrary_XPACK_Common.ConvVektor_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_TriggerA", , "img:///UILibrary_XPACK_Common.ConvVektor_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");
	Template.AddDefaultAttachment('Suppressor', "LWSniperRifle_CG.Meshes.LW_CoilSniper_Suppressor", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_Suppressor");

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