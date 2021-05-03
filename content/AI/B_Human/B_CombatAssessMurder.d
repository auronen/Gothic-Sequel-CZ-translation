
func void B_CombatAssessMurder()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_CombatAssessMurder");
	PrintGlobals(PD_ZS_Check);
	if(C_NpcIsHuman(victim) && C_NpcIsHuman(other))
	{
		INT_MURDERID1 = Hlp_GetInstanceID(victim);
		PrintDebugInt(PD_ZS_Check,"MurderID1 ",INT_MURDERID1);
		PrintDebugInt(PD_ZS_Check,"MurderID2 ",INT_MURDERID2);
		if(!B_CompareNpcInstance(victim,hero))
		{
			PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // victim is not Hero");
			B_Say(self,other,"$HEKILLEDHIM");
		};
		if(INT_MURDERID1 != INT_MURDERID2)
		{
			INT_MURDERID2 = INT_MURDERID1;
			PrintDebugNpc(PD_ZS_Check,"Anderer Mord");
			INT_MURDERCOUNT = INT_MURDERCOUNT + 1;
		}
		else
		{
			INT_MURDERID2 = Hlp_GetInstanceID(victim);
			PrintDebugInt(PD_ZS_Check,"MurderID2 nach Tausch ",INT_MURDERID2);
		};
	};
	if(Npc_CanSeeNpc(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen");
		if(C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // Both human");
			if(!B_CompareNpcInstance(victim,hero))
			{
				PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // victim is not Hero");
			};
			if(Npc_IsInState(self,ZS_ProclaimAndPunish))
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC ist in ZS_ProclaimAndPunish!");
				if(B_CompareNpcInstance(victim,hero))
				{
					PrintDebugNpc(PD_ZS_Check,"...Getöteter ist auch eigenes Ziel!");
					B_FullStop(self);
					AI_ContinueRoutine(self);
				};
			};
		};
		if((Npc_GetTempAttitude(self,victim) == ATT_FRIENDLY) && !C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // friendly to victim ::");
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
	}
	else if(C_NpcIsHuman(other) && C_NpcIsHuman(victim))
	{
		PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder // only heard");
		if(!B_CompareNpcInstance(victim,hero))
		{
			PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // victim is not Hero");
		};
	};
};

