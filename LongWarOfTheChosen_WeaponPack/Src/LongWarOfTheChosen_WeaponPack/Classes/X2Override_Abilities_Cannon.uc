class X2Override_Abilities_Cannon extends X2DownloadableContentInfo config(GameData_WeaponData);

var config array<int> CANNON_RANGE;


static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager				ItemTemplateManager;
	local X2WeaponTemplate					Template;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	ItemTemplateManager.FindDataTemplateAllDifficulties('Cannon_CV',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_MountLMG');
			Template.Abilities.AddItem('LWotC_CannonAreaSuppression');
			Template.Abilities.AddItem('LWotC_CannonFullReload');
			Template.Abilities.RemoveItem('Reload');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('Cannon_MG',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_MountLMG');
			Template.Abilities.AddItem('LWotC_CannonAreaSuppression');
			Template.Abilities.AddItem('LWotC_CannonFullReload');
			Template.Abilities.RemoveItem('Reload');
		}
	}
	ItemTemplateManager.FindDataTemplateAllDifficulties('Cannon_BM',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Template = X2WeaponTemplate(DifficultyTemplate);
		if(Template != none)
		{	
			Template.Abilities.AddItem('LWotC_MountLMG');
			Template.Abilities.AddItem('LWotC_CannonAreaSuppression');
			Template.Abilities.AddItem('LWotC_CannonFullReload');
			Template.Abilities.RemoveItem('Reload');
		}
	}
}