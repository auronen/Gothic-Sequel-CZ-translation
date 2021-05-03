
func int mob_repair_condition()
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

func void mob_repair_s0()
{
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	printdebugmobsi("MOB_REPAIR_S0");
};

func void mob_repair_s1()
{
	if(Npc_IsPlayer(self))
	{
	}
	else
	{
		ai_createiteminslot(self,"ZS_RIGHTHAND",4699);
	};
	printdebugmobsi("MOB_REPAIR_S1");
};

