
func int mob_melter_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_MELTER) && Npc_HasItems(hero,itmi_pliers))
	{
		printdebugmobsi("MOB_Melter_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_melter_canproduce_rawiron()
{
	if(mob_melter_hasbasics() && (Npc_GetTalentSkill(self,NPC_TALENT_SMITH) >= 1) && (Npc_HasItems(self,itmi_orenugget) >= COST_RAWIRON))
	{
		printdebugmobsi("MOB_Melter_CanProduce_RawIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_CanProduce_RawIron...FALSE");
		return FALSE;
	};
};

func int mob_melter_canproduce_rawlongiron()
{
	if(mob_melter_hasbasics() && (Npc_GetTalentSkill(self,NPC_TALENT_SMITH) >= 1) && (Npc_HasItems(self,itmi_orenugget) >= COST_RAWLONGIRON) && b_knows2hweapon())
	{
		printdebugmobsi("MOB_Melter_CanProduce_RawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_CanProduce_RawLongIron...FALSE");
		return FALSE;
	};
};

func int mob_melter_canproduce_bloodrawlongiron()
{
	if(mob_melter_hasbasics() && (Npc_GetTalentSkill(self,NPC_TALENT_SMITH) >= 2) && (Npc_HasItems(self,itmi_bloodorenugget) >= COST_RAWLONGIRON) && b_knowsorcweapon())
	{
		printdebugmobsi("MOB_Melter_CanProduce_BloodRawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_CanProduce_BloodRawLongIron...FALSE");
		return FALSE;
	};
};

func int mob_melter_canproduce_darkrawlongiron()
{
	if(mob_melter_hasbasics() && (Npc_GetTalentSkill(self,NPC_TALENT_SMITH) >= 3) && (Npc_HasItems(self,itmi_darkorenugget) >= COST_RAWLONGIRON) && b_knowsdemonweapon())
	{
		printdebugmobsi("MOB_Melter_CanProduce_DarkRawLongIron...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_CanProduce_DarkRawLongIron...FALSE");
		return FALSE;
	};
};

func int mob_melter_canproduce()
{
	if(mob_melter_canproduce_rawiron() || mob_melter_canproduce_rawlongiron() || mob_melter_canproduce_bloodrawlongiron() || mob_melter_canproduce_darkrawlongiron())
	{
		printdebugmobsi("MOB_Melter_CanProduce...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Melter_CanProduce...FALSE");
		return FALSE;
	};
};

func string mob_melter_getcantstring()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_SMITH) < 1)
	{
		return _STR_MESSAGE_MOBSI_MELTER_TAL;
	}
	else if(Npc_HasItems(self,itmi_pliers) < 1)
	{
		return _STR_MESSAGE_MOBSI_MELTER_TOOL;
	}
	else
	{
		return _STR_MESSAGE_MOBSI_MELTER_MAT;
	};
};

func int mob_melter_condition()
{
	self.aivar[33] = AIV_AM_MELTER;
	if(Npc_IsPlayer(self))
	{
		if(mob_melter_canproduce())
		{
			printdebugmobsi("MOB_MELTER_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_melter_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_MELTER_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_MELTER_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_melter_s0()
{
	printdebugmobsi("MOB_MELTER_S0");
};

func void mob_melter_s1()
{
	printdebugmobsi("MOB_MELTER_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		ai_createiteminslot(self,"ZS_LEFTHAND",4692);
		AI_ProcessInfos(self);
	};
};


instance MOB_MELTER_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_melter_hasbasics;
	information = mob_melter_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_melter_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(self,SCEMENAME_MELTER,-1);
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_melter_autoexit()
{
	printdebugmobsi("MOB_Melter_AutoExit");
	if(!mob_melter_canproduce())
	{
		mob_melter_exit_info();
	};
};


instance MOB_MELTER_RAWIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_melter_canproduce_rawiron;
	information = mob_melter_rawiron_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildmelterstring(COST_RAWIRON,NAME_NUGGET,NAME_RAWIRON);
};


func void mob_melter_rawiron_info()
{
	b_produceitem(1,4473,NAME_NUGGET,COST_RAWIRON,4470);
	mob_melter_autoexit();
};


instance MOB_MELTER_RAWLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_melter_canproduce_rawlongiron;
	information = mob_melter_rawlongiron_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildmelterstring(COST_RAWLONGIRON,NAME_NUGGET,NAME_RAWLONGIRON);
};


func void mob_melter_rawlongiron_info()
{
	b_produceitem(1,4474,NAME_NUGGET,COST_RAWLONGIRON,4470);
	mob_melter_autoexit();
};


instance MOB_MELTER_BLOODRAWLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_melter_canproduce_bloodrawlongiron;
	information = mob_melter_bloodrawlongiron_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildmelterstring(COST_RAWLONGIRON,NAME_BLOODNUGGET,NAME_RAWLONGIRON);
};


func void mob_melter_bloodrawlongiron_info()
{
	b_produceitem(1,4475,NAME_BLOODNUGGET,COST_RAWLONGIRON,4471);
	mob_melter_autoexit();
};


instance MOB_MELTER_DARKRAWLONGIRON(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_melter_canproduce_darkrawlongiron;
	information = mob_melter_darkrawlongiron_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildmelterstring(COST_RAWLONGIRON,NAME_DARKNUGGET,NAME_RAWLONGIRON);
};


func void mob_melter_darkrawlongiron_info()
{
	b_produceitem(1,4476,NAME_NUGGET,COST_RAWLONGIRON,4472);
	mob_melter_autoexit();
};

