
const string PAL_1029_CHECKPOINT = "VP_PLATEAU_3";

instance PAL_1029_FIRSTWARN(C_Info)
{
	npc = pal_1029_osraed;
	nr = 1;
	condition = pal_1029_firstwarn_condition;
	information = pal_1029_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1029_firstwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_BEGIN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1029_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"PAL_1029_FirstWarn_Info_06_01");	//HALT!
	AI_Output(hero,self,"PAL_1029_FirstWarn_Info_15_02");	//Was ist?
	AI_Output(self,hero,"PAL_1029_FirstWarn_Info_06_03");	//Hier dürfen nur Gefolgsleute des Königs passieren!
	AI_Output(self,hero,"PAL_1029_FirstWarn_Info_06_04");	//Also verschwinde!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1029_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1029_LASTWARN(C_Info)
{
	npc = pal_1029_osraed;
	nr = 1;
	condition = pal_1029_lastwarn_condition;
	information = pal_1029_lastwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1029_lastwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_FIRSTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1029_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1029_lastwarn_info()
{
	AI_Output(self,hero,"PAL_1029_LastWarn_06_01");	//Noch einen Schritt weiter und wir machen Kleinholz aus dir!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1029_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1029_ATTACK(C_Info)
{
	npc = pal_1029_osraed;
	nr = 1;
	condition = pal_1029_attack_condition;
	information = pal_1029_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1029_attack_condition()
{
	if((hero.aivar[19] == AIV_GPS_LASTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1029_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1029_attack_info()
{
	hero.aivar[20] = 0;
	hero.aivar[19] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,hero);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};


instance PAL_1029_EXIT(C_Info)
{
	npc = pal_1029_osraed;
	nr = 999;
	condition = pal_1029_exit_condition;
	information = pal_1029_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pal_1029_exit_condition()
{
	return 1;
};

func void pal_1029_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PAL_1029_SOLDIER(C_Info)
{
	npc = pal_1029_osraed;
	nr = 1;
	condition = pal_1029_soldier_condition;
	information = pal_1029_soldier_info;
	permanent = FALSE;
	description = "Lass mich rein, ich möchte Soldat des Königs werden!";
};


func int pal_1029_soldier_condition()
{
	if(self.aivar[21] == FALSE)
	{
		return TRUE;
	};
};

func void pal_1029_soldier_info()
{
	AI_Output(hero,self,"PAL_1029_SOLDIER_15_01");	//Lass mich rein, ich möchte Soldat des Königs werden!
	AI_Output(self,hero,"PAL_1029_SOLDIER_06_02");	//Die zwei Spinner da vorne am Lagerfeuer möchten auch Soldat werden.
	AI_Output(self,hero,"PAL_1029_SOLDIER_06_03");	//(spöttisch) Fällt dir nichts besseres ein?
	AI_StopProcessInfos(self);
};


instance PAL_1029_OSRAED_BRIBE(C_Info)
{
	npc = pal_1029_osraed;
	condition = pal_1029_osraed_bribe_condition;
	information = pal_1029_osraed_bribe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Lass mich rein, es soll nicht dein Schaden sein!";
};


func int pal_1029_osraed_bribe_condition()
{
	if(Npc_KnowsInfo(hero,pal_1029_soldier) && (self.aivar[21] == FALSE))
	{
		return TRUE;
	};
};

func void pal_1029_osraed_bribe_info()
{
	AI_Output(hero,self,"PAL_1029_BRIBE_15_01");	//Lass mich rein, es soll nicht dein Schaden sein!
	AI_Output(self,hero,"PAL_1029_BRIBE_06_02");	//(bedrohlich) Soso, du willst mich also bestechen!
	Info_AddChoice(pal_1029_osraed_bribe,"Wieviel?",pal_1029_osraed_bribe_yes);
	Info_AddChoice(pal_1029_osraed_bribe,"Nein, du musst mich missverstanden haben!",pal_1029_osraed_bribe_no);
};

func void pal_1029_osraed_bribe_no()
{
	Info_ClearChoices(pal_1029_osraed_bribe);
	AI_Output(hero,self,"PAL_1029_BRIBE_NO_15_01");	//Nein, du musst mich missverstanden haben!
	AI_Output(self,hero,"PAL_1029_BRIBE_NO_06_02");	//Pah! Erst das Maul aufreissen, dann den Schwanz einkneifen.
	AI_StopProcessInfos(self);
};

func void pal_1029_osraed_bribe_yes()
{
	Info_ClearChoices(pal_1029_osraed_bribe);
	AI_Output(hero,self,"PAL_1029_BRIBE_YES_15_01");	//Wieviel?
	AI_Output(self,hero,"PAL_1029_BRIBE_YES_06_02");	//100 Silber, darunter läuft nichts!
	BF_OUTERGATEBRIBABLE = TRUE;
};


instance PAL_1029_OSRAED_GIVESILVER(C_Info)
{
	npc = pal_1029_osraed;
	condition = pal_1029_osraed_givesilver_condition;
	information = pal_1029_osraed_givesilver_info;
	important = FALSE;
	permanent = TRUE;
	description = "(100 Silber geben)";
};


func int pal_1029_osraed_givesilver_condition()
{
	if(BF_OUTERGATEBRIBABLE && !BF_OUTERGATE_BRIBED)
	{
		return TRUE;
	};
};

func void pal_1029_osraed_givesilver_info()
{
	var C_Npc comrade;
	if(Npc_HasItems(hero,itmi_silver) >= BF_BRIBE_OUTERGATE)
	{
		B_GiveInvItems(hero,self,itmi_silver,BF_BRIBE_OUTERGATE);
		AI_Output(hero,self,"PAL_1029_GIVESILVER_15_01");	//Ich sagte doch, es soll nicht dein Schaden sein.
		AI_Output(self,hero,"PAL_1029_GIVESILVER_06_02");	//Wenn du jemanden hiervon erzählst bist du tot!
		AI_Output(self,hero,"PAL_1029_GIVESILVER_06_03");	//Jetzt mach dass du rein kommst und mach keinen Ärger!
		self.aivar[21] = TRUE;
		comrade = Hlp_GetNpc(pal_1030_auxiliary);
		comrade.aivar[21] = TRUE;
		BF_OUTERGATE_BRIBED = TRUE;
	}
	else
	{
		B_Say(self,hero,"$NotEnoughSilver");
	};
};


instance PAL_1029_OSRAED_HOWDYBRIBED(C_Info)
{
	npc = pal_1029_osraed;
	condition = pal_1029_osraed_howdybribed_condition;
	information = pal_1029_osraed_howdybribed_info;
	important = FALSE;
	permanent = TRUE;
	description = "Gib mir meine 100 Silber zurück!";
};


func int pal_1029_osraed_howdybribed_condition()
{
	if(BF_OUTERGATE_BRIBED && BF_INNERGATE_ATTACKED)
	{
		return TRUE;
	};
};

func void pal_1029_osraed_howdybribed_info()
{
	AI_Output(hero,self,"PAL_1029_HOWDYBRIBED_15_01");	//Gib mir meine 100 Silber zurück!
	AI_Output(self,hero,"PAL_1029_HOWDYBRIBED_06_02");	//(gekünstelt) Ich weiss nicht wovon du sprichst. Zieh Leine!
	AI_StopProcessInfos(self);
};


instance PAL_1029_OSRAED_HALTTHORA(C_Info)
{
	npc = pal_1029_osraed;
	condition = pal_1029_osraed_haltthora_condition;
	information = pal_1029_osraed_haltthora_info;
	important = TRUE;
	permanent = FALSE;
};


func int pal_1029_osraed_haltthora_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate) && b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1029_osraed_haltthora_info()
{
	var C_Npc thora;
	var C_Npc comrade;
	thora = Hlp_GetNpc(amz_900_thora);
	AI_Output(self,hero,"PAL_1029_HALTTHORA_06_01");	//HALT! Hier ist kein...
	AI_TurnToNPC(self,thora);
	AI_Output(self,hero,"PAL_1029_HALTTHORA_06_02");	//(schmierig) Ah, Thora...! Mein Einladung zu einer Flasche Wein steht immer noch.!
	AI_TurnToNPC(thora,self);
	AI_Output(thora,hero,"PAL_1029_HALTTHORA_06_03");	//(kalt) Träum weiter, Schmierlocke!
	AI_TurnToNPC(self,hero);
	AI_Output(self,hero,"PAL_1029_HALTTHORA_06_04");	//Gut du kannst passieren!
	AI_Output(self,hero,"PAL_1029_HALTTHORA_06_05");	//Ach nochwas...
	AI_Output(hero,self,"PAL_1029_HALTTHORA_15_06");	//Was?
	AI_Output(self,hero,"PAL_1029_HALTTHORA_06_07");	//(leise) Nur das das klar ist. Finger weg von Thora, sie gehört mir (krankes Lachen)!
	self.aivar[21] = TRUE;
	comrade = Hlp_GetNpc(pal_1030_auxiliary);
	comrade.aivar[21] = TRUE;
};


instance PAL_1029_OSRAED_FODDER(C_Info)
{
	npc = pal_1029_osraed;
	condition = pal_1029_osraed_fodder_condition;
	information = pal_1029_osraed_fodder_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ihr seid also das billige Orkfutter der Paladine?";
};


func int pal_1029_osraed_fodder_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate))
	{
		return TRUE;
	};
};

func void pal_1029_osraed_fodder_info()
{
	AI_Output(hero,self,"PAL_1029_FODDER_15_01");	//Ihr seid also das billige Orkfutter der Paladine?
	if(b_npcisnear(hero,7618))
	{
		AI_Output(self,hero,"PAL_1029_FODDER_06_02");	//(gepresst) Wenn du nicht mit Thora hier angekommen wärst, dann würde ich dich jetzt einen Kopf kürzer machen.
	}
	else
	{
		AI_Output(self,hero,"PAL_1029_FODDER_06_03");	//Na warte, diese Beleidigung wirst du mit Deinem Leben bezahlen!
		b_setattitude(self,ATT_HOSTILE);
	};
	AI_StopProcessInfos(self);
};

