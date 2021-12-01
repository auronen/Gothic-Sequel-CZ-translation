// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochöffel, Laborflasche, Roheisen (Schmiede)
const int	Value_MobsiItem			=	3;

const int	Value_Silver			=	1;


const int	Value_Pliers			=	50;

const int	Value_Dietrich			=	10;
const int	Value_Schlüssel			=	3;

const int	Value_Joint1			=	8;
const int	Value_Joint2			=	15;
const int	Value_Joint3			=	20;
const int	Value_Laute				=	10;

const int	Value_Fackel			=	2;

const int	Value_Sumpfkraut		=	8;





//////////////////////////////////////////////////////////////////////////////////
//	Silbermünze
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Silver (C_Item)
{
	name 				=	NAME_Silver;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Silver;

	visual 				=	"ItMi_Stuff_OldCoin_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Schmiedezange
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_Pliers (C_Item)
{
	name 				=	NAME_Pliers;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pliers;

	visual 				=	"ItMi_Zange.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



















/*******************************************************************************************
**	Items für Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/

/******************************************************************************************/
//	Dietrich
INSTANCE ItKe_Lockpick (C_Item)
{
	name 				=	NAME_Lockpick;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dietrich;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};

/******************************************************************************************/
//	Schlüssel

// FIXME: aussagekräftigere Schlüsselnamen?
INSTANCE ItKe_Key1(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
INSTANCE ItKe_Key2(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
INSTANCE ItKe_Key3(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
INSTANCE ItKe_Key4(C_Item)
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/





/******************************************************************************************/
// Krautstampfen
INSTANCE ItMi_Stomper (C_Item)
{
	name 				=	NAME_Stomper;

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Stomper_01.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Reparieren
INSTANCE ItMi_Hammer (C_Item)
{
	name 				=	NAME_Hammer;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Hammer_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// im Topf rühren
INSTANCE ItMi_Scoop (C_Item)
{
	name 				=	NAME_Scoop;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Scoop_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};

/******************************************************************************************/
// Labor benutzen
// Fixme: wird dabei ein anderes Item generiert?
INSTANCE ItMi_Flask(C_Item)
{
	name 				=	NAME_LabFlask;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItFo_Potion_Mana_02.3ds";
	material 			=	MAT_GLAS;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};




/*******************************************************************************************
**	Items für Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

// für Feuerspucker
INSTANCE ItLs_TorchFirespit(C_Item)
{
	name 				=	NAME_TorchFirespit;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	Value_MobsiItem;

	visual 				=	"ItLsTorchBURNING.ZEN";
	material 			=	MAT_WOOD;

	scemeName			=	"FIRESPIT";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMi_Lute (C_Item)
{
	name 				=	NAME_Lute;

	mainflag 			=	ITEM_KAT_NONE;

	value 				=	Value_Laute;

	visual 				=	"ItMi_Lute_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= UseLute;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseLute()
{

};


/******************************************************************************************/
// Für Babe-Luftzufächeln
INSTANCE ItMi_Wedel(C_Item)
{
	name 				=	NAME_Whisk;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Wedel_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"COOLAIR";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
// Für Babe-Putzen
INSTANCE ItMi_Brush(C_Item)
{
	name 				=	NAME_Brush;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual				=	"ItMi_Brush_01.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"BRUSH";

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


/******************************************************************************************/
INSTANCE ItMiJoint_1(C_Item)
{
	name 				=	NAME_Joint1;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint1;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_1;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_1()
{


};
/******************************************************************************************/

INSTANCE ItMiJoint_2(C_Item)
{
	name 				=	NAME_Joint2;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint2;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_2;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_2()
{

};

/******************************************************************************************/

INSTANCE ItMiJoint_3(C_Item)
{
	name 				=	NAME_Joint3;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint3;

	visual 				=	"ItMi_Joint_01.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= UseItMiJoint_3;
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
func void UseItMiJoint_3()
{

};



/******************************************************************************************/
//	Fackel			                					  **

INSTANCE ItLsTorch(C_Item)
{
	name 				=	NAME_Torch;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	Value_Fackel;

	visual 				=	"ItLs_Torch_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "Bringt Licht in die dunkelsten Ecken!";
	TEXT[0]				= "Prosvítí i ta nejtemnější zákoutí!";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;

};

/******************************************************************************************/
INSTANCE ItLsTorchburning(C_Item)
{
	name 				=	NAME_BurningTorch;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH;

	value 				=	0;

	visual 				=	"ItLsTorchBURNING.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/******************************************************************************************/
INSTANCE ItLsTorchburned(C_Item)
{
	name 				=	NAME_TorchBurned;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_BURN|ITEM_TORCH|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItLs_Torchburned_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};




/******************************************************************************************/
//STUFF//
/******************************************************************************************/



//---------------------------------------------------------------------
//	Fakescroll (Bergfestung)
//---------------------------------------------------------------------
INSTANCE Fakescroll(C_Item)
{
	name 					=	NAME_FakeScroll;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;
	value 					=	0;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAPSEALED";

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};


INSTANCE ItMi_Alarmhorn (C_Item)
{
	name 				=	NAME_AlarmHorn;

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MISSION;

	value 				=	9;

	visual 				=	"ItMi_Alarmhorn_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"HORN";

	description			= name;
	//TEXT[0]			= "";
	////COUNT[0]		= ;
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	//TEXT[2]			= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

INSTANCE ItWr_Worldmap(C_Item)
{
	name 					=	NAME_WorldMap;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	on_state[0]				=	UseWorldmap;

	description				= name;
//	TEXT[0]					= "Leider fehlt darauf ein großes Gebiet";
//	TEXT[1]					= "im Südwesten.";
	TEXT[0]					= "Bohužel, velká oblast na jihozápadě";
	TEXT[1]					= "je prázdná.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseWorldmap()
	{
		var int nDocID;

		nDocID = 	Doc_CreateMap	()			  ;							// DocManager
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );
					Doc_SetPage 	( nDocID, 0, "Map_World.tga", 	1	);  //  1 -> DO NOT SCALE

/*  				Doc_SetFont 	( nDocID, 0, FONT_BOOK_BIG		); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);

// FIXME: mehrere Texte an verschiedenen Stellen für Location-Beschriftung funzen nicht.
 					Doc_SetFont 	( nDocID, 0, FONT_BOOK_SMALL			);
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Dämonenbeschwörer");

					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");
*/

					Doc_Show		( nDocID 	);
	};


/******************************************************************************************/
INSTANCE ItMi_Saw (C_Item)
{
//	name 				=	"Säge";
	name 				=	"Pila";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Saege.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE FakeBook(C_Item)
{
//	name 					=	"FakeBook";
	name 					=	"Falešná kniha";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	hp 						=	5;
	hp_max 					=	5;
	weight 					=	1;
	value 					=	0;

	visual 					=	"ItWr_Book_02_03.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"Buch";

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};
INSTANCE ItKe_Pos(C_Item)// Schlüssel für Truhe im Krankenviertel
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};
INSTANCE ItKe_Nabor(C_Item)// Schlüssel für Truhe von Nabor
{
	name 				=	NAME_Key;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};