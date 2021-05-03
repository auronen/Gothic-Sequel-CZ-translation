
func void b_arena_proclaimstart(var C_Npc arenamaster)
{
	var C_Npc target;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_ProclaimStart");
	if(ARENA_PLAYERFIGHT)
	{
		target = Hlp_GetNpc(PC_Hero);
	};
	AI_PlayAni(arenamaster,"T_GREETARENA");
	AI_Output(arenamaster,target,"MIL_122_ProclaimStart_12_01");	//(theatralisch) ICH GRÜSSE EUCH, GLADIATOREN!
	AI_PlayAni(arenamaster,"T_BEGINFIGHT");
	AI_Output(arenamaster,target,"MIL_122_ProclaimStart_12_02");	//KAMPFT NACH DEN REGELN UND KÄMPFT GUT!
	AI_Output(arenamaster,target,"MIL_122_ProclaimStart_12_03");	//MÖGE DER BESSERE GEWINNEN!
};

