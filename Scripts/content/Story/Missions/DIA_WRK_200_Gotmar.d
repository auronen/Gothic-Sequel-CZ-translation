///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_Exit (C_INFO)
{
	npc			=  WRK_200_Gotmar;
	nr			=  999;
	condition	=  Info_Gotmar_Exit_Condition;
	information	=  Info_Gotmar_Exit_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Gotmar_Exit_Condition()
{
	return TRUE;
};

func void	Info_Gotmar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//#####################################################################
//##
//##
//##						KAPITEL 1
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info GREETINGS
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_GREETINGS (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_GREETINGS_Condition;
	information		= Info_Gotmar_GREETINGS_Info;
	important		= TRUE;
	permanent		= FALSE;
};

func int	Info_Gotmar_GREETINGS_Condition()
{
	if	(	(Npc_GetDistToNpc(self, hero) < 300)						// nur wenn SC näher als 3m
		||	C_NpcIsInvincible(hero)					)
	&&	(	Npc_IsInRoutine(self, ZS_Smith_Fire)
		||	Npc_IsInRoutine(self, ZS_Smith_Anvil)
		||	Npc_IsInRoutine(self, ZS_Smith_Cool)
		||	Npc_IsInRoutine(self, ZS_Smith_Sharp)	)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_GREETINGS_Info()
{
//	AI_Output			(self, hero,"Info_Gotmar_GREETINGS_04_01"); //Steh nicht im Weg rum, Mann! Hier wird gearbeitet!
	AI_Output			(self, hero,"Info_Gotmar_GREETINGS_04_01"); //Nestůj tu v cestě, chlape! Tady se pracuje!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TIRESOME
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_TIRESOME (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_TIRESOME_Condition;
	information		= Info_Gotmar_TIRESOME_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Sieht sehr anstrengend aus, deine Arbeit!";
	description		= "Vypadá to nebezpečně, ta tvoje práce!";
};

func int	Info_Gotmar_TIRESOME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_GREETINGS)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_TIRESOME_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_TIRESOME_15_01"); //Sieht anstrengend aus, deine Arbeit!
	AI_Output			(hero, self,"Info_Gotmar_TIRESOME_15_01"); //Vypadá to nebezpečně, ta tvoje práce!
//	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_02"); //Und es ist ehrliche Arbeit! Das kann nicht jeder hier von seinem Beruf behaupten.
	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_02"); //A je to skutečná práce! Taková práce tady rozhodně není pro každého.
//	AI_Output			(hero, self,"Info_Gotmar_TIRESOME_15_03"); //Wie meinst du das?
	AI_Output			(hero, self,"Info_Gotmar_TIRESOME_15_03"); //Jak to myslíš?
//	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_04"); //Schau dich mal um. Schmarotzer, Bettler, Diebe... Nicht jeder hier verdient sich sein Brot auf ehrliche Weise!
	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_04"); //Tak se podívej kolem. Paraziti, žebráci, zloději... Ani jeden si svůj chléb poctivě nevysloužil!
//	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_05"); //Wenn wir Handwerker nicht wären, wäre das Lager noch ein riesiger Schutthaufen!
	AI_Output			(self, hero,"Info_Gotmar_TIRESOME_04_05"); //Nebýt nás řemeslníků, byl by tábor jen velikou hromadou trosek!
};

///////////////////////////////////////////////////////////////////////
//	Info DEBRIS
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_DEBRIS (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_DEBRIS_Condition;
	information		= Info_Gotmar_DEBRIS_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Das Lager war zerstört?";
	description		= "Tábor byl zničen?";
};

func int	Info_Gotmar_DEBRIS_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_TIRESOME)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_DEBRIS_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_15_01"); //Das Lager war zerstört?
	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_15_01"); //Tábor byl zničen?
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_04_02"); //Ja Mann! Bei der Zerstörung der Barriere ist hier einiges zu Bruch gegangen!
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_04_02"); //Že se divíš! Se zničením Bariéry se to začalo hroutit i tady!
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_04_03"); //Vorher soll es hier anders ausgesehen haben, sagt Diego.
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_04_03"); //Podle Diega to tu před tím vypadalo jinak.

	Info_ClearChoices	(Info_Gotmar_DEBRIS);
//	Info_AddChoice		(Info_Gotmar_DEBRIS, "Kann schon sein!", 		Info_Gotmar_DEBRIS_MAYBE);
	Info_AddChoice		(Info_Gotmar_DEBRIS, "Může být!", 		Info_Gotmar_DEBRIS_MAYBE);
//	Info_AddChoice		(Info_Gotmar_DEBRIS, "Es sah... ANDERS aus!",	Info_Gotmar_DEBRIS_INDEED);
	Info_AddChoice		(Info_Gotmar_DEBRIS, "Ono to vypadalo... JINAK!!",	Info_Gotmar_DEBRIS_INDEED);
};

func void	Info_Gotmar_DEBRIS_MAYBE ()
{
//	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_MAYBE_15_01"); //Kann schon sein!
	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_MAYBE_15_01"); //Může být!
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_MAYBE_04_02"); //Naja, genau wissen das nur ehemalige Gefangene, wie Diego.
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_MAYBE_04_02"); //No jo, přesně to vědí jen bývalí vězni - jako Diego.

	Info_ClearChoices	(Info_Gotmar_DEBRIS);
};

func void	Info_Gotmar_DEBRIS_INDEED ()
{
//	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_01"); //Es sah...
	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_01"); //Ono to vypadalo...
	AI_PlayAni			(hero, "T_SEARCH");
//	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_02"); //...ANDERS aus!
	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_02"); //...JINAK!
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_03"); //Woher willst DU das denn wissen?
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_03"); //A odkud to bys to TY měl vědět?
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_04"); //Vor der Zerstörung war dieses Gebiet ein riesiges Gefängnis!
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_04"); //Před Zhroucením byla celá tato oblast jedno velké vězení!
//	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_05"); //Ich war einer der Gefangenen und kenne Diego noch aus dieser Zeit!
	AI_Output			(hero, self,"Info_Gotmar_DEBRIS_INDEED_15_05"); //Já jsem byl jedním z uvězněných a znal jsem za těch časů Diega!
//	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_06"); //(misstrauisch) Was du nicht sagst...
	AI_Output			(self, hero,"Info_Gotmar_DEBRIS_INDEED_04_06"); //(nevěřícně) Co ty nenakecáš...

	Info_ClearChoices	(Info_Gotmar_DEBRIS);
};



///////////////////////////////////////////////////////////////////////
//	Info SELL
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_SELL (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_SELL_Condition;
	information		= Info_Gotmar_SELL_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Verkaufst du Waffen?";
	description		= "Obchoduješ se zbraněmi?";
};

func int	Info_Gotmar_SELL_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_TIRESOME)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_SELL_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_SELL_15_01"); //Verkaufst du Waffen?
	AI_Output			(hero, self,"Info_Gotmar_SELL_15_01"); //Obchoduješ se zbraněmi?
//	AI_Output			(self, hero,"Info_Gotmar_SELL_04_02"); //Nicht an dich. Ich liefere ausschliesslich an die Miliz.
	AI_Output			(self, hero,"Info_Gotmar_SELL_04_02"); //Ne s tebou. Zásobuju výhradně členy domobrany.
//	AI_Output			(self, hero,"Info_Gotmar_SELL_04_03"); //Wenn du Waffen haben willst, mußt du lernen sie selbst zu schmieden.
	AI_Output			(self, hero,"Info_Gotmar_SELL_04_03"); //Jestli chceš zbraně, budeš se muset naučit si je sám ukovat.
//	AI_Output			(self, hero,"Info_Gotmar_SELL_04_04"); //Wenn der Preis stimmt, dann kannst du ein paar Dinge von mir haben, die man fürs Schmieden braucht.
	AI_Output			(self, hero,"Info_Gotmar_SELL_04_04"); //Pokud si to budeš moci dovolit, tak bys ode mě mohl dostat pár věcí, které ke kování potřebuješ.

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC,"Gotmar der Schmied verkauft allerlei SCHMIEDEZUBEHÖR. Er hat seine Schmiede direkt neben dem Haupttor.");
	B_LogEntry			(GE_TraderOC,"Kovář Gotmar prodává KOVÁŘSKÉ POTŘEBY. Kovárnu má přímo vedle hlavní brány.");
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_TRADE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	nr				= 10;
	condition		= Info_Gotmar_TRADE_Condition;
	information		= Info_Gotmar_TRADE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Zeig mir deine Waren";
	description		= "Ukaž mi své zboží.";
	trade			= TRUE;
};

func int	Info_Gotmar_TRADE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_SELL)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_TRADE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_TRADE_15_01"); //Zeig mir deine Waren!
	AI_Output			(hero, self,"Info_Gotmar_TRADE_15_01"); //Ukaž mi své zboží.
//	AI_Output			(self, hero,"Info_Gotmar_TRADE_04_02"); //Was soll's denn sein?
	AI_Output			(self, hero,"Info_Gotmar_TRADE_04_02"); //Co to bude?
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNSMITH
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_LEARNSMITH (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_LEARNSMITH_Condition;
	information		= Info_Gotmar_LEARNSMITH_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Zeig mir, wie man Waffen schmiedet.";
	description		= "Ukaž mi, jak se kovají zbraně.";
};

func int	Info_Gotmar_LEARNSMITH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_SELL)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_LEARNSMITH_Info()
{
//	AI_Output		(hero, self,"Info_Gotmar_LEARNSMITH_15_01"); //Zeig mir, wie man Waffen schmiedet.
	AI_Output		(hero, self,"Info_Gotmar_LEARNSMITH_15_01"); //Ukaž mi, jak se kovají zbraně.
//	AI_Output		(self, hero,"Info_Gotmar_LEARNSMITH_04_02"); //Mann, ich muß hier auch noch meine Arbeit machen!
	AI_Output		(self, hero,"Info_Gotmar_LEARNSMITH_04_02"); //Chlape, já tu musím dělat svoji práci!
//	AI_Output		(self, hero,"Info_Gotmar_LEARNSMITH_04_03"); //Aber wenn Du mir einen Gefallen tust, werde ich mir die Zeit nehmen!
	AI_Output		(self, hero,"Info_Gotmar_LEARNSMITH_04_03"); //Ale když mi prokážeš laskavost, mohl bych si najít čas!
};

///////////////////////////////////////////////////////////////////////
//	Info DOFAVOR
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_DOFAVOR (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_DOFAVOR_Condition;
	information		= Info_Gotmar_DOFAVOR_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Was für ein Gefallen?";
	description		= "Jakou laskavost?";
};

func int	Info_Gotmar_DOFAVOR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_LEARNSMITH)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_DOFAVOR_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_DOFAVOR_15_01"); //Was für ein Gefallen?
	AI_Output			(hero, self,"Info_Gotmar_DOFAVOR_15_01"); //Jakou laskavost?
//	AI_Output			(self, hero,"Info_Gotmar_DOFAVOR_04_02"); //Ich muß noch einige Waffen schmieden, aber mein Erz ist knapp geworden.
	AI_Output			(self, hero,"Info_Gotmar_DOFAVOR_04_02"); //Musím ještě ukovat nějaké zbraně, ale už mi značně ubylo rudy.
	//AI_Output			(self, hero,"Info_Gotmar_DOFAVOR_04_03"); //Wenn du mir 40 Brocken Erz besorgst, zeige ich dir wie man Waffen schmiedet.
	AI_Output			(self, hero,"Info_Gotmar_DOFAVOR_04_03"); //Když mi obstaráš 40 nugetů magické rudy, ukážu ti, jak se kovají zbraně.

	Log_CreateTopic		(CH1_LearnSmith,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LearnSmith,	LOG_RUNNING);
//	B_LogEntry			(CH1_LearnSmith,	"Gotmar, ist bereit mir das Waffenschmieden beizubringen, falls ich ihm 40 Brocken Erz besorge.");
	B_LogEntry			(CH1_LearnSmith,	"Gotmar je připraven mě zasvětit do kovářství, pokud mu obstarám 40 nugetů magické rudy.");
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WHEREORE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WHEREORE_Condition;
	information		= Info_Gotmar_WHEREORE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Woher bekomme ich Erz?";
	description		= "Kde získám rudu?";
};

func int	Info_Gotmar_WHEREORE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	||	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WHEREORE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_01"); //Woher bekomme ich Erz?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_01"); //Kde získám rudu?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_02"); //Du kannst das Erz zurückholen, das mir abhanden gekommen ist.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_02"); //Mohl bys mi přinést rudu, která se mi ztratila.
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_03"); //Wie meinst du das?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_03"); //Jak to myslíš?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_04"); //Habe ich schon erwähnt, dass wir von Dieben und Schmarotzer umgeben sind? Wahrscheinlich hat dieser Gauner Edo sich an meinem Erz bedient.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_04"); //Copak jsem to už neříkal, že jsme obklopeni zloději a příživníky? Tenhle parchant Edo si určitě rád na moji rudu sáhnul.
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_05"); //Wo finde ich diesen Edo?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE_15_05"); //Kde najdu tohohle Eda?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_06"); //Er hängt meistens am Marktplatz herum.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE_04_06"); //Většinou se potuluje na tržišti.

//	B_LogEntry			(CH1_LearnSmith,	"Ein Mann namens Edo soll seine Kisten mit geklautem Erz gefüllt haben. Er ist am Marktplatz zu finden.");
	B_LogEntry			(CH1_LearnSmith,	"Chlápek jménem Edo si naplnil svoje bedny ukradenou rudou. Najdu ho na tržiště.");
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE2
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WHEREORE2 (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WHEREORE2_Condition;
	information		= Info_Gotmar_WHEREORE2_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wie kann ich sonst noch an Erz kommen?";
	description		= "Jak se ještě dostanu k rudě?";
};

func int	Info_Gotmar_WHEREORE2_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WHEREORE2_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE2_15_01"); //Wie kann ich sonst noch an Erz kommen?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE2_15_01"); //Jak se ještě dostanu k rudě?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_02"); //Normalerweise in der Mine.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_02"); //Obvykle v dole.
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE2_15_03"); //Mine? Welche Mine?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE2_15_03"); //V dole? V jakém dole?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_04"); //Diego sagt, dass diese Mine zur Zeit der magischen Barriere verlassen und gesperrt war.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_04"); //Diego říká, že to je důl, který byl za časů Bariéry opuštěný a uzavřený.
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_05"); //Dort wurden neue Erzadern gefunden. Aber seit ein paar Tagen treiben sich Orks dort herum und die Bergleute haben sich in der Mine verschanzt.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_05"); //Našly se tam nové žíly magické rudy. Ale před několika dny se tam v okolí objevili skřeti, takže se horníci uvnitř zahrabali.
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_06"); //Die werden zur Zeit niemand in die Mine lassen!
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE2_04_06"); //Takže ti do dolu ještě nějakou dobu nikoho nepustí!
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREORE3
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WHEREORE3 (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WHEREORE3_Condition;
	information		= Info_Gotmar_WHEREORE3_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Gibt's sonst keine Möglichkeit an Erz zu kommen?";
	description		= "Takže už přece není žádná další možnost, jak se dostat k rudě?";
};

func int	Info_Gotmar_WHEREORE3_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE2)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WHEREORE3_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE3_15_01"); //Gibt's sonst keine Möglichkeit an Erz zu kommen?
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE3_15_01"); //Takže už přece není žádná další možnost, jak se dostat k rudě?
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_02"); //Da wäre noch eine....
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_02"); //No, ještě bu tu byla...
//	AI_Output			(hero, self,"Info_Gotmar_WHEREORE3_15_03"); //WELCHE??
	AI_Output			(hero, self,"Info_Gotmar_WHEREORE3_15_03"); //JAKÁ??
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_04"); //Kleinere Erzadern findet man auch in manchen Höhlen. In der Nähe des Haupttores gibt es eine.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_04"); //Menší rudné žíly lze najít i v některých jeskyních. Jedna je kousek od hlavní brány.
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_05"); //Es ist leider ne Molerat-Höhle, sonst hätte ich mir das Erz schon selbst geholt.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_05"); //Je to bohužel krysokrtí jeskyně, jinak bych si z ní rudu přinesl sám.
//	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_06"); //Aber vielleicht kannst du die Viecher ja vertreiben.
	AI_Output			(self, hero,"Info_Gotmar_WHEREORE3_04_06"); //Ale třeba bys odtamtud mohl ty bestie vypudit.

//	B_LogEntry			(CH1_LearnSmith,	"Es soll eine kleine Erzader in einer Molerat-Höhle in der Nähe des Lager-Haupttores geben.");
	B_LogEntry			(CH1_LearnSmith,	"V krysokrtí jeskyni nedaleko od hlavní brány tábora by měla být rudná žilka.");
};

///////////////////////////////////////////////////////////////////////
//	Info PICK
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_PICK (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_PICK_Condition;
	information		= Info_Gotmar_PICK_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich werde mir diese Höhle mal anschauen!";
	description		= "Podívám se na tuhle jeskyni!";
};

func int	Info_Gotmar_PICK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE3)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_PICK_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_PICK_15_01"); //Ich werde mir die Höhle mal anschauen!
	AI_Output			(hero, self,"Info_Gotmar_PICK_15_01"); //Podívám se na tuhle jeskyni!
//	AI_Output			(self, hero,"Info_Gotmar_PICK_04_02"); //Mann, das ist gut! Vergiss nicht, eine Spitzhacke mitzunehmen.
	AI_Output			(self, hero,"Info_Gotmar_PICK_04_02"); //Chlape, to by bylo skvělé! Nezapomeň si s sebou vzít krumpáč.
};

///////////////////////////////////////////////////////////////////////
//	Info PICK2
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_PICK2 (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_PICK2_Condition;
	information		= Info_Gotmar_PICK2_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Kannst du mir ne Spitzhacke geben?";
	description		= "Neměl bys pro mě krumpáč?";
};

func int	Info_Gotmar_PICK2_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_PICK)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_PICK2_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_PICK2_15_01"); //Kannst du mir ne Spitzhacke geben?
	AI_Output			(hero, self,"Info_Gotmar_PICK2_15_01"); //Neměl bys pro mě krumpáč?
//	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_02"); //Ich bin Schmied und kein Erzschürfer.
	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_02"); //Já jsem kovář, ne nějaký rudař.
//	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_03"); //Frag die Schürfer am Arenaplatz.
	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_03"); //Zeptej se rudařů kolem arény.
//	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_04"); //Ich könnte mir vorstellen, daß Sylvester seine Hacke verkauft.
	AI_Output			(self, hero,"Info_Gotmar_PICK2_04_04"); //Dovedu si představit, že Sylvester by svůj krumpáč prodal.

//	B_LogEntry			(CH1_LearnSmith,	"Für's Erzhacken brauche ich eine Spitzhacke. Der Schürfer Sylvester am Arenaplatz soll eine verkaufen.");
	B_LogEntry			(CH1_LearnSmith,	"Na těžbu rudy budu potřebovat krumpáč. Kopáč Sylvestr u arény by mi měl jeden prodat.");
};

///////////////////////////////////////////////////////////////////////
//	Info TOFEWORE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_TOOFEWORE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_TOOFEWORE_Condition;
	information		= Info_Gotmar_TOOFEWORE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich habe hier etwas Erz.";
	description		= "Mám tady nějakou rudu.";
};

func int	Info_Gotmar_TOOFEWORE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_ENOUGHORE)
	&&	(Npc_HasItems(hero, ItMi_OreNugget) >= 1)
	&&	(Npc_HasItems(hero, ItMi_OreNugget) < GOTMAR_FAVOR_ORE)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_TOOFEWORE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_TOOFEWORE_15_01"); //Ich habe hier etwas Erz.
	AI_Output			(hero, self,"Info_Gotmar_TOOFEWORE_15_01"); //Mám tady nějakou rudu.
//	AI_Output			(self, hero,"Info_Gotmar_TOOFEWORE_04_02"); //Das ist zu wenig, Mann! Komm wieder wenn du 40 Brocken hast!
	AI_Output			(self, hero,"Info_Gotmar_TOOFEWORE_04_02"); //Tohle je málo, chlape! Přijď znovu až budeš mít 40 nugetů!
};

///////////////////////////////////////////////////////////////////////
//	Info ENOUGHORE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_ENOUGHORE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_ENOUGHORE_Condition;
	information		= Info_Gotmar_ENOUGHORE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe deine 40 Brocken Erz, hier nimm!";
	description		= "Mám tu těch 40 hrudek rudy, vezmi si je!";
};

func int	Info_Gotmar_ENOUGHORE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_DOFAVOR)
	&&	(Npc_HasItems(hero, ItMi_OreNugget) >= GOTMAR_FAVOR_ORE)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_ENOUGHORE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_ENOUGHORE_15_01"); //Ich habe deine 40 Brocken Erz, hier nimm!
	AI_Output			(hero, self,"Info_Gotmar_ENOUGHORE_15_01"); //Mám tu těch 40 hrudek rudy, vezmi si je!
	B_GiveInvItems		(hero, self, ItMi_OreNugget, GOTMAR_FAVOR_ORE);
//	AI_Output			(self, hero,"Info_Gotmar_ENOUGHORE_04_02"); //Verdammt gut, Mann!
	AI_Output			(self, hero,"Info_Gotmar_ENOUGHORE_04_02"); //To je sakra dobrý, chlape!
//	AI_Output			(self, hero,"Info_Gotmar_ENOUGHORE_04_03"); //Du hast mir einiges an Arbeit erspart.
	AI_Output			(self, hero,"Info_Gotmar_ENOUGHORE_04_03"); //Ušetřil jsi mi strašný práce.

	B_GiveXP			(XP_BroughtFirstOre);
};


///////////////////////////////////////////////////////////////////////
//	Info EDO
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_EDO (C_INFO)
{
	npc				= WRK_200_Gotmar;
	nr				= 30;
	condition		= Info_Gotmar_EDO_Condition;
	information		= Info_Gotmar_EDO_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.";
	description		= "Edo si myslí, že by sis měl hlídat, co říkáš.";
};

func int	Info_Gotmar_EDO_Condition()
{
	if	Gotmar_SCBetrayed
	{
		return TRUE;
	};
};

func void	Info_Gotmar_EDO_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_EDO_15_01"); //Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.
	AI_Output			(hero, self,"Info_Gotmar_EDO_15_01"); //Edo si myslí, že by sis měl hlídat, co říkáš.
//	AI_Output			(self, hero,"Info_Gotmar_EDO_04_02"); //Du Trottel hast ihm gesagt, daß ich ihn für einen Dieb halte?!
	AI_Output			(self, hero,"Info_Gotmar_EDO_04_02"); //Tys mu řekl, že ho mám za zloděje, ty pitomče?!
//	AI_Output			(self, hero,"Info_Gotmar_EDO_04_03"); //Kannst wohl garnichts für dich behalten, was? Wir sind geschiedene Leute, Mann!
	AI_Output			(self, hero,"Info_Gotmar_EDO_04_03"); //Ty si fakt nemůžeš nechat nic pro sebe, co? My dva jsme spolu skončili, chlape!

	Gotmar_OldAttitude = Npc_GetPermAttitude(self, hero);
	B_SetAttitude		(self, ATT_ANGRY);

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BETRAYED
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_BETRAYED (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_BETRAYED_Condition;
	information		= Info_Gotmar_BETRAYED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	Info_Gotmar_BETRAYED_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_EDO)
	&&	Gotmar_SCBetrayed
	&&	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_BETRAYED_Info()
{
//	AI_Output			(self, hero,"Info_Gotmar_BETRAYED_04_01"); //Ich will nichts mehr mit dir zu tun haben!
	AI_Output			(self, hero,"Info_Gotmar_BETRAYED_04_01"); //Už s tebou nechci nic mít!

//	Info_AddChoice		(Info_Gotmar_BETRAYED, "Dann eben nicht!", Info_Gotmar_BETRAYED_NO );
	Info_AddChoice		(Info_Gotmar_BETRAYED, "Tak teda nic!", Info_Gotmar_BETRAYED_NO );
	if	(Npc_HasItems(hero, ItMi_Silver) >= 50)
	{
//		Info_AddChoice	(Info_Gotmar_BETRAYED, "Hey, das mit Edo war wirklich keine Absicht (50 Silber anbieten)", Info_Gotmar_BETRAYED_SORRY );
		Info_AddChoice	(Info_Gotmar_BETRAYED, "Hej, to s tím Edem fakt nebylo úmyslně! (Nabídnout 50 stříbrných)", Info_Gotmar_BETRAYED_SORRY );
	};
};
func void Info_Gotmar_BETRAYED_SORRY ()
{
	Info_ClearChoices	(Info_Gotmar_BETRAYED);
//	AI_Output			(hero, self, "Info_Gotmar_BETRAYED_SORRY_15_01"); //Hey, das mit Edo war wirklich keine Absicht
	AI_Output			(hero, self, "Info_Gotmar_BETRAYED_SORRY_15_01"); //Hej, to s tím Edem fakt nebylo úmyslně!
	B_GiveInvItems		(hero, self, ItMi_Silver, 50);
//	AI_Output			(self, hero, "Info_Gotmar_BETRAYED_SORRY_04_02"); //Mann, pass in Zukunft besser auf, was du anderen Leuten über mich erzählst!
	AI_Output			(self, hero, "Info_Gotmar_BETRAYED_SORRY_04_02"); //Chlape, tak si ale příště dávej bacha, co lidem o mně vyprávíš!
	Gotmar_SCBetrayed	= FALSE;
	B_SetAttitude		(self, Gotmar_OldAttitude);
	AI_StopProcessInfos	(self);
};

func void Info_Gotmar_BETRAYED_NO ()
{
	Info_ClearChoices	(Info_Gotmar_BETRAYED);
//	AI_Output			(hero, self, "Info_Gotmar_BETRAYED_NO_15_01"); //Dann eben nicht!
	AI_Output			(hero, self, "Info_Gotmar_BETRAYED_NO_15_01"); //Tak teda nic!
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info TEACHBELLOW
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_TEACHBELLOW (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_TEACHBELLOW_Condition;
	information		= Info_Gotmar_TEACHBELLOW_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LearnSmith_1,	LPCOST_TALENT_SMITH_1,	0);
};

func int	Info_Gotmar_TEACHBELLOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_ENOUGHORE)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_SMITH) < 1)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_TEACHBELLOW_Info()
{
	if	B_GiveSkill(hero, NPC_TALENT_SMITH, 1, LPCOST_TALENT_SMITH_1)
	{
//		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_01"); //Also gut, ich werde dir zeigen wie man schmiedet.
		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_01"); //Tak dobrá, ukážu ti, jak se ková.
//		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_02"); //Aber zuerst brauchst du einige Werkzeuge. Eine Zange und einen Schmiedehammer.
		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_02"); //Ale nejdřív potřebuješ správné nářadí. Kleště a kovářské kladivo.
//		AI_Output		(hero, self,"Info_Gotmar_TEACHBELLOW_15_03"); //Wo bekomme ich die her?
		AI_Output		(hero, self,"Info_Gotmar_TEACHBELLOW_15_03"); //Jak se tu k nim dostanu?
//		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_04"); //Ich kann die Werkzeuge verkaufen, aber das ist nicht billig.
		AI_Output		(self, hero,"Info_Gotmar_TEACHBELLOW_04_04"); //Můžu ti to nářadí prodat, ale nebude to levné.

		Gotmar_TeachSmith = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HAMMER
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_HAMMER (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_HAMMER_Condition;
	information		= Info_Gotmar_HAMMER_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Kannst du mir die Werkzeuge nicht ausleihen?";
	description		= "Nemohl bys mi to nářadí půjčit?";
};

func int	Info_Gotmar_HAMMER_Condition()
{
	if	Gotmar_TeachSmith
	&&	(!Npc_HasItems(hero, ItMi_Pliers) || !Npc_HasItems(hero, ItMw_Sledgehammer))
	{
		return TRUE;
	};
};

func void	Info_Gotmar_HAMMER_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_HAMMER_15_01"); //Kannst du mir die Werkzeuge nicht ausleihen?
	AI_Output			(hero, self,"Info_Gotmar_HAMMER_15_01"); //Nemohl bys mi to nářadí půjčit?
//	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_02"); //Mann, du bist gut. In einem Lager voller Diebe und Betrüger verleihe ich mit Sicherheit nichts.
	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_02"); //Chlape, ty jseš skvělej. V táboře plném zlodějů a zrádců nepůjčím nikomu určitě nic.
//	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_03"); //Probier es doch mal bei Bartok in der Burgschmiede.
	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_03"); //Ale můžeš to zkusit v kovárně u Bartoka.
//	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_04"); //Er ist der zweite Schmied hier im Lager... oder besser gesagt, er WAR der zweite Schmied.
	AI_Output			(self, hero,"Info_Gotmar_HAMMER_04_04"); //Je to druhý kovář tady v táboře... nebo lépe řečeno: BYL druhý kovář.
};

///////////////////////////////////////////////////////////////////////
//	Info OTHERSMITH
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_OTHERSMITH (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_OTHERSMITH_Condition;
	information		= Info_Gotmar_OTHERSMITH_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Was ist mit ihm passiert?";
	description		= "Co se mu stalo?";
};

func int	Info_Gotmar_OTHERSMITH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_HAMMER)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_OTHERSMITH_Info()
{
	Gotmar_TeachSmith = TRUE;

//	AI_Output			(hero, self,"Info_Gotmar_OTHERSMITH_15_01"); //Was ist mit ihm passiert?
	AI_Output			(hero, self,"Info_Gotmar_OTHERSMITH_15_01"); //Co se mu stalo?
//	AI_Output			(self, hero,"Info_Gotmar_OTHERSMITH_04_02"); //Die Krankheit hat ihn erwischt. Jetzt ist er bei den Heilern im Viertel der Kranken.
	AI_Output			(self, hero,"Info_Gotmar_OTHERSMITH_04_02"); //Dostala ho ta nemoc. Je teď u léčitelů ve čtvrti nemocných.
//	AI_Output			(self, hero,"Info_Gotmar_OTHERSMITH_04_03"); //Ich kann mir nicht vorstellen, daß er seine Werkzeuge dorthin mitgenommen hat.
	AI_Output			(self, hero,"Info_Gotmar_OTHERSMITH_04_03"); //Nedovedu si představit, že by si tam svoje nářadí vzal s sebou.

//	B_LogEntry			(CH1_LearnSmith,	"In der Schmiede im Burghof könnten noch Werkzeuge des letzten Schmiedes herumliegen.");
	B_LogEntry			(CH1_LearnSmith,	"V kovárně na nádvoří se možná ještě budou povalovat nástroje po posledním kováři.");
};

///////////////////////////////////////////////////////////////////////
//	Info PLAGUE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_PLAGUE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_PLAGUE_Condition;
	information		= Info_Gotmar_PLAGUE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Was ist das für eine Krankheit?";
	description		= "Co to je za nemoc?";
};

func int	Info_Gotmar_PLAGUE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_PLAGUE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_PLAGUE_15_01"); //Was ist das für eine Krankheit?
	AI_Output			(hero, self,"Info_Gotmar_PLAGUE_15_01"); //Co to je za nemoc?
//	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_02"); //Die armen Kerle magern total ab und reden wirres Zeug.
	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_02"); //Ti ubožáci totálně vychrtnou a začnou blábolit divné věci.
//	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_03"); //Zwischen dem Arbeiterviertel hier und dem Händlerviertel, sind ein paar Hütten für sie aufgestellt worden.
	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_03"); //Mezi Dělnickou čtvrtí zde a Obchodnickou čtvrtí se pro ně postavilo několik chatrčí.
//	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_04"); //Dort gibt es ein paar Heiler, die die Krankheit erforschen.
	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_04"); //Je tam pár léčitelů, kteří tu nemoc zkoumají.
//	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_05"); //Aber halte dich besser fern von ihnen. Ein vernünftiger Mann hat dort nichts zu schaffen!
	AI_Output			(self, hero,"Info_Gotmar_PLAGUE_04_05"); //Ale radši se od nich drž dále. Rozumný člověk tam nemá co dělat!
};

///////////////////////////////////////////////////////////////////////
//	Info AFTERBELLOW
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_AFTERBELLOW (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_AFTERBELLOW_Condition;
	information		= Info_Gotmar_AFTERBELLOW_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?";
	description		= "Už mám kovářské nářadí. Co dál?";
};

func int	Info_Gotmar_AFTERBELLOW_Condition()
{
	if	Gotmar_TeachSmith
	&&	Npc_HasItems(hero, ItMi_Pliers)
	&&	Npc_HasItems(hero, ItMw_Sledgehammer)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_AFTERBELLOW_Info()
{

//	AI_Output			(hero, self,"Info_Gotmar_AFTERBELLOW_15_01"); //Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?
	AI_Output			(hero, self,"Info_Gotmar_AFTERBELLOW_15_01"); //Už mám kovářské nářadí. Co dál?
//	AI_Output			(self, hero,"Info_Gotmar_AFTERBELLOW_04_02"); //Geh rüber zum Schmelzofen. Halte dort genügend Erzbrocken mit der Zange hinein.
	AI_Output			(self, hero,"Info_Gotmar_AFTERBELLOW_04_02"); //Jdi ke kovářské peci. Podrž v ní kleštěmi dostatečně dlouho hrudku rudy.
//	AI_Output			(self, hero,"Info_Gotmar_AFTERBELLOW_04_03"); //So stellst du Roheisen her, den du dann weiterverarbeiten kannst.
	AI_Output			(self, hero,"Info_Gotmar_AFTERBELLOW_04_03"); //Tak si vyrobíš surové železo, které můžeš potom dále zpracovávat.

//	B_LogEntry			(CH1_LearnSmith,	"Zum Schmieden braucht man ein Roheisen. Das wird am Schmelzofen gemacht. Man braucht dazu Erzbrocken und eine Zange.");
	B_LogEntry			(CH1_LearnSmith,	"Ke kování je potřeba surové železo. To se vyrábí v kovářské peci. Potřeba jsou kleště a hrudka rudy.");
};

///////////////////////////////////////////////////////////////////////
//	Info RAWIRON
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_RAWIRON (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_RAWIRON_Condition;
	information		= Info_Gotmar_RAWIRON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe das Roheisen!";
	description		= "Mám surové železo!";
};

func int	Info_Gotmar_RAWIRON_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&&	Npc_HasItems (hero, ItMi_RawIron)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_RAWIRON_Info()
{
	Gotmar_TeachSmith =		TRUE;

//	AI_Output				(hero, self,"Info_Gotmar_RAWIRON_15_01"); //Ich habe das Roheisen!
	AI_Output				(hero, self,"Info_Gotmar_RAWIRON_15_01"); //Mám surové železo!
//	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_02"); //Zeig mal her.
	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_02"); //Ukaž.

	AI_CreateItemInSlot		(self,	"ZS_RIGHTHAND", ItMi_RawIron);
	AI_PlayAni				(self,	"T_1HSINSPECT");
	AI_RemoveItemFromSlot	(self,	"ZS_RIGHTHAND");

//	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_03"); //Sehr gut! Damit können wir weitermachen!
	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_03"); //Velmi dobře! S tím můžeme dále pracovat!
//	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_04"); //Wenn du später zweihändige Waffen schmiedest, musst du mehr Erz verwenden und ein langes Roheisen herstellen.
	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_04"); //Až budeš později kovat obouruční zbraně, musíš použít více rudy a vyrobit z ní delší železný prut.
//	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_05"); //Aber nun zurück zu deinem Roheisen.
	AI_Output				(self, hero,"Info_Gotmar_RAWIRON_04_05"); //Ale nyní zpět k tvému železu.

	B_GiveXP				(XP_FirstRawIron);
};

///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_FIRE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_FIRE_Condition;
	information		= Info_Gotmar_FIRE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Was mache ich jetzt mit dem Roheisen?";
	description		= "Co mám teď dělat s tím železem?";
};

func int	Info_Gotmar_FIRE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_RAWIRON)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_FIRE_Info()
{
	Gotmar_TeachSmith = TRUE;

//	AI_Output			(hero, self,"Info_Gotmar_FIRE_15_01"); //Was mache ich jetzt mit dem Roheisen?
	AI_Output			(hero, self,"Info_Gotmar_FIRE_15_01"); //Co mám teď dělat s tím železem?
//	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_02"); //Bevor du das Eisen schmieden kannst, muss es zum Glühen gebracht werden.
	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_02"); //Ještě než začneš železo kovat, musíš jej rozžhavit.
//	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_03"); //Geh rüber zum Schmiedefeuer und fache es mit dem Blasebalg an.
	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_03"); //Jdi ke kovářské výhni a rozpal ji měchem.
//	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_04"); //Dann kannst du das Roheisen zum Glühen bringen.
	AI_Output			(self, hero,"Info_Gotmar_FIRE_04_04"); //Potom můžeš kout surové železo.

//	B_LogEntry			(CH1_LearnSmith,	"Nun muss das Roheisen in ein Schmiedefeuer gehalten und zum Glühen gebracht werden.");
	B_LogEntry			(CH1_LearnSmith,	"Teď musím rozžhavit surové železo v kovářské výhni.");

	TA_BeginOverlay		(self);
	TA_Stay				(00,00,00,30,GOTMAR_WP_WAIT);
	TA_EndOverlay		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOTIRON
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_HOTIRON (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_HOTIRON_Condition;
	information		= Info_Gotmar_HOTIRON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe das Roheisen erhitzt, was jetzt?";
	description		= "Rozpálil jsem surové železo. Co teď?";
};

func int	Info_Gotmar_HOTIRON_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SWORDBLADE)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SHARP)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&&	Npc_HasItems (hero, ItMi_HotIron)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_HOTIRON_Info()
{
	Gotmar_TeachSmith = TRUE;

//	AI_Output			(hero, self,"Info_Gotmar_HOTIRON_15_01"); //Ich habe das Roheisen erhitzt, was jetzt?
	AI_Output			(hero, self,"Info_Gotmar_HOTIRON_15_01"); //Rozpálil jsem surové železo. Co teď?
//	AI_Output			(self, hero,"Info_Gotmar_HOTIRON_04_02"); //Sehr gut, nun kommt der schwierige Teil.
	AI_Output			(self, hero,"Info_Gotmar_HOTIRON_04_02"); //Velmi dobře, teď přichází ta obtížná část.
//	AI_Output			(self, hero,"Info_Gotmar_HOTIRON_04_03"); //Lege das glühende Roheisen auf den Amboss da drüben, besorg dir einen Schmiedehammer und hämmere es zu einer flachen, zweischneidigen Klinge.
	AI_Output			(self, hero,"Info_Gotmar_HOTIRON_04_03"); //Polož rozžhavené železo tamhle na kovadlinu, chop se kovářského kladiva a vytepej plochou, dvousečnou čepel.

	B_GiveXP			(XP_FirstHotRawIron);
//	B_LogEntry			(CH1_LearnSmith,	"Das glühende Roheisen muss nun auf dem Amboss zu einer Schwertklinge geschmiedet werden. Allerdings brauche ich dazu einen Schmiedehammer.");
	B_LogEntry			(CH1_LearnSmith,	"Rozžhavené železo se teď musí vytvarovat na kovadlině do tvaru čepele meče. K tomu každopádně potřebuji kovářské kladivo.");

	TA_BeginOverlay		(self);
	TA_Stay				(00,00,00,30,GOTMAR_WP_WAIT);
	TA_EndOverlay		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SWORDBLADE
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_SWORDBLADE (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_SWORDBLADE_Condition;
	information		= Info_Gotmar_SWORDBLADE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe eine Schwertklinge geschmiedet!";
	description		= "Ukoval jsem čepel meče!";
};

func int	Info_Gotmar_SWORDBLADE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SHARP)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&&	Npc_HasItems (hero, ItMi_HotSwordblade)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_SWORDBLADE_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_SWORDBLADE_15_01"); //Ich habe eine Schwertklinge geschmiedet!
	AI_Output			(hero, self,"Info_Gotmar_SWORDBLADE_15_01"); //Ukoval jsem čepel meče!
//	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_02"); //Ahhhh...
	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_02"); //Ahhhh...
//	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_03"); //Das sieht doch schon fast wie eine richtige Waffe aus.
	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_03"); //To už ale skoro vypadá jako opravdová zbraň.
//	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_04"); //Aber das Eisen ist noch zu weich. Du musst es härten.
	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_04"); //Ale to železo je pořád moc měkké. Musíš ho zakalit.
//	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_05"); //Steck die glühende Schwertklinge in den Wassereimer dort drüben.
	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_05"); //Strč rozžhavenou čepel támhle do vědra s vodou.
//	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_06"); //Das kühlt die Waffe ab, und gibt ihr die nötige Härte!
	AI_Output			(self, hero,"Info_Gotmar_SWORDBLADE_04_06"); //To tu zbraň zchladí a dá jí nutnou tvrdost!

	B_GiveXP			(XP_FirstHotSwordblade);
//	B_LogEntry			(CH1_LearnSmith,	"Die glühende Schwertklinge muss in einem Wassereimer abgekühlt und gehärtet werden. Wenigstens brauche ich dafür nicht wieder ein neues Werkzeug.");
	B_LogEntry			(CH1_LearnSmith,	"Rozžhavená čepel musí být ochlazena a ztvrzena v kýblu s vodou. Alespoň k tomu už ale nepotřebuju nějaký další nástroj.");

	TA_BeginOverlay		(self);
	TA_Stay				(00,00,00,30,GOTMAR_WP_WAIT);
	TA_EndOverlay		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SHARP
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_SHARP (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_SHARP_Condition;
	information		= Info_Gotmar_SHARP_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe die Schwertklinge abgekühlt!";
	description		= "Zchladil jsem tu čepel!";
};

func int	Info_Gotmar_SHARP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&&	Npc_HasItems (hero, ItMi_Swordblade)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_SHARP_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_SHARP_15_01"); //Ich habe die Schwertklinge abgekühlt!
	AI_Output			(hero, self,"Info_Gotmar_SHARP_15_01"); //Zchladil jsem tu čepel!
//	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_02"); //Sieht gut aus!
	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_02"); //Vypadá to dobře!
//	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_03"); //Der letzte Arbeitsschritt findet am Schleifstein statt.
	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_03"); //Poslední krok se odehraje na brusu.
//	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_04"); //Hier wird die Klinge geschärft. Sei vorsichtig damit, sonst versaust du den ganzen Rohling.
	AI_Output			(self, hero,"Info_Gotmar_SHARP_04_04"); //Zde je čepel nabroušena. Buď s tím opatrný, jinak s tím zničíš celý polotovar.

	B_GiveXP			(XP_FirstSwordblade);
//	B_LogEntry			(CH1_LearnSmith,	"Zuletzt muss die abgekühlte Klinge am Schleifstein geschliffen werden.");
	B_LogEntry			(CH1_LearnSmith,	"Na závěr se musí zchlazená čepel nabrousit na brusu.");

	TA_BeginOverlay		(self);
	TA_Stay				(00,00,00,30,GOTMAR_WP_WAIT);
	TA_EndOverlay		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SHORTSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_SHORTSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_SHORTSWORD_Condition;
	information		= Info_Gotmar_SHORTSWORD_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "FERTIG! Hier ist mein erstes Schwert.";
	description		= "HOTOVO! Tady je můj první meč.";
};

func int	Info_Gotmar_SHORTSWORD_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_AFTERBELLOW)
	&&	Npc_HasItems (hero, ItMw_Shortsword)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_SHORTSWORD_Info()
{
//	AI_Output			(hero, self,"Info_Gotmar_SHORTSWORD_15_01"); //FERTIG! Hier ist mein erstes Schwert.
	AI_Output			(hero, self,"Info_Gotmar_SHORTSWORD_15_01"); //HOTOVO! Tady je můj první meč.
	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_02"); //Ukaž mi ho...
//	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_02"); //Laß mich mal sehen...

	AI_CreateItemInSlot		(self,	"ZS_RIGHTHAND", ItMw_Shortsword);
	AI_PlayAni				(self,	"T_1HSINSPECT");
	AI_RemoveItemFromSlot	(self,	"ZS_RIGHTHAND");

//	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_03"); //Ganz passabel!
	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_03"); //Docela ujde!
	//---- XP-Ausgleich falls der Spieler sich keine Einzelanweisungen geholt hat!
	var int		xp;
	if	!Npc_KnowsInfo(hero, Info_Gotmar_RAWIRON)		{	xp = xp + XP_FirstRawIron;			};
	if	!Npc_KnowsInfo(hero, Info_Gotmar_HOTIRON)		{	xp = xp + XP_FirstHotRawIron;		};
	if	!Npc_KnowsInfo(hero, Info_Gotmar_SWORDBLADE)	{	xp = xp + XP_FirstHotSwordblade;	};
	if	!Npc_KnowsInfo(hero, Info_Gotmar_SHARP)			{	xp = xp + XP_FirstSwordblade;		};

	B_GiveXP			(xp + XP_FirstShortsword);
//	B_LogEntry			(CH1_LearnSmith,	"Unglaublich, ich habe meine erste Waffe geschmiedet!");
	B_LogEntry			(CH1_LearnSmith,	"Neuvěřitelné, vykoval jsem svou první zbraň!");

//	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_04"); //Nun weisst du, wie man Kurzschwerter herstellt.
	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_04"); //Teď už víš, jak se vyrábí krátký meč.
//	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_05"); //Man kann aus einem Waffenrohling natürlich auch andere Schwerter, Äxte oder Stumpfwaffen herstellen.
	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_05"); //Z polotovaru můžeš samozřejmě vyrobit i jiné meče, sekery nebo tupé zbraně.
//	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_06"); //Das Prinzip bleibt immer das gleiche.
	AI_Output			(self, hero,"Info_Gotmar_SHORTSWORD_04_06"); //Princip zůstává pořád stejný.

	Gotmar_LearnDay = B_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Info WANTLONGSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WANTLONGSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WANTLONGSWORD_Condition;
	information		= Info_Gotmar_WANTLONGSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Wie schmiedet man andere Waffen?";
	description		= "Jak se kovají jiné zbraně?";
};

func int	Info_Gotmar_WANTLONGSWORD_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_SHORTSWORD)
	&&	!Gotmar_LearnLongsword
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WANTLONGSWORD_Info()
{
//	AI_Output				(hero, self, "Info_Gotmar_WANTLONGSWORD_15_01"); //Wie schmiedet man andere Waffen?
	AI_Output				(hero, self, "Info_Gotmar_WANTLONGSWORD_15_01"); //Jak se kovají jiné zbraně?

	if		(B_GetDay() < (Gotmar_LearnDay+GOTMAR_WAIT_LONGSWORD))
	{
//		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_02"); //Dneska mám ještě moc práce. Zkus se zastavit někdy jindy!
		if	!Gotmar_AskedForLongsword
		{
//			B_LogEntry		(CH1_LearnSmith, "Gotmar hat heute keine Zeit, mir die Herstellung eines besseren Schwertes beizubringen. Ich sollte ihn an einem anderen Tag nochmal fsuchen.!");
			B_LogEntry		(CH1_LearnSmith, "Gotmar dnes už nemá čas, aby mi ukázal, jako kovat lepší meče. Měl bych ho vyhledat v nějaký jiný den!");
			Gotmar_AskedForLongsword = TRUE;
		};
		AI_StopProcessInfos	(self);
	}
	else
	{
//		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_03"); //Heute sieht es gut aus. Aber wenn du wissen willst, wie man ein Langschwert schmiedet, musst du mir erst bei meiner Arbeit helfen.
		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_03"); //Dneska to vypadá dobře. Ale jestli chceš vědět, jak se ková dlouhý meč, musíš mi nejprve pomoci s mojí prací.
//		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_04"); //Mein Gehilfe ist mir vor einiger Zeit weggelaufen.
		AI_Output			(self, hero, "Info_Gotmar_WANTLONGSWORD_04_04"); //Můj pomocník už před nějakou dobou utekl.

		Gotmar_LearnLongsword = TRUE;
	};
};



///////////////////////////////////////////////////////////////////////
//	Info WORKFORLONGSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WORKFORLONGSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WORKFORLONGSWORD_Condition;
	information		= Info_Gotmar_WORKFORLONGSWORD_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wie kann ich dir helfen?";
	description		= "Jak ti mohu pomoci?";
};

func int	Info_Gotmar_WORKFORLONGSWORD_Condition()
{
	if	Gotmar_LearnLongsword
	&&	!Knows_Longsword
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WORKFORLONGSWORD_Info()
{
//	AI_Output				(hero, self,"Info_Gotmar_WORKFORLONGSWORD_15_01"); //Wie kann ich dir helfen?
	AI_Output				(hero, self,"Info_Gotmar_WORKFORLONGSWORD_15_01"); //Jak ti mohu pomoci?
//	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_02"); //Hier hast du etwas Erz! Mein Bestand an Kurzschwertern ist sehr klein geworden.
	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_02"); //Tady máš trochu rudy! Moje zásoba krátkých mečů se dost ztenčila.
	B_GiveInvItems			(self, hero, ItMi_OreNugget, GOTMAR_ORE_LONGSWORD);
//	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_03"); //Mach mir fünf dieser Waffen, dann zeige ich dir, wie man ein Langschwert herstellt.
	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_03"); //Udělej pro mě pět takových zbraní, pak ti ukážu, jak se vyrábí dlouhý meč.
//	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_04"); //Ach nochwas!
	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_04"); //Ach, ještě jedna věc!
//	AI_Output				(hero, self,"Info_Gotmar_WORKFORLONGSWORD_15_05"); //Was?
	AI_Output				(hero, self,"Info_Gotmar_WORKFORLONGSWORD_15_05"); //Co?
//	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_06"); //Das Erz wird nicht ganz reichen. Den Rest musst zu irgendwo auftreiben.
	AI_Output				(self, hero,"Info_Gotmar_WORKFORLONGSWORD_04_06"); //Ta ruda ti nevystačí. Zbytek si budeš muset sehnat někde jinde.

//	B_LogEntry				(CH1_LearnSmith, "Gotmar will mir die Herstellung von Langschwertern zeigen, wenn ich ihm etwas zur Hand gehe. Er will 5 Kurzschwerter von mir haben.");
	B_LogEntry				(CH1_LearnSmith, "Gormar mi ukáže, jak se vyrábí dlouhé meče, pokud mu budu trochu k ruce. Chce ode mě získat 5 krátkých mečů.");

	AI_StopProcessInfos		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SMITHHELPER
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_SMITHHELPER		(C_INFO)
{
	npc		 	= 	WRK_200_Gotmar;
	condition	 = 	WRK_200_Gotmar_SMITHHELPER_Condition;
	information	 = 	WRK_200_Gotmar_SMITHHELPER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Du hattest einen Gehilfen?";
	description	 = 	"Ty jsi měl pomocníka?";
};

func int WRK_200_Gotmar_SMITHHELPER_Condition ()
{
	if	Gotmar_LearnLongsword
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_SMITHHELPER_Info ()
{
//	AI_Output			(hero, self, "WRK_200_SMITHHELPER_15_01"); //Du hattest einen Gehilfen?
	AI_Output			(hero, self, "WRK_200_SMITHHELPER_15_01"); //Ty jsi měl pomocníka?
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_02"); //Ja, eigentlich ein ordentlicher Kerl, mit dem Herz auf dem rechten Fleck.
	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_02"); //Jo, byl to takový obyčejný chlápek, se srdcem na správném místě.
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_03"); //Er will nicht bis zum Ende seines Lebens den Blasebalg treten, hat er mir gesagt.
	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_03"); //Řekl mi, že se už do konce svého života měchu nechce ani dotknout.
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_04"); //Wollte lieber Gladiator werden und in der Arena kämpfen. Nutzlose Zeitverschwendung!
	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_04"); //Raději by byl gladiátorem a bojoval v aréně. Naprostá ztráta času!
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_05"); //Wirklich schade, er war eine grosse Hilfe für mich!
	AI_Output			(self, hero, "WRK_200_SMITHHELPER_04_05"); //Opravdu škoda, byl opravdu dobrým pomocníkem!
};

///////////////////////////////////////////////////////////////////////
//	Info READYLONGSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_READYLONGSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_READYLONGSWORD_Condition;
	information		= Info_Gotmar_READYLONGSWORD_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich habe die fünf Kurzschwerter fertig!";
	description		= "Mám tu pro tebe pět krátkých mečů!";
};

func int	Info_Gotmar_READYLONGSWORD_Condition()
{
	if	Gotmar_LearnLongsword
	&&	(Npc_HasItems(hero,ItMw_Shortsword) >= 5)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_READYLONGSWORD_Info()
{
//	AI_Output				(hero, self,"Info_Gotmar_READYLONGSWORD_15_01"); //Ich habe die fünf Kurzschwerter fertig!
	AI_Output				(hero, self,"Info_Gotmar_READYLONGSWORD_15_01"); //Mám tu pro tebe pět krátkých mečů!
	B_GiveInvItems			(hero, self, ItMw_Shortsword, 5);
//	AI_Output				(self, hero,"Info_Gotmar_READYLONGSWORD_04_02"); //Gut, zeig mir mal eines...
	AI_Output				(self, hero,"Info_Gotmar_READYLONGSWORD_04_02"); //Dobře, půjč mi jeden...

	AI_CreateItemInSlot		(self,	"ZS_RIGHTHAND", ItMw_Shortsword);
	AI_PlayAni				(self,	"T_1HSINSPECT");
	AI_RemoveItemFromSlot	(self,	"ZS_RIGHTHAND");

	AI_Output				(self, hero,"Info_Gotmar_READYLONGSWORD_04_03"); //To je obstojná práce. Ne mistrovská, ale jak jsem řekl: obstojná!

	B_GiveXP				(XP_MadeShortswords);
};


///////////////////////////////////////////////////////////////////////
//	Info LONGSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_LONGSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_LONGSWORD_Condition;
	information		= Info_Gotmar_LONGSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= B_BuildLearnString(	NAME_Longsword,
											LPCOST_KNOWLEDGE_LONGSWORD,
											0							);
};

func int	Info_Gotmar_LONGSWORD_Condition()
{
	if	Gotmar_LearnLongsword
	&&	!Knows_Longsword
	&&	Npc_KnowsInfo(hero, Info_Gotmar_READYLONGSWORD)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_LONGSWORD_Info()
{
//	AI_Output					(hero, self,"Info_Gotmar_LONGSWORD_15_01"); //Zeige mir, wie man ein Langschwert herstellt!
	AI_Output					(hero, self,"Info_Gotmar_LONGSWORD_15_01"); //Ukaž mi, jak se vyrábí dlouhý meč!

	if	(hero.LP >= LPCOST_KNOWLEDGE_LONGSWORD)
	{
//		AI_Output				(self, hero,"Info_Gotmar_LONGSWORD_04_02"); //Die Klinge muß etwa 1 Fuß länger sein, als beim Kurzschwert und etwa 2 fingerbreit schmaler.
		AI_Output				(self, hero,"Info_Gotmar_LONGSWORD_04_02"); //Čepel musí být zhruba o stopu delší než u krátkého meče a asi dva palce užší.
//		AI_Output				(self, hero,"Info_Gotmar_LONGSWORD_04_03"); //Die Klinge muß in der Länge weniger und in der Breite mehr geschliffen werden.
		AI_Output				(self, hero,"Info_Gotmar_LONGSWORD_04_03"); //Čepel musí být na délku méně a na šířku více nabroušená.
//		AI_Output				(self, hero,"OUMULTI_Training_04_00");		//Versuch es mal! Übung macht den Meister.
		AI_Output				(self, hero,"OUMULTI_Training_04_00");		//Vyzkoušej si to! Cvičení dělá mistra.
//		AI_Output				(self, hero,"OUMULTI_BackToWork_04_00");	//Ich muß zurück an die Arbeit.
		AI_Output				(self, hero,"OUMULTI_BackToWork_04_00");	//Já musím zpátky do práce.

		B_LearnLongsword		();
		hero.lp -= LPCOST_KNOWLEDGE_LONGSWORD;
		Gotmar_LearnDay = B_GetDay();

		AI_StopProcessInfos		(self);
	}
	else
	{
		B_Say 					(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos		(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTBROADSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WANTBROADSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WANTBROADSWORD_Condition;
	information		= Info_Gotmar_WANTBROADSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Zeig mir, wie man ein besseres Schwert schmiedet!";
	description		= "Ukaž mi, jak vykovat lepší meč!";
};

func int	Info_Gotmar_WANTBROADSWORD_Condition()
{
	if	Knows_Longsword && !Gotmar_LearnBroadsword
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WANTBROADSWORD_Info()
{
//	AI_Output				(hero, self,"Info_Gotmar_WANTBROADSWORD_15_01"); //Zeig mir, wie man ein besseres Schwert schmiedet!
	AI_Output				(hero, self,"Info_Gotmar_WANTBROADSWORD_15_01"); //Ukaž mi, jak vykovat lepší meč!

	if		(B_GetDay() < (Gotmar_LearnDay+GOTMAR_WAIT_BROADSWORD))
	{
//		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_02"); //Dneska mám až moc práce. Zkus se stavit nějaký jiný den!
		if	!Gotmar_AskedForBroadsword
		{
//			B_LogEntry		(CH1_LearnSmith, "Gerne würde ich das Schmieden von noch besseren Schwertern lernen, aber Gotmar hat heute zu viel zu tun. Ich sollte ihn an einem späteren Tag nochmal aufsuchen!");
			B_LogEntry		(CH1_LearnSmith, "Rád bych se zlepšil v kování, abych mohl vyrábět lepší meče, ale Gotmar má dneska až moc práce. Prý mám přijít v nějaký jiný den!");
			Gotmar_AskedForBroadsword = TRUE;
		};

		AI_StopProcessInfos	(self);
	}
	else
	{
//		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_03"); //Heute zeige ich dir wie man ein Breitschwert schmiedet.
//		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_04"); //Aber dafür musst du mir einen Gefallen tun.
		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_03"); //Dnes ti ukážu, jak se ková široký meč.
		AI_Output			(self, hero,"Info_Gotmar_WANTBROADSWORD_04_04"); //Ale nejdřív pro mě musíš něco udělat.
		Info_Gotmar_WANTBROADSWORD.permanent = FALSE;
		Gotmar_LearnBroadsword = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATFAVOUR
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_WHATFAVOUR		(C_INFO)
{
	npc		 	= 	WRK_200_Gotmar;
	nr		 	= 	1;
	condition	= 	WRK_200_Gotmar_WHATFAVOUR_Condition;
	information	= 	WRK_200_Gotmar_WHATFAVOUR_Info;
	important	= 	FALSE;
	permanent	= 	FALSE;

//	description	= 	"Welchen Gefallen?";
	description	= 	"Co mám udělat?";
};

func int WRK_200_Gotmar_WHATFAVOUR_Condition ()
{
	if	Gotmar_LearnBroadsword
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_WHATFAVOUR_Info ()
{
//	AI_Output			(hero, self, "WRK_200_WHATFAVOUR_15_01"); //Welchen Gefallen?
	AI_Output			(hero, self, "WRK_200_WHATFAVOUR_15_01"); //Co mám udělat?
//	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_02"); //Ich habe dir doch von meinem Schmiedegehilfen erzählt...
	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_02"); //Už jsem ti vyprávěl o svém kovářském pomocníkovi,..
//	AI_Output			(hero, self, "WRK_200_WHATFAVOUR_15_03"); //...der sich jetzt als Gladiator versucht?
	AI_Output			(hero, self, "WRK_200_WHATFAVOUR_15_03"); //...který se snaží stát gladiátorem?
//	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_04"); //Genau, Mann! Goliath ist sein Name.
	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_04"); //Správně, chlape! Jmenuje se Goliáš.
//	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_05"); //Die Arbeit hier wächst mir über den Kopf. Ich brauche Goliath dringend wieder zurück.
	AI_Output			(self, hero, "WRK_200_WHATFAVOUR_04_05"); //Ta práce tady mi už přerůstá přes hlavu. Potřebuju sem Goliáše znovu dostat.

};

///////////////////////////////////////////////////////////////////////
//	Info SMITHHELPER2
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_SMITHHELPER2		(C_INFO)
{
	npc			 = 	WRK_200_Gotmar;
	condition	 = 	WRK_200_Gotmar_SMITHHELPER2_Condition;
	information	 = 	WRK_200_Gotmar_SMITHHELPER2_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum holst du ihn nicht selbst zurück?";
	description	 = 	"Proč si ho sem nedotáhneš zpátky sám?";
};

func int WRK_200_Gotmar_SMITHHELPER2_Condition ()
{
	if	Npc_KnowsInfo(hero,	WRK_200_Gotmar_SMITHHELPER)
	&&	Npc_KnowsInfo(hero,	WRK_200_Gotmar_WHATFAVOUR)
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_SMITHHELPER2_Info ()
{
//	AI_Output			(hero, self, "WRK_200_SMITHHELPER2_15_01"); //Warum holst du ihn nicht selbst zurück?
	AI_Output			(hero, self, "WRK_200_SMITHHELPER2_15_01"); //Proč si ho sem nedotáhneš zpátky sám?
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_02"); //Hab ich versucht, Mann!
	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_02"); //To jsem už zkoušel, chlape!
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_03"); //Aber er will Ruhm und Anerkennung!
	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_03"); //Ale on chce slávu a uznání!
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_04"); //Als ob es nicht genug Anerkennung währe im Schweisse seines Angesichtes Stahl zu schmieden.
	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_04"); //Jako by neměl dost uznání, když v potu tváře koval ocel.
//	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_05"); //Vielleicht kannst du ihm klarmachen, dass das Leben als Gladiator nicht das richtige für ihn ist.
	AI_Output			(self, hero, "WRK_200_SMITHHELPER2_04_05"); //Možná bys mu mohl ujasnit, že život gladiátora pro něj není ten pravý.
};

///////////////////////////////////////////////////////////////////////
//	Info IFETCHGOLIATH
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_IFETCHGOLIATH		(C_INFO)
{
	npc		 = 	WRK_200_Gotmar;
	condition	 = 	WRK_200_Gotmar_IFETCHGOLIATH_Condition;
	information	 = 	WRK_200_Gotmar_IFETCHGOLIATH_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich werde mit Goliath sprechen!";
	description	 = 	"Promluvím si s Goliášem!";
};

func int WRK_200_Gotmar_IFETCHGOLIATH_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_200_Gotmar_SMITHHELPER2)
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_IFETCHGOLIATH_Info ()
{
//	AI_Output			(hero, self, "WRK_200_IFETCHGOLIATH_15_01"); //Ich werde mit Goliath sprechen!
	AI_Output			(hero, self, "WRK_200_IFETCHGOLIATH_15_01"); //Promluvím si s Goliášem!

//	B_LogEntry			(CH1_LearnSmith, "Gotmar hat eingewilligt, mir zu zeigen, wie man Breitschwerter herstellt. Allerdings soll ich ihm einen Gefallen tun und seinen ehemaligen Schmiedegehilfen Goliath dazu überreden, die Arbeit in der Schmiede wieder aufzunehmen!");
	B_LogEntry			(CH1_LearnSmith, "Gotmar vyjádřil přání ukázat mi, jak se ková široký meč. K tomu je ale potřeba, abych přemluvil jeho bývalého pomocníka Goliáše, aby se vrátil ke kovářskému řemeslu.");
};

///////////////////////////////////////////////////////////////////////
//	Info GOLIATHSBACK
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_GOLIATHSBACK		(C_INFO)
{
	npc		 = 	WRK_200_Gotmar;
	nr		 = 	1;
	condition	 = 	WRK_200_Gotmar_GOLIATHSBACK_Condition;
	information	 = 	WRK_200_Gotmar_GOLIATHSBACK_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int WRK_200_Gotmar_GOLIATHSBACK_Condition ()
{
	if	Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_GOLIATHSBACK_Info ()
{
//	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_01"); //(freudig-aufgeregt) Goliath arbeitet wieder bei mir!
	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_01"); //(radostně rozhozený) Goliáš už u mě zase pracuje!
//	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_02"); //Ich hab dir viel zu verdanken, Mann!
	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_02"); //Musím ti hodně poděkovat, chlape!
//	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_03"); //Wenn du willst, zeige ich dir jetzt, wie man ein Breitschwert schmiedet.
	AI_Output			(self, hero, "WRK_200_GOLIATHSBACK_04_03"); //Až budeš chtít, tak ti ukážu, jak ukovat široký meč.

	B_GiveXP			(XP_Gotmar_Goliathreturned);
//	B_LogEntry			(CH1_LearnSmith,	"Der Schmied war sehr erfreut darüber, dass sein Gehilfe Goliath die Arbeit wieder aufgenommen hat. Er will mir jetzt das Schmieden eines noch besseren Schwertes zeigen.");
	B_LogEntry			(CH1_LearnSmith,	"Kovář byl nadšený, že se mu jeho pomocník vrátil znovu do práce. Chce mi teď ukázat, jak ukovat ještě lepší meče.");
	B_SetAttitude		(self, ATT_FRIENDLY);
};


///////////////////////////////////////////////////////////////////////
//	Info BROADSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_BROADSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_BROADSWORD_Condition;
	information		= Info_Gotmar_BROADSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= B_BuildLearnString(	NAME_BROADSWORD,
											LPCOST_KNOWLEDGE_BROADSWORD,
											0							);
};

func int	Info_Gotmar_BROADSWORD_Condition()
{
	if	Gotmar_LearnBroadsword
	&&	!Knows_Broadsword
	&&	Npc_KnowsInfo(hero, WRK_200_Gotmar_GOLIATHSBACK)
	{
		return TRUE;
	};
};

func void	Info_Gotmar_BROADSWORD_Info()
{
//	AI_Output					(hero, self,"Info_Gotmar_BROADSWORD_15_01"); //Zeige mir, wie man ein Breitschwert schmiedet!
	AI_Output					(hero, self,"Info_Gotmar_BROADSWORD_15_01"); //Ukaž mi, jak se vyková široký meč!

	if	(hero.LP >= LPCOST_KNOWLEDGE_BROADSWORD)
	{
//		AI_Output				(self, hero,"Info_Gotmar_BROADSWORD_04_02"); //Breitschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output				(self, hero,"Info_Gotmar_BROADSWORD_04_02"); //Široké meče způsobují zranění díky enormně silné čepeli.
//		AI_Output				(self, hero,"Info_Gotmar_BROADSWORD_04_03"); //Deshalb darfst du die Klinge weder an Länge, noch an Breite kürzen.
		AI_Output				(self, hero,"Info_Gotmar_BROADSWORD_04_03"); //Proto nesmíš čepel zkrátit ani na délce ani na šířce.
//		AI_Output				(self, hero,"OUMULTI_Training_04_00");		 //Versuch es mal! Übung macht den Meister.
		AI_Output				(self, hero,"OUMULTI_Training_04_00");		 //Vyzkoušej si to! Cvičení dělá mistra.
//		AI_Output				(self, hero,"OUMULTI_BackToWork_04_00");	 //Ich muß zurück an die Arbeit.
		AI_Output				(self, hero,"OUMULTI_BackToWork_04_00");	 //Já se musím vrátit ke své práci.

		B_LearnBroadsword		();
		hero.lp -= LPCOST_KNOWLEDGE_BROADSWORD;
		Gotmar_LearnDay = B_GetDay();

		AI_StopProcessInfos		(self);
	}
	else
	{
		B_Say 					(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos		(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTBASTARDSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_WANTBASTARDSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_WANTBASTARDSWORD_Condition;
	information		= Info_Gotmar_WANTBASTARDSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Zeig mir, wie man ein noch besseres Schwert schmiedet!";
	description		= "Ukaž mi, jak ukovat ještě lepší meč!";
};

func int	Info_Gotmar_WANTBASTARDSWORD_Condition()
{
	if	Knows_Broadsword
	&&	!Gotmar_LearnBastardsword
	{
		return TRUE;
	};
};

func void	Info_Gotmar_WANTBASTARDSWORD_Info()
{
//	AI_Output				(hero, self,"Info_Gotmar_WANTBASTARDSWORD_15_01"); //Zeig mir, wie man ein noch besseres Schwert schmiedet!
	AI_Output				(hero, self,"Info_Gotmar_WANTBASTARDSWORD_15_01"); //Ukaž mi, jak ukovat ještě lepší meč!

	if		(B_GetDay() < (Gotmar_LearnDay+GOTMAR_WAIT_BASTARDSWORD))
	{
//		AI_Output			(self, hero,"Info_Gotmar_WANTBASTARDSWORD_04_02"); //Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		AI_Output			(self, hero,"Info_Gotmar_WANTBASTARDSWORD_04_02"); //Dneska mám až moc práce. Zkus se stavit nějaký jiný den!

		AI_StopProcessInfos	(self);
	}
	else
	{
//		AI_Output			(self, hero,"Info_Gotmar_WANTBASTARDSWORD_04_03"); //Heute passt mir gut. Ich zeige dir gerne wie man ein Bastardschwert schmiedet.
		AI_Output			(self, hero,"Info_Gotmar_WANTBASTARDSWORD_04_03"); //Dneska mám čas. Rád ti ukážu, jak se uková meč bastard.
		Gotmar_LearnBastardsword = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BASTARDSWORD
///////////////////////////////////////////////////////////////////////
instance	Info_Gotmar_BASTARDSWORD (C_INFO)
{
	npc				= WRK_200_Gotmar;
	condition		= Info_Gotmar_BASTARDSWORD_Condition;
	information		= Info_Gotmar_BASTARDSWORD_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= B_BuildLearnString(	NAME_BASTARDSWORD,
											LPCOST_KNOWLEDGE_BASTARDSWORD,
											0							);
};

func int	Info_Gotmar_BASTARDSWORD_Condition()
{
	if	Gotmar_LearnBastardsword
	&&	!Knows_Bastardsword
	{
		return TRUE;
	};
};

func void	Info_Gotmar_BASTARDSWORD_Info()
{
//	AI_Output					(hero, self,"Info_Gotmar_BASTARDSWORD_15_01"); //Zeige mir, wie man ein Bastardschwert schmiedet!
	AI_Output					(hero, self,"Info_Gotmar_BASTARDSWORD_15_01"); //Ukaž mi, jak ukovat meč bastard!

	if	(hero.LP >= LPCOST_KNOWLEDGE_BASTARDSWORD)
	{
//		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_02"); //In Grunde sind es die selben Arbeitsschritte wie beim Kurz- und Langschwert.
		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_02"); //V zásadě jsou tu stejné pracovní kroky jako u krátkého i dlouhého meče.
//		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_03"); //Allerdings darfst du nun am Schleifstein weder an Länge, noch an Breite kürzen.
		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_03"); //Nicméně tentokrát nesmíš na brusu zkracovat ani po délce ani po šířce.
//		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_04"); //Bastardschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_04"); //Bastardské meče způsobují svoji škodu skrze enormně masivní čepel.
//		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_05"); //Am besten du versuchst mal eine solche Waffe herzustellen. Übung macht den Meister.
		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_05"); //Nejlepší bude, když zkusíš jednu takovou zbraň vyrobit. Cvičení dělá mistra.
//		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_06"); //So, ich muß wieder zurück an die Arbeit.
		AI_Output				(self, hero,"Info_Gotmar_BASTARDSWORD_04_06"); //Tak, musím zpátky do práce.

//		B_LearnBroadsword		();
// Auronen: learn the correct sword
		B_LearnBastardsword		();
		hero.lp -= LPCOST_KNOWLEDGE_BASTARDSWORD;

		AI_StopProcessInfos		(self);
	}
	else
	{
		B_Say 					(self, hero, "$NOLEARNNOPOINTS");
		AI_StopProcessInfos		(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANTMORE
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_WANTMORE		(C_INFO)
{
	npc			 = 	WRK_200_Gotmar;
	condition	 = 	WRK_200_Gotmar_WANTMORE_Condition;
	information	 = 	WRK_200_Gotmar_WANTMORE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?";
	description	 = 	"Můžeš mi ukázat, jak se kovají ještě lepší zbraně?";
};

func int WRK_200_Gotmar_WANTMORE_Condition ()
{
	if	Knows_Bastardsword
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_WANTMORE_Info ()
{
//	AI_Output			(hero, self, "WRK_200_WANTMORE_15_01"); //Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?
	AI_Output			(hero, self, "WRK_200_WANTMORE_15_01"); //Můžeš mi ukázat, jak se kovají ještě lepší zbraně?
//	AI_Output			(self, hero, "WRK_200_WANTMORE_04_02"); //Ich hab dir alles beigebracht, was ich weiss.
	AI_Output			(self, hero, "WRK_200_WANTMORE_04_02"); //Už jsem tě naučil všechno, co umím.
//	AI_Output			(self, hero, "WRK_200_WANTMORE_04_03"); //In der Felsenfestung, im Gefolge des Königs, gibt es bestimmt auch einen Waffenschmied.
	AI_Output			(self, hero, "WRK_200_WANTMORE_04_03"); //V Horské pevnosti, v královu doprovodu, se určitě najde nějaký kovář.
//	AI_Output			(self, hero, "WRK_200_WANTMORE_04_04"); //Aber der König hat bisher nichts für unser Lager getan. Ich glaube nicht, daß er etwas für dich tut!
	AI_Output			(self, hero, "WRK_200_WANTMORE_04_04"); //Ale král dosud neudělal pro náš tábor jedinou věc. Nevěřím, že udělá něco pro tebe!

//	B_LogEntry			(CH1_LearnSmith,	"Ich habe alles gelernt, was Gotmar mir beibringen kann. Um bessere Waffen herzustellen, muß ich den Schmied in der Felsenfestung aufsuchen.");
	B_LogEntry			(CH1_LearnSmith,	"Už jsem se naučil všechno, co mě mohl Gotmar naučit. Abych se naučil kovat lepší zbraně, musím vyhledat kováře v Horské pevnosti.");
	Log_SetTopicStatus	(CH1_LearnSmith,	LOG_SUCCESS);

};

///////////////////////////////////////////////////////////////////////
//	Info ROCKFORTRESS
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_ROCKFORTRESS		(C_INFO)
{
	npc		 	 = 	WRK_200_Gotmar;
	condition	 = 	WRK_200_Gotmar_ROCKFORTRESS_Condition;
	information	 = 	WRK_200_Gotmar_ROCKFORTRESS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo kann ich diese Felsenfestung finden?";
	description	 = 	"Kde mohu najít tuto Horskou pevnost?";
};

func int WRK_200_Gotmar_ROCKFORTRESS_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_200_Gotmar_WANTMORE)
	{
		return TRUE;
	};
};

func void WRK_200_Gotmar_ROCKFORTRESS_Info ()
{
//	AI_Output			(hero, self, "WRK_200_ROCKFORTRESS_15_01"); //Wo kann ich die Felsenfestung finden?
	AI_Output			(hero, self, "WRK_200_ROCKFORTRESS_15_01"); //Kde mohu najít tuto Horskou pevnost?
//	AI_Output			(self, hero, "WRK_200_ROCKFORTRESS_04_02"); //Keine Ahnung, Mann.
	AI_Output			(self, hero, "WRK_200_ROCKFORTRESS_04_02"); //Nemám tušení, chlape.
//	AI_Output			(self, hero, "WRK_200_ROCKFORTRESS_04_03"); //Bin noch nie aus diesem gottverfluchten Lager herausgekommen, seit ich hier bin!
	AI_Output			(self, hero, "WRK_200_ROCKFORTRESS_04_03"); //Ještě jsem z tohohle tábora nevylezl, co tu jsem!
};


///////////////////////////////////////////////////////////////////////
//	Info NEEDBLOODORE
///////////////////////////////////////////////////////////////////////
instance WRK_200_Gotmar_NEEDBLOODORE		(C_INFO)
{
	npc		 	 = 	WRK_200_Gotmar;
	nr		 	 = 	12;
	condition	 = 	WRK_200_Gotmar_NEEDBLOODORE_Condition;
	information	 = 	WRK_200_Gotmar_NEEDBLOODORE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich brauche Bluterz";
	description	 = 	"Potřebuju krvavou rudu.";
};

func int WRK_200_Gotmar_NEEDBLOODORE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_FINDBLOODORE)
	&&	(Npc_HasItems (self, ItMi_BloodOreNugget) >= 1)

	{
		return TRUE;
	};
};
func void WRK_200_Gotmar_NEEDBLOODORE_Info ()
{
//	AI_Output			(hero, self, "WRK_200_NEEDBLOODORE_15_01"); //Ich brauche Bluterz.
	AI_Output			(hero, self, "WRK_200_NEEDBLOODORE_15_01"); //Potřebuju krvavou rudu.
//	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_02"); //Bluterz ist 'ne seltene Sache. Ich selber besitze nur ein paar Brocken. Die kannst du kaufen.
	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_02"); //Krvavá ruda je vzácná záležitost. Sám jí mám jen pár hrudek. Tu si můžeš koupit.
//	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_03"); //Wenn du mehr brauchst, dann solltest du vielleicht mal mit Wylfern reden. Er war bis vor kurzem noch in der Mine.
	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_03"); //Kdybys potřeboval víc, možná by sis měl promluvit s Wylfernem. Před nedávnem byl ještě v dole.
//	AI_Output			(hero, self, "WRK_200_NEEDBLOODORE_15_04"); //Wo finde ich diesen Wylfern?
	AI_Output			(hero, self, "WRK_200_NEEDBLOODORE_15_04"); //Kde toho Wylferna najdu?
//	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_05"); //Er ist ein Rekrut der Miliz und treibt sich normalerweise irgendwo im Innenhof der Burg herum.
	AI_Output			(self, hero, "WRK_200_NEEDBLOODORE_04_05"); //Je to jeden z rekrutů v domobraně a obvykle se pohybuje někde na vnitřním nádvoří hradu.

//	B_LogEntry			(CH1_Bloodore, "Auch Wylfern, ein Rekrut der Miliz könnte über etwas Bluterz verfügen. Er hält sich im Innenhof der Burg auf.");
	B_LogEntry			(CH1_Bloodore, "Také Wylfern, rekrut od domobrany, může pomoci s krvavou rudou. Zdržuje se na vnitřním nádvoří hradu.");
};













































