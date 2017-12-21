class X2Item_LongWar_LMG extends X2Item_LongWar_Weapon config(LongWar_WeaponPack_LMG);

var config array<WeaponDamageValue> LMG_Damage;
var config array<int> LMG_Aim;
var config array<int> LMG_CritChance;
var config array<int> LMG_ClipSize;
var config array<int> LMG_SoundRange;
var config array<int> LMG_EnvironmentDamage;
var config array<int> LMG_SellValue;
var config array<int> LMG_UpgradeSlots;
var config array<int> LMG_SupplyCost;
var config array<int> LMG_AlloyCost;
var config array<int> LMG_EleriumCost;
var config array<int> LMG_Engineering;
var config array<name> LMG_RequiredTech;
var config array<string> LMG_ImagePath;

var name LMGConventional;
var name LMGLaser;
var name LMGMagnetic;
var name LMGCoil;
var name LMGBeam;

defaultproperties
{
	LMGConventional = "LMG_CV"
	LMGLaser = "LMG_LS"
	LMGMagnetic = "LMG_MG"
	LMGCoil = "LMG_CG"
	LMGBeam = "LMG_BM"
	bShouldCreateDifficultyVariants = true
}

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;
	Weapons.AddItem(Create_LMG_Conventional(default.LMGConventional));
	Weapons.AddItem(Create_LMG_Laser(default.LMGLaser));
	Weapons.AddItem(Create_LMG_Magnetic(default.LMGMagnetic));
	Weapons.AddItem(Create_LMG_Coil(default.LMGCoil));
	Weapons.AddItem(Create_LMG_Beam(default.LMGBeam));
	return Weapons;
}

static function Create_LMG_Template(out X2WeaponTemplate Template, int tier)
{
	//Default Settings
	Template.WeaponCat = 'cannon';
	Template.ItemCat = 'weapon';
	Template.iPhysicsImpulse = 5;
	Template.Tier = tier;
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.strImage = "img:///" $ default.LMG_ImagePath[tier];
	Assign_Tier_Values(Template);

	//Abilities
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem(class'X2Ability_LMGAbilities'.default.MountedEffectName);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchAbility);
	Template.Abilities.AddItem(class'X2Ability_LongWatchAbilities'.default.ToggleLongWatchShotAbility);

	//Stats
	Template.BaseDamage = default.LMG_Damage[tier];
	Template.Aim = default.LMG_Aim[tier] - class'X2Ability_LMGAbilities'.default.LMG_Aim_Bonus_When_Mounted;
	Template.CritChance = default.LMG_CritChance[tier];
	Template.iClipSize = default.LMG_ClipSize[tier];
	Template.iSoundRange = default.LMG_SoundRange[tier];
	Template.iEnvironmentDamage = default.LMG_EnvironmentDamage[tier];
	Template.TradingPostValue = default.LMG_SellValue[tier];
	Template.NumUpgradeSlots = default.LMG_UpgradeSlots[tier];
}

static function X2DataTemplate Create_LMG_Conventional(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_LMG_Template(Template, 0);
	Template.RangeAccuracy = default.MEDLONG_CONVENTIONAL_RANGE;
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	// Model
	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	Template.StartingItem = true;
	Template.bInfiniteItem = true;
	Template.CanBeBuilt = false;

	return Template;
}

static function X2DataTemplate Create_LMG_Laser(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_LMG_Template(Template, 1);
	Template.RangeAccuracy = default.MEDLONG_LASER_RANGE;

	// Model
	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'LMG_LS_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.LMGConventional; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.LMG_RequiredTech[Template.Tier],
			default.LMG_SupplyCost[Template.Tier], default.LMG_AlloyCost[Template.Tier], 
			default.LMG_EleriumCost[Template.Tier], default.LMG_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_LMG_Magnetic(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_LMG_Template(Template, 2);
	Template.RangeAccuracy = default.MEDLONG_MAGNETIC_RANGE;

	// Model
	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	Template.CreatorTemplateName = 'LMG_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.LMGConventional; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate Create_LMG_Coil(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_LMG_Template(Template, 3);
	Template.RangeAccuracy = default.MEDLONG_COIL_RANGE;

	// Model
	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	// Building info
	if (BuildWeaponSchematics(Template))
	{
		Template.CreatorTemplateName = 'LMG_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = default.LMGMagnetic; // Which item this will be upgraded from
	}
	else
	{
		CreateTemplateCost(Template, default.LMG_RequiredTech[Template.Tier],
			default.LMG_SupplyCost[Template.Tier], default.LMG_AlloyCost[Template.Tier], 
			default.LMG_EleriumCost[Template.Tier], default.LMG_Engineering[Template.Tier]);
	}

	return Template;
}

static function X2DataTemplate Create_LMG_Beam(name TemplateName)
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, TemplateName);
	Create_LMG_Template(Template, 4);
	Template.RangeAccuracy = default.MEDLONG_BEAM_RANGE;

	// Model
	Template.GameArchetype = "BRMeshPack.Archetypes.WP_LMG_CV";
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_MagA");
	Template.AddDefaultAttachment('Optic', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_OpticA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_OpticA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Bipod", , "img:///UILibrary_BRMeshPack.Attach.MR_CV_Bipod");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.LMG_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	Template.CreatorTemplateName = 'LMG_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = default.LMGMagnetic; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}