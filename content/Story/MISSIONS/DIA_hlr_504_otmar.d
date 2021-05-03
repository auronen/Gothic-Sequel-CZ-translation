
instance HLR_504_OTMAR_EXIT(C_Info)
{
	npc = hlr_504_otmar;
	nr = 999;
	condition = hlr_504_otmar_exit_condition;
	information = hlr_504_otmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int hlr_504_otmar_exit_condition()
{
	return TRUE;
};

func void hlr_504_otmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance HLR_504_OTMAR_JOB(C_Info)
{
	npc = hlr_504_otmar;
	nr = 1;
	condition = hlr_504_otmar_job_condition;
	information = hlr_504_otmar_job_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist deine Aufgabe hier?";
};


func int hlr_504_otmar_job_condition()
{
	return TRUE;
};

func int hlr_504_otmar_job_info()
{
	AI_Output(hero,self,"HLR_504_JOB_15_01");	//Was ist deine Aufgabe hier?
	AI_Output(self,hero,"HLR_504_JOB_00_02");	//Ich sorge dafür, daß die Bekloppten ruhig bleiben.
};


instance HLR_504_OTMAR_CALM(C_Info)
{
	npc = hlr_504_otmar;
	nr = 1;
	condition = hlr_504_otmar_calm_condition;
	information = hlr_504_otmar_calm_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie bekommt man sie ruhig?";
};


func int hlr_504_otmar_calm_condition()
{
	if(Npc_KnowsInfo(hero,hlr_504_otmar_job))
	{
		return TRUE;
	};
};

func int hlr_504_otmar_calm_info()
{
	AI_Output(hero,self,"HLR_504_CALM_15_01");	//Wie bekommt man sie ruhig?
	AI_Output(self,hero,"HLR_504_CALM_00_02");	//Die Heiler haben schon alles mögliche ausprobiert, ohne Erfolg. Jetzt geben wir ihnen Sumpfkraut. Das beruhigt sie.
	AI_Output(self,hero,"HLR_504_CALM_00_03");	//Macht mir auch die Arbeit leichter. Das Sumpfkraut ist wirklich gut Mann, wirklich gut!
};


instance HLR_504_OTMAR_HOWCALM(C_Info)
{
	npc = hlr_504_otmar;
	nr = 1;
	condition = hlr_504_otmar_howcalm_condition;
	information = hlr_504_otmar_howcalm_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kann man mit den Kranken reden?";
};


func int hlr_504_otmar_howcalm_condition()
{
	if(Npc_KnowsInfo(hero,hlr_504_otmar_calm))
	{
		return TRUE;
	};
};

func int hlr_504_otmar_howcalm_info()
{
	AI_Output(hero,self,"HLR_504_HOWCALM_15_01");	//Kann man mit den Kranken reden?
	AI_Output(self,hero,"HLR_504_HOWCALM_00_02");	//Wozu? Die reden nur wirres Zeug. Arme Irre.
};

