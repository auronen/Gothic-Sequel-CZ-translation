
func int mob_wood_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_WOOD) && Npc_HasItems(hero,itmi_fletcherknife))
	{
		printdebugmobsi("MOB_WOOD_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_wood_canproduce_1()
{
	if(mob_wood_hasbasics() && mob_wood_iswoodavailable(1))
	{
		printdebugmobsi("MOB_WOOD_CanProduce_1...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_CanProduce_1...FALSE");
		return FALSE;
	};
};

func int mob_wood_canproduce_5()
{
	if(mob_wood_hasbasics() && mob_wood_iswoodavailable(5))
	{
		printdebugmobsi("MOB_WOOD_CanProduce_5...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_CanProduce_5...FALSE");
		return FALSE;
	};
};

func int mob_wood_canproduce_10()
{
	if(mob_wood_hasbasics() && mob_wood_iswoodavailable(10))
	{
		printdebugmobsi("MOB_WOOD_CanProduce_10...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_CanProduce_10...FALSE");
		return FALSE;
	};
};

func int mob_wood_canproduce()
{
	if(mob_wood_canproduce_1() || mob_wood_canproduce_5() || mob_wood_canproduce_10())
	{
		printdebugmobsi("MOB_WOOD_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_wood_getcantstring()
{
	if(Npc_HasItems(self,itmi_fletcherknife) < 1)
	{
		return _STR_MESSAGE_MOBSI_WOOD_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_WOOD_MAT;
	};
};

func int mob_wood_condition()
{
	self.aivar[33] = AIV_AM_WOOD;
	if(Npc_IsPlayer(self))
	{
		if(mob_wood_canproduce())
		{
			printdebugmobsi("MOB_WOOD_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_wood_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_WOOD_CONDITION...FALSE");
			return FALSE;
		};
	}
	else if(mob_wood_iswoodavailable(1))
	{
		printdebugmobsi("MOB_WOOD_CONDITION...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WOOD_CONDITION...FALSE");
		return FALSE;
	};
};

func void mob_wood_s0()
{
	printdebugmobsi("MOB_WOOD_S0");
};

func void mob_wood_s1()
{
	var C_Npc weapon;
	printdebugmobsi("MOB_WOOD_S1");
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
		ai_createiteminslot(self,"ZS_LEFTHAND",4678);
		AI_ProcessInfos(self);
	};
};


instance MOB_WOOD_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_wood_hasbasics;
	information = mob_wood_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_wood_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_WOOD,-1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_wood_autoexit()
{
	printdebugmobsi("MOB_WOOD_AutoExit");
	if(!mob_wood_canproduce())
	{
		mob_wood_exit_info();
	};
};


instance MOB_WOOD_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_wood_canproduce_1;
	information = mob_wood_1_info;
	important = FALSE;
	permanent = TRUE;
	description = "1 Holz schneiden";
};


func void mob_wood_1_info()
{
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	b_produceitem(1,4677,itmi_fletcherwood.name,0,0);
	mob_wood_autoexit();
};


instance MOB_WOOD_5(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_wood_canproduce_5;
	information = mob_wood_5_info;
	important = FALSE;
	permanent = TRUE;
	description = "5 Holz schneiden";
};


func void mob_wood_5_info()
{
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	b_produceitem(5,4677,itmi_fletcherwood.name,0,0);
	mob_wood_autoexit();
};


instance MOB_WOOD_10(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_wood_canproduce_10;
	information = mob_wood_10_info;
	important = FALSE;
	permanent = TRUE;
	description = "10 Holz schneiden";
};


func void mob_wood_10_info()
{
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	AI_PlayAni(self,"T_WOOD_RANDOM_1");
	b_produceitem(10,4677,itmi_fletcherwood.name,0,0);
	mob_wood_autoexit();
};

