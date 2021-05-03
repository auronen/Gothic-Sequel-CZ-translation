
func int mob_bow_condition()
{
	printdebugmobsi("MOB_Bow_CONDITION");
	self.aivar[33] = AIV_AM_BOW;
	if(Npc_IsPlayer(self))
	{
	}
	else
	{
		printdebugmobsi("MOB_Bow_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_bow_s0()
{
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	printdebugmobsi("MOB_BOW_S0");
};

func void mob_bow_s1()
{
	printdebugmobsi("MOB_BOW_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_BOW;
		AI_ProcessInfos(self);
	}
	else
	{
		ai_createiteminslot(self,"ZS_RIGHTHAND",4679);
	};
};

