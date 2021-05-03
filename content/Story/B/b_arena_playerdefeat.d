
func void b_arena_playerdefeat()
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_PlayerDefeat");
	if(GRIM_CHALLENGED)
	{
		npc = Hlp_GetNpc(min_306_grim);
	};
	if(GOLIATH_CHALLENGED)
	{
		npc = Hlp_GetNpc(wrk_216_goliath);
	};
	if(BRUTUS_CHALLENGED)
	{
		npc = Hlp_GetNpc(mil_121_brutus);
	};
	if(MALGAR_CHALLENGED)
	{
		npc = Hlp_GetNpc(dmh_1302_malgar);
	};
	if(THORA_CHALLENGED)
	{
		npc = Hlp_GetNpc(amz_900_thora);
	};
	npc.aivar[40] = npc.aivar[40] + 1;
	ARENA_ABORTFIGHT = TRUE;
	PrintScreen(_STR_MESSAGE_ARENAPLAYERDEFEAT,-1,_YPOS_MESSAGE_ARENARESULT,FONT_OLD_BIG,_TIME_MESSAGE_ARENARESULT);
};

