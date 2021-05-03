
func void ZS_Preach()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Preach");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self,self.wp);
	};
	B_GotoFP(self,"PREACH");
};

func void ZS_Preach_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Preach_Loop");
	AI_Wait(self,1);
};

func void ZS_Preach_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Preach_End");
};

