//#################################################################################################
//##
//##	Heilwirkung und Kosten von Kochprodukten
//##
//#################################################################################################

// Endprodukte Suppen
const int	Value_MeatbugSoup		= 10;	const int	HP_MeatbugSoup		= 60;
const int	Value_MoleratSoup		= 10;	const int	HP_MoleratSoup		= 60;
const int	Value_HerbSoup			= 12;	const int 	HP_HerbSoup			= 70;
const int	Value_MushroomSoup		= 12;	const int 	HP_MushroomSoup		= 70;
const int	Value_MeatSoup			= 15;	const int	HP_MeatSoup			= 80;

// Endprodukte Eintöpfe
const int	Value_MeatbugStew		= 20;	const int	HP_MeatbugStew		= 120;
const int	Value_MoleratStew		= 20;	const int	HP_MoleratStew		= 120;
const int	Value_HerbStew			= 22;	const int 	HP_HerbStew			= 140;
const int	Value_MushroomStew		= 22;	const int 	HP_MushroomStew		= 140;
const int	Value_MeatStew			= 25;	const int	HP_MeatStew			= 160;

// Endprodukte Ragout
const int	Value_MeatbugPie		= 40;	const int	HP_MeatbugPie		= 240;
const int	Value_MoleratPie		= 40;	const int	HP_MoleratPie		= 240;
const int	Value_HerbPie			= 45;	const int 	HP_HerbPie			= 280;
const int	Value_MushroomPie		= 45;	const int 	HP_MushroomPie		= 280;
const int	Value_MeatPie			= 50;	const int	HP_MeatPie			= 320;

// Kochrezepte
const int 	Value_RecipeMeatbug		= 250;
const int	VAlue_RecipeMolerat		= 250;
const int 	Value_RecipeHerb		= 350;
const int 	Value_RecipeMushroom	= 350;
const int 	Value_RecipeMeat		= 500;






//#################################################################################################
//##
//##	Kochprodukte
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugSoup (C_Item)
{
	name 				=	NAME_MeatbugSoup;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatbugSoup;

	visual 				=	"ItFo_MeatbugSoup.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatbugSoup;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatbugSoup;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatbugSoup;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatbugSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatbugSoup);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratSoup (C_Item)
{
	name 				=	NAME_MoleratSoup;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MoleratSoup;

	visual 				=	"ItFo_MoleratSoup.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MoleratSoup;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MoleratSoup;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MoleratSoup;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MoleratSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MoleratSoup);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbSoup (C_Item)
{
	name 				=	NAME_HerbSoup;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HerbSoup;

	visual 				=	"ItFo_HerbSoup.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_HerbSoup;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_HerbSoup;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_HerbSoup;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_HerbSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_HerbSoup);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomSoup (C_Item)
{
	name 				=	NAME_MushroomSoup;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MushroomSoup;

	visual 				=	"ItFo_MushroomSoup.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MushroomSoup;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MushroomSoup;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MushroomSoup;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MushroomSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MushroomSoup);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Suppe
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatSoup (C_Item)
{
	name 				=	NAME_MeatSoup;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatSoup;

	visual 				=	"ItFo_MeatSoup.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatSoup;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatSoup;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatSoup;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatSoup()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatSoup);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugStew (C_Item)
{
	name 				=	NAME_MeatbugStew;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatbugStew;

	visual 				=	"ItFo_MeatbugStew.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatbugStew;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatbugStew;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatbugStew;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatbugStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatbugStew);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratStew (C_Item)
{
	name 				=	NAME_MoleratStew;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MoleratStew;

	visual 				=	"ItFo_MoleratStew.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MoleratStew;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MoleratStew;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MoleratStew;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MoleratStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MoleratStew);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbStew (C_Item)
{
	name 				=	NAME_HerbStew;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HerbStew;

	visual 				=	"ItFo_HerbStew.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_HerbStew;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_HerbStew;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_HerbStew;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_HerbStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_HerbStew);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomStew (C_Item)
{
	name 				=	NAME_MushroomStew;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MushroomStew;

	visual 				=	"ItFo_MushroomStew.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MushroomStew;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MushroomStew;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MushroomStew;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MushroomStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MushroomStew);
	};
//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Eintopf
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatStew (C_Item)
{
	name 				=	NAME_MeatStew;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatStew;

	visual 				=	"ItFo_MeatStew.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatStew;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatStew;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatStew;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatStew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatStew);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatbugPie (C_Item)
{
	name 				=	NAME_MeatbugPie;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatbugPie;

	visual 				=	"ItFo_MeatbugPie.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatbugPie;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatbugPie;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatbugPie;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatbugPie()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatbugPie);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MoleratPie (C_Item)
{
	name 				=	NAME_MoleratPie;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MoleratPie;

	visual 				=	"ItFo_MoleratPie.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MoleratPie;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MoleratPie;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MoleratPie;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MoleratPie()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MoleratPie);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Kräuter-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_HerbPie (C_Item)
{
	name 				=	NAME_HerbPie;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HerbPie;

	visual 				=	"ItFo_HerbPie.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_HerbPie;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_HerbPie;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_HerbPie;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_HerbPie()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_HerbPie);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MushroomPie (C_Item)
{
	name 				=	NAME_MushroomPie;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MushroomPie;

	visual 				=	"ItFo_MushroomPie.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MushroomPie;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MushroomPie;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MushroomPie;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MushroomPie()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MushroomPie);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Ragout
//////////////////////////////////////////////////////////////////////////////////
instance ItFo_MeatPie (C_Item)
{
	name 				=	NAME_MeatPie;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MeatPie;

	visual 				=	"ItFo_MeatPie.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	Use_MeatPie;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MeatPie;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MeatPie;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID Use_MeatPie()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MeatPie);
	};





//#################################################################################################
//##
//##	Koch-Bücher
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Meatbug-Rezepte
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Recipe_Meatbug (C_Item)
{
	name 					=	NAME_RecipeMeatbug;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	Value_RecipeMeatbug;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;

	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	UseItWr_Recipe_Meatbug;
};

	FUNC VOID UseItWr_Recipe_Meatbug()
	{
		B_LearnRecipeMeatbug	();
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   			);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Kochen mit"						);
					Doc_PrintLine	( nDocID,  0, "Recepty ze žravých"						);
//					Doc_PrintLine	( nDocID,  0, "Fleischwanzen"					);
					Doc_PrintLine	( nDocID,  0, "štěnic"					);
					Doc_PrintLine	( nDocID,  0, "---------------"					);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Obwohl diese kleinen Mehrfüssler im allgemeinen sofort Ekel bis hin zum Erbrechen verursachen, so sollte man sich doch nicht von ihrer äusseren Erscheinung täuschen lassen.");
					Doc_PrintLines	( nDocID,  0, "Přestože tyhle malé potvůrky vyvolávají v lidech znechucení nebo dokonce zvracení, neměli bychom se nechat zmást jejich vzhledem.");
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Der meisterhafte Koch, kann aus dem Fleisch dieser Schalentiere ganze Kunststücke zaubern.");
					Doc_PrintLines	( nDocID,  0, "Mistr kuchař dokáže z masa těchto korýšů vykouzlit chutné delikatesy.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                  Snaf");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");

					Doc_PrintLine	( nDocID,  1, NAME_MeatbugSoup);
					Doc_PrintLine	( nDocID,  1, "----------------");
//					Doc_PrintLines	( nDocID,  1, "Man nehme etwas Salz, den Körper einer gut geschälten Fleischwanze, sowie ein Stück Brot, um das ganze anzudicken.");
					Doc_PrintLines	( nDocID,  1, "Vezmeme trošku soli, tělo dobře očištěné žravé štěnice a kousek chleba na zahuštění.");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_MeatbugStew);
					Doc_PrintLine	( nDocID,  1, "------------------");
//					Doc_PrintLines	( nDocID,  1, "Anstelle des Brotes verschafft ein ordentliches Stück Käse dem ganzen Eintopf so richtig Geschmack.");
					Doc_PrintLines	( nDocID,  1, "Místo chleba přidá kus pořádného sýra guláši tu pravou chuť.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MeatbugPie);
					Doc_PrintLine	( nDocID,  1, "-----------------");
//					Doc_PrintLines	( nDocID,  1, "Der gegarte Wanzenkörper wird mit einem Stück Schinken und einer Prise Salz zu einem leckeren Ragout.");
					Doc_PrintLines	( nDocID,  1, "Vařeného maso žravé štěnice se s kouskem šunky a špetkou soli promění v delikátní ragú.");
					Doc_Show		( nDocID );
	};

//////////////////////////////////////////////////////////////////////////////////
//	Molerat-Rezepte
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Recipe_Molerat (C_Item)
{
	name 					=	NAME_RecipeMolerat;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	Value_RecipeMolerat;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;

	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	UseItWr_Recipe_Molerat;
};

	FUNC VOID UseItWr_Recipe_Molerat()
	{
		B_LearnRecipeMolerat	();
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Kochen mit"			);
					Doc_PrintLine	( nDocID,  0, "Vaříme s "			);
//					Doc_PrintLine	( nDocID,  0, "Moleratfett"			);
					Doc_PrintLine	( nDocID,  0, "krysokrtím tukem"			);
					Doc_PrintLine	( nDocID,  0, "-------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Man sollte es wirklich nicht meinen, aber Molerats bestehen fast ausschliesslich aus purem Fett, dass sich zu sehr nahrhaften Mahlzeiten verkochen lässt.");
					Doc_PrintLines	( nDocID,  0, "Není to moc známé, ale krysokrt je velice tučné zvíře. Jeho tuk je možné využít při přípravě výborných jídel.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MoleratSoup);
					Doc_PrintLine	( nDocID,  1, "----------------");
//					Doc_PrintLines	( nDocID,  1, "Obwohl man es nicht unbedingt vermutet, kann Moleratfett, zusammen mit einem Leib Brot und einer Prise Salz eine nahrhafte Mahlzeit ergeben.");
					Doc_PrintLines	( nDocID,  1, "I když si to možná nemyslíte, chléb, krysokrtí tuk a špetka soli se dá využít k přípravě výborného pokrmu.");
					Doc_PrintLine	( nDocID,  1, "" );
					Doc_PrintLine	( nDocID,  1, NAME_MoleratStew);
					Doc_PrintLine	( nDocID,  1, "------------------");
//					Doc_PrintLines	( nDocID,  1, "Verwendet man anstelle des Brotes ein Stück Käse, so erhält man dieses leckere Gericht.");
					Doc_PrintLines	( nDocID,  1, "Vyměňte chléb za kousek sýra, tak získáte ještě chutnější pokrm.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MoleratPie);
					Doc_PrintLine	( nDocID,  1, "-----------------");
//					Doc_PrintLines	( nDocID,  1, "Nur wer das Moleratfett mit Schinken und etwas Salz verkocht, gelangt an diese äusserst schmackhafte Mahlzeit.");
					Doc_PrintLines	( nDocID,  1, "Pouze ten, pokud se vaří krysokrtí tuk s šunkou a solí, dostane tento vynikající pokrm.");
					Doc_Show		( nDocID );
};

//////////////////////////////////////////////////////////////////////////////////
//	Kraut-Rezepte
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Recipe_Herb (C_Item)
{
	name 					=	NAME_RecipeHerb;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	Value_RecipeHerb;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;

	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	UseItWr_Recipe_Herb;
};

	FUNC VOID UseItWr_Recipe_Herb()
	{
		B_LearnRecipeHerb	();
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Kochen mit"			);
					Doc_PrintLine	( nDocID,  0, "Bylinkové"			);
//					Doc_PrintLine	( nDocID,  0, "Kräutern"			);
					Doc_PrintLine	( nDocID,  0, "recepty"			);
					Doc_PrintLine	( nDocID,  0, "---------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Frische Kräuter aus dem Sumpf eigenen sich nicht nur zum Rauchen. Mit etwas Kochkunst kann man daraus eine ganze Reihe leckerer Gerichte zubereiten. ");
					Doc_PrintLines	( nDocID,  0, "Čerstvé bylinky z bažin jsou vhodné nejen na kouření. S trochou kulinářského umění je z nich možné připravit celou řadu lahodných pokrmů.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_HerbSoup);
					Doc_PrintLine	( nDocID,  1, "--------------");
//					Doc_PrintLines	( nDocID,  1, "Sumpfkraut mit Brot und Salz kann zu einer nahrhaften Suppe zubereitet werden.");
					Doc_PrintLines	( nDocID,  1, "Z trávy z bažin, chleba a soli je možné připravit výživnou polévku.");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_HerbStew);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Anstelle des Brotes kann auch ein Stück Käse hinzugefügt werden, und so entsteht ein leckerer Eintopf.");
					Doc_PrintLines	( nDocID,  1, "Nahraď chléb kouskem sýra, tím připravíš výborný guláš.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_HerbPie);
					Doc_PrintLine	( nDocID,  1, "--------------");
//					Doc_PrintLines	( nDocID,  1, "Nichts geht über ein Stück Schinken, das auch dem Sumpfkraut den edelsten Geschmack verleiht. Das Salzen nicht vergessen!");
					Doc_PrintLines	( nDocID,  1, "Nic nepředčí kousek šunky naložený v trávě z bažin. Nezpomeňte přidat sůl!");
					Doc_Show		( nDocID );
	};

//////////////////////////////////////////////////////////////////////////////////
//	Pilz-Rezepte
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Recipe_Mushroom (C_Item)
{
	name 					=	NAME_RecipeMushroom;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	Value_RecipeMushroom;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;

	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	UseItWr_Recipe_Mushroom;
};

	FUNC VOID UseItWr_Recipe_Mushroom()
	{
		B_LearnRecipeMushroom	();
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Kochen mit Pilzen"			);
					Doc_PrintLine	( nDocID,  0, "Houbové recepty"			);
					Doc_PrintLine	( nDocID,  0, "-----------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Pilze gehören zu den meist unterschätzten Pflanzen. Sie eigenen sich hervorragen dazu einige sehr exquisite Gerichte daraus zuzubereiten.");
					Doc_PrintLines	( nDocID,  0, "Houby patří k nejméně používaným ingrediencím. Ale je možné je použít v některých výjimečných receptech.");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MushroomSoup);
					Doc_PrintLine	( nDocID,  1, "------------");
//					Doc_PrintLines	( nDocID,  1, "Ein Höhlenpilz, gut gesäubert und mit Brot und Salz gekocht.");
					Doc_PrintLines	( nDocID,  1, "Pekelná houba, dobře očištěná, vařená s chlebem a solí.");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_MushroomStew);
					Doc_PrintLine	( nDocID,  1, "--------------");
//					Doc_PrintLines	( nDocID,  1, "Mit einem Stück Käse und einer Prise Salz schmecken Pilze bedeutend besser.");
					Doc_PrintLines	( nDocID,  1, "S kouskem sýra a špetkou soli chutnají houby mnohem lépe.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MushroomPie);
					Doc_PrintLine	( nDocID,  1, "-------------");
//					Doc_PrintLines	( nDocID,  1, "Die Krönung der Pilzgerichte wird mit einem Stück Schinken zubereitet. So entsteht mit Pilzen und einer Prise Salz ein schmackhaftes Ragout.");
					Doc_PrintLines	( nDocID,  1, "Vrchol všech pokrmů s houbami připravíme s kouskem šunky. S houbami a špetkou soli vznikne tak chutné houbové ragú.");
					Doc_Show		( nDocID );
	};


//////////////////////////////////////////////////////////////////////////////////
//	Fleisch-Rezepte
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Recipe_Meat (C_Item)
{
	name 					=	NAME_RecipeMeat;

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	Value_RecipeMeat;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				=	name;

	TEXT[5]					=	NAME_Value;
	COUNT[5]				=	value;
	on_state[0]				=	UseItWr_Recipe_Meat;
};

	FUNC VOID UseItWr_Recipe_Meat()
	{
		B_LearnRecipeMeat	();
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Kochen mit Fleisch"			);
					Doc_PrintLine	( nDocID,  0, "Recepty s masem"			);
					Doc_PrintLine	( nDocID,  0, "------------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Richtiges Fleisch. Was kann es besseres im Kochtopf geben. Wird es vorher in einer Pfanne angebraten, so kann man daraus die wohl besten Mahlzeiten zubereiten, die man sich nur denken kann.");
					Doc_PrintLines	( nDocID,  0, "Skutečné maso. Co lepšího může člověk do hrnce hodit? Pokud ho předem osmažíme na pánvi, můžeme jej použít k přípravě nejlepších pokrmů, které si dokážete představit.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "                Halvor");


					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MeatSoup);
					Doc_PrintLine	( nDocID,  1, "---------------");
//					Doc_PrintLines	( nDocID,  1, "Ein Stück vorgebratenes Fleisch kann zusammen mit etwas Brot und einer Prise Salz zu einer schmackhaften Suppe zubereitet werden.");
					Doc_PrintLines	( nDocID,  1, "Z kouksu předsmaženého masa můžeme společně s kouksem chleba a špetkou soli uvařít výbornou polévku.");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_MeatStew);
					Doc_PrintLine	( nDocID,  1, "-----------------");
//					Doc_PrintLines	( nDocID,  1, "Besser als das Brot eignet sich ein Stück Käse. So wird aus der Suppe ein Eintopf.");
					Doc_PrintLines	( nDocID,  1, "Lépe než chléb chutná kousek sýra. Tak z polévky uděláme guláš.");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_MeatPie);
					Doc_PrintLine	( nDocID,  1, "----------------");
//					Doc_PrintLines	( nDocID,  1, "Wer das beste aus dem Fleisch holen will, sollte ein Stück Schinken hinzufügen. Zusammen mit Salz ergibt es das allseits beliebte Fleisch-Ragout.");
					Doc_PrintLines	( nDocID,  1, "Pokud chceme z masa vytěžit maximum, přidáme do pokrmu šunku. Společně se solí vytváří oblíbené masové ragú.");
					Doc_Show		( nDocID );
	};




	