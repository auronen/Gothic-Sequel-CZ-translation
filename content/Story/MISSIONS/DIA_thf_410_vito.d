
instance THF_410_VITO_EXIT(C_Info)
{
	npc = thf_410_vito;
	nr = 999;
	condition = thf_410_vito_exit_condition;
	information = thf_410_vito_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int thf_410_vito_exit_condition()
{
	return TRUE;
};

func void thf_410_vito_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_410_VITO_TASSIO(C_Info)
{
	npc = thf_410_vito;
	condition = thf_410_vito_tassio_condition;
	information = thf_410_vito_tassio_info;
	important = TRUE;
	permanent = FALSE;
};


func int thf_410_vito_tassio_condition()
{
	if(Npc_KnowsInfo(hero,thf_411_tassio_yourjob))
	{
		return TRUE;
	};
};

func void thf_410_vito_tassio_info()
{
	AI_Output(self,hero,"THF_410_TASSIO_07_01");	//Der arme Tassio ist etwas langsam... auch im Kopf, weisst du.
	AI_Output(hero,self,"THF_410_TASSIO_15_02");	//Verstehe.
	AI_Output(self,hero,"THF_410_TASSIO_07_03");	//Am besten du hälst dich an mich.
};


instance THF_410_VITO_YOURJOB(C_Info)
{
	npc = thf_410_vito;
	condition = thf_410_vito_yourjob_condition;
	information = thf_410_vito_yourjob_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was macht ihr hier oben in den Bergen?";
};


func int thf_410_vito_yourjob_condition()
{
	return TRUE;
};

func void thf_410_vito_yourjob_info()
{
	AI_Output(hero,self,"THF_410_YOURJOB_15_01");	//Was macht ihr hier oben in den Bergen?
	AI_Output(self,hero,"THF_410_YOURJOB_07_02");	//Wir wollen Soldaten des Königs werden, doch das ist schwieriger als ich dachte.
};


instance THF_410_VITO_DIFFICULT(C_Info)
{
	npc = thf_410_vito;
	condition = thf_410_vito_difficult_condition;
	information = thf_410_vito_difficult_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wieso?";
};


func int thf_410_vito_difficult_condition()
{
	if(Npc_KnowsInfo(hero,thf_410_vito_yourjob))
	{
		return TRUE;
	};
};

func void thf_410_vito_difficult_info()
{
	AI_Output(hero,self,"THF_410_DIFFICULT_15_01");	//Wieso?
	AI_Output(self,hero,"THF_410_DIFFICULT_07_03");	//Diese Torwachen da drüben sagen, wir müssten es erst mal zu den Hilfstruppen schaffen, bevor wir richtige Soldaten werden können.
	AI_Output(hero,self,"THF_410_DIFFICULT_15_04");	//Aha.
	AI_Output(self,hero,"THF_410_DIFFICULT_07_05");	//Und wenn wir gute Soldaten sind, dann könnten wir vielleicht sogar mal echte Paladine des Königs werden.
	AI_Output(hero,self,"THF_410_DIFFICULT_15_06");	//Ich verstehe.
	AI_Output(self,hero,"THF_410_DIFFICULT_07_02");	//Aber die wollen uns nicht mal bei den Hilfstruppen haben, weil sie sagen wir wären keine guten Kämpfer.
	AI_Output(hero,self,"THF_410_DIFFICULT_15_06");	//Ich verstehe.
	AI_Output(self,hero,"THF_410_DIFFICULT_07_07");	//Willst du auch Soldat werden?
	Info_AddChoice(thf_410_vito_difficult,"Das geht dich nichts an.",thf_410_vito_difficult_nobusiness);
	Info_AddChoice(thf_410_vito_difficult,"Nein, ich will nur in die Bergfestung.",thf_410_vito_difficult_no);
	Info_AddChoice(thf_410_vito_difficult,"Ja.",thf_410_vito_difficult_yes);
};

func void thf_410_vito_difficult_yes()
{
	Info_ClearChoices(thf_410_vito_difficult);
	AI_Output(hero,self,"THF_410_DIFFICULT_YES_15_01");	//Ja.
	AI_Standup(self);
	AI_TurnToNPC(self,hero);
	AI_TurnToNPC(hero,self);
	AI_Output(self,hero,"THF_410_DIFFICULT_YES_07_02");	//HEHH!!! Wir waren zuerst hier!
	AI_Output(self,hero,"THF_410_DIFFICULT_YES_07_03");	//Stell dich gefälligst hinten an, verstanden?
	AI_StopProcessInfos(self);
};

func void thf_410_vito_difficult_no()
{
	Info_ClearChoices(thf_410_vito_difficult);
	AI_Output(hero,self,"THF_410_DIFFICULT_NO_15_01");	//Nein, ich will nur in die Bergfestung.
	AI_Output(self,hero,"THF_410_DIFFICULT_NO_07_02");	//Haha, du kommst nie so einfach durch dieses Tor. Da wette ich meine letzte Buddel drauf.
	AI_Output(hero,self,"THF_410_DIFFICULT_NO_15_03");	//Ich werde mir dann nachher die Flasche abholen. Wir sehen uns!
	AI_StopProcessInfos(self);
};

func void thf_410_vito_difficult_nobusiness()
{
	Info_ClearChoices(thf_410_vito_difficult);
	AI_Output(hero,self,"THF_410_DIFFICULT_NOBUSINESS_15_01");	//Das geht dich nichts an.
	AI_Output(self,hero,"THF_410_DIFFICULT_NOBUSINESS_07_02");	//Pahh!! Du bist genauso arrogant wie diese Torwachen da drüben.
	AI_Output(self,hero,"THF_410_DIFFICULT_NOBUSINESS_07_03");	//Würdest gut zu diesen Paladinen passen. Die sind ihre Anführer und die Ausgeburt an Arroganz.
	AI_Output(self,hero,"THF_410_DIFFICULT_NOBUSINESS_07_04");	//Sprechen kaum ein Wort mit dir und schauen über dich hinweg als ob du Fliegenmist wärst.
	AI_StopProcessInfos(self);
};


instance THF_410_VITO_HOWDY(C_Info)
{
	npc = thf_410_vito;
	condition = thf_410_vito_howdy_condition;
	information = thf_410_vito_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Na, immer noch hier draussen?";
};


func int thf_410_vito_howdy_condition()
{
	if(Npc_KnowsInfo(hero,thf_410_vito_difficult))
	{
		return TRUE;
	};
};

func void thf_410_vito_howdy_info()
{
	AI_Output(hero,self,"THF_410_HOWDY_15_01");	//Na, immer noch hier draussen?
	AI_Output(self,hero,"THF_410_HOWDY_07_02");	//Noch! Bestimmt werden wir schon bald bei den Hilfstruppen sein, wart' nur ab.
};

