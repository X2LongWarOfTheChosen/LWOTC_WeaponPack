class X2Override_Abilities_Shotgun extends X2DownloadableContentInfo config(GameData_WeaponData);

static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager				ItemTemplateManager;
	local X2WeaponTemplate					Template;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	ItemTemplateManager.FindDataTemplateAllDifficulties('Shotgun_CV',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_MobBonus_Conv');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('Shotgun_MG',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_MobBonus_Mag');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('Shotgun_BM',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_MobBonus_Beam');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('AlienHunterPistol_CV',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('AlienHunterPistol_MG',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('AlienHunterPistol_BM',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_Shotgun_LowCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_HighCoverPenalty');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_CloseRange');
			Template.Abilities.AddItem('LWotC_Shotgun_ProxBonus_MidRange');
		}
	}
}