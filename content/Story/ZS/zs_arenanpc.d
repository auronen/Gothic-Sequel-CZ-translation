
func void zs_arenanpc()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaNpc");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_arena_assesssc_npc);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_arena_assessfighter);
	b_setarenaperception(self);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	b_arena_resetgladiator(Hlp_GetInstanceID(self));
};

func int zs_arenanpc_loop()
{
	var C_Npc master;
	PrintDebugNpc(PD_TA_LOOP,"ZS_ArenaNpc_Loop");
	master = Hlp_GetNpc(mil_122_arenamaster);
	if(Npc_IsOnFP(self,"FP_ARENA_START"))
	{
		Npc_PerceiveAll(self);
		Wld_DetectNpc(self,-1,zs_arenanpc,-1);
		if(Wld_DetectNpc(self,-1,zs_arenanpc,-1) && (Npc_GetDistToWP(master,ARENA_WP_THRONE) < 300) && C_BodyStateContains(master,BS_SIT) && Npc_IsOnFP(other,"FP_ARENA_START"))
		{
			AI_TurnToNPC(self,other);
			b_arena_greetings(self);
			B_DrawWeapon(self,other);
			AI_Wait(self,2);
			Npc_SetTarget(self,other);
			AI_StartState(self,zs_attackarena,1,"");
			return LOOP_END;
		};
	}
	else
	{
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,self.wp);
		b_runtofp(self,"FP_ARENA_START");
	};
	AI_Wait(self,0.2);
	return LOOP_CONTINUE;
};

func void zs_arenanpc_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaNpc_End");
};

