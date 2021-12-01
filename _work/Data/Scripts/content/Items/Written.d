
/******************************************************************************************/
INSTANCE ItWr_Book_Circle_01(C_Item)
{
//	name 					=	"Der erste Kreis";
	name 					=	"První kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	50;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Der erste Kreis der Magie";
	description				= 	"První kruh magie";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_01;
};

	FUNC VOID UseItWr_Book_Circle_01()
	{
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_LIGHT));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_THUNDERBOLT));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_FIREBOLT));
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Erster Kreis"			);
					Doc_PrintLine	( nDocID,  0, "První kruh"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Als die Götter den Menschen die Fähigkeit zur Magie schenkten, schenkten sie ihnen auch das Wissen magische Runen herzustellen. Die Diener der Götter haben die ehrenvolle Aufgabe übernommen, diese Artefakte göttlicher Macht zu erschaffen und zu benutzen, wobei der Kreis des Magiers bestimmt, welche Zauber er in der Lage ist zu verstehen und anzuwenden. ");
					Doc_PrintLines	( nDocID,  0, "Když darovali bohové lidstvu schopnost kouzlit, naučili jej také zhotovovat kouzelné runy. Boží služebníci tak převzali čestnou úlohu. Vytvářet artefakty boží moci a používat je. Magický kruh určuje, jaký druh kouzla je kdo schopen pochopit a užívat.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Licht" );
					Doc_PrintLine	( nDocID,  1, NAME_Light );
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Das erste Geschenk Innos an die Menschen.Eine hell strahlende Kugel wird über dem Magier erzeugt.");
					Doc_PrintLines	( nDocID,  1, "První Innosův dar lidstvu. Nad mágem se objeví zářící koule.");
					Doc_PrintLine	( nDocID,  1,  Text);
					Doc_PrintLine	( nDocID,  1,  "" );
//					Doc_PrintLine	( nDocID,  1, "Eispfeil");
					Doc_PrintLine	( nDocID,  1, NAME_Thunderbolt);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Ein Geschoss aus magischer Energie.");
					Doc_PrintLines	( nDocID,  1, "Střela magické energie");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Feuerpfeil");
					Doc_PrintLine	( nDocID,  1, NAME_Firebolt);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Ein Geschoss aus magischem Feuer.");
					Doc_PrintLines	( nDocID,  1, "Střela magického ohně");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};

/******************************************************************************************/

INSTANCE ItWr_Book_Circle_02(C_Item)
{
//	name 					=	"Der zweite Kreis";
	name 					=	"Druhý kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Der zweiter Kreis der Magie";
	description				= 	"Druhý kruh magie";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_02;
};

	FUNC VOID UseItWr_Book_Circle_02()
	{
		var int nDocID;

		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_HEALING_HP_PER_MP));


		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Zweiter Kreis"			);
					Doc_PrintLine	( nDocID,  0, "Druhý kruh"			);
					Doc_PrintLine	( nDocID,  0, "---------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Alle Zauber werden durch die magische Energie des Anwenders ausgelöst.Der Anwender wird als Magier bezeichnet.");
					Doc_PrintLines	( nDocID,  0, "Každé kouzlo pochází z magické moci uživatele. Tento uživatel se nazývá mág.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Jede Aktivierung eines Zaubers kostet den Magier einen Teil seiner Kraft. diese Kraft wird als Mana bezeichnet.");
					Doc_PrintLines	( nDocID,  0, "Každé vyvolání kouzla stojí mága část jeho magické energie. Tato magická energie se nazývá mana.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Heilung");
					Doc_PrintLine	( nDocID,  1, NAME_Heal);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Adanos sah, das die Menschen starben und das es der Wille Beliars war.Und er sprach:Stelle ich mich auch nicht gegen den Willen Beliars,gebe ich den Menschen jedoch die Macht der Heilung." );
					Doc_PrintLines	( nDocID,  1, "Adanos viděl, že lidé umírají a že je to vůle Beliarova. A pravil: Nebudu se vůli Beliarově  protivit, dám však lidstvu moc léčení." );
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Dieser Zauber birgt die Macht, den Magier zu heilen.");
					Doc_PrintLines	( nDocID,  1, "Toto kouzlo poskytuje mágovi schopnost se uzdravit.");
//					Doc_PrintLine	( nDocID,  1, "Investierungszauber");
					Doc_PrintLine	( nDocID,  1, NAME_Spell_Invest);
					Doc_PrintLine	( nDocID,  1, Text_1);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");

					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE ItWr_Book_Circle_03 (C_Item)
{
//	name 					=	"Der dritte Kreis";
	name 					=	"Třetí kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	150;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Der dritte Kreis der Magie";
	description				= 	"Třetí kruh magie";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_03;


};
	FUNC VOID UseItWr_Book_Circle_03()
	{

		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_FIREBALL));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_ICECUBE));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_THUNDERBALL));
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Dritter Kreis"			);
					Doc_PrintLine	( nDocID,  0, "Třetí kruh"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Manche Zauber können mit einer bestimmten größeren Anzahl von magischer Energie gespeist werden, diese werden auch Aufladungszauber genannt.");
					Doc_PrintLines	( nDocID,  0, "Některá kouzla lze pomocí jistého množství magické moci nabíjet, tato kouzal se nazývají nabíjecí kouzla.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Andere Zauber werden aufrechterhalten, solange der Magier sein Mana in dieses Spruch einfliessen lässt. Solche Zauber heissen Investierungszauber.");
					Doc_PrintLines	( nDocID,  0, "Ostatní kouzla si zachovávají účinnost jen po dobu, kdy do nich proudí duchovní síla mága. Jsou známa jako jednorázová kouzla.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Feuerball");
					Doc_PrintLine	( nDocID,  1, NAME_Fireball);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Das zweite Geschenk Innos an die Kinder des Feuers. Ein Ball aus Feuer, der sein Opfer verbrennt");
					Doc_PrintLines	( nDocID,  1, "Druhý dar, který dal Innos dětem ohně. Ohnivou kouli, která zapálí své oběti.");
//					Doc_PrintLine	( nDocID,  1, "Auladbarer Zauber");
					Doc_PrintLine	( nDocID,  1, NAME_Spell_Load);
					Doc_PrintLine	( nDocID,  1, Text);
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Eisblock");
					Doc_PrintLine	( nDocID,  1, NAME_Icecube);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Das Opfer wird in einen Eisblock eingefroren. Ein Zauber aus dem Tempel der Wassermagier");
					Doc_PrintLines	( nDocID,  1, "Oběť je uvězněna v ledovém bloku. Kouzlo z chrámu mágů Vody.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text_1);
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Kugelblitz");
					Doc_PrintLine	( nDocID,  1, NAME_Thunderball);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Eine Kugel, geschaffen aus magischer Energie.");
					Doc_PrintLines	( nDocID,  1, "Koule tvořená magickou energií.");
					Doc_PrintLine	( nDocID,  1,  Text_2);
					Doc_Show		( nDocID );
	};



/******************************************************************************************/
INSTANCE ItWr_Book_Circle_04 (C_Item)
{
//	name 					=	"Der vierte Kreis";
	name 					=	"Čtvrtý kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	200;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Der vierte Kreis der Magie";
	description				= 	"Čtvrtý kruh magie";
	
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_04;


};
	FUNC VOID UseItWr_Book_Circle_04()
	{
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_FIRESTORM));
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_ZAPPED_DAMAGE_PER_SEC));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_DESTROYUNDEAD));
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Vierter Kreis"			);
					Doc_PrintLine	( nDocID,  0, "Čtvrtý kruh"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLine	( nDocID,  0, "Die Magie ");
					Doc_PrintLine	( nDocID,  0, "Teleportační magie");
//					Doc_PrintLine	( nDocID,  0, "der Teleportation");
//					Doc_PrintLine	( nDocID,  0, "der Teleportation");
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Das besondere an diesen magischen Formeln ist, das sie, obwohl als Runen geschaffen,von jedem der magische Energie in sich trägt gesprochen werden können.Die Magie die diese Formeln umgibt, kann sofort aktiviert werden. Es gibt keine Einschränkungen für Teleportationszauber.");
					Doc_PrintLines	( nDocID,  0, "Zvláštní vlastnost těchto kouzelných formulí spočívá v tom, že ačkoliv jsou vázány v runách, může je použít kdokoliv, kdo je obdařen kouzelnou mocí. Magii těchto formulí je možné použít okmažitě. Kouzlo teleportace nemá žádná omezení.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)


//					Doc_PrintLine	( nDocID,  1, "Feuersturm	");
					Doc_PrintLine	( nDocID,  1, NAME_Firestorm);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Ähnlich dem Feuerball wirkt dieser Zauber auf einen Gegner, springt von dort aus jedoch auf weitere Gegner über.");
					Doc_PrintLines	( nDocID,  1, "Stejně jako ohnivá koule, toto kouzlo může udeřit jen jednoho protivníka, pak však může přejít na další.");
//					Doc_PrintLine	( nDocID,  1, "Aufladbarer Zauber");
					Doc_PrintLine	( nDocID,  1, NAME_Spell_Load);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, Text);
//					Doc_PrintLine	( nDocID,  1, "Blitz");
					Doc_PrintLine	( nDocID,  1, NAME_Chainlightning);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, " Der Zauber springt auf mehrere Opfer über. Die Kraft des Blitzes ist schwer zu kontrollieren, so das der Magier selbst Opfer werden kann");
					Doc_PrintLines	( nDocID,  1, "Toto kouzlo zasahuje více cílů. Sílu blesků lze obtížně ovládat. Proto se i sám mág může stát jeho obětí.");
					Doc_PrintLine	( nDocID,  1,  Text_1);
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Untote vernichten");
					Doc_PrintLine	( nDocID,  1, NAME_Destroyundead);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Die Geschöpfe der Finsternis werden mit diesem Zauber verbannt.");
					Doc_PrintLines	( nDocID,  1, "Toto kouzlo likviduje nemrtvé nestvůry temnot.");
					Doc_PrintLine	( nDocID,  1, Text_2);

					Doc_Show		( nDocID );
	};

/******************************************************************************************/
INSTANCE  ItWr_Book_Circle_05(C_Item)
{
//	name 					=	"Der fünfte Kreis";
	name 					=	"Pátý kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	250;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Der fünfte Kreis der Magie";
	description				= 	"Pátý kruh magie";
	
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_05;


};
	FUNC VOID UseItWr_Book_Circle_05()
	{
		var int nDocID;
		var string Text_1;
		Text_1 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_FIRERAIN));
		var string Text_2;
		Text_2 = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_ICEWAVE));
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Fünfter Kreis"			);
					Doc_PrintLine	( nDocID,  0, "Pátý kruh"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLine	( nDocID,  0, "Feuerregen");
					Doc_PrintLine	( nDocID,  0, NAME_Firerain);
					Doc_PrintLine	( nDocID,  0, "---------------");
//					Doc_PrintLines	( nDocID,  0, "Die Macht des göttlichen Feuers trifft jedes Lebewesen im Wirkungsbreich des Magiers.");
					Doc_PrintLines	( nDocID,  0, "Síla božího ohně zasáhne všechny stvůry v okolí mága.");
					Doc_PrintLine	( nDocID,  0, Text_1);


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Eiswelle	");
					Doc_PrintLine	( nDocID,  1, NAME_Icewave);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Ein Feld aus magischem Eis erstreckt sich über alle Gegner und friert diese für einen kurzen Zeitraum ein. Während dieser Zeit sind die Opfer bewegungsunfähig und erleiden Schaden. ");
					Doc_PrintLines	( nDocID,  1, "Kouzlo ledové vlny zasáhne všechny nepřátele a nakrátko je zmrazí. Během zmrazení jsou oběti znehybněny a utrpí škodu.");
//					Doc_PrintLines	( nDocID,  1, "Ein Zauber aus dem Tempel der Wassermagier.");
					Doc_PrintLines	( nDocID,  1, "Kouzlo z chrámů mágů Vody.");
					Doc_PrintLine	( nDocID,  1, Text_2);
					Doc_Show		( nDocID );
};

INSTANCE  ItWr_Book_Circle_06(C_Item)
{
//	name 					=	"Der sechste Kreis";
	name 					=	"Šestý kruh";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	300;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Sechster Kreis der Magie";
	description				= 	"Šestý kruh magie";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseItWr_Book_Circle_06;


};
	FUNC VOID UseItWr_Book_Circle_06()
	{
		var int nDocID;
		var string Text;
		Text = ConcatStrings (NAME_Manacost_book,IntToString (SPL_SENDCAST_BREATHOFDEATH));


		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Sechster Kreis"			);
					Doc_PrintLine	( nDocID,  0, "Šestý kruh"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLine	( nDocID,  0, "Todeshauch");
					Doc_PrintLine	( nDocID,  0, NAME_Breathofdeath);
					Doc_PrintLine	( nDocID,  0, "---------------");
//					Doc_PrintLines	( nDocID,  0, "Der Atem Beliars. Eine Wolke aus Lebenverschlingendem Nichts, die jedes Wesen augenblicklich töten kann.");
					Doc_PrintLines	( nDocID,  0, "Beliarův dech. Oblak ničivého vzduchu, který okamžitě usmrtí vše živé.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, Text);


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Todesring");
					Doc_PrintLine	( nDocID,  1, NAME_Massdeath);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Nicht viel ist überliefert über die Rune mit der Macht von URIZIEL ");
					Doc_PrintLines	( nDocID,  1, "Těžko je dohledat jakýkoliv záznam o runě, která obsahuje kouzlo URIZIELU.");
//					Doc_PrintLines	( nDocID,  1, "Es ist nur soviel bekannt, als das sie Beliars Mächte in sich birgt.");
					Doc_PrintLines	( nDocID,  1, "Známo je jen to, že patřila k moci Beliarově.");
					Doc_PrintLine	( nDocID,  1, "");


					Doc_Show		( nDocID );
};



