
func void ZS_PotionAlchemy()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PotionAlchemy");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_LAB);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_createiteminslot(self,"ZS_RIGHTHAND",4701);
	};
};

func int ZS_PotionAlchemy_Loop()
{
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_PotionAlchemy_Loop");
	if(wld_getinteractmobstate(self,SCEMENAME_LAB) == 1)
	{
		PrintDebugNpc(PD_TA_LOOP,"ZS_PotionAlchemy_Loop ...Mob state");
		AI_PlayAni(self,"T_LAB_RANDOM_1");
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_LAB);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_PotionAlchemy_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PotionAlchemy_End");
	B_StopUseMob(self,SCEMENAME_LAB);
};

