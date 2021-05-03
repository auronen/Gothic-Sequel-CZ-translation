
func void b_arena_wait(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_Wait");
	npc = Hlp_GetNpc(npcInstance);
	AI_Wait(npc,20);
};

