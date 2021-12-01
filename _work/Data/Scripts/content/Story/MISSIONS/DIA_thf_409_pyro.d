///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE THF_409_Pyro_EXIT   (C_INFO)
{
	npc         = THF_409_Pyro;
	nr          = 999;
	condition   = THF_409_Pyro_EXIT_Condition;
	information = THF_409_Pyro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT THF_409_Pyro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID THF_409_Pyro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WHATSUP
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATSUP		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_WHATSUP_Condition;
	information	 = 	THF_409_Pyro_WHATSUP_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was machst du den ganzen Tag?";
	description	 = 	"Co tu celý den děláš?";
};

func int THF_409_Pyro_WHATSUP_Condition ()
{
	if	(Npc_GetDistToWP(self, ARENA_WP_CENTER) >= ARENA_CENTER_AREA)
	&&	!Npc_KnowsInfo(hero,THF_409_Pyro_PRETTYHOT)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_WHATSUP_Info ()
{
//	AI_Output			(hero, self, "THF_409_WHATSUP_15_01"); //Was machst du den ganzen Tag?
	AI_Output			(hero, self, "THF_409_WHATSUP_15_01"); //Co tu celý den děláš?
//	AI_Output			(self, hero, "THF_409_WHATSUP_05_02"); //Ich warte darauf, dass das Vorprogramm der Arenakämpfe anfängt.
	AI_Output			(self, hero, "THF_409_WHATSUP_05_02"); //Čekám na to, až začne úvodní představení před souboji v aréně.
//	AI_Output			(self, hero, "THF_409_WHATSUP_05_03"); //Dort unterhalte ich die Arenabesucher mit etwas Feuerspuckerei.
	AI_Output			(self, hero, "THF_409_WHATSUP_05_03"); //Při něm bavím publikum arény trochou hry s ohněm.
//	AI_Output			(self, hero, "THF_409_WHATSUP_05_04"); //Besuch mich doch mal während des Vorprogramms, wenn dich das interessiert.
	AI_Output			(self, hero, "THF_409_WHATSUP_05_04"); //Přijď se na mě při úvodním představení podívat, pokud tě to zajímá.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PRETTYHOT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_PRETTYHOT		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_PRETTYHOT_Condition;
	information	 = 	THF_409_Pyro_PRETTYHOT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Sieht gefährlich aus, was du da machst!";
	description	 = 	"Vypadá to nebezpečně, to co tu děláš!";
};

func int THF_409_Pyro_PRETTYHOT_Condition ()
{
	if	(Npc_GetDistToWP(self, ARENA_WP_CENTER) < ARENA_CENTER_AREA)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_PRETTYHOT_Info ()
{
//	AI_Output			(hero, self, "THF_409_PRETTYHOT_15_01"); //Sieht gefährlich aus, was du da machst!
	AI_Output			(hero, self, "THF_409_PRETTYHOT_15_01"); //Vypadá to nebezpečně, to co tu děláš!
//	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_02"); //Ist halb so schlimm wie es aussieht. Hab mir bisher erst einmal die Haare versengt!
	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_02"); //Je to jen napůl tak zlé, jak to vypadá. Doteď jsem si stihl jenom připálit vlasy!
//	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_03"); //Die akrobatischen Tricks waren mir allerdings lieber.
	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_03"); //Akrobatické kousky mi byly vždy milejší.
//	AI_Output			(hero, self, "THF_409_PRETTYHOT_15_04"); //Akrobatische Tricks?
	AI_Output			(hero, self, "THF_409_PRETTYHOT_15_04"); //Akrobatické kousky?
//	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_05"); //Früher habe ich hier während des Vorprogramms etwas Artistik vorgeführt, aber das war den Zuschauern zu langweilig.
	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_05"); //Dříve jsem tu během úvodních představení byl jako artista, ale divákům to připadalo moc nudné.
//	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_06"); //Feuerspucken ist einfach dramatischer!
	AI_Output			(self, hero, "THF_409_PRETTYHOT_05_06"); //Hry s ohněm jsou jednoduše dramatičtější!
};

///////////////////////////////////////////////////////////////////////
//	Info WHATACROBAT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATACROBAT		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_WHATACROBAT_Condition;
	information	 = 	THF_409_Pyro_WHATACROBAT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Welche akrobatischen Tricks hast du vorgeführt?";
	description	 = 	"Jaké akrobatické kousky jsi prováděl?";
};

func int THF_409_Pyro_WHATACROBAT_Condition ()
{
	if	Npc_KnowsInfo(hero,THF_409_Pyro_PRETTYHOT)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_WHATACROBAT_Info ()
{
//	AI_Output			(hero, self, "THF_409_WHATACROBAT_15_01"); //Welche akrobatischen Tricks hast du vorgeführt?
	AI_Output			(hero, self, "THF_409_WHATACROBAT_15_01"); //Jaké akrobatické kousky jsi prováděl?
//	AI_Output			(self, hero, "THF_409_WHATACROBAT_05_02"); //Hechtrollen, Saltos und dergleichen...
	AI_Output			(self, hero, "THF_409_WHATACROBAT_05_02"); //Různé přemety, salta a podobně...
};

///////////////////////////////////////////////////////////////////////
//	Info SHOWME
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_SHOWME		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_SHOWME_Condition;
	information	 = 	THF_409_Pyro_SHOWME_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Kannst du mir diese akrobatischen Tricks auch beibringen?";
	description	 = 	"Mohl bys mě tyto akrobatické kousky také naučit?";
};

func int THF_409_Pyro_SHOWME_Condition ()
{
	if	Npc_KnowsInfo(hero,THF_409_Pyro_WHATACROBAT)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_SHOWME_Info ()
{
//	AI_Output			(hero, self, "THF_409_SHOWME_15_01"); //Kannst du mir diese akrobatischen Tricks auch beibringen?
	AI_Output			(hero, self, "THF_409_SHOWME_15_01"); //Mohl bys mě tyto akrobatické kousky také naučit?
//	AI_Output			(self, hero, "THF_409_SHOWME_05_02"); //Ich muss für meinen Lebensunterhalt arbeiten. Also wenn du willst, dass ich dir meine alten Tricks zeige, dann kostet dich das Silber!
	AI_Output			(self, hero, "THF_409_SHOWME_05_02"); //Musím si vydělat na živobytí. Takže pokud bys chtěl, abych ti ukázal své dovednosti, bude tě to stát nějaké stříbro!
//	AI_Output			(hero, self, "THF_409_SHOWME_15_03"); //Wieviel?
	AI_Output			(hero, self, "THF_409_SHOWME_15_03"); //Kolik?
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNACROBAT
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_LEARNACROBAT		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_LEARNACROBAT_Condition;
	information	 = 	THF_409_Pyro_LEARNACROBAT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT, Pyro_CostAcrobat);
};

func int THF_409_Pyro_LEARNACROBAT_Condition ()
{
	if	Npc_KnowsInfo(hero,THF_409_Pyro_SHOWME)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_LEARNACROBAT_Info ()
{
//	AI_Output			(hero, self,"THF_409_LEARNACROBAT_15_01"); //Zeig mir deine Akrobatischen Tricks!
	AI_Output			(hero, self,"THF_409_LEARNACROBAT_15_01"); //Předveď mi své akrobatické dovednosti!

	if	(Npc_HasItems(hero, ItMi_Silver) < Pyro_CostAcrobat)
	{
		B_Say			(self, hero, "$NotEnoughSilver");
		return;
	};

	if (B_GiveSkill(hero,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, Pyro_CostAcrobat);
//		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_02"); //Akrobatik ist äußerst vielseitig einsetzbar. Du kannst weiter springen und so Orte erreichen, die andere nicht erreichen können.
		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_02"); //Akrobacie má nesmírně mnohostranné využití. Můžeš dále doskočit a dosáhnout tak míst, na která se jiní nedostanou.
//		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_03"); //Es hilft dir auch aus einem Kampf schnell weg zu kommen oder die Stellung zu wechseln. So ein Sprung kann dir den Arsch retten.
		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_03"); //Pomůže ti to též, když chceš rychleji utéct z boje nebo v něm změnit pozici. Takový skok ti může uchránit prdel.
//		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_04"); //Du kannst dich auch bei einem tiefen Sturz besser abfedern und nimmst so weniger Schaden.
		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_04"); //Když spadneš z větší výšky, lépe dopadneš a utržíš menší zranění.
//		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_05"); //Aber vergiss nicht, wer hoch springt, kann auch tief fallen und unverwundbar macht dich Akrobatik nicht!
		AI_Output		(self, hero, "THF_409_LEARNACROBAT_05_05"); //Ale nezapomeň, kdo vysoko skáče, může hluboko spadnout. A nesmrtelným tě umění akrobacie neudělá!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WHATPLACES
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_WHATPLACES		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_WHATPLACES_Condition;
	information	 = 	THF_409_Pyro_WHATPLACES_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Welche Orte meinst du damit?";
	description	 = 	"Jaká místa tím máš na mysli?";
};

func int THF_409_Pyro_WHATPLACES_Condition ()
{
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 1)
	&&	!Pyro_KnowsPlaces
	{
		return TRUE;
	};
};

func void THF_409_Pyro_WHATPLACES_Info ()
{
//	AI_Output			(hero, self, "THF_409_WHATPLACES_15_01"); //Welche Orte meinst du damit?
	AI_Output			(hero, self, "THF_409_WHATPLACES_15_01"); //Jaká místa tím máš na mysli?
//	AI_Output			(self, hero, "THF_409_WHATPLACES_05_02"); //Was ist dir diese Information wert?
	AI_Output			(self, hero, "THF_409_WHATPLACES_05_02"); //Jak je pro tebe tato informace hodnotná?

	Info_ClearChoices	(THF_409_Pyro_WHATPLACES);
//	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "Garnichts, du wirst es mir so sagen sonst...", THF_409_Pyro_WHATPLACES_THREAT );
	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "Vůbec nijak. Buď mi to řekneš nebo...", THF_409_Pyro_WHATPLACES_THREAT );
//	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "100 Silber", THF_409_Pyro_WHATPLACES_100 );
	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "100 stříbra", THF_409_Pyro_WHATPLACES_100 );
//	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "50 Silber", THF_409_Pyro_WHATPLACES_50 );
	Info_AddChoice	(THF_409_Pyro_WHATPLACES, "50 stříbra", THF_409_Pyro_WHATPLACES_50 );
};

func void	THF_409_Pyro_Info1()
{
//	AI_Output			(self, hero, "THF_409_WHATPLACES_Info1_05_01"); //Kennst du den Mauereinsturz bei der Burgschmiede?
	AI_Output			(self, hero, "THF_409_WHATPLACES_Info1_05_01"); //Víš o té zhroucené zdi u kovárny?
//	AI_Output			(hero, self, "THF_409_WHATPLACES_Info1_15_02"); //Ja!
	AI_Output			(hero, self, "THF_409_WHATPLACES_Info1_15_02"); //Ano!
//	AI_Output			(self, hero, "THF_409_WHATPLACES_Info1_05_03"); //Niemand kann ohne akrobatische Tricks auf den Mauerrest am Schmiedehaus gelangen.
	AI_Output			(self, hero, "THF_409_WHATPLACES_Info1_05_03"); //Nikdo se tam na tu zídku u kovárny nedostane, pokud neovládá akrobacii.

	Pyro_KnowsPlaces	= TRUE;
};

func void	THF_409_Pyro_Info2()
{
//	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_01"); //Treiben sich eine Menge Fleischwanzen dort herum, manchmal liegt dort auch anderer Krempel herum!
	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_01"); //Když se proženeš kolem té líhně žravých štěnic, tak tam může někdy najít i nějakou jinou veteš!
//	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_02"); //Gleichs gilt für die Dächer des Gardistenhauses und die Burgschmiede selbst.
	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_02"); //A totéž platí i pro střechu domu stráží a kovárnu samotnou.
//	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_03"); //Ich begehe diese Dächer von Zeit zu Zeit, denn Elstern lassen dort oben ab und zu mal interessante Dinge fallen, die sie irgendwo stibitzt haben.
	AI_Output			(self, hero, "THF_409_WHATPLACES_Info2_05_03"); //Sám se čas od času na tyhle střechy podívám, protože strakám tam čas od času upadne něco zajímavého, co někde jinde šlohly.
};

func void THF_409_Pyro_WHATPLACES_50 ()
{
	Info_ClearChoices	(THF_409_Pyro_WHATPLACES);

//	AI_Output			(hero, self, "THF_409_WHATPLACES_50_15_01"); //50 Silber
	AI_Output			(hero, self, "THF_409_WHATPLACES_50_15_01"); //50 stříbra

	if	(Npc_HasItems(hero, ItMi_Silver) < 50)
	{
		B_Say		(self, hero, "$NotEnoughSilver");
		return;
	};

	B_GiveInvItems		(hero, self, ItMi_Silver, 50);

	THF_409_Pyro_Info1	();
};

func void THF_409_Pyro_WHATPLACES_100 ()
{
	Info_ClearChoices	(THF_409_Pyro_WHATPLACES);

//	AI_Output			(hero, self, "THF_409_WHATPLACES_100_15_01"); //100 Silber
	AI_Output			(hero, self, "THF_409_WHATPLACES_100_15_01"); //100 stříbra

	if	(Npc_HasItems(hero, ItMi_Silver) < 100)
	{
		B_Say			(self, hero, "$NotEnoughSilver");
		return;
	};

	B_GiveInvItems		(hero, self, ItMi_Silver, 50);

	THF_409_Pyro_Info1	();
	THF_409_Pyro_Info2	();
};


func void THF_409_Pyro_WHATPLACES_THREAT ()
{
	Info_ClearChoices	(THF_409_Pyro_WHATPLACES);

	B_AddDarkPoints		(1);

	B_DrawWeapon		(hero, self);
//	AI_Output			(hero, self, "THF_409_WHATPLACES_THREAT_15_01"); //Garnichts, du wirst es mir so sagen sonst...
	AI_Output			(hero, self, "THF_409_WHATPLACES_THREAT_15_01"); //Vůbec nijak. Buď mi to řekneš nebo...
//	AI_Output			(self, hero, "THF_409_WHATPLACES_THREAT_05_02"); //OK, OK, werde nicht gleich ungemütlich! Ein Rüpel wie Brutus ist wirklich genug!
	AI_Output			(self, hero, "THF_409_WHATPLACES_THREAT_05_02"); //Dobře! Dobře! Nemusíš být hned naježenej! Už jeden hulvát jako Brutus tady stačí!
	B_RemoveWeapon		(hero);
//	AI_Output			(hero, self, "THF_409_WHATPLACES_THREAT_15_03"); //Warum nicht gleich so!
	AI_Output			(hero, self, "THF_409_WHATPLACES_THREAT_15_03"); //Proč by ne..?

	THF_409_Pyro_Info1	();
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance THF_409_Pyro_HOWDY		(C_INFO)
{
	npc		 = 	THF_409_Pyro;
	condition	 = 	THF_409_Pyro_HOWDY_Condition;
	information	 = 	THF_409_Pyro_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was macht die Feuerspuckerei?";
	description	 = 	"Kolik vydělají hry s ohněm?";
};

func int THF_409_Pyro_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero,THF_409_Pyro_PRETTYHOT)
	{
		return TRUE;
	};
};

func void THF_409_Pyro_HOWDY_Info ()
{
//	AI_Output			(hero, self, "THF_409_HOWDY_15_01"); //Was macht die Feuerspuckerei?
	AI_Output			(hero, self, "THF_409_HOWDY_15_01"); //Kolik vydělají hry s ohněm?
//	AI_Output			(self, hero, "THF_409_HOWDY_05_02"); //Ich verdiene genug Silber mit einer einzigen Stunde Arbeit pro Tag. Da kann ich mich wirklich nicht beschweren!
	AI_Output			(self, hero, "THF_409_HOWDY_05_02"); //Vydělám si dost stříbra jedinou hodinou práce za den. Takže si opravdu nemohu stěžovat!
	AI_StopProcessInfos	(self);
};
