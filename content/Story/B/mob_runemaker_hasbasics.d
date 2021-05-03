
func int mob_runemaker_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_RUNEMAKER) && (Npc_HasItems(self,itmi_pliers) >= 1))
	{
		return TRUE;
	};
};

func int mob_runemaker_canproducerunelight()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneLight");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_1) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrolllight) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNELIGHT) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunefirebolt()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneFirebolt");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_1) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrollfirebolt) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEFIREBOLT) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproduceruneheal()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneHeal");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_2) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrollheal) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEHEAL) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunethunderbolt()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneThunderbolt");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_1) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrollthunderbolt) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNETHUNDERBOLT) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunewindfist()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneWindfist");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_2) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrollwindfist) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEWINDFIST) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunesleep()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneSleep");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_2) && (Npc_HasItems(self,itar_runeblank) >= 1) && (Npc_HasItems(self,itar_scrollsleep) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNESLEEP) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunecharm()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneCharm");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollcharm) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNECHARM) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunethunderball()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneThunderball");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollthunderball) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNETHUNDERBALL) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproduceruneicecube()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneIcecube");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollicecube) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEICECUBE) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunepyrokinesis()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRunePyrokinesis");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollpyrokinesis) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEPYROKINESIS) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunedestroyundead()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneDestroyUndead");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_4) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrolldestroyundead) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEDESTROYUNDEAD) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunechainlightning()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneChainlightning");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_4) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollchainlightning) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNECHAINLIGHTNING) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunestormfist()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneStormfist");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_4) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollstormfist) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNESTORMFIST) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunetelekinesis()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneTelekinesis");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrolltelekinesis) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNETELEKINESIS) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunefireball()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneFireball");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollfireball) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEFIREBALL) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunefirestorm()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneFireStorm");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_4) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollfirestorm) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEFIRESTORM) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunecontrol()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneControl");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_4) && (Npc_HasItems(self,itar_bloodruneblank) >= 1) && (Npc_HasItems(self,itar_scrollcontrol) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNECONTROL) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunebreathofdeath()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneBreathOfDeath");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_3) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_6) && (Npc_HasItems(self,itar_darkruneblank) >= 1) && (Npc_HasItems(self,itar_scrollbreathofdeath) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEBREATHOFDEATH) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproduceruneicewave()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneIcewave");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_3) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_5) && (Npc_HasItems(self,itar_darkruneblank) >= 1) && (Npc_HasItems(self,itar_scrollicewave) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEICEWAVE) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproducerunefirerain()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduceRuneFireRain");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_3) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_5) && (Npc_HasItems(self,itar_darkruneblank) >= 1) && (Npc_HasItems(self,itar_scrollfirerain) >= 1) && (self.attribute[ATR_MANA_MAX] >= MANAPERM_RUNEFIRERAIN) && mob_runemaker_hasbasics())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func int mob_runemaker_canproduce()
{
	PrintDebugNpc(PD_ZS_Check,"MOB_RUNEMAKER_CanProduce");
	if(mob_runemaker_canproducerunelight() || mob_runemaker_canproducerunefirebolt() || mob_runemaker_canproducerunefireball() || mob_runemaker_canproducerunefirestorm() || mob_runemaker_canproducerunefirerain() || mob_runemaker_canproduceruneheal() || mob_runemaker_canproducerunethunderbolt() || mob_runemaker_canproducerunethunderball() || mob_runemaker_canproducerunechainlightning() || mob_runemaker_canproduceruneicecube() || mob_runemaker_canproduceruneicewave() || mob_runemaker_canproducerunepyrokinesis() || mob_runemaker_canproducerunewindfist() || mob_runemaker_canproducerunestormfist() || mob_runemaker_canproducerunetelekinesis() || mob_runemaker_canproducerunecontrol() || mob_runemaker_canproducerunecharm() || mob_runemaker_canproducerunesleep())
	{
		PrintDebugNpc(PD_ZS_Check,"TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"FALSE");
		return FALSE;
	};
};

func string mob_runemaker_getcantstring()
{
	printdebugmobsi("MOB_runemaker_GetCantString");
	if(Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) < 1)
	{
		printdebugmobsi("MOB_runemaker_GetCantString ...no Talent");
		return _STR_MESSAGE_MOBSI_RUNE_TAL;
	}
	else if(Npc_HasItems(self,itmi_pliers) < 1)
	{
		printdebugmobsi("MOB_runemaker_GetCantString... no Tool");
		return _STR_MESSAGE_MOBSI_RUNE_TOOL;
	}
	else if(hero.attribute[ATR_MANA] < MANA_RUNE)
	{
		printdebugmobsi("MOB_runemaker_GetCantString no Mana");
		return _STR_MESSAGE_MOBSI_RUNE_MANA;
	}
	else
	{
		printdebugmobsi("MOB_runemaker_GetCantString no Material");
		return _STR_MESSAGE_MOBSI_RUNEMAKER_MAT;
	};
};

func int mob_runemaker_condition()
{
	printdebugmobsi("MOB_runemaker_CONDITION");
	self.aivar[33] = AIV_AM_RUNEMAKER;
	if(Npc_IsPlayer(self))
	{
		if(mob_runemaker_canproduce())
		{
			printdebugmobsi("MOB_runemaker_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_runemaker_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_runemaker_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_runemaker_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_runemaker_s1()
{
	printdebugmobsi("MOB_rune_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_RUNEMAKER;
		ai_createiteminslot(self,"ZS_RIGHTHAND",4692);
		AI_ProcessInfos(self);
	};
};


instance MOB_RUNEMAKER_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_runemaker_exit_condition;
	information = mob_runemaker_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int mob_runemaker_exit_condition()
{
	return hero.aivar[33] == AIV_AM_RUNEMAKER;
};

func void mob_runemaker_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_UseMob(self,SCEMENAME_RUNEMAKER,-1);
};

func void mob_runemaker_autoexit()
{
	printdebugmobsi("MOB_Runemaker_AutoExit");
	if(!mob_runemaker_canproduce())
	{
		mob_runemaker_exit_info();
	};
};


instance MOB_RUNEMAKER_LIGHT(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunelight;
	information = mob_produce_light_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_LIGHT,NAME_Rune,MANAPERM_RUNELIGHT);
};


func void mob_produce_light_rune()
{
	b_produceitem2(1,4175,ConcatStrings(NAME_LIGHT,NAME_RUNEPOSTFIX),1,4637,1,4176);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNELIGHT;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_FIREBOLT(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunefirebolt;
	information = mob_produce_firebolt_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_FIREBOLT,NAME_Rune,MANAPERM_RUNEFIREBOLT);
};


func void mob_produce_firebolt_rune()
{
	b_produceitem2(1,4177,ConcatStrings(NAME_FIREBOLT,NAME_RUNEPOSTFIX),1,4637,1,4178);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEFIREBOLT;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_HEAL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproduceruneheal;
	information = mob_produce_heal_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_HEAL,NAME_Rune,MANAPERM_RUNEHEAL);
};


func void mob_produce_heal_rune()
{
	b_produceitem2(1,4193,ConcatStrings(NAME_HEAL,NAME_RUNEPOSTFIX),1,4637,1,4194);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEHEAL;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_THUNDERBOLT(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunethunderbolt;
	information = mob_produce_thunderbolt_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_THUNDERBOLT,NAME_Rune,MANAPERM_RUNETHUNDERBOLT);
};


func void mob_produce_thunderbolt_rune()
{
	b_produceitem2(1,4208,ConcatStrings(NAME_THUNDERBOLT,NAME_RUNEPOSTFIX),1,4637,1,4209);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNETHUNDERBOLT;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_WINDFIST(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunewindfist;
	information = mob_produce_windfist_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_WINDFIST,NAME_Rune,MANAPERM_RUNEWINDFIST);
};


func void mob_produce_windfist_rune()
{
	b_produceitem2(1,4222,ConcatStrings(NAME_WINDFIST,NAME_RUNEPOSTFIX),1,4637,1,4223);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEWINDFIST;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_SLEEP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunesleep;
	information = mob_produce_sleep_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_SLEEP,NAME_Rune,MANAPERM_RUNESLEEP);
};


func void mob_produce_sleep_rune()
{
	b_produceitem2(1,4230,ConcatStrings(NAME_SLEEP,NAME_RUNEPOSTFIX),1,4637,1,4231);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNESLEEP;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_CHARM(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunecharm;
	information = mob_produce_charm_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_CHARM,NAME_Rune,MANAPERM_RUNECHARM);
};


func void mob_produce_charm_rune()
{
	b_produceitem2(1,4228,ConcatStrings(NAME_CHARM,NAME_RUNEPOSTFIX),1,4638,1,4229);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNECHARM;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_THUNDERBALL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunethunderball;
	information = mob_produce_thunderball_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_THUNDERBALL,NAME_Rune,MANAPERM_RUNETHUNDERBALL);
};


func void mob_produce_thunderball_rune()
{
	b_produceitem2(1,4210,ConcatStrings(NAME_THUNDERBALL,NAME_RUNEPOSTFIX),1,4638,1,4211);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNETHUNDERBALL;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_ICECUBE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproduceruneicecube;
	information = mob_produce_icecube_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_ICECUBE,NAME_Rune,MANAPERM_RUNEICECUBE);
};


func void mob_produce_icecube_rune()
{
	b_produceitem2(1,4212,ConcatStrings(NAME_ICECUBE,NAME_RUNEPOSTFIX),1,4638,1,4213);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEICECUBE;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_PYROKINESIS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunepyrokinesis;
	information = mob_produce_pyrokinesis_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_PYROKINESIS,NAME_Rune,MANAPERM_RUNEPYROKINESIS);
};


func void mob_produce_pyrokinesis_rune()
{
	b_produceitem2(1,4232,ConcatStrings(NAME_PYROKINESIS,NAME_RUNEPOSTFIX),1,4638,1,4233);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEPYROKINESIS;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_DESTROYUNDEAD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunedestroyundead;
	information = mob_produce_destroyundead_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_DESTROYUNDEAD,NAME_Rune,MANAPERM_RUNEDESTROYUNDEAD);
};


func void mob_produce_destroyundead_rune()
{
	b_produceitem2(1,4220,ConcatStrings(NAME_DESTROYUNDEAD,NAME_RUNEPOSTFIX),1,4638,1,4221);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEDESTROYUNDEAD;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_CHAINLIGHTNING(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunechainlightning;
	information = mob_produce_chainlightning_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_CHAINLIGHTNING,NAME_Rune,MANAPERM_RUNECHAINLIGHTNING);
};


func void mob_produce_chainlightning_rune()
{
	b_produceitem2(1,4206,ConcatStrings(NAME_CHAINLIGHTNING,NAME_RUNEPOSTFIX),1,4638,1,4207);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNECHAINLIGHTNING;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_STORMFIST(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunestormfist;
	information = mob_produce_stormfist_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_STORMFIST,NAME_Rune,MANAPERM_RUNESTORMFIST);
};


func void mob_produce_stormfist_rune()
{
	b_produceitem2(1,4224,ConcatStrings(NAME_STORMFIST,NAME_RUNEPOSTFIX),1,4638,1,4225);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNESTORMFIST;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_TELEKINESIS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunetelekinesis;
	information = mob_produce_telekinesis_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_TELEKINESIS,NAME_Rune,MANAPERM_RUNETELEKINESIS);
};


func void mob_produce_telekinesis_rune()
{
	b_produceitem2(1,4226,ConcatStrings(NAME_TELEKINESIS,NAME_RUNEPOSTFIX),1,4638,1,4227);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNETELEKINESIS;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_FIREBALL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunefireball;
	information = mob_produce_fireball_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_FIREBALL,NAME_Rune,MANAPERM_RUNEFIREBALL);
};


func void mob_produce_fireball_rune()
{
	b_produceitem2(1,4179,ConcatStrings(NAME_FIREBALL,NAME_RUNEPOSTFIX),1,4638,1,4180);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEFIREBALL;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_FIRESTORM(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunefirestorm;
	information = mob_produce_firestorm_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_FIRESTORM,NAME_Rune,MANAPERM_RUNEFIRESTORM);
};


func void mob_produce_firestorm_rune()
{
	b_produceitem2(1,4181,ConcatStrings(NAME_FIRESTORM,NAME_RUNEPOSTFIX),1,4638,1,4182);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEFIRESTORM;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_CONTROL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunecontrol;
	information = mob_produce_control_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_CONTROL,NAME_Rune,MANAPERM_RUNECONTROL);
};


func void mob_produce_control_rune()
{
	b_produceitem2(1,4234,ConcatStrings(NAME_CONTROL,NAME_RUNEPOSTFIX),1,4638,1,4235);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNECONTROL;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_BREATHOFDEATH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunebreathofdeath;
	information = mob_produce_breathofdeath_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_BREATHOFDEATH,NAME_Rune,MANAPERM_RUNEBREATHOFDEATH);
};


func void mob_produce_breathofdeath_rune()
{
	b_produceitem2(1,4238,ConcatStrings(NAME_BREATHOFDEATH,NAME_RUNEPOSTFIX),1,4639,1,4239);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEBREATHOFDEATH;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_ICEWAVE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproduceruneicewave;
	information = mob_produce_icewave_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_ICEWAVE,NAME_Rune,MANAPERM_RUNEICEWAVE);
};


func void mob_produce_icewave_rune()
{
	b_produceitem2(1,4214,ConcatStrings(NAME_ICEWAVE,NAME_RUNEPOSTFIX),1,4639,1,4215);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEICEWAVE;
	mob_runemaker_autoexit();
};


instance MOB_RUNEMAKER_FIRERAIN(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemaker_canproducerunefirerain;
	information = mob_produce_firerain_rune;
	important = FALSE;
	permanent = TRUE;
	description = b_buildrunemakerstring(NAME_FIRERAIN,NAME_Rune,MANAPERM_RUNEFIRERAIN);
};


func void mob_produce_firerain_rune()
{
	b_produceitem2(1,4183,ConcatStrings(NAME_FIRERAIN,NAME_RUNEPOSTFIX),1,4639,1,4184);
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - MANAPERM_RUNEFIRERAIN;
	mob_runemaker_autoexit();
};

