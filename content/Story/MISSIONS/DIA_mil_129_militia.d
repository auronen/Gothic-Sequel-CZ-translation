
instance MIL_129_MILITIA_STOP(C_Info)
{
	npc = mil_129_militia;
	nr = 1;
	condition = mil_129_militia_stop_condition;
	information = mil_129_militia_stop_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_129_militia_stop_condition()
{
	if(Npc_IsInRoutine(self,zs_guardfp) && (Npc_GetDistToWP(self,"OCR_OUTSIDE_CAMPFIRE_D_1") <= 700) && !Npc_KnowsInfo(hero,mil_130_militia_stop))
	{
		return TRUE;
	};
};

func void mil_129_militia_stop_info()
{
	AI_Output(self,hero,"MIL_129_STOP_00_01");	//HALT! Du betrittst jetzt das Viertel der Kranken!
	AI_Output(hero,self,"MIL_129_STOP_15_02");	//Ja und?
	AI_Output(self,hero,"MIL_129_STOP_00_03");	//Niemand weiß, was es mit der Krankheit auf sich hat. Besser du hälst dich fern von diesen Gestalten!
	AI_Output(hero,self,"MIL_129_STOP_15_04");	//Ich bin vorsichtig.
	AI_StopProcessInfos(self);
};

