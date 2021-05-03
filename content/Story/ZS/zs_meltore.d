
func void zs_meltore()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_MeltOre");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_MELTER);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4692);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4470);
	};
};

func int zs_meltore_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_MeltOre_Loop");
	if((self.aivar[33] != AIV_AM_MELTER) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_createiteminslot(self,"ZS_RIGHTHAND",4470);
	AI_PlayAni(self,"T_BSMELTER_MELT_1");
	AI_Wait(self,1);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_createiteminslot(self,"ZS_RIGHTHAND",4477);
	AI_PlayAni(self,"T_BSMELTER_MELT_2");
	if(Npc_GetStateTime(self) >= (50 + randomizer))
	{
		B_InterruptMob(SCEMENAME_MELTER);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_meltore_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_MeltOre_End");
	B_StopUseMob(self,SCEMENAME_MELTER);
};

