
func void B_CombatReactToDamage()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_CombatReactToDamage");
	PrintGlobals(PD_ZS_Check);
	if(Npc_IsPlayer(other) && ((self.npcType == npctype_friend) || (Npc_GetPermAttitude(self,other) == ATT_FRIENDLY)))
	{
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[5] = TRUE;
	}
	else
	{
		self.aivar[5] = FALSE;
	};
	if(Npc_IsPlayer(other))
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) || (Npc_GetAttitude(self,other) == ATT_ANGRY))
		{
			Npc_SetTarget(self,other);
		};
	};
	if(self.aivar[28])
	{
		B_SpecialCombatDamageReaction();
	};
};

