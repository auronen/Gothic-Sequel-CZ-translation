
func void b_arena_assessscore()
{
	var C_Npc npc2;
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessScore");
	if(Npc_WasInState(self,zs_attackarena) || Npc_IsPlayer(self))
	{
		other.aivar[39] = other.aivar[39] + 1;
	}
	else
	{
		ai_printscreen(self,_STR_MESSAGE_ARENAPENALTY1,-1,_YPOS_MESSAGE_ARENAPENALTY1,FONT_OLD_BIG,_TIME_MESSAGE_ARENAPENALTY,TEXT_COLOR_RED);
		printscreencolored(_STR_MESSAGE_ARENAPENALTY2,-1,_YPOS_MESSAGE_ARENAPENALTY2,FONT_OLD_SMALL,_TIME_MESSAGE_ARENAPENALTY,TEXT_COLOR_RED);
		other.aivar[39] = other.aivar[39] - 1;
	};
	if(ARENA_NPCFIGHT)
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC-Kampf!");
		b_arena_printscore();
		return;
	};
	if(GRIM_CHALLENGED)
	{
		npc2 = Hlp_GetNpc(min_306_grim);
	};
	if(GOLIATH_CHALLENGED)
	{
		npc2 = Hlp_GetNpc(wrk_216_goliath);
	};
	if(BRUTUS_CHALLENGED)
	{
		npc2 = Hlp_GetNpc(mil_121_brutus);
	};
	if(MALGAR_CHALLENGED)
	{
		npc2 = Hlp_GetNpc(dmh_1302_malgar);
	};
	if(THORA_CHALLENGED)
	{
		npc2 = Hlp_GetNpc(amz_900_thora);
	};
	if(hero.aivar[39] >= ARENA_POINTSFORVICTORY)
	{
		b_arena_playervictory();
		b_arena_finishfight();
	};
	if(npc2.aivar[39] >= ARENA_POINTSFORVICTORY)
	{
		b_arena_playerdefeat();
		b_arena_finishfight();
	};
	if((hero.aivar[39] < ARENA_POINTSFORVICTORY) && (npc2.aivar[39] < ARENA_POINTSFORVICTORY))
	{
		b_arena_printscore();
	};
};

