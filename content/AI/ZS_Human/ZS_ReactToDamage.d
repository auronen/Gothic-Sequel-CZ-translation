
func void ZS_ReactToDamage()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ReactToDamage");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_CombatAssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_CombatAssessDefeat);
	B_WhirlAround(self,other);
	if(self.aivar[28])
	{
		B_SpecialCombatDamageReaction();
	};
	if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[5] = TRUE;
	}
	else
	{
		self.aivar[5] = FALSE;
	};
	if(!C_NpcIsMonster(other))
	{
		if(Npc_IsPlayer(other))
		{
			if(Npc_GetPermAttitude(self,other) == ATT_FRIENDLY)
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc(self,other);
				B_Say(self,other,"$WHATAREYOUDOING");
				AI_StartState(self,zs_reacttodamagewait_friendly,0,"");
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC nicht FRIENDLY zum Angreifer!");
				self.aivar[AIV_BEENATTACKED] = 1;
				if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					b_setattitude(self,ATT_ANGRY);
				};
				Npc_SetTempAttitude(self,ATT_HOSTILE);
			};
		};
		AI_StartState(self,ZS_AssessEnemy,0,"");
	}
	else
	{
		AI_StartState(self,ZS_AssessMonster,0,"");
	};
};

func int zs_reacttodamage_loop()
{
	return LOOP_END;
};

func void zs_reacttodamage_end()
{
};

func void zs_reacttodamagewait_friendly()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ReactToDamageWaitFriendly");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_CombatAssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_CombatAssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_reacttodamagewaitdamage);
};

func int zs_reacttodamagewait_friendly_loop()
{
	var int int_wait;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_ReactToDamage_WaitFriedndlyLoop");
	int_wait = 1;
	if(int_wait == 1)
	{
		AI_Wait(self,5);
		int_wait = 0;
	};
	if(int_wait == 0)
	{
		return LOOP_END;
	};
};

func void zs_reacttodamagewaitfriendly_end()
{
	AI_ContinueRoutine(self);
};

func void b_reacttodamagewaitdamage()
{
	PrintDebugNpc(PD_ZS_Check,"B_ReactToDamageWaitDamage");
	B_FullStop(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,0,"");
};

