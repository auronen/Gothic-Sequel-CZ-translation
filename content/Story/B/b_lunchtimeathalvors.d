
func int b_lunchtimeathalvors()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_LunchTimeAtHalvors");
	if(Npc_KnowsInfo(hero,wrk_227_snaf_igo) && !SNAF_CUSTOMERQUESTSOLVED && (Npc_GetDistToWP(self,"OCC_CONVOY_01") < 1000))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...FALSE");
		return FALSE;
	};
};

