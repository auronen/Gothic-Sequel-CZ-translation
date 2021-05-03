
func void ZS_AssessMurder()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessMurder");
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	PrintGlobals(PD_ZS_Check);
	PrintAttitudes(PD_ZS_Check);
	if(Npc_CanSeeNpcFreeLOS(self,other) || Npc_CanSeeNpcFreeLOS(self,victim))
	{
		if(!C_NpcIsHuman(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"...Mord an Monster!");
			B_WhirlAround(self,victim);
			return;
		};
		if(!C_NpcIsHuman(other))
		{
			PrintDebugNpc(PD_ZS_Check,"...Mord von Monster!");
			Npc_SetTarget(self,other);
			Npc_GetTarget(self);
			AI_StartState(self,ZS_AssessMonster,0,"");
			return;
		};
		if(C_NpcIsHuman(victim) && C_NpcIsHuman(other))
		{
			INT_MURDERID1 = Hlp_GetInstanceID(victim);
			PrintDebugInt(PD_ZS_Check,"MurderID1 ",INT_MURDERID1);
			PrintDebugInt(PD_ZS_Check,"MurderID2 ",INT_MURDERID2);
			if(!B_CompareNpcInstance(victim,hero))
			{
				PrintDebugNpc(PD_ZS_Check,"B_CombatAssessMurder seen // victim is not Hero");
				B_Say(self,other,"$HEKILLEDHIM");
			};
			if(INT_MURDERID1 != INT_MURDERID2)
			{
				INT_MURDERID2 = INT_MURDERID1;
				PrintDebugNpc(PD_ZS_Check,"Anderer Mord");
				INT_MURDERCOUNT = INT_MURDERCOUNT + 1;
			}
			else
			{
				INT_MURDERID2 = Hlp_GetInstanceID(victim);
				PrintDebugInt(PD_ZS_Check,"MurderID2 nach Tausch ",INT_MURDERID2);
			};
		};
		PrintDebugInt(PD_ZS_Check,"Anzahl Morde Spieler ",INT_MURDERCOUNT);
		PrintDebugNpc(PD_ZS_Check,"ZS_AssessMurder/Npc_CanSeeNpc");
		B_WhirlAround(self,other);
		if(C_ChargeWasAttacked(self,victim,other))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ist Wache und ein Schützling wurde gemordet!");
			B_DrawWeapon(self,other);
			AI_StartState(self,ZS_ProclaimAndPunish,0,"");
			return;
		};
		if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			PrintDebugNpc(PD_ZS_Check,"...hostile zum Mörder!");
			B_AssessEnemy();
		};
	};
};

