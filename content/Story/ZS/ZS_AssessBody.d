
func void ZS_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_RefuseTalk);
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		PrintDebugNpc(PD_ZS_Check,"...Körper zu weit weg!");
		AI_StartState(self,ZS_HealSelf,0,"");
	};
};

func int ZS_AssessBody_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AssessBody_Loop");
	B_FullStop(self);
	AI_GotoNpc(self,other);
	return LOOP_END;
};

func void ZS_AssessBody_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody_End");
	if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npcType != npctype_friend) && (C_NpcIsHuman(self) && (Npc_GetPermAttitude(self,other) == ATT_ANGRY)))
	{
		PrintDebugNpc(PD_ZS_Check,"...kein purer Fernkämpfer und kein NSC-Freund!");
		AI_PlayAni(self,"T_PLUNDER");
		if(B_Plunder())
		{
			B_Say(self,other,"$ITookYourOre");
		}
		else
		{
			B_Say(self,other,"$ShitNoOre");
		};
	};
	AI_StartState(self,ZS_HealSelf,1,"");
};

