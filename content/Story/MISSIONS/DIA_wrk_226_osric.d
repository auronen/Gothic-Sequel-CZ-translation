
instance WRK_226_OSRIC_EXIT(C_Info)
{
	npc = wrk_226_osric;
	nr = 999;
	condition = wrk_226_osric_exit_condition;
	information = wrk_226_osric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_226_osric_exit_condition()
{
	return TRUE;
};

func void wrk_226_osric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_226_OSRIC_HI(C_Info)
{
	npc = wrk_226_osric;
	nr = 1;
	condition = wrk_226_osric_hi_condition;
	information = wrk_226_osric_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wer bist du?";
};


func int wrk_226_osric_hi_condition()
{
	return TRUE;
};

func void wrk_226_osric_hi_info()
{
	AI_Output(hero,self,"WRK_226_HI_15_01");	//Wer bist du?
	AI_Output(self,hero,"WRK_226_HI_00_02");	//Ich bin Osric.
};


instance WRK_226_OSRIC_PFEILE(C_Info)
{
	npc = wrk_226_osric;
	nr = 1;
	condition = wrk_226_osric_pfeile_condition;
	information = wrk_226_osric_pfeile_info;
	important = FALSE;
	permanent = FALSE;
	description = "...und du schnitzt Pfeile...";
};


func int wrk_226_osric_pfeile_condition()
{
	if(Npc_KnowsInfo(hero,wrk_226_osric_hi))
	{
		return TRUE;
	};
};

func void wrk_226_osric_pfeile_info()
{
	AI_Output(hero,self,"WRK_226_PFEILE_15_01");	//...und du schnitzt Pfeile...
	AI_Output(self,hero,"WRK_226_PFEILE_00_02");	//Gut erkannt.
};


instance WRK_226_OSRIC_SELL(C_Info)
{
	npc = wrk_226_osric;
	nr = 1;
	condition = wrk_226_osric_sell_condition;
	information = wrk_226_osric_sell_info;
	important = FALSE;
	permanent = FALSE;
	description = "Verkaufst du auch Pfeile?";
};


func int wrk_226_osric_sell_condition()
{
	if(Npc_KnowsInfo(hero,wrk_226_osric_pfeile))
	{
		return TRUE;
	};
};

func void wrk_226_osric_sell_info()
{
	AI_Output(hero,self,"WRK_226_SELL_15_01");	//Verkaufst du auch Pfeile?
	AI_Output(self,hero,"WRK_226_SELL_00_02");	//Nein.
	AI_Output(self,hero,"WRK_226_SELL_00_03");	//Aber Helvegor verkauft Bögen und die Pfeile, die ich schnitze.
};


instance WRK_226_OSRIC_TRAIN(C_Info)
{
	npc = wrk_226_osric;
	nr = 1;
	condition = wrk_226_osric_train_condition;
	information = wrk_226_osric_train_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst du mir beibringen, Pfeile zu schnitzen?";
};


func int wrk_226_osric_train_condition()
{
	if(Npc_KnowsInfo(hero,wrk_226_osric_pfeile))
	{
		return TRUE;
	};
};

func void wrk_226_osric_train_info()
{
	AI_Output(hero,self,"WRK_226_TRAIN_15_01");	//Kannst du mir beibringen, Pfeile zu schnitzen?
	AI_Output(self,hero,"WRK_226_TRAIN_00_02");	//Nein, dazu habe ich keine Zeit.
};

