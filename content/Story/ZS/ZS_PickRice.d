
func void ZS_PickRice()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PickRice");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PICKRICE"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PICKRICE"))
	{
		B_GotoFP(self,"PICKRICE");
		AI_AlignToFP(self);
	};
	self.aivar[11] = Hlp_Random(5) + 5;
};

func void ZS_PickRice_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_PickRice_Loop");
	if((Npc_GetStateTime(self) >= self.aivar[11]) && Hlp_Random(2))
	{
		PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if(Npc_IsOnFP(self,"PICKRICE_1") && Wld_IsFPAvailable(self,"PICKRICE_1"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP(self,"PICKRICE_1");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[11] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE_2") && Wld_IsFPAvailable(self,"PICKRICE_2"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 2");
			AI_GotoNextFP(self,"PICKRICE_2");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[11] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE_3") && Wld_IsFPAvailable(self,"PICKRICE_3"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 3");
			AI_GotoNextFP(self,"PICKRICE_3");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[11] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICKRICE"))
		{
			PrintDebugNpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[11] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	}
	else if(Npc_GetStateTime(self) >= self.aivar[11])
	{
		PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken");
		if(Npc_IsOnFP(self,"PICKRICE"))
		{
			AI_PlayAni(self,"T_PLUNDER");
			self.aivar[11] = Hlp_Random(5) + 5;
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	};
	B_GotoFP(self,"PICKRICE");
	AI_Wait(self,1);
};

func void ZS_PickRice_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PickRice_End");
};

