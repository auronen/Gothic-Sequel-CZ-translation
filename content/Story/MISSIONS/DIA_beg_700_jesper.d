
instance BEG_700_JESPER_EXIT(C_Info)
{
	npc = beg_700_jesper;
	nr = 999;
	condition = beg_700_jesper_exit_condition;
	information = beg_700_jesper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int beg_700_jesper_exit_condition()
{
	return TRUE;
};

func void beg_700_jesper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_700_JESPER_JOB(C_Info)
{
	npc = beg_700_jesper;
	nr = 1;
	condition = beg_700_jesper_job_condition;
	information = beg_700_jesper_job_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int beg_700_jesper_job_condition()
{
	return TRUE;
};

func int beg_700_jesper_job_info()
{
	AI_Output(hero,self,"BEG_700_JOB_15_01");	//Was machst du hier?
	AI_Output(self,hero,"BEG_700_JOB_02_02");	//Ich bin Jesper. War früher mal Soldat. Jetzt bin ich Bettler.
	AI_Output(hero,self,"BEG_700_JOB_15_03");	//Was ist geschehen?
	AI_Output(self,hero,"BEG_700_JOB_02_04");	//Drei Offiziere haben sich einen hübschen jungen Rekruten vorgenommen. Darauf hin habe ich sie mir vorgenommen.
	AI_Output(self,hero,"BEG_700_JOB_02_05");	//Innerhalb einer Minute waren sie alle tot. Und das war das Ende meiner Karriere. Seitdem hangel ich mich so durch.
};


instance BEG_700_JESPER_HI(C_Info)
{
	npc = beg_700_jesper;
	nr = 1;
	condition = beg_700_jesper_hi_condition;
	information = beg_700_jesper_hi_info;
	important = TRUE;
	permanent = FALSE;
};


func int beg_700_jesper_hi_condition()
{
	return TRUE;
};

func int beg_700_jesper_hi_info()
{
	AI_Output(self,hero,"BEG_700_HI_02_01");	//Hey, ich hab dich hier noch nie gesehen. Bringst du Neuigkeiten mit?
	Info_AddChoice(beg_700_jesper_hi,"Der alte Tempel ist eingestürzt",beg_700_jesper_hi_temple);
	Info_AddChoice(beg_700_jesper_hi,"Ich hörte das Orks in der Gegend sind.",beg_700_jesper_hi_ork);
	Info_AddChoice(beg_700_jesper_hi,"Nein, aber kennst du Neuigkeiten? ",beg_700_jesper_hi_no);
};

func void beg_700_jesper_hi_no()
{
	AI_Output(hero,self,"BEG_700_HI_NO_15_01");	//Nein, aber kennst du Neuigkeiten?
	AI_Output(self,hero,"BEG_700_HI_NO_02_02");	//Ich kriege einiges mit. Wenn du etwas wissen willst, bin ich dein Mann.
	Info_ClearChoices(beg_700_jesper_hi);
};

func void beg_700_jesper_hi_ork()
{
	AI_Output(hero,self,"BEG_700_HI_ORK_15_01");	//Ich hörte das Orks in der Gegend sind.
	AI_Output(self,hero,"BEG_700_HI_ORK_02_02");	//Ach was? Tatsächlich? Sag mal hast du die letzten Monate geschlafen?
	AI_Output(hero,self,"BEG_700_HI_ORK_15_03");	//Naja, geschlafen trifft es nicht unbedingt...
	AI_Output(self,hero,"BEG_700_HI_ORK_02_04");	//Junge, wenn du Information suchst, dann bist du bei mir genau richtig.
	Info_ClearChoices(beg_700_jesper_hi);
};

func void beg_700_jesper_hi_temple()
{
	AI_Output(hero,self,"BEG_700_HI_TEMPLE_15_01");	//Der alte Tempel ist eingestürzt
	AI_Output(self,hero,"BEG_700_HI_TEMPLE_02_02");	//Tempel? Welcher Tempel?
	AI_Output(hero,self,"BEG_700_HI_TEMPLE_15_03");	//Der alte Ork Tempel in dem der Erzdämon tausend Jahre geschlafen hat.
	AI_Output(self,hero,"BEG_700_HI_TEMPLE_02_04");	//Was... ein Tempel? Dämon... Orks? Damit kann ich nichts anfangen. Aber wenn du Neuigkeiten suchst, bist du bei mir richtig.
	Info_ClearChoices(beg_700_jesper_hi);
};


instance BEG_700_JESPER_NEWS(C_Info)
{
	npc = beg_700_jesper;
	nr = 1;
	condition = beg_700_jesper_news_condition;
	information = beg_700_jesper_news_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hast Du Neuigkeiten?";
};


func int beg_700_jesper_news_condition()
{
	if(BEGGARS_SECRETS < 3)
	{
		return TRUE;
	};
};

func int beg_700_jesper_news_info()
{
	AI_Output(hero,self,"BEG_700_NEWS_15_01");	//Hast Du Neuigkeiten?
	AI_Output(self,hero,"BEG_700_NEWS_02_02");	//Das Wasser ist nass, die Miliz schläft im Dienst, die Bettler haben kein Silber, alles ist ruhig.
};


instance BEG_700_JESPER_GIVENEWS(C_Info)
{
	npc = beg_700_jesper;
	nr = 1;
	condition = beg_700_jesper_givenews_condition;
	information = beg_700_jesper_givenews_info;
	important = FALSE;
	permanent = TRUE;
	description = "(Neuigkeit erwerben über...)";
};


func int beg_700_jesper_givenews_condition()
{
	if(BEGGARS_SECRETS >= 3)
	{
		return TRUE;
	};
};

func int beg_700_jesper_givenews_info()
{
	Info_AddChoice(beg_700_jesper_givenews,DIALOG_BACK,beg_700_jesper_givenews_back);
	Info_AddChoice(beg_700_jesper_givenews,"Herumtreiber (2 Silber)",beg_700_jesper_givenews_loafer);
	Info_AddChoice(beg_700_jesper_givenews,"Miliz (2 Silber)",beg_700_jesper_givenews_militia);
	Info_AddChoice(beg_700_jesper_givenews,"Heiler (2 Silber)",beg_700_jesper_givenews_healer);
	Info_AddChoice(beg_700_jesper_givenews,"Arbeiter (2 Silber)",beg_700_jesper_givenews_worker);
};

func void beg_700_jesper_givenews_worker()
{
	if(Npc_HasItems(hero,itmi_silver) >= 2)
	{
		B_GiveInvItems(hero,self,itmi_silver,2);
		AI_Output(hero,self,"BEG_700_GIVENEWS_WORKER_15_01");	//Erzähl mir was über die Arbeiter!
		AI_Output(self,hero,"BEG_700_GIVENEWS_WORKER_02_02");	//Einige der Arbeiter sind unzufrieden, weil Bromor ein Sklaventreiber ist.
		AI_Output(self,hero,"BEG_700_GIVENEWS_WORKER_02_03");	//Einer von ihnen, Rassmuson, will sogar abhauen.
		AI_Output(hero,self,"BEG_700_GIVENEWS_WORKER_15_04");	//Na, und?
		AI_Output(self,hero,"BEG_700_GIVENEWS_WORKER_02_05");	//Nun, wenn du das Bromor erzähslt, springt vielleicht was für dich raus.
		AI_Output(self,hero,"BEG_700_GIVENEWS_WORKER_02_06");	//Und wenn du dich auf die Seite von Rassmuson stellst, kannst du vielleicht bei ihm ewas rausschlagen.
		AI_Output(self,hero,"BEG_700_GIVENEWS_WORKER_02_07");	//Wie auch immer, es ist deine Entscheidung...
		KNOWS_RASSMUSON = TRUE;
	}
	else
	{
		AI_Output(self,hero,"BEG_700_NOMONEY_02_04");	//Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void beg_700_jesper_givenews_healer()
{
	if(Npc_HasItems(hero,itmi_silver) >= 2)
	{
		B_GiveInvItems(hero,self,itmi_silver,2);
		AI_Output(hero,self,"BEG_700_GIVENEWS_HEALER_15_01");	//Erzähl mir was über die Heiler!
		AI_Output(self,hero,"BEG_700_GIVENEWS_HEALER_02_02");	//Angeblich gibt es ein Rezept für ein Mittel, das den Kranken für eine Weile einen klaren Verstand verschafft.
		AI_Output(self,hero,"BEG_700_GIVENEWS_HEALER_02_03");	//Aber niemand weiß wo dieses Rezept zu finden ist.
		AI_Output(self,hero,"BEG_700_GIVENEWS_HEALER_02_04");	//Sie werden sich bestimmt erkenntlich zeigen, wenn jemand das Rezept findet...
		HERO_KNOWSRECIPE = TRUE;
	}
	else
	{
		AI_Output(self,hero,"BEG_700_NOMONEY_02_04");	//Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void beg_700_jesper_givenews_militia()
{
	if(Npc_HasItems(hero,itmi_silver) >= 2)
	{
		B_GiveInvItems(hero,self,itmi_silver,2);
		AI_Output(hero,self,"BEG_700_GIVENEWS_MILITIA_15_01");	//Erzähl mir was über die Miliz!
		AI_Output(self,hero,"BEG_700_GIVENEWS_MILITIA_02_02");	//Brutus der Leutnant kämpft gerne in der Arena. Zu gerne. Denn damit verspielt er sich seine Chance auf den Rang des Hauptmanns, denn er vernachlässigt seine Pflichten.
	}
	else
	{
		AI_Output(self,hero,"BEG_700_NOMONEY_02_03");	//Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void beg_700_jesper_givenews_loafer()
{
	if(Npc_HasItems(hero,itmi_silver) >= 2)
	{
		B_GiveInvItems(hero,self,itmi_silver,2);
		AI_Output(hero,self,"BEG_700_GIVENEWS_LOAFER_15_01");	//Erzähl mir was über die Herumtreiber!
		AI_Output(self,hero,"BEG_700_GIVENEWS_LOAFER_02_02");	//Ihre Position ist schlecht im Lager. Sie helfen nicht beim Aufbau des Lagers und kümmern sich nicht um die Versorgung.
		AI_Output(self,hero,"BEG_700_GIVENEWS_LOAFER_02_03");	//Vor allem den Arbeitern stinkt das gewaltig. Aber Diego hat klargemacht, das jeder hier im Lager Zuflucht findet und bleiben kann.
		AI_Output(self,hero,"BEG_700_GIVENEWS_LOAFER_02_04");	//Zudem ist jeder Mann bei einem möglichen Orkangriff wichtig.
	}
	else
	{
		AI_Output(self,hero,"BEG_700_NOMONEY_02_05");	//Besorge dir Silber, dann bekommst du Informationen.
		AI_StopProcessInfos(self);
	};
};

func void beg_700_jesper_givenews_back()
{
	Info_ClearChoices(beg_700_jesper_givenews);
};

