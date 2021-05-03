
func void B_AssessUseMob()
{
	var string detectedMob;
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessUseMob");
	detectedMob = Npc_GetDetectedMob(other);
	PrintDebugNpc(PD_ZS_Check,detectedMob);
	if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
		{
			PrintDebugNpc(PD_ZS_Check,"...MOB gehört NSC oder seiner Gilde!");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (self.guild == other.guild))
			{
				PrintDebugNpc(PD_ZS_Check,"...Manipulator ist FRIENDLY oder in gleicher Gilde!");
				B_Say(self,other,"$HANDSOFF");
			}
			else
			{
				PrintGlobals(PD_ZS_Check);
				Npc_SetTempAttitude(self,ATT_HOSTILE);
				Npc_ClearAIQueue(self);
				B_WhirlAround(self,other);
				B_SayOverlay(self,other,"$HANDSOFF");
				AI_SetWalkMode(self,NPC_RUN);
				b_attackquick(self,other);
			};
		}
		else
		{
			PrintDebugNpc(PD_ZS_DETAIL,"not my MoB");
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"kann SC nicht sehen");
	};
};

