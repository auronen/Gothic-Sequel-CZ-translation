
func void ZS_Listen()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_LISTEN");
	self.aivar[23] = FALSE;
	OccupiedPerception();
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoWP(self,self.wp);
	};
};

func void ZS_Listen_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_LISTEN");
	B_GotoFP(self,"LISTEN");
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};
	if(Wld_DetectNpc(self,-1,ZS_Teaching,-1))
	{
		C_LookAtNpc(self,other);
	};
	AI_Wait(self,1);
};

func void ZS_Listen_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Listen_End");
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
		C_StopLookAt(self);
	};
};

