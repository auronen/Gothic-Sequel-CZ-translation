
instance WRK_206_NICOLOS_EXIT(C_Info)
{
	npc = wrk_206_nicolos;
	nr = 999;
	condition = wrk_206_nicolos_exit_condition;
	information = wrk_206_nicolos_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int wrk_206_nicolos_exit_condition()
{
	return TRUE;
};

func void wrk_206_nicolos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_206_NICOLOS_GOOD(C_Info)
{
	npc = wrk_206_nicolos;
	nr = 1;
	condition = wrk_206_nicolos_good_condition;
	information = wrk_206_nicolos_good_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie schmeckt dir das Essen hier?";
};


func int wrk_206_nicolos_good_condition()
{
	return TRUE;
};

func void wrk_206_nicolos_good_info()
{
	AI_Output(hero,self,"WRK_206_GOOD_15_01");	//Wie schmeckt dir das Essen hier?
	AI_Output(self,hero,"WRK_206_GOOD_00_02");	//Snaf ist der beste Koch hier im Lager. Seine Suppen sind erste Klasse!
};

