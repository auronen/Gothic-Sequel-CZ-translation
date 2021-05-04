
func void ZS_Meditate()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE"))
	{
		B_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,ZS_Teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		B_SmartTurnToNpc(self,other);
	};
	AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
};

func void ZS_Meditate_Loop()
{
	var int praytime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	if(praytime <= 2)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	if(praytime >= 98)
	{
		AI_Output(self,NULL,"ZS_Meditate_Om");	//Omm...
	};
	AI_Wait(self,1);
};

func void ZS_Meditate_End()
{
	C_StopLookAt(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate_End");
};
