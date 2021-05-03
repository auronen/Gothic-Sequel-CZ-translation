
func int mob_broken_condition()
{
	printdebugmobsi("MOB_BROKEN_CONDITION");
	self.aivar[33] = AIV_AM_CAULDRON;
	if(Npc_IsPlayer(self))
	{
		PrintScreen(_STR_MESSAGE_MOBSI_BROKEN,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
		AI_PlayAni(self,"T_DONTKNOW");
		printdebugmobsi("...FALSE");
		return FALSE;
	}
	else
	{
		printdebugmobsi(PD_TRUE);
		return TRUE;
	};
};

func void mob_broken_s0()
{
	printdebugmobsi("MOB_BROKEN_S0");
};

func void mob_broken_s1()
{
	printdebugmobsi("MOB_BROKEN_S1");
};

