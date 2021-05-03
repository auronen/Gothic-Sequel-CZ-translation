
func int b_arena_npcscore(var int npcinstance1,var int npcinstance2)
{
	var C_Npc npc1;
	var C_Npc npc2;
	PrintDebugNpc(PD_TA_DETAIL,"B_Arena_NpcScore");
	npc1 = Hlp_GetNpc(npcinstance1);
	npc2 = Hlp_GetNpc(npcinstance2);
	if(npc1.aivar[39] > npc2.aivar[39])
	{
		npc1.aivar[40] = npc1.aivar[40] + 1;
	};
	if(npc2.aivar[39] > npc1.aivar[39])
	{
		npc2.aivar[40] = npc2.aivar[40] + 1;
	};
};

