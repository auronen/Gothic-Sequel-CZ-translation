
func void b_arena_assesssc()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessSC");
	B_CheckForImportantInfo(self,other);
};

func void b_arena_assesssc_npc()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessSC_Npc");
	B_CheckForImportantInfo(self,other);
	if((Npc_GetDistToWP(hero,ARENA_WP_CENTER) < ARENA_CENTER_AREA) && (Npc_GetDistToWP(hero,ARENA_WP_THRONE) > ARENA_THRONE_AREA))
	{
		B_FullStop(self);
		AI_StartState(self,zs_arena_observeintruder,0,"");
	};
};

func void b_arena_assessfighter()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessFighter");
	if(Npc_IsInFightMode(other,FMODE_FAR))
	{
		PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe!");
		B_FullStop(self);
		B_Say(self,other,"$NoBowInArena");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_AssessFighter,0,"");
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		PrintDebugNpc(PD_ZS_Check,"...Zauberspruch!");
		B_FullStop(self);
		B_Say(self,other,"$NoMagicInArena");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_AssessFighter,0,"");
		return;
	};
	if(Npc_IsPlayer(other))
	{
		b_arena_assesssc();
	};
};

func void b_arena_assessdefeat()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessDefeat");
	if(Npc_IsInRoutine(other,zs_arenanpc) || (Npc_IsInRoutine(self,zs_arenafight) && Npc_IsPlayer(other)))
	{
		B_Say(self,other,"$PointForMe");
	};
};

func void b_arena_assesscaster()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessCaster");
	if(Npc_IsPlayer(other))
	{
		if(Npc_IsInRoutine(self,zs_arenanpc))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC kämpft gegen anderen NSC!");
			B_FullStop(self);
			b_punish(self,other,AIV_AR_DISTURBEDARENA);
		};
		if(Npc_IsInRoutine(self,zs_arenafight))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC kämfpt gegen Spieler!");
			B_FullStop(self);
			b_arena_abortfight(AF_PLAYERUSEDMAGIC);
		};
	};
};

func void b_arena_reacttodamage()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_ReactToDamage");
	if(Npc_IsPlayer(other) && Npc_IsInRoutine(self,zs_arenanpc))
	{
		B_FullStop(self);
		b_punish(self,other,AIV_AR_DISTURBEDARENA);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_FAR))
	{
		B_FullStop(self);
		B_Say(self,other,"$NoBowInArena");
		b_arena_abortfight(AF_PLAYERUSEDBOW);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		B_FullStop(self);
		B_Say(self,other,"$NoMagicInArena");
		b_arena_abortfight(AF_PLAYERUSEDMAGIC);
		return;
	};
};

func void b_arena_fightsound()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_FightSound");
	if(Npc_IsInRoutine(victim,zs_arenanpc) && Npc_IsPlayer(other))
	{
		B_FullStop(self);
		b_punish(self,other,AIV_AR_DISTURBEDARENA);
		return;
	};
	if(Npc_IsInRoutine(victim,zs_arenanpc) && Npc_IsInFightMode(other,FMODE_FAR))
	{
		B_FullStop(self);
		B_Say(self,other,"$NoBowInArena");
		b_punish(self,other,AIV_AR_ARENABOW);
	};
	if(Npc_IsInRoutine(victim,zs_arenanpc) && Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		B_FullStop(self);
		B_Say(self,other,"$NoMagicInArena");
		b_punish(self,other,AIV_AR_ARENAMAGIC);
	};
};

func void b_arena_assessmurder()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Arena_AssessMurder");
	if(Npc_IsInRoutine(victim,zs_arenafight))
	{
		PrintDebugNpc(PD_ZS_FRAME,"...Mord an Co-Gladiator!");
		B_Say(self,other,"$Buh");
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME,"...normaler Mord!");
		B_FullStop(self);
		AI_StartState(self,ZS_AssessMurder,0,"");
	};
};

