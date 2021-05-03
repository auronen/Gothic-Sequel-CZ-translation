
func void ZS_Smith_Fire()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Fire");
	B_SetPerception(self);
	B_StartUseMob(self,SCEMENAME_FIRE);
	ai_createiteminslot(self,"ZS_LEFTHAND",4473);
};

func int ZS_Smith_Fire_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Smith_Fire_Loop");
	if((self.aivar[33] != AIV_AM_FIRE) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (10 + randomizer))
	{
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4473);
		AI_PlayAni(self,"T_BSFIRE_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4477);
		AI_PlayAni(self,"T_BSFIRE_RANDOM_2");
	};
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_FIRE);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Fire_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Fire_End");
	B_StopUseMob(self,SCEMENAME_FIRE);
};

