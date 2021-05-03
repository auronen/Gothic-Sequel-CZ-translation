
func int b_murderreparationnpc()
{
	var C_Npc talamon;
	PrintDebugNpc(PD_ZS_Check,"ReparationReceiver_Condition");
	talamon = Hlp_GetNpc(hlr_501_talamon);
	if(B_CompareNpcInstance(self,talamon))
	{
		return TRUE;
	};
	return FALSE;
};

