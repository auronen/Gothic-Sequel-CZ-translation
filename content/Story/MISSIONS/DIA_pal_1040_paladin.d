
const string PAL_1040_CHECKPOINT = "BF_BRIDGE_02";

instance PAL_1040_FIRSTWARN(C_Info)
{
	npc = pal_1040_paladin;
	nr = 1;
	condition = pal_1040_firstwarn_condition;
	information = pal_1040_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1040_firstwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_BEGIN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1040_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"PAL_1040_FirstWarn_Info_07_01");	//KEIN ZUTRITT!
	AI_Output(hero,self,"PAL_1040_FirstWarn_Info_15_02");	//Ich will in die Festung!
	AI_Output(self,hero,"PAL_1040_FirstWarn_Info_07_03");	//Nur Gefolgsleute des Königs!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1040_LASTWARN(C_Info)
{
	npc = pal_1040_paladin;
	nr = 1;
	condition = pal_1040_lastwarn_condition;
	information = pal_1040_lastwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1040_lastwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_FIRSTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1040_lastwarn_info()
{
	AI_Output(self,hero,"PAL_1040_LastWarn_07_01");	//KEINEN SCHRITT WEITER!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1040_ATTACK(C_Info)
{
	npc = pal_1040_paladin;
	nr = 1;
	condition = pal_1040_attack_condition;
	information = pal_1040_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1040_attack_condition()
{
	if((hero.aivar[19] == AIV_GPS_LASTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1040_attack_info()
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


instance PAL_1040_EXIT(C_Info)
{
	npc = pal_1040_paladin;
	nr = 999;
	condition = pal_1040_exit_condition;
	information = pal_1040_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pal_1040_exit_condition()
{
	return 1;
};

func void pal_1040_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PAL_1040_PALADIN_WANTIN(C_Info)
{
	npc = pal_1040_paladin;
	nr = 10;
	condition = pal_1040_paladin_wantin_condition;
	information = pal_1040_paladin_wantin_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich möchte in die Festung!";
};


func int pal_1040_paladin_wantin_condition()
{
	if(!b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1040_paladin_wantin_info()
{
	AI_Output(hero,self,"PAL_1040_WANTIN_15_01");	//Ich möchte in die Festung.
	AI_Output(self,hero,"PAL_1040_WANTIN_07_02");	//Nur Gefolgsleute des Königs!
	AI_StopProcessInfos(self);
};


instance PAL_1040_PALADIN_HALTTHORA(C_Info)
{
	npc = pal_1040_paladin;
	condition = pal_1040_paladin_haltthora_condition;
	information = pal_1040_paladin_haltthora_info;
	important = TRUE;
	permanent = FALSE;
};


func int pal_1040_paladin_haltthora_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate) && b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1040_paladin_haltthora_info()
{
	var C_Npc thora;
	thora = Hlp_GetNpc(amz_900_thora);
	AI_TurnToNPC(self,thora);
	AI_Output(self,hero,"PAL_1040_HALTTHORA_07_01");	//Thora, du kannst passieren...mit Begleitung!
	AI_StopProcessInfos(self);
};

