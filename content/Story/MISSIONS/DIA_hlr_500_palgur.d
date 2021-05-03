
instance HLR_500_PALGUR_EXIT(C_Info)
{
	npc = hlr_500_palgur;
	nr = 999;
	condition = hlr_500_palgur_exit_condition;
	information = hlr_500_palgur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int hlr_500_palgur_exit_condition()
{
	return TRUE;
};

func void hlr_500_palgur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance HLR_500_PALGUR_POS(C_Info)
{
	npc = hlr_500_palgur;
	nr = 1;
	condition = hlr_500_palgur_pos_condition;
	information = hlr_500_palgur_pos_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was für eine Krankheit haben diese Leute?";
};


func int hlr_500_palgur_pos_condition()
{
	if(!Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func int hlr_500_palgur_pos_info()
{
	AI_Output(hero,self,"HLR_500__POS_15_01");	//Was für eine Krankheit haben diese Gestalten?
	AI_Output(self,hero,"HLR_500__POS_08_02");	//Die Kranken verlieren ihren Verstand und ihr Körper geht jämmerlich zugrunde.
	AI_Output(self,hero,"HLR_500__POS_08_03");	//Wir haben bisher noch keine Aufzeichnungen darüber gefunden.
};


instance HLR_500_PALGUR_JOB(C_Info)
{
	npc = hlr_500_palgur;
	nr = 1;
	condition = hlr_500_palgur_job_condition;
	information = hlr_500_palgur_job_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was ist deine Aufgabe hier?";
};


func int hlr_500_palgur_job_condition()
{
	return TRUE;
};

func int hlr_500_palgur_job_info()
{
	AI_Output(hero,self,"HLR_500_JOB_15_01");	//Was ist deine Aufgabe hier?
	AI_Output(self,hero,"HLR_500_JOB_08_02");	//Ich erforsche verschiedene Rezepturen, um ein Heilmittel zu finden
	AI_Output(self,hero,"HLR_500_JOB_08_03");	//Wir haben herausgefunden, daß die Kranken durch SUMPFKRAUT beruhigt werden.
	AI_Output(hero,self,"HLR_500_JOB_15_04");	//Das ist alles?
	AI_Output(self,hero,"HLR_500_JOB_08_05");	//... alles? Wir verzeichnen das als den ersten großen Fortschritt.
};


instance HLR_500_PALGUR_RECIPE(C_Info)
{
	npc = hlr_500_palgur;
	nr = 1;
	condition = hlr_500_palgur_recipe_condition;
	information = hlr_500_palgur_recipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie geht die Arbeit voran?";
};


func int hlr_500_palgur_recipe_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func int hlr_500_palgur_recipe_info()
{
	AI_Output(hero,self,"HLR_500_RECIPE_15_01");	//Wie geht die Arbeit voran?
	AI_Output(self,hero,"HLR_500_RECIPE_08_02");	//Dank der Rezeptur, die du uns besorgt hast, können wir unsere Forschungen gezielter durchführen.
	AI_Output(self,hero,"HLR_500_RECIPE_08_03");	//Trotzdem ist es noch ein langer Weg, bis wir ein Heilmittel gefunden haben.
};

