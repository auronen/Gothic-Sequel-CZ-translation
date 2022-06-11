///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_225_Agon_EXIT   (C_INFO)
{
	npc         = WRK_225_Agon;
	nr          = 999;
	condition   = WRK_225_Agon_EXIT_Condition;
	information = WRK_225_Agon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_225_Agon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_225_Agon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Welcome
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_WELCOME		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	nr		 = 	056;
	condition	 = 	WRK_225_Agon_WELCOME_Condition;
	information	 = 	WRK_225_Agon_WELCOME_Info;
	important	 = 	TRUE;
};

func int WRK_225_Agon_WELCOME_Condition ()
{
	if C_NPCisinvincible(self)
	{
		return TRUE;
	};
};
func int WRK_225_Agon_WELCOME_Info ()
{
//	AI_Output			(self, hero, "WRK_225_WELCOME_00_01"); //Willkommen. Ich bin Agon. DER Agon. Was auch immer du suchst, ich kann es dir besorgen.
	AI_Output			(self, hero, "WRK_225_WELCOME_00_01"); //Vítej. Já jsem Agon. TEN Agon. Ať už sháníš cokoliv, mohu ti to obstarat.
//	AI_Output			(self, hero, "WRK_225_WELCOME_00_02"); //Jeder der hier im Lager irgendeine Ware anbietet, steht bei mir unter Vertrag!

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC,"Agon prahlt damit, ALLES besorgen zu können, was man sucht. Er hat einen Stand im Händlerviertel.");
	B_LogEntry			(GE_TraderOC,"Agon se chvástá, že dovede obstarat cokoliv, po čem se člověk jen shání. K sehnání je ve čtvrti obchodníků.");
};
///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
/*
instance WRK_225_Agon_WHY		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	nr		 = 	12;
	condition	 = 	WRK_225_Agon_WHY_Condition;
	information	 = 	WRK_225_Agon_WHY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Warum stehen alle Händler mit dir unter Vertrag?";
};

func int WRK_225_Agon_WHY_Condition ()
{
	return TRUE;
};

func void WRK_225_Agon_WHY_Info ()
{
	AI_Output			(hero, self, "WRK_225_WHY_15_01"); //Warum stehen alle Händler mit dir unter Vertrag?
	AI_Output			(self, hero, "WRK_225_WHY_09_02"); //Nun jeder Händler braucht Rohstoffe. Und die besorge ich ihnen.
	AI_Output			(self, hero, "WRK_225_WHY_09_03"); //Wie ich schon sagte, ich kann alles besorgen. Und von jedem Geschäft, das hier im Lager abgewickelt wird, bekomme ich meinen Teil!
	AI_Output			(hero, self, "WRK_225_WHY_15_04"); //Und wie kommst du an die Rohstoffe?
	AI_Output			(self, hero, "WRK_225_WHY_09_05"); //HAHAHA, das will jeder wissen. Wenn ich das preisgebe, dann verdiene ich ja nichts mehr, weil sich jeder selbst die Rohstoffe besorgen würde.
};
*/
///////////////////////////////////////////////////////////////////////
//	Info WHO
///////////////////////////////////////////////////////////////////////
/*
instance WRK_225_Agon_WHO		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	nr		 = 	23;
	condition	 = 	WRK_225_Agon_WHO_Condition;
	information	 = 	WRK_225_Agon_WHO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Mit welchen Händlern machst du Geschäfte?";
};

func int WRK_225_Agon_WHO_Condition ()
{
	return TRUE;
};

func void WRK_225_Agon_WHO_Info ()
{
	AI_Output			(hero, self, "WRK_225_WHO_15_01"); //Mit welchen Händlern machst du Geschäfte?
	AI_Output			(self, hero, "WRK_225_WHO_09_02"); //Die beiden Bogner, Helvegor und Osric.
	AI_Output			(self, hero, "WRK_225_WHO_09_03"); //Ruga der Rüstungsmacher und Gordian der Schreiber.
	AI_Output			(self, hero, "WRK_225_WHO_09_04"); //Ich beliefere auch Gotmar den Schmied, Bromor den Baumeister und die Köche Snaf und Halvor.
	AI_Output			(self, hero, "WRK_225_WHO_09_05"); //Du siehst, ich bin einer der wichtigsten Männer im Lager.  MUAHAHAHA
};
*/
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_TRADE		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	nr		 = 	12;
	condition	 = 	WRK_225_Agon_TRADE_Condition;
	information	 = 	WRK_225_Agon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 =	TRUE;
//	description	 = 	"Zeig mir deine Ware";
	description	 = 	"Ukaž mi své zboží.";
};

func int WRK_225_Agon_TRADE_Condition ()
{
	return TRUE;
};

func int WRK_225_Agon_TRADE_Info ()
{
//	AI_Output			(hero, self, "WRK_225_TRADE_15_01"); //Zeig mir deine Ware.
	AI_Output			(hero, self, "WRK_225_TRADE_15_01"); //Ukaž mi své zboží.
};
///////////////////////////////////////////////////////////////////////
//	Info STOLEN
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_STOLEN		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	nr		 = 	10;
	condition	 = 	WRK_225_Agon_STOLEN_Condition;
	information	 = 	WRK_225_Agon_STOLEN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Du wurdest bestohlen?";
	description	 = 	"Ty jsi byl okraden?";
};

func int WRK_225_Agon_STOLEN_Condition ()
{
	if Cassian_BeatHudrych == LOG_RUNNING
	{
		return TRUE;
	};
};
func void WRK_225_Agon_STOLEN_Info ()
{
//	AI_Output			(hero, self, "WRK_225_STOLEN_15_01"); //Du wurdest bestohlen?
	AI_Output			(hero, self, "WRK_225_STOLEN_15_01"); //Ty jsi byl okraden?
//	AI_Output			(self, hero, "WRK_225_STOLEN_00_02"); //Ja das richtig. Aber was hast du damit zu tun?
	AI_Output			(self, hero, "WRK_225_STOLEN_00_02"); //Ano, je to tak. Ale co s tím máš co dělat ty?
//	AI_Output			(hero, self, "WRK_225_STOLEN_15_03"); //Cassian schickt mich. Ich bin der, der deine Sachen zurückholt
	AI_Output			(hero, self, "WRK_225_STOLEN_15_03"); //Poslal mě Cassian. Já jsem ten, kdo ti přinese tvé věci nazpět.
//	AI_Output			(self, hero, "WRK_225_STOLEN_00_04"); //Das wurde ja auch Zeit, das sich endlich mal jemand der Sache annimmt.
	AI_Output			(self, hero, "WRK_225_STOLEN_00_04"); //Už je také na čase, aby se tím konečně někdo začal zaobírat.
//	AI_Output			(self, hero, "WRK_225_STOLEN_00_05"); //Es war Huldrych! Er hat mich bestohlen! Mich! Ich habe ihn gesehen! Mit meinen eigenen Augen!
	AI_Output			(self, hero, "WRK_225_STOLEN_00_05"); //Byl to Huldrych! To on mě okradl! Mě! Viděl jsem ho! Svýma vlastníma očima!

};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_WAREZ		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	condition	 = 	WRK_225_Agon_WAREZ_Condition;
	information	 = 	WRK_225_Agon_WAREZ_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was ist dir gestohlen worden?";
	description	 = 	"Co ti bylo odcizeno?";
};

func int WRK_225_Agon_WAREZ_Condition ()
{
	if Npc_KnowsInfo (hero,WRK_225_Agon_STOLEN)
	{
		return TRUE;
	};
};
func void WRK_225_Agon_WAREZ_Info ()
{
//	AI_Output			(hero, self, "WRK_225_WAREZ_15_01"); //Was ist dir gestohlen worden?
	AI_Output			(hero, self, "WRK_225_WAREZ_15_01"); //Co ti bylo odcizeno?
//	AI_Output			(self, hero, "WRK_225_WAREZ_00_02"); //Mein Silber! Mein gesamtes Silber hat er gestohlen!
	AI_Output			(self, hero, "WRK_225_WAREZ_00_02"); //Mé stříbro! Mé veškeré stříbro mi ukradl!
//	AI_Output			(hero, self, "WRK_225_WAREZ_15_03"); //Und wieviel Silber war das so?
	AI_Output			(hero, self, "WRK_225_WAREZ_15_03"); //A kolik stříbra to bylo?
//	AI_Output			(self, hero, "WRK_225_WAREZ_00_04"); //100 Silberstücke! Jeden Taler habe ich mir mühsam zusammengespart! Dieser dreckige Langfinger muss bestraft werden!
	AI_Output			(self, hero, "WRK_225_WAREZ_00_04"); //100 stříbrných! Jednu minci k druhé jsem pracně střádal! Ten špinavý kapsář musí být potrestán!
//	AI_Output			(self, hero, "WRK_225_WAREZ_00_05"); //Diese Herumtreiber machen was sie wollen. Und wir, die EHRLICHEN Händler, die SCHUFTEN und ARBEITEN, wir sind die Opfer.
	AI_Output			(self, hero, "WRK_225_WAREZ_00_05"); //Tihle obejdové si dělají, co chtějí. A my, my SKUTEČNÍ obchodníci, kteří DŘEME a PRACUJEME, jsme oběti.
//	AI_Output			(hero, self, "WRK_225_WAREZ_15_06"); //Jaja, schon gut. 100 Silberstücke. Alles klar. Ich nehme mir diesen Huldrych mal vor.
	AI_Output			(hero, self, "WRK_225_WAREZ_15_06"); //Jojo, už chápu. 100 stříbrných. Vše jasné. Oťukám si tohoto Huldrycha.

//	B_LogEntry (CH1_Train1h,"Huldrych hat Agon 100 Silberstücke gestohlen.");
	B_LogEntry (CH1_Train1h,"Huldrych ukradl Agonovi 100 stříbrných.");
};
///////////////////////////////////////////////////////////////////////
//	Info AGAINSILVER
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_AGAINSILVER		(C_INFO)
{
	npc		 	= 	WRK_225_Agon;
	nr		 	= 	15;
	condition	 = 	WRK_225_Agon_AGAINSILVER_Condition;
	information	 = 	WRK_225_Agon_AGAINSILVER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wieviel Silber hat er dir gestohlen?";
	description	 = 	"Kolik stříbra ti ukradl?";
};

func int WRK_225_Agon_AGAINSILVER_Condition ()
{
	if Npc_KnowsInfo (hero,WRK_225_Agon_WAREZ)
	&&!Npc_KnowsInfo (hero,WRK_225_Agon_100)
	&& Cassian_BeatHudrych == LOG_RUNNING
	{
		return TRUE;
	};
};
func void WRK_225_Agon_AGAINSILVER_Info ()
{
//	AI_Output			(hero, self, "WRK_225_AGAINSILVER_15_01"); //Wieviel Silber hat er dir gestohlen?
	AI_Output			(hero, self, "WRK_225_AGAINSILVER_15_01"); //Kolik stříbra ti ukradl?
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_02"); //1 0 0.  Einhundert! Kannst du dir nicht mal eine einfache Zahl merken?
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_02"); //1 0 0.  Jedno sto! To si nemůžeš zapamatovat ani jedno prosté číslo?
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_03"); //Oh Mann! Da haben wir es. Keiner nimmt uns Händler ernst! Sie schicken mir den letzten Deppen!
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_03"); //Ach, chlape! Tady to máme. Nikdo nebere nás, obchodníky, vážně! Posílají mi sem úplné idioty!
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_04"); //Huldrych war sein Name. Hattest du das etwa auch vergessen ??
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_00_04"); //Huldrych se jmenoval. To jsi taky zapomněl??

	Info_ClearChoices (WRK_225_Agon_AGAINSILVER);

//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Bleib ruhig, oder du kannst dir dein Silber selber holen!", WRK_225_Agon_AGAINSILVER_SILVER );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Buď v klidu, nebo si to zlato můžeš přinést sám!", WRK_225_Agon_AGAINSILVER_SILVER );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Schon gut. Reg dich nicht auf!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Tak dobrý. Nerozčiluj se!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Ich geh mal zu Huldrych", WRK_225_Agon_AGAINSILVER_HULDRYCH );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Jdu za Huldrychem.", WRK_225_Agon_AGAINSILVER_HULDRYCH );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Tatsächlich, sein Name war mir entfallen", WRK_225_Agon_AGAINSILVER_NAME );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Vlastně ano, nějak mi to jméno nějak vypadlo z hlavy.", WRK_225_Agon_AGAINSILVER_NAME );
};
func void WRK_225_Agon_AGAINSILVER_NAME ()
{
//	AI_Output			(hero, self, "WRK_225_AGAINSILVER_NAME_15_01"); //Tatsächlich, sein Name war mir entfallen.
	AI_Output			(hero, self, "WRK_225_AGAINSILVER_NAME_15_01"); //Vlastně ano, nějak mi to jméno nějak vypadlo z hlavy.
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_NAME_00_02"); //Unglaublich! Warum hat Cassian mir nicht direkt einen von den Kranken geschickt?
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_NAME_00_02"); //Neskutečné! Proč mi Cassian neposlal rovnou někoho ze Čtvrti nemocných?
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_NAME_00_03"); //Jeder Scavenger hat mehr Verstand im Kopf als du!
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_NAME_00_03"); //I mrchožrout toho má v hlavně víc než ty!

	Info_ClearChoices (WRK_225_Agon_AGAINSILVER);
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Bleib ruhig, oder du kannst dir dein Silber selber holen!", WRK_225_Agon_AGAINSILVER_SILVER );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Buď v klidu, nebo si to zlato můžeš přinést sám!", WRK_225_Agon_AGAINSILVER_SILVER );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Schon gut. Reg dich nicht auf!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Tak dobrý. Nerozčiluj se!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Ich geh mal zu Huldrych", WRK_225_Agon_AGAINSILVER_HULDRYCH );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Jdu za Huldrychem.", WRK_225_Agon_AGAINSILVER_HULDRYCH );
};


func void WRK_225_Agon_AGAINSILVER_SILVER ()
{
//	AI_Output			(hero, self, "WRK_225_AGAINSILVER_SILVER_15_01"); //Bleib ruhig, oder du kannst dir dein Silber selber holen!
	AI_Output			(hero, self, "WRK_225_AGAINSILVER_SILVER_15_01"); //Buď v klidu, nebo si to zlato můžeš přinést sám!
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_SILVER_00_02"); //Das wird ja immer besser! Jetzt willst du mir drohen? Das ist ja wohl das letzte!
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_SILVER_00_02"); //Však to taky bude lepší! Teď mi chceš ještě vyhrožovat? To už by byl vrchol!
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_SILVER_00_03"); //Ich glaube ich rede mal ein paar Takte mit Cassian!
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_SILVER_00_03"); //Řekl bych, že tohle si budu muset vyříkat s Cassianem!

	Info_ClearChoices (WRK_225_Agon_AGAINSILVER);
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Schon gut. Reg dich nicht auf!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Tak dobrý. Nerozčiluj se!", WRK_225_Agon_AGAINSILVER_CALMDOWN );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Ich geh mal zu Huldrych", WRK_225_Agon_AGAINSILVER_HULDRYCH );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Jdu za Huldrychem.", WRK_225_Agon_AGAINSILVER_HULDRYCH );
};
func void WRK_225_Agon_AGAINSILVER_HULDRYCH ()
{
//	AI_Output			(hero, self, "WRK_225_AGAINSILVER_HULDRYCH_15_01"); //Ich geh mal zu Huldrych
	AI_Output			(hero, self, "WRK_225_AGAINSILVER_HULDRYCH_15_01"); //Jdu za Huldrychem.
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_HULDRYCH_00_02"); //Ja mach das. Bevor du das auch wieder vergisst! HAHAHA
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_HULDRYCH_00_02"); //Jo, to udělej. Než to zase zapomeneš! HAHAHA!

	AI_StopProcessInfos (self);
};

func void WRK_225_Agon_AGAINSILVER_CALMDOWN ()
{
//	AI_Output			(hero, self, "WRK_225_AGAINSILVER_CALMDOWN_15_01"); //Schon gut. Reg dich nicht auf!
	AI_Output			(hero, self, "WRK_225_AGAINSILVER_CALMDOWN_15_01"); //Tak dobrý. Nerozčiluj se!
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_CALMDOWN_00_02"); //Beschwichtige mich nicht, als wäre ich ein altes Waschweib!
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_CALMDOWN_00_02"); //Nesnaž se mě uklidňovat jako nějakou starou pradlenu!
//	AI_Output			(self, hero, "WRK_225_AGAINSILVER_CALMDOWN_00_03"); //Sieh lieber zu das ich mein Silber wiederbekomme! Was stehst du hier noch rum? Hast du vergessen wie man geht?
	AI_Output			(self, hero, "WRK_225_AGAINSILVER_CALMDOWN_00_03"); //Dej si spíš záležet na tom, abys získal zpět mé stříbro! Tak co tu ještě stojíš? Zapomněl jsi, jak se chodí?

	Info_ClearChoices (WRK_225_Agon_AGAINSILVER);
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Bleib ruhig, oder du kannst dir dein Silber selber holen!", WRK_225_Agon_AGAINSILVER_SILVER );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Buď v klidu, nebo si to zlato můžeš přinést sám!", WRK_225_Agon_AGAINSILVER_SILVER );
//	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Ich geh mal zu Huldrych", WRK_225_Agon_AGAINSILVER_HULDRYCH );
	Info_AddChoice	(WRK_225_Agon_AGAINSILVER, "Jdu za Huldrychem.", WRK_225_Agon_AGAINSILVER_HULDRYCH );
};
///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_WHERE		(C_INFO)
{
	npc			 = 	WRK_225_Agon;
	nr		 	 = 	20;
	condition	 = 	WRK_225_Agon_WHERE_Condition;
	information	 = 	WRK_225_Agon_WHERE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Weißt du, wo ich Huldrych finden kann?";
	description	 = 	"Víš, kde mohu najít Huldrycha?";
};

func int WRK_225_Agon_WHERE_Condition ()
{
	if Npc_KnowsInfo(hero,WRK_225_Agon_STOLEN)
	&& !Npc_KnowsInfo(hero,WRK_225_Agon_100)
	&& Cassian_BeatHudrych == LOG_RUNNING
	{
		return TRUE;
	};
};
func void WRK_225_Agon_WHERE_Info ()
{
//	AI_Output			(hero, self, "WRK_225_WHERE_15_01"); //Weißt du, wo ich Huldrych finden kann?
	AI_Output			(hero, self, "WRK_225_WHERE_15_01"); //Víš, kde mohu najít Huldrycha?
//	AI_Output			(self, hero, "WRK_225_WHERE_00_02"); //Ich glaube, er treibt sich irgendwo am hinteren Tor rum!
	AI_Output			(self, hero, "WRK_225_WHERE_00_02"); //Řekl bych, že se potlouká někde kolem zadní brány!
};
///////////////////////////////////////////////////////////////////////
//	Info 100
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_100		(C_INFO)
{
	npc			 = 	WRK_225_Agon;
	nr			 = 	10;
	condition	 = 	WRK_225_Agon_100_Condition;
	information	 = 	WRK_225_Agon_100_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Hier sind deine 100 Silberstücke";
	description	 = 	"Zde je tvých 100 stříbrných.";
};

func int WRK_225_Agon_100_Condition ()
{
	if	(Npc_HasItems (hero, ItMi_Silver) >= 100)
	&&	Npc_KnowsInfo(hero,WRK_225_Agon_WAREZ)
	&&	(Cassian_BeatHudrych != LOG_FAILED)
	&&	(Cassian_BeatHudrych != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void WRK_225_Agon_100_Info ()
{
//	AI_Output			(hero, self, "WRK_225_100_15_01"); //Hier sind deine 100 Silberstücke.
	AI_Output			(hero, self, "WRK_225_100_15_01"); //Zde je tvých 100 stříbrných.
	B_GiveInvItems		(hero, self, ItMi_Silver,100);
//	AI_Output			(self, hero, "WRK_225_100_00_02"); //Ausgezeichnet. Vielen Dank. Ich hoffe das Huldrych das bekommen hat, was er verdient. Na, ist nicht wichtig, Hauptsache ich habe mein Geld wieder!
	AI_Output			(self, hero, "WRK_225_100_00_02"); //Výtečně. Velice děkuji. Doufám, že Huldrych dostal, co si zasloužil. Ale, to není důležité, hlavní věc je, že mám zpět své stříbro!

	B_GiveXP			(XP_AgonSilverSelf);

	if Npc_KnowsInfo (hero,WRK_225_Agon_AGAINSILVER)
	{
//		AI_Output		(self, hero, "WRK_225_100_00_03"); //Ach und übrigens, entschuldige meine Aufgebrachtheit vorhin, aber ich war etwas in Rage.
		AI_Output		(self, hero, "WRK_225_100_00_03"); //Ach a mimochodem, omluv moje rozčilení, byl jsem nějak v ráži.
	};
//	AI_Output			(self, hero, "WRK_225_100_00_04"); //Wenn du mal wieder irgendwas brauchst, dann komme zu mir. Ich habe die günstigsten Angebote und die besten Waren!
	AI_Output			(self, hero, "WRK_225_100_00_04"); //Pokud bys zase něco potřeboval, tak ke mně přijď. Mám nejnižší ceny a nejlepší zboží!


//	B_LogEntry (CH1_Train1h,"Agon hat seine 100 Silberstücke wieder. Aber ausser seinem Dank hat der Geizkragen keine Belohnung herausgerückt. Damit habe ich einen Teil von Cassians Auftrag erfüllt.");
	B_LogEntry (CH1_Train1h,"Agon má svých 100 stříbrných nazpět. Ale kromě svých svých díků mi ten skrblík nedal žádnou odměnu. Splnil jsem tím část Cassianova příkazu.");
};





//#####################################################################
//##
//##
//##					REZEPTUR FÜR TALAMON
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HAVERECIPE
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_HAVERECIPE		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	condition	 = 	WRK_225_Agon_HAVERECIPE_Condition;
	information	 = 	WRK_225_Agon_HAVERECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe gehört, du bist im Besitz einer bestimmten Rezeptur!";
	description	 = 	"Slyšel jsem, že vlastníš jistou recepturu!";
};

func int WRK_225_Agon_HAVERECIPE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_SEARCHRECIPE)
	{
		return TRUE;
	};
};

func void WRK_225_Agon_HAVERECIPE_Info ()
{
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_15_01"); //Ich habe gehört, du bist im Besitz einer bestimmten Rezeptur!
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_15_01"); //Slyšel jsem, že vlastníš jistou recepturu!
//	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_02"); //Ich habe vieles, nach was für einer Rezeptur suchst du?
	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_02"); //Mám mnoho věcí, jaký recept zrovna hledáš?
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_15_03"); //Lester verkaufte dir vor einiger Zeit eine Rezeptur für ein Mittel gegen Wahnsinn.
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_15_03"); //Lester ti nedávno prodal recept na prostředek proti šílenství.
//	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_04"); //Ahhh... du willst diese Rezeptur wohl haben was? Das wird dich eine Kleinigkeit kosten.
	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_04"); //Ahhh... ty chceš tenhleten recept! To tě bude stát takovou maličkost.
//	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_05"); //Sagen wir 500 Silber!
	AI_Output			(self, hero, "WRK_225_HAVERECIPE_09_05"); //Řekněme 500 stříbrných!

	Info_ClearChoices	(WRK_225_Agon_HAVERECIPE);
//	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "Wer trägt schon soviel Silber mit sich herum?", WRK_225_Agon_HAVERECIPE_NOTNOW );
	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "Kdo s sebou nosí najednou tolik stříbra?", WRK_225_Agon_HAVERECIPE_NOTNOW );
//	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "Hier ist das Silber.", WRK_225_Agon_HAVERECIPE_GIVE );
	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "Tady je to stříbro.", WRK_225_Agon_HAVERECIPE_GIVE );
//	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "Das ist Wucher. Diese Rezeptur ist niemals soviel Wert!", WRK_225_Agon_HAVERECIPE_PROFITEERING );
	Info_AddChoice		(WRK_225_Agon_HAVERECIPE, "To je lichva. Takovou hodnotu ten recept rozhodně nemá!", WRK_225_Agon_HAVERECIPE_PROFITEERING );

	CreateInvItem		(self, ItAr_ScrollHealPossessed);
};
func void WRK_225_Agon_HAVERECIPE_PROFITEERING ()
{
	Info_ClearChoices	(WRK_225_Agon_HAVERECIPE);
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_PROFITEERING_15_01"); //Das ist Wucher. Diese Rezeptur ist niemals soviel Wert!
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_PROFITEERING_15_01"); //To je lichva. Takovou hodnotu ten recept rozhodně nemá!
//	AI_Output			(self, hero, "WRK_225_HAVERECIPE_PROFITEERING_09_02"); //Oh... das liegt immer im Auge des Betrachters. Es scheint mir, als ob du diesen Preis zahlen würdest.
	AI_Output			(self, hero, "WRK_225_HAVERECIPE_PROFITEERING_09_02"); //Oh... to záleží vždycky na úhlu pohledu. Mně se zdá, že tuhle cenu klidně zaplatíš.
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_PROFITEERING_15_03"); //(wütend) Wir sehen uns wieder!
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_PROFITEERING_15_03"); //(rozzlobeně) Ještě se uvidíme!

//	B_LogEntry			(CH1_LearnAlchemy, "Agon hat mir die Rezeptur für 500 Silber zum Kauf angeboten. Das ist Wucher. Ich sollte Talamon davon berichten.");
	B_LogEntry			(CH1_LearnAlchemy, "Agon mi za recept dal nabídku 500 stříbrných. To je lichva. Měl bych o tom zpravit Talamona.");

	AI_StopProcessInfos	(self);
};

func void WRK_225_Agon_HAVERECIPE_GIVE ()
{
	Info_ClearChoices	(WRK_225_Agon_HAVERECIPE);
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_GIVE_15_01"); //Hier ist das Silber.
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_GIVE_15_01"); //Tady je to stříbro.
	if	(Npc_HasItems(hero, ItMi_Silver) < AGON_FORMULA_PRICE)
	{
		B_Say			(self, hero, "$NotEnoughSilver");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, AGON_FORMULA_PRICE);
//		AI_Output		(self, hero, "WRK_225_HAVERECIPE_GIVE_09_02"); //Ahh... Geschäfte mit dir sind sehr... lukrativ!
		AI_Output		(self, hero, "WRK_225_HAVERECIPE_GIVE_09_02"); //Ahh... Obchody s tebou jsou velice... lukrativní!
		B_GiveInvItems	(self, hero, ItAr_ScrollHealPossessed, 1);
		Agon_BoughtFormula = TRUE;

//		B_LogEntry			(CH1_LearnAlchemy, "Ich konnte die Rezeptur dem Händler Agon für sehr viel Silber abkaufen. Ich hoffe sie ist es wert.");
		B_LogEntry			(CH1_LearnAlchemy, "Můžu si ten recept koupit u obchodníka Agona za opravdu hodně stříbra. Doufám, že za to bude stát.");

		AI_StopProcessInfos(self);
	};
};

func void WRK_225_Agon_HAVERECIPE_NOTNOW ()
{
	Info_ClearChoices	(WRK_225_Agon_HAVERECIPE);
//	AI_Output			(hero, self, "WRK_225_HAVERECIPE_NOTNOW_15_01"); //Wer trägt schon soviel Silber mit sich herum?
//	AI_Output			(self, hero, "WRK_225_HAVERECIPE_NOTNOW_09_02"); //Du hast das Silber nicht dabei? Kein Problem, du kannst jederzeit wiederkommen!
	AI_Output			(hero, self, "WRK_225_HAVERECIPE_NOTNOW_15_01"); //Kdo s sebou nosí najednou tolik stříbra?
	AI_Output			(self, hero, "WRK_225_HAVERECIPE_NOTNOW_09_02"); //Nemáš stříbro u sebe? Žádný problém, můžeš přijít kdykoliv jindy!

//	B_LogEntry			(CH1_LearnAlchemy, "Agon verlangt einen sehr hohen Preis für die Rezeptur. Ich habe ihn vertröstet und sollte am besten nochmal mit Talamon sprechen.");
	B_LogEntry			(CH1_LearnAlchemy, "Agon vyžaduje velmi vysokou cenu za recept. Nabídku jsem odložil a měl bych si znovu promluvit s Talamonem.");

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GIVESILVER
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_GIVESILVER		(C_INFO)
{
	npc		 = 	WRK_225_Agon;
	condition	 = 	WRK_225_Agon_GIVESILVER_Condition;
	information	 = 	WRK_225_Agon_GIVESILVER_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	B_BuildBuyString("Rezeptur für Talamon kaufen", AGON_FORMULA_PRICE);
	description	 = 	B_BuildBuyString("Koupit recept Talamonovi", AGON_FORMULA_PRICE);
};

func int WRK_225_Agon_GIVESILVER_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_225_Agon_HAVERECIPE)
	&&	!Agon_BoughtFormula
	&&	!Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&&	!Npc_KnowsInfo (hero,HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};

func void WRK_225_Agon_GIVESILVER_Info ()
{
	if	(Npc_HasItems(hero, ItMi_Silver) < AGON_FORMULA_PRICE)
	{
		B_Say			(self, hero, "$NotEnoughSilver");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, AGON_FORMULA_PRICE);

		if	Agon_Blackmailed
		{
//			AI_Output		(self, hero, "WRK_225_GIVESILVER_09_01"); //(verärgert) Gib das Silber schon her, du Erpresser!
			AI_Output		(self, hero, "WRK_225_GIVESILVER_09_01"); //(naštvaný) Vyklop to stříbro, ty vyděrači!
		}
		else
		{
//			AI_Output		(self, hero, "WRK_225_GIVESILVER_09_02"); //Mit dir Geschäfte zu machen ist ein wahres Vergnügen.
			AI_Output		(self, hero, "WRK_225_GIVESILVER_09_02"); //Obchodovat s tebou je pravé potěšení.
		};

		B_GiveInvItems	(self, hero, ItAr_ScrollHealPossessed, 1);
		Agon_BoughtFormula = TRUE;
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ANTIDOTE
///////////////////////////////////////////////////////////////////////
instance WRK_225_Agon_ANTIDOTE		(C_INFO)
{
	npc		 	 = 	WRK_225_Agon;
	condition	 = 	WRK_225_Agon_ANTIDOTE_Condition;
	information	 = 	WRK_225_Agon_ANTIDOTE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich habe da etwas, dass dich interessieren könnte...";
	description	 = 	"Mám tu něco, co by tě mohlo zajímat...";
};

func int WRK_225_Agon_ANTIDOTE_Condition ()
{
	if	Npc_HasItems(hero,ItFo_Placebo)
	&&	!Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&&	!Npc_KnowsInfo (hero,HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};

func void WRK_225_Agon_ANTIDOTE_Info ()
{
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_01"); //Ich habe da etwas, dass dich interessieren könnte...
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_01"); //Mám tu něco, co by tě mohlo zajímat...
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_02"); //Ich habe es eben von Talamon erworben. Es ist ein Trank, der vor der Krankheit schützt...
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_02"); //Tohle jsem právě dostal od Talamona. Je to lektvar, který chrání před Nemocí...
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_09_03"); //(erwartungsvoll) Ein Heilmittel???
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_09_03"); //(dychtivě) Lék???
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_04"); //Nein! Es kann nicht heilen, aber es verhindert die Ansteckung. Die Heiler wenden es auf sich selbst an.
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_04"); //Ne! Nedokáže to léčit, ale zabrání to nákaze. Léčitelé to používají sami na sobě.
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_09_05"); //(gierig) Was willst du dafür haben, schnell sag!
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_09_05"); //(dychtivě) Co za to chceš, rychle mluv!
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_06"); //Nun, das wird dich eine Kleinigkeit kosten...
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_15_06"); //No, bude tě to stát takovou maličkost...

//	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Ich will 1000 Silber sehen!",							WRK_225_Agon_ANTIDOTE_EXPENSIVE );
	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Chci za to vidět 1000 stříbrných!",					WRK_225_Agon_ANTIDOTE_EXPENSIVE );
//	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Wie wäre es mit 600 Silber?", 							WRK_225_Agon_ANTIDOTE_MODERATE );
	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Co kdybychom to dali za 600 stříbrných?",				WRK_225_Agon_ANTIDOTE_MODERATE );
//	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Ich schlage einen Tausch vor: Rezeptur gegen Trank",	WRK_225_Agon_ANTIDOTE_TRADE );
	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Navrhuju výměnu: recept za nápoj.",					WRK_225_Agon_ANTIDOTE_TRADE );
//	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Sagen wir 400 Silber",									WRK_225_Agon_ANTIDOTE_CHEAP );
	Info_AddChoice	(WRK_225_Agon_ANTIDOTE, "Řekněme 400 stříbrných.",								WRK_225_Agon_ANTIDOTE_CHEAP );


};
func void WRK_225_Agon_ANTIDOTE_CHEAP ()
{
	Info_ClearChoices	(WRK_225_Agon_ANTIDOTE);
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_CHEAP_15_01"); //Sagen wir 400 Silber
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_CHEAP_15_01"); //Řekněme 400 stříbrných.
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_CHEAP_09_02"); //(übereifrig) Das Geschäft gilt, hier ist das Silber. Nun gib mir schon endlich den Trank.
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_CHEAP_09_02"); //(velmi horlivě) Obchod platí, tady je stříbro! Dej mi teď konečně ten lektvar.

	B_GiveInvItems		(hero, self, ItFo_Placebo, 1);
	Npc_RemoveInvItem	(self,		 ItFo_Placebo);
	B_GiveInvItems		(self, hero, ItMi_Silver, 400);
};

func void WRK_225_Agon_ANTIDOTE_MODERATE ()
{
	Info_ClearChoices	(WRK_225_Agon_ANTIDOTE);
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_MODERATE_15_01"); //Wie wäre es mit 600 Silber?
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_MODERATE_15_01"); //Co kdybychom to dali za 600 stříbrných?

	B_GiveInvItems		(hero, self, ItFo_Placebo, 1);
	Npc_RemoveInvItem	(self,		 ItFo_Placebo);
	B_GiveInvItems		(self, hero, ItMi_Silver, 600);

//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_MODERATE_09_02"); //Du bist ein wirklicher Erpresser..
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_MODERATE_09_02"); //Ty jsi neskutečný vyděrač...
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_MODERATE_15_03"); //Oh... das liegt immer im Auge des Betrachters. Es schien mir, als ob du diesen Preis bezahlen würdest.
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_MODERATE_15_03"); //Oh... to záleží vždycky na úhlu pohledu. Mně se zdá, že tuhle cenu klidně zaplatíš .
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_MODERATE_09_04"); //(bedrohlich) Das werde ich nicht so schnell vergessen.
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_MODERATE_09_04"); //(výhružně) Na tohle jen tak nezapomenu.

	Agon_Blackmailed	= TRUE;
};

func void WRK_225_Agon_ANTIDOTE_EXPENSIVE ()
{
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_EXPENSIVE_15_01"); //Ich will 1000 Silber sehen!
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_EXPENSIVE_09_02"); //Halte mich nicht zum Narren. Ich werde diesen Trank nicht zu jedem Preis kaufen!
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_EXPENSIVE_15_01"); //Chci za to vidět 1000 stříbrných!
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_EXPENSIVE_09_02"); //Nedělej ze mě blázna. Nebudu ten lektvar kupovat za každou cenu!
};

func void WRK_225_Agon_ANTIDOTE_TRADE ()
{
	Info_ClearChoices	(WRK_225_Agon_ANTIDOTE);
//	AI_Output			(hero, self, "WRK_225_ANTIDOTE_TRADE_15_01"); //Ich schlage einen Tausch vor: Rezeptur gegen Trank.
	AI_Output			(hero, self, "WRK_225_ANTIDOTE_TRADE_15_01"); //Navrhuju výměnu: recept za nápoj.
//	AI_Output			(self, hero, "WRK_225_ANTIDOTE_TRADE_09_02"); //Warum nicht. Scheint mir ein faires Angebot zu sein.
	AI_Output			(self, hero, "WRK_225_ANTIDOTE_TRADE_09_02"); //Proč ne. Přijde mi to jako férová nabídka.

	B_GiveInvItems		(hero, self, ItFo_Placebo, 1);
	Npc_RemoveInvItem	(self,		 ItFo_Placebo);
	B_GiveInvItems		(self, hero, ItAr_ScrollHealPossessed, 1);
	Agon_BoughtFormula	= TRUE;
};


















