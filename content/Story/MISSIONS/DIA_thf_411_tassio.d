
instance THF_411_TASSIO_EXIT(C_Info)
{
	npc = thf_411_tassio;
	nr = 999;
	condition = thf_411_tassio_exit_condition;
	information = thf_411_tassio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int thf_411_tassio_exit_condition()
{
	return TRUE;
};

func void thf_411_tassio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_411_TASSIO_YOURJOB(C_Info)
{
	npc = thf_411_tassio;
	condition = thf_411_tassio_yourjob_condition;
	information = thf_411_tassio_yourjob_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum bist du hier draussen?";
};


func int thf_411_tassio_yourjob_condition()
{
	return TRUE;
};

func void thf_411_tassio_yourjob_info()
{
	AI_Output(hero,self,"THF_411_YOURJOB_15_01");	//Warum bist du hier draussen?
	AI_Output(self,hero,"THF_411_YOURJOB_10_02");	//Iii...Iicc....Iiicchhhh... ICH!
	AI_Output(self,hero,"THF_411_YOURJOB_10_03");	//Ww... www... wwwi... wwwiiil... WILL.
	AI_Output(self,hero,"THF_411_YOURJOB_10_04");	//Ss... sss... sssool... sssoldddd. ddd. ddd... (schnauf)
	AI_Output(self,hero,"THF_411_YOURJOB_10_05");	//Soooooldaaat... SOLDAT werden.
	AI_StopProcessInfos(self);
};


instance THF_411_TASSIO_HOWDY(C_Info)
{
	npc = thf_411_tassio;
	condition = thf_411_tassio_howdy_condition;
	information = thf_411_tassio_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie geht es dir?";
};


func int thf_411_tassio_howdy_condition()
{
	if(Npc_KnowsInfo(hero,thf_411_tassio_yourjob))
	{
		return TRUE;
	};
};

func void thf_411_tassio_howdy_info()
{
	AI_Output(hero,self,"THF_411_HOWDY_15_01");	//Wie geht es dir?
	AI_Output(self,hero,"THF_411_HOWDY_10_02");	//Daa... daaann... daannnkk... daaannnnkkkee... DANKE!
	AI_Output(self,hero,"THF_411_HOWDY_10_03");	//Gg.. ggg... ggguu... gguuuhh... GUT!
	AI_Output(self,hero,"THF_411_HOWDY_10_04");	//Ww... www... wwwiii... wwwiiieeee... WIE!
	AI_Output(self,hero,"THF_411_HOWDY_10_05");	//Gg... ggg...
	AI_Output(hero,self,"THF_411_HOWDY_15_06");	//(voreilig) Äh! Oh danke, mir geht es auch gut!
};

