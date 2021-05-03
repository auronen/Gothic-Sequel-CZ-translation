
func void ZS_Smith_Cool()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Cool");
	B_SetPerception(self);
	B_StartUseMob(self,SCEMENAME_COOL);
};

func int ZS_Smith_Cool_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Smith_Cool_Loop");
	if((self.aivar[33] != AIV_AM_COOL) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4481);
	AI_PlayAni(self,"T_BSCOOL_RANDOM_1");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4493);
	AI_PlayAni(self,"T_BSCOOL_RANDOM_2");
	if(Npc_GetStateTime(self) >= (50 + randomizer))
	{
		B_InterruptMob(SCEMENAME_COOL);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Cool_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Cool_End");
	B_StopUseMob(self,SCEMENAME_COOL);
};

