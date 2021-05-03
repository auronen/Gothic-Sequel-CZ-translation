
func void ZS_PickOre()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PickOre");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4413);
		B_StartUseMob(self,SCEMENAME_ORE);
	};
};

func int ZS_PickOre_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_PickOre_Loop");
	PrintAttitudes(PD_TA_LOOP);
	randomizer = Hlp_Random(20);
	if(wld_getinteractmobstate(self,SCEMENAME_ORE) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_PickOre_Loop ...Mob state");
		AI_PlayAni(self,"T_ORE_RANDOM_1");
	};
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_ORE);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_PickOre_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PickOre_End");
	B_StopUseMob(self,SCEMENAME_ORE);
};

