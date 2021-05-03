
func void zs_horn()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smoke");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	if(!(Npc_HasItems(self,itmi_alarmhorn) >= 1))
	{
		CreateInvItem(self,itmi_alarmhorn);
	};
};

func int zs_horn_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Horn_Loop");
	AI_UseItem(self,itmi_alarmhorn);
	AI_Wait(self,4);
};

func void zs_horn_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Horn_End");
	AI_UseItemToState(self,itmi_alarmhorn,-1);
};

