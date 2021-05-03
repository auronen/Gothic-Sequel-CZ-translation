
func void ZS_Sleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Sleep");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
		{
			AI_GotoWP(self,self.wp);
		};
	};
	AI_StartState(self,ZS_SleepBed,1,"");
};

func int ZS_SleepBed()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBed");
	LightSleepPerception();
	if(Wld_IsMobAvailable(self,SCEMENAME_BED))
	{
		AI_UseMob(self,SCEMENAME_BED,1);
	}
	else if(Wld_IsMobAvailable(self,SCEMENAME_BEDHIGH) || Wld_IsMobAvailable(self,SCEMENAME_BEDLOW))
	{
		AI_UseMob(self,SCEMENAME_BEDHIGH,1);
		AI_UseMob(self,SCEMENAME_BEDLOW,1);
	}
	else
	{
		AI_StartState(self,ZS_StandAround,0,"");
	};
	return LOOP_CONTINUE;
};

func int ZS_SleepBed_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_SleepBed_Loop");
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_SleepBed_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBed_End");
	if(Wld_IsTime(7,0,8,30))
	{
		B_Say(self,NULL,"$AWAKE");
	};
	AI_UseMob(self,SCEMENAME_BEDHIGH,-1);
	AI_UseMob(self,SCEMENAME_BEDLOW,-1);
	AI_UseMob(self,SCEMENAME_BED,-1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX] - self.attribute);
};

func void B_SleepQuietSound()
{
	PrintDebugNpc(PD_TA_DETAIL,"B_SleepQuietSound");
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		AI_StartState(self,ZS_WakeUp,1,"");
	}
	else
	{
		B_TossAndTurn();
	};
};

func void zs_arenasleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaSleep");
	B_SetPerception(self);
	b_arena_regaindroppedweapon(Hlp_GetInstanceID(self));
	AI_StartState(self,ZS_Sleep,1,"");
};

