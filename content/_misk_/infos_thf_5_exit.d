
instance INFOS_THF_5_EXIT(C_Info)
{
	nr = 999;
	condition = infos_thf_5_exit_condition;
	information = infos_thf_5_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_thf_5_exit_condition()
{
	return TRUE;
};

func void infos_thf_5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_THF_5_HI(C_Info)
{
	condition = infos_thf_5_hi_condition;
	information = infos_thf_5_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_thf_5_hi_condition()
{
	return TRUE;
};

func void infos_thf_5_hi_info()
{
	AI_Output(other,self,"Infos_Thf_5_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Thf_5_HI_Info_01_02");	//Mach es wie ich, lebe in den Tag!
	AI_Output(other,self,"Infos_Thf_5_HI_Info_15_03");	//Du scheinst ja richtig gut drauf zu sein.
	AI_Output(self,other,"Infos_Thf_5_HI_Info_01_04");	//Denn jeder Tag könnte dein letzter sein! Wer weiß ob nicht morgen schon die Orks angreifen?
};


instance INFOS_THF_5_CAMP(C_Info)
{
	condition = infos_thf_5_camp_condition;
	information = infos_thf_5_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_thf_5_camp_condition()
{
	return TRUE;
};

func void infos_thf_5_camp_info()
{
	var C_Npc nicolos;
	AI_Output(other,self,"Infos_Thf_5_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Thf_5_CAMP_Info_01_02");	//Die einzige Abwechslung die es hier gibt sind die abendlichen Arenakämpfe.
	AI_Output(self,other,"Infos_Thf_5_CAMP_Info_01_03");	//Den Rest wirst du schon mit der Zeit selber rausfinden.
	nicolos = Hlp_GetNpc(wrk_206_nicolos);
	nicolos.aivar[3] = TRUE;
};


instance INFOS_THF_5_BOSS(C_Info)
{
	condition = infos_thf_5_boss_condition;
	information = infos_thf_5_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_thf_5_boss_condition()
{
	return TRUE;
};

func void infos_thf_5_boss_info()
{
	AI_Output(other,self,"Infos_Thf_5_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Thf_5_BOSS_Info_01_02");	//Unterschiedlich. Die Arbeiter lassen sich nur was vom Baumeister sagen, die Miliz von ihrem Hauptmann, und der Rest lässt sich von keinem was sagen.
};

func void b_assignambientinfos_thf_5(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_thf_5_exit.npc = Hlp_GetInstanceID(slf);
	infos_thf_5_hi.npc = Hlp_GetInstanceID(slf);
	infos_thf_5_camp.npc = Hlp_GetInstanceID(slf);
	infos_thf_5_boss.npc = Hlp_GetInstanceID(slf);
};

