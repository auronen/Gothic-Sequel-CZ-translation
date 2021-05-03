
const int VALUE_MEATBUGSOUP = 10;
const int HP_MEATBUGSOUP = 60;
const int VALUE_MOLERATSOUP = 10;
const int HP_MOLERATSOUP = 60;
const int VALUE_HERBSOUP = 12;
const int HP_HERBSOUP = 70;
const int VALUE_MUSHROOMSOUP = 12;
const int HP_MUSHROOMSOUP = 70;
const int VALUE_MEATSOUP = 15;
const int HP_MEATSOUP = 80;
const int VALUE_MEATBUGSTEW = 20;
const int HP_MEATBUGSTEW = 120;
const int VALUE_MOLERATSTEW = 20;
const int HP_MOLERATSTEW = 120;
const int VALUE_HERBSTEW = 22;
const int HP_HERBSTEW = 140;
const int VALUE_MUSHROOMSTEW = 22;
const int HP_MUSHROOMSTEW = 140;
const int VALUE_MEATSTEW = 25;
const int HP_MEATSTEW = 160;
const int VALUE_MEATBUGPIE = 40;
const int HP_MEATBUGPIE = 240;
const int VALUE_MOLERATPIE = 40;
const int HP_MOLERATPIE = 240;
const int VALUE_HERBPIE = 45;
const int HP_HERBPIE = 280;
const int VALUE_MUSHROOMPIE = 45;
const int HP_MUSHROOMPIE = 280;
const int VALUE_MEATPIE = 50;
const int HP_MEATPIE = 320;
const int VALUE_RECIPEMEATBUG = 250;
const int VALUE_RECIPEMOLERAT = 250;
const int VALUE_RECIPEHERB = 350;
const int VALUE_RECIPEMUSHROOM = 350;
const int VALUE_RECIPEMEAT = 500;

instance ITFO_MEATBUGSOUP(C_Item)
{
	name = NAME_MEATBUGSOUP;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGSOUP;
	visual = "ItFo_MeatbugSoup.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatbugsoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATBUGSOUP;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATBUGSOUP;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatbugsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATBUGSOUP);
};


instance ITFO_MOLERATSOUP(C_Item)
{
	name = NAME_MOLERATSOUP;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MOLERATSOUP;
	visual = "ItFo_MoleratSoup.3ds";
	scemeName = "RICE";
	on_state[0] = use_moleratsoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MOLERATSOUP;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MOLERATSOUP;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_moleratsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MOLERATSOUP);
};


instance ITFO_HERBSOUP(C_Item)
{
	name = NAME_HERBSOUP;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HERBSOUP;
	visual = "ItFo_HerbSoup.3ds";
	scemeName = "RICE";
	on_state[0] = use_herbsoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_HERBSOUP;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_HERBSOUP;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_herbsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERBSOUP);
};


instance ITFO_MUSHROOMSOUP(C_Item)
{
	name = NAME_MUSHROOMSOUP;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOMSOUP;
	visual = "ItFo_MushroomSoup.3ds";
	scemeName = "RICE";
	on_state[0] = use_mushroomsoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MUSHROOMSOUP;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MUSHROOMSOUP;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_mushroomsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUSHROOMSOUP);
};


instance ITFO_MEATSOUP(C_Item)
{
	name = NAME_MEATSOUP;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATSOUP;
	visual = "ItFo_MeatSoup.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatsoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATSOUP;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATSOUP;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATSOUP);
};


instance ITFO_MEATBUGSTEW(C_Item)
{
	name = NAME_MEATBUGSTEW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGSTEW;
	visual = "ItFo_MeatbugStew.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatbugstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATBUGSTEW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATBUGSTEW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatbugstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATBUGSTEW);
};


instance ITFO_MOLERATSTEW(C_Item)
{
	name = NAME_MOLERATSTEW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MOLERATSTEW;
	visual = "ItFo_MoleratStew.3ds";
	scemeName = "RICE";
	on_state[0] = use_moleratstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MOLERATSTEW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MOLERATSTEW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_moleratstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MOLERATSTEW);
};


instance ITFO_HERBSTEW(C_Item)
{
	name = NAME_HERBSTEW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HERBSTEW;
	visual = "ItFo_HerbStew.3ds";
	scemeName = "RICE";
	on_state[0] = use_herbstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_HERBSTEW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_HERBSTEW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_herbstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERBSTEW);
};


instance ITFO_MUSHROOMSTEW(C_Item)
{
	name = NAME_MUSHROOMSTEW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOMSTEW;
	visual = "ItFo_MushroomStew.3ds";
	scemeName = "RICE";
	on_state[0] = use_mushroomstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MUSHROOMSTEW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MUSHROOMSTEW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_mushroomstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUSHROOMSTEW);
};


instance ITFO_MEATSTEW(C_Item)
{
	name = NAME_MEATSTEW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATSTEW;
	visual = "ItFo_MeatStew.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatstew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATSTEW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATSTEW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATSTEW);
};


instance ITFO_MEATBUGPIE(C_Item)
{
	name = NAME_MEATBUGPIE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGPIE;
	visual = "ItFo_MeatbugPie.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatbugpie;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATBUGPIE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATBUGPIE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatbugpie()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATBUGPIE);
};


instance ITFO_MOLERATPIE(C_Item)
{
	name = NAME_MOLERATPIE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MOLERATPIE;
	visual = "ItFo_MoleratPie.3ds";
	scemeName = "RICE";
	on_state[0] = use_moleratpie;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MOLERATPIE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MOLERATPIE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_moleratpie()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MOLERATPIE);
};


instance ITFO_HERBPIE(C_Item)
{
	name = NAME_HERBPIE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HERBPIE;
	visual = "ItFo_HerbPie.3ds";
	scemeName = "RICE";
	on_state[0] = use_herbpie;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_HERBPIE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_HERBPIE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_herbpie()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERBPIE);
};


instance ITFO_MUSHROOMPIE(C_Item)
{
	name = NAME_MUSHROOMPIE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOMPIE;
	visual = "ItFo_MushroomPie.3ds";
	scemeName = "RICE";
	on_state[0] = use_mushroompie;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MUSHROOMPIE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MUSHROOMPIE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_mushroompie()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUSHROOMPIE);
};


instance ITFO_MEATPIE(C_Item)
{
	name = NAME_MEATPIE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATPIE;
	visual = "ItFo_MeatPie.3ds";
	scemeName = "RICE";
	on_state[0] = use_meatpie;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MEATPIE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MEATPIE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_meatpie()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEATPIE);
};


instance ITWR_RECIPE_MEATBUG(C_Item)
{
	name = NAME_RECIPEMEATBUG;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_RECIPEMEATBUG;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_meatbug;
};


func void useitwr_recipe_meatbug()
{
	var int nDocID;
	b_learnrecipemeatbug();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kochen mit");
	Doc_PrintLine(nDocID,0,"Fleischwanzen");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Obwohl diese kleinen Mehrfüssler im allgemeinen sofort Ekel bis hin zum Erbrechen verursachen, so sollte man sich doch nicht von ihrer äusseren Erscheinung täuschen lassen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Der meisterhafte Koch, kann aus dem Fleisch dieser Schalentiere ganze Kunststücke zaubern.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                  Snaf");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATBUGSOUP);
	Doc_PrintLine(nDocID,1,"----------------");
	Doc_PrintLines(nDocID,1,"Man nehme etwas Salz, den Körper einer gut geschälten Fleischwanze, sowie ein Stück Brot, um das ganze anzudicken.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATBUGSTEW);
	Doc_PrintLine(nDocID,1,"------------------");
	Doc_PrintLines(nDocID,1,"Anstelle des Brotes verschafft ein ordentliches Stück Käse dem ganzen Eintopf so richtig Geschmack.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATBUGPIE);
	Doc_PrintLine(nDocID,1,"-----------------");
	Doc_PrintLines(nDocID,1,"Der gegarte Wanzenkörper wird mit einem Stück Schinken und einer Prise Salz zu einem leckeren Ragout.");
	Doc_Show(nDocID);
};


instance ITWR_RECIPE_MOLERAT(C_Item)
{
	name = NAME_RECIPEMOLERAT;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_RECIPEMOLERAT;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_molerat;
};


func void useitwr_recipe_molerat()
{
	var int nDocID;
	b_learnrecipemolerat();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kochen mit");
	Doc_PrintLine(nDocID,0,"Moleratfett");
	Doc_PrintLine(nDocID,0,"-------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Man sollte es wirklich nicht meinen, aber Molerats bestehen fast ausschliesslich aus purem Fett, dass sich zu sehr nahrhaften Mahlzeiten verkochen lässt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MOLERATSOUP);
	Doc_PrintLine(nDocID,1,"----------------");
	Doc_PrintLines(nDocID,1,"Obwohl man es nicht unbedingt vermutet, kann Moleratfett, zusammen mit einem Leib Brot und einer Prise Salz eine nahrhafte Mahlzeit ergeben.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MOLERATSTEW);
	Doc_PrintLine(nDocID,1,"------------------");
	Doc_PrintLines(nDocID,1,"Verwendet man anstelle des Brotes ein Stück Käse, so erhält man dieses leckere Gericht.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MOLERATPIE);
	Doc_PrintLine(nDocID,1,"-----------------");
	Doc_PrintLines(nDocID,1,"Nur wer das Moleratfett mit Schinken und etwas Salz verkocht, gelangt an diese äusserst schmackhafte Mahlzeit.");
	Doc_Show(nDocID);
};


instance ITWR_RECIPE_HERB(C_Item)
{
	name = NAME_RECIPEHERB;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_RECIPEHERB;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_herb;
};


func void useitwr_recipe_herb()
{
	var int nDocID;
	b_learnrecipeherb();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kochen mit");
	Doc_PrintLine(nDocID,0,"Kräutern");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Frische Kräuter aus dem Sumpf eigenen sich nicht nur zum Rauchen. Mit etwas Kochkunst kann man daraus eine ganze Reihe leckerer Gerichte zubereiten. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_HERBSOUP);
	Doc_PrintLine(nDocID,1,"--------------");
	Doc_PrintLines(nDocID,1,"Sumpfkraut mit Brot und Salz kann zu einer nahrhaften Suppe zubereitet werden.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_HERBSTEW);
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Anstelle des Brotes kann auch ein Stück Käse hinzugefügt werden, und so entsteht ein leckerer Eintopf.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_HERBPIE);
	Doc_PrintLine(nDocID,1,"--------------");
	Doc_PrintLines(nDocID,1,"Nichts geht über ein Stück Schinken, das auch dem Sumpfkraut den edelsten Geschmack verleiht. Das Salzen nicht vergessen!");
	Doc_Show(nDocID);
};


instance ITWR_RECIPE_MUSHROOM(C_Item)
{
	name = NAME_RECIPEMUSHROOM;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_RECIPEMUSHROOM;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_mushroom;
};


func void useitwr_recipe_mushroom()
{
	var int nDocID;
	b_learnrecipemushroom();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kochen mit Pilzen");
	Doc_PrintLine(nDocID,0,"-----------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Pilze gehören zu den meist unterschätzten Pflanzen. Sie eigenen sich hervorragen dazu einige sehr exquisite Gerichte daraus zuzubereiten.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MUSHROOMSOUP);
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Ein Höhlenpilz, gut gesäubert und mit Brot und Salz gekocht.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MUSHROOMSTEW);
	Doc_PrintLine(nDocID,1,"--------------");
	Doc_PrintLines(nDocID,1,"Mit einem Stück Käse und einer Prise Salz schmecken Pilze bedeutend besser.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MUSHROOMPIE);
	Doc_PrintLine(nDocID,1,"-------------");
	Doc_PrintLines(nDocID,1,"Die Krönung der Pilzgerichte wird mit einem Stück Schinken zubereitet. So entsteht mit Pilzen und einer Prise Salz ein schmackhaftes Ragout.");
	Doc_Show(nDocID);
};


instance ITWR_RECIPE_MEAT(C_Item)
{
	name = NAME_RECIPEMEAT;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = VALUE_RECIPEMEAT;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_meat;
};


func void useitwr_recipe_meat()
{
	var int nDocID;
	b_learnrecipemeat();
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kochen mit Fleisch");
	Doc_PrintLine(nDocID,0,"------------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Richtiges Fleisch. Was kann es besseres im Kochtopf geben. Wird es vorher in einer Pfanne angebraten, so kann man daraus die wohl besten Mahlzeiten zubereiten, die man sich nur denken kann.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                Halvor");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATSOUP);
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Stück vorgebratenes Fleisch kann zusammen mit etwas Brot und einer Prise Salz zu einer schmackhaften Suppe zubereitet werden.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATSTEW);
	Doc_PrintLine(nDocID,1,"-----------------");
	Doc_PrintLines(nDocID,1,"Besser als das Brot eignet sich ein Stück Käse. So wird aus der Suppe ein Eintopf.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,NAME_MEATPIE);
	Doc_PrintLine(nDocID,1,"----------------");
	Doc_PrintLines(nDocID,1,"Wer das beste aus dem Fleisch holen will, sollte ein Stück Schinken hinzufügen. Zusammen mit Salz ergibt es das allseits beliebte Fleisch-Ragout.");
	Doc_Show(nDocID);
};

