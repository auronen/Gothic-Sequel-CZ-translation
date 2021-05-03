
func void b_setpossesseddefaultperceptions()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,ZS_Talk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,zs_possessed_flee);
	Npc_PercEnable(self,PERC_DRAWWEAPON,zs_possessed_flee);
};

func void b_possessed_refusetalk()
{
	AI_LookAtNpc(self,other);
	PrintDebugNpc(PD_ZS_FRAME,"B_Possessed_RefuseTalk");
	B_Say(self,other,"$POSSESSED1");
	AI_StopLookAt(self);
};

func void zs_possessed_flee()
{
	B_FullStop(self);
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Possessed_Flee");
	b_setpossesseddefaultperceptions();
	AI_SetWalkMode(self,NPC_RUN);
	B_Say(self,NULL,"$POSSESSED2");
	if(!Hlp_IsValidNpc(other))
	{
		PrintDebugNpc(PD_ZS_Check,"Other nicht Valid.");
		AI_ContinueRoutine(self);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"Ich hau lieber ab.");
		AI_GotoWP(self,"OCR_MEDICUS_TENT_02");
	};
};

func int zs_possessed_flee_loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Possessed_Flee_Loop");
	if(Npc_GetDistToNpc(self,other) <= HAI_DIST_ABORT_FLEE)
	{
		AI_GotoWP(self,"OCR_GHETTO_13");
	}
	else
	{
		AI_ContinueRoutine(self);
	};
	if(Npc_GetStateTime(self) >= 10)
	{
		PrintDebugNpc(PD_ZS_LOOP,"Die Zeit zum fliehen ist vorbei");
		AI_ContinueRoutine(self);
	};
};

func void zs_possessed_flee_end()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Possessed_Flee_End");
	B_Say(self,other,"$POSSESSED2");
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),self.wp))
	{
		AI_GotoWP(self,"OCR_GHETTO_14");
		AI_Wait(self,20);
	};
};

func void zs_possessedsleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PossessedSleep");
	b_setpossesseddefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_possessedsleep_loop()
{
	return LOOP_END;
};

func void zs_possessedsleep_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PossessedSleep_End");
	AI_StartState(self,zs_possessedsleepbed,1,"");
};

func int zs_possessedsleepbed()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PossessedSleepBed");
	b_setpossesseddefaultperceptions();
	if(Wld_IsMobAvailable(self,SCEMENAME_BEDLOW))
	{
		AI_UseMob(self,SCEMENAME_BEDLOW,1);
	}
	else
	{
		AI_StartState(self,zs_walkidiot,1,"");
	};
	return LOOP_CONTINUE;
};

func int zs_possessedsleepbed_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_PossessedSleepBed_Loop");
	AI_Wait(self,10);
	return LOOP_CONTINUE;
};

func void zs_possessedsleepbed_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PossessedSleepBed_End");
	AI_UseMob(self,SCEMENAME_BEDLOW,-1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX] - self.attribute);
};

