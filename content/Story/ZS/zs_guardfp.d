
func void zs_guardfp()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_GuardFP");
	GuardPerception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"GUARD"))
	{
		AI_GotoWP(self,self.wp);
	};
	B_InitArmor();
};

func void zs_guardfp_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_GuardFP_Loop");
	B_GotoFP(self,"GUARD");
	if((Npc_GetDistToNpc(self,hero) < 800) && Npc_CanSeeNpc(self,hero))
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP(self);
	};
	B_PlayArmor();
	AI_Wait(self,0.5);
};

func void zs_guardfp_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_GuardFP_End");
	B_ExitArmor();
};

