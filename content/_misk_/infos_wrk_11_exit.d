
instance INFOS_WRK_11_EXIT(C_Info)
{
	nr = 999;
	condition = infos_wrk_11_exit_condition;
	information = infos_wrk_11_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_wrk_11_exit_condition()
{
	return TRUE;
};

func void infos_wrk_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_WRK_11_HI(C_Info)
{
	condition = infos_wrk_11_hi_condition;
	information = infos_wrk_11_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_wrk_11_hi_condition()
{
	return TRUE;
};

func void infos_wrk_11_hi_info()
{
	AI_Output(other,self,"Infos_Wrk_11_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Wrk_11_HI_Info_11_02");	//Gut. Es gibt zwar noch genug Arbeit, aber wir haben schon eine starke Verteidigung.
	AI_Output(self,other,"Infos_Wrk_11_HI_Info_11_03");	//Das gibt den Männern Mut. Und den werden sie brauchen, falls die Orks angreifen.
	AI_Output(other,self,"Infos_Wrk_11_HI_Info_15_04");	//Und werden die Orks angreifen?
	AI_Output(self,other,"Infos_Wrk_11_HI_Info_11_05");	//Wenn es soweit ist, werden wir es wissen.
};


instance INFOS_WRK_11_CAMP(C_Info)
{
	condition = infos_wrk_11_camp_condition;
	information = infos_wrk_11_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_wrk_11_camp_condition()
{
	return TRUE;
};

func void infos_wrk_11_camp_info()
{
	AI_Output(other,self,"Infos_Wrk_11_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Wrk_11_CAMP_Info_11_02");	//Seit unserer Ankunft hier sind wir damit beschäftigt das Lager wieder aufzubauen.
	AI_Output(self,other,"Infos_Wrk_11_CAMP_Info_11_03");	//Und die Arbeit geht voran. Die Orks werden sich ihre Schädel am Wall einrennen!
	AI_Output(other,self,"Infos_Wrk_11_CAMP_Info_15_04");	//Glaubst du, sie werden bald angreifen?
	AI_Output(self,other,"Infos_Wrk_11_CAMP_Info_11_05");	//Natürlich. Wozu machen wir uns sonst die ganze Arbeit?
};


instance INFOS_WRK_11_BOSS(C_Info)
{
	condition = infos_wrk_11_boss_condition;
	information = infos_wrk_11_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_wrk_11_boss_condition()
{
	var C_Npc bromor;
	var C_Npc dyrian;
	bromor = Hlp_GetNpc(wrk_203_bromor);
	dyrian = Hlp_GetNpc(wrk_202_dyrian);
	if((bromor.aivar[3] == FALSE) && (dyrian.aivar[3] == FALSE))
	{
		return TRUE;
	};
};

func void infos_wrk_11_boss_info()
{
	var C_Npc bromor;
	var C_Npc gotmar;
	AI_Output(other,self,"Infos_Wrk_11_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Wrk_11_BOSS_Info_11_02");	//Gotmar der Schmied und Bromor der Baumeister. Die beiden haben das Kommando.
	bromor = Hlp_GetNpc(wrk_203_bromor);
	bromor.aivar[3] = TRUE;
	gotmar = Hlp_GetNpc(wrk_200_gotmar);
	gotmar.aivar[3] = TRUE;
};

func void b_assignambientinfos_wrk_11(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_wrk_11_exit.npc = Hlp_GetInstanceID(slf);
	infos_wrk_11_hi.npc = Hlp_GetInstanceID(slf);
	infos_wrk_11_camp.npc = Hlp_GetInstanceID(slf);
	infos_wrk_11_boss.npc = Hlp_GetInstanceID(slf);
};

