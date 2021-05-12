///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE HLR_501_Talamon_EXIT   (C_INFO)
{
	npc         = HLR_501_Talamon;
	nr          = 999;
	condition   = HLR_501_Talamon_EXIT_Condition;
	information = HLR_501_Talamon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT HLR_501_Talamon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID HLR_501_Talamon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##					Kapitel 1  -  Begrüssung
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_HI	(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_HI_Condition;
	information	 = 	HLR_501_Talamon_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Bist du einer der Heiler?";
	description	 = 	"Ty jsi jeden z léčitelů?";
};

func int HLR_501_Talamon_HI_Condition ()
{
	return TRUE;
};

func void HLR_501_Talamon_HI_Info ()
{
//	AI_Output			(hero, self, "HLR_501_HI_15_01"); //Bist du einer der Heiler?
	AI_Output			(hero, self, "HLR_501_HI_15_01"); //Ty jsi jeden z léčitelů?
//	AI_Output			(self, hero, "HLR_501_HI_08_02"); //Ja. Zusammen mit Palgur und Isgar helfe ich den Kranken hier im Viertel.
	AI_Output			(self, hero, "HLR_501_HI_08_02"); //Ano. Spolu s Palgurem a Isgarem pomáháme nemocným v této čtvrti.
//	AI_Output			(hero, self, "HLR_501_HI_15_03"); //Was ist das für eine Krankheit?
	AI_Output			(hero, self, "HLR_501_HI_15_03"); //Co to je za nemoc?
//	AI_Output			(self, hero, "HLR_501_HI_08_04"); //Die Kranken essen kaum noch und reden wirres Zeug. Schau sie dir an, ein wirklich elender Anblick!
	AI_Output			(self, hero, "HLR_501_HI_08_04"); //Nemocní téměř nejí a plete se jim řeč! Jen se podívej, opravdu ubohý pohled!
//	AI_Output			(self, hero, "HLR_501_HI_08_05"); //Wir kennen die Ursache noch nicht. Aber wir forschen unermüdlich um mehr über die Krankheit zu erfahren.
	AI_Output			(self, hero, "HLR_501_HI_08_05"); //Zatím neznáme příčinu. Ale neúnavně pátráme po tom, abychom o této nemoci zjistili více.
};

///////////////////////////////////////////////////////////////////////
//	Info WANTTOLEARN
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WANTTOLEARN		(C_INFO)
{
	npc		 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_WANTTOLEARN_Condition;
	information	 = 	HLR_501_Talamon_WANTTOLEARN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kannst du mir zeigen, wie man magische Tränke braut?";
	description	 = 	"Můžeš mi ukázat, jak se vaří magické nápoje?";
};

func int HLR_501_Talamon_WANTTOLEARN_Condition ()
{
	if	Npc_KnowsInfo  (hero, HLR_501_Talamon_HI)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_WANTTOLEARN_Info ()
{
//	AI_Output			(hero, self, "HLR_501_WANTTOLEARN_15_01"); //Kannst du mir zeigen, wie man magische Tränke braut?
	AI_Output			(hero, self, "HLR_501_WANTTOLEARN_15_01"); //Můžeš mi ukázat, jak se vaří magické nápoje?
//	AI_Output			(self, hero, "HLR_501_WANTTOLEARN_08_02"); //Ich bin zu beschäftigt, um dich in der Alchemie zu unterweisen.
	AI_Output			(self, hero, "HLR_501_WANTTOLEARN_08_02"); //Jsem příliš zaneprázdněn na to, abych tě naučil alchymii.

	Log_CreateTopic		(CH1_LearnAlchemy, LOG_MISSION);
	Log_SetTopicStatus	(CH1_LearnAlchemy, LOG_RUNNING);
//	B_LogEntry          (CH1_LearnAlchemy, "Talamon, einer der Heiler im Krankenviertel scheint sich mit magischen Tränken zu beschäftigen. Er will sich allerdings nicht die Zeit nehmen, um mir seine Kunst zu vermitteln.");
	B_LogEntry          (CH1_LearnAlchemy, "Talamon, jeden z léčitelů v čtvrti nemocných, se zabývá přípravou magických nápojů. Bohužel si neudělá čas na to, aby mě naučil svému umění.");
};



///////////////////////////////////////////////////////////////////////
//	Info WHATDOYODO
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHATDOYODO        (C_INFO)
{
	npc         =	HLR_501_Talamon;
	nr			=	2;
	condition	=	HLR_501_Talamon_WHATDOYODO_Condition;
	information	=   HLR_501_Talamon_WHATDOYODO_Info;
	important	=	FALSE;
	permanent  	=	FALSE;
//	description	=	"Was ist es, was dich so sehr beschäftigt?";
	description	=	"Kvůli čemu jsi tak zaneprázdněný?";
};

func int HLR_501_Talamon_WHATDOYODO_Condition ()
{
	if	Npc_KnowsInfo  (hero, HLR_501_Talamon_WANTTOLEARN)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_WHATDOYODO_Info ()
{
//	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_01"); //Was ist es, was dich so sehr beschäftigt?
	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_01"); //Kvůli čemu jsi tak zaneprázdněný?
//	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_02"); //Wir suchen nach einem Mittel, das den Verstand der Kranken aufklärt. So könnten wir die Armen Teufel befragen und mehr über diese Krankheit erfahren.
	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_02"); //Pátráme po prostředku, který by vyjasnil mysl nemocných. Pak bychom mohli ty chudáky vyzpovídat a zjistit více o této nemoci. 
//	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_03"); //Vor langer Zeit haben sich die Feuermagier mit einer solchen Rezeptur beschäftigt.
	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_03"); //Už před časem se takovou recepturou zabývali Mágové Ohně.
//	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_04"); //Gibt es denn Feuermagier hier im Alten Lager?
	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_04"); //Tady ve Starém táboře jsou Mágové Ohně?
//	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_05"); //Nein, schon lange nicht mehr. Wir haben ihr Magierhaus in der Burg durchsucht, aber keine Hinweise auf die Rezeptur gefunden. // Přijde mi dobré to odlišit, takže používám recept = kuchařský; receptura = alchymistická.
	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_05"); //Ne, už dlouho ne. Prohledali jsme sídlo mágů na hradě skrz naskrz, ale nenašli jsme ani stopu po receptuře.
//	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_06"); //Wenn sie wirklich existiert... wenn wir sie finden würden... wenn sie tatsächlich wirksam wäre...
	AI_Output			(self, hero, "HLR_501_WHATDOYODO_08_06"); //Pokud skutečně existuje... pokud bychom ji našli... pokud by skutečně zabrala...
//	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_07"); //...schon klar! Hab verstanden!
	AI_Output			(hero, self, "HLR_501_WHATDOYODO_15_07"); //...je mi to jasné! Rozuměl jsem!
};

///////////////////////////////////////////////////////////////////////
//	Info RECIPEFORMONEY
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_RECIPEFORMONEY		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	1;
	condition	 = 	HLR_501_Talamon_RECIPEFORMONEY_Condition;
	information	 = 	HLR_501_Talamon_RECIPEFORMONEY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Dann hilfst du mir, wenn ich die Rezeptur finde?";
	description	 = 	"Pomůžeš mi tedy, pokud najdu recepturu?";
};

func int HLR_501_Talamon_RECIPEFORMONEY_Condition ()
{
	if	Npc_KnowsInfo  (hero, HLR_501_Talamon_WHATDOYODO)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_RECIPEFORMONEY_Info ()
{
//	AI_Output			(hero, self, "HLR_501_RECIPEFORMONEY_15_01"); //Dann hilfst du mir, wenn ich die Rezeptur finde?
	AI_Output			(hero, self, "HLR_501_RECIPEFORMONEY_15_01"); //Pomůžeš mi tedy, pokud najdu recepturu?
//	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_02"); //So sei es!
	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_02"); //Tak budiž!
//	AI_Output			(hero, self, "HLR_501_RECIPEFORMONEY_15_03"); //Gut, ich werde die Rezeptur suchen.
	AI_Output			(hero, self, "HLR_501_RECIPEFORMONEY_15_03"); //Dobrá, podívám se po té receptuře.
//	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_04"); //Wir haben Gordian ebenfalls mit der Suche beauftragt. Er besitzt noch alte Schriften aus der Zeit der Barriere.
	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_04"); //Také jsme pověřili Gordiana pátráním po receptuře. Má staré spisy ještě z dob bariéry.
//	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_05"); //Aber er hat die Rezeptur immer noch nicht gefunden.
	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_05"); //Ale recepturu stále ještě nenašel.
//	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_06"); //Ich hoffe, daß du erfolgreicher bist!
	AI_Output			(self, hero, "HLR_501_RECIPEFORMONEY_08_06"); //Doufám, že budeš úspěšnější!

//	B_LogEntry			(CH1_LearnAlchemy, "Ich habe Talamon zugesagt, die Rezeptur für ein Mittel zu suchen, dass den Verstand der Kranken für kurze Zeit aufklärt. Er versprach mir, danach hilfsbereit zu sein!");
	B_LogEntry			(CH1_LearnAlchemy, "Slíbil jsem Talamonovi, že se podívám po receptuře na prostředek, který by na krátký čas vyjasnil mysl nemocných. Na oplátku slíbil, že mi pak bude nápomocný!");
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsGordian
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHEREISGORDIAN		(C_INFO)
{
	npc			 = 	HLR_501_Talamon;
	nr		 	 = 	6;
	condition	 = 	HLR_501_Talamon_WHEREISGORDIAN_Condition;
	information	 = 	HLR_501_Talamon_WHEREISGORDIAN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo finde ich diesen Gordian?";
	description	 = 	"Kde najdu toho Gordiana?";
};

func int HLR_501_Talamon_WHEREISGORDIAN_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_RECIPEFORMONEY)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_WHEREISGORDIAN_Info ()
{
//	AI_Output			(hero, self, "HLR_501_WHEREISGORDIAN_15_01"); //Wo finde ich diesen Gordian?
	AI_Output			(hero, self, "HLR_501_WHEREISGORDIAN_15_01"); //Kde najdu toho Gordiana?
//	AI_Output			(self, hero, "HLR_501_WHEREISGORDIAN_08_02"); //Er hat eine Hütte am Marktplatz.
	AI_Output			(self, hero, "HLR_501_WHEREISGORDIAN_08_02"); //Má chatrč na tržišti.

//	B_LogEntry			(CH1_LearnAlchemy, "Gordian könnte etwas über diese Rezeptur wissen. Er hat eine Hütte am Marktplatz.");
	B_LogEntry			(CH1_LearnAlchemy, "Gordian může vědět něco o této receptuře. Má chatrč na tržišti.");
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RecipeRunning
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_RECIPERUNNING		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	12;
	condition	 = 	HLR_501_Talamon_RECIPERUNNING_Condition;
	information	 = 	HLR_501_Talamon_RECIPERUNNING_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich habe die Rezeptur noch nicht!";
	description	 = 	"Ještě tu recepturu nemám!";
};

func int HLR_501_Talamon_RECIPERUNNING_Condition ()
{
	if	Npc_KnowsInfo (hero, HLR_501_Talamon_WHEREISGORDIAN)
	&&	(Npc_HasItems (hero, ItAr_ScrollHealPossessed) < 1)
	&&	!Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_RECIPERUNNING_Info ()
{
//	AI_Output			(hero, self, "HLR_501_RECIPERUNNING_15_01"); //Ich habe die Rezeptur noch nicht!
	AI_Output			(hero, self, "HLR_501_RECIPERUNNING_15_01"); //Ještě tu recepturu nemám!
//	AI_Output			(self, hero, "HLR_501_RECIPERUNNING_08_02"); //Komm wieder, wenn Du sie gefunden hast. Dann werde ich dir bei deinen Anliegen behilflich sein.
	AI_Output			(self, hero, "HLR_501_RECIPERUNNING_08_02"); //Vrať se, až ji najdeš. Pak ti pomůžu s tvou žádostí.
};

///////////////////////////////////////////////////////////////////////
//	Info AGON
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_AGON		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_AGON_Condition;
	information	 = 	HLR_501_Talamon_AGON_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich weiss, wo die Rezeptur ist!";
	description	 = 	"Vím, kde je ta receptura!";
};

func int HLR_501_Talamon_AGON_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_WHEREISGORDIAN)
	&&	Npc_KnowsInfo (hero,WRK_225_Agon_HAVERECIPE)
	&&	!Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&&	!Agon_BoughtFormula
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_AGON_Info ()
{
//	AI_Output			(hero, self, "HLR_501_AGON_15_01"); //Ich weiss, wo die Rezeptur ist!
	AI_Output			(hero, self, "HLR_501_AGON_15_01"); //Vím, kde je ta receptura!
//	AI_Output			(self, hero, "HLR_501_AGON_08_02"); //Wirklich?	
	AI_Output			(self, hero, "HLR_501_AGON_08_02"); //Skutečně?
//	AI_Output			(hero, self, "HLR_501_AGON_15_03"); //Agon der Händler hat sie. Aber er will 500 Silber dafür haben.
	AI_Output			(hero, self, "HLR_501_AGON_15_03"); //Obchodník Agon ji má u sebe. Ale chce za ni 500 stříbrných.
//	AI_Output			(self, hero, "HLR_501_AGON_08_04"); //Das ist typisch Agon. Er ist ein richtiger Raffzahn.
	AI_Output			(self, hero, "HLR_501_AGON_08_04"); //To je typický Agon. Je to pořádný skrblík.
//	AI_Output			(self, hero, "HLR_501_AGON_08_05"); //Ein harter Brocken, aber er hat eine Schwäche. Seine panische Angst vor der Krankheit.
	AI_Output			(self, hero, "HLR_501_AGON_08_05"); //Je nesmlouvavý, ale má jednu slabost. Panický strach z té nemoci.
};

///////////////////////////////////////////////////////////////////////
//	Info ANTIDOTE
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_ANTIDOTE		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_ANTIDOTE_Condition;
	information	 = 	HLR_501_Talamon_ANTIDOTE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Mir kommt da eine Idee...";
	description	 = 	"Mám takový nápad...";
};

func int HLR_501_Talamon_ANTIDOTE_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_RECIPEFORMONEY)
	&&	Npc_KnowsInfo (hero,HLR_501_Talamon_AGON)
	&&	!Npc_HasItems(hero, ItAr_ScrollHealPossessed)
	&&	!Agon_BoughtFormula
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_ANTIDOTE_Info ()
{
//	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_01"); //Mir kommt da eine Idee...
	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_01"); //Mám takový nápad...
//	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_02"); //Hast du einen Trank, der wie ein Heilmittel gegen die Krankheit aussehen könnte?
	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_02"); //Máš nějaký nápoj, který by mohl vypadat jako lék proti té nemoci?
//	AI_Output			(self, hero, "HLR_501_ANTIDOTE_08_03"); //Vielleicht erinnerst du dich, dass wir nach einem solchen Mittel suchen...
	AI_Output			(self, hero, "HLR_501_ANTIDOTE_08_03"); //Snad si vzpomínáš, že přesně takový prostředek hledáme...
//	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_04"); //Er muss nur _AUSSEHEN_ als ob er heilt!
	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_04"); //Stačí jen aby VYPADAL, že léčí!
//	AI_Output			(self, hero, "HLR_501_ANTIDOTE_08_05"); //Hmmm... vielleicht tut es diese Tinktur hier, die bei einem missglückten Experiment herausgekommen ist.
	AI_Output			(self, hero, "HLR_501_ANTIDOTE_08_05"); //Hmmm... možná tato tinktura, která vzešla z jednoho neúspěšného experimentu.
	B_GiveInvItems		(self, hero, ItFo_Placebo, 1);
//	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_06"); //Wir werden sehen.
	AI_Output			(hero, self, "HLR_501_ANTIDOTE_15_06"); //Uvidíme.
};

///////////////////////////////////////////////////////////////////////
//	Info HasRecipe
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_HASRECIPE		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	4;
	condition	 = 	HLR_501_Talamon_HASRECIPE_Condition;
	information	 = 	HLR_501_Talamon_HASRECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe die Rezeptur!";
	description	 = 	"Mám tu recepturu!";
};

func int HLR_501_Talamon_HASRECIPE_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_RECIPEFORMONEY)
	&&	Npc_HasItems(other, ItAr_ScrollHealPossessed)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_HASRECIPE_Info ()
{
//	AI_Output			(hero, self, "HLR_501_HASRECIPE_15_01"); //Ich habe die Rezeptur!
	AI_Output			(hero, self, "HLR_501_HASRECIPE_15_01"); //Mám tu recepturu!
//	AI_Output			(self, hero, "HLR_501_HASRECIPE_08_02"); //Endlich! Zeig her!
	AI_Output			(self, hero, "HLR_501_HASRECIPE_08_02"); //Konečně! Ukaž!
	B_GiveInvItems		(hero, self, ItAr_ScrollHealPossessed, 1);
	B_UseFakeScroll		();
//	AI_Output			(self, hero, "HLR_501_HASRECIPE_08_03"); //Das ist sie. Du hast uns einen grossen Dienst erwiesen, ich danke dir.
	AI_Output			(self, hero, "HLR_501_HASRECIPE_08_03"); //Je to ona. Prokázal jsi nám obrovskou službu, díky.

//	B_LogEntry			(CH1_LearnAlchemy, "Talamon war sehr erfreut, daß ich die Rezeptur gefunden habe. Er wird sich jetzt Zeit für mich nehmen, so wie er es versprochen hatte.");
	B_LogEntry			(CH1_LearnAlchemy, "Talamona velmi potěšilo, že jsem že jsem recepturu našel. Teď si na mě najde čas, jak slíbil.");
	B_GiveXP			(XP_Talamon_BringFormula);

	// Phoenix-Rätsel plazieren, nachdem der Spieler sich im Magierhaus umgesehen hat.
//	Wld_InsertItem		(ItWr_Phoenix1,		"FP_SPAWN_PHOENIX_1");	//am umgefallenen Bücherregal //Nevím, jestli se má překládat, ale tak pro jistotu...
	Wld_InsertItem		(ItWr_Phoenix1,		"FP_SPAWN_PHOENIX_1");	//na spadlé polici na knihy
};




//#####################################################################
//##
//##
//##					ALCHEMIE - Tutorial
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemy
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMY		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr			 = 	11;
	condition	 = 	HLR_501_Talamon_LEARNALCHEMY_Condition;
	information	 = 	HLR_501_Talamon_LEARNALCHEMY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Zeige mir nun, wie man Tränke braut.";
	description	 = 	"Teď mi ukaž, jak se vaří lektvary.";
};

func int HLR_501_Talamon_LEARNALCHEMY_Condition ()
{
	if	Npc_KnowsInfo(hero, HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_LEARNALCHEMY_Info ()
{
//	AI_Output			(hero, self, "HLR_501_LEARNALCHEMY_15_01"); //Zeige mir nun, wie man Tränke braut.
	AI_Output			(hero, self, "HLR_501_LEARNALCHEMY_15_01"); //Teď mi ukaž, jak se vaří lektvary.
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_02"); //Du hast uns geholfen, also werden ich es dir zeigen.
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_02"); //Pomohl jsi nám, tak ti to ukážu.
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_03"); //Jeder alchemistische Trank erfordert als Grundlage reinsten Alkohol. Er extrahiert die Wirkstoffe aus den anderen Reagenzien und bringt sie zur Wirkung.
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_03"); //Každý alchymistický lektvar potřebuje nejčistší alkohol jako základ. Extrahuje účinné složky z ostatních reagentů a aktivuje jejich účinky.
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_04"); //Für einen einfachen Heiltrank brauchst dazu noch Bergmoos und Orkblatt, zwei Pflanzen.
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_04"); //Na jednoduchý léčivý lektvar potřebuješ ještě Horský mech a Skřetí list, dvě rostliny.
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_05"); //Ich leihe dir mein Rezeptbuch für Heiltränke und Gordian wird eine Abschrift anfertigen
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMY_08_05"); //Půjčím ti svou knihu receptů na léčivé lektvary a Gordian ti připraví opis.
	B_GiveInvItems		(self, hero, ItWr_Book_HealingPotions,1);
//	AI_Output			(hero, self, "HLR_501_LEARNALCHEMY_15_06"); //Gut.
	AI_Output			(hero, self, "HLR_501_LEARNALCHEMY_15_06"); //Dobrá.

//	B_LogEntry			(CH1_LearnAlchemy, "Ich benötige zuerst eine Abschrift von Talamons Alchemiebuch. Gordian, der Schreiber im Händlerviertel kann diese anfertigen.");
	B_LogEntry			(CH1_LearnAlchemy, "Nejprve potřebuji opis Talamonovy alchymistické knihy. Gordian, písař v obchodnické čtvrti, to zařídí.");
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREHEALREGS
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_WHEREHEALREGS		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_WHEREHEALREGS_Condition;
	information	 = 	HLR_501_Talamon_WHEREHEALREGS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo kann ich diese Reagenzien finden?";
	description	 = 	"Kde můžu najít ty reagenty?";
};

func int HLR_501_Talamon_WHEREHEALREGS_Condition ()
{
	if	Npc_KnowsInfo(hero,HLR_501_Talamon_LEARNALCHEMY)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_WHEREHEALREGS_Info ()
{
//	AI_Output			(hero, self, "HLR_501_WHEREHEALREGS_15_01"); //Wo kann ich diese Reagenzien finden?
	AI_Output			(hero, self, "HLR_501_WHEREHEALREGS_15_01"); //Kde můžu najít ty reagenty?
//	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_02"); //Bergmoos wächst auf hohen Bergen und Felsen. Meistens muss man diese Orte mühsam erklettern.
	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_02"); //Horský mech roste na vysokých horách a skalách. Často je potřeba na tyto místa pracně vystoupat.
//	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_03"); //Orkblatt findest du ebenfalls in bergiger Gegend, aber oft wächst diese Pflanze schon am Fuss von Felsen.
	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_03"); //Skřetí list také najdeš v horských oblastech, ale tato rostlina často roste na úpatí skal.
//	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_04"); //Reiner Alkohol kann nur von Alchemisten hergestellt werden. Isgar, mein Heiler-Kamerad im Händlerviertel verkauft diese grundlegende Reagenz.
	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_04"); //Čistý alkohol může být připraven pouze alchymisty. Isgar, můj kamarád léčitel v obchodní čtvrti prodává tento základní reagent.
//	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_05"); //Er hat auch viele pflanzlichen Reagenzien auf Lager, so dass du dir die anstrengenden Klettertouren wahrscheinich ersparen kannst.
	AI_Output			(self, hero, "HLR_501_WHEREHEALREGS_08_05"); //Taky má na skladě spoustu rostlinných reagentů, takže si nejspíš můžeš ušetřit ty namáhavé túry.

//	B_LogEntry			(CH1_LearnAlchemy, "Die nötigen Reagenzien für den einfachen Heiltrank sind reiner Alkohol, Bergmoos und Orkblatt. All das kann ich beim Heiler Isgar im Händlerviertel erwerben.");
	B_LogEntry			(CH1_LearnAlchemy, "Potřebnými reagenty na jednoduchý léčivý lektvar jsou čistý alkohol, horský mech a skřetí list. To vše můžu koupit od léčitele Isgara v obchodní čtvrti.");

	B_LearnMountainMoss	();
	B_LearnOrcLeaf		();
};

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemyHasBasics
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMYHASBASICS		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	12;
	condition	 = 	HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition;
	information	 = 	HLR_501_Talamon_LEARNALCHEMYHASBASICS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe alle Reagenzien und die Abschrift des Buchs.";
	description	 = 	"Mám všechny reagenty a opis knihy.";
};

func int HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition ()
{
	if 	Npc_KnowsInfo(hero,HLR_501_Talamon_LEARNALCHEMY)
	&&	(Npc_HasItems(hero,ItMi_Alcohol		) >= 1)
	&&	(Npc_HasItems(hero,ItPl_MountainMoss) >= 1)
	&&	(Npc_HasItems(hero,ItPl_OrcLeaf		) >= 1)
	&&	(Npc_HasItems(hero,ItWr_Book_HealingPotions) >= 2)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_LEARNALCHEMYHASBASICS_Info ()
{
//	AI_Output			(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_01"); //Ich habe alle Reagenzien und die Abschrift des Buchs.
	AI_Output			(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_01"); //Mám všechny reagenty a opis knihy.
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_02"); //Gut, aber ich brauche mein Orginal-Buch zurück, dann kann es losgehen.
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_02"); //Dobrá, ale potřebuji zpátky svou knihu, pak můžeme začít.
//	AI_Output			(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_03"); //Hier ist es.
	AI_Output			(hero, self, "HLR_501_LEARNALCHEMYHASBASICS_15_03"); //Tady.
	B_GiveInvItems		(other,self, ItWr_Book_HealingPotions,1);
	B_UseFakeBook		(self);
//	AI_Output			(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_04"); //Gut!
	AI_Output			(self, hero, "HLR_501_LEARNALCHEMYHASBASICS_08_04"); //Dobrá!
};

///////////////////////////////////////////////////////////////////////
//	Info LearnAlchemieRunning
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMIERUNNING		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	12;
	condition	 = 	HLR_501_Talamon_LEARNALCHEMIERUNNING_Condition;
	information	 = 	HLR_501_Talamon_LEARNALCHEMIERUNNING_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kannst Du mir jetzt zeigen wie man Tränke braut?";
	description	 = 	"Můžeš mi teď ukázat, jak se vaří lektvary?";
};

func int HLR_501_Talamon_LEARNALCHEMIERUNNING_Condition ()
{
	if	Npc_KnowsInfo	(hero, HLR_501_Talamon_LEARNALCHEMY)
	&&	!Npc_KnowsInfo	(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS)
	&&	!HLR_501_Talamon_LEARNALCHEMYHASBASICS_Condition()
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_LEARNALCHEMIERUNNING_Info ()
{
//	AI_Output			(hero, self, "HLR_501_LEARNALCHEMIERUNNING_15_01"); //Kannst Du mir jetzt zeigen wie man Tränke braut?
	AI_Output			(hero, self, "HLR_501_LEARNALCHEMIERUNNING_15_01"); //Můžeš mi teď ukázat, jak se vaří lektvary?

	if	(Npc_HasItems	(hero,ItWr_Book_HealingPotions) <2)
	{
//		AI_Output		(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_02"); //Du brauchst die Abschrift des Buches von Gordian. Komm wieder, wenn du sie erhalten hast.
		AI_Output		(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_02"); //Potřebuješ opis knihy od Gordiana. Vrať se, až ho budeš mít.
	};

	if	(Npc_HasItems	(hero,ItMi_Alcohol		) < 1)
	||	(Npc_HasItems	(hero,ItPl_MountainMoss	) < 1)
	||	(Npc_HasItems	(hero,ItPl_OrcLeaf		) < 1)
	{
//		AI_Output		(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_03"); //Ohne Reagenzien kann man den Trank nicht brauen. Komm wieder, wenn Du Alkohol, Bergmoos und Orkblatt hast.
		AI_Output		(self, hero, "HLR_501_LEARNALCHEMIERUNNING_08_03"); //Bez reagentů se nedá lektvar uvařit. Vrať se, až budeš mít Alkohol, Horský mech a Skřetí list.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNALCHEMY1
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_LEARNALCHEMY1	(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_LEARNALCHEMY1_Condition;
	information	 = 	HLR_501_Talamon_LEARNALCHEMY1_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 = 	B_BuildLearnString(NAME_LearnAlchemy_1,	LPCOST_TALENT_ALCHEMY_1, 0);
};

func int HLR_501_Talamon_LEARNALCHEMY1_Condition ()
{
	if	Npc_KnowsInfo(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 0)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_LEARNALCHEMY1_Info ()
{
	if			B_GiveSkill(hero, NPC_TALENT_ALCHEMY, 1,LPCOST_TALENT_ALCHEMY_1)
	{
//		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_01"); //Tränke werden am Alchemietisch hergestellt.
		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_01"); //Lektvary se připravují u alchymistického stolu.
//		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_02"); //Gebe die benötigten Reagenzien in den grossen Trog und koche sie. // Nevím přesně, jak přeložit ten Trog.
		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_02"); //Dej potřebné reagenty do velké díže a uvař je.
//		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_03"); //Fülle das Gemisch dann um in den kleinen Glaskolben und achte darauf, dass der Raffinierprozess genügend Zeit hat die wertvollen Bestandteile aus dem Gemisch zu extrahieren.
		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_03"); //Poté naplň směs do malé skleněné baňky a ujisti se, že proces rafinace má dost času, aby se ze směsi extrahovaly cenné složky.
//		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_04"); //Nach kurzer Zeit tropft das Resultat in die leere Glasphiole.
		AI_Output			(self, hero, "HLR_501_LEARNALCHEMY1_08_04"); //Po krátkém čase kape výsledek do prázdné skleněné lahvičky.

		B_LearnRecipeHealingPotions	();

//		B_LogEntry			(CH1_LearnAlchemy, "Ich weiss nun, wie man einfache Heiltränken herstellt!");
		B_LogEntry			(CH1_LearnAlchemy, "Teď vím, jak se připravují jednoduché léčivé lektvary!");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanIBrewAllPotions
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_CANIBREWALLPOTIONS		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	16;
	condition	 = 	HLR_501_Talamon_CANIBREWALLPOTIONS_Condition;
	information	 = 	HLR_501_Talamon_CANIBREWALLPOTIONS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich möchte stärkere Tränke herstellen.";
	description	 = 	"Chci připravovat silnější lektvary.";
};

func int HLR_501_Talamon_CANIBREWALLPOTIONS_Condition ()
{

	if (Npc_GetTalentSkill (hero, NPC_TALENT_ALCHEMY) == 1)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_CANIBREWALLPOTIONS_Info ()
{
//	AI_Output			(hero, self, "HLR_501_CANIBREWALLPOTIONS_15_01"); //Ich möchte stärkere Tränke herstellen.
	AI_Output			(hero, self, "HLR_501_CANIBREWALLPOTIONS_15_01"); //Chci připravovat silnější lektvary.
//	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_02"); //Ich habe dir gezeigt, wie wir unsere einfache Heiltränke herstellen.
	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_02"); //Ukázal jsem ti, jak připravujeme jednoduché léčivé lektvary.
//	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_03"); //Es gibt stärkere Heiltränke, aber uns Heilern ist nicht bekannt, wie sie hergestellt werden.
	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_03"); //Jsou i silnější léčivé lektvary, ale nám léčitelům není známo, jak se připravují.
//	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_04"); //Vielleicht findest du irgendwann einen Alchemie-Meister, der dies beibringen kann.
	AI_Output			(self, hero, "HLR_501_CANIBREWALLPOTIONS_08_04"); //Možná někde najdeš mistra alchymie, který tě to naučí.

//	B_LogEntry			(CH1_LearnAlchemy, "Talamon kann mir nichts mehr beibringen, ich muss mir einen anderen Lehrer suchen!");
	B_LogEntry			(CH1_LearnAlchemy, "Talamon mě nemůže nic víc naučit, musím se poohlédnout po jiném učiteli!");
	Log_SetTopicStatus	(CH1_LearnAlchemy, LOG_SUCCESS);
};

///////////////////////////////////////////////////////////////////////
//	Info IsThereMoreToLearn
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_ISTHEREMORETOLEARN		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	nr		 	 = 	18;
	condition	 = 	HLR_501_Talamon_ISTHEREMORETOLEARN_Condition;
	information	 = 	HLR_501_Talamon_ISTHEREMORETOLEARN_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kannst du mir das Brauen anderer Tränke beibringen?";
	description	 = 	"Můžeš mě naučit přípravu jiných lektvarů?";
};

func int HLR_501_Talamon_ISTHEREMORETOLEARN_Condition ()
{
	if (Npc_KnowsInfo	(hero, HLR_501_Talamon_LEARNALCHEMYHASBASICS))
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ALCHEMY) == 1)
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_ISTHEREMORETOLEARN_Info ()
{
//	AI_Output			(hero, self, "HLR_501_ISTHEREMORETOLEARN_15_01"); //Kannst du mir das Brauen anderer Tränke beibringen?
	AI_Output			(hero, self, "HLR_501_ISTHEREMORETOLEARN_15_01"); //Můžeš mě naučit přípravu jiných lektvarů?
//	AI_Output			(self, hero, "HLR_501_ISTHEREMORETOLEARN_08_02"); //Dafür benötigst du ein Alchemiebuch, doch dise sind selten und wertvoll.
	AI_Output			(self, hero, "HLR_501_ISTHEREMORETOLEARN_08_02"); //Na to potřebuješ alchymistickou knihu, ale ty jsou vzácné a cenné.
};










//#####################################################################
//##
//##
//##				MUFFELSALZ für Halvors Eintopf
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info STINKINGSALT
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_STINKINGSALT		(C_INFO)
{
	npc		 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_STINKINGSALT_Condition;
	information	 = 	HLR_501_Talamon_STINKINGSALT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe gehört, du verkaufst Müffelsalz?";
	description	 = 	"Slyšel jsem, že prodáváš smrdutou sůl.";
};

func int HLR_501_Talamon_STINKINGSALT_Condition ()
{
	if	Talamon_KnowStinkingSalt
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_STINKINGSALT_Info ()
{
//	AI_Output			(hero, self, "HLR_501_STINKINGSALT_15_01"); //Ich habe gehört, du verkaufst Müffelsalz?
	AI_Output			(hero, self, "HLR_501_STINKINGSALT_15_01"); //Slyšel jsem, že prodáváš smrdutou sůl.?
//	AI_Output			(self, hero, "HLR_501_STINKINGSALT_08_02"); //Das stimmt, wofür brauchst du es?
	AI_Output			(self, hero, "HLR_501_STINKINGSALT_08_02"); //Máš pravdu, k čemu ji potřebuješ?
	Info_ClearChoices	(HLR_501_Talamon_STINKINGSALT);
//	Info_AddChoice		(HLR_501_Talamon_STINKINGSALT, "Um die Fleischwanzen aus meiner Hütte zu vertreiben", HLR_501_Talamon_STINKINGSALT_MEATBUGS );
	Info_AddChoice		(HLR_501_Talamon_STINKINGSALT, "Abych vyhnal žravé štěnice ze svojí chatrče", HLR_501_Talamon_STINKINGSALT_MEATBUGS );
//	Info_AddChoice		(HLR_501_Talamon_STINKINGSALT, "Um Halvor die Suppe zu versalzen", HLR_501_Talamon_STINKINGSALT_HALVOR );
	Info_AddChoice		(HLR_501_Talamon_STINKINGSALT, "Abych Halvorovi přesolil polévku", HLR_501_Talamon_STINKINGSALT_HALVOR );
};

func void HLR_501_Talamon_STINKINGSALT_HALVOR ()
{
	Info_ClearChoices	(HLR_501_Talamon_STINKINGSALT);
//	AI_Output			(hero, self, "HLR_501_STINKINGSALT_HALVOR_15_01"); //Um Halvor die Suppe zu versalzen.
	AI_Output			(hero, self, "HLR_501_STINKINGSALT_HALVOR_15_01"); //Abych Halvorovi přesolil polévku.
//	AI_Output			(self, hero, "HLR_501_STINKINGSALT_HALVOR_08_02"); //Solcher Schabernack ist eines Alchimisten unwürdig!
	AI_Output			(self, hero, "HLR_501_STINKINGSALT_HALVOR_08_02"); //Takovéhle taškařiny nejsou hodny alchymistů!
	AI_StopProcessInfos	(self);
};

func void HLR_501_Talamon_STINKINGSALT_MEATBUGS ()
{
	Info_ClearChoices	(HLR_501_Talamon_STINKINGSALT);
//	AI_Output			(hero, self, "HLR_501_STINKINGSALT_MEATBUGS_15_01"); //Um die Fleischwanzen aus meiner Hütte zu vertreiben.
	AI_Output			(hero, self, "HLR_501_STINKINGSALT_MEATBUGS_15_01"); //Abych vyhnal žravé štěnice ze svojí chatrče.
//	AI_Output			(self, hero, "HLR_501_STINKINGSALT_MEATBUGS_08_02"); //Oh, ja dafür ist das Salz ganz hervorragend geeignet!
	AI_Output			(self, hero, "HLR_501_STINKINGSALT_MEATBUGS_08_02"); //Oh, vždyť na to se ta sůl skvěle hodí!

	Talamon_BuyStinkingSalt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BUYSALT
///////////////////////////////////////////////////////////////////////
instance HLR_501_Talamon_BUYSALT		(C_INFO)
{
	npc		 	 = 	HLR_501_Talamon;
	condition	 = 	HLR_501_Talamon_BUYSALT_Condition;
	information	 = 	HLR_501_Talamon_BUYSALT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildBuyString(NAME_StinkingSalt, Value_StinkingSalt);
};

func int HLR_501_Talamon_BUYSALT_Condition ()
{
	if	Talamon_BuyStinkingSalt
	{
		return TRUE;
	};
};

func void HLR_501_Talamon_BUYSALT_Info ()
{
	if	(Npc_HasItems(hero, ItMi_Silver) >= Value_StinkingSalt)
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, Value_StinkingSalt);
//		AI_Output		(self, hero, "HLR_501_BUYSALT_08_01"); //Hier ist das Salz. Nimm nicht zuviel, sonst wirst du es in deiner Hütte selbst nicht mehr aushalten.
		AI_Output		(self, hero, "HLR_501_BUYSALT_08_01"); //Tady je ta sůl. Neber si jí příliš, jinak to sám ve své chatrči nevydržíš.
		B_GiveInvItems	(self, hero, ItMi_StinkingSalt, 1);
//		AI_Output		(hero, self, "HLR_501_BUYSALT_15_02"); //(grins) Ich werde darauf achten.
		AI_Output		(hero, self, "HLR_501_BUYSALT_15_02"); //(šklebí se) Postarám se o to.


		HLR_501_Talamon_BUYSALT.permanent = FALSE;
	}
	else
	{
		B_Say			(self, hero, "$NotEnoughSilver");
	};
};
