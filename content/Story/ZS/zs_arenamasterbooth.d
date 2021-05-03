
func void zs_arenamasterbooth()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaMasterBooth");
	B_SetPerception(self);
	b_arena_finishfight();
	b_arena_unselectfight();
	AI_StartState(self,ZS_Stand,1,"");
};

func void zs_arenamasternpcsend()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaMasterNpcSend");
	B_SetPerception(self);
	b_arena_finishfight();
	b_arena_unselectfight();
	b_arena_selectfight();
	AI_StartState(self,ZS_Stand,1,"");
};

func void zs_arenamasternpc()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaMasterNpc");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_arena_assesssc);
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,b_arenamaster_assesscaster);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_arenamaster_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_arenamaster_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	b_arena_finishfight();
	b_arena_unselectfight();
	b_arena_selectfight();
	AI_SetWalkMode(self,NPC_WALK);
	b_arena_startfight();
};

func int zs_arenamasternpc_loop()
{
	var int sitreaktion;
	PrintDebugNpc(PD_TA_LOOP,"ZS_ArenaMasterNpc_Loop");
	if(!C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK,"...NSC sitzt noch nicht!");
		if(Wld_IsMobAvailable(self,SCEMENAME_BENCH) && (Npc_GetDistToWP(self,self.wp) < 600))
		{
			PrintDebugNpc(PD_TA_CHECK,"...kl. Thron gefunden!");
			AI_UseMob(self,SCEMENAME_BENCH,1);
		}
		else
		{
			b_gotonearwp(self,self.wp);
			AI_UseMob(self,"CHAIR",1);
		};
	}
	else
	{
		sitreaktion = Hlp_Random(100);
		PrintDebugInt(PD_TA_DETAIL,"...Zufallsani-Wurf: ",sitreaktion);
		if(sitreaktion >= 75)
		{
			AI_PlayAniBS(self,"R_BENCH_RANDOM_1",BS_SIT);
		}
		else if(sitreaktion >= 50)
		{
			AI_PlayAniBS(self,"R_BENCH_RANDOM_2",BS_SIT);
		}
		else if(sitreaktion >= 25)
		{
			AI_PlayAniBS(self,"R_BENCH_RANDOM_3",BS_SIT);
		}
		else
		{
			AI_PlayAniBS(self,"R_BENCH_RANDOM_4",BS_SIT);
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_arenamasternpc_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaMasterNpc_End");
	AI_UseMob(self,"SMALL THRONE",-1);
};

func void zs_arenamastersleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaMasterSleep");
	B_SetPerception(self);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_arenamaster_assessfighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_arenamaster_assessfighter);
	b_arena_finishfight();
	b_arena_unselectfight();
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_StartState(self,ZS_Sleep,1,"");
};

func void b_arenamaster_assessfighter()
{
	PrintDebugNpc(PD_TA_FRAME,"B_ArenaMaster_AssessFighter");
	if(Wld_IsTime(ARENAEND_H,ARENAEND_M,ARENAEND_H,ARENAEND_M + 15))
	{
		return;
	}
	else
	{
		B_AssessFighter();
	};
};

func void b_arenamaster_assessmurder()
{
	PrintDebugNpc(PD_TA_FRAME,"B_ArenaMaster_AssessMurder");
	if(Npc_IsInRoutine(victim,zs_arenafight))
	{
		PrintDebugNpc(PD_ZS_FRAME,"...Mord an Co-Gladiator!");
		b_arena_abortfight(AF_PLAYERKILLED);
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME,"...normaler Mord!");
		B_FullStop(self);
		AI_StartState(self,ZS_AssessMurder,0,"");
	};
};

func void b_arenamaster_assessdefeat()
{
	PrintDebugNpc(PD_TA_FRAME,"B_ArenaMaster_AssessDefeat");
};

func void b_arenamaster_assesscaster()
{
	PrintDebugNpc(PD_TA_FRAME,"B_ArenaMaster_AssessCaster");
	if(Npc_IsInRoutine(victim,zs_arenafight))
	{
		PrintDebugNpc(PD_ZS_FRAME,"...Magie während Arenakampf!");
		b_arena_abortfight(AF_PLAYERUSEDMAGIC);
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME,"...normale Magiebenutzung!");
		B_FullStop(self);
		B_AssessCaster();
	};
};

func int b_arena_isplayerpositionvalid()
{
	if(ARENA_PLAYERFIGHT)
	{
		if(((GRIM_CHALLENGED || BRUTUS_CHALLENGED || THORA_CHALLENGED) && (Npc_GetDistToWP(hero,ARENA_WP_LEFT_START) < 200)) || ((GOLIATH_CHALLENGED || MALGAR_CHALLENGED) && (Npc_GetDistToWP(hero,ARENA_WP_RIGHT_START) < 200)))
		{
			return TRUE;
		};
	}
	else if(((Npc_GetDistToWP(hero,ARENA_WP_CENTER) > ARENA_CENTER_AREA) || (Npc_GetDistToWP(hero,ARENA_WP_THRONE) < ARENA_THRONE_AREA)) && (Npc_GetDistToWP(hero,ARENA_WP_CHAMBERS) > ARENA_CHAMBERS_AREA) && (Npc_GetDistToWP(hero,ARENA_WP_PREAREA) > ARENA_PREAREA_AREA))
	{
		return TRUE;
	};
	return FALSE;
};

func void zs_arenamasterstartfight()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ArenaMasterStartFight");
	b_setarenaperception(self);
	b_gotonearwp(self,self.wp);
};

func int zs_arenamasterstartfight_loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ArenaMasterStartFight_Loop");
	if(b_arena_isplayerpositionvalid())
	{
		return LOOP_END;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_arenamasterstartfight_end()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ArenaMasterStartFight_End");
	if(b_arena_isplayerpositionvalid())
	{
		AI_Standup(self);
		AI_UseMob(self,"VWHEEL",1);
		AI_UseMob(self,"VWHEEL",0);
		AI_UseMob(self,"VWHEEL",-1);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,ARENA_WP_THRONE);
		AI_GotoFP(self,"MASTER");
		AI_AlignToFP(self);
		AI_Wait(self,1);
		b_arena_proclaimstart(self);
		AI_Wait(self,1);
	};
};

