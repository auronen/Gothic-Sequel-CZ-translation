
func void ZS_RoastScavenger()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_RoastScavenger");
	B_SetPerception(self);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		B_StartUseMob(self,"BARBQ");
	};
};

func int ZS_RoastScavenger_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_RoastScavenger_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob("BARBQ");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_RoastScavenger_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_RoastScavenger_End");
	AI_UseMob(self,"BARBQ",-1);
};

