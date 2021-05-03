
func int b_reperationdone()
{
	var C_Npc talamon;
	PrintDebugNpc(PD_ZS_Check,"ReparationDone");
	talamon = Hlp_GetNpc(hlr_501_talamon);
	if(INT_REPARATIONRUNNING == INT_MILTENREP)
	{
		if(Npc_HasItems(talamon,ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};
		return FALSE;
	};
	if(INT_REPARATIONRUNNING == INT_GORNREP)
	{
		if(Npc_HasItems(talamon,ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};
		return FALSE;
	};
	if(INT_REPARATIONRUNNING == INT_LESTERREP)
	{
		if(Npc_HasItems(talamon,ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};
		return FALSE;
	};
	if(INT_REPARATIONRUNNING == INT_DIEGOREP)
	{
		if(Npc_HasItems(talamon,ItFo_Potion_Health_01) >= 5)
		{
			return TRUE;
		};
		return FALSE;
	};
};

