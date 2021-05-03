
func void b_clearroomrefusetalk()
{
	B_Say(self,other,"$GETOUTOFHERE");
	AI_StopProcessInfos(self);
};

func void ZS_ClearRoom()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoom");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ClearRoomUseMob);
	Npc_PercEnable(self,PERC_MOVENPC,B_StopGotoHero);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_clearroomrefusetalk);
	C_ZSInit();
	B_WhirlAround(self,other);
	b_pointandshout(self,other,"$HEYYOU");
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SetTarget(self,other);
	self.aivar[43] = TRUE;
};

func int ZS_ClearRoom_Loop()
{
	var int portalguild;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ClearRoom_Loop");
	Npc_GetTarget(self);
	portalguild = Wld_GetPlayerPortalGuild();
	PrintGuild(PD_ZS_Check,portalguild);
	if((portalguild == GIL_None) || (Wld_GetGuildAttitude(self.guild,portalguild) != ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		B_FullStop(self);
		AI_ContinueRoutine(self);
		self.aivar[43] = FALSE;
		return LOOP_END;
	};
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpc(self,other))
	{
		B_FullStop(self);
		return LOOP_END;
	};
	AI_GotoNpc(self,other);
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void ZS_ClearRoom_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoom_End");
	AI_TurnToNPC(self,other);
	if(C_AmIStronger(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"...Nsc ist stärker!");
		B_Say(self,other,"$GETOUTOFHERE");
		AI_Wait(self,3);
		AI_StartState(self,ZS_ClearRoomWait,0,"");
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Nsc ist schwächer!");
		B_Say(self,other,"$GETOUTORICALLGUARDS");
		AI_Wait(self,3);
		AI_StartState(self,ZS_ClearRoomWait,0,"");
	};
};

func void ZS_ClearRoomWait()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoomWait");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ClearRoomUseMob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_clearroomrefusetalk);
	C_ZSInit();
	B_DrawWeapon(self,other);
	B_Say(self,other,"$GETOUTOFHERE");
};

func void ZS_ClearRoomWait_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ClearRoomWait_Loop");
	B_SmartTurnToNpc(self,other);
	if((Wld_GetPlayerPortalGuild() == GIL_None) || (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(C_AmIStronger(self,other))
		{
			AI_TurnToNPC(self,other);
			B_Say(self,other,"$WISEMOVE");
		};
		self.aivar[43] = FALSE;
		AI_ContinueRoutine(self);
	};
	AI_Wait(self,1);
};

func void ZS_ClearRoomWait_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ClearRoomWait_End");
};

func void B_ClearRoomEnterRoom()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_ClearRoomEnterRoom");
	B_FullStop(self);
	if(Npc_CanSeeNpc(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC kann SC sehen!");
		if(Wld_GetPlayerPortalGuild() == GIL_None)
		{
			PrintDebugNpc(PD_ZS_Check,"...SC nicht mehr im Raum!");
			if(C_AmIStronger(self,other))
			{
				AI_TurnToNPC(self,other);
				B_Say(self,other,"$WISEMOVE");
			};
			self.aivar[43] = FALSE;
			AI_ContinueRoutine(self);
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...SC nicht mehr im Raum!, kann es aber nicht sehen");
		if(Wld_GetPlayerPortalGuild() == GIL_None)
		{
			self.aivar[43] = FALSE;
			AI_ContinueRoutine(self);
		};
	};
};

func void B_ClearRoomUseMob()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_ClearRoomUseMob");
	if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild) || (Wld_GetGuildAttitude(self.guild,b_getmobguild(other)) == ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_Check,"...MOB gehört NSC oder seiner Gilde!");
		B_FullStop(self);
		Npc_PercDisable(self,PERC_ASSESSUSEMOB);
		b_guildassigntheft();
		if(C_AmIStronger(self,other))
		{
			B_Say(self,other,"$DIRTYTHIEF");
			b_attackquick(self,other);
		}
		else
		{
			AI_StartState(self,ZS_CallGuardsOnEnterRoom,0,"");
		};
	};
};

