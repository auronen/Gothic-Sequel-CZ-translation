
func void b_arena_selectfight()
{
	var C_Npc npc1;
	var C_Npc npc2;
	var int today;
	var int thisday;
	var int moduloday;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_SelectFight");
	if(ARENA_FIGHTSELECTED)
	{
		PrintDebugNpc(PD_TA_FRAME,"...für heute wurde bereits ein Kampf angesetzt!");
		return;
	};
	today = b_getday();
	if(ARENA_SELECTDAY == today)
	{
		PrintDebugNpc(PD_TA_FRAME,"...heute gab es bereits einen Kampf!");
		return;
	};
	if(ARENA_PLAYERFIGHT)
	{
		if(GRIM_CHALLENGED)
		{
			B_ExchangeRoutine(min_306_grim,"PreChamber");
			npc1 = Hlp_GetNpc(min_306_grim);
			npc1.aivar[39] = 0;
		};
		if(GOLIATH_CHALLENGED)
		{
			B_ExchangeRoutine(wrk_216_goliath,"PreChamber");
			npc1 = Hlp_GetNpc(wrk_216_goliath);
			npc1.aivar[39] = 0;
		};
		if(BRUTUS_CHALLENGED)
		{
			B_ExchangeRoutine(mil_121_brutus,"PreChamber");
			npc1 = Hlp_GetNpc(mil_121_brutus);
			npc1.aivar[39] = 0;
		};
		if(MALGAR_CHALLENGED)
		{
			B_ExchangeRoutine(dmh_1302_malgar,"PreChamber");
			npc1 = Hlp_GetNpc(dmh_1302_malgar);
			npc1.aivar[39] = 0;
		};
		if(THORA_CHALLENGED)
		{
			B_ExchangeRoutine(amz_900_thora,"PreChamber");
			npc1 = Hlp_GetNpc(amz_900_thora);
			npc1.aivar[39] = 0;
		};
		hero.aivar[39] = 0;
	}
	else
	{
		thisday = Wld_GetDay();
		moduloday = thisday % 4;
		PrintDebugInt(PD_TA_DETAIL,"thisDay = ",thisday);
		PrintDebugInt(PD_TA_DETAIL,"moduloDay = ",moduloday);
		if(moduloday == 0)
		{
			npc1 = Hlp_GetNpc(min_306_grim);
			npc2 = Hlp_GetNpc(wrk_216_goliath);
			if(Npc_IsDead(npc1) || Npc_IsDead(npc2) || GOTMAR_GOLIATHRETURNED)
			{
				return;
			};
			B_ExchangeRoutine(min_306_grim,"PreChamber");
			npc1.aivar[39] = 0;
			B_ExchangeRoutine(wrk_216_goliath,"PreChamber");
			npc2.aivar[39] = 0;
			ARENA_NPCCOMBO = AC_GRIM_GOLIATH;
		}
		else if(moduloday == 1)
		{
			npc1 = Hlp_GetNpc(wrk_216_goliath);
			npc2 = Hlp_GetNpc(mil_121_brutus);
			if(Npc_IsDead(npc1) || Npc_IsDead(npc2) || GOTMAR_GOLIATHRETURNED)
			{
				return;
			};
			B_ExchangeRoutine(wrk_216_goliath,"PreChamber");
			npc1.aivar[39] = 0;
			B_ExchangeRoutine(mil_121_brutus,"PreChamber");
			npc2.aivar[39] = 0;
			ARENA_NPCCOMBO = AC_GOLIATH_BRUTUS;
		}
		else if(moduloday == 2)
		{
			npc1 = Hlp_GetNpc(mil_121_brutus);
			npc2 = Hlp_GetNpc(dmh_1302_malgar);
			if(Npc_IsDead(npc1) || Npc_IsDead(npc2))
			{
				return;
			};
			B_ExchangeRoutine(mil_121_brutus,"PreChamber");
			npc1.aivar[39] = 0;
			B_ExchangeRoutine(dmh_1302_malgar,"PreChamber");
			npc2.aivar[39] = 0;
			ARENA_NPCCOMBO = AC_BRUTUS_MALGAR;
		}
		else if(moduloday == 3)
		{
			npc1 = Hlp_GetNpc(dmh_1302_malgar);
			npc2 = Hlp_GetNpc(amz_900_thora);
			if(Npc_IsDead(npc1) || Npc_IsDead(npc2) || (SUBCHAPTER < CH2_THORA_CONVINCED))
			{
				return;
			};
			B_ExchangeRoutine(dmh_1302_malgar,"PreChamber");
			npc1.aivar[39] = 0;
			B_ExchangeRoutine(amz_900_thora,"PreChamber");
			npc2.aivar[39] = 0;
			ARENA_NPCCOMBO = AC_MALGAR_THORA;
		};
		ARENA_NPCFIGHT = TRUE;
	};
	B_ExchangeRoutine(thf_405_thief,"ArenaSpectator");
	B_ExchangeRoutine(thf_407_thief,"ArenaSpectator");
	B_ExchangeRoutine(thf_408_thief,"ArenaSpectator");
	B_ExchangeRoutine(thf_409_pyro,"ArenaSpectator");
	B_ExchangeRoutine(wrk_206_nicolos,"ArenaSpectator");
	B_ExchangeRoutine(thf_402_karras,"ArenaSpectator");
	B_ExchangeRoutine(thf_406_thief,"ArenaSpectator");
	B_ExchangeRoutine(beg_705_beggar,"ArenaSpectator");
	PrintDebugNpc(PD_TA_CHECK,"...Gladiatoren und Zuschauer in die Arena geschickt!");
	ARENA_PLAYERHASCOME = FALSE;
	ARENA_FIGHTSELECTED = TRUE;
	ARENA_SELECTDAY = b_getday();
};

