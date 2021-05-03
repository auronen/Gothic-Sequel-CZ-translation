
func void ZS_AssessWarn()
{
	var string nextWP;
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessWarn");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_SetPercTime(self,1);
	if((victim.aivar[32] == TRUE) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		b_attackquick(self,other);
	};
	if(C_NpcIsGuard(self) && (Npc_IsInState(victim,ZS_CallGuardsOnEnterRoom) || Npc_WasInState(victim,ZS_CallGuardsOnEnterRoom)) && !Npc_IsInState(self,ZS_GuardPassage) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_Check,"...verlassener Portalraum gehört Schützling-Gilde!");
		Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
		B_WhirlAround(self,other);
		b_pointandshout(self,other,"$HEYYOU");
		Npc_PercDisable(self,PERC_MOVENPC);
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoNpc(self,other);
		B_Say(self,other,"$WHATDIDYOUINTHERE");
	};
	if(C_NpcIsGuardArcher(self) && Npc_IsInState(victim,ZS_CallGuardsOnEnterRoom) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_Check,"...Warnung von Schützling, dessen Raum betreten/verlassen wurde!");
		if(other.aivar[6] == FALSE)
		{
			B_WhirlAround(self,hero);
			b_pointandshout(self,other,"$HEYYOU");
			B_DrawWeapon(self,other);
			B_Say(self,hero,"$GETOUTOFHERE");
			b_attackquick(self,hero);
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"Eindringling ist schon bestraft worden");
		};
	};
	if((C_NpcIsGuard(self) || C_NpcIsGuardArcher(self) || C_NpcIsBoss(self)) && (Npc_WasInState(victim,ZS_GuardPassage) || Npc_IsInState(victim,ZS_GuardPassage)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_Check,"...Warnung von Torwache, deren Durchgang durchbrochen worde");
		B_WhirlAround(self,hero);
		B_DrawWeapon(self,other);
		B_SetAttackReason(self,AIV_AR_INTRUDER);
		Npc_SetTarget(self,hero);
		Npc_GetTarget(self);
		AI_StartState(self,ZS_ProclaimAndPunish,0,"");
	};
	if(Npc_IsInState(victim,ZS_AssessEnemy) && (C_NpcIsGuard(self) || C_NpcIsGuardArcher(self)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY) && !(Npc_IsPlayer(other) && (self.npcType == npctype_friend)) && (Npc_GetDistToNpc(self,victim) < HAI_DIST_HELPATTACKEDCHARGES))
	{
		PrintDebugNpc(PD_ZS_Check,"...Warnung vor Feind!");
		AI_StartState(self,ZS_AssessEnemy,0,"");
	};
	if(npc_getwalkmode(other) == NPC_SNEAK)
	{
		PrintDebugNpc(PD_ZS_Check,"...Spieler schleicht rum ");
		if(Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT)
		{
			PrintDebugNpc(PD_ZS_Check,"...Spieler schleicht rum und ich bin gewarnt worden");
			Npc_SetTarget(self,other);
			Npc_GetTarget(self);
			AI_StartState(self,ZS_ObserveSuspect,0,"");
		};
	};
};

func int ZS_AssessWarn_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AssessWarn_Loop");
	AI_Wait(self,2);
	return LOOP_END;
};

func void ZS_AssessWarn_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessWarn_End");
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"ZS_AssessWarn End // Free Los");
		if((Npc_GetTempAttitude(self,other) == ATT_HOSTILE) || (Npc_GetPermAttitude(self,other) == ATT_HOSTILE))
		{
			PrintDebugNpc(PD_ZS_Check,"ZS_AssessWarn End // Free Los // HOSTILE");
			Npc_SetTarget(self,other);
			Npc_GetTarget(self);
			AI_StartState(self,ZS_AssessEnemy,0,"");
			return;
		}
		else
		{
			PrintDebugNpc(PD_ZS_Check,"ZS_AssessWarn End// Free Los // Not HOSTILE");
			B_AssessSC();
			return;
		};
		return;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"ZS_AssessWarn  End// Can´T See");
		return;
	};
};

