
func void b_followpc(var C_Npc slf,var string ta)
{
	Npc_ExchangeRoutine(slf,ta);
	slf.aivar[27] = TRUE;
};

func void b_guidepc(var C_Npc slf,var string ta,var string dest)
{
	PrintDebugString(PD_TA_DETAIL,"dest: ",dest);
	PrintDebugString(PD_TA_DETAIL,"GuidePC_Destination (davor): ",GUIDEPC_DESTINATION);
	GUIDEPC_DESTINATION = ConcatStrings(dest,"");
	PrintDebugString(PD_TA_DETAIL,"GuidePC_Destination (danach): ",GUIDEPC_DESTINATION);
	Npc_ExchangeRoutine(slf,ta);
	slf.aivar[27] = TRUE;
};

func void b_leavepc(var C_Npc slf,var string ta)
{
	Npc_ExchangeRoutine(slf,ta);
	slf.aivar[27] = FALSE;
};

