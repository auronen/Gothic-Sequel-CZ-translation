
const int AMNT_FLETCHERWOOD = 2;

func int mob_fletcher_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_FLETCHER) && ((Npc_HasItems(hero,itmi_fletcherknife) >= 1) && (Npc_GetTalentSkill(self,NPC_TALENT_BOWMAKER) >= 1)))
	{
		printdebugmobsi("MOB_fletcher_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_1()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= AMNT_FLETCHERWOOD))
	{
		printdebugmobsi("MOB_fletcher_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_1...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_5()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= (AMNT_FLETCHERWOOD * 5)))
	{
		printdebugmobsi("MOB_fletcher_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_5...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_10()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= (AMNT_FLETCHERWOOD * 10)))
	{
		printdebugmobsi("MOB_fletcher_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_10...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_1bolts()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= AMNT_FLETCHERWOOD) && KNOWS_RECIPECROSSBOW)
	{
		printdebugmobsi("MOB_fletcher_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_1...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_5bolts()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= (AMNT_FLETCHERWOOD * 5)) && KNOWS_RECIPECROSSBOW)
	{
		printdebugmobsi("MOB_fletcher_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_5...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce_10bolts()
{
	if(mob_fletcher_hasbasics() && (Npc_HasItems(hero,itmi_fletcherwood) >= (AMNT_FLETCHERWOOD * 10)) && KNOWS_RECIPECROSSBOW)
	{
		printdebugmobsi("MOB_fletcher_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce_10...FALSE");
		return FALSE;
	};
};

func int mob_fletcher_canproduce()
{
	if(mob_fletcher_canproduce_1() || mob_fletcher_canproduce_5() || mob_fletcher_canproduce_10())
	{
		printdebugmobsi("MOB_fletcher_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_fletcher_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_fletcher_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_BOWMAKER) < 1)
	{
		return _STR_MESSAGE_MOBSI_FLETCHER_TAL;
	}
	else if(Npc_HasItems(self,itmi_fletcherknife) < 1)
	{
		return _STR_MESSAGE_MOBSI_FLETCHER_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_FLETCHER_MAT;
	};
};

func int mob_fletcher_condition()
{
	self.aivar[33] = AIV_AM_FLETCHER;
	if(Npc_IsPlayer(self))
	{
		if(mob_fletcher_canproduce())
		{
			printdebugmobsi("MOB_fletcher_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_fletcher_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_fletcher_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		return TRUE;
	};
};

func void mob_fletcher_s0()
{
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	printdebugmobsi("MOB_fletcher_S0");
};

func void mob_fletcher_s1()
{
	var C_Npc weapon;
	printdebugmobsi("MOB_fletcher_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		weapon = Npc_GetEquippedMeleeWeapon(self);
		if((Hlp_GetInstanceID(weapon) == itmi_fletcherknife) && (Npc_HasItems(self,itmi_fletcherknife) == 1))
		{
			AI_UnequipWeapons(self);
		};
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		AI_ProcessInfos(self);
	};
};


instance MOB_FLETCHER_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_fletcher_hasbasics;
	information = mob_fletcher_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_fletcher_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,"fletcher",-1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGTHAND");
};

func void mob_fletcher_autoexit()
{
	printdebugmobsi("MOB_fletcher_AutoExit");
	if(!mob_fletcher_canproduce())
	{
		mob_fletcher_exit_info();
	};
};


instance MOB_FLETCHER_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_1;
	information = mob_fletcher_1_info;
	important = FALSE;
	permanent = TRUE;
	description = "1 Pfeil herstellen";
};


func void mob_fletcher_1_info()
{
	b_produceitem(1,4875,NAME_ARROW,AMNT_FLETCHERWOOD,4677);
	mob_fletcher_autoexit();
};


instance MOB_FLETCHER_5(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_5;
	information = mob_fletcher_5_info;
	important = FALSE;
	permanent = TRUE;
	description = "5 Pfeile herstellen";
};


func void mob_fletcher_5_info()
{
	b_produceitem(5,4875,NAME_ARROW,AMNT_FLETCHERWOOD * 5,4677);
	mob_fletcher_autoexit();
};


instance MOB_FLETCHER_10(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_10;
	information = mob_fletcher_10_info;
	important = FALSE;
	permanent = TRUE;
	description = "10 Pfeile herstellen";
};


func void mob_fletcher_10_info()
{
	b_produceitem(10,4875,NAME_ARROW,AMNT_FLETCHERWOOD * 10,4677);
	mob_fletcher_autoexit();
};


instance MOB_FLETCHER_1BOLTS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_1bolts;
	information = mob_fletcher_1bolts_info;
	important = FALSE;
	permanent = TRUE;
	description = "1 Bolzen herstellen";
};


func void mob_fletcher_1bolts_info()
{
	b_produceitem(1,4876,NAME_BOLT,AMNT_FLETCHERWOOD,4677);
	mob_fletcher_autoexit();
};


instance MOB_FLETCHER_5BOLTS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_5bolts;
	information = mob_fletcher_5bolts_info;
	important = FALSE;
	permanent = TRUE;
	description = "5 Bolzen herstellen";
};


func void mob_fletcher_5bolts_info()
{
	b_produceitem(5,4876,NAME_BOLT,AMNT_FLETCHERWOOD * 5,4677);
	mob_fletcher_autoexit();
};


instance MOB_FLETCHER_10BOLTS(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fletcher_canproduce_10bolts;
	information = mob_fletcher_10bolts_info;
	important = FALSE;
	permanent = TRUE;
	description = "10 Bolzen herstellen";
};


func void mob_fletcher_10bolts_info()
{
	b_produceitem(10,4876,NAME_BOLT,AMNT_FLETCHERWOOD * 10,4677);
	mob_fletcher_autoexit();
};

