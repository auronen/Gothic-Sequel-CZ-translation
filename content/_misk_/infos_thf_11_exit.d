
instance INFOS_THF_11_EXIT(C_Info)
{
	nr = 999;
	condition = infos_thf_11_exit_condition;
	information = infos_thf_11_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_thf_11_exit_condition()
{
	return TRUE;
};

func void infos_thf_11_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_THF_11_HI(C_Info)
{
	condition = infos_thf_11_hi_condition;
	information = infos_thf_11_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_thf_11_hi_condition()
{
	return TRUE;
};

func void infos_thf_11_hi_info()
{
	AI_Output(other,self,"Infos_Thf_11_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Thf_11_HI_Info_01_02");	//Ich sage dir wie es läuft. Jeder für sich und du für dich. Pass auf dich auf, denn sonst tut es keiner!
};


instance INFOS_THF_11_CAMP(C_Info)
{
	condition = infos_thf_11_camp_condition;
	information = infos_thf_11_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_thf_11_camp_condition()
{
	return TRUE;
};

func void infos_thf_11_camp_info()
{
	AI_Output(other,self,"Infos_Thf_11_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Thf_11_CAMP_Info_01_02");	//Halte dich fern von den Arbeitern und den Kranken. Da gibt es nichts zu holen.
	AI_Output(self,other,"Infos_Thf_11_CAMP_Info_01_03");	//Geh der Miliz aus dem Weg, wenn einer von ihnen in der Nähe ist, verhalte dich ruhig und provoziere sie nicht!
};


instance INFOS_THF_11_BOSS(C_Info)
{
	condition = infos_thf_11_boss_condition;
	information = infos_thf_11_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_thf_11_boss_condition()
{
	return TRUE;
};

func void infos_thf_11_boss_info()
{
	var C_Npc diego;
	AI_Output(other,self,"Infos_Thf_11_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Thf_11_BOSS_Info_01_02");	//Diego ist der Anführer des Lagers. Auf sein Wort hören jeder im Lager.
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[3] = TRUE;
};

func void b_assignambientinfos_thf_11(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_thf_11_exit.npc = Hlp_GetInstanceID(slf);
	infos_thf_11_hi.npc = Hlp_GetInstanceID(slf);
	infos_thf_11_camp.npc = Hlp_GetInstanceID(slf);
	infos_thf_11_boss.npc = Hlp_GetInstanceID(slf);
};

