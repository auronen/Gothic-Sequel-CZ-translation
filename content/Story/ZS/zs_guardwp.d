
func void zs_guardwp()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Guard");
	GuardPerception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	B_InitArmor();
};

func void zs_guardwp_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Guard_Loop");
	b_gotonearwp(self,self.wp);
	B_PlayArmor();
	AI_Wait(self,0.5);
};

func void zs_guardwp_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Guard_End");
	B_ExitArmor();
};

