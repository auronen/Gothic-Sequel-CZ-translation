///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Julius_Exit (C_INFO)
{
	npc			=  MIL_120_Julius;
	nr			=  999;
	condition	=  Info_Julius_Exit_Condition;
	information	=  Info_Julius_Exit_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Julius_Exit_Condition()
{
	return TRUE;
};

func void	Info_Julius_Exit_Info()
{
	AI_StopProcessInfos	( self );
};









//#####################################################################
//##
//##
//##						KAPITEL 7
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info SMITH
///////////////////////////////////////////////////////////////////////
instance	Info_Julius_SMITH (C_INFO)
{
	npc				= MIL_120_Julius;
	nr				= 20;
	condition		= Info_Julius_SMITH_Condition;
	information		= Info_Julius_SMITH_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Die Schmiede sieht verlassen aus!";
	description		= "Kovárna vypadá opuštěně!";
};

func int	Info_Julius_SMITH_Condition()
{
	return TRUE;
};

func void	Info_Julius_SMITH_Info()
{
//	AI_Output			(hero, self,"Info_Julius_SMITH_15_01"); //Die Schmiede sieht verlassen aus!
	AI_Output			(hero, self,"Info_Julius_SMITH_15_01"); //Kovárna vypadá opuštěně!
//	AI_Output			(self, hero,"Info_Julius_SMITH_00_02"); //Ja, ja. Den alten Bartok haben sie vor ein paar Tagen abgeholt.
	AI_Output			(self, hero,"Info_Julius_SMITH_00_02"); //Jojo. Starého Bartoka před pár dny vyzvedli.
//	AI_Output			(hero, self,"Info_Julius_SMITH_15_03"); //Abgeholt?
	AI_Output			(hero, self,"Info_Julius_SMITH_15_03"); //Vyzvedli?
//	AI_Output			(self, hero,"Info_Julius_SMITH_00_04"); //Er hat die Krankheit. Armer Kerl! Sie haben ihn in das Aussätzigen-Viertel gebracht.
	AI_Output			(self, hero,"Info_Julius_SMITH_00_04"); //Nakazil se. Chudák! Vzali ho do čtvrti malomocných.
};

///////////////////////////////////////////////////////////////////////
//	Info CHEST
///////////////////////////////////////////////////////////////////////
instance	Info_Julius_CHEST (C_INFO)
{
	npc				= MIL_120_Julius;
	nr				= 20;
	condition		= Info_Julius_CHEST_Condition;
	information		= Info_Julius_CHEST_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wo sind seine Werkzeuge?";
	description		= "Kde je jeho nářadí?";
};

func int	Info_Julius_CHEST_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Julius_SMITH)
	{
		return TRUE;
	};
};

func void	Info_Julius_CHEST_Info()
{
//	AI_Output			(hero, self,"Info_Julius_CHEST_15_01"); //Wo sind seine Werkzeuge?
	AI_Output			(hero, self,"Info_Julius_CHEST_15_01"); //Kde je jeho nářadí?
//	AI_Output			(self, hero,"Info_Julius_CHEST_00_02"); //Er hat den ganzen Schmiede-Krempel gehütet wie seinen Augapfel.
	AI_Output			(self, hero,"Info_Julius_CHEST_00_02"); //Strážil všechno své kovářské náčiní jako oko v hlavě.
//	AI_Output			(self, hero,"Info_Julius_CHEST_00_03"); //Hat alles in seiner Kiste aufbewahrt. Den Schlüssel trug er immer bei sich.
	AI_Output			(self, hero,"Info_Julius_CHEST_00_03"); //Všechno měl ve své truhle. Klíč nosil vždycky u sebe.

	Log_CreateTopic		(CH1_Bartok,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_Bartok,	LOG_RUNNING);
//	B_LogEntry			(CH1_Bartok,	"Die rätselhafte Krankheit hat auch den ehemalige Burgschmied Bartok erwischt. Er wurde ins Viertel der Kranken gebracht. Den Schlüssel zu seiner Werkzeugkiste trug er stets bei sich.");
	B_LogEntry			(CH1_Bartok,	"Ta záhadná nemoc postihla i bývalého hradního kováře Bartoka. Vzali ho do čtvrti nemocných. Klíč ke svému nářadí nosil vždy u sebe.");	

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info STILLHERE
///////////////////////////////////////////////////////////////////////
instance MIL_120_Julius_STILLHERE		(C_INFO)
{
	npc			 = 	MIL_120_Julius;
	nr			 =	10;
	condition	 = 	MIL_120_Julius_STILLHERE_Condition;
	information	 = 	MIL_120_Julius_STILLHERE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Immer noch hier?";
	description	 = 	"Pořád jsi tady?";
};

func int MIL_120_Julius_STILLHERE_Condition ()
{
	if	Npc_KnowsInfo(hero,Info_Julius_CHEST)
	{
		return TRUE;
	};
};

func void MIL_120_Julius_STILLHERE_Info ()
{
//	AI_Output			(hero, self, "MIL_120_STILLHERE_15_01"); //Immer noch hier?
	AI_Output			(hero, self, "MIL_120_STILLHERE_15_01"); //Pořád jsi tady?
//	AI_Output			(self, hero, "MIL_120_STILLHERE_00_02"); //Jaja! Ist zwar nicht der interessanteste Job, auf eine verlassene Schmiede aufzupassen, aber Hauptsache ich bekomme jede Woche meinen Sold!
	AI_Output			(self, hero, "MIL_120_STILLHERE_00_02"); //Jojo! Není to zrovna nejzajímavější práce, hlídat opuštěnou kovárnu, ale to hlavní je, že dostávám každý týden plat!	
	AI_StopProcessInfos	(self);

};










