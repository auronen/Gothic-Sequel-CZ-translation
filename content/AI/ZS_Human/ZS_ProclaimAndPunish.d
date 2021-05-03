
func void ZS_ProclaimAndPunish()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_CombatReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_CombatAssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_CombatAssessDefeat);
	Npc_PercEnable(self,PERC_MOVENPC,B_StopGotoHero);
	if((Npc_IsInFightMode(self,FMODE_FAR) || Npc_IsInFightMode(self,FMODE_MAGIC)) && (Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG))
	{
		b_attackquick(self,hero);
	};
	AI_SetWalkMode(self,NPC_RUN);
};

func int ZS_ProclaimAndPunish_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ProclaimAndPunish_Loop");
	if(Npc_GetStateTime(self) > HAI_TIME_PURSUIT)
	{
		PrintDebugNpc(PD_ZS_Check,"...Verfolgung dauert schon zu lange!");
		AI_ContinueRoutine(self);
	}
	else if(Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		PrintDebugNpc(PD_ZS_Check,"...noch NICHT in Dialogreichweite!");
		AI_GotoNpc(self,hero);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...IN Dialogreichweite!");
		B_FullStop(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_ProclaimAndPunish_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ProclaimAndPunish_End");
	if(C_NpcIsDown(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC mittlerweile am Boden!");
		return;
	};
	if(Npc_WasInState(self,ZS_AssessEnemy))
	{
		if(Wld_GetGuildAttitude(self.guild,hero.guild) == ATT_HOSTILE)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC ist Todfeind!");
			B_SayOverlay(self,hero,"$DieMortalEnemy");
		}
		else if(self.aivar[36])
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat vom NSC geklaut!");
			B_SayOverlay(self,hero,"$DIRTYTHIEF");
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"...Normaler Angriff (SC wurde noch nicht besiegt)!");
			B_SayOverlay(self,hero,"$NowWait");
		};
	}
	else
	{
		if(C_GetAttackReason(self) == AIV_AR_INTRUDER)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat Durchgang durchbrochen!");
			B_SayOverlay(self,hero,"$NowWaitIntruder");
		};
		if(C_GetAttackReason(self) == AIV_AR_DISTURBEDARENA)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat Arenakampf unterbrochen !");
			B_SayOverlay(self,hero,"$YouDisturbedArenaFight");
		};
		if(C_GetAttackReason(self) == AIV_AR_MURDEREDINARENA)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC hat in Arena gemordet !");
			B_SayOverlay(self,hero,"$YouMurderedInArena");
		};
		if(C_GetAttackReason(self) == AIV_AR_ARENABOW)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC kämpft in Arena mit Fernkampfwaffe!");
			B_SayOverlay(self,hero,"$NoBowInArena");
		};
		if(C_GetAttackReason(self) == AIV_AR_ARENAMAGIC)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC kämpft in Arena mit Magie!");
			B_SayOverlay(self,hero,"$NoMagicInArena");
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"...SC greift Schützling einer Wache an !");
			B_SayOverlay(self,hero,"$YouAttackedMyCharge");
		};
	};
	b_attackquick(self,hero);
};

