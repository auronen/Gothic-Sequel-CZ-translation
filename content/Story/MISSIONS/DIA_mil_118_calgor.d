
instance MIL_118_CALGOR_EXIT(C_Info)
{
	npc = mil_118_calgor;
	nr = 999;
	condition = mil_118_calgor_exit_condition;
	information = mil_118_calgor_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int mil_118_calgor_exit_condition()
{
	return TRUE;
};

func void mil_118_calgor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_118_CALGOR_HI(C_Info)
{
	npc = mil_118_calgor;
	nr = 12;
	condition = mil_118_calgor_hi_condition;
	information = mil_118_calgor_hi_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int mil_118_calgor_hi_condition()
{
	return TRUE;
};

func void mil_118_calgor_hi_info()
{
	AI_Output(hero,self,"MIL_118_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"MIL_118_HI_08_02");	//Ich bin Calgor, Soldat der ... dieses Haufens.
	AI_Output(self,hero,"MIL_118_HI_08_03");	//Hier im Lager wimmelt es nur so von Halsabschneidern und Dieben.
	AI_Output(self,hero,"MIL_118_HI_08_04");	//Aber niemand tut was dagegen. Ja, wenn der König hier wäre, er würde hier Ordnung und Disziplin reinbringen.
	AI_Output(self,hero,"MIL_118_HI_08_05");	//Aber der weiß schon, warum er nicht hier ist, er hat sich um wichtigeres zu kümmern, als um diesen Haufen Gesindel!
};

