
func void zs_arena_observeintruder()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Arena_ObserveIntruder");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	B_DrawWeapon(self,other);
	B_Say(self,other,"$GetOutOfHere");
};

func int zs_arena_observeintruder_loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Arena_ObserveIntruder_Loop");
	if(Npc_GetDistToWP(hero,ARENA_WP_CENTER) >= ARENA_CENTER_AREA)
	{
		return LOOP_END;
	};
	B_SmartTurnToNpc(self,other);
	if(Npc_GetDistToNpc(self,other) < HAI_DIST_OBSERVEINTRUDER_STEPBACK)
	{
		AI_Dodge(self);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_arena_observeintruder_end()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Arena_ObserveIntruder_End");
	C_StopLookAt(self);
	AI_TurnToNPC(self,other);
};

