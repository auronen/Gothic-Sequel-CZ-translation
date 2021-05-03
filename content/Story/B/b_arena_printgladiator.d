
func void b_arena_printgladiator(var int gladiatorinstance,var int gladiatorranking)
{
	var C_Npc gladiator;
	var string msg_rank;
	var string msg_victories;
	PrintDebugNpc(PD_ZS_DETAIL,"B_Arena_PrintGladiator");
	gladiator = Hlp_GetNpc(gladiatorinstance);
	msg_rank = ConcatStrings(_STR_MESSAGE_ARENARANK,IntToString(gladiatorranking));
	msg_victories = IntToString(gladiator.aivar[40]);
	if(gladiator.aivar[40] != 1)
	{
		msg_victories = ConcatStrings(msg_victories,_STR_MESSAGE_ARENAVICTORIES);
	}
	else
	{
		msg_victories = ConcatStrings(msg_victories,_STR_MESSAGE_ARENAVICTORY);
	};
	PrintScreen(msg_rank,_XPOS_MESSAGE_ARENARANK,_YPOS_MESSAGE_ARENARANKING + (_YPOS_MESSAGE_ARENARANKINGROW * gladiatorranking),FONT_OLD_SMALL,_TIME_MESSAGE_ARENARANKING);
	PrintScreen(gladiator.name,_XPOS_MESSAGE_ARENANAME,_YPOS_MESSAGE_ARENARANKING + (_YPOS_MESSAGE_ARENARANKINGROW * gladiatorranking),FONT_OLD_SMALL,_TIME_MESSAGE_ARENARANKING);
	PrintScreen(msg_victories,_XPOS_MESSAGE_ARENAVICTORIES,_YPOS_MESSAGE_ARENARANKING + (_YPOS_MESSAGE_ARENARANKINGROW * gladiatorranking),FONT_OLD_SMALL,_TIME_MESSAGE_ARENARANKING);
};

func int b_arena_getgladiatorvictoryranking(var int gladiatorinstance)
{
	var int g1_vic;
	var int g2_vic;
	var int g3_vic;
	var int g4_vic;
	var int g5_vic;
	var int pl_vic;
	var int gl_vic;
	var C_Npc gladiator;
	var int worse;
	PrintDebugNpc(PD_ZS_DETAIL,"B_Arena_GetGladiatorVictoryRanking");
	pl_vic = hero.aivar[40];
	gladiator = Hlp_GetNpc(amz_900_thora);
	g1_vic = gladiator.aivar[40];
	gladiator = Hlp_GetNpc(dmh_1302_malgar);
	g2_vic = gladiator.aivar[40];
	gladiator = Hlp_GetNpc(mil_121_brutus);
	g3_vic = gladiator.aivar[40];
	gladiator = Hlp_GetNpc(wrk_216_goliath);
	g4_vic = gladiator.aivar[40];
	gladiator = Hlp_GetNpc(min_306_grim);
	g5_vic = gladiator.aivar[40];
	gladiator = Hlp_GetNpc(gladiatorinstance);
	gl_vic = gladiator.aivar[40];
	worse = 0;
	if(gl_vic < pl_vic)
	{
		worse = worse + 1;
	};
	if(gl_vic < g1_vic)
	{
		worse = worse + 1;
	};
	if(gl_vic < g2_vic)
	{
		worse = worse + 1;
	};
	if(gl_vic < g3_vic)
	{
		worse = worse + 1;
	};
	if(gl_vic < g4_vic)
	{
		worse = worse + 1;
	};
	if(gl_vic < g5_vic)
	{
		worse = worse + 1;
	};
	PrintDebugString(PD_ZS_DETAIL,"...Gladiator: ",gladiator.name);
	PrintDebugInt(PD_ZS_DETAIL,"...schlechter als wieviel andere: ",worse);
	return worse + 1;
};

func int b_arena_getgladiatorranking(var int gladiatorinstance)
{
	var int rank;
	PrintDebugNpc(PD_ZS_DETAIL,"B_Arena_GetGladiatorRanking");
	rank = 0;
	if(b_arena_getgladiatorvictoryranking(7618) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 1)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7618) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 2)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7618) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 3)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7618) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 4)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7618) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 5)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7618) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == amz_900_thora)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7648) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == dmh_1302_malgar)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7717) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == mil_121_brutus)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7978) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == wrk_216_goliath)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7790) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == min_306_grim)
		{
			return rank;
		};
	};
	if(b_arena_getgladiatorvictoryranking(7898) == 6)
	{
		rank = rank + 1;
		if(gladiatorinstance == PC_Hero)
		{
			return rank;
		};
	};
};

func void b_arena_printrankinglist()
{
	var int rank;
	PrintDebugNpc(PD_ZS_DETAIL,"B_Arena_PrintRankingList");
	rank = 1;
	b_arena_printgladiator(7618,b_arena_getgladiatorranking(7618));
	b_arena_printgladiator(7648,b_arena_getgladiatorranking(7648));
	b_arena_printgladiator(7717,b_arena_getgladiatorranking(7717));
	b_arena_printgladiator(7978,b_arena_getgladiatorranking(7978));
	b_arena_printgladiator(7790,b_arena_getgladiatorranking(7790));
	b_arena_printgladiator(7898,b_arena_getgladiatorranking(7898));
};

func int b_arena_getrankinggladiator(var int rank)
{
	if(b_arena_getgladiatorranking(7618) == rank)
	{
		return 7618;
	};
	if(b_arena_getgladiatorranking(7648) == rank)
	{
		return 7648;
	};
	if(b_arena_getgladiatorranking(7717) == rank)
	{
		return 7717;
	};
	if(b_arena_getgladiatorranking(7978) == rank)
	{
		return 7978;
	};
	if(b_arena_getgladiatorranking(7790) == rank)
	{
		return 7790;
	};
	if(b_arena_getgladiatorranking(7898) == rank)
	{
		return 7898;
	};
};

