
func void zs_walkidiot()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_WalkIdiot");
	b_setpossesseddefaultperceptions();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
};

func int zs_walkidiot_loop()
{
	var int idiottime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_WalkIdiot_Loop");
	idiottime = Hlp_Random(100);
	if(Npc_IsOnFP(self,"WALK_A_") && Wld_IsFPAvailable(self,"WALK_B_"))
	{
		if(idiottime < 75)
		{
			B_GotoFP(self,"WALK_B_");
			PrintDebugNpc(PD_TA_LOOP,"Gehe zu FP B");
		};
		if(idiottime < 80)
		{
			AI_PlayAni(self,"T_STAND_2_MAD");
			AI_PlayAni(self,"S_MAD");
			AI_PlayAni(self,"T_MAD_2_STAND");
			PrintDebugNpc(PD_TA_LOOP,"Spiele MAD 1 Ani");
		};
		if(idiottime < 90)
		{
		};
		if(idiottime < 95)
		{
			AI_PlayAni(self,"T_STAND_2_MAD");
			AI_PlayAni(self,"S_MAD");
			AI_PlayAni(self,"T_MAD_2_MADDOWN");
			AI_PlayAni(self,"S_MADDOWN");
			AI_PlayAni(self,"T_MADDOWN_2_STAND");
			AI_PlayAni(self,"T_MAD_2_STAND");
			PrintDebugNpc(PD_TA_LOOP,"Spiele MAD 3 Ani");
		};
		if(idiottime < 100)
		{
		};
	}
	else if(Npc_IsOnFP(self,"WALK_B_") && Wld_IsFPAvailable(self,"WALK_A_"))
	{
		if(idiottime < 75)
		{
			B_GotoFP(self,"WALK_A_");
			PrintDebugNpc(PD_TA_LOOP,"Gehe zu FP A");
		};
		if(idiottime < 80)
		{
			AI_PlayAni(self,"T_STAND_2_MAD");
			AI_PlayAni(self,"S_MAD");
			AI_PlayAni(self,"T_MAD_2_STAND");
			PrintDebugNpc(PD_TA_LOOP,"Spiele MAD Ani");
		};
		if(idiottime < 90)
		{
		};
		if(idiottime < 95)
		{
			AI_PlayAni(self,"T_STAND_2_MAD");
			AI_PlayAni(self,"S_MAD");
			AI_PlayAni(self,"T_MAD_2_MADDOWN");
			AI_PlayAni(self,"S_MADDOWN");
			AI_PlayAni(self,"T_MADDOWN_2_STAND");
			AI_PlayAni(self,"T_MAD_2_STAND");
			PrintDebugNpc(PD_TA_LOOP,"Spiele MAD 3 Ani");
		};
		if(idiottime < 100)
		{
		};
	}
	else
	{
		B_GotoFP(self,"WALK_A_");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_walkidiot_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Walk_End");
};

