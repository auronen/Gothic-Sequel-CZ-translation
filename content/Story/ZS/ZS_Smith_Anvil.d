
func void ZS_Smith_Anvil()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Anvil");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	B_SetPerception(self);
	B_StartUseMob(self,SCEMENAME_ANVIL);
	ai_createiteminslot(self,"ZS_RIGHTHAND",4415);
};

func int ZS_Smith_Anvil_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Smith_Anvil_Loop");
	if((self.aivar[33] != AIV_AM_ANVIL) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4477);
	AI_PlayAni(self,"T_BSANVIL_RANDOM_1");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4481);
	AI_PlayAni(self,"T_BSANVIL_RANDOM_2");
	if(Npc_GetStateTime(self) >= (50 + randomizer))
	{
		B_InterruptMob(SCEMENAME_ANVIL);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Anvil_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Anvil_End");
	B_StopUseMob(self,SCEMENAME_ANVIL);
};

