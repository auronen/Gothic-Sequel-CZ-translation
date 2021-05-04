//---------------------------------------------------------------------
//	Missionsmünzen, damit Leichen liegenbleiben
//---------------------------------------------------------------------
instance ItMi_Coin (C_Item)
{
	name 				=	"alte Münze";

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
	name 				=	"Botschaft von Xardas";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Xardas_Letter_Sealed;

	description			=	name;
	TEXT[0]				=	"Dies ist die Borschaft, die mir Xardas";
	TEXT[1]				=	"für Diego mitgab.";
	TEXT[3]				=	"Sie ist versiegelt!";
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
				Doc_PrintLines	(nDocID,  0, "Die dämonischen Mächte bereiten die Rückkehr des Schläfers vor! Verschanzt in der Bergfeste, mit den Paladinen und dem König, wollen die Feuermagier die Gefahr abzuwenden. Doch sie haben nichts bewirkt. Grenzenloser Hochmut macht sie blind.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Wie du siehst, ist der Zerstörer der Barriere nicht tot. Er war im Tempel verschüttet, ohne Bewusstsein, lange Zeit. Schwach und untrainiert habe ich ihn zu dir geschickt. Ein Schatten seiner selbst. Doch ist er unsere einzige Hoffnung den Schläfer endgültig zu vernichten!");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Schicke ihn mit dieser Nachricht zu den Feuermagiern, sobald er bereit ist. Er wird ihnen helfen, den richtigen Weg zu erkennen!");
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
	name 				=	"Botschaft von Xardas";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Xardas_Letter;

	description			=	name;
	TEXT[0]				=	"Dies ist die Borschaft, die mir Xardas";
	TEXT[1]				=	"für Diego mitgab.";
	TEXT[3]				=	"Das Siegel ist gebrochen!";
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

	description			= "Teleport zum Lager";

	TEXT	[1]			= NAME_Manakosten;
	COUNT	[1]			= SPL_SENDCAST_TELEPORT;
};

// Buch der Diebe: Schlösser
	INSTANCE ItWr_Book_Thief_01 (C_Item)
{
	name 					=	"Diebeskunst";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Über Schlösser und Mechanismen";

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
					Doc_PrintLine	( nDocID,  0, "Schlösser und Mechanismen "			);
					 			 	// -1 -> all pages

					Doc_PrintLine	( nDocID,  0, "Von M. Fingers ");
					Doc_PrintLine	( nDocID,  0, "5 Jahre Meister der Diebesgilde");
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_PrintLines	( nDocID,  0, "Derweil werden verschiedene Mechaniken, ausgeklügelte Systematiken und raffinierte Kombinatorik verwendet, um Schlösser sicher zu machen gegen fremden Eingriff. Eine der immer noch gängigsten Methoden der Kombinatorik ist die Multimechanik. Besonders bekannt bei Türen und Truhen, sorgen sie mit offensichtlich simplem System dafür, das der Zugang nur dem gestattet ist, der auch rechtmäßigen Zugang besitzt. ");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

					Doc_PrintLines	( nDocID,  1, "Während die Öffnung durch ein Links/Rechts System verschlossen ist, dem sich der entsprechende Schüssel automatisch anpasst, so sorgen Gewinde, Fassungen und kleine Rädchen dafür, das ein fremder Gegenstand bei einer Bewegung in die falsche Richtung abbricht. Eine solche Rechts/Links Kombiantion besteht in der Regel aus entweder vier, sechs, acht oder sogar zehn Richtungsbewegungen. Nur ein guter Dieb wird seine Dietriche bewahren. Weniger gute Diebe bleiben jedoch immer auf der Suche nach neuen Dietrichen, weil durch ihre fehlerhafte Arbeit immer wieder Dietriche abbrechen. ");
					Doc_Show		( nDocID );
	};

INSTANCE ItKe_Smith_01(C_Item)
{
	name 				=	"Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	owner				=   MIL_103_Berengar;
	value 				=	0;
	//owner				= ;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= "Schmiedelager";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItWr_RECIPE_01(C_Item)
{
	name 				=	"Rezept";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";


	description			=	name;
	TEXT[1]				=	"Rezept";
	TEXT[2]				=	"zur Herstellung";
	TEXT[3]				=	"heilender und kräftigender";
	TEXT[4]				=	"Essenzen";
};
INSTANCE ItWr_Smith_Art_01(C_Item)
{
	name 				=	"Schmiedekunst";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Book_02_04.3ds";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";


	description			=	name;
	TEXT[1]				=	"Ein Buch über";
	TEXT[2]				=	" die Kunst des Schmiedens ";
	TEXT[3]				=	"von H. Mer";

};

INSTANCE ItMi_Miss_Candel_01 (C_Item)
{
	name 				=	"Kerzenständer";

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
	name 					=	"Geheimnisse der Nacht";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	200;

	visual 					=	"ItWr_Book_02_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Geheimnisse der Nacht";

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
					Doc_PrintLine	( nDocID,  0, "Geheimnisse der Nacht "			);
					 			 	// -1 -> all pages

					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "Der Ring der Gewandtheit");
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_PrintLines	( nDocID,  0, "Die Macht des Ringes wurde gestärkt mit der Kraft des Windes, der Stille der Nacht und der Beweglichkeit des Schattens. Ein Wunderwerk aus feiner Schmiedekunst und  Zauberei . Geschmiedet in den Höhlen von Nordmar, verzaubert in den Hallen der Weisheit, gewährt der Ring seinem Träger eine höhere Geschicklichkeit. ");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)

					Doc_PrintLines	( nDocID,  1, "Getragen wurde es bisher von:");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Nantanuel Gildenmeister von Khorinis");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Tomas 3 Finger");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Ilgur Silberauge");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Michal Meister der Hände");
					Doc_PrintLine	( nDocID,  1, "Raul die Katze");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "M. Fingers Gefangener in der Barriere");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Diego");
					Doc_PrintLine	( nDocID,  1, "Edo Flinkhand");
					Doc_Show		( nDocID );
	};

//---------------------------------------------------------------------
//	Edo's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Edo(C_Item)
{
	name 				=	"Edo's Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	owner				=   MIL_103_Berengar;
	value 				=	0;
	//owner				= ;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[0]				=	"Dieser Schlüssel öffnet die Truhe in";
	TEXT[1]				=	"Edo's Hütte.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Bartok's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Bartok(C_Item)
{
	name 				=	"Bartok's Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
	TEXT[0]				=	"Dieser Schlüssel öffnet die große Truhe";
	TEXT[1]				=	"in der Burgschmiede des Alten Lagers.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAr_ScrollHeal_Copy (C_Item)
{
	name 				=	"Zauber der Heilung";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	50;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;


	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_HEALING_HP_PER_MP;
	on_state[0]			=	UseItAr_ScrollHeal_Copy;
	description			=	"Heilung";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	"Heilung pro Mana";			COUNT	[1]		=	SPL_HEALING_HP_PER_MP;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_HEALING_HP_PER_MP;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
FUNC VOID UseItAr_ScrollHeal_Copy()
{
	PrintScreen	("Der Zauber wirkt nicht!", -1,-1,FONT_OLD_BIG,2);
};

INSTANCE ItAr_ScrollLight_Copy (C_Item)
{
	name 				=	"Zauber des Lichts";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	5;

	visual				=	"ItAr_Scroll_32.3DS";
	material			=	MAT_STONE;


	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_LIGHT;
	on_state[0]			=	UseItAr_ScrollLight_Copy;
	description			=	"Licht";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_LIGHT;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

FUNC VOID UseItAr_ScrollLight_Copy ()
{
	PrintScreen	("Der Zauber wirkt nicht!", -1,-1,FONT_OLD_BIG,2);
};


//---------------------------------------------------------------------
//	Halvor's Rezept
//---------------------------------------------------------------------
INSTANCE ItWr_HalvorRecipe (C_Item)
{
	name 					=	"Halvor's Kochbuch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	Value_RecipeMeat;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	owner					= MIL_100_Halvor;

	scemeName				=	"MAP";
	description				= name;

	TEXT[1]					= "Halvor's Kochbuch mit einer";
	TEXT[2]					= "Reihe schmackhafter Rezepte";
	TEXT[3]					= "aus Fleisch.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
	on_state[0]				= UseItWr_Recipe_Meat;
};

//---------------------------------------------------------------------
//	Halvor's Schlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Halvor(C_Item)
{
	name 				=	"Halvor's Schlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
	TEXT[0]				=	"Dieser Schlüssel öffnet die Zutatentruhe in";
	TEXT[1]				=	"Halvor's Küche.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Kerkerschlüssel
//---------------------------------------------------------------------
INSTANCE ItKe_Jail(C_Item)
{
	name 				=	"Kerkerschlüssel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	value				=	0;

	description			=	name;
	TEXT[0]				=	"Der Schlüssel für die ";
	TEXT[1]				=	"Kerkerzellen ";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

//---------------------------------------------------------------------
//	Müffelsalz
//---------------------------------------------------------------------
const int	Value_StinkingSalt = 50;
//---------------------------------------------------------------------

INSTANCE ItMi_StinkingSalt(C_Item)
{
	name 				=	"Müffelsalz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;
	value 				=	Value_StinkingSalt;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[0]				=	"Ein wirklich übelriechendes";
	TEXT[1]				=	"bräunliches Salz.";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};


//---------------------------------------------------------------------
//	Bessesene Heilen Schriftrolle
//---------------------------------------------------------------------

INSTANCE ItAr_ScrollHealPossessed (C_Item)
{
	name 				=	"alte Rezeptur";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	500;

	visual				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_STONE;

	description			=	"versiegelte Schriftrolle";
	TEXT	[0]			=	"Sie ist versiegelt, aber";
	TEXT	[1]			=	"es scheint die Rezeptur zu";
	TEXT	[2]			=	"sein die Talamon sucht";
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

//---------------------------------------------------------------------
//	Schlafwein THF Mission
//---------------------------------------------------------------------
INSTANCE ItFo_SleepWine(C_Item)
{
	name 				=	"Schlafwein";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseSleepWine;
	scemeName			=	"POTION";

	description			= "Schlafwein";
};

	FUNC VOID UseSleepWine()
	{

	};


//---------------------------------------------------------------------
//	Tagebuchseite von Nefarius
//---------------------------------------------------------------------
INSTANCE ItWr_Nefarius_Diary(C_Item)
{
	name 				=	"Tagebuch-Seite";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Nefarius_Diary;

	description			=	name;
	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
	TEXT[2]				=	"kaum noch entziffern kann.";
	TEXT[3]				=	"Der ehemalige Besitzer scheint Nefarius der";
	TEXT[4]				=	"Wassermagier gewesen zu sein.";
};

FUNC void Use_Nefarius_Diary()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID,  0, "107. Tag");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID,  0, "Milten und unser einstiger Held haben uns heute schmählich verraten! Sie haben hinter unserem Rücken die magische Energie aus dem grossen Erzhaufen in irgendein altes Artefakt gesaugt. All unsere Hoffnungen auf ein Entkommen aus der Barriere sind jetzt endgültig zerstört!");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID,  0, "129. Tag");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID,  0, "Das Unglück ist über uns hereingebrochen! Obwohl die magische Barriere plötzlich verschwand, wurde unser Lager von schwersten Beben fast zerstört. Alle hier haben den Verstand verloren und massakrieren sich gegenseitig. Ich muss weg von hier...");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID,  0, "130. Tag");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID,  0, "Wir werden heute nacht bei Cavelorn in seiner Hütte bleiben, und morgen weiterziehen. Ich hoffe nur, dass keine Orkhorden mehr durch diese Gegend ziehen...");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Notiz von Bullit
//---------------------------------------------------------------------
INSTANCE ItWr_Bullit_Note(C_Item)
{
	name 				=	"Notiz von Bullit";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_Bullit_Note;

	description			=	name;
	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
	TEXT[2]				=	"kaum noch entziffern kann.";
	TEXT[3]				=	"Der ehemalige Besitzer scheint ein Gardist";
	TEXT[4]				=	"Namens Bullit gewesen zu sein.";
};

FUNC void Use_Bullit_Note()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_BIG);
				Doc_PrintLine	(nDocID,  0, "Notiz");
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID,  0, "Gomez ist wahnsinnig geworden! Er will doch tatsächlich,dass wir Gardisten alle Feuermagier hinterrücks umbringen, nur weil Corristo, dieser Narr von Erzmagier, sich offen gegen ihn ausgesprochen hat.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Besser ich schaffe einige Vorräte beiseite. Für schlechte Zeiten. Man kann nie wissen was kommt.");
				Doc_Show		(nDocID);
};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 1
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix1(C_Item)
{
	name 			=	"Die Spur des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix1;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Ein vergilbtes Buch mit brüchigen Seiten.";
	TEXT	[2]		=	"Sein Verfasser scheint ein Feuermagier";
	TEXT	[3]		=	"mit Namen Corristo gewesen zu sein.";
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
					Doc_PrintLine	(nDocID,  0, "Spur des Phoenix"			);
					Doc_PrintLine	(nDocID,  0, "------------------"		);
					Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLines	(nDocID,  0, "Der Sturm zieht auf. Ich weiss es und kann doch nicht dagegen ankämpfen. Ich selbst verhalf einst dem Sturm zu seiner Macht und sonnte mich in seinem Glanz. Doch nun ist der Bund mit dem Sturm zum Pakt mit dem Teufel geworden und meine Seele ist verloren.");
					Doc_PrintLine	(nDocID,  0, "");
					Doc_PrintLines	(nDocID,  0, "Doch das Feuer wird weiterbestehen, muss weiterbestehen. Sein  Wissen wird sich erheben wie ein Phoenix aus der Asche. Derjenige, der gewillt ist, der Spur des Phoenix zu folgen, wird die Wiederauferstehung des Wissens über das Feuer erleben.");

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
					Doc_PrintLines	(nDocID,  1, "Die Spur des Phoenix beginnt in den tiefsten Tiefen seines runden Hortes. Dort, wo der Bund mit dem Sturm begann liegt die Asche des Phoenix begraben.");
					Doc_Show		(nDocID );

		if (Phoenix_State == 0)
		{
			Log_CreateTopic			(CH1_Phoenix,		LOG_MISSION);
			Log_SetTopicStatus		(CH1_Phoenix,		LOG_RUNNING);
			B_LogEntry				(CH1_Phoenix,		"Offensichtlich ahnte der oberste Feuermagier Corristo, dass ihm übles wiederfahren wird, und hat eine rätselhafte 'Spur des Phoenix' gelegt. Am Ende dieser Spur soll das 'Wissen des Feuers' zu finden sein, was immer der ermordete Zauberer auch damit meinte.");
			Wld_InsertItem			(ItWr_Phoenix2,		"FP_SPAWN_PHOENIX_2");

			Phoenix_State = 1;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 2
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix2(C_Item)
{
	name 			=	"Die Asche des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix2;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Dies ist der zweite Teil der";
	TEXT	[2]		=	"rätselhaften Spur des Phoenix";
	TEXT	[3]		=	"die Corristo verfasst hat.";
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
					Doc_PrintLine	( nDocID,  0, "Die Asche des"				);
					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "---------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Einst, als ich den Kindern des Sturmes zur Macht verhalf, fegten sie ihre Unterdrücker hinweg. Doch ihre Grausamkeit stand der, der Unterdrücker in nichts nach.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Sie raubten, mordeten und trieben die Schwachen zu unwürdiger Arbeit.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Was einst felsenfest verbunden war, brach durch die Macht des Sturms entzwei. An dieser Stelle beginnt der Aufstieg der Macht des Feuers, gleich dem Aufstieg des Phoenix. Doch der Phoenix hat an der Stelle des Bruches eine Feder hinterlassen. Die Feder des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 1)
		{
			B_GiveXP			(XP_Phoenix2);
			B_LogEntry			(CH1_Phoenix,		"Ich habe das zweite Buch von der 'Spur des Phoenix' gefunden. Es spricht von einem Bruch, der etwas 'felsenfest Verbundenes durch die Macht des Sturmes entzweite'.");
			Wld_InsertItem		(ItWr_Phoenix3,		"FP_SPAWN_PHOENIX_3");

			Phoenix_State = 2;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 3
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix3(C_Item)
{
	name 			=	"Die Feder des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix3;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der dritte Teil der Spur des";
	TEXT	[2]		=	"Phoenix von Corristo dem";
	TEXT	[3]		=	"obersten Feuermagier.";
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
					Doc_PrintLine	( nDocID,  0, "Die Feder des"				);
					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "---------------"		);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Die Kinder des Sturms wurden zu den neuen Unterdrückern und die Macht des Feuers stärkte sie. Nichts war vor der Gier des Sturms sicher.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Schon bald versammelten sich die Unzufriedenen und verliessen den Hort. Sie wurden von der Weisheit des Wassers hinfortgetragen und von seiner Macht beschützt.");



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
					Doc_PrintLines	( nDocID,  1, "Dort, wo die Macht des Wassers den Hort verlässt, findest du die Wellen des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 2)
		{
			B_GiveXP			(XP_Phoenix3);
			B_LogEntry			(CH1_Phoenix,		"Das dritte Buch von der 'Spur des Phoenix' ist nicht minder rätselhaft. Ich soll nach einer Stelle suchen, an der 'die Macht des Wassers den Hort verlässt'.");
			Wld_InsertItem		(ItWr_Phoenix4,		"FP_SPAWN_PHOENIX_4");

			Phoenix_State = 3;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 4
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix4(C_Item)
{
	name 			=	"Die Wellen des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix4;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der vierte Teil der Spur des";
	TEXT	[2]		=	"Phoenix von Corristo dem";
	TEXT	[3]		=	"obersten Feuermagier.";
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
					Doc_PrintLine	( nDocID,  0, "Die Wellen des"				);
					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "----------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "So errichteten Die Kinder des Sturmes um sich herum hohe Dämme um sich vor den Wogen des Wassers zu schützen. Sie hielten Ausschau nach ihren einstigen Leidensgenossen und trieben die Verbliebenen erbarmungslos zu harter Arbeit.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Der anfänglich so reine Sturm der Gerechtigkeit wandelte sein Gesicht und wurde schlimmer als das, was er einst ersetzte.");



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
					Doc_PrintLines	( nDocID,  1, "Beschreite den Damm und halte nach den Wogen des Wassers Ausschau. Dann wirst du vielleicht auch die Sehnsucht des Phoenix erblicken können.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 3)
		{
			B_GiveXP			(XP_Phoenix4);
			B_LogEntry			(CH1_Phoenix,		"Das vierte Buch von der 'Spur des Phoenix' wird immer rätselhafter. Es spricht davon, dass man auf einem Damm Ausschau halten soll, um die 'Sehnsucht des Phoenix' erblicken zu können.");
			Wld_InsertItem		(ItWr_Phoenix5,		"FP_SPAWN_PHOENIX_5");

			Phoenix_State = 4;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 5
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix5(C_Item)
{
	name 			=	"Die Sehnsucht des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix5;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der fünfte Teil der Spur des";
	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
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
					Doc_PrintLine	( nDocID,  0, "Die Sehnsucht"				);
					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "---------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Zuerst versteckten sich die Kinder des Wassers, die aus dem Hort flohen. Sie suchten Zuflucht in versteckten Höhlen, doch schon bald fanden sie einen eigenen Hort, der sie vor dem Zorn des Sturms schützte. ");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Nicht alle Höhlen kann man trockenen Fusses betreten. Doch genau diese Höhlen sind oft die besten Verstecke. Der feurige Phoenix hasst solche Höhlen, hat er doch Angst vor dem fliessenden Element. Solche Höhlen sind der Alptraum des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 4)
		{
			B_GiveXP			(XP_Phoenix5);
			B_LogEntry			(CH1_Phoenix,		"Das fünfte Buch von der 'Spur des Phoenix' erzählt davon, dass Höhlen, die man nicht trockenen Fusses erreichen kann, der Alptraum eines jeden Phoenix sind.");
			Wld_InsertItem		(ItWr_Phoenix6,		"FP_SPAWN_PHOENIX_6");

			Phoenix_State = 5;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 6
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix6(C_Item)
{
	name 			=	"Der Alptraum des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix6;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der sechste Teil der Spur des";
	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
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
					Doc_PrintLine	( nDocID,  0, "Der Alptraum"				);
					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "--------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Schon bald riss der Schnabel des Sturmes aufs neue Fleisch aus seiner eigenen Seite und dieses Fleisch wurde zu den Kindern des Geistes. Sie versteckten sich in felsigen Höhlen, bevor sie ein eigenen Hort inmitten von Schlamm und Ungeziefer gründeten.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Dies war die Geburts- stunde unseres eigenen Untergangs, denn die Macht des Geistes erschütterte das Gefüge der Welt.");



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
					Doc_PrintLines	( nDocID,  1, "Der Phoenix zieht seine Jungen in einem Felsennest in luftiger Höhe auf. Dort wo kein Weg hinführt, brennt das feurige Nest des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 5)
		{
			B_GiveXP				(XP_Phoenix6);
			B_LogEntry				(CH1_Phoenix,		"Das sechste Buch von der 'Spur des Phoenix' spricht von einem 'brennenden Felsennest in luftiger Höhe', dem Nest des Phoenix.");

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
	name 			=	"Das Nest des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix7;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der siebente Teil der Spur des";
	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
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
					Doc_PrintLine	( nDocID,  0, "Das Nest"					);
					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "So zogen die Jahre ins Land und der Zorn des Sturmes wetteiferte mit den Wogen des Wassers und den Kindern des Geistes. Das Feuer, dass einst den Sturm so eifrig ernährte, wurde immer schwächer und heute lodert es nur noch unbedeutend.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Vorkehrungen müssen getroffen werden, um das Wissen des Feuers zu bewahren.");



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
					Doc_PrintLines	( nDocID,  1, "Neigen sich die Tage eines Phoenix seinem Ende, so lässt er sich am höchsten Ort seines Hortes nieder und erwartet das Unausweichliche. Er erwartet dort den Tod des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 6)
		{
			B_GiveXP			(XP_Phoenix7);
			B_LogEntry			(CH1_Phoenix,		"Das siebente Buch beschreibt den Tod des Phoenix am höchsten Ort seines Hortes.");

			Wld_InsertItem		(ItWr_Phoenix8,		"FP_SPAWN_PHOENIX_8");

			Phoenix_State = 7;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Teil 8
//---------------------------------------------------------------------
INSTANCE ItWr_Phoenix8(C_Item)
{
	name 			=	"Der Tod des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_Phoenix8;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der achte Teil der Spur des";
	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
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
					Doc_PrintLine	( nDocID,  0, "Der Tod des"					);
					Doc_PrintLine	( nDocID,  0, "Phoenix"						);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Das Gefüge der Welt bebte. Erst langsam und schwach, dann immer öfter und immer heftiger. Das Ende ist nah, dessen bin ich mir sicher. Weder Sturm noch Wasser noch Geist erkennen es. Doch das Feuer weiss um die Wahrheit.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Es muss weiterbestehen. Es war immer so. Es wird immer so sein.");



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
					Doc_PrintLines	( nDocID,  1, "Das Leben des Phoenix ist ein immerwährender Kreislauf. Er kehrt stets dorthin zurück, wo er einst begonnen hat, um sich aus der Asche wieder zu neuem Leben zu erheben. Dies ist die Auferstehung des Phoenix.");
					Doc_Show		( nDocID );

		if (Phoenix_State == 7)
		{
			B_GiveXP			(XP_Phoenix8);
			B_LogEntry			(CH1_Phoenix,		"Das achte Buch klingt wie der Abschluss der 'Spur des Phoenix'. Nur ist dieser Hinweis der rätselhafteste von allen.");

			Phoenix_State = 8;
		};
	};

//---------------------------------------------------------------------
//	Spur des Phoenix - Cheatbuch
//---------------------------------------------------------------------
INSTANCE ItWr_PhoenixCheat(C_Item)
{
	name 			=	"Der Cheat des Phoenix";

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	ITEM_MISSION;

	value 			=	0;

	visual 			=	"ItWr_Book_02_03.3ds";
	material 		=	MAT_LEATHER;

	on_state[0]		=	Use_PhoenixCheat;
	scemeName		=	"MAP";

	description		=	name;
	TEXT	[1]		=	"Der achte Teil der Spur des";
	TEXT	[2]		=	"Phoenix verfasst von Corristo.";
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
					Doc_PrintLine	( nDocID,  0, "Der Cheat"					);
					Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
					Doc_PrintLine	( nDocID,  0, "-------------"				);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Wer keine Lust hat, nach allen 8 Phoenix-Büchern zu suchen, der muss es auch nicht.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Dieses Buch schaltet die Geheime Kammer auch sofort frei.");



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

	description		= "ELIXIER DES GEISTES";
	TEXT[0]			= "Dies ist das Elixier, das Xardas benötigt";
	TEXT[1]			= "Ich weiss nicht wie es genau wirkt, aber";
	TEXT[2]			= "ich sollte es auf KEINEN Fall trinken";
	TEXT[3]			= "bevor ich mit Xardas gesprochen habe!";
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
	name 			=	"Klarer Trank";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI|ITEM_MISSION;

	visual 			=	"ItFo_Potion_Water_01.3ds";
	material 		=	MAT_GLAS;

	description		=	name;
	TEXT[0]			=	"Diese flüssige Substanz ist so rein und klar";
	TEXT[1]			=	"dass man ihr alle möglichen Fähigkeiten";
	TEXT[2]			=	"zutrauen könnte.";
};

//---------------------------------------------------------------------
//	Brief über Steinwurzel
//---------------------------------------------------------------------
INSTANCE ItWr_BloodThistle(C_Item)
{
	name 				=	"Abschrift";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_BloodThistle;

	description			=	name;
	TEXT[1]				=	"Eine stark verwitterte Seite, deren Schrift man";
	TEXT[2]				=	"noch erstaunlich gut entziffern kann.";


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
				Doc_PrintLines	(nDocID,  0, "Das Kraut, das den Namen Blutdistel trägt, sucht sich zum Wachsen meist die großen Wasserpflanzen.");
				Doc_PrintLines	(nDocID,  0, "In ihrem Schutz gedeihen sie reichlich an feuchten Ufern und sandigen Inseln, an Seen und Flüßen.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "Abschrift aus HEILKRAFT DER NATUR");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "von Bota Niker");
				Doc_Show		(nDocID);

	B_LearnBloodThistle ();
};

//---------------------------------------------------------------------
//	Brief von Osric an Helvegor
//---------------------------------------------------------------------
INSTANCE ItWr_Helvegor(C_Item)
{
	name 				=	"Brief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Helvegor;

	description			=	name;
	TEXT[1]				=	"ein Brief von Osric an Helvegor ";



};

FUNC void Use_ItWr_Helvegor()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLine	(nDocID,  0, "HelvegoR, ");
				Doc_PrintLines	(nDocID,  0, "hier im lager wimmelt es nur so von dieben und gesindeL. du bist der einzige, dem ich noch vertraue.");
				Doc_PrintLines	(nDocID,  0, "falls mir etwas zustossen solLte, ich habe ein paar nützliche dinge in sichere verwahRung gebracht. erinnerst du dich noch an die zeit, als wir hier ankamen?");
				Doc_PrintLines	(nDocID,  0, "bevor wir für agon gearbeitet haben? Das gerüst ist Leer und verlassen, die aRbeiten sind eingestellt.");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "Die Kombination steckt mittendrin. ");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "osric");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_Show		(nDocID);


};

//---------------------------------------------------------------------
//	Über die Götter
//---------------------------------------------------------------------
INSTANCE ItWr_Gods(C_Item)
{
	name 				=	"Über die Götter";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Gods;

	description			=	name;
	TEXT[1]				=	"Sieht aus, wie eine Abschrift aus einem Buch";



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
				Doc_PrintLines	(nDocID,  0, "Innos der Gott des Feuers und der Gesetzes");
				Doc_PrintLines	(nDocID,  0, "Wahrer der Ordnung ");
				Doc_PrintLines	(nDocID,  0, "");
				Doc_PrintLines	(nDocID,  0, "Adanos Gott des Wassers und der Gerechtigkeit");
				Doc_PrintLine	(nDocID,  0, "Waagschale der Menschheit ");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "Beliar Gott des Todes und der Dunkelheit");
				Doc_PrintLine	(nDocID,  0, "Herrscher der Nacht ");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "Zusammen bilden sie die göttliche Dreifaltigkeit ");
				Doc_PrintLine	(nDocID,  0, "Den Ursprung der Welt, ihren Weg und ihr Ende");
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
	name 				=	"Seite";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Palgur;

	description			=	name;
	TEXT[1]				=	"Ein einzelner Tagebuch Eintrag";





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
				Doc_PrintLines	(nDocID,  0, "Isgar hat seine Tränke herumstehen lassen. Wie unvorsichtig von ihm. Und wie gut, das es Diebe gibt, denen man es anhängen kann.");
				Doc_PrintLines	(nDocID,  0, "Die Tränke habe ich dort versteckt, wo viele hergehen, aber niemand bleibt.");
				Doc_PrintLines	(nDocID,  0, "Nur als reine Vorsichtsmassnahme. Wer weiß denn schon, was uns noch alles bevorsteht.");
				Doc_PrintLines	(nDocID,  0, "Talamon ist viel zu sehr mit seinen Forschungen beschäftigt, und Isgar ist nur darauf aus Silber zu kassieren, ");
				Doc_PrintLines	(nDocID,  0, " als das sie an Massnahmen für den Fall eines Angriffes denken.");

				Doc_Show		(nDocID);



};

//---------------------------------------------------------------------
//	Brief eines Unbekannten
//---------------------------------------------------------------------
INSTANCE ItWr_Worker(C_Item)
{
	name 				=	"Brief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Worker;

	description			=	name;
	TEXT[1]				=	"Ein Teil eines Briefes";
	TEXT[2]				=	"ohne erkennbaren Anfang oder Ende";


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
				Doc_PrintLines	(nDocID,  0, "Es ist furchtbar. Die Orks ziehen durchs Land und plündern die Dörfer. Auf dem Weg ins Tal von Khorinis haben wir einen Zug anderer Flüchtender gesehen. ");
				Doc_PrintLines	(nDocID,  0, "Sie sind den Orks in die Hände gefallen. Bei Innos, die Orks haben schreckliche Dinge mit ihnen getan. ");
				Doc_PrintLines	(nDocID,  0, "Innos sei Dank, zumindest haben wir es ins Lager geschafft. Der König ist ebenfalls hier im Tal. Das gibt vielen hier Mut und Kraft. ");
				Doc_PrintLines	(nDocID,  0, "Aber es gibt noch viel zu tun. Wir müssen den Wall wieder aufbauen, um uns vor den Orks zu schützen.");
				Doc_PrintLines	(nDocID,  0, "");

				Doc_Show		(nDocID);
};