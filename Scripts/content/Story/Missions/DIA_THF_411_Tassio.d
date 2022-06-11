///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE THF_411_Tassio_EXIT   (C_INFO)
{
	npc         = THF_411_Tassio;
	nr          = 999;
	condition   = THF_411_Tassio_EXIT_Condition;
	information = THF_411_Tassio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT THF_411_Tassio_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID THF_411_Tassio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info YOURJOB
///////////////////////////////////////////////////////////////////////
instance THF_411_Tassio_YOURJOB		(C_INFO)
{
	npc		 	 = 	THF_411_Tassio;
	condition	 = 	THF_411_Tassio_YOURJOB_Condition;
	information	 = 	THF_411_Tassio_YOURJOB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum bist du hier draussen?";
	description	 = 	"Proč jsi tady venku?";
};

func int THF_411_Tassio_YOURJOB_Condition ()
{
	return TRUE;
};

func void THF_411_Tassio_YOURJOB_Info ()
{
//	AI_Output			(hero, self, "THF_411_YOURJOB_15_01"); //Warum bist du hier draussen?
	AI_Output			(hero, self, "THF_411_YOURJOB_15_01"); //Proč jsi tady venku?
//	AI_Output			(self, hero, "THF_411_YOURJOB_10_02"); //Iii...Iicc....Iiicchhhh... ICH!
	AI_Output			(self, hero, "THF_411_YOURJOB_10_02"); //Áááá... Áááá.... Jáááááá... JÁ!
//	AI_Output			(self, hero, "THF_411_YOURJOB_10_03"); //Ww... www... wwwi... wwwiiil... WILL.
	AI_Output			(self, hero, "THF_411_YOURJOB_10_03"); //Ch... Ch... Chc... Chccc... CHCI.
//	AI_Output			(self, hero, "THF_411_YOURJOB_10_04"); //Ss... sss... sssool... sssoldddd. ddd. ddd... (schnauf)
	AI_Output			(self, hero, "THF_411_YOURJOB_10_04"); //Vv... vvv... voj... vojáá. ááá. ááá... (funí)
//	AI_Output			(self, hero, "THF_411_YOURJOB_10_05"); //Soooooldaaat... SOLDAT werden.
	AI_Output			(self, hero, "THF_411_YOURJOB_10_05"); //Voojáááák... VOJÁK být.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance THF_411_Tassio_HOWDY		(C_INFO)
{
	npc		 	 = 	THF_411_Tassio;
	condition	 = 	THF_411_Tassio_HOWDY_Condition;
	information	 = 	THF_411_Tassio_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wie geht es dir?";
	description	 = 	"Jak se ti daří?";
};

func int THF_411_Tassio_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero, THF_411_Tassio_YOURJOB)
	{
		return TRUE;
	};
};

func void THF_411_Tassio_HOWDY_Info ()
{
//	AI_Output			(hero, self, "THF_411_HOWDY_15_01"); //Wie geht es dir?
	AI_Output			(hero, self, "THF_411_HOWDY_15_01"); //Jak se ti daří?
//	AI_Output			(self, hero, "THF_411_HOWDY_10_02"); //Daa... daaann... daannnkk... daaannnnkkkee... DANKE!
	AI_Output			(self, hero, "THF_411_HOWDY_10_02"); //Díí... Dííík... dííííík... díííííkyyyy... DÍKY!
//	AI_Output			(self, hero, "THF_411_HOWDY_10_03"); //Gg.. ggg... ggguu... gguuuhh... GUT!
	AI_Output			(self, hero, "THF_411_HOWDY_10_03"); //Dd.. ddd... ddoooob... doooobřřř... DOBŘE!
//	AI_Output			(self, hero, "THF_411_HOWDY_10_04"); //Ww... www... wwwiii... wwwiiieeee... WIE!
	AI_Output			(self, hero, "THF_411_HOWDY_10_04"); //Jj... jjj... jjjaa... jaaaaak... JAK!
//	AI_Output			(self, hero, "THF_411_HOWDY_10_05"); //Gg... ggg...
	AI_Output			(self, hero, "THF_411_HOWDY_10_05"); //Ss... ssseee...
//	AI_Output			(hero, self, "THF_411_HOWDY_15_06"); //(voreilig) Äh! Oh danke, mir geht es auch gut!
	AI_Output			(hero, self, "THF_411_HOWDY_15_06"); //(kvapně) Ach! Oh díky, mně se taky daří dobře!
};










