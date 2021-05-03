
func void zs_makerune()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_MakeRune");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_RUNEMAKER);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_RIGHTHAND",4692);
		ai_createiteminslot(self,"ZS_LEFTHAND",4470);
	};
};

func int zs_makerune_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_MakeRune_Loop");
	if((self.aivar[33] != AIV_AM_RUNEMAKER) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4637);
	AI_PlayAni(self,"T_RMAKER_RANDOM_1");
	AI_Wait(self,1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_createiteminslot(self,"ZS_LEFTHAND",4175);
	AI_PlayAni(self,"T_RMAKER_RANDOM_2");
	if(Npc_GetStateTime(self) >= (50 + randomizer))
	{
		B_InterruptMob(SCEMENAME_RUNEMAKER);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_makerune_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_MakeRune_End");
	B_StopUseMob(self,SCEMENAME_RUNEMAKER);
};

