
func int mob_cool_hasbasics()
{
	if(hero.aivar[33] == AIV_AM_COOL)
	{
		printdebugmobsi("MOB_Cool_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_swordblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hotswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowssword())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Swordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Swordblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_2hswordblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hot2hswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2hsword())
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_blood2hswordblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_bloodhot2hswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCSWORD)
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_dark2hswordblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_darkhot2hswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_axeblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hotaxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowsaxe())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Axeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Axeblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_2haxeblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hot2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2haxe())
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_blood2haxeblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_bloodhot2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCAXE)
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_dark2haxeblade()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_darkhot2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_stump()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hotstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowsblunt())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Stump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Stump...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_2hstump()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_hot2hstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2hblunt())
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_2HStump...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_blood2hstump()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_bloodhot2hstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCHAMMER)
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Blood2HStump...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce_dark2hstump()
{
	if(mob_cool_hasbasics() && Npc_HasItems(hero,itmi_darkhot2hstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce_Dark2HStump...FALSE");
		return FALSE;
	};
};

func int mob_cool_canproduce()
{
	if(mob_cool_canproduce_swordblade() || mob_cool_canproduce_2hswordblade() || mob_cool_canproduce_blood2hswordblade() || mob_cool_canproduce_dark2hswordblade() || mob_cool_canproduce_axeblade() || mob_cool_canproduce_2haxeblade() || mob_cool_canproduce_blood2haxeblade() || mob_cool_canproduce_dark2haxeblade() || mob_cool_canproduce_stump() || mob_cool_canproduce_2hstump() || mob_cool_canproduce_blood2hstump() || mob_cool_canproduce_dark2hstump())
	{
		printdebugmobsi("MOB_Cool_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cool_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_cool_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_COOL_TAL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_COOL_MAT;
	};
};

func int mob_cool_condition()
{
	self.aivar[33] = AIV_AM_COOL;
	if(Npc_IsPlayer(self))
	{
		if(mob_cool_canproduce())
		{
			printdebugmobsi("MOB_COOL_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_cool_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_COOL_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_COOL_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_cool_s0()
{
	printdebugmobsi("MOB_COOL_S0");
};

func void mob_cool_s1()
{
	printdebugmobsi("MOB_COOL_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	};
};


instance MOB_COOL_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_cool_hasbasics;
	information = mob_cool_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_cool_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	AI_UseMob(self,SCEMENAME_COOL,-1);
};

func void mob_cool_autoexit()
{
	printdebugmobsi("MOB_Cool_AutoExit");
	if(!mob_cool_canproduce())
	{
		mob_cool_exit_info();
	};
};


instance MOB_COOL_SWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_swordblade;
	information = mob_cool_swordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOTSWORDBLADE,NAME_ORE,NAME_SWORDBLADE);
};


func void mob_cool_swordblade_info()
{
	b_produceitem(1,4493,NAME_SWORDBLADE,1,4481);
	mob_cool_autoexit();
};


instance MOB_COOL_2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_2hswordblade;
	information = mob_cool_2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSWORDBLADE,NAME_ORE,NAME_2HSWORDBLADE);
};


func void mob_cool_2hswordblade_info()
{
	b_produceitem(1,4496,NAME_2HSWORDBLADE,1,4484);
	mob_cool_autoexit();
};


instance MOB_COOL_BLOOD2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_blood2hswordblade;
	information = mob_cool_blood2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSWORDBLADE,NAME_BLOODORE,NAME_2HSWORDBLADE);
};


func void mob_cool_blood2hswordblade_info()
{
	b_produceitem(1,4499,NAME_2HSWORDBLADE,1,4487);
	mob_cool_autoexit();
};


instance MOB_COOL_DARK2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_dark2hswordblade;
	information = mob_cool_dark2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSWORDBLADE,NAME_DARKORE,NAME_2HSWORDBLADE);
};


func void mob_cool_dark2hswordblade_info()
{
	b_produceitem(1,4502,NAME_2HSWORDBLADE,1,4490);
	mob_cool_autoexit();
};


instance MOB_COOL_AXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_axeblade;
	information = mob_cool_axeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOTAXEBLADE,NAME_ORE,NAME_AXEBLADE);
};


func void mob_cool_axeblade_info()
{
	b_produceitem(1,4494,NAME_AXEBLADE,1,4482);
	mob_cool_autoexit();
};


instance MOB_COOL_2HAXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_2haxeblade;
	information = mob_cool_2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HAXEBLADE,NAME_ORE,NAME_2HAXEBLADE);
};


func void mob_cool_2haxeblade_info()
{
	b_produceitem(1,4497,NAME_2HAXEBLADE,1,4485);
	mob_cool_autoexit();
};


instance MOB_COOL_BLOOD2HAXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_blood2haxeblade;
	information = mob_cool_blood2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HAXEBLADE,NAME_BLOODORE,NAME_2HAXEBLADE);
};


func void mob_cool_blood2haxeblade_info()
{
	b_produceitem(1,4500,NAME_2HAXEBLADE,1,4488);
	mob_cool_autoexit();
};


instance MOB_COOL_DARK2HAXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_dark2haxeblade;
	information = mob_cool_dark2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HAXEBLADE,NAME_DARKORE,NAME_2HAXEBLADE);
};


func void mob_cool_dark2haxeblade_info()
{
	b_produceitem(1,4503,NAME_2HAXEBLADE,1,4491);
	mob_cool_autoexit();
};


instance MOB_COOL_STUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_stump;
	information = mob_cool_stump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOTSTUMP,NAME_ORE,NAME_STUMP);
};


func void mob_cool_stump_info()
{
	b_produceitem(1,4495,NAME_STUMP,1,4483);
	mob_cool_autoexit();
};


instance MOB_COOL_2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_2hstump;
	information = mob_cool_2hstump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSTUMP,NAME_ORE,NAME_2HSTUMP);
};


func void mob_cool_2hstump_info()
{
	b_produceitem(1,4498,NAME_2HSTUMP,1,4486);
	mob_cool_autoexit();
};


instance MOB_COOL_BLOOD2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_blood2hstump;
	information = mob_cool_blood2hstump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSTUMP,NAME_BLOODORE,NAME_2HSTUMP);
};


func void mob_cool_blood2hstump_info()
{
	b_produceitem(1,4501,NAME_2HSTUMP,1,4489);
	mob_cool_autoexit();
};


instance MOB_COOL_DARK2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_cool_canproduce_dark2hstump;
	information = mob_cool_dark2hstump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildcoolstring(NAME_HOT2HSTUMP,NAME_DARKORE,NAME_2HSTUMP);
};


func void mob_cool_dark2hstump_info()
{
	b_produceitem(1,4504,NAME_2HSTUMP,1,4492);
	mob_cool_autoexit();
};

