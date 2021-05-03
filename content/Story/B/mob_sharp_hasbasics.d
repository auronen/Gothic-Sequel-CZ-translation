
func int mob_sharp_hasbasics()
{
	if(hero.aivar[33] == AIV_AM_SHARP)
	{
		printdebugmobsi("MOB_Sharp_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_shortsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_swordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_SHORTSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Shortsword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Shortsword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_longsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_swordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_LONGSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Longsword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Longsword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_broadsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_swordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_BROADSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Broadsword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Broadsword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_bastardsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_swordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_BASTARDSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Bastardsword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Bastardsword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_2hsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_2hswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_2HSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_2HSword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_2HSword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_orcsword()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_blood2hswordblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCSWORD)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcSword...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcSword...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_hatchet()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_axeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_HATCHET)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Hatchet...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Hatchet...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_battleaxe()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_axeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_BATTLEAXE)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Battleaxe...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Battleaxe...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_doublebladedaxe()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_DOUBLEBLADEDAXE)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_DoublebladedAxe...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_DoublebladedAxe...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_berserkaxe()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_BERSERKAXE)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_BerserkAxe...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_BerserkAxe...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_orcaxe()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_blood2haxeblade) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCAXE)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcAxe...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcAxe...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_ironclub()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_stump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_IRONCLUB)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_IronClub...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_IronClub...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_mace()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_stump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_MACE)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Mace...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Mace...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_morningstar()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_stump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_MORNINGSTAR)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Morningstar...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Morningstar...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_warhammer()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_2hstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && KNOWS_WARHAMMER)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Warhammer...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_Warhammer...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce_orchammer()
{
	if(mob_sharp_hasbasics() && Npc_HasItems(hero,itmi_blood2hstump) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && KNOWS_ORCHAMMER)
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcHammer...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce_OrcHammer...FALSE");
		return FALSE;
	};
};

func int mob_sharp_canproduce()
{
	if(mob_sharp_canproduce_shortsword() || mob_sharp_canproduce_longsword() || mob_sharp_canproduce_broadsword() || mob_sharp_canproduce_bastardsword() || mob_sharp_canproduce_2hsword() || mob_sharp_canproduce_orcsword() || mob_sharp_canproduce_hatchet() || mob_sharp_canproduce_battleaxe() || mob_sharp_canproduce_doublebladedaxe() || mob_sharp_canproduce_berserkaxe() || mob_sharp_canproduce_orcaxe() || mob_sharp_canproduce_ironclub() || mob_sharp_canproduce_mace() || mob_sharp_canproduce_morningstar() || mob_sharp_canproduce_warhammer() || mob_sharp_canproduce_orchammer())
	{
		printdebugmobsi("MOB_Sharp_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Sharp_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_sharp_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_SHARP_TAL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_SHARP_MAT;
	};
};

func int mob_sharp_condition()
{
	self.aivar[33] = AIV_AM_SHARP;
	if(Npc_IsPlayer(self))
	{
		if(mob_sharp_canproduce())
		{
			printdebugmobsi("MOB_SHARP_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_sharp_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_SHARP_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_SHARP_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_sharp_s0()
{
	printdebugmobsi("MOB_SHARP_S0");
};

func void mob_sharp_s1()
{
	printdebugmobsi("MOB_SHARP_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	};
};


instance MOB_SHARP_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_sharp_hasbasics;
	information = mob_sharp_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_sharp_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_SHARP,-1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_sharp_autoexit()
{
	printdebugmobsi("MOB_Sharp_AutoExit");
	if(!mob_sharp_canproduce())
	{
		mob_sharp_exit_info();
	};
};


instance MOB_SHARP_SHORTSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_shortsword;
	information = mob_sharp_shortsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_SWORDBLADE,NAME_ORE,NAME_SHORTSWORD);
};


func void mob_sharp_shortsword_info()
{
	b_produceitem(1,4394,NAME_SHORTSWORD,1,4493);
	mob_sharp_autoexit();
};


instance MOB_SHARP_LONGSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_longsword;
	information = mob_sharp_longsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_SWORDBLADE,NAME_ORE,NAME_LONGSWORD);
};


func void mob_sharp_longsword_info()
{
	b_produceitem(1,4395,NAME_LONGSWORD,1,4493);
	mob_sharp_autoexit();
};


instance MOB_SHARP_BROADSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_broadsword;
	information = mob_sharp_broadsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_SWORDBLADE,NAME_ORE,NAME_BROADSWORD);
};


func void mob_sharp_broadsword_info()
{
	b_produceitem(1,4396,NAME_BROADSWORD,1,4493);
	mob_sharp_autoexit();
};


instance MOB_SHARP_BASTARDSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_bastardsword;
	information = mob_sharp_bastardsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_SWORDBLADE,NAME_ORE,NAME_BASTARDSWORD);
};


func void mob_sharp_bastardsword_info()
{
	b_produceitem(1,4397,NAME_BASTARDSWORD,1,4493);
	mob_sharp_autoexit();
};


instance MOB_SHARP_2HSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_2hsword;
	information = mob_sharp_2hsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HSWORDBLADE,NAME_ORE,NAME_2HSWORD);
};


func void mob_sharp_2hsword_info()
{
	b_produceitem(1,4398,NAME_2HSWORD,1,4496);
	mob_sharp_autoexit();
};


instance MOB_SHARP_ORCSWORD(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_orcsword;
	information = mob_sharp_orcsword_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HSWORDBLADE,NAME_BLOODORE,NAME_ORCSWORD);
};


func void mob_sharp_orcsword_info()
{
	b_produceitem(1,4399,NAME_ORCSWORD,1,4499);
	mob_sharp_autoexit();
};


instance MOB_SHARP_HATCHET(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_hatchet;
	information = mob_sharp_hatchet_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_AXEBLADE,NAME_ORE,NAME_HATCHET);
};


func void mob_sharp_hatchet_info()
{
	b_produceitem(1,4400,NAME_HATCHET,1,4494);
	mob_sharp_autoexit();
};


instance MOB_SHARP_BATTLEAXE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_battleaxe;
	information = mob_sharp_battleaxe_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_AXEBLADE,NAME_ORE,NAME_BATTLEAXE);
};


func void mob_sharp_battleaxe_info()
{
	b_produceitem(1,4401,NAME_BATTLEAXE,1,4494);
	mob_sharp_autoexit();
};


instance MOB_SHARP_DOUBLEBLADEDAXE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_doublebladedaxe;
	information = mob_sharp_doublebladedaxe_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HAXEBLADE,NAME_ORE,NAME_DOUBLEBLADEDAXE);
};


func void mob_sharp_doublebladedaxe_info()
{
	b_produceitem(1,4402,NAME_DOUBLEBLADEDAXE,1,4497);
	mob_sharp_autoexit();
};


instance MOB_SHARP_BERSERKAXE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_berserkaxe;
	information = mob_sharp_berserkaxe_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HAXEBLADE,NAME_ORE,NAME_BERSERKAXE);
};


func void mob_sharp_berserkaxe_info()
{
	b_produceitem(1,4403,NAME_BERSERKAXE,1,4497);
	mob_sharp_autoexit();
};


instance MOB_SHARP_ORCAXE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_orcaxe;
	information = mob_sharp_orcaxe_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HAXEBLADE,NAME_BLOODORE,NAME_ORCAXE);
};


func void mob_sharp_orcaxe_info()
{
	b_produceitem(1,4404,NAME_ORCAXE,1,4500);
	mob_sharp_autoexit();
};


instance MOB_SHARP_IRONCLUB(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_ironclub;
	information = mob_sharp_ironclub_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_STUMP,NAME_ORE,NAME_IRONCLUB);
};


func void mob_sharp_ironclub_info()
{
	b_produceitem(1,4405,NAME_IRONCLUB,1,4495);
	mob_sharp_autoexit();
};


instance MOB_SHARP_MACE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_mace;
	information = mob_sharp_mace_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_STUMP,NAME_ORE,NAME_MACE);
};


func void mob_sharp_mace_info()
{
	b_produceitem(1,4406,NAME_MACE,1,4495);
	mob_sharp_autoexit();
};


instance MOB_SHARP_MORNINGSTAR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_morningstar;
	information = mob_sharp_morningstar_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_STUMP,NAME_ORE,NAME_MORNINGSTAR);
};


func void mob_sharp_morningstar_info()
{
	b_produceitem(1,4407,NAME_MORNINGSTAR,1,4495);
	mob_sharp_autoexit();
};


instance MOB_SHARP_WARHAMMER(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_warhammer;
	information = mob_sharp_warhammer_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HSTUMP,NAME_ORE,NAME_WARHAMMER);
};


func void mob_sharp_warhammer_info()
{
	b_produceitem(1,4408,NAME_WARHAMMER,1,4498);
	mob_sharp_autoexit();
};


instance MOB_SHARP_ORCHAMMER(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_sharp_canproduce_orchammer;
	information = mob_sharp_orchammer_info;
	important = 0;
	permanent = 1;
	description = b_buildsharpstring(NAME_2HSTUMP,NAME_BLOODORE,NAME_ORCHAMMER);
};


func void mob_sharp_orchammer_info()
{
	b_produceitem(1,4409,NAME_ORCHAMMER,1,4501);
	mob_sharp_autoexit();
};

