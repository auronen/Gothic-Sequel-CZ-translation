
func void zs_stonemason()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_StoneMason");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_STONE);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	};
};

func int zs_stonemason_loop()
{
	var int int_random;
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_StoneMason_Loop");
	if(wld_getinteractmobstate(self,SCEMENAME_STONE) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_SToneMason_Loop ...Mob state");
		int_random = Hlp_Random(10);
		if(int_random == 1)
		{
			AI_PlayAni(self,"T_STEINMETZ_RANDOM_1");
		};
		if(int_random == 2)
		{
			AI_PlayAni(self,"T_STEINMETZ_RANDOM_2");
		};
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_STONE);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_stonemason_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_StoneMason_End");
	B_StopUseMob(self,SCEMENAME_STONE);
};

