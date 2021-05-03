
func int c_isarenafight(var C_Npc attacker,var C_Npc defender)
{
	PrintDebugNpc(PD_ZS_FRAME,"C_IsArenaFight");
	if(ARENA_FIGHTRUNNING)
	{
		if(ARENA_NPCFIGHT && Npc_IsInRoutine(attacker,zs_arenanpc) && Npc_IsInRoutine(defender,zs_arenanpc))
		{
			PrintDebugNpc(PD_ZS_Check,"...ja, NSC gegen NSC!");
			return TRUE;
		};
		if(ARENA_PLAYERFIGHT && ((Npc_IsPlayer(attacker) && Npc_IsInRoutine(defender,zs_arenafight)) || (Npc_IsPlayer(defender) && Npc_IsInRoutine(attacker,zs_arenafight))))
		{
			PrintDebugNpc(PD_ZS_Check,"...ja, SC gegen NSC!");
			return TRUE;
		};
		PrintDebugNpc(PD_ZS_Check,"...nein, obwohl ein Arenakampf läuft!");
		return FALSE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...nein, es läuft kein Arenakampf!");
		return FALSE;
	};
};

func int c_isgladiator(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_FRAME,"C_IsArenaFight");
	if(ARENA_FIGHTRUNNING)
	{
		if(ARENA_NPCFIGHT && Npc_IsInRoutine(npc,zs_arenanpc))
		{
			PrintDebugNpc(PD_ZS_Check,"...ja, NSC gegen NSC!");
			return TRUE;
		};
		if(ARENA_PLAYERFIGHT && (Npc_IsPlayer(npc) || Npc_IsInRoutine(npc,zs_arenafight)))
		{
			PrintDebugNpc(PD_ZS_Check,"...ja, SC gegen NSC!");
			return TRUE;
		};
		PrintDebugNpc(PD_ZS_Check,"...nein, obwohl ein Arenakampf läuft!");
		return FALSE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...nein, es läuft kein Arenakampf!");
		return FALSE;
	};
};

