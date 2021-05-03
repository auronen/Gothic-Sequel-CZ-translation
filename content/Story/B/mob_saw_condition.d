
func int mob_saw_condition()
{
	if(Npc_IsPlayer(self))
	{
		AI_PlayAni(self,"T_DONTKNOW");
		return FALSE;
	}
	else
	{
		return TRUE;
	};
};

func void mob_saw_s0()
{
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	printdebugmobsi("MOB_SAW_S0");
};

func void mob_saw_s1()
{
	if(Npc_IsPlayer(self))
	{
	}
	else
	{
		ai_createiteminslot(self,"ZS_RIGHTHAND",4721);
	};
	printdebugmobsi("MOB_SAW_S1");
};

