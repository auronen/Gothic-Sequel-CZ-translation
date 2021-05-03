
instance INFO_ODO_EXIT(C_Info)
{
	npc = hlr_503_odo;
	nr = 999;
	condition = info_odo_exit_condition;
	information = info_odo_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_odo_exit_condition()
{
	return TRUE;
};

func void info_odo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance HLR_503_ODO_PROVOZIER(C_Info)
{
	npc = hlr_503_odo;
	nr = 2;
	condition = hlr_503_odo_provozier_condition;
	information = hlr_503_odo_provozier_info;
	important = TRUE;
	permanent = FALSE;
};


func int hlr_503_odo_provozier_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func int hlr_503_odo_provozier_info()
{
	AI_Output(self,hero,"HLR_503_PROVOZIER_00_01");	//Hast du keine Angst, das dich einer der Verrückten anfällt?
	AI_Output(hero,self,"HLR_503_PROVOZIER_15_02");	//Besteht denn die Gefahr?
	AI_Output(self,hero,"HLR_503_PROVOZIER_00_03");	//Man kann nicht vorsichtig genug sein! Letzte Woche hat mich einer ins Bein gebissen.
	AI_Output(self,hero,"HLR_503_PROVOZIER_00_04");	//Ich musste eine halbe Stunde auf ihn einschlagen bis er losgelassen hat. Habe geblutet, wie ein Schwein!
};


instance HLR_503_ODO_HOWDY(C_Info)
{
	npc = hlr_503_odo;
	nr = 20;
	condition = hlr_503_odo_howdy_condition;
	information = hlr_503_odo_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie geht es euren Kranken?";
};


func int hlr_503_odo_howdy_condition()
{
	if(Npc_KnowsInfo(hero,hlr_503_odo_provozier))
	{
		return TRUE;
	};
};

func void hlr_503_odo_howdy_info()
{
	AI_Output(hero,self,"HLR_503_HOWDY_15_01");	//Wie geht es euren Kranken?
	AI_Output(self,hero,"HLR_503_HOWDY_08_02");	//Ständig muss man auf diese Irren aufpassen.
	AI_Output(self,hero,"HLR_503_HOWDY_08_03");	//Das ist mehr Herausforderung als jeder Arenakampf.
	AI_StopProcessInfos(self);
};


instance INFO_ODO_DONTBOTHER(C_Info)
{
	npc = hlr_503_odo;
	nr = 1;
	condition = info_odo_dontbother_condition;
	information = info_odo_dontbother_info;
	important = TRUE;
	permanent = FALSE;
};


func int info_odo_dontbother_condition()
{
	if(Npc_KnowsInfo(hero,info_bartok_key))
	{
		return TRUE;
	};
};

func void info_odo_dontbother_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Odo_DONTBOTHER_00_01");	//Völlig Irre, was? Paß auf, daß er dich nicht beißt!
};


instance INFO_ODO_KEY(C_Info)
{
	npc = hlr_503_odo;
	nr = 1;
	condition = info_odo_key_condition;
	information = info_odo_key_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bartok muß einen Schlüssel bei sich gehabt haben.";
};


func int info_odo_key_condition()
{
	if(Npc_KnowsInfo(hero,info_odo_dontbother))
	{
		return TRUE;
	};
};

func void info_odo_key_info()
{
	AI_Output(hero,self,"Info_Odo_KEY_15_01");	//Bartok muß einen Schlüssel bei sich gehabt haben.
	AI_Output(self,hero,"Info_Odo_KEY_00_02");	//Ich hab heute meinen großzügigen Tag. Hier hast du ihn.
	B_GiveInvItems(self,hero,itke_bartok,1);
	AI_Output(self,hero,"Info_Odo_KEY_00_03");	//Bartok wird keine Verwendung mehr dafür haben.
	B_LogEntry(CH1_BARTOK,"Der Pfleger Odo gab mir den Schlüssel zu Bartok's Kiste. Einfach so!!! Es geschehen noch Zeichen und Wunder.");
	Log_SetTopicStatus(CH1_BARTOK,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

