
func void b_arena_abortfight(var int reason)
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AbortFight");
	if(reason == AF_PLAYERSTOLEWEAPON)
	{
		PrintDebugNpc(PD_ZS_Check,"...player stole weapon!");
		ARENA_PLAYERSTOLEWEAPON = TRUE;
		ARENA_ABORTFIGHT = TRUE;
		return;
	};
	if(reason == AF_PLAYERUSEDMAGIC)
	{
		PrintDebugNpc(PD_ZS_Check,"...player used magic!");
		ARENA_PLAYERUSEDMAGIC = TRUE;
		ARENA_ABORTFIGHT = TRUE;
		return;
	};
	if(reason == AF_PLAYERUSEDBOW)
	{
		PrintDebugNpc(PD_ZS_Check,"...player used ranged weapon!");
		ARENA_PLAYERUSEDBOW = TRUE;
		ARENA_ABORTFIGHT = TRUE;
		return;
	};
	if(reason == AF_PLAYERKILLED)
	{
		PrintDebugNpc(PD_ZS_Check,"...player killed!");
		ARENA_PLAYERKILLED = TRUE;
		ARENA_ABORTFIGHT = TRUE;
		return;
	};
};

