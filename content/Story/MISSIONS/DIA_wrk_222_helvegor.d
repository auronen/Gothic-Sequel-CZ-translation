
instance WRK_222_HELVEGOR_EXIT(C_Info)
{
	npc = wrk_222_helvegor;
	nr = 999;
	condition = wrk_222_helvegor_exit_condition;
	information = wrk_222_helvegor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_222_helvegor_exit_condition()
{
	return TRUE;
};

func void wrk_222_helvegor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_222_HELVEGOR_HI(C_Info)
{
	npc = wrk_222_helvegor;
	nr = 1;
	condition = wrk_222_helvegor_hi_condition;
	information = wrk_222_helvegor_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du bist der Bogenmacher?";
};


func int wrk_222_helvegor_hi_condition()
{
	return TRUE;
};

func void wrk_222_helvegor_hi_info()
{
	AI_Output(hero,self,"WRK_222_HI_15_01");	//Du bist der Bogenmacher?
	AI_Output(self,hero,"WRK_222_HI_00_02");	//Ja. Bei mir bekommst du die besten Bögen im Lager - und die einzigen...
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Helvegor stellt BÖGEN her und verkauft sie zusammen mit den PFEILEN von Osric. Dieses seltsame 'Paar' hat seinen Stand im Händlerviertel.");
};


instance WRK_222_HELVEGOR_TRADEBOW(C_Info)
{
	npc = wrk_222_helvegor;
	nr = 1;
	condition = wrk_222_helvegor_tradebow_condition;
	information = wrk_222_helvegor_tradebow_info;
	important = FALSE;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int wrk_222_helvegor_tradebow_condition()
{
	if(Npc_KnowsInfo(hero,wrk_222_helvegor_hi))
	{
		return TRUE;
	};
};

func void wrk_222_helvegor_tradebow_info()
{
	AI_Output(hero,self,"WRK_222_TRADEBOW_15_01");	//Zeig mir deine Ware.
};

