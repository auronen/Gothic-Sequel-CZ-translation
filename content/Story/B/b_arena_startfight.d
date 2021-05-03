
func void b_arena_startfight()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_StartFight");
	if(ARENA_FIGHTRUNNING && ARENA_GATESCLOSED)
	{
		PrintDebugNpc(PD_TA_CHECK,"...Kampf läuft bereits!");
		return;
	};
	if(!ARENA_FIGHTSELECTED)
	{
		PrintDebugNpc(PD_TA_CHECK,"...garkein Kampf angesetzt!");
		return;
	};
	if(!Hlp_StrCmp(self.wp,ARENA_WP_THRONE))
	{
		PrintDebugNpc(PD_TA_CHECK,"...Exchange Arenamaster-TA to ATTENDANCE!");
		Npc_ExchangeRoutine(self,"attendance");
		AI_ContinueRoutine(self);
		return;
	};
	if(ARENA_PLAYERFIGHT)
	{
		if(GRIM_CHALLENGED)
		{
			B_ExchangeRoutine(min_306_grim,"ArenaFight");
			B_ChangeGuild(min_306_grim,GIL_None);
		};
		if(GOLIATH_CHALLENGED)
		{
			B_ExchangeRoutine(wrk_216_goliath,"ArenaFight");
			B_ChangeGuild(wrk_216_goliath,GIL_None);
		};
		if(BRUTUS_CHALLENGED)
		{
			B_ExchangeRoutine(mil_121_brutus,"ArenaFight");
			B_ChangeGuild(mil_121_brutus,GIL_None);
		};
		if(MALGAR_CHALLENGED)
		{
			B_ExchangeRoutine(dmh_1302_malgar,"ArenaFight");
			B_ChangeGuild(dmh_1302_malgar,GIL_None);
		};
		if(THORA_CHALLENGED)
		{
			B_ExchangeRoutine(amz_900_thora,"ArenaFight");
			B_ChangeGuild(amz_900_thora,GIL_None);
		};
	}
	else
	{
		if(ARENA_NPCCOMBO == AC_GRIM_GOLIATH)
		{
			B_ExchangeRoutine(min_306_grim,"ArenaNpc");
			B_ChangeGuild(min_306_grim,GIL_None);
			B_ExchangeRoutine(wrk_216_goliath,"ArenaNpc");
			B_ChangeGuild(wrk_216_goliath,GIL_None);
		};
		if(ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)
		{
			B_ExchangeRoutine(wrk_216_goliath,"ArenaNpc");
			B_ChangeGuild(wrk_216_goliath,GIL_None);
			B_ExchangeRoutine(mil_121_brutus,"ArenaNpc");
			B_ChangeGuild(mil_121_brutus,GIL_None);
		};
		if(ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)
		{
			B_ExchangeRoutine(mil_121_brutus,"ArenaNpc");
			B_ChangeGuild(mil_121_brutus,GIL_None);
			B_ExchangeRoutine(dmh_1302_malgar,"ArenaNpc");
			B_ChangeGuild(dmh_1302_malgar,GIL_None);
		};
		if(ARENA_NPCCOMBO == AC_MALGAR_THORA)
		{
			B_ExchangeRoutine(dmh_1302_malgar,"ArenaNpc");
			B_ChangeGuild(dmh_1302_malgar,GIL_None);
			B_ExchangeRoutine(amz_900_thora,"ArenaNpc");
			B_ChangeGuild(amz_900_thora,GIL_None);
		};
	};
	if(!ARENA_GATESCLOSED)
	{
		PrintDebugNpc(PD_TA_CHECK,"...close ArenaGates!");
		AI_StartState(self,zs_arenamasterstartfight,1,"");
	};
	ARENA_FIGHTDAY = b_getday();
	ARENA_FIGHTRUNNING = TRUE;
};

