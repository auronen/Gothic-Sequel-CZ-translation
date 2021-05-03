
func void zs_sawwood()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SawWood");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_SAW);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	};
};

func int zs_sawwood_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_SawWood_Loop");
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_SAW);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sawwood_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SawWood_End");
	B_StopUseMob(self,SCEMENAME_SAW);
};

