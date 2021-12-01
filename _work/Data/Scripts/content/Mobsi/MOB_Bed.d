//****************************
// 		PC_Sleep
//****************************

func void PC_Sleep (var int t)
{
	AI_StopProcessInfos(self);		// [SK] ->muss hier stehen um das update zu gewährleisten
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if	(Wld_IsTime(00,00,t,00))
	{
		Wld_SetTime	(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime	(t,00);
	};

	PrintScreen	("Spal jsi dobře a cítíš se lépe!", -1,-1,FONT_OLD_BIG,3);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];

	//-------- AssessEnterRoom-Wahrnehmung versenden --------
	PrintGlobals		(PD_ITEM_MOBSI);
	Npc_SendPassivePerc	(hero,	PERC_ASSESSENTERROOM, NULL, hero);		//...damit der Spieler dieses Feature nicht zum Hütteplündern ausnutzt!
};



func void SLEEPABIT_S1 ()
{
	if	(B_CompareNpcInstance (self,hero))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_BED;

		AI_ProcessInfos (self);
	};
};

//-------------------- Gar nicht schlafen -------------------------

INSTANCE PC_NoSleep (c_Info)

{
	npc				= PC_HERO;
	nr				= 999;
	condition		= PC_NoSleep_Condition;
	information		= PC_NoSleep_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};

FUNC INT PC_NoSleep_Condition()
{
	if	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func VOID PC_NoSleep_Info()
{
	AI_StopProcessInfos (self);
	self.aivar[AIV_INVINCIBLE]=FALSE;

};

//---------------------- morgens --------------------------------------

INSTANCE PC_SleepTime_Morning (C_INFO)
{
	npc				= PC_HERO;
	condition		= PC_SleepTime_Morning_Condition;
	information		= PC_SleepTime_Morning_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Bis zum nächsten Morgen schlafen";
	description		= "Spát až do příštího rána";
};

FUNC INT PC_SleepTime_Morning_Condition()
{
	if	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Morning_Info ()
{
	PC_Sleep (8);	// SN: geändert, da um 7 Uhr noch keiner der NSCs wach ist!
};

//--------------------- mittags -----------------------------------------

INSTANCE PC_SleepTime_Noon (C_INFO)
{
	npc				= PC_HERO;
	condition		= PC_SleepTime_Noon_Condition;
	information		= PC_SleepTime_Noon_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Bis Mittags schlafen";
	description		= "Spát až do odpoledne";
};

FUNC INT PC_SleepTime_Noon_Condition()
{
	if	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Noon_Info ()
{
	PC_Sleep (12);
};

//---------------------- abend --------------------------------------

INSTANCE PC_SleepTime_Evening (C_INFO)
{
	npc				= PC_HERO;
	condition		= PC_SleepTime_Evening_Condition;
	information		= PC_SleepTime_Evening_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Bis zum nächsten Abend schlafen";
	description		= "Spát až do večera";
};

FUNC INT PC_SleepTime_Evening_Condition()
{
	if	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func void PC_SleepTime_Evening_Info ()
{
	PC_Sleep (18);
};

//------------------------ nacht -----------------------------------------

instance PC_SleepTime_Midnight (C_INFO)
{
	npc				= PC_HERO;
	condition		= PC_SleepTime_Midnight_Condition;
	information		= PC_SleepTime_Midnight_Info;
	important		= 0;
	permanent		= 1;
//	description		= "Bis Mitternacht schlafen";
	description		= "Spát až do půlnoci";
};

FUNC INT PC_SleepTime_Midnight_Condition()
{
	if	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BED)
	{
		return TRUE;
	};
};

func VOID PC_SleepTime_Midnight_Info()
{
	PC_Sleep (0);
};














