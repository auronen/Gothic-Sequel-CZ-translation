
func void ZS_AssessDefeat()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessDefeat");
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	PrintGlobals(PD_ZS_Check);
	if(c_isarenafight(other,victim))
	{
		AI_ContinueRoutine(self);
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(C_NpcIsMonster(other))
		{
			PrintDebugNpc(PD_ZS_Check,"...Sieg von oder über Monster!");
			AI_StartState(self,ZS_AssessMonster,0,"");
			return;
		}
		else if(C_NpcIsMonster(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"...Sieg an Monster!");
			B_WhirlAround(self,victim);
			return;
		};
		B_FullStop(self);
		AI_TurnToNPC(self,other);
		C_LookAtNpc(self,other);
		if(C_ChargeWasAttacked(self,victim,other))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ist Wache und ein Schützling wurde besiegt!");
			B_DrawWeapon(self,other);
			AI_StartState(self,ZS_ProclaimAndPunish,0,"");
			return;
		}
		else if(Npc_GetTempAttitude(self,other) == ATT_HOSTILE)
		{
			B_AssessEnemy();
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"...Default!");
			B_Say(self,NULL,"$HEDEFEATEDHIM");
		};
		AI_Wait(self,1);
		C_StopLookAt(self);
	};
};

