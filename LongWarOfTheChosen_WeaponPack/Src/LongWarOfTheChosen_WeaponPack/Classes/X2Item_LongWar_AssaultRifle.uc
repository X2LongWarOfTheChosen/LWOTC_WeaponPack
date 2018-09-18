class X2Item_LongWar_AssaultRifle extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_AssaultRifle);

var config array<WeaponDamageValue> AssaultRifle_Damage;
var config array<int> AssaultRifle_Aim;
var config array<int> AssaultRifle_CritChance;
var config array<int> AssaultRifle_ClipSize;
var config array<int> AssaultRifle_SoundRange;
var config array<int> AssaultRifle_EnvironmentDamage;
var config array<int> AssaultRifle_SellValue;
var config array<int> AssaultRifle_UpgradeSlots;
var config array<int> AssaultRifle_SupplyCost;
var config array<int> AssaultRifle_AlloyCost;
var config array<int> AssaultRifle_EleriumCost;
var config array<int> AssaultRifle_Engineering;
var config array<name> AssaultRifle_RequiredTech;
var config array<string> AssaultRifle_ImagePath;
var config array<int> AssaultRifle_Mobility;

var config array<int> RIFLE_CONV_RANGE;
var config array<int> RIFLE_LASER_RANGE;
var config array<int> RIFLE_MAGN_RANGE;
var config array<int> RIFLE_COIL_RANGE;
var config array<int> RIFLE_BEAM_RANGE;

var name AssaultRifleConventional;
var name AssaultRifleLaser;
var name AssaultRifleMagnetic;
var name AssaultRifleCoil;
var name AssaultRifleBeam;

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
	AssaultRifleConventional = "AssaultRifle_CV"
	AssaultRifleLaser = "AssaultRifle_LS"
	AssaultRifleMagnetic = "AssaultRifle_MG"
	AssaultRifleCoil = "AssaultRifle_CG"
	AssaultRifleBeam = "AssaultRifle_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_AssaultRifle_Conventional(default.AssaultRifleConventional));
	Weapons.AddItem(Create_AssaultRifle_Laser(default.AssaultRifleLaser));
	Weapons.AddItem(Create_AssaultRifle_Magnetic(default.AssaultRifleMagnetic));
	Weapons.AddItem(Create_AssaultRifle_Coil(default.AssaultRifleCoil));
	Weapons.AddItem(Create_AssaultRifle_Beam(default.AssaultRifleBeam));
	return Weapons;
}

static function Create_AssaultRifle_Template(out X2WeaponTemplate Template, int tier)
{
	local name Ability;

	//Default Settings
	Template.WeaponCat = 'rifle';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.AssaultRifle_ImagePath[tier];
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
	
	if(default.AssaultRifle_Mobility[tier] > 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityBonus_' $ default.AssaultRifle_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.AssaultRifle_Mobility[tier]);
	}
	if(default.AssaultRifle_Mobility[tier] < 0)
	{
		Template.Abilities.AddItem(name('LWOTC_MobilityPenalty_' $ default.AssaultRifle_Mobility[tier]));
		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.AssaultRifle_Mobility[tier]);
	}

	//Stats
	Template.BaseDamage = default.AssaultRifle_Damage[tier];
	Template.Aim = default.AssaultRifle_Aim[tier];
	Template.CritChance = default.AssaultRifle_CritChance[tier];
	Template.iClipSize = default.AssaultRifle_ClipSize[tier];
	Template.iSoundRange = default.AssaultRifle_SoundRange[tier];
	Template.iEnvironmentDamage = default.AssaultRifle_EnvironmentDamage[tier];
	Template.TradingPostValue = default.AssaultRifle_SellValue[tier];
	Template.NumUpgradeSlots = default.AssaultRifle_UpgradeSlots[tier];

}

static function X2DataTemplate Create_AssaultRifle_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 0);
	Template.RangeAccuracy = default.RIFLE_CONV_RANGE;

	Template.GameArchetype = "WP_AssaultRifle_CV.WP_AssaultRifle_CV";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

	Template.iPhysicsImpulse = 5;

	// Building info
	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_AssaultRifle_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 1);
	Template.RangeAccuracy = default.RIFLE_LASER_RANGE;

	// Model
	Template.GameArchetype = "LWAssaultRifle_LS.Archetype.WP_AssaultRifle_LS";
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A", , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	//Template.AddDefaultAttachment('Optic', "LWRifle_LS.Meshes.SK_LaserRifle_Optic_A", , "img:///UILibrary_LW_LaserPack.LaserRifle__OpticA"); // no default optic

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_CV'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
			default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
			default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_AssaultRifle_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 2);
	Template.RangeAccuracy = default.RIFLE_MAGN_RANGE;

	// Model
	Template.GameArchetype = "WP_AssaultRifle_MG.WP_AssaultRifle_MG";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_StockA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA", , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;
	
	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_MG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_LS'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
		default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
		default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_AssaultRifle_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 3);
	Template.RangeAccuracy = default.RIFLE_COIL_RANGE;

	// Old AR model
	/* Template.GameArchetype = "LWAssaultRifle_CG.Archetypes.WP_AssaultRifle_CG";
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	*/

	//New SMG model used to distinguish weapons more
	Template.GameArchetype = "LWSMG_CG.Archetypes.WP_SMG_CG";
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	Template.AddDefaultAttachment('Suppressor', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_Suppressor");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
			default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
			default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}
static function X2DataTemplate Create_AssaultRifle_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_AssaultRifle_Template(Template, 4);
	Template.RangeAccuracy = default.RIFLE_BEAM_RANGE;

	//Model
	Template.GameArchetype = "WP_AssaultRifle_BM.WP_AssaultRifle_BM";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA", , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'AssaultRifle_BM_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_CG'; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.AssaultRifle_RequiredTech[Template.Tier], 
		default.AssaultRifle_SupplyCost[Template.Tier], default.AssaultRifle_AlloyCost[Template.Tier], 
		default.AssaultRifle_EleriumCost[Template.Tier], default.AssaultRifle_Engineering[Template.Tier]);
	}

	return Template;
}