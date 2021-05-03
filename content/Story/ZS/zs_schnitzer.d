
func void zs_schnitzer()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Schnitzer");
	B_SetPerception(self);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_FLETCHER);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4677);
		ai_createiteminslot(self,"ZS_LEFTHAND",4678);
	};
};

func int zs_schnitzer_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Schnitzer_Loop");
	randomizer = Hlp_Random(20);
	if(wld_getinteractmobstate(self,SCEMENAME_FLETCHER) == 1)
	{
		AI_PlayAni(self,"T_SCHNITZER_RANDOM_1");
	};
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_FLETCHER);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_schnitzer_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Schnitzer_End");
	B_StopUseMob(self,SCEMENAME_FLETCHER);
};

