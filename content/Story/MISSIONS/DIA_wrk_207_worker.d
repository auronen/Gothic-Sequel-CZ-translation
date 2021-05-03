
instance INFOS_WRK_1_EXIT(C_Info)
{
	nr = 999;
	condition = infos_wrk_1_exit_condition;
	information = infos_wrk_1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int infos_wrk_1_exit_condition()
{
	return TRUE;
};

func void infos_wrk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_207_WORKER_STEP(C_Info)
{
	npc = wrk_207_worker;
	condition = wrk_207_worker_step_condition;
	information = wrk_207_worker_step_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_207_worker_step_condition()
{
	if(c_npcisinvincible(self) && (Npc_GetDistToWP(self,"OCR_PALISADE_WALK_51B") <= 500))
	{
		return TRUE;
	};
};

func void wrk_207_worker_step_info()
{
	AI_Output(self,other,"Wrk_207_Worker_STEP_Info_15_01");	//Pass auf, das du nicht runterfällst!
};


instance INFOS_WRK_1_HI(C_Info)
{
	condition = infos_wrk_1_hi_condition;
	information = infos_wrk_1_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_wrk_1_hi_condition()
{
	return TRUE;
};

func void infos_wrk_1_hi_info()
{
	AI_Output(other,self,"Infos_Wrk_1_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Wrk_1_HI_Info_01_02");	//Es gibt viel zu tun. Wir müssen vorbereitet sein, falls die Orks kommen.
	AI_Output(other,self,"Infos_Wrk_1_HI_Info_15_03");	//Was meinst du mit Vorbereiten?
	AI_Output(self,other,"Infos_Wrk_1_HI_Info_01_04");	//Einen stabilen Wallschutz aufbauen, Waffen schmieden und Vorräte anlegen. Wir müssen in jeder Hinsicht vorbereitet sein. Jeder von uns. Du solltest dich auch vorbereiten.
};


instance INFOS_WRK_1_CAMP(C_Info)
{
	condition = infos_wrk_1_camp_condition;
	information = infos_wrk_1_camp_info;
	description = "Wie siehts im Lager aus?";
	permanent = TRUE;
};


func int infos_wrk_1_camp_condition()
{
	return TRUE;
};

func void infos_wrk_1_camp_info()
{
	AI_Output(other,self,"Infos_Wrk_1_CAMP_Info_15_01");	//Wie siehts im Lager aus?
	AI_Output(self,other,"Infos_Wrk_1_CAMP_Info_01_02");	//Es könnte besser laufen, wenn mehr Leute arbeiten würden.  Es gibt einfach zuviel Gesindel.
	AI_Output(self,other,"Infos_Wrk_1_CAMP_Info_01_03");	//Das sie faul sind ist eine Sache, aber die sind auch feige. Und damit werden sie für uns völlig wertlos.
	AI_Output(other,self,"Infos_Wrk_1_CAMP_Info_15_04");	//Verstehe. Gerade jetzt ist jeder Mann wichtig.
	AI_Output(self,other,"Infos_Wrk_1_CAMP_Info_01_05");	//Die nicht! Dieses Diebespack, diese faulen Hunde, soll Beliar sie alle holen!
};


instance INFOS_WRK_1_BOSS(C_Info)
{
	condition = infos_wrk_1_boss_condition;
	information = infos_wrk_1_boss_info;
	description = "Wer hat hier das Sagen?";
};


func int infos_wrk_1_boss_condition()
{
	var C_Npc bromor;
	bromor = Hlp_GetNpc(wrk_203_bromor);
	if(bromor.aivar[3] == FALSE)
	{
		return TRUE;
	};
};

func void infos_wrk_1_boss_info()
{
	var C_Npc bromor;
	AI_Output(other,self,"Infos_Wrk_1_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Wrk_1_BOSS_Info_01_02");	//Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.
	bromor = Hlp_GetNpc(wrk_203_bromor);
	bromor.aivar[3] = TRUE;
};

func void b_assignambientinfos_wrk_1(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_wrk_1_exit.npc = Hlp_GetInstanceID(slf);
	infos_wrk_1_hi.npc = Hlp_GetInstanceID(slf);
	infos_wrk_1_camp.npc = Hlp_GetInstanceID(slf);
	infos_wrk_1_boss.npc = Hlp_GetInstanceID(slf);
};

