
func int mob_runemelter_hasbasics()
{
	printdebugmobsi("MOB_Runemelter_HasBasics");
	if((hero.aivar[33] == AIV_AM_RUNEMELTER) && (Npc_HasItems(hero,itmi_pliers) >= 1))
	{
		printdebugmobsi("MOB_Cauldron_HasBasics ... TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cauldron_HasBasics ... FALSE");
		return FALSE;
	};
};

func int mob_runemelter_canproducerune()
{
	printdebugmobsi("Mob_Runemelter_CanProduceRune");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_1) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_1) && ((Npc_HasItems(self,itmi_orenugget) >= AMNT_RUNE) && (self.attribute[ATR_MANA] >= MANA_RUNE) && mob_runemelter_hasbasics()))
	{
		printdebugmobsi("Mob_Runemelter_CanProduceRune ... True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Runemelter_CanProduceRune ...False");
		return FALSE;
	};
};

func int mob_runemelter_canproducebloodrune()
{
	printdebugmobsi("Mob_Runemelter_CanProduceBloodRune");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_2) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_3) && ((Npc_HasItems(self,itmi_bloodorenugget) >= AMNT_BLOODRUNE) && (self.attribute[ATR_MANA] >= MANA_BLOODRUNE) && mob_runemelter_hasbasics()))
	{
		printdebugmobsi("Mob_Runemelter_CanProduceBloodRune True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Runemelter_CanProduceBloodRune ...False");
		return FALSE;
	};
};

func int mob_runemelter_canproducedarkrune()
{
	printdebugmobsi("Mob_Runemelter_CanProduceDarkRune");
	if((Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) >= TAL_STEP_3) && (Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= TAL_STEP_5) && ((Npc_HasItems(self,itmi_darkorenugget) >= AMNT_DARKRUNE) && (self.attribute[ATR_MANA] >= MANA_DARKRUNE) && mob_runemelter_hasbasics()))
	{
		printdebugmobsi("Mob_Runemelter_CanProduceDarkRune ...True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Runemelter_CanProduceDarkRune...False");
		return FALSE;
	};
};

func int mob_runemelter_canproduce()
{
	printdebugmobsi("Mob_Runemelter_CanProduce");
	if(mob_runemelter_canproducerune() || mob_runemelter_canproducebloodrune() || mob_runemelter_canproducedarkrune())
	{
		printdebugmobsi("Mob_Runemelter_CanProduce ...True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Runemelter_CanProduce ...False");
		return FALSE;
	};
};

func string mob_runemelter_getcantstring()
{
	printdebugmobsi("MOB_Runemelter_GetCantString");
	if(Npc_GetTalentSkill(self,NPC_TALENT_THAUMATURGY) < 1)
	{
		printdebugmobsi("MOB_Runemelter_GetCantString ...no Talent");
		return _STR_MESSAGE_MOBSI_RUNE_TAL;
	}
	else if(Npc_HasItems(self,itmi_pliers) < 1)
	{
		printdebugmobsi("MOB_Runemelter_GetCantString... no Tool");
		return _STR_MESSAGE_MOBSI_RUNE_TOOL;
	}
	else if(hero.attribute[ATR_MANA] < MANA_RUNE)
	{
		printdebugmobsi("MOB_Runemelter_GetCantString no Mana");
		return _STR_MESSAGE_MOBSI_RUNE_MANA;
	}
	else
	{
		printdebugmobsi("MOB_Runemelter_GetCantString no Material");
		return _STR_MESSAGE_MOBSI_RUNEMELTER_MAT;
	};
};

func int mob_runemelter_condition()
{
	printdebugmobsi("MOB_Runemelter_CONDITION");
	self.aivar[33] = AIV_AM_RUNEMELTER;
	if(Npc_IsPlayer(self))
	{
		if(mob_runemelter_canproduce())
		{
			printdebugmobsi("MOB_Runemelter_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_runemelter_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_Runemelter_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_Runemelter_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_runemelter_s1()
{
	printdebugmobsi("MOB_RUNEMELTER_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_RUNEMELTER;
		ai_createiteminslot(self,"ZS_RIGHTHAND",4692);
		AI_ProcessInfos(self);
	};
};


instance MOB_RUNEMELTER_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_runemelter_hasbasics;
	information = mob_runemelter_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func void mob_runemelter_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_UseMob(self,SCEMENAME_RUNEMELTER,-1);
};

func void mob_runemelter_autoexit()
{
	printdebugmobsi("MOB_RUNEMELTER_AutoExit");
	if(!mob_runemelter_canproduce())
	{
		mob_runemelter_exit_info();
	};
};


instance MOB_RUNEMELTER_RUNE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemelter_canproducerune;
	information = mob_produce_rune;
	important = 0;
	permanent = 1;
	description = b_buildrunemelterstring(NAME_BLANKRUNE,AMNT_RUNE,NAME_NUGGET);
};


func void mob_produce_rune()
{
	b_produceitem(1,4637,NAME_BLANKRUNE,AMNT_RUNE,4470);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - MANA_RUNE;
	mob_runemelter_autoexit();
};


instance MOB_RUNEMELTER_BLOODRUNE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemelter_canproducebloodrune;
	information = mob_produce_bloodrune;
	important = 0;
	permanent = 1;
	description = b_buildrunemelterstring(NAME_BLANKBLOODRUNE,AMNT_BLOODRUNE,NAME_BLOODNUGGET);
};


func void mob_produce_bloodrune()
{
	b_produceitem(1,4638,NAME_BLANKBLOODRUNE,AMNT_BLOODRUNE,4471);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - MANA_BLOODRUNE;
	mob_runemelter_autoexit();
};


instance MOB_RUNEMELTER_DARKRUNE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_runemelter_canproducedarkrune;
	information = mob_produce_darkrune;
	important = 0;
	permanent = 1;
	description = b_buildrunemelterstring(NAME_BLANKDARKRUNE,AMNT_DARKRUNE,NAME_DARKNUGGET);
};


func void mob_produce_darkrune()
{
	b_produceitem(1,4639,NAME_BLANKDARKRUNE,AMNT_DARKRUNE,4472);
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - MANA_DARKRUNE;
	mob_runemelter_autoexit();
};

