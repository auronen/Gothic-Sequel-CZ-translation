
func void B_AssessTalk()
{
	var C_Npc her;
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessTalk");
	if(Npc_IsInState(self,ZS_Smoke))
	{
		Npc_ClearAIQueue(self);
		AI_StandupQuick(self);
		AI_StartState(self,ZS_Talk,0,"");
	};
	her = Hlp_GetNpc(PC_Hero);
	if(!B_CompareNpcInstance(her,hero))
	{
		B_Say(self,other,"$NOTNOW");
	}
	else
	{
		Npc_SetPercTime(self,3);
		self.aivar[24] = FALSE;
		hero.aivar[24] = FALSE;
		hero.aivar[15] = FALSE;
		Npc_ClearAIQueue(self);
		Npc_SetPercTime(self,1);
		if(!C_BodyStateContains(self,BS_SIT) || !Npc_CanSeeNpc(self,hero))
		{
			AI_StartState(self,ZS_Talk,1,"");
		}
		else
		{
			AI_StartState(self,ZS_Talk,0,"");
		};
	};
};

