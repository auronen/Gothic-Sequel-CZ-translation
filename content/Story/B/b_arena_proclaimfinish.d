
func void b_arena_proclaimfinish(var C_Npc arenamaster)
{
	var C_Npc target;
	var C_Npc npc;
	var int grimpoints;
	var int goliathpoints;
	var int brutuspoints;
	var int malgarpoints;
	var int thorapoints;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_ProclaimFinish");
	if(!Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H + 1,ARENAEND_M))
	{
		PrintDebugNpc(PD_ZS_Check,"...zu spät!");
		return;
	};
	npc = Hlp_GetNpc(min_306_grim);
	grimpoints = npc.aivar[39];
	npc = Hlp_GetNpc(wrk_216_goliath);
	goliathpoints = npc.aivar[39];
	npc = Hlp_GetNpc(mil_121_brutus);
	brutuspoints = npc.aivar[39];
	npc = Hlp_GetNpc(dmh_1302_malgar);
	malgarpoints = npc.aivar[39];
	npc = Hlp_GetNpc(amz_900_thora);
	thorapoints = npc.aivar[39];
	if(ARENA_PLAYERFIGHT)
	{
		target = Hlp_GetNpc(PC_Hero);
		PrintDebugString(PD_ZS_Check,"...target: ",target.name);
	};
	AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_01");	//(theatralisch) DIE WÜRFEL SIND GEFALLEN.
	if(ARENA_PLAYERFIGHT && ARENA_PLAYERHASWONTODAY)
	{
		if((ARENA_PCRANKING == 1) && (ARENA_LASTPCRANKING == 2))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_02");	//WIR ABEN EINEN NEUEN CHAMPION !!!
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_03");	//!!! DU !!! ...BIST DER NEUE CHAMPION DIESER ARENA!
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_04");	//!!! DU !!! ...BIST DER BESTE KÄMPFER WEIT UND BREIT!
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_05");	//WIR VERNEIGEN UNS VOR DIR!
		}
		else
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_06");	//DER SIEGER DES HEUTIGEN KAMPFES...
			AI_TurnToNPC(arenamaster,hero);
			AI_Output(arenamaster,hero,"MIL_122_ProclaimFinish_12_07");	//...bist DU !!!
		};
	}
	else
	{
		AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_08");	//DER SIEGER DES HEUTIGEN KAMPFES IST...
		if(ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && ((GRIM_CHALLENGED && (grimpoints < ARENA_POINTSFORVICTORY)) || (GOLIATH_CHALLENGED && (goliathpoints < ARENA_POINTSFORVICTORY)) || (BRUTUS_CHALLENGED && (brutuspoints < ARENA_POINTSFORVICTORY)) || (MALGAR_CHALLENGED && (malgarpoints < ARENA_POINTSFORVICTORY)) || (THORA_CHALLENGED && (thorapoints < ARENA_POINTSFORVICTORY))) && !ARENA_PLAYERBANNED)
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_09");	//NIEMAND !!!
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_10");	//Kein Gladiator hat 10 Punkte erringen können.
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_11");	//Somit ist der heutige Kampf unentschieden!
		};
		if((ARENA_PLAYERFIGHT && GRIM_CHALLENGED && !ARENA_PLAYERHASWONTODAY && (grimpoints >= ARENA_POINTSFORVICTORY)) || (ARENA_PLAYERFIGHT && GRIM_CHALLENGED && ARENA_PLAYERBANNED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GRIM_GOLIATH) && (grimpoints > goliathpoints)))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_12");	//!!!   G R I M   !!!!
		};
		if((ARENA_PLAYERFIGHT && GOLIATH_CHALLENGED && !ARENA_PLAYERHASWONTODAY && (goliathpoints >= ARENA_POINTSFORVICTORY)) || (ARENA_PLAYERFIGHT && GOLIATH_CHALLENGED && ARENA_PLAYERBANNED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GRIM_GOLIATH) && (grimpoints <= goliathpoints)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS) && (goliathpoints > brutuspoints)))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_13");	//!!!   G O L I A T H   !!!!
		};
		if((ARENA_PLAYERFIGHT && BRUTUS_CHALLENGED && !ARENA_PLAYERHASWONTODAY && (brutuspoints >= ARENA_POINTSFORVICTORY)) || (ARENA_PLAYERFIGHT && BRUTUS_CHALLENGED && ARENA_PLAYERBANNED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS) && (goliathpoints <= brutuspoints)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_BRUTUS_MALGAR) && (brutuspoints > malgarpoints)))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_14");	//!!!   B R U T U S   !!!!
		};
		if((ARENA_PLAYERFIGHT && MALGAR_CHALLENGED && !ARENA_PLAYERHASWONTODAY && (malgarpoints >= ARENA_POINTSFORVICTORY)) || (ARENA_PLAYERFIGHT && MALGAR_CHALLENGED && ARENA_PLAYERBANNED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_BRUTUS_MALGAR) && (brutuspoints <= malgarpoints)) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_MALGAR_THORA) && (malgarpoints > thorapoints)))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_15");	//!!!   M A L G A R   !!!!
		};
		if((ARENA_PLAYERFIGHT && THORA_CHALLENGED && !ARENA_PLAYERHASWONTODAY && (thorapoints >= ARENA_POINTSFORVICTORY)) || (ARENA_PLAYERFIGHT && THORA_CHALLENGED && ARENA_PLAYERBANNED) || (ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_MALGAR_THORA) && (malgarpoints <= thorapoints)))
		{
			AI_Output(arenamaster,target,"MIL_122_ProclaimFinish_12_16");	//!!!   T H O R A   !!!!
		};
	};
};

