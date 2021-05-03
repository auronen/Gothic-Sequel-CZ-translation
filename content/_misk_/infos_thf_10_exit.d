
instance INFOS_THF_10_EXIT(C_Info)
{
	nr = 999;
	condition = infos_thf_10_exit_condition;
	information = infos_thf_10_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_thf_10_exit_condition()
{
	return TRUE;
};

func void infos_thf_10_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_THF_10_HI(C_Info)
{
	condition = infos_thf_10_hi_condition;
	information = infos_thf_10_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_thf_10_hi_condition()
{
	return TRUE;
};

func void infos_thf_10_hi_info()
{
	AI_Output(other,self,"Infos_Thf_10_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Thf_10_HI_Info_01_02");	//Wenn du überleben willst, dann verlasse nicht das Lager. Draussen gibt es nichts, was es wert wäre sein Leben dafür aufs Spiel zu setzen!
};


instance INFOS_THF_10_CAMP(C_Info)
{
	condition = infos_thf_10_camp_condition;
	information = infos_thf_10_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_thf_10_camp_condition()
{
	return TRUE;
};

func void infos_thf_10_camp_info()
{
	var C_Npc nicolos;
	AI_Output(other,self,"Infos_Thf_10_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Thf_10_CAMP_Info_01_02");	//Wenn du dich mit Snaf dem Koch gutstellst, dann kriegst du eine warme Mahlzeit am Tag.
	AI_Output(self,other,"Infos_Thf_10_CAMP_Info_01_03");	//Ansonsten gilt, verhalte dich ruhig und mache keinen Ärger!
	nicolos = Hlp_GetNpc(wrk_206_nicolos);
	nicolos.aivar[3] = TRUE;
};


instance INFOS_THF_10_BOSS(C_Info)
{
	condition = infos_thf_10_boss_condition;
	information = infos_thf_10_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_thf_10_boss_condition()
{
	return TRUE;
};

func void infos_thf_10_boss_info()
{
	AI_Output(other,self,"Infos_Thf_10_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Thf_10_BOSS_Info_01_02");	//Niemand hat mir etwas zu sagen.
};

func void b_assignambientinfos_thf_10(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_thf_10_exit.npc = Hlp_GetInstanceID(slf);
	infos_thf_10_hi.npc = Hlp_GetInstanceID(slf);
	infos_thf_10_camp.npc = Hlp_GetInstanceID(slf);
	infos_thf_10_boss.npc = Hlp_GetInstanceID(slf);
};

