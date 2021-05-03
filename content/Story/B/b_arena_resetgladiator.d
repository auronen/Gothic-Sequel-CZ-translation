
func void b_arena_resetgladiator(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_ResetGladiator");
	npc = Hlp_GetNpc(npcInstance);
	if(Npc_IsInState(npc,ZS_Unconscious) || Npc_IsInState(npc,ZS_Dead))
	{
		PrintDebugNpc(PD_TA_FRAME,"...Gladiator bewusstlos oder tot!");
		return;
	};
	B_FullStop(npc);
	AI_RemoveWeapon(npc);
	B_CheckForImportantInfo(npc,hero);
	if(npc.attribute[ATR_HITPOINTS] < npc.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItem(npc,ItFo_Potion_Health_03);
		AI_Standup(npc);
		AI_UseItem(npc,ItFo_Potion_Health_03);
	};
	b_arena_regaindroppedweapon(npcInstance);
};

