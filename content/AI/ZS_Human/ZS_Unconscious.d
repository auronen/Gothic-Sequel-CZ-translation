
func void ZS_Unconscious()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	self.aivar[4] = FALSE;
	C_StopLookAt(self);
	AI_StopPointAt(self);
	if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) && B_CompareNpcInstance(other,hero))
	{
		b_setattitude(self,ATT_ANGRY);
	};
	if(C_BodyStateContains(self,BS_SWIM))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC ertrinkt!");
		AI_StartState(self,ZS_Dead,0,"");
		return;
	};
	if(ARENA_FIGHTRUNNING && ((ARENA_PLAYERFIGHT && (Npc_IsPlayer(self) || Npc_IsPlayer(other))) || (ARENA_NPCFIGHT && (Npc_WasInState(self,zs_attackarena) || Npc_WasInState(other,zs_attackarena)))))
	{
		b_arena_assessscore();
		return;
	};
	if(Npc_IsPlayer(other) || (C_NpcIsHuman(other) && other.aivar[27]) || (C_NpcIsMonster(other) && other.aivar[23]))
	{
		PrintDebugNpc(PD_ZS_Check,"...von SC oder Partymember besiegt!");
		B_UnconciousXP();
		self.aivar[12] = TRUE;
	};
	if(Npc_IsPlayer(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC besiegt!");
		other.aivar[13] = TRUE;
	};
};

func int ZS_Unconscious_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Unconscious_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_UNCONSCIOUS)
	{
		PrintDebugNpc(PD_ZS_Check,"...Schleifen-Ende");
		return LOOP_END;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Unconscious_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious_End");
	if(C_NpcIsOrc(self) && !Npc_IsPlayer(self))
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious_End: Me, Orc -> temp-HOSTILE");
		AI_Standup(self);
		Npc_PerceiveAll(self);
		if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
		{
			PrintDebugNpc(PD_ZS_Check,"ZS_Unconscious_End: Me, Orc -> Waffe aufheben");
			if(Npc_CanSeeItem(self,item))
			{
				AI_TakeItem(self,item);
			};
		};
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
		return;
	};
	if(!Npc_IsPlayer(self))
	{
		B_ResetTempAttitude(self);
	};
	AI_Standup(self);
	AI_StopLookAt(self);
	B_RegainDroppedWeapon(self);
	AI_StartState(self,ZS_HealSelf,1,"");
};

