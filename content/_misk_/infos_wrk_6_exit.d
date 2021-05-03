
instance INFOS_WRK_6_EXIT(C_Info)
{
	nr = 999;
	condition = infos_wrk_6_exit_condition;
	information = infos_wrk_6_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_wrk_6_exit_condition()
{
	return TRUE;
};

func void infos_wrk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_WRK_6_HI(C_Info)
{
	condition = infos_wrk_6_hi_condition;
	information = infos_wrk_6_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_wrk_6_hi_condition()
{
	return TRUE;
};

func void infos_wrk_6_hi_info()
{
	AI_Output(other,self,"Infos_Wrk_6_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Wrk_6_HI_Info_06_02");	//Viel Arbeit, wenig Schlaf. Wenigstens haben wir noch Bier.
};


instance INFOS_WRK_6_CAMP(C_Info)
{
	condition = infos_wrk_6_camp_condition;
	information = infos_wrk_6_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_wrk_6_camp_condition()
{
	return TRUE;
};

func void infos_wrk_6_camp_info()
{
	AI_Output(other,self,"Infos_Wrk_6_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Wrk_6_CAMP_Info_06_02");	//Wir Arbeiter verstärken den Wall. Wir sorgen dafür das die Orks hier nicht reinspazieren werden.
	AI_Output(self,other,"Infos_Wrk_6_CAMP_Info_06_03");	//Und wenn sie es versuchen sollten, wird ihnen die Miliz ganz schön einheizen.
	AI_Output(self,other,"Infos_Wrk_6_CAMP_Info_06_04");	//Die Heiler kümmern sich um die Aussätzigen. Und wenn du was brauchst, das Händlerviertel ist hinter der Arena.
};


instance INFOS_WRK_6_BOSS(C_Info)
{
	condition = infos_wrk_6_boss_condition;
	information = infos_wrk_6_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_wrk_6_boss_condition()
{
	var C_Npc dyrian;
	var C_Npc bromor;
	dyrian = Hlp_GetNpc(wrk_202_dyrian);
	bromor = Hlp_GetNpc(wrk_203_bromor);
	if((bromor.aivar[3] == FALSE) && (dyrian.aivar[3] == FALSE))
	{
		return TRUE;
	};
};

func void infos_wrk_6_boss_info()
{
	var C_Npc bromor;
	var C_Npc dyrian;
	AI_Output(other,self,"Infos_Wrk_6_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Wrk_6_BOSS_Info_06_02");	//Bromor und Dyrian. Der Baumeister und der Zimmermann. Die beiden kümmern sich um uns und das Lager.
	bromor = Hlp_GetNpc(wrk_203_bromor);
	bromor.aivar[3] = TRUE;
	dyrian = Hlp_GetNpc(wrk_202_dyrian);
	dyrian.aivar[3] = TRUE;
};

func void b_assignambientinfos_wrk_6(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_wrk_6_exit.npc = Hlp_GetInstanceID(slf);
	infos_wrk_6_hi.npc = Hlp_GetInstanceID(slf);
	infos_wrk_6_camp.npc = Hlp_GetInstanceID(slf);
	infos_wrk_6_boss.npc = Hlp_GetInstanceID(slf);
};

