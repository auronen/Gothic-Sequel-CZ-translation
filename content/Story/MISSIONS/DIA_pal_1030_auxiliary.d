
const string PAL_1030_CHECKPOINT = "VP_PLATEAU_3";

instance PAL_1030_FIRSTWARN(C_Info)
{
	npc = pal_1030_auxiliary;
	nr = 1;
	condition = pal_1030_firstwarn_condition;
	information = pal_1030_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1030_firstwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_BEGIN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1030_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"PAL_1030_FirstWarn_Info_07_01");	//HEH DU DA!
	AI_Output(hero,self,"PAL_1030_FirstWarn_Info_15_02");	//Äh ich?
	AI_Output(self,hero,"PAL_1030_FirstWarn_Info_07_03");	//Du gehörst nicht zum Gefolge des Königs!
	AI_Output(self,hero,"PAL_1030_FirstWarn_Info_07_04");	//Also ziehe Leine, sonst mach ich dir Beine!
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1030_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_FIRSTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1030_LASTWARN(C_Info)
{
	npc = pal_1030_auxiliary;
	nr = 1;
	condition = pal_1030_lastwarn_condition;
	information = pal_1030_lastwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1030_lastwarn_condition()
{
	if((hero.aivar[19] == AIV_GPS_FIRSTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1030_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1030_lastwarn_info()
{
	AI_Output(self,hero,"PAL_1030_LastWarn_07_01");	//KEINEN SCHRITT WEITER! Oder du siehst die Radieschen von unten!
	AI_Output(self,hero,"PAL_1030_LastWarn_07_02");	//
	hero.aivar[20] = Npc_GetDistToWP(hero,PAL_1030_CHECKPOINT);
	hero.aivar[19] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance PAL_1030_ATTACK(C_Info)
{
	npc = pal_1030_auxiliary;
	nr = 1;
	condition = pal_1030_attack_condition;
	information = pal_1030_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int pal_1030_attack_condition()
{
	if((hero.aivar[19] == AIV_GPS_LASTWARN) && (self.aivar[21] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,PAL_1030_CHECKPOINT) < (hero.aivar[20] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func int pal_1030_attack_info()
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


instance PAL_1030_EXIT(C_Info)
{
	npc = pal_1030_auxiliary;
	nr = 999;
	condition = pal_1030_exit_condition;
	information = pal_1030_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pal_1030_exit_condition()
{
	return 1;
};

func void pal_1030_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PAL_1030_AUXILIARY_WANTIN(C_Info)
{
	npc = pal_1030_auxiliary;
	nr = 10;
	condition = pal_1030_auxiliary_wantin_condition;
	information = pal_1030_auxiliary_wantin_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich möchte in die Festung!";
};


func int pal_1030_auxiliary_wantin_condition()
{
	if(!b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1030_auxiliary_wantin_info()
{
	AI_Output(hero,self,"PAL_1030_WANTIN_15_01");	//Ich möchte in die Festung!
	AI_Output(self,hero,"PAL_1030_WANTIN_07_02");	//Sprich mit Osraed, er hat am Tor das Sagen!
	AI_StopProcessInfos(self);
};


instance PAL_1030_AUXILIARY_HALTTHORA(C_Info)
{
	npc = pal_1030_auxiliary;
	condition = pal_1030_auxiliary_haltthora_condition;
	information = pal_1030_auxiliary_haltthora_info;
	important = TRUE;
	permanent = FALSE;
};


func int pal_1030_auxiliary_haltthora_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate) && b_npcisnear(hero,7618))
	{
		return TRUE;
	};
};

func void pal_1030_auxiliary_haltthora_info()
{
	AI_Output(self,hero,"PAL_1030_HALTTHORA_07_01");	//HEH DU DA!
	AI_Output(self,hero,"PAL_1030_HALTTHORA_07_02");	//(misstrauisch) Thoras Kamerad, wie?
	AI_Output(self,hero,"PAL_1030_HALTTHORA_07_03");	//OK, kannst passieren!
	AI_StopProcessInfos(self);
};

