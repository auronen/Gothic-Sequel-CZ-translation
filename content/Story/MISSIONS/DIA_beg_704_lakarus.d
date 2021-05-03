
instance BEG_704_LAKARUS_EXIT(C_Info)
{
	npc = beg_704_lakarus;
	nr = 999;
	condition = beg_704_lakarus_exit_condition;
	information = beg_704_lakarus_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int beg_704_lakarus_exit_condition()
{
	return 1;
};

func void beg_704_lakarus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_704_LAKARUS_HI(C_Info)
{
	npc = beg_704_lakarus;
	nr = 1;
	condition = beg_704_lakarus_hi_condition;
	information = beg_704_lakarus_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was machst du hier?";
};


func int beg_704_lakarus_hi_condition()
{
	return TRUE;
};

func void beg_704_lakarus_hi_info()
{
	AI_Output(hero,self,"BEG_704_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"BEG_704_HI_00_02");	//Ich verkaufe Sumpfkraut. Schönes frisches Sumpfkraut.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Einer der Bettler mit Namen Lakarus verkauft SUMPFKRAUT auf dem Arenaplatz.");
};


instance BEG_704_LAKARUS_WHATHERB(C_Info)
{
	npc = beg_704_lakarus;
	nr = 2;
	condition = beg_704_lakarus_whatherb_condition;
	information = beg_704_lakarus_whatherb_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was kann ich mit Sumpfkraut machen?";
};


func int beg_704_lakarus_whatherb_condition()
{
	if(Npc_KnowsInfo(hero,beg_704_lakarus_hi))
	{
		return TRUE;
	};
};

func void beg_704_lakarus_whatherb_info()
{
	AI_Output(hero,self,"BEG_704_WHATHERB_15_01");	//Was kann ich mit Sumpfkraut machen?
	AI_Output(self,hero,"BEG_704_WHATHERB_00_02");	//Du kannst es rauchen. Entweder unbehandelt in eine Wasserpfeife stopfen oder stampfen, drehen und dann rauchen.
	AI_Output(self,hero,"BEG_704_WHATHERB_00_03");	//Es gibt nichst vergleichbares, das dich so entspannt und beruhigt. Du solltest es unbedingt probieren.
};


instance BEG_704_LAKARUS_TRADEHERB(C_Info)
{
	npc = beg_704_lakarus;
	nr = 5;
	condition = beg_704_lakarus_tradeherb_condition;
	information = beg_704_lakarus_tradeherb_info;
	important = FALSE;
	permanent = TRUE;
	trade = TRUE;
	description = "Zeig mir deine Ware";
};


func int beg_704_lakarus_tradeherb_condition()
{
	if(Npc_KnowsInfo(hero,beg_704_lakarus_hi))
	{
		return TRUE;
	};
};

func void beg_704_lakarus_tradeherb_info()
{
	AI_Output(hero,self,"BEG_704_TRADEHERB_15_01");	//Zeig mir deine Ware
	AI_Output(self,hero,"BEG_704_TRADEHERB_00_02");	//Bei mir bekommst du nur frische Ware.
};


instance BEG_704_LAKARUS_WHEREHERB(C_Info)
{
	npc = beg_704_lakarus;
	nr = 33;
	condition = beg_704_lakarus_whereherb_condition;
	information = beg_704_lakarus_whereherb_info;
	important = FALSE;
	permanent = FALSE;
	description = "Woher bekommst du das Sumpfkraut?";
};


func int beg_704_lakarus_whereherb_condition()
{
	if(Npc_KnowsInfo(hero,beg_704_lakarus_hi))
	{
		return TRUE;
	};
};

func void beg_704_lakarus_whereherb_info()
{
	AI_Output(hero,self,"BEG_704_WHEREHERB_15_01");	//Woher bekommst du das Sumpfkraut?
	AI_Output(self,hero,"BEG_704_WHEREHERB_00_02");	//Wie der Name schon sagt wächst es nur im Sumpf. Aber ich bin nicht so wahnsinnig und gehe in dorthin.
	AI_Output(self,hero,"BEG_704_WHEREHERB_00_03");	//Niemand der klaren Verstandes ist geht dorthin. Nur ein paar Jäger trauen sich in die Sumpfgebiete.
	AI_Output(self,hero,"BEG_704_WHEREHERB_00_04");	//Die Jäger kommen ab und zu ins Lager. Und von denen kaufe ich das Kraut.
};


instance BEG_704_LAKARUS_SWAMP(C_Info)
{
	npc = beg_704_lakarus;
	nr = 22;
	condition = beg_704_lakarus_swamp_condition;
	information = beg_704_lakarus_swamp_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum ist es im Sumpf so gefährlich?";
};


func int beg_704_lakarus_swamp_condition()
{
	if(Npc_KnowsInfo(hero,beg_704_lakarus_whereherb))
	{
		return TRUE;
	};
};

func void beg_704_lakarus_swamp_info()
{
	AI_Output(hero,self,"BEG_704_SWAMP_15_01");	//Warum ist es im Sumpf so gefährlich?
	AI_Output(self,hero,"BEG_704_SWAMP_00_02");	//Dort gibt es Blutfliegen....und Sumpfhaie. Aber das ist noch nicht das schlimmste.
	AI_Output(hero,self,"BEG_704_SWAMP_15_03");	//Ja, und? Was ist das 'Schlimmste'?
	AI_Output(self,hero,"BEG_704_SWAMP_00_04");	//Als die Barriere noch den Himmel überzog, war der Sumpf das Gebiet einer Bruderschaft die einen Dämon abeteten!
	AI_Output(hero,self,"BEG_704_SWAMP_15_05");	//Ja, und?
	AI_Output(self,hero,"BEG_704_SWAMP_00_06");	//...die verdammten Seelen der Toten spuken dort...
	AI_Output(self,hero,"BEG_704_SWAMP_00_07");	//...Untote feiern blutige Rituale...
	AI_Output(self,hero,"BEG_704_SWAMP_00_08");	//...und Skelette staken durch das Sumpfwasser...
	AI_Output(hero,self,"BEG_704_SWAMP_15_09");	//Kann es sein das du zuviel rauchst?
};

