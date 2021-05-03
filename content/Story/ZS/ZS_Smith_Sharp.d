
func void ZS_Smith_Sharp()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Sharp");
	B_SetPerception(self);
	B_StartUseMob(self,SCEMENAME_SHARP);
};

func int ZS_Smith_Sharp_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Smith_Sharp_Loop");
	if((self.aivar[33] != AIV_AM_SHARP) && !C_BodyStateContains(self,BS_MOBINTERACT))
	{
		PrintDebugNpc(PD_TA_LOOP,"...falsches oder kein Mobsi");
		return LOOP_END;
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (5 + randomizer))
	{
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4493);
		AI_PlayAni(self,"T_BSSHARP_RANDOM_1");
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4422);
		AI_PlayAni(self,"T_BSSHARP_RANDOM_2");
	};
	if(Npc_GetStateTime(self) >= (50 + randomizer))
	{
		B_InterruptMob(SCEMENAME_SHARP);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Smith_Sharp_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Smith_Sharp_End");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	B_StopUseMob(self,SCEMENAME_SHARP);
};

func void zs_arenasmith_sharp()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaSmith_Sharp");
	B_SetPerception(self);
	b_arena_regaindroppedweapon(Hlp_GetInstanceID(self));
	AI_StartState(self,ZS_Smith_Sharp,1,"");
};

