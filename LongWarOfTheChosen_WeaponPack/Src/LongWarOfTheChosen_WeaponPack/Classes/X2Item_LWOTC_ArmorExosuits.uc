class X2Item_LWOTC_ArmorExosuits extends X2Item;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

	Armors.AddItem(CreateGunnerExosuitKevlar());
	Armors.AddItem(CreateGunnerExosuitPlated());
	Armors.AddItem(CreateGunnerExosuitPowered());

	return Armors;
}

static function X2DataTemplate CreateGunnerExosuitKevlar()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'GunnerExosuitKevlar');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Hammer_Armor";
	Template.ArmorCat = 'gunner_exosuit';
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.Abilities.AddItem('GunnerExosuitKevlarStats');
	Template.ArmorTechCat = 'conventional';
	Template.ArmorClass = 'basic';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_KEVLAR_HEALTH + class'X2Ability_ExosuitAbilities'.default.EXOSUIT_KEVLAR_ABLATIVE, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_KEVLAR_ARMOR);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_KEVLAR_MOBILITY, true);
	Template.SetUIStatMarkup("Ablative", eStat_ShieldHP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_KEVLAR_ABLATIVE, true);

	return Template;
}

static function X2DataTemplate CreateGunnerExosuitPlated()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'GunnerExosuitPlated');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Hammer_Armor";
	Template.ArmorCat = 'gunner_exosuit';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 35;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('GunnerExosuitPlatedStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorClass = 'heavy';
	Template.Tier = 2;
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated";
	Template.bHeavyWeapon = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_PLATED_HEALTH + class'X2Ability_ExosuitAbilities'.default.EXOSUIT_PLATED_ABLATIVE, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_PLATED_ARMOR);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_PLATED_MOBILITY, true);
	Template.SetUIStatMarkup("Ablative", eStat_ShieldHP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_PLATED_ABLATIVE, true);

	return Template;
}

static function X2DataTemplate CreateGunnerExosuitPowered()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'GunnerExosuitPowered');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Marauder_Armor";
	Template.ArmorCat = 'gunner_exosuit';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 120;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('GunnerExosuitPoweredStats');
	Template.Abilities.AddItem('HighCoverGenerator');
	Template.ArmorTechCat = 'powered';
	Template.ArmorClass = 'heavy';
	Template.Tier = 4;
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";
	Template.bHeavyWeapon = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_POWERED_HEALTH, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_POWERED_ARMOR);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_HP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_POWERED_MOBILITY, true);
	Template.SetUIStatMarkup("Ablative", eStat_ShieldHP, class'X2Ability_ExosuitAbilities'.default.EXOSUIT_POWERED_ABLATIVE, true);

	return Template;
}