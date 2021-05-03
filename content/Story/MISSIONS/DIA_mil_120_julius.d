
instance INFO_JULIUS_EXIT(C_Info)
{
	npc = mil_120_julius;
	nr = 999;
	condition = info_julius_exit_condition;
	information = info_julius_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_julius_exit_condition()
{
	return TRUE;
};

func void info_julius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_JULIUS_SMITH(C_Info)
{
	npc = mil_120_julius;
	nr = 20;
	condition = info_julius_smith_condition;
	information = info_julius_smith_info;
	important = FALSE;
	permanent = FALSE;
	description = "Die Schmiede sieht verlassen aus!";
};


func int info_julius_smith_condition()
{
	return TRUE;
};

func void info_julius_smith_info()
{
	AI_Output(hero,self,"Info_Julius_SMITH_15_01");	//Die Schmiede sieht verlassen aus!
	AI_Output(self,hero,"Info_Julius_SMITH_00_02");	//Ja, ja. Den alten Bartok haben sie vor ein paar Tagen abgeholt.
	AI_Output(hero,self,"Info_Julius_SMITH_15_03");	//Abgeholt?
	AI_Output(self,hero,"Info_Julius_SMITH_00_04");	//Er hat die Krankheit. Armer Kerl! Sie haben ihn in das Aussätzigen-Viertel gebracht.
};


instance INFO_JULIUS_CHEST(C_Info)
{
	npc = mil_120_julius;
	nr = 20;
	condition = info_julius_chest_condition;
	information = info_julius_chest_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo sind seine Werkzeuge?";
};


func int info_julius_chest_condition()
{
	if(Npc_KnowsInfo(hero,info_julius_smith))
	{
		return TRUE;
	};
};

func void info_julius_chest_info()
{
	AI_Output(hero,self,"Info_Julius_CHEST_15_01");	//Wo sind seine Werkzeuge?
	AI_Output(self,hero,"Info_Julius_CHEST_00_02");	//Er hat den ganzen Schmiede-Krempel gehütet wie seinen Augapfel.
	AI_Output(self,hero,"Info_Julius_CHEST_00_03");	//Hat alles in seiner Kiste aufbewahrt. Den Schlüssel trug er immer bei sich.
	Log_CreateTopic(CH1_BARTOK,LOG_MISSION);
	Log_SetTopicStatus(CH1_BARTOK,LOG_RUNNING);
	B_LogEntry(CH1_BARTOK,"Die rätselhafte Krankheit hat auch den ehemalige Burgschmied Bartok erwischt. Er wurde ins Viertel der Kranken gebracht. Den Schlüssel zu seiner Werkzeugkiste trug er stets bei sich.");
	AI_StopProcessInfos(self);
};


instance MIL_120_JULIUS_STILLHERE(C_Info)
{
	npc = mil_120_julius;
	nr = 10;
	condition = mil_120_julius_stillhere_condition;
	information = mil_120_julius_stillhere_info;
	important = FALSE;
	permanent = TRUE;
	description = "Immer noch hier?";
};


func int mil_120_julius_stillhere_condition()
{
	if(Npc_KnowsInfo(hero,info_julius_chest))
	{
		return TRUE;
	};
};

func void mil_120_julius_stillhere_info()
{
	AI_Output(hero,self,"MIL_120_STILLHERE_15_01");	//Immer noch hier?
	AI_Output(self,hero,"MIL_120_STILLHERE_00_02");	//Jaja! Ist zwar nicht der interessanteste Job, auf eine verlassene Schmiede aufzupassen, aber Hauptsache ich bekomme jede Woche meinen Sold!
	AI_StopProcessInfos(self);
};

