///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Bartok_Exit (C_INFO)
{
	npc			=  POS_605_Bartok;
	nr			=  999;
	condition	=  Info_Bartok_Exit_Condition;
	information	=  Info_Bartok_Exit_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Bartok_Exit_Condition()
{
	return TRUE;
};

func void	Info_Bartok_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance POS_605_Bartok_CRAZY		(C_INFO)
{
	npc			 = 	POS_605_Bartok;
	nr		 	 = 	1;
	condition	 = 	POS_605_Bartok_CRAZY_Condition;
	information	 = 	POS_605_Bartok_CRAZY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int POS_605_Bartok_CRAZY_Condition ()
{
	if	C_NpcIsInvincible(self)
	&&	(!Npc_KnowsInfo(hero, Info_Julius_CHEST) || Npc_KnowsInfo(hero,Info_Odo_DONTBOTHER))
	{
		return TRUE;
	};
};
func void POS_605_Bartok_CRAZY_Info ()
{
	if Bartok_Crazy == 0
	{
		AI_Output			(self, hero, "POS_605_CRAZY_02_01"); //Glühende Funkengischt erhellt die Nacht, die Funken tanzen in den Himmel,
		AI_Output			(self, hero, "POS_605_CRAZY_02_02"); //stählerner Stab zu tödlichen Instrument geformt im Feuer des Lebens.
		Bartok_Crazy = 1;
		AI_StopProcessInfos	( self );
		return;
	};
	if Bartok_Crazy == 1
	{
		AI_Output			(self, hero, "POS_605_CRAZY_02_03"); //Blitzende Klinge schlitzt Bäuche, trennt Köpfe, zerteilt Leiber. Im Namen eines Grafen, eines Hauptmanns, eines Rates.
		AI_Output			(self, hero, "POS_605_CRAZY_02_04"); //Im Namen eines Gottes...
		Bartok_Crazy = 2;
		AI_StopProcessInfos	( self );
		return;
	};
	if Bartok_Crazy == 2
	{
		AI_Output			(self, hero, "POS_605_CRAZY_02_05"); //Faulender Körper tausendfach Gestank. Würmer kriechen durch knochige Höhlen,
		AI_Output			(self, hero, "POS_605_CRAZY_02_06"); //wo Geier die leckeren Augen stibizt haben, mit ihren krummen Schnäbeln.
		Bartok_Crazy = 3;
		AI_StopProcessInfos	( self );
		return;
	};
	if Bartok_Crazy == 3
	{
		AI_Output			(self, hero, "POS_605_CRAZY_02_07"); //Siegesfeier ohne Freude. Gelächter hohl und leer. Der Wein schmeckt nach geronnenem Blut.
		AI_Output			(self, hero, "POS_605_CRAZY_02_08"); //Wenn der Hass triumphiert, ertrinkt die Liebe in ihren eigenen Tränen.
		Bartok_Crazy = 0;
		AI_StopProcessInfos	( self );
		return;
	};

};









//#####################################################################
//##
//##
//##					SCHLÜSSEL ZUR SCHMIEDETRUHE
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance	Info_Bartok_HOWDY (C_INFO)
{
	npc				= POS_605_Bartok;
	nr				= 20;
	condition		= Info_Bartok_HOWDY_Condition;
	information		= Info_Bartok_HOWDY_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wie geht es dir, Schmied?";
	description		= "Jak se daří, kováři?";
};

func int	Info_Bartok_HOWDY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Julius_CHEST)
	{
		return TRUE;
	};
};

func void	Info_Bartok_HOWDY_Info()
{
//	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_01"); //Wie geht es dir, Schmied?
	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_01"); //Jak se daří, kováři?
//	AI_Output			(self, hero,"Info_Bartok_HOWDY_02_02"); //(verrückt) SIE werden uns alle holen.. aieehhhhh
	AI_Output			(self, hero,"Info_Bartok_HOWDY_02_02"); //(šíleně) ONI nás všechny dostanou... aieehhhhh
//	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_03"); //Ähh... ja, natürlich!
	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_03"); //Ahh... ano, samozřejmě!
//	AI_Output			(self, hero,"Info_Bartok_HOWDY_02_04"); //(verrückt) SIE werden uns mit ihrer Unreitheit überziehen... ouhhlll
	AI_Output			(self, hero,"Info_Bartok_HOWDY_02_04"); //(šíleně) ONI nás zavalí svou nečistotou... ouhhlll
//	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_05"); //Völlig...ahem... logisch!
	AI_Output			(hero, self,"Info_Bartok_HOWDY_15_05"); //Úplně... ahm... logické!
};

///////////////////////////////////////////////////////////////////////
//	Info WHO
///////////////////////////////////////////////////////////////////////
instance	Info_Bartok_WHO (C_INFO)
{
	npc				= POS_605_Bartok;
	nr				= 20;
	condition		= Info_Bartok_WHO_Condition;
	information		= Info_Bartok_WHO_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wen meinst du mit SIE?";
	description		= "Koho tím ONI myslíš?";
};

func int	Info_Bartok_WHO_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Bartok_HOWDY)
	{
		return TRUE;
	};
};

func void	Info_Bartok_WHO_Info()
{
//	AI_Output			(hero, self,"Info_Bartok_WHO_15_01"); //Wen meinst du mit SIE?
	AI_Output			(hero, self,"Info_Bartok_WHO_15_01"); //Koho tím ONI myslíš?
//	AI_Output			(self, hero,"Info_Bartok_WHO_02_02"); //(verrückt) SIE jagen mich in meinen Träumen... arghhhh
	AI_Output			(self, hero,"Info_Bartok_WHO_02_02"); //(šíleně) ONI mě pronáseldují ve snech... arghhhh
//	AI_Output			(hero, self,"Info_Bartok_WHO_15_03"); //WER, verdammt nochmal? WER???
	AI_Output			(hero, self,"Info_Bartok_WHO_15_03"); //KDO, zatraceně? KDO???
//	AI_Output			(self, hero,"Info_Bartok_WHO_02_04"); //(verrückt) Bald werden SIE überall sein.... (sabbel)
	AI_Output			(self, hero,"Info_Bartok_WHO_02_04"); //(šíleně) Brzy budou úplně všude.... (mrmlá)
};

///////////////////////////////////////////////////////////////////////
//	Info KEY
///////////////////////////////////////////////////////////////////////
instance	Info_Bartok_KEY (C_INFO)
{
	npc				= POS_605_Bartok;
	nr				= 20;
	condition		= Info_Bartok_KEY_Condition;
	information		= Info_Bartok_KEY_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Du hast einen Schlüssel, den ich gerne haben würde!";
	description		= "Máš u sebe klíč, který bych rád získal!";
};

func int	Info_Bartok_KEY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Bartok_HOWDY)
	{
		return TRUE;
	};
};

func void	Info_Bartok_KEY_Info()
{
//	AI_Output			(hero, self,"Info_Bartok_KEY_15_01"); //Du hast einen Schlüssel, den ich gerne haben würde!
	AI_Output			(hero, self,"Info_Bartok_KEY_15_01"); //Máš u sebe klíč, který bych rád získal!
//	AI_Output			(self, hero,"Info_Bartok_KEY_02_02"); //(verrückt) SIE kommen... dlblgldl... hörst du SIE auch, hörst du SIE kommen?
	AI_Output			(self, hero,"Info_Bartok_KEY_02_02"); //(šíleně) ONI přicházejí... dlblgldl... slyšíš JE, slyšíš JE jak přichází?
//	AI_Output			(hero, self,"Info_Bartok_KEY_15_03"); //Nochmal zurück zum Schlüssel...
	AI_Output			(hero, self,"Info_Bartok_KEY_15_03"); //A teď zpátky k tomu klíči...
//	AI_Output			(self, hero,"Info_Bartok_KEY_02_04"); //(nachdenklich) Schlüssel ?
	AI_Output			(self, hero,"Info_Bartok_KEY_02_04"); //(zamyšleně) Klíč?
//	AI_Output			(hero, self,"Info_Bartok_KEY_15_05"); //(hoffnungsvoll) JA... Genau... der Schlüssel!!!
	AI_Output			(hero, self,"Info_Bartok_KEY_15_05"); //(nadějně) ANO... správně... klíč!
//	AI_Output			(self, hero,"Info_Bartok_KEY_02_06"); //(verrückt) SIE werden uns in ein tiefes Verlies sperren und den Schlüssel wegwerfen... ich weiss es, ich weiss es...
	AI_Output			(self, hero,"Info_Bartok_KEY_02_06"); //(šíleně) ONI nás zavřou do hlubokého žaláře a zahodí klíč... já vím, já vím...
//	AI_Output			(hero, self,"Info_Bartok_KEY_15_07"); //(zu sich selbst) Ich geb's auf, der ist ja völlig durchgeknallt.
	AI_Output			(hero, self,"Info_Bartok_KEY_15_07"); //(pro sebe) Vzdávám to, je úplně šílený.

//	B_LogEntry			(CH1_Bartok,	"Ich habe Bartok im Krankenviertel getroffen. Er ist völlig durchgeknallt. Es ist unmöglich aus ihm etwas vernünftiges herauszubekommen. Vielleicht weiss einer der Pfleger etwas von dem Schlüssel.");
	B_LogEntry			(CH1_Bartok,	"Ve čtvrti nemocných jsem potkal Bartoka. Je úplně šílený. Je nemožné z toho ubožáka dostat cokoliv rozumného. Možná jeden z jeho ošetřovatelů bude o tom klíči vědět něco víc.");

	AI_StopProcessInfos	(self);
};





