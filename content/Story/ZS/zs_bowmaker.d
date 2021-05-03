
func void zs_bowmaker()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BowMaker");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_BOW);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4679);
	};
};

func int zs_bowmaker_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_BowMaker_Loop");
	randomizer = Hlp_Random(20);
	if(wld_getinteractmobstate(self,SCEMENAME_BOW) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_BowMaker_Loop ...Mob state");
		AI_PlayAni(self,"T_BOGENMACHER_RANDOM_1");
	};
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_BOW);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_bowmaker_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Bogenmacher_End");
	B_StopUseMob(self,SCEMENAME_BOW);
};

