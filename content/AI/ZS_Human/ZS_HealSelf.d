
func void ZS_HealSelf()
{
	PrintDebugNpc(PD_ZS_Check,"ZS_HealSelf");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	PrintGlobals(PD_ZS_Check);
	C_StopLookAt(self);
};

func int ZS_HealSelf_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_HealSelf_Loop");
	if(c_npchasfullpower(self) || (self.flags == NPC_FLAG_IMMORTAL))
	{
		PrintDebugNpc(PD_ZS_Check,"...vollständig geheilt!");
		return LOOP_END;
	}
	else
	{
		CreateInvItem(self,ItFo_Potion_Health_03);
		AI_UseItem(self,ItFo_Potion_Health_03);
	};
	if(c_npchasfullmana(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...Mana voll regeneriert!");
		return LOOP_END;
	}
	else
	{
		CreateInvItem(self,ItFo_Potion_Mana_03);
		AI_UseItem(self,ItFo_Potion_Mana_03);
	};
};

func void ZS_HealSelf_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_HealSelf_End");
	if(self.aivar[43] || (Wld_GetPlayerPortalGuild() != GIL_None))
	{
		PrintDebugNpc(PD_ZS_FRAME,"PlayerINRoom");
		AI_StartState(self,ZS_ClearRoomWait,1,"");
	};
};

func void ZS_HealSelfMana()
{
	PrintDebugNpc(PD_ZS_Check,"ZS_HealSelfMana");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
};

func int ZS_HealSelfMana_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_HealSelfMana_Loop");
	if(c_npchasfullmana(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...Mana voll regeneriert!");
		return LOOP_END;
	}
	else if(Npc_HasItems(self,ItFo_Potion_Mana_03) > 0)
	{
		PrintDebugString(PD_ZS_Check,"...",ItFo_Potion_Mana_03.description);
		AI_UseItem(self,ItFo_Potion_Mana_03);
	}
	else if(Npc_HasItems(self,ItFo_Potion_Mana_02) > 0)
	{
		PrintDebugString(PD_ZS_Check,"...",ItFo_Potion_Mana_02.description);
		AI_UseItem(self,ItFo_Potion_Mana_02);
	}
	else if(Npc_HasItems(self,ItFo_Potion_Mana_01) > 0)
	{
		PrintDebugString(PD_ZS_Check,"...",ItFo_Potion_Mana_01.description);
		AI_UseItem(self,ItFo_Potion_Mana_01);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...keine 'Mana-Regenerierungs-Mittel' mehr vorhanden!");
		return LOOP_END;
	};
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void ZS_HealSelfMana_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_HealSelfMana_End");
};

