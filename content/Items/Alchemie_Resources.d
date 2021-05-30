//#################################################################################################
//##
//##	Werte der Alchemistischen Gegenstände
//##
//#################################################################################################

// Rezeptur-Bücher
const int		Value_BookHealingPotions		=	100;
const int		Value_BookManaPotions			=	100;
const int		Value_BookSpeedPotions			=	100;

// alchemistische Substanzen
const int		Value_Sulphur					=	10;
const int		Value_Quicksilver				=	12;
const int		Value_SyrianOil					=	7;
const int		Value_Alcohol					=	9;





//#################################################################################################
//##
//##	alchemistische Substanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Schwefel
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_Sulphur (C_Item)
{
	name 			=	NAME_Sulphur;

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Sulphur;

	visual 			=	"ItMi_Alchemy_Sulphur_01.3DS";
	material 		=	MAT_CLAY;

	description		=	name;
	TEXT[4]			=	NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Quecksilber
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_Quicksilver (C_Item)
{
	name 			=	NAME_Quicksilver;

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Quicksilver;

	visual 			=	"ItMi_Alchemy_Quicksilver_01.3DS";
	material 		=	MAT_CLAY;

	description		=	name;
	TEXT[4]			=	NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Syrianisches Öl
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_Syrianoil (C_Item)
{
	name 			=	NAME_SyrianOil;

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	Value_SyrianOil;

	visual 			=	"ItMi_Alchemy_Syrianoil_01.3DS";
	material 		=	MAT_CLAY;

	description		=	name;
	TEXT[4]			=	NAME_Value;					COUNT[4]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Alcohol
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_Alcohol (C_Item)
{
	name 			=	NAME_Alcohol;

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Alcohol;

	visual 			=	"ItMi_Alchemy_Alcohol_01.3DS";
	material 		=	MAT_CLAY;

	description		=	name;
	TEXT[4]			=	NAME_Value;					COUNT[4]	= value;
};









//#################################################################################################
//##
//##	Alchemie-Bücher
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Heilung
//////////////////////////////////////////////////////////////////////////////////
instance ItWr_Book_HealingPotions(C_Item)
{
	name 			=	NAME_BookHealingPotions;

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	Value_BookHealingPotions;

	visual 			=	"ItWr_Book_02_04.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";
	description		=	name;

//	TEXT[0]			=	"Dieser Foliant enthält Rezepturen";
//	TEXT[1]			=	"mit welchen ein Alchemist alle";
//	TEXT[2]			=	"möglichen Sorten von Heiltränken";
//	TEXT[3]			=	"herstellen kann.";
	TEXT[0]			=	"Tato kniha obsahuje recepty";
	TEXT[1]			=	"s pomocí kterých může alchymista";
	TEXT[2]			=	"vyrobit všechny druhy";
	TEXT[3]			=	"léčivých lektvarů.";
	TEXT[5]			=	NAME_Value;				COUNT[5]			=	value;
	on_state[0]		=	UseItWr_Book_HealingPotions;
};

	FUNC VOID UseItWr_Book_HealingPotions()
	{
		// SN: Hier storybedingt keine B_LearnRecipe...-Funktion !!!

		var int nDocID;
		//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                        		//wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga",		0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",		0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   	); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Heiltränke"				);
					Doc_PrintLine	( nDocID,  0, "Léčivé lektvary"				);
					Doc_PrintLine	( nDocID,  0, "------------"			);
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   	); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""						);
//					Doc_PrintLines	( nDocID,  0, "Die Heilung von Wunden, egal ob durch Schwerter, durch die Hauer eines wilden Tieres oder durch Magie verursacht ist eine langwierige Sache.");
					Doc_PrintLines	( nDocID,  0, "Léčení ran, způsobených zbraněmi, kly divoké zvěře nebo magií, je velice zdlouhavý proces.");
					Doc_PrintLine	( nDocID,  0, ""						);
//					Doc_PrintLines	( nDocID,  0, "Doch kann dieser Prozess durch alchemistische Tränke erheblich beschleunigt werden.");
					Doc_PrintLines	( nDocID,  0, "Tento proces je možné urychlit alchymistickými lektvary.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1,  NAME_Essence				);
					Doc_PrintLine	( nDocID,  1, "-------"					);
					var string string_Recipe;

//					string_Recipe	=	B_BuildRecipeString3	("Schon mit geringer Übung ist es möglich diese herzustellen. Die nötigen Reagenzien: ",
					string_Recipe	=	B_BuildRecipeString3	("Tyto lektvary je možné připravit již s velice omezenou praxí. Potřebné ingredience jsou: ",
																1,
																NAME_Alcohol,
																1,
																NAME_MountainMoss,
																1,
																NAME_OrcLeaf);
					Doc_PrintLines	( nDocID,  1,string_Recipe );
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_Extract);
					Doc_PrintLine	( nDocID,  1, "--------");
//					string_Recipe	=	B_BuildRecipeString3	( "Dieser stärkere Trank erfordert mehr Erfahrung: ",
					string_Recipe	=	B_BuildRecipeString3	( "Tento silnější lektvar vyžaduje více zkušeností: ",
																1,
																NAME_Alcohol,
																1,
																NAME_MountainMoss,
																1,
																NAME_RavenHerb);

					Doc_PrintLines	( nDocID,  1, string_Recipe);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_Elixir);
					Doc_PrintLine	( nDocID,  1, "--------");
//					string_Recipe	=	B_BuildRecipeString3	( "Nur Meister in Alchemie können ein Elixier herstellen. Die Rezeptur benötigt: ",
					string_Recipe	=	B_BuildRecipeString3	( "Pouze mistr alchymie je schopen připravovat elixíry. Tento recept vyžaduje: ",
																1,
																NAME_Alcohol,
																1,
																NAME_MountainMoss,
																1,
																NAME_Nightshade);
					Doc_PrintLines	( nDocID,  1,string_Recipe );
					Doc_PrintLine	( nDocID,  1, "");

					Doc_Show		( nDocID );
	};


//////////////////////////////////////////////////////////////////////////////////
//	Mana-Tränke
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Book_ManaPotions(C_Item)
{
	name 			=	Name_BookManaPotions;

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	Value_BookManaPotions;

	visual 			=	"ItWr_Book_02_04.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";
	description		=	name;

//	TEXT[0]			=	"Dieser Foliant enthält Rezepturen";
//	TEXT[1]			=	"mit welchen ein Alchemist alle";
//	TEXT[2]			=	"möglichen Sorten von Manatränken";
//	TEXT[3]			=	"herstellen kann.";
	TEXT[0]			=	"Tato kniha obsahuje recepty";
	TEXT[1]			=	"s pomocí kterých může alchymista";
	TEXT[2]			=	"vyrobit všechny druhy";
	TEXT[3]			=	"lektvarů many.";
	TEXT[5]			=	NAME_Value;				COUNT[5]		=	value;
	on_state[0]		=	UseItWr_Book_ManaPotions;
};

	FUNC VOID UseItWr_Book_ManaPotions()
	{
		B_LearnRecipeManaPotions ();
		var int nDocID;
		//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga",		0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",		0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Mana-Tränke"			);
					Doc_PrintLine	( nDocID,  0, "Lektvary many"			);
					Doc_PrintLine	( nDocID,  0, "-----------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Jeder Zauber entzieht dem Wirkenden etwas magische Energie, die durch Alchemistische Tränke zurückgewonnen werden kann.");
					Doc_PrintLines	( nDocID,  0, "Každé kouzlo stojí mága magickou energii, kterou lze získat zpět pomocí alchymistických lektvarů.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,  NAME_Essence );
					Doc_PrintLine	( nDocID,  1, "-------");
					var string string_Recipe;

//					string_Recipe	=	B_BuildRecipeString3	("Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen. Die Reagenzien: ",
					string_Recipe	=	B_BuildRecipeString3	("I poměrně nezkušený alchymista je schopen připravit tento lektvar. Ingredience: ",
																1,
																NAME_Alcohol,
																1,
																NAME_Stoneroot,
																1,
																NAME_OrcLeaf);
					Doc_PrintLines	( nDocID,  1,string_Recipe );
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_Extract);
					Doc_PrintLine	( nDocID,  1, "--------");

//					string_Recipe	=	B_BuildRecipeString3	( "Um dieses herzustellen ist ein geübter Alchemist von Nöten. Er benötigt: ",
					string_Recipe	=	B_BuildRecipeString3	( "K přípravě tohoto lektvaru je potřeba zkušeného alchymisty. K přípravě potřebuje: ",
																1,
																NAME_Alcohol,
																1,
																NAME_Stoneroot,
																1,
																NAME_RavenHerb);

					Doc_PrintLines	( nDocID,  1, string_Recipe);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_Elixir);
					Doc_PrintLine	( nDocID,  1, "--------");

//					string_Recipe	=	B_BuildRecipeString3	( "Nur ein Meister der Alchemie ist fähig ein Elixier zu erzeugen. Die Rezeptur bilden: ",
					string_Recipe	=	B_BuildRecipeString3	( "Pouze mistr alchymie je schopen připravit tento elixír. K přípravě jsou potřeba následující ingredience: ",
																1,
																NAME_Alcohol,
																1,
																NAME_Stoneroot,
																1,
																NAME_Nightshade);
					Doc_PrintLines	( nDocID,  1, string_Recipe);
					Doc_Show		( nDocID );
	};

//////////////////////////////////////////////////////////////////////////////////
//	Schnelligkeits-Tränke
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItWr_Book_SpeedPotions(C_Item)
{
	name 			=	Name_BookSpeedPotions;

	mainflag 		=	ITEM_KAT_DOCS;
	flags 			=	0;

	value 			=	Value_BookSpeedPotions;

	visual 			=	"ItWr_Book_02_04.3ds";
	material 		=	MAT_LEATHER;

	scemeName		=	"MAP";
	description		=	name;

//	TEXT[0]			=	"Dieser Foliant enthält Rezepturen";
//	TEXT[1]			=	"für alchemistische Tränke, welche";
//	TEXT[2]			=	"die Spurtgeschwindigkeit gewaltig";
//	TEXT[3]			=	"anheben.";
	TEXT[0]			=	"Tato kniha obsahuje recepty";
	TEXT[1]			=	"s pomocí kterých může alchymista";
	TEXT[2]			=	"vyrobit všechny druhy";
	TEXT[3]			=	"lektvarů rychlosti.";
	TEXT[5]			=	NAME_Value;				COUNT[5]			=	value;
	on_state[0]		=	UseItWr_Book_SpeedPotions;
};

	FUNC VOID UseItWr_Book_SpeedPotions()
	{
		B_LearnRecipeSpeedPotions   ();
		var int nDocID;
		//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga",		0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga",		0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
//					Doc_PrintLine	( nDocID,  0, "Tränke der"			);
					Doc_PrintLine	( nDocID,  0, "Lektvary"			);
//					Doc_PrintLine	( nDocID,  0, "Eile"			);
					Doc_PrintLine	( nDocID,  0, "rychlosti"			);
					Doc_PrintLine	( nDocID,  0, "------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
//					Doc_PrintLines	( nDocID,  0, "Wer sich schnell wie ein Scavenger fortbewegen will, benötigt alchemistische Hilfe. Die Tränke der Eile verleihen dem Benutzer ungeahnte Spurtfähigkeiten. Doch leider sind sie nur von kurzer Dauer.");
					Doc_PrintLines	( nDocID,  0, "Každý, kdo se chce pohybovat rychle jako mrchožrout, potřebuje alchymistickou pomoc. Lektvary rychlosti poskytují, tomu kdo je vypije, neuvěřitelné běžecké schopnosti. Jejich účinek je bohužel časově omezený.");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_Essence );
					Doc_PrintLine	( nDocID,  1, "-------");
					var string string_Recipe;

//					string_Recipe	=	B_BuildRecipeString3	("Schon mit geringer Ausbildung  kann man diese herstellen. Nötige Reagenzien sind: ",
					string_Recipe	=	B_BuildRecipeString3	("Již se základním tréninkem je možné tento lektvar připravit. Potřebné ingredience jsou: ",
																1,
																NAME_Alcohol,
																1,
																NAME_BloodThistle,
																1,
																NAME_OrcLeaf);
					Doc_PrintLines	( nDocID,  1,string_Recipe );
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, NAME_Extract);
					Doc_PrintLine	( nDocID,  1, "--------");
//					string_Recipe	=	B_BuildRecipeString3	( "Um dieses zu zubereiten ist ein geübter Alchemist gefragt. Er benötigt: ",
					string_Recipe	=	B_BuildRecipeString3	( "Přípravu tohoto lektvaru zvládne pokročilý alchymista. Potřebujeme: ",
																1,
																NAME_Alcohol,
																1,
																NAME_BloodThistle,
																1,
																NAME_RavenHerb);

					Doc_PrintLines	( nDocID,  1, string_Recipe);
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, NAME_Elixir);
					Doc_PrintLine	( nDocID,  1, "--------");
//					string_Recipe	=	B_BuildRecipeString3	( "Nur die besten Alchemisten vermögen diese Elixiere zuzubereiten. Inhaltsstoffe sind: ",
					string_Recipe	=	B_BuildRecipeString3	( "Jen nejlepší alchymisté dokáží připravit tyto elixíry. Ingredince jsou: ",
																1,
																NAME_Alcohol,
																1,
																NAME_BloodThistle,
																1,
																Name_Nightshade);
					Doc_PrintLines	( nDocID,  1,string_Recipe );
					Doc_Show		( nDocID );
	};
