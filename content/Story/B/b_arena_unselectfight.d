
func void b_arena_unselectfight()
{
	var C_Npc arenamaster;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_UnselectFight");
	arenamaster = Hlp_GetNpc(mil_122_arenamaster);
	if(ARENA_FIGHTRUNNING)
	{
		PrintDebugNpc(PD_TA_CHECK,"...Kampf muss erst beendet werden!");
		return;
	};
	if(!ARENA_FIGHTSELECTED)
	{
		PrintDebugNpc(PD_TA_CHECK,"...es wurde garkein Kampf ausgewählt!");
		return;
	};
	if((ARENA_SELECTDAY == b_getday()) && ((ARENA_FIGHTDAY < b_getday()) || ARENA_FIGHTRUNNING))
	{
		PrintDebugNpc(PD_TA_CHECK,"...der Kampf ist für heute ausgewählt!");
		return;
	};
	B_ExchangeRoutine(thf_405_thief,"Start");
	B_ExchangeRoutine(thf_407_thief,"Start");
	B_ExchangeRoutine(thf_408_thief,"Start");
	B_ExchangeRoutine(thf_409_pyro,"Start");
	B_ExchangeRoutine(wrk_206_nicolos,"Start");
	B_ExchangeRoutine(thf_402_karras,"Start");
	B_ExchangeRoutine(thf_406_thief,"Start");
	B_ExchangeRoutine(beg_705_beggar,"Start");
	PrintDebugNpc(PD_TA_CHECK,"...Zuschauer nach Hause geschickt!");
	ARENA_FIGHTSELECTED = FALSE;
	if(ARENA_PLAYERFIGHT)
	{
		ARENA_PLAYERFIGHT = FALSE;
		GRIM_CHALLENGED = FALSE;
		GOLIATH_CHALLENGED = FALSE;
		BRUTUS_CHALLENGED = FALSE;
		MALGAR_CHALLENGED = FALSE;
		THORA_CHALLENGED = FALSE;
		if(!ARENA_PLAYERHASCOME)
		{
			ARENA_PLAYERSHIRKED = TRUE;
		};
	}
	else if(ARENA_NPCFIGHT)
	{
		if(ARENA_NPCCOMBO == AC_GRIM_GOLIATH)
		{
			b_arena_npcscore(7790,7978);
		};
		if(ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)
		{
			b_arena_npcscore(7717,7978);
		};
		if(ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)
		{
			b_arena_npcscore(7648,7717);
		};
		if(ARENA_NPCCOMBO == AC_MALGAR_THORA)
		{
			b_arena_npcscore(7618,7648);
		};
		ARENA_NPCFIGHT = FALSE;
		ARENA_NPCCOMBOLAST = ARENA_NPCCOMBO;
		ARENA_NPCCOMBO = AC_NONE;
	};
};

