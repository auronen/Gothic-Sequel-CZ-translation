
func void b_arena_finishfight()
{
	var C_Npc arenamaster;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_FinishFight");
	arenamaster = Hlp_GetNpc(mil_122_arenamaster);
	if(!ARENA_FIGHTRUNNING)
	{
		PrintDebugNpc(PD_TA_CHECK,"...es läuft garkein Kampf!");
		return;
	};
	if((ARENA_FIGHTDAY == b_getday()) && Npc_IsInRoutine(arenamaster,zs_arenamasternpc) && !ARENA_ABORTFIGHT)
	{
		PrintDebugNpc(PD_TA_CHECK,"...es läuft immer noch der heutige Kampf!");
		return;
	};
	if(Hlp_StrCmp(arenamaster.wp,ARENA_WP_THRONE))
	{
		PrintDebugNpc(PD_TA_CHECK,"...Exchange Arenamaster-TA to START!");
		Npc_ExchangeRoutine(arenamaster,"start");
		AI_ContinueRoutine(arenamaster);
		return;
	};
	printarenastatus(PD_TA_CHECK);
	if((ARENA_PLAYERFIGHT && GRIM_CHALLENGED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GRIM_GOLIATH)))
	{
		b_arena_resetgladiator(7790);
		b_arena_wait(7790);
		B_ExchangeRoutine(min_306_grim,"ArenaWait");
		B_ChangeGuild(min_306_grim,GIL_MINER);
	};
	if((ARENA_PLAYERFIGHT && GOLIATH_CHALLENGED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GRIM_GOLIATH)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)))
	{
		b_arena_resetgladiator(7978);
		b_arena_wait(7978);
		B_ExchangeRoutine(wrk_216_goliath,"ArenaWait");
		B_ChangeGuild(wrk_216_goliath,GIL_WORKER);
	};
	if((ARENA_PLAYERFIGHT && BRUTUS_CHALLENGED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)))
	{
		b_arena_resetgladiator(7717);
		b_arena_wait(7717);
		B_ExchangeRoutine(mil_121_brutus,"ArenaWait");
		B_ChangeGuild(mil_121_brutus,GIL_MILITIA);
	};
	if((ARENA_PLAYERFIGHT && MALGAR_CHALLENGED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_MALGAR_THORA)))
	{
		b_arena_resetgladiator(7648);
		b_arena_wait(7648);
		B_ExchangeRoutine(dmh_1302_malgar,"ArenaWait");
		B_ChangeGuild(dmh_1302_malgar,GIL_DEMONHUNTER);
	};
	if((ARENA_PLAYERFIGHT && THORA_CHALLENGED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_MALGAR_THORA)))
	{
		b_arena_resetgladiator(7618);
		b_arena_wait(7618);
		B_ExchangeRoutine(amz_900_thora,"ArenaWait");
		B_ChangeGuild(amz_900_thora,GIL_AMAZON);
	};
	if(ARENA_PLAYERFIGHT && Npc_HasReadiedMeleeWeapon(hero))
	{
		AI_RemoveWeapon(hero);
		AI_TurnToNPC(hero,arenamaster);
	};
	if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M + 30))
	{
		B_GotoFP(arenamaster,"MASTER");
		AI_Wait(arenamaster,1);
		b_arena_proclaimfinish(arenamaster);
		AI_Wait(arenamaster,1);
	};
	if(ARENA_GATESCLOSED)
	{
		PrintDebugNpc(PD_TA_CHECK,"...open ArenaGates!");
		AI_Standup(arenamaster);
		AI_UseMob(arenamaster,"VWHEEL",1);
		AI_UseMob(arenamaster,"VWHEEL",0);
		AI_UseMob(arenamaster,"VWHEEL",-1);
	};
	ARENA_FIGHTRUNNING = FALSE;
	ARENA_ABORTFIGHT = FALSE;
};

