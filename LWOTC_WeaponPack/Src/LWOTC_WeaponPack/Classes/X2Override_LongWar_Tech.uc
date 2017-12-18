class X2Override_LongWar_Tech extends X2Override_LongWar;

// rewire tech tree if schematics are used
static function UpdateBaseGameLaserAndCoilTechTemplates()
{
	local X2TechTemplate TechTemplate;
	local array<X2TechTemplate> TechTemplates;

	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		FindTechTemplateAllDifficulties('MagnetizedWeapons', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier[class'X2StrategyElement_LaserTechs'.default.LaserWeaponTech_Tier.Length - 1];
		}
		FindTechTemplateAllDifficulties('PlasmaRifle', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier.Length - 1];
		}
	}

	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		FindTechTemplateAllDifficulties('PlasmaRifle', TechTemplates);
		foreach TechTemplates(TechTemplate)
		{
			TechTemplate.Requirements.RequiredTechs[0] = class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier[class'X2StrategyElement_CoilTechs'.default.CoilWeaponTech_Tier.Length - 1];
		}
	}
}

static function UpdateLaserWeaponTemplates(X2ItemTemplateManager ItemTemplateManager)
{
	if (class'X2Item_LaserSchematics'.default.USE_SCHEMATICS)
	{
		//update weapon templates so they upgrade from the correct weapon
		SetWeaponBaseItem(ItemTemplateManager, 'AssaultRifle_MG', 'AssaultRifle_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'BattleRifle_MG', 'BattleRifle_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Bullpup_MG', 'Bullpup_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Cannon_MG', 'Cannon_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Carbine_MG', 'Carbine_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'LMG_MG', 'LMG_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'MarksmanRifle_MG', 'MarksmanRifle_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Sidearm_MG', 'Sidearm_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Pistol_MG', 'Pistol_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'SAW_MG', 'SAW_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'Shotgun_MG', 'Shotgun_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'SMG_MG', 'SMG_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'SniperRifle_MG', 'SniperRifle_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'SparkRifle_MG', 'SparkRifle_LS');
		SetWeaponBaseItem(ItemTemplateManager, 'VektorRifle_MG', 'VektorRifle_LS');
	}
}

static function UpdateCoilWeaponTemplates(X2ItemTemplateManager ItemTemplateManager)
{
	if (class'X2Item_CoilSchematics'.default.USE_SCHEMATICS)
	{
		//update weapon templates so they upgrade from the correct weapon
		SetWeaponBaseItem(ItemTemplateManager, 'AssaultRifle_BM', 'AssaultRifle_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'BattleRifle_BM', 'BattleRifle_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Bullpup_BM', 'Bullpup_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Cannon_BM', 'Cannon_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Carbine_BM', 'Carbine_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'LMG_BM', 'LMG_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'MarksmanRifle_BM', 'MarksmanRifle_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Sidearm_BM', 'Sidearm_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Pistol_BM', 'Pistol_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'SAW_BM', 'SAW_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'Shotgun_BM', 'Shotgun_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'SMG_BM', 'SMG_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'SniperRifle_BM', 'SniperRifle_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'SparkRifle_BM', 'SparkRifle_CG');
		SetWeaponBaseItem(ItemTemplateManager, 'VektorRifle_BM', 'VektorRifle_CG');

		//update magnetic schematics so they are hidden if Coil tier is purchased
		SetSchematicOverriddenBy(ItemTemplateManager, 'AssaultRifle_MG_Schematic', 'AssaultRifle_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'BattleRifle_MG_Schematic', 'BattleRifle_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Bullpup_MG_Schematic', 'Bullpup_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Cannon_MG_Schematic', 'Cannon_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Carbine_MG_Schematic', 'Carbine_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'LMG_MG_Schematic', 'LMG_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'MarksmanRifle_MG_Schematic', 'MarksmanRifle_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Sidearm_MG_Schematic', 'Sidearm_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Pistol_MG_Schematic', 'Pistol_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'SAW_MG_Schematic', 'SAW_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'Shotgun_MG_Schematic', 'Shotgun_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'SMG_MG_Schematic', 'SMG_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'SniperRifle_MG_Schematic', 'SniperRifle_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'SparkRifle_MG_Schematic', 'SparkRifle_CG');
		SetSchematicOverriddenBy(ItemTemplateManager, 'VektorRifle_MG_Schematic', 'VektorRifle_CG');
	}
}

static function SetWeaponBaseItem(X2ItemTemplateManager ItemTemplateMgr, name Weapon, name BaseItem)
{
	local array<X2ItemTemplate> ItemTemplates;
	local X2WeaponTemplate WeaponTemplate;
	local X2ItemTemplate ItemTemplate;

	FindItemTemplateAllDifficulties(Weapon, ItemTemplates, ItemTemplateMgr);

	foreach ItemTemplates(ItemTemplate)
	{
		WeaponTemplate = X2WeaponTemplate(ItemTemplate);
		if(WeaponTemplate!=none)
		{
			WeaponTemplate.BaseItem = BaseItem; // Which item this will be upgraded from
		}
	}
}

static function SetSchematicOverriddenBy(X2ItemTemplateManager ItemTemplateMgr, name Schematic, name HideIfPurchased)
{
	local array<X2ItemTemplate> ItemTemplates;
	local X2SchematicTemplate SchematicTemplate;
	local X2ItemTemplate ItemTemplate;

	FindItemTemplateAllDifficulties(Schematic, ItemTemplates, ItemTemplateMgr);

	foreach ItemTemplates(ItemTemplate)
	{
		SchematicTemplate = X2SchematicTemplate(ItemTemplate);
		if(SchematicTemplate!=none)
		{
			SchematicTemplate.HideIfPurchased = HideIfPurchased;
		}
	}
}
