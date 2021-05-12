// This is a hack variable to prevent a bug: After game load the .permamnent attribute of C_INFO class is not saved, so this has to be fixed with external variable 
const int BF_DAILYRAGOUT;  // WRK_227_Snaf_DAILYRAGOUT.permanent

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_227_Snaf_EXIT   (C_INFO)
{
	npc         = WRK_227_Snaf;
	nr          = 999;
	condition   = WRK_227_Snaf_EXIT_Condition;
	information = WRK_227_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_227_Snaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_227_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MEETAGAIN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_MEETAGAIN		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	1;
	condition	 = 	WRK_227_Snaf_MEETAGAIN_Condition;
	information	 = 	WRK_227_Snaf_MEETAGAIN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};

func int WRK_227_Snaf_MEETAGAIN_Condition ()
{
	return TRUE;
};

func void WRK_227_Snaf_MEETAGAIN_Info ()
{
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_09_01"); //Ja ist das denn möglich!?
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_09_01"); //Jak je tohle možné!?
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_09_02"); //Ich kenn dich doch!
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_09_02"); //Vždyť já tě znám!

//	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Du kennst mich? Ich wüsste nicht woher!", WRK_227_Snaf_MEETAGAIN_DONTKNOW );
	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Znáš mě? Nevím odkud!", WRK_227_Snaf_MEETAGAIN_DONTKNOW );
//	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Snaf...? Snaf, der Koch!", WRK_227_Snaf_MEETAGAIN_SNAF );
	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Snaf...? Kuchař Snaf!", WRK_227_Snaf_MEETAGAIN_SNAF );
};

func void WRK_227_Snaf_MEETAGAIN_SNAF ()
{
	Info_ClearChoices	(WRK_227_Snaf_MEETAGAIN);
//	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_15_01"); //Snaf...? Snaf, der Koch!
	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_15_01"); //Snaf...? Kuchař Snaf!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_09_02"); //Ja Mann! Wo hast du dich die letzten Monate rumgetrieben?
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_09_02"); //Jasně, chlape! Kde ses potloukal poslední měsíce?
//	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_15_03"); //Ich war... unpässlich!
	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_15_03"); //Byl jsem... v neschopnosti!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_09_04"); //Konntest wohl mein Fleischwanzenragout nicht mehr ertragen, was? (lacht)
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_09_04"); //Nemohl jsi moc strávit moje ragú ze žravých štěnic, co? (směje se)
	
//	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Dein Ragout war wirklich eklig, aber daran lag's nicht!", WRK_227_Snaf_MEETAGAIN_SNAF_BAD );
	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Tvoje ragú bylo fakt hnusný, ale to nebyl ten problém!", WRK_227_Snaf_MEETAGAIN_SNAF_BAD );
//	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Hey, ich steh auf dein Fleischwanzenragout, ehrlich!", WRK_227_Snaf_MEETAGAIN_SNAF_GOOD );
	Info_AddChoice		(WRK_227_Snaf_MEETAGAIN, "Hej, tvoje ragú jsem ustál, opravdu!", WRK_227_Snaf_MEETAGAIN_SNAF_GOOD );
};

func void WRK_227_Snaf_MEETAGAIN_SNAF_GOOD ()
{
	Info_ClearChoices	(WRK_227_Snaf_MEETAGAIN);
//	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_GOOD_15_01"); //Hey, ich steh auf dein Fleischwanzenragout, ehrlich!
	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_GOOD_15_01"); //Hej, tvoje ragú jsem ustál, opravdu!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_02"); //Dann schmeckt dir bestimmt auch mein neues Rezept. Fleischwanzensuppe!
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_02"); //Pak ti bude stejně dobře chutnat můj nový recept. Polévka ze žravých štěnic!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_03"); //Für meine Freunde hab ich immer etwas davon übrig!
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_GOOD_09_03"); //Pro své přátele tu vždycky trošku mám!
	Snaf_DailyRagout	= TRUE;
};

func void WRK_227_Snaf_MEETAGAIN_SNAF_BAD ()
{
	Info_ClearChoices	(WRK_227_Snaf_MEETAGAIN);
//	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_BAD_15_01"); //Dein Ragout ist wirklich eklig, aber danan lag's nicht!
	AI_Output			(hero, self, "WRK_227_MEETAGAIN_SNAF_BAD_15_01"); //Tvoje ragú bylo fakt hnusný, ale to nebyl ten problém!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_BAD_09_02"); //Eklig? Du findest es eklig?? Pah!
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_SNAF_BAD_09_02"); //Hnusný? Tobě připadá hnusný?? Pah!
};

func void WRK_227_Snaf_MEETAGAIN_DONTKNOW ()
{
	Info_ClearChoices	(WRK_227_Snaf_MEETAGAIN);
//	AI_Output			(hero, self, "WRK_227_MEETAGAIN_DONTKNOW_15_01"); //Du kennst mich? Ich wüsste nicht woher!
	AI_Output			(hero, self, "WRK_227_MEETAGAIN_DONTKNOW_15_01"); //Znáš mě? Nevím odkud!
//	AI_Output			(self, hero, "WRK_227_MEETAGAIN_DONTKNOW_09_02"); //Oh, dann hab ich dich wohl verwechselt!
	AI_Output			(self, hero, "WRK_227_MEETAGAIN_DONTKNOW_09_02"); //Oh, tak to jsem si tě s někým asi spletl!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DAILYRAGOUT
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_DAILYRAGOUT		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	10;
	condition	 = 	WRK_227_Snaf_DAILYRAGOUT_Condition;
	information	 = 	WRK_227_Snaf_DAILYRAGOUT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Hast du etwas von der Fleischwanzensuppe für mich?";
	description	 = 	"Neměl bys pro mě trochu polévky ze štěnic?";
};

func int WRK_227_Snaf_DAILYRAGOUT_Condition ()
{
	if	Snaf_DailyRagout
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_DAILYRAGOUT_Info ()
{
//	AI_Output			(hero, self, "WRK_227_DAILYRAGOUT_15_01"); //Hast du etwas Fleischwanzensuppe für mich?
	AI_Output			(hero, self, "WRK_227_DAILYRAGOUT_15_01"); //Neměl bys pro mě trochu polévky ze štěnic?

	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&&	Knows_RecipeMeatbug
	{
//		AI_Output		(self, hero, "WRK_227_DAILYRAGOUT_09_02"); //Du weisst doch jetzt selbst wie man sie zubereitet!
		AI_Output		(self, hero, "WRK_227_DAILYRAGOUT_09_02"); //Teď už budeš dobře vědět, jak se připravuje!
		if	Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE)
		{
//			AI_Output	(self, hero, "WRK_227_DAILYRAGOUT_09_03"); //Ausserdem werde ich ab sofort das neue Rezept Fleischeintopf zubereiten.
			AI_Output	(self, hero, "WRK_227_DAILYRAGOUT_09_03"); //Kromě toho připravím ihned jídlo podle svého nového receptu: guláš ze žravých štěnic.
			Snaf_RagoutDay = B_GetDay()-1;	// Damit der Fleischeintopf gleich rausgerückt wird!
		};
//		WRK_227_Snaf_DAILYRAGOUT.permanent = FALSE;
		BF_DAILYRAGOUT = FALSE;
		
		AI_StopProcessInfos	(self);
		return;
	};

	if	(Snaf_RagoutDay < B_GetDay())
	{
//		AI_Output		(self, hero, "WRK_227_DAILYRAGOUT_09_04"); //Hier nimm 3 Portionen und lass es dir schmecken!
		AI_Output		(self, hero, "WRK_227_DAILYRAGOUT_09_04"); //Tady, vezmi si tři porce a nech si chutnat!
		B_GiveInvItems	(self, hero, ItFo_MeatbugSoup, 3);
		Snaf_RagoutDay = B_GetDay();
	}
	else
	{
//		AI_Output		(self, hero, "OUMULTI_NOMORE_09_00"); //Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
		AI_Output		(self, hero, "OUMULTI_NOMORE_09_00"); //Dneska ti už víc dát nemohu. Koneckonců musím ještě něco prodat.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SMELLSGOOD
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_SMELLSGOOD		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_SMELLSGOOD_Condition;
	information	 = 	WRK_227_Snaf_SMELLSGOOD_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Das riecht lecker!";
	description	 = 	"To ale hezky voní!";
};

func int WRK_227_Snaf_SMELLSGOOD_Condition ()
{
	return TRUE;
};

func void WRK_227_Snaf_SMELLSGOOD_Info ()
{
//	AI_Output			(hero, self, "WRK_227_SMELLSGOOD_15_01"); //Das riecht lecker!
	AI_Output			(hero, self, "WRK_227_SMELLSGOOD_15_01"); //To ale hezky voní!
//	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_02"); //Ahhh... Du weisst offensichtlich rustikale Küche zu schätzen.
	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_02"); //Ahhh... Ty umíš ocenit venkovskou kuchyni.
//	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_03"); //Ich mache Fleischwanzensuppe!
	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_03"); //Dělám polévku ze žravých štěnic!
//	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_04"); //Die ist sehr nahrhaft und hat sogar heilsame Wirkung!
	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_04"); //Je velmi výživná a má dokonce léčivé účinky!
//	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_05"); //Ist bei den Arenakämpfern sehr beliebt. Die Jungs müssen ständig Schnitte und Beulen auskurieren.
	AI_Output			(self, hero, "WRK_227_SMELLSGOOD_09_05"); //Velmi oblíbená mezi arénními bojovníky. Chlapci si musí neustále léčit šrámy a boule.
};

///////////////////////////////////////////////////////////////////////
//	Info WANTLEARN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTLEARN		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	1;
	condition	 = 	WRK_227_Snaf_WANTLEARN_Condition;
	information	 = 	WRK_227_Snaf_WANTLEARN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Zeig mir, wie man Fleischwanzensuppe macht.";
	description	 = 	"Ukaž mi, jak se dělá polévka ze žravých štěnic.";
};

func int WRK_227_Snaf_WANTLEARN_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_SMELLSGOOD)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WANTLEARN_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WANTLEARN_15_01"); //Zeig mir, wie man Fleischwanzensuppe macht.
	AI_Output			(hero, self, "WRK_227_WANTLEARN_15_01"); //Ukaž mi, jak se dělá polévka ze žravých štěnic.
//	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_02"); //(Tiefes, langes Lachen)
	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_02"); //(Hluboký, dlouhý smích)
//	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_03"); //Ich lebe davon, dass die Leute bei mir Schlange stehen.
	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_03"); //Z toho, že tu mám fronty lidí, žiju.
//	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_04"); //Warum sollte ich meine besten Rezepte weitergeben?
	AI_Output			(self, hero, "WRK_227_WANTLEARN_09_04"); //Proč bych ti měl dávat své nejlepší recepty?
};

///////////////////////////////////////////////////////////////////////
//	Info WANTFAVOR
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTFAVOR		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	nr		 = 	1;
	condition	 = 	WRK_227_Snaf_WANTFAVOR_Condition;
	information	 = 	WRK_227_Snaf_WANTFAVOR_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Naja, ich sehe hier niemanden Schlange stehen.";
	description	 = 	"No jo, já tu žádnou frontu nevidím.";
};

func int WRK_227_Snaf_WANTFAVOR_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_WANTLEARN)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WANTFAVOR_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_01"); //Naja...
	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_01"); //No jo...
	AI_PlayAni			(hero, "T_SEARCH");
//	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_02"); //...ich sehe hier niemanden Schlange stehen.
	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_02"); //...já tu žádnou frontu nevidím.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_03"); //(zerknirscht) Hast ja recht, in letzter Zeit läuft es nicht so gut bei mir.
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_03"); //(sklíčeně) Máš pravdu, poslední dobou mi to tu zrovna neklape.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_04"); //Aber mir kommt da gerade eine Idee!
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_04"); //Ale mám takový nápad!
//	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_05"); //Erzähl.
	AI_Output			(hero, self, "WRK_227_WANTFAVOR_15_05"); //Povídej.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_06"); //Kennst Du Halvor?
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_09_06"); //Znáš Halvora?
	
//	Info_AddChoice		(WRK_227_Snaf_WANTFAVOR, "Halvor? Nie gehört."			, WRK_227_Snaf_WANTFAVOR_NO);
//	Info_AddChoice		(WRK_227_Snaf_WANTFAVOR, "Ja, den kenne ich."	, WRK_227_Snaf_WANTFAVOR_YES);
	Info_AddChoice		(WRK_227_Snaf_WANTFAVOR, "Halvor? O tom jsem neslyšel."			, WRK_227_Snaf_WANTFAVOR_NO);
	Info_AddChoice		(WRK_227_Snaf_WANTFAVOR, "Jo, toho znám."	, WRK_227_Snaf_WANTFAVOR_YES);
};
func void WRK_227_Snaf_WANTFAVOR_YES ()
{
	Info_ClearChoices	(WRK_227_Snaf_WANTFAVOR);
//	AI_Output			(hero, self, "WRK_227_WANTFAVOR_YES_15_01"); //Ja, den kenne ich.
	AI_Output			(hero, self, "WRK_227_WANTFAVOR_YES_15_01"); //Jo, toho znám.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_YES_09_02"); //Wir sind gewissermassen... Konkurrenten.
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_YES_09_02"); //Jsme takříkajíc... Konkurenti.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_YES_09_03"); //Irgendwie scheint er es zu schaffen, mir meine Kundschaft abspenstig zu machen!
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_YES_09_03"); //Nějak se mi zdá, že se mu daří odlákávat moje zákazníky!
};

func void WRK_227_Snaf_WANTFAVOR_NO ()
{
	Info_ClearChoices	(WRK_227_Snaf_WANTFAVOR);
//	AI_Output			(hero, self, "WRK_227_WANTFAVOR_NO_15_01"); //Halvor? Nie gehört.
	AI_Output			(hero, self, "WRK_227_WANTFAVOR_NO_15_01"); //Halvor? O tom jsem neslyšel.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_NO_09_02"); //Er ist der Koch in der Burgküche.
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_NO_09_02"); //Je to kuchař z hradní kuchyně.
//	AI_Output			(self, hero, "WRK_227_WANTFAVOR_NO_09_03"); //Sogar einige meiner Stammgäste kaufen sich jetzt ihr Essen bei ihm!
	AI_Output			(self, hero, "WRK_227_WANTFAVOR_NO_09_03"); //Dokonce i někteří moji stálí zákazníci teď nakupují jídlo u něj!
};

///////////////////////////////////////////////////////////////////////
//	Info WHYNOTYOU
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHYNOTYOU		(C_INFO)
{
	npc			 = 	WRK_227_Snaf;
	nr			 = 	1;
	condition	 = 	WRK_227_Snaf_WHYNOTYOU_Condition;
	information	 = 	WRK_227_Snaf_WHYNOTYOU_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum gehst du der Sache nicht auf den Grund?";
	description	 = 	"Jaktože jsi teda ještě nezkrachoval?";
};

func int WRK_227_Snaf_WHYNOTYOU_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_WANTFAVOR)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WHYNOTYOU_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WHYNOTYOU_15_01"); //Warum gehst du der Sache nicht auf den Grund?
	AI_Output			(hero, self, "WRK_227_WHYNOTYOU_15_01"); //Jaktože jsi teda ještě nezkrachoval?
//	AI_Output			(self, hero, "WRK_227_WHYNOTYOU_09_02"); //Der Mistkerl lässt mich nichtmal in die Nähe seiner Küche!
	AI_Output			(self, hero, "WRK_227_WHYNOTYOU_09_02"); //Ten parchant mi nedovolí se k jeho kuchyni ani přiblížit!
//	AI_Output			(self, hero, "WRK_227_WHYNOTYOU_09_03"); //Aber wenn du mein Problem löst, zeig ich dir, wie man Fleischwanzensuppe zubereitet!
	AI_Output			(self, hero, "WRK_227_WHYNOTYOU_09_03"); //Ale když můj problém vyřešíš, ukážu ti, jak připravovat polévku ze žravých štenic!
//	AI_Output			(hero, self, "WRK_227_WHYNOTYOU_15_04"); //Verstehe!
	AI_Output			(hero, self, "WRK_227_WHYNOTYOU_15_04"); //Rozumím!
};	

///////////////////////////////////////////////////////////////////////
//	Info IGO
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_IGO		(C_INFO)
{
	npc		 	= 	WRK_227_Snaf;
	nr		 	= 	1;
	condition	= 	WRK_227_Snaf_IGO_Condition;
	information	= 	WRK_227_Snaf_IGO_Info;
	important	= 	FALSE;
	permanent	= 	FALSE;

//	description	= 	"Ich werde mich um dein Problem kümmern!";
	description	= 	"Postarám se o tvůj problém!";
};

func int WRK_227_Snaf_IGO_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_WHYNOTYOU)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_IGO_Info ()
{
//	AI_Output			(hero, self, "WRK_227_IGO_15_01"); //Ich kümmere mich darum!
	AI_Output			(hero, self, "WRK_227_IGO_15_01"); //Postarám se o tvůj problém!
//	AI_Output			(self, hero, "WRK_227_IGO_09_02"); //Dann haben wir eine Absprache?
	AI_Output			(self, hero, "WRK_227_IGO_09_02"); //Máme tedy ujednáno?
//	AI_Output			(hero, self, "WRK_227_IGO_15_03"); //Haben wir!
	AI_Output			(hero, self, "WRK_227_IGO_15_03"); //Máme!

	Log_CreateTopic		(CH1_LearnCooking, LOG_MISSION);
	Log_SetTopicStatus	(CH1_LearnCooking, LOG_RUNNING);
//	B_LogEntry			(CH1_LearnCooking, "Snaf, der Koch im Aussenring des Alten Lagers hat eingewilligt, mir das Zubereiten von heilsamen Nahrungsmitteln beizubringen, wenn ich ihm bei seinem Problem helfe: In letzter Zeit sind viele seiner Stammkunden zu Halvor, dem Koch in der Burgküche übergelaufen.");
	B_LogEntry			(CH1_LearnCooking, "Snaf, kuchař z vnějšího okruhu Starého tábora mi slíbil, že mě naučí připravovat léčivé potraviny, když mi pomohu s jeho problémem: v poslední době mnoho jeho zákazníku přešlo k hradnímu kuchaři Halvorovi.");

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDOUT
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_FOUNDOUT		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_FOUNDOUT_Condition;
	information	 = 	WRK_227_Snaf_FOUNDOUT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich weiss jetzt, warum alle bei Halvor essen gehen.";
	description	 = 	"Teď už vím, proč všichni chodí jíst k Halvorovi.";
};

func int WRK_227_Snaf_FOUNDOUT_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_IGO)
	&&	Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF)
	&&	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) < SNAF_NEW_CUSTOMERS)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_FOUNDOUT_Info ()
{
//	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_01"); //Ich weiss jetzt, warum alle bei Halvor essen gehen.
	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_01"); //Teď už vím, proč všichni chodí jíst k Halvorovi.
//	AI_Output			(self, hero, "WRK_227_FOUNDOUT_09_02"); //Sag es mir! ich muss es wissen!
	AI_Output			(self, hero, "WRK_227_FOUNDOUT_09_02"); //Řekni mi to! Musím to vědět!
//	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_03"); //Er bereitet seinen Fleischeintopf nach einem neuen Rezept zu.
	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_03"); //Připravuje masnou polévku podle nového receptu.
//	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_04"); //Sieht so aus, als ob es bei Halvor einfach besser schmeckt, als bei dir!
	AI_Output			(hero, self, "WRK_227_FOUNDOUT_15_04"); //Vypadá to tak, jako by to u Halvora prostě chutnalo lépe než u tebe!
//	AI_Output			(self, hero, "WRK_227_FOUNDOUT_09_05"); //Verdammt! Wie kriege ich meine Kundschaft wieder?
	AI_Output			(self, hero, "WRK_227_FOUNDOUT_09_05"); //Zatraceně! Jak si získám své zákazníky nazpět?
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NOTHINGNEW
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_NOTHINGNEW		(C_INFO)
{
	npc		     = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_NOTHINGNEW_Condition;
	information	 = 	WRK_227_Snaf_NOTHINGNEW_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int WRK_227_Snaf_NOTHINGNEW_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&&	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) < SNAF_NEW_CUSTOMERS)
	&&	!Npc_HasItems(hero,ItWr_HalvorRecipe)
	&&	!Snaf_CustomerQuestSolved
	&&	C_NpcIsInvincible(self)
	&&	!C_NpcIsDead(MIL_100_Halvor)
	{
		return	TRUE;
	};
};

func void WRK_227_Snaf_NOTHINGNEW_Info ()
{
//	AI_Output			(self, hero, "WRK_227_NOTHINGNEW_09_01"); //Bitte, du musst dich um mein Problem kümmern!
	AI_Output			(self, hero, "WRK_227_NOTHINGNEW_09_01"); //Prosím, musíš se postarat o můj problém!
//	AI_Output			(self, hero, "WRK_227_NOTHINGNEW_09_02"); //Frag doch mal bei den Milizsoldaten vor Halvor's Küche herum!
	AI_Output			(self, hero, "WRK_227_NOTHINGNEW_09_02"); //Poptej se domobránců před Halvorovou kuchyní!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALVORDEAD
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HALVORDEAD		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_HALVORDEAD_Condition;
	information	 = 	WRK_227_Snaf_HALVORDEAD_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Halvor ist tot. Dein Problem ist gelöst!";
	description	 = 	"Halvor je mrtvý. Tvůj problém je vyřešen!";
};

func int WRK_227_Snaf_HALVORDEAD_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&&	C_NpcIsDead(MIL_100_Halvor)
	{
		return	TRUE;
	};
};

func void WRK_227_Snaf_HALVORDEAD_Info ()
{
//	AI_Output			(hero, self, "WRK_227_HALVORDEAD_15_01"); //Halvor ist tot. Dein Problem ist gelöst!
	AI_Output			(hero, self, "WRK_227_HALVORDEAD_15_01"); //Halvor je mrtvý. Tvůj problém je vyřešen!
//	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_02"); //Bist du von allen guten Geistern verlassen. Du solltest meine Kunden zurückholen und keinen Kreig im Lager anfangen.
	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_02"); //Tebe snad posedl nějaký zlý duch!? Měl jsi dostat nazpátek mé zákazníky a nezačínat v táboře jakékoliv boje.
//	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_03"); //Als ob die Orks da draussen nicht schon genug Probleme wären.
	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_03"); //Jako by skřeti tam venku nebyly už tak dost velký problém.
//	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_04"); //Ich will nichts mehr mit dir zu tun haben.
	AI_Output			(self, hero, "WRK_227_HALVORDEAD_09_04"); //Už s tebou nechci mít nic společného.

	B_SetAttitude		(self, ATT_ANGRY);

//	B_LogEntry			(CH1_LearnCooking, "Snaf ist stinksauer, weil ich Halvor getötet habe. Aus ihm werde ich nicht mehr herausbekommen. Meine Lösung seines Problems war wohl doch etwas zu extrem.");
	B_LogEntry			(CH1_LearnCooking, "Snaf je rozzuřený, že jsem Halvora zabil. Z něj už nic nedostanu. Moje řešení jeho problému bylo asi až moc extrémní.");
	Log_SetTopicStatus	(CH1_LearnCooking, LOG_FAILED);
};

///////////////////////////////////////////////////////////////////////
//	Info DEADAGAIN
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_DEADAGAIN		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_DEADAGAIN_Condition;
	information	 = 	WRK_227_Snaf_DEADAGAIN_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int WRK_227_Snaf_DEADAGAIN_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_HALVORDEAD)
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_DEADAGAIN_Info ()
{
//	AI_Output			(self, hero, "WRK_227_DEADAGAIN_09_01"); //Ich will nichts mehr mit dir zu tun haben, du Mörder!
	AI_Output			(self, hero, "WRK_227_DEADAGAIN_09_01"); //Už s tebou nechci nic mít, ty vrahu!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HAVERECIPE
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HAVERECIPE		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_HAVERECIPE_Condition;
	information	 = 	WRK_227_Snaf_HAVERECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe Halvor's Kochbuch  ...ähm... organisiert!";
	description	 = 	"'Sehnal' jsem Halvorovu kuchařku!";
};

func int WRK_227_Snaf_HAVERECIPE_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_227_Snaf_FOUNDOUT)
	&&	Npc_HasItems(hero,ItWr_HalvorRecipe)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_HAVERECIPE_Info ()
{
//	AI_Output			(hero, self, "WRK_227_HAVERECIPE_15_01"); //Ich habe Halvor's Kochbuch ...ähm... organisiert!
	AI_Output			(hero, self, "WRK_227_HAVERECIPE_15_01"); //'Sehnal' jsem Halvorovu kuchařku!
	B_GiveInvItems		(hero, self, ItWr_HalvorRecipe, 1);
//	AI_Output			(self, hero, "WRK_227_HAVERECIPE_09_02"); //Mann, das ist klasse! Will garnicht wissen, wie du das geschafft hast!
	AI_Output			(self, hero, "WRK_227_HAVERECIPE_09_02"); //Chlape, to je perfektní! Vůbec nechci vědět, jak jsi to dokázal!
//	AI_Output			(self, hero, "WRK_227_HAVERECIPE_09_03"); //Wenn ich auch Fleisch-Eintopf anbiete, werden bald wieder alle bei MIR schlange stehen!
	AI_Output			(self, hero, "WRK_227_HAVERECIPE_09_03"); //Když i já nabídnu masovou polévku, budou už brzy znovu všichni stát u MĚ frontu!

	B_GiveXP			(XP_Snaf_GaveRecipe);
	B_Snaf_NewRecipe	();
	Snaf_CustomerQuestSolved	= TRUE;
	B_SetAttitude		(self, ATT_FRIENDLY);
};


///////////////////////////////////////////////////////////////////////
//	Info NEWCUSTOMERS
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_NEWCUSTOMERS		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_NEWCUSTOMERS_Condition;
	information	 = 	WRK_227_Snaf_NEWCUSTOMERS_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int WRK_227_Snaf_NEWCUSTOMERS_Condition ()
{
	if	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
	||	Halvor_StewSalted
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_NEWCUSTOMERS_Info ()
{
	AI_SetWalkmode	(self, NPC_RUN);
	AI_GotoNpc		(self, hero);
//	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_01"); //Hey, da bist du ja wieder!
//	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_02"); //Ich weiss nicht WAS du gemacht hast, aber viele der Milizsoldaten essen wieder bei mir, statt bei Halvor!
	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_01"); //Hej, tady tě zas mám! 
	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_02"); //Nevím, co jsi udělal, ale mnozí domobránci teď jedí znovu u mě namísto u Halvora!

//	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_03"); //Sie stehen sogar wieder Schlange!
	AI_Output		(self, hero, "WRK_227_NEWCUSTOMERS_09_03"); //Už tu dokonce znovu stojí fronty!

//	B_LogEntry			(CH1_LearnCooking, "Snaf war ausser sich vor Freude über die zurückgewonnene Kundschaft. Besser er erfährt nie, wie ich das angestellt habe!");
	B_LogEntry			(CH1_LearnCooking, "Snaf byl radostí bez sebe, že se mu vrátili zákazníci. Lepší, kdyby se nedověděl, jak jsem to zařídil!");

	Snaf_CustomerQuestSolved = TRUE;
	B_SetAttitude	(self, ATT_FRIENDLY);
};




///////////////////////////////////////////////////////////////////////
//	Info TEACHCOOK
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_TEACHCOOK		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_TEACHCOOK_Condition;
	information	 = 	WRK_227_Snaf_TEACHCOOK_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_LearnCook_1,	LPCOST_TALENT_COOK_1,	0);
};

func int WRK_227_Snaf_TEACHCOOK_Condition ()
{
	if	Snaf_CustomerQuestSolved
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) < 1)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_TEACHCOOK_Info ()
{
	if	B_GiveSkill(hero, NPC_TALENT_COOK, 1, LPCOST_TALENT_COOK_1)
	{
//		AI_Output			(hero, self, "WRK_227_TEACHCOOK_15_01"); //Zeigst du mir jetzt wie man Fleischwanzensuppe zubereitet?
		AI_Output			(hero, self, "WRK_227_TEACHCOOK_15_01"); //Ukážeš mi teď, jak se připravuje polévka ze žravých štěnic?
//		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_02"); //Gerne! Zuerst ein paar grundsätzliche Dinge:
		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_02"); //Rád! Nejprve pár základních věcí:
//		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_03"); //Achte auf das Feuer. Die Suppe muß immer leicht köcheln.
		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_03"); //Dávej pozor na oheň. Ta polévka se musí vařit vždy jen mírně.
//		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_04"); //Und du musst regelmässig mit dem Kochlöffel umrühren, damit sich der Geschmack richtig entfalten kann.
		AI_Output			(self, hero, "WRK_227_TEACHCOOK_09_04"); //A musíš ji pravidelně promíchávat vařečkou, aby se mohla chuť náležitě rozpustit.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SCOOP
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_SCOOP		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_SCOOP_Condition;
	information	 = 	WRK_227_Snaf_SCOOP_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kochlöffel? Hab ich nicht!";
	description	 = 	"Vařečkou? Tu nemám!";
};

func int WRK_227_Snaf_SCOOP_Condition ()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&&	!Npc_HasItems(hero,ItMi_Scoop)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_SCOOP_Info ()
{
//	AI_Output			(hero, self, "WRK_227_SCOOP_15_01"); //Kochlöffel? Hab ich nicht!
	AI_Output			(hero, self, "WRK_227_SCOOP_15_01"); //Vařečkou? Tu nemám!
//	AI_Output			(self, hero, "WRK_227_SCOOP_09_02"); //Nimm den hier, ich habe mehr als genug davon!
	AI_Output			(self, hero, "WRK_227_SCOOP_09_02"); //Vezmi si tuhle, já jich mám víc než dost.

	B_GiveInvItems		(self, hero, ItMi_Scoop, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MEATBUGRECIPE
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_MEATBUGRECIPE		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_MEATBUGRECIPE_Condition;
	information	 = 	WRK_227_Snaf_MEATBUGRECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"...und wie macht man nun die Suppe?";
	description	 = 	"...a teď jak se dělá ta polévka?";
};

func int WRK_227_Snaf_MEATBUGRECIPE_Condition ()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_COOK) >= 1)
	&&	!Knows_RecipeMeatbug
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_MEATBUGRECIPE_Info ()
{
//	AI_Output			(hero, self, "WRK_227_MEATBUGRECIPE_15_01"); //...und wie macht man nun die Suppe?
	AI_Output			(hero, self, "WRK_227_MEATBUGRECIPE_15_01"); //...a teď jak se dělá ta polévka?
//	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_02"); //Ah ja... richtig! Im Grunde ist es garnicht so schwierig.
	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_02"); //Ah ano... správně! V zásadě to není vůbec složité.
//	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_03"); //Schäle eine Fleischwanze vorsichtig aus ihrem Panzer, schneide das Fleisch klein und gib es nach und nach in das heisse Wasser.
	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_03"); //Vyloupni opatrně jednu žravou štěnici z jejího krunýře, trochu nakrájej maso a kousek po kousku ho naházej do vařící vody.
//	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_04"); //Gebe noch etwas Brot hinein, um die Suppe etwas anzudicken. Nun noch gut umrühren, und mit einer Prise Salz abschmecken und fertig ist die Suppe.
	AI_Output			(self, hero, "WRK_227_MEATBUGRECIPE_09_04"); //Přidej trochu chleba, abys polévku malinko zahustil. Nyní trochu míchat, dochutit špetkou soli a polévka je hotova.

	B_LearnRecipeMeatbug();

//	B_LogEntry			(CH1_LearnCooking, "Ich weiss nun, wie ich aus Fleischwanzen eine Suppe herstellen kann. Um allerdings Eintöpfe und Ragouts zuzubereiten, brauche ich einen besseren Lehrer!");
	B_LogEntry			(CH1_LearnCooking, "Nyní vím, jak připravit polévku ze žravých štěnic. Na to abych připravil guláš nebo ragú, už ovšem potřebuju lepšího učitele.");
	Log_SetTopicStatus	(CH1_LearnCooking, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREBUGS
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHEREBUGS		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_WHEREBUGS_Condition;
	information	 = 	WRK_227_Snaf_WHEREBUGS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo finde ich solche Fleischwanzen?";
	description	 = 	"Kde najdu nějaké žravé štěnice?";
};

func int WRK_227_Snaf_WHEREBUGS_Condition ()
{
	if	Npc_KnowsInfo(hero,WRK_227_Snaf_MEATBUGRECIPE)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WHEREBUGS_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WHEREBUGS_15_01"); //Wo finde ich solche Fleischwanzen?
	AI_Output			(hero, self, "WRK_227_WHEREBUGS_15_01"); //Kde najdu nějaké žravé štěnice?
//	AI_Output			(self, hero, "WRK_227_WHEREBUGS_09_02"); //Dieses kleine Krabbelgetier liebt Müll. Einfach unglaublich, dass sie so hervorragend schmecken!
	AI_Output			(self, hero, "WRK_227_WHEREBUGS_09_02"); //Tohle malé lezoucí zviřátko miluje odpad. Jednoduše neuvěřtelné, že je jejich maso tak chutné!
//	AI_Output			(self, hero, "WRK_227_WHEREBUGS_09_03"); //Es gibt hier im Lager zwei Müllberge, dort findest du eigentlich immer ein paar von den Biestern!
	AI_Output			(self, hero, "WRK_227_WHEREBUGS_09_03"); //Tady v táboře najdeš dvě skládky. Na každé bude vždycky trochu těch potvor!
};

///////////////////////////////////////////////////////////////////////
//	Info WHERESALTNLOAF
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WHERESALTNLOAF		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_WHERESALTNLOAF_Condition;
	information	 = 	WRK_227_Snaf_WHERESALTNLOAF_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo bekomme ich Brot und Salz her?";
	description	 = 	"Kde tu seženu chléb a sůl?";
};

func int WRK_227_Snaf_WHERESALTNLOAF_Condition ()
{
	if	Npc_KnowsInfo(hero,WRK_227_Snaf_MEATBUGRECIPE)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WHERESALTNLOAF_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WHERESALTNLOAF_15_01"); //Wo bekomme ich Brot und Salz her?
	AI_Output			(hero, self, "WRK_227_WHERESALTNLOAF_15_01"); //Kde tu seženu chléb a sůl?
//	AI_Output			(self, hero, "WRK_227_WHERESALTNLOAF_09_02"); //Ich hole mir die Zutaten immer von Agon im Händlerviertel.
	AI_Output			(self, hero, "WRK_227_WHERESALTNLOAF_09_02"); //Já si přísady pořizuji vždy u Agona v Obchodnické čtvrti.
//	AI_Output			(self, hero, "WRK_227_WHERESALTNLOAF_09_03"); //Er ist zwar eigentlich ein Gauner, aber seine Vorräte sind immer gut gefüllt.
	AI_Output			(self, hero, "WRK_227_WHERESALTNLOAF_09_03"); //Je to docela gauner, ale zásobený je vždycky dobře.
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_HOWDY		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_HOWDY_Condition;
	information	 = 	WRK_227_Snaf_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wie steht es um deine Kundschaft?";
	description	 = 	"Jak se to má s tvými zákazníky?";
};

func int WRK_227_Snaf_HOWDY_Condition ()
{
//	if	!WRK_227_Snaf_DAILYRAGOUT.permanent
	if	!BF_DAILYRAGOUT
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_HOWDY_Info ()
{
//	AI_Output			(hero, self, "WRK_227_HOWDY_15_01"); //Wie steht es um deine Kundschaft?
	AI_Output			(hero, self, "WRK_227_HOWDY_15_01"); //Jak se to má s tvými zákazníky?

	if	Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE)
	{
//		AI_Output		(self, hero, "WRK_227_HOWDY_09_02"); //Das neue Rezept ist ein voller Erfolg. Für den Fleisch-Eintopf stehen sie sogar wieder Schlange.
		AI_Output		(self, hero, "WRK_227_HOWDY_09_02"); //Nový recept má naprostý úspěch. Pro masnou polévku se už zase dokonce stojí fronty.
//		AI_Output		(self, hero, "WRK_227_HOWDY_09_03"); //Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du an Halvor's Kochbuch gekommen bist!
		AI_Output		(self, hero, "WRK_227_HOWDY_09_03"); //Ještě jednou ti děkuji za pomoc, ačkoliv jsi mi dodneška nevysvětlil, JAK jsi se dostal k Halvorově kuchařce!
	}
	else
	{
//		AI_Output		(self, hero, "WRK_227_HOWDY_09_04"); //Ausgezeichnet. Sie stehen wieder jeden Tag Schlange und wollen etwas von meiner Fleischwanzensuppe haben!!
		AI_Output		(self, hero, "WRK_227_HOWDY_09_04"); //Výtečně. Stojí se tu každý den fronty a všichni chtějí porci mé polévky ze žravých štěnic!
//		AI_Output		(self, hero, "WRK_227_HOWDY_09_05"); //Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du das angestellt hast!
		AI_Output		(self, hero, "WRK_227_HOWDY_09_05"); //Ještě jednou díky za tvoji pomoc, ačkoliv jsi mi dodneška nevysvětlil, JAK se ti to povedlo!
	};

//	AI_Output			(hero, self, "WRK_227_HOWDY_15_06"); //(verschmitzt) Das willst du nicht wissen.
	AI_Output			(hero, self, "WRK_227_HOWDY_15_06"); //(chytrácky) To nechceš vědět.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WANTMEATSTEW
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_WANTMEATSTEW		(C_INFO)
{
	npc		 = 	WRK_227_Snaf;
	condition	 = 	WRK_227_Snaf_WANTMEATSTEW_Condition;
	information	 = 	WRK_227_Snaf_WANTMEATSTEW_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Hast du etwas Fleischeintopf für mich?";
	description	 = 	"Neměl bys pro mě trochu masné polévky?";
};

func int WRK_227_Snaf_WANTMEATSTEW_Condition ()
{
//	if	!WRK_227_Snaf_DAILYRAGOUT.permanent
	if	!BF_DAILYRAGOUT
	&&	Npc_KnowsInfo(hero, WRK_227_Snaf_HAVERECIPE)
	{
		return TRUE;
	};
};

func void WRK_227_Snaf_WANTMEATSTEW_Info ()
{
//	AI_Output			(hero, self, "WRK_227_WANTMEATSTEW_15_01"); //Hast du etwas Fleischeintopf für mich?
	AI_Output			(hero, self, "WRK_227_WANTMEATSTEW_15_01"); //Neměl bys pro mě trochu masné polévky?
	if	(Snaf_RagoutDay < B_GetDay())
	{
//		AI_Output		(self, hero, "WRK_227_WANTMEATSTEW_09_02"); //Hier nimm 3 Portionen. Schliesslich habe ich das neue Rezept dir zu verdanken.
		AI_Output		(self, hero, "WRK_227_WANTMEATSTEW_09_02"); //Tady, vezmi si 3 porce. Nakonec, za ten nový recept vděčím tobě.
		B_GiveInvItems	(self, hero, ItFo_MeatStew, 3);
		Snaf_RagoutDay	= B_GetDay();
	}
	else
	{
//		AI_Output		(self, hero, "OUMULTI_NOMORE_09_00"); //Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
		AI_Output		(self, hero, "OUMULTI_NOMORE_09_00"); //Dneska už ti víc dát nemůžu. Musím koneckonců mít taky něco na prodej.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info RugasMeal
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEAL		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	6;
	condition	 = 	WRK_227_Snaf_RUGASMEAL_Condition;
	information	 = 	WRK_227_Snaf_RUGASMEAL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kannst Du mir zwei Meatbugsuppen verkaufen?";
	description	 = 	"Mohl bys mi prodat dvě polévky ze žravých štěnic?";
};

func int WRK_227_Snaf_RUGASMEAL_Condition ()
{
	if int_RugaWantsMeal
	&&	(!int_PlayerHasRugasMeal)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_227_Snaf_RUGASMEAL_Info ()
{
//	AI_Output			(hero, self, "WRK_227_RUGASMEAL_15_01"); //Kannst Du mir zwei Meatbugsuppen verkaufen?
	AI_Output			(hero, self, "WRK_227_RUGASMEAL_15_01"); //Mohl bys mi prodat dvě polévky ze žravých štěnic?
//	AI_Output			(self, hero, "WRK_227_RUGASMEAL_09_02"); //Zwei Suppen kosten für Dich heute nur 15.
	AI_Output			(self, hero, "WRK_227_RUGASMEAL_09_02"); //Dvě polévky tě dnes stojí jen 15.

};

///////////////////////////////////////////////////////////////////////
//	Info RugasMealNoMoney
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEALNOMONEY		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	8;
	condition	 = 	WRK_227_Snaf_RUGASMEALNOMONEY_Condition;
	information	 = 	WRK_227_Snaf_RUGASMEALNOMONEY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"(nicht genug Geld für Meatbugsuppe)";
	description	 = 	"(nedostatek peněz na polévku ze štěnic)";
};

func int WRK_227_Snaf_RUGASMEALNOMONEY_Condition ()
{
	if int_RugaWantsMeal
	&&	(!int_PlayerHasRugasMeal)
	&&	(Npc_HasItems	(hero, ItMi_Silver) < 15)
	&&	Npc_KnowsInfo	(hero, WRK_227_Snaf_RUGASMEAL)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_227_Snaf_RUGASMEALNOMONEY_Info ()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info RugasMealMoney
///////////////////////////////////////////////////////////////////////
instance WRK_227_Snaf_RUGASMEALMONEY		(C_INFO)
{
	npc		 	 = 	WRK_227_Snaf;
	nr		 	 = 	5;
	condition	 = 	WRK_227_Snaf_RUGASMEALMONEY_Condition;
	information	 = 	WRK_227_Snaf_RUGASMEALMONEY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Dann gib mir mal zwei Meatbugsuppen";
	description	 = 	"Tak mi dej dvě polévky ze žravých štěnic.";
};

func int WRK_227_Snaf_RUGASMEALMONEY_Condition ()
{
	if	int_RugaWantsMeal
	&&	(!int_PlayerHasRugasMeal)
	&&	(Npc_HasItems	(hero, ItMi_Silver) >= 15)
	&&	Npc_KnowsInfo	(hero, WRK_227_Snaf_RUGASMEAL)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_227_Snaf_RUGASMEALMONEY_Info ()
{
	B_GiveInvItems	(hero, self, ItMi_Silver, 15);
//	AI_Output		(hero, self, "WRK_227_RUGASMEALMONEY_15_01"); //Dann gib mir mal zwei Meatbugsuppen
	AI_Output		(hero, self, "WRK_227_RUGASMEALMONEY_15_01"); //Tak mi dej dvě polévky ze žravých štěnic.
	B_GiveInvItems	(self, hero, ItFo_MeatBugSoup, 2);
//	AI_Output		(self, hero, "WRK_227_RUGASMEALMONEY_09_02"); //Aber denk dran, ist ein Sonderpreis, nur für Dich.
	AI_Output		(self, hero, "WRK_227_RUGASMEALMONEY_09_02"); //Ale pamatuj si, že to je výjimečná cena, jenom pro tebe.
	int_PlayerHasRugasMeal	=	TRUE;
	AI_StopProcessInfos	(self);
};
