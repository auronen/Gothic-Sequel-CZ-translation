//---------------------------------------------------------------------
//	Missionsmünzen, damit Leichen liegenbleiben
//---------------------------------------------------------------------
instance ItMi_Coin (C_Item)
{
//	name 				=	"alte Münze";
	name 				=	"Stará mince";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;
	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;

};

//---------------------------------------------------------------------
//	Botschaft von Xardas (versiegelt)
//---------------------------------------------------------------------
INSTANCE ItWr_Xardas_Letter_Sealed(C_Item)
{
//	name 				=	"Botschaft von Xardas";
	name 				=	"Zpráva od Xardase";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Xardas_Letter_Sealed;

	description			=	name;
//	TEXT[0]				=	"Dies ist die Borschaft, die mir Xardas";
//	TEXT[1]				=	"für Diego mitgab.";
//	TEXT[3]				=	"Sie ist versiegelt!";
	TEXT[0]				=	"Toto je zpráva, kterou mi Xardas";
	TEXT[1]				=	"dal pro Diega.";
	TEXT[3]				=	"Je zapečetěna!";
};

FUNC void Use_Xardas_Letter()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "Diego");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Die dämonischen Mächte bereiten die Rückkehr des Schläfers vor! Verschanzt in der Bergfeste, mit den Paladinen und dem König, wollen die Feuermagier die Gefahr abzuwenden. Doch sie haben nichts bewirkt. Grenzenloser Hochmut macht sie blind.");
				Doc_PrintLines	(nDocID,  0, "Mocnosti zla připravují Spáčův návrat! Mágové ohně, kteří sídlí v Horské pevnosti, společně s paladiny a králem, se snaží toto nebezpečí odvrátit. Doteď ale nic nepodnikli. Jejich neomezená pýcha je zaslepila!");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Wie du siehst, ist der Zerstörer der Barriere nicht tot. Er war im Tempel verschüttet, ohne Bewusstsein, lange Zeit. Schwach und untrainiert habe ich ihn zu dir geschickt. Ein Schatten seiner selbst. Doch ist er unsere einzige Hoffnung den Schläfer endgültig zu vernichten!");
				Doc_PrintLines	(nDocID,  0, "Jak vidíš, ten, který strhnul Bariéru není mrtev. Byl dlouho v bezvědomí, pohřben ve skřetím chrámu. Posílám ho k tobě slabého a netrénovaného. Je pouze stínem svého dřívejšího já, ale je naše jediná naděje, jak zničit Spáče!");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Schicke ihn mit dieser Nachricht zu den Feuermagiern, sobald er bereit ist. Er wird ihnen helfen, den richtigen Weg zu erkennen!");
				Doc_PrintLines	(nDocID,  0, "Pošli ho s tímto listem k Mágům ohně do Hroské pevnosti. Pomůže jim najít správný způsob, jak zapudit spáče nadobro!");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "               Xardas");
				Doc_Show		(nDocID);

	Diego_LetterRead = TRUE;
};

FUNC void Use_Xardas_Letter_Sealed()
{
		CreateInvItem    	(hero,ItWr_Xardas_Letter);

		Use_Xardas_Letter	();
};

//---------------------------------------------------------------------
//	Botschaft von Xardas (geöffnet)
//---------------------------------------------------------------------
INSTANCE ItWr_Xardas_Letter(C_Item)
{
//	name 				=	"Botschaft von Xardas";
	name 				=	"Zpráva od Xardase";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Xardas_Letter;

	description			=	name;
//	TEXT[0]				=	"Dies ist die Borschaft, die mir Xardas";
//	TEXT[1]				=	"für Diego mitgab.";
//	TEXT[3]				=	"Das Siegel ist gebrochen!";
	TEXT[0]				=	"Toto je zpráva, kterou mi Xardas";
	TEXT[1]				=	"dal pro Diega.";
	TEXT[3]				=	"Pečeť je rozlomena!";
};


/*******************************************************************************************/
// Teleport4 (nur Scrolls)

INSTANCE ItArScrollTeleport4 (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI|ITEM_MISSION;

	visual				= "ItAr_Scroll_39.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				= SPL_TELEPORT4;
	cond_atr[2]   			= ATR_MANA_MAX;
	cond_value[2]  			= SPL_SENDCAST_TELEPORT;

//	description			= "Teleport zum Lager";
	description			= "Teleport do tábora";

	TEXT	[1]			= NAME_Manakosten;
	COUNT	[1]			= SPL_SENDCAST_TELEPORT;
};

// Buch der Diebe: Schlösser
	INSTANCE ItWr_Book_Thief_01 (C_Item)
{
//	name 					=	"Diebeskunst";
	name 					=	"Zlodějské umění";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Über Schlösser und Mechanismen";
	description				= 	"Zámky a mechanismy";

	//TEXT[5]				= ;
	//COUNT[5]				= ;
	on_state[0]				=	UseItWr_Book_Thief_01;


};
	FUNC VOID UseItWr_Book_Thief_01()
	{
		var int nDocID;


		nDocID = 		Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Schlösser und Mechanismen "			);
					Doc_PrintLine	( nDocID,  0, "Zámky a mechanismy"			);
					 			 	// -1 -> all pages

//					Doc_PrintLine	( nDocID,  0, "Von M. Fingers ");
					Doc_PrintLine	( nDocID,  0, "Od M. Fingerse");
//					Doc_PrintLine	( nDocID,  0, "5 Jahre Meister der Diebesgilde");
					Doc_PrintLine	( nDocID,  0, "Mistr zlodějské gildy - ");
					Doc_PrintLine	( nDocID,  0, "posledních 5 let");
					Doc_PrintLine	( nDocID,  0, "---------------");
//					Doc_PrintLines	( nDocID,  0, "Derweil werden verschiedene Mechaniken, ausgeklügelte Systematiken und raffinierte Kombinatorik verwendet, um Schlösser sicher zu machen gegen fremden Eingriff. Eine der immer noch gängigsten Methoden der Kombinatorik ist die Multimechanik. Besonders bekannt bei Türen und Truhen, sorgen sie mit offensichtlich simplem System dafür, das der Zugang nur dem gestattet ist, der auch rechtmäßigen Zugang besitzt. ");
					Doc_PrintLines	( nDocID,  0, "Derweil werden verschiedene Mechaniken, ausgeklügelte Systematiken und raffinierte Kombinatorik verwendet, um Schlösser sicher zu machen gegen fremden Eingriff. Eine der immer noch gängigsten Methoden der Kombinatorik ist die Multimechanik. Besonders bekannt bei Türen und Truhen, sorgen sie mit offensichtlich simplem System dafür, das der Zugang nur dem gestattet ist, der auch rechtmäßigen Zugang besitzt. ");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

//					Doc_PrintLines	( nDocID,  1, "Während die Öffnung durch ein Links/Rechts System verschlossen ist, dem sich der entsprechende Schüssel automatisch anpasst, so sorgen Gewinde, Fassungen und kleine Rädchen dafür, das ein fremder Gegenstand bei einer Bewegung in die falsche Richtung abbricht. Eine solche Rechts/Links Kombiantion besteht in der Regel aus entweder vier, sechs, acht oder sogar zehn Richtungsbewegungen. Nur ein guter Dieb wird seine Dietriche bewahren. Weniger gute Diebe bleiben jedoch immer auf der Suche nach neuen Dietrichen, weil durch ihre fehlerhafte Arbeit immer wieder Dietriche abbrechen. ");
					Doc_PrintLines	( nDocID,  1, "Während die Öffnung durch ein Links/Rechts System verschlossen ist, dem sich der entsprechende Schüssel automatisch anpasst, so sorgen Gewinde, Fassungen und kleine Rädchen dafür, das ein fremder Gegenstand bei einer Bewegung in die falsche Richtung abbricht. Eine solche Rechts/Links Kombiantion besteht in der Regel aus entweder vier, sechs, acht oder sogar zehn Richtungsbewegungen. Nur ein guter Dieb wird seine Dietriche bewahren. Weniger gute Diebe bleiben jedoch immer auf der Suche nach neuen Dietrichen, weil durch ihre fehlerhafte Arbeit immer wieder Dietriche abbrechen. ");
					Doc_Show		( nDocID );
	};

INSTANCE ItKe_Smith_01(C_Item)
{
//	name 				=	"Schlüssel";
	name 				=	"Klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	owner				=   MIL_103_Berengar;
	value 				=	0;
	//owner				= ;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

//	description			= "Schmiedelager";
	description			= "Klíč od skladu v kovárně";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItWr_RECIPE_01(C_Item)
{
//	name 				=	"Rezept";
	name 				=	"Recept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";


	description			=	name;
//	TEXT[1]				=	"Rezept";
//	TEXT[2]				=	"zur Herstellung";
//	TEXT[3]				=	"heilender und kräftigender";
//	TEXT[4]				=	"Essenzen";
	TEXT[1]				=	"Recepty k přípravě";
	TEXT[2]				=	"léčivých a posilňujícíh";
	TEXT[3]				=	"lektvarů";
};
INSTANCE ItWr_Smith_Art_01(C_Item)
{
//	name 				=	"Schmiedekunst";
	name 				=	"Kovářské umění";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Book_02_04.3ds";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";


	description			=	name;
//	TEXT[1]				=	"Ein Buch über";
//	TEXT[2]				=	" die Kunst des Schmiedens ";
//	TEXT[3]				=	"von H. Mer";
	TEXT[1]				=	"Kniha o umění";
	TEXT[2]				=	"mistrů kovářů";
	TEXT[3]				=	"od H. Mera";

};

INSTANCE ItMi_Miss_Candel_01 (C_Item)
{
//	name 				=	"Kerzenständer";
	name 				=	"Svícen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	20;

	visual 				=	"ItMi_Stuff_Candel_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

instance ItWr_Book_Thief_02 (C_Item)
{
//	name 					=	"Geheimnisse der Nacht";
	name 					=	"Tajemství noci";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
//	description				= 	"Geheimnisse der Nacht";
	description				= 	"Tajemství noci";

	//TEXT[5]				= ;
	//COUNT[5]				= ;
	on_state[0]				=	UseItWr_Book_Thief_02;


};
	FUNC VOID UseItWr_Book_Thief_02()
	{
		var int nDocID;


		nDocID = 		Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Geheimnisse der Nacht "		);
					Doc_PrintLine	( nDocID,  0, ""							);
					Doc_PrintLine	( nDocID,  0, "Tajemství noci "				);
					 			 	// -1 -> all pages

					Doc_PrintLine	( nDocID,  0, "");
	//				Doc_PrintLine	( nDocID,  0, "Der Ring der Gewandtheit");
					Doc_PrintLine	( nDocID,  0, "Prsten hbitosti");
					Doc_PrintLine	( nDocID,  0, "---------------");
//					Doc_PrintLines	( nDocID,  0, "Die Macht des Ringes wurde gestärkt mit der Kraft des Windes, der Stille der Nacht und der Beweglichkeit des Schattens. Ein Wunderwerk aus feiner Schmiedekunst und  Zauberei . Geschmiedet in den Höhlen von Nordmar, verzaubert in den Hallen der Weisheit, gewährt der Ring seinem Träger eine höhere Geschicklichkeit. ");
					Doc_PrintLines	( nDocID,  0, "Moc tohoto prstenu byla posílena silou větru, tichem noci a hbitostí stínu. Skutečně mistrovské spojení kovářství a magie. Vykovaný v jeskyních Nordmaru, očarovaný v síních vědění, poskytuje tento prsten nositeli větší obratnost.");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

//					Doc_PrintLines	( nDocID,  1, "Getragen wurde es bisher von:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Tento prsten nosili tito zloději:");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Nantanuel Gildenmeister von Khorinis");
					Doc_PrintLines	( nDocID,  1, "Nantanuel Mistr gildy z Khorinisu");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Tomas 3 Finger");
					Doc_PrintLine	( nDocID,  1, "Tomas - Tříprsťák");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Ilgur Silberauge");
					Doc_PrintLine	( nDocID,  1, "Ilgur - Stříbrné Oko");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Michal Meister der Hände");
					Doc_PrintLines	( nDocID,  1, "Michal - Mistr rukou");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Raul die Katze");
					Doc_PrintLine	( nDocID,  1, "Raul - Kocour");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "M. Fingers Gefangener in der Barriere");
					Doc_PrintLines	( nDocID,  1, "M. Fingers - odsouzenec z pod Bariéry");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Diego");
					Doc_PrintLine	( nDocID,  1, "Diego");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLine	( nDocID,  1, "Edo Flinkhand");
					Doc_PrintLine	( nDocID,  1, "Edo - Mrštná ruka");
					Doc_Show		( nDocID );
	};

//---------------------------------------------------------------------
//	Edo's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Edo(C_Item)
{
//	name 				=	"Edo's Schlüssel";
	name 				=	"Edův klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	owner				=   MIL_103_Berengar;
	value 				=	0;
	//owner				= ;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			=	name;
//	TEXT[0]				=	"Dieser Schlüssel öffnet die Truhe in";
//	TEXT[1]				=	"Edo's Hütte.";
	TEXT[0]				=	"Tento klíč otevírá";
	TEXT[1]				=	"truhlu v Edově chatrči.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Bartok's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Bartok(C_Item)
{
//	name 				=	"Bartok's Schlüssel";
	name 				=	"Bartokův klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
//	TEXT[0]				=	"Dieser Schlüssel öffnet die große Truhe";
//	TEXT[1]				=	"in der Burgschmiede des Alten Lagers.";
	TEXT[0]				=	"Tento klíč otevírá velkou truhlici";
	TEXT[1]				=	"v hradní kovárně Starého tábora.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAr_ScrollHeal_Copy (C_Item)
{
//	name 				=	"Zauber der Heilung";
	name 				=	"Kouzlo léčení";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	50;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;


	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_HEALING_HP_PER_MP;
	on_state[0]			=	UseItAr_ScrollHeal_Copy;
//	description			=	"Heilung";
	description			=	"Léčení";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
//	TEXT	[1]			=	"Heilung pro Mana";			COUNT	[1]		=	SPL_HEALING_HP_PER_MP;
	TEXT	[1]			=	NAME_HealPerMana;			COUNT	[1]		=	SPL_HEALING_HP_PER_MP;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_HEALING_HP_PER_MP;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
FUNC VOID UseItAr_ScrollHeal_Copy()
{
//	PrintScreen	("Der Zauber wirkt nicht!", -1,-1,FONT_OLD_BIG,2);
	PrintScreen	("Kouzlo nefunugje!", -1,-1,FONT_OLD_BIG,2);
};

INSTANCE ItAr_ScrollLight_Copy (C_Item)
{
//	name 				=	"Zauber des Lichts";
	name 				=	"Kouzlo světla";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	5;

	visual				=	"ItAr_Scroll_32.3DS";
	material			=	MAT_STONE;


	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_LIGHT;
	on_state[0]			=	UseItAr_ScrollLight_Copy;
//	description			=	"Licht";
	description			=	"Světlo";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_LIGHT;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

FUNC VOID UseItAr_ScrollLight_Copy ()
{
//	PrintScreen	("Der Zauber wirkt nicht!", -1,-1,FONT_OLD_BIG,2);
	PrintScreen	("Kouzlo nefunugje!", -1,-1,FONT_OLD_BIG,2);
};


//---------------------------------------------------------------------
//	Halvor's Rezept
//---------------------------------------------------------------------
INSTANCE ItWr_HalvorRecipe (C_Item)
{
//	name 					=	"Halvor's Kochbuch";
	name 					=	"Halvorova kuchařka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	Value_RecipeMeat;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	owner					= MIL_100_Halvor;

	scemeName				=	"MAP";
	description				= name;

//	TEXT[1]					= "Halvor's Kochbuch mit einer";
//	TEXT[2]					= "Reihe schmackhafter Rezepte";
//	TEXT[3]					= "aus Fleisch.";
	TEXT[1]					= "Halvorova kuchařka s celou";
	TEXT[2]					= "řadou výtečných receptů";
	TEXT[3]					= "z masa.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseItWr_Recipe_Meat;
};

//---------------------------------------------------------------------
//	Halvor's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Halvor(C_Item)
{
//	name 				=	"Halvor's Schlüssel";
	name 				=	"Halvorův klíč";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
//	TEXT[0]				=	"Dieser Schlüssel öffnet die Zutatentruhe in";
//	TEXT[1]				=	"Halvor's Küche.";
	TEXT[0]				=	"Tento klíč otevírá truhlu";
	TEXT[1]				=	"s přísadami v Halvorově kuchyni";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Kerkerschlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Jail(C_Item)
{
//	name 				=	"Kerkerschlüssel";
	name 				=	"Klíč od vězení";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
//	TEXT[0]				=	"Der Schlüssel für die ";
//	TEXT[1]				=	"Kerkerzellen ";
	TEXT[0]				=	"Klíč k vězeňským celám";

	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Müffelsalz
//---------------------------------------------------------------------
const int	Value_StinkingSalt = 50;
//---------------------------------------------------------------------

INSTANCE ItMi_StinkingSalt(C_Item)
{
//	name 				=	"Müffelsalz";
	name 				=	NAME_StinkingSalt;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;
	value 				=	Value_StinkingSalt;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
//	TEXT[0]				=	"Ein wirklich übelriechendes";
//	TEXT[1]				=	"bräunliches Salz.";
	TEXT[0]				=	"Neuvěřitelně páchnoucí";
	TEXT[1]				=	"hnědá sůl";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};


//---------------------------------------------------------------------
//	Bessesene Heilen Schriftrolle
//---------------------------------------------------------------------

INSTANCE ItAr_ScrollHealPossessed (C_Item)
{
//	name 				=	"alte Rezeptur";
	name 				=	"Stará receptura";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	500;

	visual				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_STONE;

//	description			=	"versiegelte Schriftrolle";
	description			=	"Zapečetěný svitek";
//	TEXT	[0]			=	"Sie ist versiegelt, aber";
//	TEXT	[1]			=	"es scheint die Rezeptur zu";
//	TEXT	[2]			=	"sein die Talamon sucht";
	TEXT	[0]			=	"Je zapečetěný, ale zdá se,";
	TEXT	[1]			=	"že se jedná o recepturu,";
	TEXT	[2]			=	"kterou hledá Talmon";
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

//---------------------------------------------------------------------
//	Schlafwein THF Mission
//---------------------------------------------------------------------
INSTANCE ItFo_SleepWine(C_Item)
{
//	name 				=	"Schlafwein";
	name 				=	"Uspávací víno";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseSleepWine;
	scemeName			=	"POTION";

//	description			= "Schlafwein";
	description			= "Uspávací víno";
};

	FUNC VOID UseSleepWine()
	{

	};


//---------------------------------------------------------------------
//	Tagebuchseite von Nefarius
//---------------------------------------------------------------------
INSTANCE ItWr_Nefarius_Diary(C_Item)
{
//	name 				=	"Tagebuch-Seite";
	name 				=	"Stránka z deníku";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Nefarius_Diary;

	description			=	name;
//	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
//	TEXT[2]				=	"kaum noch entziffern kann.";
//	TEXT[3]				=	"Der ehemalige Besitzer scheint Nefarius der";
//	TEXT[4]				=	"Wassermagier gewesen zu sein.";
	TEXT[1]				=	"Silně zvětralá stránka, ";
	TEXT[2]				=	"text lze rozluštit jen stěží. ";
	TEXT[3]				=	"Zdá se, že majitel ";
	TEXT[4]				=	"byl mág Vody Nefarius.";
};

FUNC void Use_Nefarius_Diary()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
//				Doc_PrintLine	(nDocID,  0, "107. Tag");
				Doc_PrintLine	(nDocID,  0, "Den 107");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
//				Doc_PrintLines	(nDocID,  0, "Milten und unser einstiger Held haben uns heute schmählich verraten! Sie haben hinter unserem Rücken die magische Energie aus dem grossen Erzhaufen in irgendein altes Artefakt gesaugt. All unsere Hoffnungen auf ein Entkommen aus der Barriere sind jetzt endgültig zerstört!");
				Doc_PrintLines	(nDocID,  0, "Milten a náš bývalý hrdina nás dnes hanebně zradili! Za našimi zády přenesli magickou energii rudné haldy do nějakého starobylého artefaktu. Všechny naše naděje na únik z Bariéry jsou zničeny!");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
//				Doc_PrintLine	(nDocID,  0, "129. Tag");
				Doc_PrintLine	(nDocID,  0, "Den 129");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
//				Doc_PrintLines	(nDocID,  0, "Das Unglück ist über uns hereingebrochen! Obwohl die magische Barriere plötzlich verschwand, wurde unser Lager von schwersten Beben fast zerstört. Alle hier haben den Verstand verloren und massakrieren sich gegenseitig. Ich muss weg von hier...");
				Doc_PrintLines	(nDocID,  0, "Postihlo nás velké neštěstí! Přestože magická Bariéra z ničeho nic zmizela, byl náš tábor téměř úplně zničen velikým zemětřesením. Všichni se tu pomátli a začali se navzájem masakrovat. Musím odstud utéct...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
//				Doc_PrintLine	(nDocID,  0, "130. Tag");
				Doc_PrintLine	(nDocID,  0, "Den 130");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
//				Doc_PrintLines	(nDocID,  0, "Wir werden heute nacht bei Cavelorn in seiner Hütte bleiben, und morgen weiterziehen. Ich hoffe nur, dass keine Orkhorden mehr durch diese Gegend ziehen...");
				Doc_PrintLines	(nDocID,  0, "Dnes přečkáme noc u Cavalorna v jeho chatrči a zítra budeme pokračovat. Jen doufám, že se tu v okolí nepohybují žádné hordy skřetů...");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Notiz von Bullit
//---------------------------------------------------------------------
INSTANCE ItWr_Bullit_Note(C_Item)
{
//	name 				=	"Notiz von Bullit";
	name 				=	"Bullitův záznam";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Bullit_Note;

	description			=	name;
//	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
//	TEXT[2]				=	"kaum noch entziffern kann.";
//	TEXT[3]				=	"Der ehemalige Besitzer scheint ein Gardist";
//	TEXT[4]				=	"Namens Bullit gewesen zu sein.";
	TEXT[1]				=	"Silně zašlá stránka,";
	TEXT[2]				=	"text lze rozluštit jen stěží. ";
	TEXT[3]				=	"Zdá se, že patřila ";
	TEXT[4]				=	"bývalému strážci Bullitovi.";
};

FUNC void Use_Bullit_Note()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
//				Doc_PrintLine	(nDocID,  0, "Notiz");
				Doc_PrintLine	(nDocID,  0, "Záznam");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
//				Doc_PrintLines	(nDocID,  0, "Gomez ist wahnsinnig geworden! Er will doch tatsächlich,dass wir Gardisten alle Feuermagier hinterrücks umbringen, nur weil Corristo, dieser Narr von Erzmagier, sich offen gegen ihn ausgesprochen hat.");
				Doc_PrintLines	(nDocID,  0, "Gomez úplně zašílel! On skutečně chce, abychom my, strážci, zavraždili mágy Ohně jen proto, že se Corristo, ten blázen arcimágovská, proti němu otevřeně postavil.");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Besser ich schaffe einige Vorräte beiseite. Für schlechte Zeiten. Man kann nie wissen was kommt.");
				Doc_PrintLines	(nDocID,  0, "Bude lepší, když si nechám nějaké zásoby stranou. Na horší časy. Člověk nikdy neví.");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 1
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix1(C_Item)
{
//	name 			=	"Die Spur des Phoenix";
	name 			=	"Fénixova pouť";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix1;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Ein vergilbtes Buch mit brüchigen Seiten.";
//	TEXT	[2]		=	"Sein Verfasser scheint ein Feuermagier";
//	TEXT	[3]		=	"mit Namen Corristo gewesen zu sein.";
	TEXT	[1]		=	"Stará kniha se zažloutlými stránkami.";
	TEXT	[2]		=	"Vypadá to, že ji sepsal mág Ohně";
	TEXT	[3]		=	"jménem Corristo.";
};

	FUNC VOID Use_Phoenix1()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	(nDocID,  2 );                         		// wieviel Pages

					Doc_SetPage 	(nDocID,  0, "Book_Mage_L.tga", 	0 	);
					Doc_SetPage 	(nDocID,  1, "Book_Mage_R.tga",		0	);

					//1.Seite
   					Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	(nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	(nDocID,  0, "Spur des Phoenix"			);
					Doc_PrintLine	(nDocID,  0, "Fénixova pouť"			);
					Doc_PrintLine	(nDocID,  0, "------------------"		);
					Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
//					Doc_PrintLines	(nDocID,  0, "Der Sturm zieht auf. Ich weiss es und kann doch nicht dagegen ankämpfen. Ich selbst verhalf einst dem Sturm zu seiner Macht und sonnte mich in seinem Glanz. Doch nun ist der Bund mit dem Sturm zum Pakt mit dem Teufel geworden und meine Seele ist verloren.");
					Doc_PrintLines	(nDocID,  0, "Bouře se blíží. Vím to a přesto s ní nemohu bojovat. Sám jsem jí pomohl k moci a sám jsem se v její kráse vyhříval. Nyní se však smlouva s bouří stala smlouvou s ďáblem a moje duše je zatracena!");
					Doc_PrintLine	(nDocID,  0, "");
//					Doc_PrintLines	(nDocID,  0, "Doch das Feuer wird weiterbestehen, muss weiterbestehen. Sein  Wissen wird sich erheben wie ein Phoenix aus der Asche. Derjenige, der gewillt ist, der Spur des Phoenix zu folgen, wird die Wiederauferstehung des Wissens über das Feuer erleben.");
					Doc_PrintLines	(nDocID,  0, "Ale Oheň bude planout dál, musí! Jeho znalosti poastnou jako Fénix z popela. Ten, kdo je ochcoten následovat stopu Fénixe, zažije vzkříšení poznání Ohně.");

					//2.Seite
					Doc_SetMargins	(nDocID, -1, 30, 20, 275, 20, 1  		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
					Doc_PrintLine	(nDocID,  1, "");
//					Doc_PrintLines	(nDocID,  1, "Die Spur des Phoenix beginnt in den tiefsten Tiefen seines runden Hortes. Dort, wo der Bund mit dem Sturm begann liegt die Asche des Phoenix begraben.");
					Doc_PrintLines	(nDocID,  1, "Fénixova pouť začíná v nejhlubších hlubinách jeho kulatého útočiště. Tam, kde začla smouva s bouří, leží pohřben Popel Fénixe.");
					Doc_Show		(nDocID );

		if (Phoenix_State == 0)
		{
			Log_CreateTopic			(CH1_Phoenix,		LOG_MISSION);
			Log_SetTopicStatus		(CH1_Phoenix,		LOG_RUNNING);
//			B_LogEntry				(CH1_Phoenix,		"Offensichtlich ahnte der oberste Feuermagier Corristo, dass ihm übles wiederfahren wird, und hat eine rätselhafte 'Spur des Phoenix' gelegt. Am Ende dieser Spur soll das 'Wissen des Feuers' zu finden sein, was immer der ermordete Zauberer auch damit meinte.");
			B_LogEntry				(CH1_Phoenix,		"Je zřejmé, že nejvyyší mág Ohně Corristo měl podezření, že se mu něco špatného přihodí a připravil záhadnou 'Fénixovu pouť'. Na konci cesty by měla být k nalezení 'znalost Ohně', ať tím zavražděný mág myslel cokoliv.");
			Wld_InsertItem			(ItWr_Phoenix2,		"FP_SPAWN_PHOENIX_2");

			Phoenix_State = 1;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 2
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix2(C_Item)
{
//	name 			=	"Die Asche des Phoenix";
	name 			=	"Popel Fénixe";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix2;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Dies ist der zweite Teil der";
//	TEXT	[2]		=	"rätselhaften Spur des Phoenix";
//	TEXT	[3]		=	"die Corristo verfasst hat.";
	TEXT	[1]		=	"Druhý díl záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT	[3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix2()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Die Asche des"				);
					Doc_PrintLine	( nDocID,  0, "Popel Fénixe"				);
//					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "---------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Einst, als ich den Kindern des Sturmes zur Macht verhalf, fegten sie ihre Unterdrücker hinweg. Doch ihre Grausamkeit stand der, der Unterdrücker in nichts nach.");
					Doc_PrintLines	( nDocID,  0, "Jednou, když jsem pomohl dětem bouře k moci, smetly své utiskovatele. Jejich krutost vša nebyla větší než krutost jejich utlačovatelů.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Sie raubten, mordeten und trieben die Schwachen zu unwürdiger Arbeit.");
					Doc_PrintLines	( nDocID,  0, "Okrádali, vraždili a hnali slabé k nedůstojné práci.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Was einst felsenfest verbunden war, brach durch die Macht des Sturms entzwei. An dieser Stelle beginnt der Aufstieg der Macht des Feuers, gleich dem Aufstieg des Phoenix. Doch der Phoenix hat an der Stelle des Bruches eine Feder hinterlassen. Die Feder des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "To, co bylo kdysi pevně svázáno, rozbila síla bouře. V tomto bodě začíná vzestup síly ohně, jako vzestup Fénixe. Fénix ale na tomto místě zlomu ztratil brko. Fénixovo pero.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 1)
		{
			B_GiveXP			(XP_Phoenix2);
//			B_LogEntry			(CH1_Phoenix,		"Ich habe das zweite Buch von der 'Spur des Phoenix' gefunden. Es spricht von einem Bruch, der etwas 'felsenfest Verbundenes durch die Macht des Sturmes entzweite'.");
			B_LogEntry			(CH1_Phoenix,		"Našel jsem druhou knihu 'Fénixovy poutě'. Píše se tam o zlomu, který 'roztrhl něco, co bylo pevně svázáno silou bouře'.");
			Wld_InsertItem		(ItWr_Phoenix3,		"FP_SPAWN_PHOENIX_3");

			Phoenix_State = 2;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 3
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix3(C_Item)
{
//	name 			=	"Die Feder des Phoenix";
	name 			=	"Fénixovo pero";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix3;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der dritte Teil der Spur des";
//	TEXT	[2]		=	"Phoenix von Corristo dem";
//	TEXT	[3]		=	"obersten Feuermagier.";
	TEXT	[1]		=	"Třetí díl záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT	[3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix3()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Die Feder des"				);
					Doc_PrintLine	( nDocID,  0, "Fénixovo pero"				);
//					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "---------------"		);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Die Kinder des Sturms wurden zu den neuen Unterdrückern und die Macht des Feuers stärkte sie. Nichts war vor der Gier des Sturms sicher.");
					Doc_PrintLines	( nDocID,  0, "Děti bouře se stali novými utiskovateli a moc Ohně je posilovala. Před chamtivostí bouře nebylo nic v bezpečí.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Schon bald versammelten sich die Unzufriedenen und verliessen den Hort. Sie wurden von der Weisheit des Wassers hinfortgetragen und von seiner Macht beschützt.");
					Doc_PrintLines	( nDocID,  0, "Nespokojení se brzy shromáždili a opustili útočiště. Byli ovlivněni moudrostí Vody a chráněni její silou.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Dort, wo die Macht des Wassers den Hort verlässt, findest du die Wellen des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "Vlny Fénixe najdeš tam, kde moc Vody opustila útočiště.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 2)
		{
			B_GiveXP			(XP_Phoenix3);
//			B_LogEntry			(CH1_Phoenix,		"Das dritte Buch von der 'Spur des Phoenix' ist nicht minder rätselhaft. Ich soll nach einer Stelle suchen, an der 'die Macht des Wassers den Hort verlässt'.");
			B_LogEntry			(CH1_Phoenix,		"Třetí kniha 'Fénixovy poutě' není o nic méně záhadná. Mám hledat místo, kde síla vody opouští útočiště.");
			Wld_InsertItem		(ItWr_Phoenix4,		"FP_SPAWN_PHOENIX_4");

			Phoenix_State = 3;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 4
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix4(C_Item)
{
//	name 			=	"Die Wellen des Phoenix";
	name 			=	"Vlny fénixe";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix4;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der vierte Teil der Spur des";
//	TEXT	[2]		=	"Phoenix von Corristo dem";
//	TEXT	[3]		=	"obersten Feuermagier.";
	TEXT	[1]		=	"Čtvrtý díl záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT	[3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix4()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Die Wellen des"				);
					Doc_PrintLine	( nDocID,  0, "Vlny fénixe"					);
//					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "----------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "So errichteten Die Kinder des Sturmes um sich herum hohe Dämme um sich vor den Wogen des Wassers zu schützen. Sie hielten Ausschau nach ihren einstigen Leidensgenossen und trieben die Verbliebenen erbarmungslos zu harter Arbeit.");
					Doc_PrintLines	( nDocID,  0, "Tak si děti bouře kolem sebe vystavěly vysoké přehrady, aby se ochránili před vlnami Vody. Dohlíželi na své bývalé druhy a nemilosrdně hnali ty, kteří zůstali, do tvrdé práce.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Der anfänglich so reine Sturm der Gerechtigkeit wandelte sein Gesicht und wurde schlimmer als das, was er einst ersetzte.");
					Doc_PrintLines	( nDocID,  0, "Bouře spravedlnosti, která byla zpočátku tak čistá, změnila tvář a stala se horší než to, co nahradila");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Beschreite den Damm und halte nach den Wogen des Wassers Ausschau. Dann wirst du vielleicht auch die Sehnsucht des Phoenix erblicken können.");
					Doc_PrintLines	( nDocID,  1, "Vkroč na přehradu a podívej se na vlny Vody. Poté uvidíš i Fénixovu touhu.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 3)
		{
			B_GiveXP			(XP_Phoenix4);
//			B_LogEntry			(CH1_Phoenix,		"Das vierte Buch von der 'Spur des Phoenix' wird immer rätselhafter. Es spricht davon, dass man auf einem Damm Ausschau halten soll, um die 'Sehnsucht des Phoenix' erblicken zu können.");
			B_LogEntry			(CH1_Phoenix,		"Čtvrtá kniha Fénixovy touhy je ještě záhadnější. Píše se tam, že se člověk musí podívat na přehradu, abyc viděl Fénicovu touhu.");
			Wld_InsertItem		(ItWr_Phoenix5,		"FP_SPAWN_PHOENIX_5");

			Phoenix_State = 4;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 5
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix5(C_Item)
{
//	name 			=	"Die Sehnsucht des Phoenix";
	name 			=	"Fénixova touha";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix5;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der fünfte Teil der Spur des";
//	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
	TEXT	[1]		=	"Pátý díl záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT    [3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix5()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Die Sehnsucht"				);
					Doc_PrintLine	( nDocID,  0, "Fénixova touha"				);
//					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "---------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Zuerst versteckten sich die Kinder des Wassers, die aus dem Hort flohen. Sie suchten Zuflucht in versteckten Höhlen, doch schon bald fanden sie einen eigenen Hort, der sie vor dem Zorn des Sturms schützte. ");
					Doc_PrintLines	( nDocID,  0, "Nejprve se schovaly děti Vody, kteří odešli z útočiště. Hledali útočiště v ukrytých jeskyních, než si našli vlastní útočiště, které by je chránilo před hněvem bouře.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Nicht alle Höhlen kann man trockenen Fusses betreten. Doch genau diese Höhlen sind oft die besten Verstecke. Der feurige Phoenix hasst solche Höhlen, hat er doch Angst vor dem fliessenden Element. Solche Höhlen sind der Alptraum des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "Do všechn jeskyní nelze vstoupit suchou nohou. Ale právě tyto jeskyně jsou nejčastěji nejlepšími úkryty. Ohnivý Fénix takové jeskyně nenívidí protože se bojí tekoucího živlu. Takové jeskyně jsou Fénixovou noční můrou. ");
					Doc_Show		( nDocID );

		if (Phoenix_State == 4)
		{
			B_GiveXP			(XP_Phoenix5);
//			B_LogEntry			(CH1_Phoenix,		"Das fünfte Buch von der 'Spur des Phoenix' erzählt davon, dass Höhlen, die man nicht trockenen Fusses erreichen kann, der Alptraum eines jeden Phoenix sind.");
			B_LogEntry			(CH1_Phoenix,		"Pátá kniha 'Fénixovy touhy' vypráví o tom, že jeskyně, do kterých se nedá dostat suchou nohou jsou pro Fénixe noční můrou. ");
			Wld_InsertItem		(ItWr_Phoenix6,		"FP_SPAWN_PHOENIX_6");

			Phoenix_State = 5;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 6
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix6(C_Item)
{
//	name 			=	"Der Alptraum des Phoenix";
	name 			=	"Fénixova noční můra";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix6;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der sechste Teil der Spur des";
//	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
	TEXT	[1]		=	"Šestá kniha záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT    [3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix6()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Der Alptraum"				);
					Doc_PrintLine	( nDocID,  0, "Fénixova "				);
//					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "noční můra"					);
					Doc_PrintLine	( nDocID,  0, "--------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Schon bald riss der Schnabel des Sturmes aufs neue Fleisch aus seiner eigenen Seite und dieses Fleisch wurde zu den Kindern des Geistes. Sie versteckten sich in felsigen Höhlen, bevor sie ein eigenen Hort inmitten von Schlamm und Ungeziefer gründeten.");
					Doc_PrintLines	( nDocID,  0, "Již brzy vytrhne zobák bouře nový kousek masa se svých vlastních řad. Z těchto se stanou děti Ducha. Budou se schovávají ve skalních jeskyních a poté si mezi bahnem a hmyzem najdou vlastní útočiště.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Dies war die Geburts- stunde unseres eigenen Untergangs, denn die Macht des Geistes erschütterte das Gefüge der Welt.");
					Doc_PrintLines	( nDocID,  0, "To byla hodina našeho vlastního pádu, protože síla Ducha otřásla samotnou magickou strukturou světa.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Der Phoenix zieht seine Jungen in einem Felsennest in luftiger Höhe auf. Dort wo kein Weg hinführt, brennt das feurige Nest des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "Fénix vychovává svá mláďata ve sklaním hnízdě v nesmírných výškách. Tam, kde není žádná cesta, hoří ohnivé hnízdo Fénixe.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 5)
		{
			B_GiveXP				(XP_Phoenix6);
//			B_LogEntry				(CH1_Phoenix,		"Das sechste Buch von der 'Spur des Phoenix' spricht von einem 'brennenden Felsennest in luftiger Höhe', dem Nest des Phoenix.");
			B_LogEntry				(CH1_Phoenix,		"Šestá kniha 'Feniovy pouti' hovoří o hořícím sklaním hnízdu v nesmírné výšce, o Hnízdu Fénixe.");

			Wld_InsertItem			(ItWr_Phoenix7,		"FP_SPAWN_PHOENIX_7");
			Wld_SetObjectRoutine 	(00,00,"FIRE_OW_PHOENIX_NEST",1);
			Wld_SetObjectRoutine 	(12,00,"FIRE_OW_PHOENIX_NEST",1);

			Phoenix_State = 6;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 7
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix7(C_Item)
{
//	name 			=	"Das Nest des Phoenix";
	name 			=	"Hnízdo Fénixe";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix7;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der siebente Teil der Spur des";
//	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
	TEXT	[1]		=	"Sedmá kniha záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT    [3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix7()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Das Nest"					);
					Doc_PrintLine	( nDocID,  0, "Hnízdo Fénixe"					);
//					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "So zogen die Jahre ins Land und der Zorn des Sturmes wetteiferte mit den Wogen des Wassers und den Kindern des Geistes. Das Feuer, dass einst den Sturm so eifrig ernährte, wurde immer schwächer und heute lodert es nur noch unbedeutend.");
					Doc_PrintLines	( nDocID,  0, "Roky ubíhaly a hněv bouře soupeřil s vlnami Vody a dětmi Ducha. Oheň, který kdysi tak horlivě živil bouři, byl stále slabší a slabší a dnes hoří jen nepatrně.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Vorkehrungen müssen getroffen werden, um das Wissen des Feuers zu bewahren.");
					Doc_PrintLines	( nDocID,  0, "Musí být přijata opatření, abychom zachovali vědění Ohně.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Neigen sich die Tage eines Phoenix seinem Ende, so lässt er sich am höchsten Ort seines Hortes nieder und erwartet das Unausweichliche. Er erwartet dort den Tod des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "Když se blíží Fénoxovy poslední dny, usadí se na nejvyšším místě svého útočiště a čeká na nevyhnutelné. Čeká tam na Smrt Fénixe.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 6)
		{
			B_GiveXP			(XP_Phoenix7);
//			B_LogEntry			(CH1_Phoenix,		"Das siebente Buch beschreibt den Tod des Phoenix am höchsten Ort seines Hortes.");
			B_LogEntry			(CH1_Phoenix,		"Sedmá kniha popisuje smrt Fénixe na nejvyšším místě jeho útočiště.");

			Wld_InsertItem		(ItWr_Phoenix8,		"FP_SPAWN_PHOENIX_8");

			Phoenix_State = 7;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 8
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix8(C_Item)
{
//	name 			=	"Der Tod des Phoenix";
	name 			=	"Smrt Fénixe";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix8;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der achte Teil der Spur des";
//	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
	TEXT	[1]		=	"Osmá kniha záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT    [3]		=	"Corristo.";
};

	FUNC VOID Use_Phoenix8()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Der Tod des"					);
					Doc_PrintLine	( nDocID,  0, "Smrt Fénixe"					);
//					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Das Gefüge der Welt bebte. Erst langsam und schwach, dann immer öfter und immer heftiger. Das Ende ist nah, dessen bin ich mir sicher. Weder Sturm noch Wasser noch Geist erkennen es. Doch das Feuer weiss um die Wahrheit.");
					Doc_PrintLines	( nDocID,  0, "MAgická struktura světa se otřísla. Nejprve pomalu a slabě a potom stále častěji a silněji. Konec je blízko, jsem si tím jist. Ani bouře, ani voda, ani duch to nerozeznali.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Es muss weiterbestehen. Es war immer so. Es wird immer so sein.");
					Doc_PrintLines	( nDocID,  0, "Musí to pokračovat, vždy to tak bylo, vžy to tak bude.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
//					Doc_PrintLines	( nDocID,  1, "Das Leben des Phoenix ist ein immerwährender Kreislauf. Er kehrt stets dorthin zurück, wo er einst begonnen hat, um sich aus der Asche wieder zu neuem Leben zu erheben. Dies ist die Auferstehung des Phoenix.");
					Doc_PrintLines	( nDocID,  1, "Život Fénixe je nekonečný cyklus. Vždy se vrací tam, kde to začalo, aby povstal z popela do nového života. Toto je vzkříšení Fénixe.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 7)
		{
			B_GiveXP			(XP_Phoenix8);
//			B_LogEntry			(CH1_Phoenix,		"Das achte Buch klingt wie der Abschluss der 'Spur des Phoenix'. Nur ist dieser Hinweis der rätselhafteste von allen.");
			B_LogEntry			(CH1_Phoenix,		"Vypadá to, že osmá kniha je záverem 'Fénixovy pouti'. Tato nápověda je ze všech nejzáhadnější.");

			Phoenix_State = 8;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Cheatbuch
//---------------------------------------------------------------------
INSTANCE ItWr_PhoenixCheat(C_Item)
{
//	name 			=	"Der Cheat des Phoenix";
	name 			=	"Fénixův cheat";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_PhoenixCheat;
	scemeName		=	"MAP";

	description		=	name;
//	TEXT	[1]		=	"Der achte Teil der Spur des";
//	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
	TEXT	[1]		=	"Osmá kniha záhadné 'Fénixovy pouti',";
	TEXT	[2]		=	"kterou napsal nejvyšší mág Ohně";
	TEXT    [3]		=	"Corristo.";
};

	FUNC VOID Use_PhoenixCheat()
	{
		var int nDocID;
		nDocID = 	Doc_Create		()			  ;									// DocManager
					Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite
   					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Der Cheat"					);
					Doc_PrintLine	( nDocID,  0, "Fénixův cheat"					);
//					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Wer keine Lust hat, nach allen 8 Phoenix-Büchern zu suchen, der muss es auch nicht.");
					Doc_PrintLines	( nDocID,  0, "Kdo nemá chuť hledat všech osm Fénixových knich, nemusí.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Dieses Buch schaltet die Geheime Kammer auch sofort frei.");
					Doc_PrintLines	( nDocID,  0, "Tato kniha okamžitě odemkne tajnou komnatu.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "BlaBlaBa");
					Doc_Show		( nDocID );

		Phoenix_State = 8;
	};

//---------------------------------------------------------------------
//	Elexir des Geistes - für Xardas
//---------------------------------------------------------------------
INSTANCE ItPo_ElexirOfMind(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Use_ElexirOfMind;
	scemeName		=	"POTIONFAST";

//	description		= "ELIXIER DES GEISTES";
//	TEXT[0]			= "Dies ist das Elixier, das Xardas benötigt";
//	TEXT[1]			= "Ich weiss nicht wie es genau wirkt, aber";
//	TEXT[2]			= "ich sollte es auf KEINEN Fall trinken";
//	TEXT[3]			= "bevor ich mit Xardas gesprochen habe!";
	description		= "ELIXÍR DUCHA";
	TEXT[0]			= "Toto je elixír, který potřebuje Xardas.";
	TEXT[1]			= "Nevím, jak přesně funguje, ale";
	TEXT[2]			= "v každém případě bych ho NEMĚL pít";
	TEXT[3]			= "předtím, než si o něm promluvím s Xardasem!";
};

	FUNC VOID Use_ElexirOfMind()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "Use_ElexirOfMind");

		Npc_ChangeAttribute	(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};

//---------------------------------------------------------------------
//	Placebo für Agon
//---------------------------------------------------------------------
INSTANCE ItFo_Placebo(C_Item)
{
//	name 			=	"Klarer Trank";
	name 			=	"Čistý lektvar";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;

	description		=	name;
//	TEXT[0]			=	"Diese flüssige Substanz ist so rein und klar";
//	TEXT[1]			=	"dass man ihr alle möglichen Fähigkeiten";
//	TEXT[2]			=	"zutrauen könnte.";
	TEXT[0]			=	"Tahle tekutina je tak čistá a jasná,";
	TEXT[1]			=	"že by jeden mohl uvěřit, ";
	TEXT[2]			=	"že má všechny možné schopnosti.";
};

//---------------------------------------------------------------------
//	Brief über Steinwurzel
//---------------------------------------------------------------------
INSTANCE ItWr_BloodThistle(C_Item)
{
//	name 				=	"Abschrift";
	name 				=	"Opis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_BloodThistle;

	description			=	name;
//	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
//	TEXT[2]				=	"noch erstaunlich gut entziffern kann.";
	TEXT[1]				=	"Silně zašlá stránka. Text je";
	TEXT[2]				=	"překvapivě dobře zachován.";


};

FUNC void Use_ItWr_BloodThistle()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Das Kraut, das den Namen Blutdistel trägt, sucht sich zum Wachsen meist die großen Wasserpflanzen.");
				Doc_PrintLines	(nDocID,  0, "Krvavý bodlák je bylina, která obvykle roste u velkých vodních rostlin.");
//				Doc_PrintLines	(nDocID,  0, "In ihrem Schutz gedeihen sie reichlich an feuchten Ufern und sandigen Inseln, an Seen und Flüßen.");
				Doc_PrintLines	(nDocID,  0, "Mezi těmito rostlinami se jim daří. Vyskytují se hojně na březích řek a na písečných ostrovech.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "Abschrift aus HEILKRAFT DER NATUR");
				Doc_PrintLine	(nDocID,  0, "Opis z knihy LÉČIVÁ SÍLA PŘÍRODY");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "von Bota Niker");
				Doc_PrintLine	(nDocID,  0, "od Bota Nika");
				Doc_Show		(nDocID);

	B_LearnBloodThistle ();
};

//---------------------------------------------------------------------
//	Brief von Osric an Helvegor
//---------------------------------------------------------------------
INSTANCE ItWr_Helvegor(C_Item)
{
//	name 				=	"Brief";
	name 				=	"Dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Helvegor;

	description			=	name;
//	TEXT[1]				=	"ein Brief von Osric an Helvegor ";
	TEXT[1]				=	"Dopis od Osrica pro Helvegora";
};

FUNC void Use_ItWr_Helvegor()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
//				Doc_PrintLine	(nDocID,  0, "HelvegoR, ");
				Doc_PrintLine	(nDocID,  0, "HelvegoRe, ");
//				Doc_PrintLines	(nDocID,  0, "hier im lager wimmelt es nur so von dieben und gesindeL. du bist der einzige, dem ich noch vertraue.");
				Doc_PrintLines	(nDocID,  0, "tady ve skladu se to hemží zloději a jiným ksindLem. Ty jsi jediný, komu věřím.");
//				Doc_PrintLines	(nDocID,  0, "falls mir etwas zustossen solLte, ich habe ein paar nützliche dinge in sichere verwahRung gebracht. erinnerst du dich noch an die zeit, als wir hier ankamen?");
				Doc_PrintLines	(nDocID,  0, "pro případ, že by se mi něco stalo, uschoval jsem tu v tRuhle nějaké užitečné věci. Pamatuješ si, když jsem sem přišli?");
//				Doc_PrintLines	(nDocID,  0, "bevor wir für agon gearbeitet haben? Das gerüst ist Leer und verlassen, die aRbeiten sind eingestellt.");
				Doc_PrintLines	(nDocID,  0, "Před tím, než jsem pracovali pro Agona? Práce se zastaviLa, lešení je pRázdné a opuštěné.");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "Die Kombination steckt mittendrin. ");
				Doc_PrintLine	(nDocID,  0, "Kombinaci máš přímo před očima. ");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "osric");
				Doc_PrintLine	(nDocID,  0, "Osric");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_Show		(nDocID);


};

//---------------------------------------------------------------------
//	Über die Götter
//---------------------------------------------------------------------
INSTANCE ItWr_Gods(C_Item)
{
//	name 				=	"Über die Götter";
	name 				=	"O bozích";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Gods;

	description			=	name;
//	TEXT[1]				=	"Sieht aus, wie eine Abschrift aus einem Buch";
	TEXT[1]				=	"Vypadá to jako opis nějaké knihy.";

};

FUNC void Use_ItWr_Gods()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Innos der Gott des Feuers und der Gesetzes");
				Doc_PrintLines	(nDocID,  0, "Innos, bůh ohně a zákonů");
//				Doc_PrintLines	(nDocID,  0, "Wahrer der Ordnung ");
				Doc_PrintLines	(nDocID,  0, "Strážce pořádku ");
				Doc_PrintLines	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Adanos Gott des Wassers und der Gerechtigkeit");
				Doc_PrintLines	(nDocID,  0, "Adanos, bůh vody a spravedlnosti");
//				Doc_PrintLine	(nDocID,  0, "Waagschale der Menschheit ");
				Doc_PrintLine	(nDocID,  0, "Váhy lidstva ");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "Beliar Gott des Todes und der Dunkelheit");
				Doc_PrintLine	(nDocID,  0, "Beliar, bůh smrti a temnoty");
//				Doc_PrintLine	(nDocID,  0, "Herrscher der Nacht ");
				Doc_PrintLine	(nDocID,  0, "Vládce noci ");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "Zusammen bilden sie die göttliche Dreifaltigkeit ");
				Doc_PrintLine	(nDocID,  0, "Spolu tvoří božskou trojici, ");
//				Doc_PrintLine	(nDocID,  0, "Den Ursprung der Welt, ihren Weg und ihr Ende");
				Doc_PrintLine	(nDocID,  0, "počátek světa, jeho cestu a jeho konec.");
				Doc_Show		(nDocID);

	if (Knows_Gods == FALSE)
	{
		B_GiveXP (XP_KnowsGods);
		Knows_Gods = TRUE;
	};

};



//---------------------------------------------------------------------
//	Palgurs Notiz
//---------------------------------------------------------------------
INSTANCE ItWr_Palgur(C_Item)
{
//	name 				=	"Seite";
	name 				=	"Stránka";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Palgur;

	description			=	name;
//	TEXT[1]				=	"Ein einzelner Tagebuch Eintrag";
	TEXT[1]				=	"Jedna samostatná stránka z deníku";

};

FUNC void Use_ItWr_Palgur()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Isgar hat seine Tränke herumstehen lassen. Wie unvorsichtig von ihm. Und wie gut, das es Diebe gibt, denen man es anhängen kann.");
				Doc_PrintLines	(nDocID,  0, "Isgar nechal své lektvary postávat jen tak. To od něj bylo nedbalé. A jak je dobré, že je tu zloděj, kterému to mohu přišít.");
//				Doc_PrintLines	(nDocID,  0, "Die Tränke habe ich dort versteckt, wo viele hergehen, aber niemand bleibt.");
				Doc_PrintLines	(nDocID,  0, "Lektvary jsem ukryl tam, kam hodně lidí chodí, ale nikdo nezůstává.");
//				Doc_PrintLines	(nDocID,  0, "Nur als reine Vorsichtsmassnahme. Wer weiß denn schon, was uns noch alles bevorsteht.");
				Doc_PrintLines	(nDocID,  0, "Čistě jen jako preventinvní opatření. Kdo ví, co máme ještě před sebou.");
//				Doc_PrintLines	(nDocID,  0, "Talamon ist viel zu sehr mit seinen Forschungen beschäftigt, und Isgar ist nur darauf aus Silber zu kassieren, ");
				Doc_PrintLines	(nDocID,  0, "Talmon je příliš zabraný do svého výzkumu a Isgar je tu jen proto, aby inkasoval stříbro, ");
//				Doc_PrintLines	(nDocID,  0, " als das sie an Massnahmen für den Fall eines Angriffes denken.");
				Doc_PrintLines	(nDocID,  0, "než aby přemýšleli nad opatřeními proti případnému útoku.");

				Doc_Show		(nDocID);



};

//---------------------------------------------------------------------
//	Brief eines Unbekannten
//---------------------------------------------------------------------
INSTANCE ItWr_Worker(C_Item)
{
//	name 				=	"Brief";
	name 				=	"Dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Worker;

	description			=	name;
//	TEXT[1]				=	"Ein Teil eines Briefes";
//	TEXT[2]				=	"ohne erkennbaren Anfang oder Ende";
	TEXT[1]				=	"Část dopisu";
	TEXT[2]				=	"bez zjevného začátku nebo konce";


};

FUNC void Use_ItWr_Worker()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLines	(nDocID,  0, "Es ist furchtbar. Die Orks ziehen durchs Land und plündern die Dörfer. Auf dem Weg ins Tal von Khorinis haben wir einen Zug anderer Flüchtender gesehen. ");
				Doc_PrintLines	(nDocID,  0, "Je to hrozné. Skřeti se toulají po celé zemi a drancují vesnice. Cestou do údolí Khorinisu jsme viděli celou řadu nových uprchlíků. ");
//				Doc_PrintLines	(nDocID,  0, "Sie sind den Orks in die Hände gefallen. Bei Innos, die Orks haben schreckliche Dinge mit ihnen getan. ");
				Doc_PrintLines	(nDocID,  0, "Padli do rukou skřetům. U Innose, ti skřeti jim dělali strašné věci. ");
//				Doc_PrintLines	(nDocID,  0, "Innos sei Dank, zumindest haben wir es ins Lager geschafft. Der König ist ebenfalls hier im Tal. Das gibt vielen hier Mut und Kraft. ");
				Doc_PrintLines	(nDocID,  0, "Díky bohu jsme to se včas dostali do tábora. Král je také tady v údolí. To dává mnohým naději a sílu.");
//				Doc_PrintLines	(nDocID,  0, "Aber es gibt noch viel zu tun. Wir müssen den Wall wieder aufbauen, um uns vor den Orks zu schützen.");
				Doc_PrintLines	(nDocID,  0, "Stále je vša třeba hodně udělat. Musíme znovu postavit zeď, abychom se mohli skřetům ubránit.");
				Doc_PrintLines	(nDocID,  0, "");

				Doc_Show		(nDocID);
};