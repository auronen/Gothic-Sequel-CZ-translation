
func int mob_anvil_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_ANVIL) && Npc_HasItems(hero,itmw_sledgehammer))
	{
		printdebugmobsi("MOB_Anvil_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_swordblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowssword())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Swordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Swordblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_2hswordblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2hsword())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_blood2hswordblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_bloodhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCSWORD)
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_dark2hswordblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_darkhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HSwordblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HSwordblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_axeblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowsaxe())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Axeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Axeblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_2haxeblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2haxe())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_blood2haxeblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_bloodhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCAXE)
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_dark2haxeblade()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_darkhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HAxeblade...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HAxeblade...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_stump()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knowsblunt())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Stump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Stump...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_2hstump()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_hotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2hblunt())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_2HStump...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_blood2hstump()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_bloodhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCHAMMER)
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Blood2HStump...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce_dark2hstump()
{
	if(mob_anvil_hasbasics() && Npc_HasItems(hero,itmi_darkhotlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HStump...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce_Dark2HStump...FALSE");
		return FALSE;
	};
};

func int mob_anvil_canproduce()
{
	if(mob_anvil_canproduce_swordblade() || mob_anvil_canproduce_2hswordblade() || mob_anvil_canproduce_blood2hswordblade() || mob_anvil_canproduce_dark2hswordblade() || mob_anvil_canproduce_axeblade() || mob_anvil_canproduce_2haxeblade() || mob_anvil_canproduce_blood2haxeblade() || mob_anvil_canproduce_dark2haxeblade() || mob_anvil_canproduce_stump() || mob_anvil_canproduce_2hstump() || mob_anvil_canproduce_blood2hstump() || mob_anvil_canproduce_dark2hstump())
	{
		printdebugmobsi("MOB_Anvil_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Anvil_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_anvil_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_ANVIL_TAL;
	}
	else if(Npc_HasItems(self,itmw_sledgehammer) < 1)
	{
		return _STR_MESSAGE_MOBSI_ANVIL_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_ANVIL_MAT;
	};
};

func int mob_anvil_condition()
{
	self.aivar[33] = AIV_AM_ANVIL;
	if(Npc_IsPlayer(self))
	{
		if(mob_anvil_canproduce())
		{
			printdebugmobsi("MOB_ANVIL_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_anvil_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_ANVIL_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_ANVIL_CONDITION...TRUE Nsc");
		return TRUE;
	};
};

func void mob_anvil_s0()
{
	printdebugmobsi("MOB_ANVIL_S0");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
};

func void mob_anvil_s1()
{
	printdebugmobsi("MOB_ANVIL_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		ai_removeitemfromslot(self,"ZS_RIGHTHAND");
		ai_createiteminslot(self,"ZS_RIGHTHAND",4415);
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	}
	else
	{
		printdebugmobsi("MOB_ANVIL_S1 Nsc");
	};
};


instance MOB_ANVIL_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_anvil_hasbasics;
	information = mob_anvil_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_anvil_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_ANVIL,-1);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
};

func void mob_anvil_autoexit()
{
	printdebugmobsi("MOB_Anvil_AutoExit");
	if(!mob_anvil_canproduce())
	{
		mob_anvil_exit_info();
	};
};


instance MOB_ANVIL_SWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_swordblade;
	information = mob_anvil_swordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTIRON,NAME_ORE,NAME_SWORDBLADE);
};


func void mob_anvil_swordblade_info()
{
	b_produceitem(1,4481,NAME_SWORDBLADE,1,4477);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_2hswordblade;
	information = mob_anvil_2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_ORE,NAME_2HSWORDBLADE);
};


func void mob_anvil_2hswordblade_info()
{
	b_produceitem(1,4484,NAME_2HSWORDBLADE,1,4478);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_BLOOD2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_blood2hswordblade;
	information = mob_anvil_blood2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_BLOODORE,NAME_2HSWORDBLADE);
};


func void mob_anvil_blood2hswordblade_info()
{
	b_produceitem(1,4487,NAME_2HSWORDBLADE,1,4479);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_DARK2HSWORDBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_dark2hswordblade;
	information = mob_anvil_dark2hswordblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_DARKORE,NAME_2HSWORDBLADE);
};


func void mob_anvil_dark2hswordblade_info()
{
	b_produceitem(1,4490,NAME_2HSWORDBLADE,1,4480);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_AXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_axeblade;
	information = mob_anvil_axeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTIRON,NAME_ORE,NAME_AXEBLADE);
};


func void mob_anvil_axeblade_info()
{
	b_produceitem(1,4482,NAME_AXEBLADE,1,4477);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_MOB_ANVIL_AUTOEXIT(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_2haxeblade;
	information = mob_anvil_2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_ORE,NAME_2HAXEBLADE);
};


func void mob_anvil_2haxeblade_info()
{
	b_produceitem(1,4485,NAME_2HAXEBLADE,1,4478);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_BLOOD2HAXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_blood2haxeblade;
	information = mob_anvil_blood2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_BLOODORE,NAME_2HAXEBLADE);
};


func void mob_anvil_blood2haxeblade_info()
{
	b_produceitem(1,4488,NAME_2HAXEBLADE,1,4479);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_DARK2HAXEBLADE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_dark2haxeblade;
	information = mob_anvil_dark2haxeblade_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_DARKORE,NAME_2HAXEBLADE);
};


func void mob_anvil_dark2haxeblade_info()
{
	b_produceitem(1,4491,NAME_2HAXEBLADE,1,4480);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_STUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_stump;
	information = mob_anvil_stump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTIRON,NAME_ORE,NAME_STUMP);
};


func void mob_anvil_stump_info()
{
	b_produceitem(1,4483,NAME_STUMP,1,4477);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_2hstump;
	information = mob_anvil_2hstump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_ORE,NAME_2HSTUMP);
};


func void mob_anvil_2hstump_info()
{
	b_produceitem(1,4486,NAME_2HSTUMP,1,4478);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_BLOOD2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_blood2hstump;
	information = mob_anvil_blood2hstump_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_BLOODORE,NAME_2HSTUMP);
};


func void mob_anvil_blood2hstump_info()
{
	b_produceitem(1,4489,NAME_2HSTUMP,1,4479);
	mob_anvil_autoexit();
};


instance MOB_ANVIL_DARK2HSTUMP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_anvil_canproduce_dark2hstump;
	information = mob_anvil_dark2hstump_info;
	important = 0;
	permanent = 1;
	description = b_buildanvilstring(NAME_HOTLONGIRON,NAME_DARKORE,NAME_2HSTUMP);
};


func void mob_anvil_dark2hstump_info()
{
	b_produceitem(1,4492,NAME_2HSTUMP,1,4480);
	mob_anvil_autoexit();
};

