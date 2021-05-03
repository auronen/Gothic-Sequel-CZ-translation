
func void B_CombatAssessDefeat()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_CombatAssessDefeat");
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(C_NpcIsHuman(other) && C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"...Mensch besiegt Mensch!");
			if(Npc_IsInState(self,ZS_ProclaimAndPunish))
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC ist in ZS_ProclaimAndPunish!");
				if(B_CompareNpcInstance(victim,hero))
				{
					PrintDebugNpc(PD_ZS_Check,"...Besiegter ist auch eigenes Ziel!");
					B_FullStop(self);
					AI_ContinueRoutine(self);
				};
			};
		};
	};
};

