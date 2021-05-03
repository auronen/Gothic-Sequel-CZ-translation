
func void ZS_CatchThief()
{
	var int portalguild;
	PrintDebugNpc(PD_ZS_Check,"ZS_CatchThief");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_Check,portalguild);
	if(portalguild != GIL_None)
	{
		self.aivar[43] = TRUE;
	};
	if(self.aivar[32] == FALSE)
	{
		B_FullStop(self);
		B_WhirlAround(self,other);
		b_guildassigntheft();
	};
	B_Say(self,other,"$YOUSTOLEFROMME");
	AI_StartState(self,ZS_AssessEnemy,0,"");
};

