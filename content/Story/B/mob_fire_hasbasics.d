
func int mob_fire_hasbasics()
{
	if(hero.aivar[33] == AIV_AM_FIRE)
	{
		printdebugmobsi("MOB_Fire_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_fire_canproduce_hotiron()
{
	if(mob_fire_hasbasics() && Npc_HasItems(hero,itmi_rawiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1))
	{
		printdebugmobsi("MOB_Fire_CanProduce_HotIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_CanProduce_HotIron...FALSE");
		return FALSE;
	};
};

func int mob_fire_canproduce_hotlongiron()
{
	if(mob_fire_hasbasics() && Npc_HasItems(hero,itmi_rawlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && b_knows2hweapon())
	{
		printdebugmobsi("MOB_Fire_CanProduce_HotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_CanProduce_HotLongIron...FALSE");
		return FALSE;
	};
};

func int mob_fire_canproduce_bloodhotlongiron()
{
	if(mob_fire_hasbasics() && Npc_HasItems(hero,itmi_bloodrawlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 2) && b_knowsorcweapon())
	{
		printdebugmobsi("MOB_Fire_CanProduce_BloodHotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_CanProduce_BloodHotLongIron...FALSE");
		return FALSE;
	};
};

func int mob_fire_canproduce_darkhotlongiron()
{
	if(mob_fire_hasbasics() && Npc_HasItems(hero,itmi_darkrawlongiron) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 3) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Fire_CanProduce_DarkHotLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_CanProduce_DarkHotLongIron...FALSE");
		return FALSE;
	};
};

func int mob_fire_canproduce()
{
	if(mob_fire_canproduce_hotiron() || mob_fire_canproduce_hotlongiron() || mob_fire_canproduce_bloodhotlongiron() || mob_fire_canproduce_darkhotlongiron())
	{
		printdebugmobsi("MOB_Fire_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Fire_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_fire_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_FIRE_TAL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_FIRE_MAT;
	};
};

func int mob_fire_condition()
{
	self.aivar[33] = AIV_AM_FIRE;
	if(Npc_IsPlayer(self))
	{
		if(mob_fire_canproduce())
		{
			printdebugmobsi("MOB_FIRE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_fire_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_FIRE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_FIRE_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_fire_s0()
{
	printdebugmobsi("MOB_FIRE_S0");
};

func void mob_fire_s1()
{
	printdebugmobsi("MOB_FIRE_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	};
};


instance MOB_FIRE_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_fire_hasbasics;
	information = mob_fire_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_fire_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	AI_UseMob(self,SCEMENAME_FIRE,-1);
};

func void mob_fire_autoexit()
{
	printdebugmobsi("MOB_Fire_AutoExit");
	if(!mob_fire_canproduce())
	{
		mob_fire_exit_info();
	};
};


instance MOB_FIRE_HOTIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fire_canproduce_hotiron;
	information = mob_fire_hotiron_info;
	important = FALSE;
	permanent = TRUE;
	description = b_concatthreestrings(NAME_RAWIRON,NAME_ORE,NAME_SMITH_FIRE);
};


func void mob_fire_hotiron_info()
{
	b_produceitem(1,4477,NAME_RAWIRON,1,4473);
	mob_fire_autoexit();
};


instance MOB_FIRE_HOTLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fire_canproduce_hotlongiron;
	information = mob_fire_hotlongiron_info;
	important = 0;
	permanent = 1;
	description = b_concatthreestrings(NAME_RAWLONGIRON,NAME_ORE,NAME_SMITH_FIRE);
};


func void mob_fire_hotlongiron_info()
{
	b_produceitem(1,4478,NAME_RAWLONGIRON,1,4474);
	mob_fire_autoexit();
};


instance MOB_FIRE_BLOODHOTLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fire_canproduce_bloodhotlongiron;
	information = mob_fire_bloodhotlongiron_info;
	important = 0;
	permanent = 1;
	description = b_concatthreestrings(NAME_RAWLONGIRON,NAME_BLOODORE,NAME_SMITH_FIRE);
};


func void mob_fire_bloodhotlongiron_info()
{
	b_produceitem(1,4479,NAME_RAWLONGIRON,1,4475);
	mob_fire_autoexit();
};


instance MOB_FIRE_DARKHOTLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_fire_canproduce_darkhotlongiron;
	information = mob_fire_darkhotlongiron_info;
	important = 0;
	permanent = 1;
	description = b_concatthreestrings(NAME_RAWLONGIRON,NAME_DARKORE,NAME_SMITH_FIRE);
};


func void mob_fire_darkhotlongiron_info()
{
	b_produceitem(1,4480,NAME_RAWLONGIRON,1,4476);
	mob_fire_autoexit();
};

