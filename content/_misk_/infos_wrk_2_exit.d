
instance INFOS_WRK_2_EXIT(C_Info)
{
	nr = 999;
	condition = infos_wrk_2_exit_condition;
	information = infos_wrk_2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_wrk_2_exit_condition()
{
	return TRUE;
};

func void infos_wrk_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_WRK_2_HI(C_Info)
{
	condition = infos_wrk_2_hi_condition;
	information = infos_wrk_2_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_wrk_2_hi_condition()
{
	return TRUE;
};

func void infos_wrk_2_hi_info()
{
	AI_Output(other,self,"Infos_Wrk_2_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Wrk_2_HI_Info_01_02");	//Wir müssen einen starken Wall bauen. Nur ein starker Wall kann die Orks aufhalten!
};


instance INFOS_WRK_2_CAMP(C_Info)
{
	condition = infos_wrk_2_camp_condition;
	information = infos_wrk_2_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_wrk_2_camp_condition()
{
	return TRUE;
};

func void infos_wrk_2_camp_info()
{
	AI_Output(other,self,"Infos_Wrk_2_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Wrk_2_CAMP_Info_01_02");	//Die Miliz beschützt alle die arbeiten.
	AI_Output(self,other,"Infos_Wrk_2_CAMP_Info_01_03");	//Aber es gibt auch viele die nicht arbeiten. Die sollen selber zusehen wie sie klarkommen.
};


instance INFOS_WRK_2_BOSS(C_Info)
{
	condition = infos_wrk_2_boss_condition;
	information = infos_wrk_2_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_wrk_2_boss_condition()
{
	var C_Npc bromor;
	bromor = Hlp_GetNpc(wrk_203_bromor);
	if(bromor.aivar[3] == FALSE)
	{
		return TRUE;
	};
};

func void infos_wrk_2_boss_info()
{
	var C_Npc bromor;
	AI_Output(other,self,"Infos_Wrk_2_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Wrk_2_BOSS_Info_01_02");	//Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.
	bromor = Hlp_GetNpc(wrk_203_bromor);
	bromor.aivar[3] = TRUE;
};

func void b_assignambientinfos_wrk_2(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_wrk_2_exit.npc = Hlp_GetInstanceID(slf);
	infos_wrk_2_hi.npc = Hlp_GetInstanceID(slf);
	infos_wrk_2_camp.npc = Hlp_GetInstanceID(slf);
	infos_wrk_2_boss.npc = Hlp_GetInstanceID(slf);
};

