
func void zs_sleepnosense()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepNoSense");
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
	AI_StartState(self,zs_sleepbednosense,1,"");
};

func void zs_sleepbednosense()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBedNoSense");
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
};

func int zs_sleepbednosense_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_SleepBedNoSense_Loop");
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sleepbednosense_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBedNoSense_End");
	if(Wld_IsTime(7,0,8,30))
	{
		B_Say(self,NULL,"$AWAKE");
	};
	AI_UseMob(self,SCEMENAME_BEDHIGH,-1);
	AI_UseMob(self,SCEMENAME_BEDLOW,-1);
	AI_UseMob(self,SCEMENAME_BED,-1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX] - self.attribute);
};

