
func int mob_waterpipe_hasbasics()
{
	if((hero.aivar[33] == AIV_AM_WATERPIPE) && (Npc_HasItems(hero,itpl_swampweed) >= 1))
	{
		printdebugmobsi("MOB_WATERPIPE_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_WATERPIPE_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_waterpipe_condition()
{
	self.aivar[33] = AIV_AM_WATERPIPE;
	if(Npc_IsPlayer(self))
	{
		if(mob_waterpipe_hasbasics())
		{
			printdebugmobsi("MOB_WATERPIPE_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(_STR_MESSAGE_MOBSI_WATERPIPE_MAT,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_WATERPIPE_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		return TRUE;
	};
};

func void mob_waterpipe_s0()
{
	printdebugmobsi("MOB_WATERPIPE_S0");
};

func void mob_waterpipe_s1()
{
	printdebugmobsi("MOB_WATERPIPE_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	};
};


instance MOB_WATERPIPE_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_waterpipe_hasbasics;
	information = mob_waterpipe_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_waterpipe_exit_info()
{
	var int int_randomizer;
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	int_randomizer = Hlp_Random(6);
	if(int_randomizer == 1)
	{
		AI_Wait(self,10);
		B_Say(self,NULL,"$WATERPIPEVISION1");
	};
	if(int_randomizer == 2)
	{
		AI_Wait(self,10);
		B_Say(self,NULL,"$WATERPIPEVISION2");
	};
	if(int_randomizer == 3)
	{
		AI_Wait(self,10);
		B_Say(self,NULL,"$WATERPIPEVISION3");
	};
	if(int_randomizer == 4)
	{
		AI_Wait(self,10);
		B_Say(self,NULL,"$WATERPIPEVISION4");
	};
	if(int_randomizer == 5)
	{
		AI_Wait(self,10);
		B_Say(self,NULL,"$WATERPIPEVISION5");
	};
	AI_UseMob(self,"WATERPIPE",-1);
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
};

func void mob_waterpipe_autoexit()
{
	printdebugmobsi("MOB_WATERPIPE_AutoExit");
	mob_waterpipe_exit_info();
};


instance MOB_WATERPIPE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_waterpipe_hasbasics;
	information = mob_waterpipe_info;
	important = TRUE;
	permanent = TRUE;
	description = "";
};


func void mob_waterpipe_info()
{
	if(c_npcisinvincible(hero))
	{
		Npc_RemoveInvItems(hero,itpl_swampweed,1);
		mob_waterpipe_autoexit();
	};
};

