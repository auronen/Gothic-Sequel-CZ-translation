
instance MIL_140_MILITIA_STOP(C_Info)
{
	npc = mil_140_militia;
	nr = 1;
	condition = mil_140_militia_stop_condition;
	information = mil_140_militia_stop_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_140_militia_stop_condition()
{
	if(Npc_IsInRoutine(self,zs_guardfp) && (Npc_GetDistToWP(self,"OCR_TO_GHETTO_2") <= 700) && !Npc_KnowsInfo(hero,mil_130_militia_stop) && !Npc_KnowsInfo(hero,mil_139_militia_stop) && !Npc_KnowsInfo(hero,mil_129_militia_stop))
	{
		return TRUE;
	};
};

func void mil_140_militia_stop_info()
{
	AI_Output(self,hero,"MIL_140_STOP_00_01");	//HALT! Du betrittst jetzt das Viertel der Kranken!
	AI_Output(hero,self,"MIL_140_STOP_15_02");	//Ja und?
	AI_Output(self,hero,"MIL_140_STOP_00_03");	//Ich warne dich nur. Besser ist, du hälst dich von ihnen fern! Sonst könntest du dich anstecken!
	AI_Output(hero,self,"MIL_140_STOP_15_04");	//Ich bin vorsichtig.
	AI_Output(self,hero,"MIL_140_STOP_00_05");	//Das wäre auch klüger. Denn falls du dich ansteckst, darfst du das Viertel der Kranken nicht mehr verlassen!
	AI_StopProcessInfos(self);
};

