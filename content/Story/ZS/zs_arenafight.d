
func void zs_arenafight()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaFight");
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_arena_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_arena_assesssc);
	b_setarenaperception(self);
	b_arena_resetgladiator(Hlp_GetInstanceID(self));
};

func int zs_arenafight_loop()
{
	var C_Npc master;
	PrintDebugNpc(PD_TA_LOOP,"ZS_ArenaFight_Loop");
	master = Hlp_GetNpc(mil_122_arenamaster);
	if(!ARENA_FIGHTRUNNING && !ARENA_FIGHTSELECTED)
	{
		return LOOP_END;
	};
	if(Npc_IsOnFP(self,"FP_ARENA_START"))
	{
		if((Npc_GetDistToWP(master,ARENA_WP_THRONE) < 300) && C_BodyStateContains(master,BS_SIT) && ((Npc_GetDistToWP(hero,ARENA_WP_RIGHT_START) < 100) || (Npc_GetDistToWP(hero,ARENA_WP_LEFT_START) < 100)) && (Npc_GetDistToNpc(self,hero) > 500) && !C_NpcIsDown(hero) && Npc_IsInFightMode(hero,FMODE_MELEE))
		{
			AI_TurnToNPC(self,hero);
			b_arena_greetings(self);
			AI_TurnToNPC(hero,self);
			b_arena_greetings(hero);
			AI_Wait(self,2);
			ARENA_PLAYERHASCOME = TRUE;
			Npc_SetTarget(self,hero);
			AI_StartState(self,zs_attackarena,1,"");
			return LOOP_END;
		};
	}
	else
	{
		b_runtonearwp(self,self.wp);
		b_runtofp(self,"FP_ARENA_START");
		B_DrawWeapon(self,hero);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_arenafight_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaFight_End");
};

