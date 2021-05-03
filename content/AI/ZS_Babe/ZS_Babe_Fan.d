
func void ZS_Babe_Fan()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Babe_Fan");
	AI_UnequipArmor(self);
	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_HasItems(self,itmi_wedel) < 1)
	{
		CreateInvItem(self,itmi_wedel);
	};
	if(Wld_IsFPAvailable(self,"FAN"))
	{
		B_GotoFP(self,"FAN");
		AI_AlignToFP(self);
		AI_UseItemToState(self,itmi_wedel,1);
		Mdl_ApplyRandomAni(self,"s_COOLAIR_S1","t_COOLAIR_RANDOM_1");
		Mdl_ApplyRandomAniFreq(self,"s_COOLAIR_S1",5);
	}
	else
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func void ZS_Babe_Fan_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Babe_Fan_Loop");
};

func void ZS_Babe_Fan_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Babe_Fan_End");
	AI_UseItemToState(self,itmi_wedel,-1);
};

