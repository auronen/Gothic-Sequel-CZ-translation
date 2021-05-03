
instance ItWr_Book_Circle_01(C_Item)
{
	name = "Der erste Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der erste Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_01;
};


func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_LIGHT));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBOLT));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBOLT));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Erster Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Als die Götter den Menschen die Fähigkeit zur Magie schenkten, schenkten sie ihnen auch das Wissen magische Runen herzustellen. Die Diener der Götter haben die ehrenvolle Aufgabe übernommen, diese Artefakte göttlicher Macht zu erschaffen und zu benutzen, wobei der Kreis des Magiers bestimmt, welche Zauber er in der Lage ist zu verstehen und anzuwenden. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Licht");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das erste Geschenk Innos an die Menschen.Eine hell strahlende Kugel wird über dem Magier erzeugt.");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eispfeil");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Geschoss aus magischer Energie.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Feuerpfeil");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Geschoss aus magischem Feuer.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
};


instance ItWr_Book_Circle_02(C_Item)
{
	name = "Der zweite Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der zweiter Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_02;
};


func void UseItWr_Book_Circle_02()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_HEALING_HP_PER_MP));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Zweiter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Alle Zauber werden durch die magische Energie des Anwenders ausgelöst.Der Anwender wird als Magier bezeichnet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jede Aktivierung eines Zaubers kostet den Magier einen Teil seiner Kraft. diese Kraft wird als Mana bezeichnet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Heilung");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Adanos sah, das die Menschen starben und das es der Wille Beliars war.Und er sprach:Stelle ich mich auch nicht gegen den Willen Beliars,gebe ich den Menschen jedoch die Macht der Heilung.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dieser Zauber birgt die Macht, den Magier zu heilen.");
	Doc_PrintLine(nDocID,1,"Investierungszauber");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItWr_Book_Circle_03(C_Item)
{
	name = "Der dritte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der dritte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_03;
};


func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBALL));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICECUBE));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBALL));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Dritter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Manche Zauber können mit einer bestimmten größeren Anzahl von magischer Energie gespeist werden, diese werden auch Aufladungszauber genannt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Andere Zauber werden aufrechterhalten, solange der Magier sein Mana in dieses Spruch einfliessen lässt. Solche Zauber heissen Investierungszauber.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Feuerball");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das zweite Geschenk Innos an die Kinder des Feuers. Ein Ball aus Feuer, der sein Opfer verbrennt");
	Doc_PrintLine(nDocID,1,"Auladbarer Zauber");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eisblock");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das Opfer wird in einen Eisblock eingefroren. Ein Zauber aus dem Tempel der Wassermagier");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Kugelblitz");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Eine Kugel, geschaffen aus magischer Energie.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
};


instance ItWr_Book_Circle_04(C_Item)
{
	name = "Der vierte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der vierte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_04;
};


func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRESTORM));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Vierter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Die Magie ");
	Doc_PrintLine(nDocID,0,"der Teleportation");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das besondere an diesen magischen Formeln ist, das sie, obwohl als Runen geschaffen,von jedem der magische Energie in sich trägt gesprochen werden können.Die Magie die diese Formeln umgibt, kann sofort aktiviert werden. Es gibt keine Einschränkungen für Teleportationszauber.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Feuersturm	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ähnlich dem Feuerball wirkt dieser Zauber auf einen Gegner, springt von dort aus jedoch auf weitere Gegner über.");
	Doc_PrintLine(nDocID,1,"Aufladbarer Zauber");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"Blitz");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1," Der Zauber springt auf mehrere Opfer über. Die Kraft des Blitzes ist schwer zu kontrollieren, so das der Magier selbst Opfer werden kann");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Untote vernichten");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Die Geschöpfe der Finsternis werden mit diesem Zauber verbannt.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
};


instance ItWr_Book_Circle_05(C_Item)
{
	name = "Der fünfte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der fünfte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_05;
};


func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	var string Text_2;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRERAIN));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICEWAVE));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Fünfter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Feuerregen");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Die Macht des göttlichen Feuers trifft jedes Lebewesen im Wirkungsbreich des Magiers.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eiswelle	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Feld aus magischem Eis erstreckt sich über alle Gegner und friert diese für einen kurzen Zeitraum ein. Während dieser Zeit sind die Opfer bewegungsunfähig und erleiden Schaden. ");
	Doc_PrintLines(nDocID,1,"Ein Zauber aus dem Tempel der Wassermagier.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
};


instance ItWr_Book_Circle_06(C_Item)
{
	name = "Der sechste Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Sechster Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_06;
};


func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string text;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Sechster Kreis");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Todeshauch");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Der Atem Beliars. Eine Wolke aus Lebenverschlingendem Nichts, die jedes Wesen augenblicklich töten kann.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Todesring");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Nicht viel ist überliefert über die Rune mit der Macht von URIZIEL ");
	Doc_PrintLines(nDocID,1,"Es ist nur soviel bekannt, als das sie Beliars Mächte in sich birgt.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

