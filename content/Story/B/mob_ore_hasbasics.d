
func int mob_ore_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_ORE) && Npc_HasItems(hero,itmw_pickaxe))
	{
		printdebugmobsi("MOB_Ore_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Ore_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_ore_canproduce_1()
{
	if(mob_ore_hasbasics() && mob_ore_isoreavailable(1))
	{
		printdebugmobsi("MOB_Ore_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Ore_CanProduce_1...FALSE");
		return FALSE;
	};
};

func int mob_ore_canproduce_5()
{
	if(mob_ore_hasbasics() && mob_ore_isoreavailable(5))
	{
		printdebugmobsi("MOB_Ore_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Ore_CanProduce_5...FALSE");
		return FALSE;
	};
};

func int mob_ore_canproduce_10()
{
	if(mob_ore_hasbasics() && mob_ore_isoreavailable(10))
	{
		printdebugmobsi("MOB_Ore_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Ore_CanProduce_10...FALSE");
		return FALSE;
	};
};

func int mob_ore_canproduce()
{
	if(mob_ore_canproduce_1() || mob_ore_canproduce_5() || mob_ore_canproduce_10())
	{
		printdebugmobsi("MOB_Ore_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Ore_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_ore_getcantstring()
{
	if(Npc_HasItems(self,itmw_pickaxe) < 1)
	{
		return _STR_MESSAGE_MOBSI_ORE_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_ORE_MAT;
	};
};

func int mob_ore_condition()
{
	self.aivar[33] = AIV_AM_ORE;
	if(Npc_IsPlayer(self))
	{
		if(mob_ore_canproduce())
		{
			printdebugmobsi("MOB_ORE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_ore_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_ORE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else if(mob_ore_isoreavailable(1))
	{
		printdebugmobsi("MOB_ORE_CONDITION...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_ORE_CONDITION...FALSE");
		return FALSE;
	};
};

func void mob_ore_s0()
{
	printdebugmobsi("MOB_ORE_S0");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_ore_s1()
{
	var C_Npc weapon;
	printdebugmobsi("MOB_ORE_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		weapon = Npc_GetEquippedMeleeWeapon(self);
		if((Hlp_GetInstanceID(weapon) == itmw_pickaxe) && (Npc_HasItems(self,itmw_pickaxe) == 1))
		{
			AI_UnequipWeapons(self);
		};
		ai_removeitemfromslot(self,"ZS_LEFTHAND");
		ai_createiteminslot(self,"ZS_LEFTHAND",4413);
		AI_ProcessInfos(self);
	}
	else
	{
		ai_createiteminslot(self,"ZS_LEFTHAND",4413);
	};
};


instance MOB_ORE_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_ore_hasbasics;
	information = mob_ore_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_ore_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_ORE,-1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_ore_autoexit()
{
	printdebugmobsi("MOB_Ore_AutoExit");
	if(!mob_ore_canproduce())
	{
		mob_ore_exit_info();
	};
};


instance MOB_ORE_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_ore_canproduce_1;
	information = mob_ore_1_info;
	important = FALSE;
	permanent = TRUE;
	description = "ein wenig Erz schürfen";
};


func void mob_ore_1_info()
{
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	b_produceitem(Hlp_Random(3) + 1,4470,NAME_NUGGET,0,0);
	mob_ore_autoexit();
};


instance MOB_ORE_5(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_ore_canproduce_5;
	information = mob_ore_5_info;
	important = FALSE;
	permanent = TRUE;
	description = "etwas mehr Erz schürfen";
};


func void mob_ore_5_info()
{
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	b_produceitem(Hlp_Random(11) + 5,4470,NAME_NUGGET,0,0);
	mob_ore_autoexit();
};


instance MOB_ORE_10(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_ore_canproduce_10;
	information = mob_ore_10_info;
	important = FALSE;
	permanent = TRUE;
	description = "richtig viel Erz schürfen";
};


func void mob_ore_10_info()
{
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	AI_PlayAni(self,"T_ORE_RANDOM_1");
	b_produceitem(Hlp_Random(21) + 10,4470,NAME_NUGGET,0,0);
	mob_ore_autoexit();
};

