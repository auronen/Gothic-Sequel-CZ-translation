
func void ZS_Cook()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Cook");
	B_SetPerception(self);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_UseMob(self,SCEMENAME_CAULDRON,1);
		ai_createiteminslot(self,"ZS_RIGHTHAND",4700);
	};
};

func int ZS_Cook_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Cook_Loop");
	randomizer = Hlp_Random(20);
	if(wld_getinteractmobstate(self,SCEMENAME_CAULDRON) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_Cook_Loop ...Mob state");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		ai_createiteminslot(self,"ZS_LEFTHAND",5067);
		AI_PlayAni(self,"T_CAULDRON_DROP_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_PlayAni(self,"T_CAULDRON_DROP_2");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		ai_createiteminslot(self,"ZS_LEFTHAND",4067);
		AI_PlayAni(self,"T_CAULDRON_DROP_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_PlayAni(self,"T_CAULDRON_DROP_2");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		AI_PlayAni(self,"T_CAULDRON_MIX_1");
		ai_createiteminslot(self,"ZS_LEFTHAND",4546);
		AI_PlayAni(self,"T_CAULDRON_FILL_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_PlayAni(self,"T_CAULDRON_FILL_2");
	};
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_CAULDRON);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Cook_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Cook_End");
	AI_UseMob(self,SCEMENAME_CAULDRON,-1);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

