
func void B_RefuseTalk()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_RefuseTalk");
	B_SmartTurnToNpc(self,other);
	B_Say(self,other,"$NOTNOW");
	C_StopLookAt(self);
};

func void ZS_Talk()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk");
	if(c_npcisinvincible(other))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC spricht schon!");
		AI_ContinueRoutine(self);
		return;
	};
	C_ZSInit();
	B_SetFaceExpression(self,other);
	self.aivar[24] = TRUE;
	other.aivar[24] = TRUE;
	if(Npc_GetDistToNpc(other,self) < 80)
	{
		AI_Dodge(other);
	};
	if((Npc_GetTempAttitude(self,other) == ATT_HOSTILE) && (self.aivar[30] == FALSE))
	{
		Npc_SetTarget(self,other);
		B_AssessEnemy();
	};
	B_FullStop(hero);
	if(!C_BodyStateContains(self,BS_SIT) || !Npc_CanSeeNpc(self,hero))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_TurnToNPC(hero,self);
	if(!hero.aivar[15])
	{
		B_GuildGreetings();
	};
	if((self.npcType == npctype_main) || (self.npcType == npctype_friend))
	{
		Npc_SetKnowsPlayer(self,other);
	};
	B_AssignAmbientInfos(self);
	if((self.aivar[36] > AIV_NODEED) && (Npc_GetPermAttitude(self,other) == ATT_ANGRY))
	{
		PrintDebugNpc(PD_ZS_FRAME,"NEws ANGRY");
		b_assigntheftinfos(self);
	};
	if(b_murderteller())
	{
		b_assignmurderinfos(self);
	};
	if(self.aivar[42] == TRUE)
	{
		b_getbackpersonalweapon(self);
	};
	if(self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	{
		b_assigndamageinfos(self);
	};
	self.aivar[3] = TRUE;
	AI_ProcessInfos(self);
};

func int ZS_Talk_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Talk_Loop");
	if(C_BodyStateContains(self,BS_SIT))
	{
		if(self.aivar[7] <= 1)
		{
			AI_LookAtNpc(self,other);
		};
	};
	if(InfoManager_HasFinished())
	{
		PrintDebugNpc(PD_ZS_Check,"...InfoManager beendet!");
		self.aivar[24] = FALSE;
		other.aivar[24] = FALSE;
		B_ResetFaceExpression(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_Talk_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Talk_End");
};

