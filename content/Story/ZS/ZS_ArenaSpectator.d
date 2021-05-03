
func void ZS_ArenaSpectator()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaSpectator");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_spectator_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_spectator_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_spectator_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	B_GotoFP(self,"SPECTATOR");
};

func int ZS_ArenaSpectator_loop()
{
	var int jubel;
	var int anim;
	var int wait;
	var float waitf;
	PrintDebugNpc(PD_TA_LOOP,"ZS_ArenaSpectator_Loop");
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,-1,zs_attackarena,-1))
	{
		jubel = Hlp_Random(100);
		if(jubel < 20)
		{
			PrintDebugNpc(PD_ZS_Check,"");
			AI_TurnToNPC(self,other);
			B_Say(self,NULL,"$HEYHEYHEY");
		};
		anim = Hlp_Random(100);
		wait = Hlp_Random(2);
		waitf = IntToFloat(wait);
		if(anim < 10)
		{
			AI_Wait(self,waitf);
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM1");
		}
		else if(anim < 20)
		{
			AI_Wait(self,waitf);
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM2");
		}
		else if(anim < 30)
		{
			AI_Wait(self,waitf);
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM3");
		}
		else if(anim < 40)
		{
			AI_Wait(self,waitf);
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM4");
		}
		else if(anim < 60)
		{
			AI_Wait(self,waitf);
			AI_PlayAni(self,"T_WATCHFIGHTRANDOM6");
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_ArenaSpectator_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaSpectator_End");
};

func void b_spectator_assessmurder()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Spectator_AssessMurder");
};

func void b_spectator_assessdefeat()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Spectator_AssessDefeat");
};

func void b_spectator_assesscaster()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Spectator_AssessCaster");
};

