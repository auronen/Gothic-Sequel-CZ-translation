
func int b_murderteller()
{
	PrintDebugNpc(PD_ZS_Check,"B_MurderTeller");
	if(Hlp_StrCmp(self.name,"Milten"))
	{
		PrintDebugNpc(PD_ZS_Check,"B_MurderTeller ... Milten");
		return TRUE;
	};
	if(Hlp_StrCmp(self.name,"Lester"))
	{
		PrintDebugNpc(PD_ZS_Check,"B_MurderTeller ...Lester");
		return TRUE;
	};
	if(Hlp_StrCmp(self.name,"Gorn"))
	{
		PrintDebugNpc(PD_ZS_Check,"B_MurderTeller ... Gorn");
		return TRUE;
	};
	if(Hlp_StrCmp(self.name,"Diego"))
	{
		PrintDebugNpc(PD_ZS_Check,"B_MurderTeller ...Diego");
		return TRUE;
	};
	return FALSE;
};

