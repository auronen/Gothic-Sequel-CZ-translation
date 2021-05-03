
const string PAL_1039_CHECKPOINT = "BF_BRIDGE_02";

instance PAL_1039_FIRSTWARN(C_Info)
{
	npc = pal_1039_paladin;
	nr = 1;
	condition = pal_1039_firstwarn_condition;
	information = pal_1039_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1039_firstwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_BEGIN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1039_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"PAL_1039_FirstWarn_Info_07_01");	//HALT!
	AI_Output(hero,self,"PAL_1039_FirstWarn_Info_15_02");	//Kann ich passieren!
	AI_Output(self,hero,"PAL_1039_FIRSTWARN_INFO_07_03");	//NEIN!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1039_LASTWARN(C_Info)
{
	npc = pal_1039_paladin;
	nr = 1;
	condition = pal_1039_lastwarn_condition;
	information = pal_1039_lastwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1039_lastwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_FIRSTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1039_lastwarn_info()
{
	AI_Output(self,hero,"PAL_1039_LastWarn_07_01");	//BLEIB SOFORT STEHEN!!!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1039_ATTACK(C_Info)
{
	npc = pal_1039_paladin;
	nr = 1;
	condition = pal_1039_attack_condition;
	information = pal_1039_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1039_attack_condition()
{
	if((hero.aivar[19] == AIV_GPS_LASTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1039_attack_info()
{
	hero.aivar[20] = 0;
	hero.aivar[19] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};


instance PAL_1039_EXIT(C_Info)
{
	npc = pal_1039_paladin;
	nr = 999;
	condition = pal_1039_exit_condition;
	information = pal_1039_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pal_1039_exit_condition()
{
	return 1;
};

func void pal_1039_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PAL_1039_PALADIN_WANTIN(C_Info)
{
	npc = pal_1039_paladin;
	nr = 10;
	condition = pal_1039_paladin_wantin_condition;
	information = pal_1039_paladin_wantin_info;
	important = FALSE;
	permanent = TRUE;
	description = "Warum kann ich nicht in die Festung?";
};


func int pal_1039_paladin_wantin_condition()
{
	if(!b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1039_paladin_wantin_info()
{
	AI_Output(hero,self,"PAL_1039_WANTIN_15_01");	//Warum kann ich nicht in die Festung?
	AI_Output(self,hero,"PAL_1039_WANTIN_07_02");	//Du siehst nicht aus wie ein Gefolgsmann des Königs!
	BF_INNERGATE_BRIBABLE = TRUE;
	AI_StopProcessInfos(self);
};


instance PAL_1039_PALADIN_BRIBE(C_Info)
{
	npc = pal_1039_paladin;
	condition = pal_1039_paladin_bribe_condition;
	information = pal_1039_paladin_bribe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Vielleicht kann ein wenig Silber das ändern.";
};


func int pal_1039_paladin_bribe_condition()
{
	if(BF_INNERGATE_BRIBABLE)
	{
		return TRUE;
	};
};

func void pal_1039_paladin_bribe_info()
{
	AI_Output(hero,self,"PAL_1039_BRIBE_15_01");	//Vielleicht kann ein wenig Silber das ändern.
	AI_Output(self,hero,"PAL_1039_BRIBE_08_02");	//(wütend) Soldat des Königs sind unbestechlich!
	AI_Output(self,hero,"PAL_1039_BRIBE_08_03");	//Ich werde dafür sorgen, dass du das nie vergisst!
	b_attackproper(self,hero);
	BF_INNERGATE_ATTACKED = TRUE;
};


instance PAL_1039_PALADIN_HALTTHORA(C_Info)
{
	npc = pal_1039_paladin;
	condition = pal_1039_paladin_haltthora_condition;
	information = pal_1039_paladin_haltthora_info;
	important = TRUE;
	permanent = FALSE;
};


func int pal_1039_paladin_haltthora_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate) && b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1039_paladin_haltthora_info()
{
	var C_Npc thora;
	thora = Hlp_GetNpc(amz_900_thora);
	AI_TurnToNPC(self,thora);
	AI_Output(self,hero,"PAL_1039_HALTTHORA_07_01");	//Thora, du kannst passieren...mit Begleitung!
	AI_StopProcessInfos(self);
};

