
instance HLR_502_ISGAR_EXIT(C_Info)
{
	npc = hlr_502_isgar;
	nr = 999;
	condition = hlr_502_isgar_exit_condition;
	information = hlr_502_isgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int hlr_502_isgar_exit_condition()
{
	return TRUE;
};

func void hlr_502_isgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance HLR_502_ISGAR_JOB(C_Info)
{
	npc = hlr_502_isgar;
	nr = 1;
	condition = hlr_502_isgar_job_condition;
	information = hlr_502_isgar_job_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist deine Aufgabe hier?";
};


func int hlr_502_isgar_job_condition()
{
	return TRUE;
};

func int hlr_502_isgar_job_info()
{
	AI_Output(hero,self,"HLR_502_JOB_15_01");	//Was ist deine Aufgabe hier?
	AI_Output(self,hero,"HLR_502_JOB_00_02");	//Ich stelle Tränke her, die ich verkaufe.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Isgar, einer der Heiler verkauft TRÄNKE aller Art, im Händlerviertel.");
};


instance HLR_502_ISGAR_TRADER(C_Info)
{
	npc = hlr_502_isgar;
	nr = 12;
	condition = hlr_502_isgar_trader_condition;
	information = hlr_502_isgar_trader_info;
	important = FALSE;
	permanent = TRUE;
	trade = TRUE;
	description = "Lass uns handeln";
};


func int hlr_502_isgar_trader_condition()
{
	if(Npc_KnowsInfo(hero,hlr_502_isgar_job))
	{
		return TRUE;
	};
};

func void hlr_502_isgar_trader_info()
{
	AI_Output(hero,self,"HLR_502_TRADER_15_01");	//Lass uns handeln.
};


instance HLR_502_ISGAR_WINE(C_Info)
{
	npc = hlr_502_isgar;
	nr = 23;
	condition = hlr_502_isgar_wine_condition;
	information = hlr_502_isgar_wine_info;
	important = FALSE;
	permanent = FALSE;
	description = "Gerion schickt mich";
};


func int hlr_502_isgar_wine_condition()
{
	if(Npc_KnowsInfo(hero,thf_403_gerion_gotherb) && (Npc_HasItems(hero,itpl_swampweed) >= 20))
	{
		return TRUE;
	};
};

func void hlr_502_isgar_wine_info()
{
	AI_Output(hero,self,"HLR_502_WINE_15_01");	//Gerion schickt mich.
	B_GiveInvItems(hero,self,itpl_swampweed,20);
	AI_Output(self,hero,"HLR_502_WINE_00_02");	//Ah, du bringst das Sumpfkraut. Der Wein ist fertig. Was hat Gerion denn damit vor?
	B_GiveInvItems(self,hero,itfo_sleepwine,1);
	AI_Output(hero,self,"HLR_502_WINE_15_03");	//Keine Ahnung. Ich hol ihn nur ab.
};

