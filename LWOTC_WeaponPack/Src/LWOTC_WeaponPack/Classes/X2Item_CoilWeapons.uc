class X2Item_CoilWeapons extends X2Item config (LW_WeaponPack);

var config WeaponDamageValue ASSAULTRIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue BATTLERIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue SMG_COIL_BASEDAMAGE;
var config WeaponDamageValue CANNON_COIL_BASEDAMAGE;
var config WeaponDamageValue SHOTGUN_COIL_BASEDAMAGE;
var config WeaponDamageValue SNIPERRIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue MARKSMANRIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue PISTOL_COIL_BASEDAMAGE;
var config WeaponDamageValue BULLPUP_COIL_BASEDAMAGE;

var config array<int> SHORT_COIL_RANGE;
var config array<int> MIDSHORT_COIL_RANGE;
var config array<int> MEDIUM_COIL_RANGE;
var config array<int> MEDLONG_COIL_RANGE;
var config array<int> LONG_COIL_RANGE;

var config int ASSAULTRIFLE_COIL_AIM;
var config int ASSAULTRIFLE_COIL_CRITCHANCE;
var config int ASSAULTRIFLE_COIL_ICLIPSIZE;
var config int ASSAULTRIFLE_COIL_ISOUNDRANGE;
var config int ASSAULTRIFLE_COIL_IENVIRONMENTDAMAGE;
var config int ASSAULTRIFLE_COIL_UPGRADESLOTS;

var config int BATTLERIFLE_COIL_AIM;
var config int BATTLERIFLE_COIL_CRITCHANCE;
var config int BATTLERIFLE_COIL_ICLIPSIZE;
var config int BATTLERIFLE_COIL_ISOUNDRANGE;
var config int BATTLERIFLE_COIL_IENVIRONMENTDAMAGE;
var config int BATTLERIFLE_COIL_UPGRADESLOTS;

var config int SMG_COIL_AIM;
var config int SMG_COIL_CRITCHANCE;
var config int SMG_COIL_ICLIPSIZE;
var config int SMG_COIL_ISOUNDRANGE;
var config int SMG_COIL_IENVIRONMENTDAMAGE;
var config int SMG_COIL_UPGRADESLOTS;

var config int CANNON_COIL_AIM;
var config int CANNON_COIL_CRITCHANCE;
var config int CANNON_COIL_ICLIPSIZE;
var config int CANNON_COIL_ISOUNDRANGE;
var config int CANNON_COIL_IENVIRONMENTDAMAGE;
var config int CANNON_COIL_UPGRADESLOTS;

var config int SHOTGUN_COIL_AIM;
var config int SHOTGUN_COIL_CRITCHANCE;
var config int SHOTGUN_COIL_ICLIPSIZE;
var config int SHOTGUN_COIL_ISOUNDRANGE;
var config int SHOTGUN_COIL_IENVIRONMENTDAMAGE;
var config int SHOTGUN_COIL_UPGRADESLOTS;

var config int SNIPERRIFLE_COIL_AIM;
var config int SNIPERRIFLE_COIL_CRITCHANCE;
var config int SNIPERRIFLE_COIL_ICLIPSIZE;
var config int SNIPERRIFLE_COIL_ISOUNDRANGE;
var config int SNIPERRIFLE_COIL_IENVIRONMENTDAMAGE;
var config int SNIPERRIFLE_COIL_UPGRADESLOTS;

var config int MARKSMANRIFLE_COIL_AIM;
var config int MARKSMANRIFLE_COIL_CRITCHANCE;
var config int MARKSMANRIFLE_COIL_ICLIPSIZE;
var config int MARKSMANRIFLE_COIL_ISOUNDRANGE;
var config int MARKSMANRIFLE_COIL_IENVIRONMENTDAMAGE;
var config int MARKSMANRIFLE_COIL_UPGRADESLOTS;

var config int PISTOL_COIL_AIM;
var config int PISTOL_COIL_CRITCHANCE;
var config int PISTOL_COIL_ICLIPSIZE;
var config int PISTOL_COIL_ISOUNDRANGE;
var config int PISTOL_COIL_IENVIRONMENTDAMAGE;

var config int BULLPUP_COIL_AIM;
var config int BULLPUP_COIL_CRITCHANCE;
var config int BULLPUP_COIL_ICLIPSIZE;
var config int BULLPUP_COIL_ISOUNDRANGE;
var config int BULLPUP_COIL_IENVIRONMENTDAMAGE;
var config int BULLPUP_COIL_UPGRADESLOTS;

var config string AssaultRifle_Coil_ImagePath;
var config string SMG_Coil_ImagePath;
var config string Cannon_Coil_ImagePath;
var config string Shotgun_Coil_ImagePath;
var config string SniperRifle_Coil_ImagePath;
var config string Bullpup_Coil_ImagePath;

// if not using templates
var config int ASSAULTRIFLE_CG_SUPPLYCOST;
var config int ASSAULTRIFLE_CG_ALLOYCOST;
var config int ASSAULTRIFLE_CG_ELERIUMCOST;

var config int BATTLERIFLE_CG_SUPPLYCOST;
var config int BATTLERIFLE_CG_ALLOYCOST;
var config int BATTLERIFLE_CG_ELERIUMCOST;

var config int SMG_CG_SUPPLYCOST;
var config int SMG_CG_ALLOYCOST;
var config int SMG_CG_ELERIUMCOST;

var config int CANNON_CG_SUPPLYCOST;
var config int CANNON_CG_ALLOYCOST;
var config int CANNON_CG_ELERIUMCOST;

var config int SHOTGUN_CG_SUPPLYCOST;
var config int SHOTGUN_CG_ALLOYCOST;
var config int SHOTGUN_CG_ELERIUMCOST;

var config int SNIPERRIFLE_CG_SUPPLYCOST;
var config int SNIPERRIFLE_CG_ALLOYCOST;
var config int SNIPERRIFLE_CG_ELERIUMCOST;

var config int MARKSMANRIFLE_CG_SUPPLYCOST;
var config int MARKSMANRIFLE_CG_ALLOYCOST;
var config int MARKSMANRIFLE_CG_ELERIUMCOST;

var config int PISTOL_CG_SUPPLYCOST;
var config int PISTOL_CG_ALLOYCOST;
var config int PISTOL_CG_ELERIUMCOST;

var config int BULLPUP_CG_SUPPLYCOST;
var config int BULLPUP_CG_ALLOYCOST;
var config int BULLPUP_CG_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateAssaultRifle_Coil_Template());
	Weapons.AddItem(CreateBattleRifle_Coil_Template());
	Weapons.AddItem(CreateSMG_Coil_Template());
	Weapons.AddITem(CreateCannon_Coil_Template());
	Weapons.AddItem(CreateShotgun_Coil_Template());
	Weapons.AddItem(CreateSniperRifle_Coil_Template());
	Weapons.AddItem(CreateMarksmanRifle_Coil_Template());
	Weapons.AddItem(CreatePistol_Coil_Template());
	Weapons.AddItem(CreateBullpup_Coil_Template());

	return Weapons;
}

static function X2DataTemplate CreateAssaultRifle_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AssaultRifle_CG');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.AssaultRifle_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;
	Template.BaseDamage = default.ASSAULTRIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.ASSAULTRIFLE_COIL_AIM;
	Template.CritChance = default.ASSAULTRIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.ASSAULTRIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.ASSAULTRIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.ASSAULTRIFLE_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.ASSAULTRIFLE_COIL_UPGRADESLOTS;

	Template.GameArchetype = "LWAssaultRifle_CG.Archetypes.WP_AssaultRifle_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'AssaultRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'AssaultRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.ASSAULTRIFLE_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.ASSAULTRIFLE_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.ASSAULTRIFLE_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 15;
	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateBattleRifle_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BattleRifle_CG');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_Base";
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;
	Template.BaseDamage = default.BATTLERIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.BATTLERIFLE_COIL_AIM;
	Template.CritChance = default.BATTLERIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.BATTLERIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.BATTLERIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BATTLERIFLE_COIL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.BATTLERIFLE_COIL_UPGRADESLOTS;

	Template.GameArchetype = "RM_BattleRiflePack.Archetypes.WP_BattleRifle_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA"); 
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA"); 
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticA");

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'BattleRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'BR_MG'; // Which item this will be upgraded from		
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]); 

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.BATTLERIFLE_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.BATTLERIFLE_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.BATTLERIFLE_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 15;
	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateSMG_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SMG_CG');

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.SMG_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;
	Template.Abilities.Additem('SMG_CG_StatBonus');
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_SMGAbilities'.default.SMG_COIL_MOBILITY_BONUS);

	Template.RangeAccuracy = default.MIDSHORT_COIL_RANGE;
	Template.BaseDamage = default.SMG_COIL_BASEDAMAGE;
	Template.Aim = default.SMG_COIL_AIM;
	Template.CritChance = default.SMG_COIL_CRITCHANCE;
	Template.iClipSize = default.SMG_COIL_ICLIPSIZE;
	Template.iSoundRange = default.SMG_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SMG_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SMG_COIL_UPGRADESLOTS;

	Template.GameArchetype = "LWSMG_CG.Archetypes.WP_SMG_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSMG_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'SMG_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SMG_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SMG_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SMG_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SMG_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 15;
	}


	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateCannon_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_CG');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.Cannon_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDIUM_COIL_RANGE;
	Template.BaseDamage = default.CANNON_COIL_BASEDAMAGE;
	Template.Aim = default.CANNON_COIL_AIM;
	Template.CritChance = default.CANNON_COIL_CRITCHANCE;
	Template.iClipSize = default.CANNON_COIL_ICLIPSIZE;
	Template.iSoundRange = default.CANNON_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.CANNON_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.CANNON_COIL_UPGRADESLOTS;

	Template.GameArchetype = "LWCannon_CG.Archetypes.WP_Cannon_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
	Template.AddDefaultAttachment('Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWCannon_CG.Meshes.LW_CoilCannon_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_StockA");
	Template.AddDefaultAttachment('StockSupport', "LWCannon_CG.Meshes.LW_CoilCannon_StockSupportA");
	Template.AddDefaultAttachment('Reargrip', "LWCannon_CG.Meshes.LW_CoilCannon_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilCannon_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Cannon_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Cannon_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.CANNON_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.CANNON_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.CANNON_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 20;
	}


	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateShotgun_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Shotgun_CG');

	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.Shotgun_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.SHORT_COIL_RANGE;
	Template.BaseDamage = default.SHOTGUN_COIL_BASEDAMAGE;
	Template.Aim = default.SHOTGUN_COIL_AIM;
	Template.CritChance = default.SHOTGUN_COIL_CRITCHANCE;
	Template.iClipSize = default.SHOTGUN_COIL_ICLIPSIZE;
	Template.iSoundRange = default.SHOTGUN_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SHOTGUN_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SHOTGUN_COIL_UPGRADESLOTS;

	Template.GameArchetype = "LWShotgun_CG.Archetypes.WP_Shotgun_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun';
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilShotgun_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'Shotgun_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'Shotgun_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SHOTGUN_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SHOTGUN_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SHOTGUN_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 20;

	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateSniperRifle_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'SniperRifle_CG');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.SniperRifle_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.LONG_COIL_RANGE;
	Template.BaseDamage = default.SNIPERRIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.SNIPERRIFLE_COIL_AIM;
	Template.CritChance = default.SNIPERRIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.SNIPERRIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.SNIPERRIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.SNIPERRIFLE_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.SNIPERRIFLE_COIL_UPGRADESLOTS;

	Template.GameArchetype = "LWSniperRifle_CG.Archetypes.WP_SniperRifle_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_OpticA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_StockB");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Coilguns.InventoryArt.CoilSniperRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'SniperRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'SniperRifle_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.SNIPERRIFLE_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.SNIPERRIFLE_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.SNIPERRIFLE_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
		
		Template.Requirements.RequiredEngineeringScore = 20;
	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateMarksmanRifle_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MarksmanRifle_CG');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage ="img:///" $ default.SniperRifle_Coil_ImagePath;
	Template.WeaponPanelImage = "";
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.MEDLONG_COIL_RANGE;
	Template.BaseDamage = default.MARKSMANRIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.MARKSMANRIFLE_COIL_AIM;
	Template.CritChance = default.MARKSMANRIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.MARKSMANRIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.MARKSMANRIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MARKSMANRIFLE_COIL_IENVIRONMENTDAMAGE;
	Template.iTypicalActionCost = 1;
	
	Template.NumUpgradeSlots = default.MARKSMANRIFLE_COIL_UPGRADESLOTS;

	Template.GameArchetype = "RM_BattleRiflePack.Archetypes.WP_BattleRifle_CG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA"); 
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA"); 
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA", , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticA");

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');	
	Template.Abilities.AddItem('SniperRifleOverwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'MarksmanRifle_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'MR_MG'; // Which item this will be upgraded from		
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[1]); 

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.MARKSMANRIFLE_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.MARKSMANRIFLE_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.MARKSMANRIFLE_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);
		
		Template.Requirements.RequiredEngineeringScore = 20;
	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreatePistol_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Pistol_CG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_LW_Coilguns.InventoryArt.Inv_Coil_Pistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Beam"; // TODO: update with new equip sound
	Template.Tier = 4;

	Template.RangeAccuracy = default.MIDSHORT_COIL_RANGE;
	Template.BaseDamage = default.Pistol_COIL_BASEDAMAGE;
	Template.Aim = default.Pistol_COIL_AIM;
	Template.CritChance = default.Pistol_COIL_CRITCHANCE;
	Template.iClipSize = default.Pistol_COIL_ICLIPSIZE;
	Template.iSoundRange = default.Pistol_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.Pistol_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 0;

	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotBeamA'); // TODO : update with new animation if necessary

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWPistol_CG.Archetypes.WP_Pistol_CG";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'PISTOL_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'PISTOL_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.PISTOL_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.PISTOL_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.PISTOL_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 15;
	}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';  // TODO : update with new damage type

	Template.bHideClipSizeStat = true;

	return Template;
}
static function X2DataTemplate CreateBullpup_Coil_Template()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Bullpup_CG');

	Template.WeaponCat = 'bullpup';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	// TODO: Placeholder, replace with assets when completed
	Template.strImage = "img:///UILibrary_XPACK_Common.MagSMG_Base";
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.SHORT_COIL_RANGE;
	Template.BaseDamage = default.BULLPUP_COIL_BASEDAMAGE;
	Template.Aim = default.BULLPUP_COIL_AIM;
	Template.CritChance = default.BULLPUP_COIL_CRITCHANCE;
	Template.iClipSize = default.BULLPUP_COIL_ICLIPSIZE;
	Template.iSoundRange = default.BULLPUP_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BULLPUP_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BULLPUP_COIL_UPGRADESLOTS; 
	
	// TODO: Placeholder, replace with assets when completed
	Template.GameArchetype = "WP_SkirmisherSMG_MG.WP_SkirmisherSMG_MG";
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Shotgun'; // the base game does this as well

	// TODO: Placeholders, replace with assets when completed
	Template.AddDefaultAttachment('Mag', "MagSMG.Meshes.SM_HOR_Mag_SMG_MagA", , "img:///UILibrary_XPACK_Common.MagSMG_MagazineA");
	Template.AddDefaultAttachment('Reargrip', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_ReargripA");
	Template.AddDefaultAttachment('Stock', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_StockA", , "img:///UILibrary_XPACK_Common.MagSMG_StockA");
	Template.AddDefaultAttachment('Trigger', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_TriggerA", , "img:///UILibrary_XPACK_Common.MagSMG_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = !class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;
	Template.bInfiniteItem = class'X2Item_CoilSchematics'.default.USE_SCHEMATICS;

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		Template.CreatorTemplateName = 'BULLPUP_CG_Schematic'; // The schematic which creates this item
		Template.BaseItem = 'BULLPUP_MG'; // Which item this will be upgraded from
	}
	else
	{
		Template.Requirements.RequiredTechs.AddItem(class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[0]);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = default.BULLPUP_CG_SUPPLYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = default.BULLPUP_CG_ALLOYCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = default.BULLPUP_CG_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Template.Requirements.RequiredEngineeringScore = 15;
	}


	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}
