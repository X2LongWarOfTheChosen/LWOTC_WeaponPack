class X2Override_Abilities_SniperRifle extends X2DownloadableContentInfo config(LongWar_SniperRifle);

static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager				ItemTemplateManager;
	local X2WeaponTemplate					Template;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	ItemTemplateManager.FindDataTemplateAllDifficulties('SniperRifle_CV',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWOTC_SniperRifleSnapshot');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('SniperRifle_MG',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWOTC_SniperRifleSnapshot');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('SniperRifle_BM',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWOTC_SniperRifleSnapshot');
		}
	}
}