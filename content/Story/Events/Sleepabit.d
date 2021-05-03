
func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self);
	self.aivar[24] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	PrintScreen("Du hast geschlafen und bist ausgeruht!",-1,-1,FONT_OLD_BIG,3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void sleepabit_s1()
{
	if(B_CompareNpcInstance(self,hero))
	{
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_BED;
		AI_ProcessInfos(self);
	};
};


instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int PC_NoSleep_Condition()
{
	if(hero.aivar[33] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	self.aivar[24] = FALSE;
};


instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	important = 0;
	permanent = 1;
	description = "Bis zum nächsten Morgen schlafen";
};


func int PC_SleepTime_Morning_Condition()
{
	if(hero.aivar[33] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);
};


instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	important = 0;
	permanent = 1;
	description = "Bis Mittags schlafen";
};


func int PC_SleepTime_Noon_Condition()
{
	if(hero.aivar[33] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};


instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	important = 0;
	permanent = 1;
	description = "Bis zum nächsten Abend schlafen";
};


func int PC_SleepTime_Evening_Condition()
{
	if(hero.aivar[33] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(18);
};


instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	important = 0;
	permanent = 1;
	description = "Bis Mitternacht schlafen";
};


func int PC_SleepTime_Midnight_Condition()
{
	if(hero.aivar[33] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};

