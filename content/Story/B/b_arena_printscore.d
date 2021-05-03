
func void b_arena_printscore()
{
	var string msg;
	var C_Npc npc1;
	var C_Npc npc2;
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_PrintScore");
	if(ARENA_PLAYERFIGHT)
	{
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
		msg = ConcatStrings(hero.name," : ");
		msg = ConcatStrings(msg,IntToString(hero.aivar[39]));
		msg = ConcatStrings(msg,"     -     ");
		msg = ConcatStrings(msg,npc2.name);
		msg = ConcatStrings(msg," : ");
		msg = ConcatStrings(msg,IntToString(npc2.aivar[39]));
	}
	else if(ARENA_NPCFIGHT)
	{
		if(Npc_GetDistToWP(hero,ARENA_WP_CENTER) > 1000)
		{
			return;
		};
		if(ARENA_NPCCOMBO == AC_GRIM_GOLIATH)
		{
			npc1 = Hlp_GetNpc(wrk_216_goliath);
			npc2 = Hlp_GetNpc(min_306_grim);
		};
		if(ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)
		{
			npc1 = Hlp_GetNpc(mil_121_brutus);
			npc2 = Hlp_GetNpc(wrk_216_goliath);
		};
		if(ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)
		{
			npc1 = Hlp_GetNpc(dmh_1302_malgar);
			npc2 = Hlp_GetNpc(mil_121_brutus);
		};
		if(ARENA_NPCCOMBO == AC_MALGAR_THORA)
		{
			npc1 = Hlp_GetNpc(amz_900_thora);
			npc2 = Hlp_GetNpc(dmh_1302_malgar);
		};
		msg = ConcatStrings(npc1.name," : ");
		msg = ConcatStrings(msg,IntToString(npc1.aivar[39]));
		msg = ConcatStrings(msg,"     -     ");
		msg = ConcatStrings(msg,npc2.name);
		msg = ConcatStrings(msg," : ");
		msg = ConcatStrings(msg,IntToString(npc2.aivar[39]));
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...kein laufender Arenakampf!");
		return;
	};
	ai_printscreen(self,msg,-1,-1,FONT_OLD_BIG,3,TEXT_COLOR_WHITE);
};

