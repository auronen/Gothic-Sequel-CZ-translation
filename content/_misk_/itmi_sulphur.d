
const int VALUE_BOOKHEALINGPOTIONS = 100;
const int VALUE_BOOKMANAPOTIONS = 100;
const int VALUE_BOOKSPEEDPOTIONS = 100;
const int VALUE_SULPHUR = 10;
const int VALUE_QUICKSILVER = 12;
const int VALUE_SYRIANOIL = 7;
const int Value_Alcohol = 9;

instance ITMI_SULPHUR(C_Item)
{
	name = NAME_SULPHUR;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SULPHUR;
	visual = "ItMi_Alchemy_Sulphur_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_QUICKSILVER(C_Item)
{
	name = NAME_QUICKSILVER;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_QUICKSILVER;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_SYRIANOIL(C_Item)
{
	name = NAME_SYRIANOIL;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SYRIANOIL;
	visual = "ItMi_Alchemy_Syrianoil_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_ALCOHOL(C_Item)
{
	name = NAME_ALCOHOL;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Alcohol;
	visual = "ItMi_Alchemy_Alcohol_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITWR_BOOK_HEALINGPOTIONS(C_Item)
{
	name = NAME_BOOKHEALINGPOTIONS;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_BOOKHEALINGPOTIONS;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Dieser Foliant enthält Rezepturen";
	text[1] = "mit welchen ein Alchemist alle";
	text[2] = "möglichen Sorten von Heiltränken";
	text[3] = "herstellen kann.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_book_healingpotions;
};


func void useitwr_book_healingpotions()
{
	var int nDocID;
	var string string_recipe;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Heiltränke");
	Doc_PrintLine(nDocID,0,"------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Heilung von Wunden, egal ob durch Schwerter, durch die Hauer eines wilden Tieres oder durch Magie verursacht ist eine langwierige Sache.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doch kann dieser Prozess durch alchemistische Tränke erheblich beschleunigt werden.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,NAME_ESSENCE);
	Doc_PrintLine(nDocID,1,"-------");
	string_recipe = b_buildrecipestring3("Schon mit geringer Übung ist es möglich diese herzustellen. Die nötigen Reagenzien: ",1,NAME_ALCOHOL,1,NAME_MOUNTAINMOSS,1,NAME_ORCLEAF);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_EXTRACT);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Dieser stärkere Trank erfordert mehr Erfahrung: ",1,NAME_ALCOHOL,1,NAME_MOUNTAINMOSS,1,NAME_RAVENHERB);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_ELIXIR);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Nur Meister in Alchemie können ein Elixier herstellen. Die Rezeptur benötigt: ",1,NAME_ALCOHOL,1,NAME_MOUNTAINMOSS,1,NAME_NIGHTSHADE);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ITWR_BOOK_MANAPOTIONS(C_Item)
{
	name = NAME_BOOKMANAPOTIONS;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_BOOKMANAPOTIONS;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Dieser Foliant enthält Rezepturen";
	text[1] = "mit welchen ein Alchemist alle";
	text[2] = "möglichen Sorten von Manatränken";
	text[3] = "herstellen kann.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_book_manapotions;
};


func void useitwr_book_manapotions()
{
	var int nDocID;
	var string string_recipe;
	b_learnrecipemanapotions();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Mana-Tränke");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jeder Zauber entzieht dem Wirkenden etwas magische Energie, die durch Alchemistische Tränke zurückgewonnen werden kann.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_ESSENCE);
	Doc_PrintLine(nDocID,1,"-------");
	string_recipe = b_buildrecipestring3("Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen. Die Reagenzien: ",1,NAME_ALCOHOL,1,NAME_STONEROOT,1,NAME_ORCLEAF);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_EXTRACT);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Um dieses herzustellen ist ein geübter Alchemist von Nöten. Er benötigt: ",1,NAME_ALCOHOL,1,NAME_STONEROOT,1,NAME_RAVENHERB);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_ELIXIR);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Nur ein Meister der Alchemie ist fähig ein Elixier zu erzeugen. Die Rezeptur bilden: ",1,NAME_ALCOHOL,1,NAME_STONEROOT,1,NAME_NIGHTSHADE);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_Show(nDocID);
};


instance ITWR_BOOK_SPEEDPOTIONS(C_Item)
{
	name = NAME_BOOKSPEEDPOTIONS;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_BOOKSPEEDPOTIONS;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Dieser Foliant enthält Rezepturen";
	text[1] = "für alchemistische Tränke, welche";
	text[2] = "die Spurtgeschwindigkeit gewaltig";
	text[3] = "anheben.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_book_speedpotions;
};


func void useitwr_book_speedpotions()
{
	var int nDocID;
	var string string_recipe;
	b_learnrecipespeedpotions();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Tränke der");
	Doc_PrintLine(nDocID,0,"Eile");
	Doc_PrintLine(nDocID,0,"------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wer sich schnell wie ein Scavenger fortbewegen will, benötigt alchemistische Hilfe. Die Tränke der Eile verleihen dem Benutzer ungeahnte Spurtfähigkeiten. Doch leider sind sie nur von kurzer Dauer.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_ESSENCE);
	Doc_PrintLine(nDocID,1,"-------");
	string_recipe = b_buildrecipestring3("Schon mit geringer Ausbildung  kann man diese herstellen. Nötige Reagenzien sind: ",1,NAME_ALCOHOL,1,NAME_BLOODTHISTLE,1,NAME_ORCLEAF);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_EXTRACT);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Um dieses zu zubereiten ist ein geübter Alchemist gefragt. Er benötigt: ",1,NAME_ALCOHOL,1,NAME_BLOODTHISTLE,1,NAME_RAVENHERB);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_ELIXIR);
	Doc_PrintLine(nDocID,1,"--------");
	string_recipe = b_buildrecipestring3("Nur die besten Alchemisten vermögen diese Elixiere zuzubereiten. Inhaltsstoffe sind: ",1,NAME_ALCOHOL,1,NAME_BLOODTHISTLE,1,NAME_NIGHTSHADE);
	Doc_PrintLines(nDocID,1,string_recipe);
	Doc_Show(nDocID);
};

