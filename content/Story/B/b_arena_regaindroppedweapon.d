
func void b_arena_regaindroppedweapon(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_TA_FRAME,"B_Arena_RegainDroppedWeapon");
	npc = Hlp_GetNpc(npcInstance);
	if(((npcInstance == min_306_grim) && !Npc_HasItems(npc,itmw_grim_pickaxe)) || ((npcInstance == wrk_216_goliath) && !Npc_HasItems(npc,itmw_goliath_sledgehammer)) || ((npcInstance == mil_121_brutus) && !Npc_HasItems(npc,itmw_brutus_longsword)) || ((npcInstance == dmh_1302_malgar) && !Npc_HasItems(npc,itmw_malgar_broadsword)) || ((npcInstance == amz_900_thora) && !Npc_HasItems(npc,itmw_thora_battlestaff)))
	{
		B_RegainDroppedWeapon(npc);
	};
};

