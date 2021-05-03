
func void zs_armormaker()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArmorMaker");
	B_SetPerception(self);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
		B_StartUseMob(self,SCEMENAME_ARMORSTAND);
	};
};

func int zs_armormaker_loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_ArmorMaker_Loop");
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		B_StartUseMob(self,SCEMENAME_ARMORSTAND);
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_ARMORSTAND);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_armormaker_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArmorMaker_End");
	B_StopUseMob(self,SCEMENAME_ARMORSTAND);
};

