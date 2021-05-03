
func void b_arena_protect(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_Protect");
	npc = Hlp_GetNpc(npcInstance);
	npc.protection[PROT_FLY] = npc.protection[PROT_FLY] + ARENA_PROTECTION;
};

func void b_arena_unprotect(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_Unprotect");
	npc = Hlp_GetNpc(npcInstance);
	npc.protection[PROT_FLY] = npc.protection[PROT_FLY] - ARENA_PROTECTION;
};

