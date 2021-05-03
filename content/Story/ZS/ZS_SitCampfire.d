
func void ZS_SitCampfire()
{
	GuardPerception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	PrintDebugNpc(PD_TA_FRAME,"ZS_SitCampfire");
	if(!C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_FRAME,"ZS_SitCampfire sitzt nicht");
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToFP(self);
};

func int ZS_SitCampfire_loop()
{
	if(!C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_SitCampfire sitzt nicht");
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		if(Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_SitCampfire ... Freepoint vorhanden");
			B_GotoFP(self,"FP_CAMPFIRE");
		}
		else
		{
			PrintDebugNpc(PD_TA_LOOP,"ZS_SitCampfire ...kein Freier FP");
			AI_StartState(self,ZS_SitAround,0,"");
		};
		self.aivar[7] = 1;
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};
	return LOOP_CONTINUE;
};

func void ZS_SitCampfire_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");
};

func void zs_arenasitcampfire()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaSitCampfire");
	B_SetPerception(self);
	b_arena_regaindroppedweapon(Hlp_GetInstanceID(self));
	AI_StartState(self,ZS_SitCampfire,1,"");
};

