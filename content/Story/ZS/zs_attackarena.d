
func void zs_attackarena()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AttackArena");
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_arena_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_arena_assesssc);
	b_setarenaperception(self);
	Npc_GetTarget(self);
	if(!C_NpcIsDown(other) && Hlp_IsValidNpc(other) && ARENA_FIGHTRUNNING)
	{
		PrintDebugNpc(PD_ZS_Check,"...Ziel ist kampffähig, gültig und Kampf läuft!");
		B_WhirlAround(self,other);
		AI_UnequipWeapons(self);
		AI_EquipBestMeleeWeapon(self);
		AI_ReadyMeleeWeapon(self);
		AI_SetWalkMode(self,NPC_RUN);
	};
};

func int zs_attackarena_loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AttackArena_Loop");
	Npc_GetTarget(self);
	PrintGlobals(PD_ZS_DETAIL);
	if(C_NpcIsDown(other) || !Hlp_IsValidNpc(other) || !ARENA_FIGHTRUNNING)
	{
		PrintDebugNpc(PD_ZS_Check,"...Ziel ist kampf-unfähig oder ungültig oder Kampf vorbei!");
		B_RemoveWeapon(self);
		AI_ContinueRoutine(self);
		return LOOP_END;
	};
	if(!c_npcisinvincible(other))
	{
		AI_Attack(self);
	}
	else
	{
		AI_Wait(self,0.5);
	};
	return LOOP_CONTINUE;
};

func void zs_attackarena_end()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AttackArena_End");
};

