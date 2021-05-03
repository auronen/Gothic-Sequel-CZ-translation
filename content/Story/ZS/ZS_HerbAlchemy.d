
func void ZS_HerbAlchemy()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_HerbAlchemy");
	B_SetPerception(self);
	if(self.aivar[25] == 1)
	{
		self.aivar[25] = 0;
	}
	else
	{
		B_StartUseMob(self,SCEMENAME_HERB);
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		PrintDebugNpc(PD_ZS_Check,"Hier sollte Item in Hand gehen");
		ai_createiteminslot(self,"ZS_LEFTHAND",4698);
	};
};

func int ZS_HerbAlchemy_Loop()
{
	var int int_helprandom;
	var int randomizer;
	PrintDebugNpc(PD_TA_LOOP,"ZS_HerbAlchemy_Loop");
	if(wld_getinteractmobstate(self,SCEMENAME_HERB) == 1)
	{
		int_helprandom = Hlp_Random(11);
		if(int_helprandom < 8)
		{
			AI_PlayAni(self,"T_HERB_RANDOM_1");
		};
		if(int_helprandom > 8)
		{
			AI_PlayAni(self,"T_HERB_RANDOM_2");
		};
	};
	randomizer = Hlp_Random(20);
	if(Npc_GetStateTime(self) >= (100 + randomizer))
	{
		B_InterruptMob(SCEMENAME_STOMPER);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_HerbAlchemy_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_HerbAlchemy_End");
	B_StopUseMob(self,SCEMENAME_HERB);
};

