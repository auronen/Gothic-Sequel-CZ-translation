///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE HLR_502_Isgar_EXIT   (C_INFO)
{
	npc         = HLR_502_Isgar;
	nr          = 999;
	condition   = HLR_502_Isgar_EXIT_Condition;
	information = HLR_502_Isgar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT HLR_502_Isgar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID HLR_502_Isgar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_JOB		(C_INFO)
{
	npc		 = 	HLR_502_Isgar;
	nr		 = 	1;
	condition	 = 	HLR_502_Isgar_JOB_Condition;
	information	 = 	HLR_502_Isgar_JOB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was ist deine Aufgabe hier?";
	description	 = 	"Jakou tu máš úlohu?";
};

func int HLR_502_Isgar_JOB_Condition ()
{
	return TRUE;
};

func int HLR_502_Isgar_JOB_Info ()
{
//	AI_Output			(hero, self, "HLR_502_JOB_15_01"); //Was ist deine Aufgabe hier?
	AI_Output			(hero, self, "HLR_502_JOB_15_01"); //Jakou tu máš úlohu?
//	AI_Output			(self, hero, "HLR_502_JOB_00_02"); //Ich stelle Tränke her, die ich verkaufe.
	AI_Output			(self, hero, "HLR_502_JOB_00_02"); //Připravuji zde lektvary, které prodávám.

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC,"Isgar, einer der Heiler verkauft TRÄNKE aller Art, im Händlerviertel.");
	B_LogEntry			(GE_TraderOC,"Isgar, jeden z léčitelů, prodává LEKTVARY všeho druhu v obchodní čtvrti.");
};

///////////////////////////////////////////////////////////////////////
//	Info TRADER
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_TRADER		(C_INFO)
{
	npc		 = 	HLR_502_Isgar;
	nr		 = 	12;
	condition	 = 	HLR_502_Isgar_TRADER_Condition;
	information	 = 	HLR_502_Isgar_TRADER_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

//	description	 = 	"Lass uns handeln";
	description	 = 	"Obchodujme";
};

func int HLR_502_Isgar_TRADER_Condition ()
{
	if Npc_KnowsInfo (hero,HLR_502_Isgar_JOB)
	{
		return TRUE;
	};
};

func void HLR_502_Isgar_TRADER_Info ()
{
//	AI_Output			(hero, self, "HLR_502_TRADER_15_01"); //Lass uns handeln.
	AI_Output			(hero, self, "HLR_502_TRADER_15_01"); //Obchodujme.

};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance HLR_502_Isgar_WINE		(C_INFO)
{
	npc		 	 = 	HLR_502_Isgar;
	nr		 	 = 	23;
	condition	 = 	HLR_502_Isgar_WINE_Condition;
	information	 = 	HLR_502_Isgar_WINE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Gerion schickt mich";
	description	 = 	"Gerion mě posílá";
};

func int HLR_502_Isgar_WINE_Condition ()
{
	if Npc_KnowsInfo (hero,THF_403_Gerion_GOTHERB)
	&& (Npc_HasItems  (hero,ItPl_Swampweed) >= 20)
	{
		return TRUE;
	};
};
func void HLR_502_Isgar_WINE_Info ()
{
//	AI_Output			(hero, self, "HLR_502_WINE_15_01"); //Gerion schickt mich.
	AI_Output			(hero, self, "HLR_502_WINE_15_01"); //Gerion mě posílá.
	B_GiveInvItems		(hero, self, ItPl_Swampweed,20);
//	AI_Output			(self, hero, "HLR_502_WINE_00_02"); //Ah, du bringst das Sumpfkraut. Der Wein ist fertig. Was hat Gerion denn damit vor?
	AI_Output			(self, hero, "HLR_502_WINE_00_02"); //Ah, neseš trávu z bažin. Víno je připraveno. Co s tím Gerion udělá?
	B_GiveInvItems		(self, hero, ItFo_SleepWine,1);
//	AI_Output			(hero, self, "HLR_502_WINE_15_03"); //Keine Ahnung. Ich hol ihn nur ab.
	AI_Output			(hero, self, "HLR_502_WINE_15_03"); //Nemám tušení. Jen ho vyzvedávám.

};











