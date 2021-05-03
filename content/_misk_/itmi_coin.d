
instance ITMI_COIN(C_Item)
{
	name = "alte Münze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
};

instance ITWR_XARDAS_LETTER_SEALED(C_Item)
{
	name = "Botschaft von Xardas";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = use_xardas_letter_sealed;
	description = name;
	text[0] = "Dies ist die Borschaft, die mir Xardas";
	text[1] = "für Diego mitgab.";
	text[3] = "Sie ist versiegelt!";
};


func void use_xardas_letter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"Diego");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die dämonischen Mächte bereiten die Rückkehr des Schläfers vor! Verschanzt in der Bergfeste, mit den Paladinen und dem König, wollen die Feuermagier die Gefahr abzuwenden. Doch sie haben nichts bewirkt. Grenzenloser Hochmut macht sie blind.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wie du siehst, ist der Zerstörer der Barriere nicht tot. Er war im Tempel verschüttet, ohne Bewusstsein, lange Zeit. Schwach und untrainiert habe ich ihn zu dir geschickt. Ein Schatten seiner selbst. Doch ist er unsere einzige Hoffnung den Schläfer endgültig zu vernichten!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schicke ihn mit dieser Nachricht zu den Feuermagiern, sobald er bereit ist. Er wird ihnen helfen, den richtigen Weg zu erkennen!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"               Xardas");
	Doc_Show(nDocID);
	DIEGO_LETTERREAD = TRUE;
};

func void use_xardas_letter_sealed()
{
	CreateInvItem(hero,itwr_xardas_letter);
	use_xardas_letter();
};


instance ITWR_XARDAS_LETTER(C_Item)
{
	name = "Botschaft von Xardas";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_xardas_letter;
	description = name;
	text[0] = "Dies ist die Borschaft, die mir Xardas";
	text[1] = "für Diego mitgab.";
	text[3] = "Das Siegel ist gebrochen!";
};

instance ItArScrollTeleport4(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport4;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Teleport zum Lager";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITWR_BOOK_THIEF_01(C_Item)
{
	name = "Diebeskunst";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Über Schlösser und Mechanismen";
	on_state[0] = useitwr_book_thief_01;
};


func void useitwr_book_thief_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Schlösser und Mechanismen ");
	Doc_PrintLine(nDocID,0,"Von M. Fingers ");
	Doc_PrintLine(nDocID,0,"5 Jahre Meister der Diebesgilde");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Derweil werden verschiedene Mechaniken, ausgeklügelte Systematiken und raffinierte Kombinatorik verwendet, um Schlösser sicher zu machen gegen fremden Eingriff. Eine der immer noch gängigsten Methoden der Kombinatorik ist die Multimechanik. Besonders bekannt bei Türen und Truhen, sorgen sie mit offensichtlich simplem System dafür, das der Zugang nur dem gestattet ist, der auch rechtmäßigen Zugang besitzt. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Während die Öffnung durch ein Links/Rechts System verschlossen ist, dem sich der entsprechende Schüssel automatisch anpasst, so sorgen Gewinde, Fassungen und kleine Rädchen dafür, das ein fremder Gegenstand bei einer Bewegung in die falsche Richtung abbricht. Eine solche Rechts/Links Kombiantion besteht in der Regel aus entweder vier, sechs, acht oder sogar zehn Richtungsbewegungen. Nur ein guter Dieb wird seine Dietriche bewahren. Weniger gute Diebe bleiben jedoch immer auf der Suche nach neuen Dietrichen, weil durch ihre fehlerhafte Arbeit immer wieder Dietriche abbrechen. ");
	Doc_Show(nDocID);
};


instance ITKE_SMITH_01(C_Item)
{
	name = "Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	owner = mil_103_berengar;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Schmiedelager";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITWR_RECIPE_01(C_Item)
{
	name = "Rezept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[1] = "Rezept";
	text[2] = "zur Herstellung";
	text[3] = "heilender und kräftigender";
	text[4] = "Essenzen";
};

instance ITWR_SMITH_ART_01(C_Item)
{
	name = "Schmiedekunst";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[1] = "Ein Buch über";
	text[2] = " die Kunst des Schmiedens ";
	text[3] = "von H. Mer";
};

instance ITMI_MISS_CANDEL_01(C_Item)
{
	name = "Kerzenständer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 20;
	visual = "ItMi_Stuff_Candel_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITWR_BOOK_THIEF_02(C_Item)
{
	name = "Geheimnisse der Nacht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Geheimnisse der Nacht";
	on_state[0] = useitwr_book_thief_02;
};


func void useitwr_book_thief_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Geheimnisse der Nacht ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Der Ring der Gewandtheit");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Die Macht des Ringes wurde gestärkt mit der Kraft des Windes, der Stille der Nacht und der Beweglichkeit des Schattens. Ein Wunderwerk aus feiner Schmiedekunst und  Zauberei . Geschmiedet in den Höhlen von Nordmar, verzaubert in den Hallen der Weisheit, gewährt der Ring seinem Träger eine höhere Geschicklichkeit. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Getragen wurde es bisher von:");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nantanuel Gildenmeister von Khorinis");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Tomas 3 Finger");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ilgur Silberauge");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Michal Meister der Hände");
	Doc_PrintLine(nDocID,1,"Raul die Katze");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"M. Fingers Gefangener in der Barriere");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Diego");
	Doc_PrintLine(nDocID,1,"Edo Flinkhand");
	Doc_Show(nDocID);
};


instance ITKE_EDO(C_Item)
{
	name = "Edo's Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	owner = mil_103_berengar;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Dieser Schlüssel öffnet die Truhe in";
	text[1] = "Edo's Hütte.";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITKE_BARTOK(C_Item)
{
	name = "Bartok's Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	value = 0;
	description = name;
	text[0] = "Dieser Schlüssel öffnet die große Truhe";
	text[1] = "in der Burgschmiede des Alten Lagers.";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAR_SCROLLHEAL_COPY(C_Item)
{
	name = "Zauber der Heilung";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	on_state[0] = useitar_scrollheal_copy;
	description = "Heilung";
	text[1] = "Heilung pro Mana";
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useitar_scrollheal_copy()
{
	PrintScreen("Der Zauber wirkt nicht!",-1,-1,FONT_OLD_BIG,2);
};


instance ITAR_SCROLLLIGHT_COPY(C_Item)
{
	name = "Zauber des Lichts";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItAr_Scroll_32.3DS";
	material = MAT_STONE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_LIGHT;
	on_state[0] = useitar_scrolllight_copy;
	description = "Licht";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useitar_scrolllight_copy()
{
	PrintScreen("Der Zauber wirkt nicht!",-1,-1,FONT_OLD_BIG,2);
};


instance ITWR_HALVORRECIPE(C_Item)
{
	name = "Halvor's Kochbuch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = VALUE_RECIPEMEAT;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	owner = mil_100_halvor;
	scemeName = "MAP";
	description = name;
	text[1] = "Halvor's Kochbuch mit einer";
	text[2] = "Reihe schmackhafter Rezepte";
	text[3] = "aus Fleisch.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_recipe_meat;
};

instance ITKE_HALVOR(C_Item)
{
	name = "Halvor's Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	value = 0;
	description = name;
	text[0] = "Dieser Schlüssel öffnet die Zutatentruhe in";
	text[1] = "Halvor's Küche.";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITKE_JAIL(C_Item)
{
	name = "Kerkerschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	value = 0;
	description = name;
	text[0] = "Der Schlüssel für die ";
	text[1] = "Kerkerzellen ";
	text[4] = NAME_Value;
	count[4] = value;
};


const int VALUE_STINKINGSALT = 50;

instance ITMI_STINKINGSALT(C_Item)
{
	name = "Müffelsalz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_STINKINGSALT;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Ein wirklich übelriechendes";
	text[1] = "bräunliches Salz.";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAR_SCROLLHEALPOSSESSED(C_Item)
{
	name = "alte Rezeptur";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_STONE;
	description = "versiegelte Schriftrolle";
	text[0] = "Sie ist versiegelt, aber";
	text[1] = "es scheint die Rezeptur zu";
	text[2] = "sein die Talamon sucht";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITFO_SLEEPWINE(C_Item)
{
	name = "Schlafwein";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItFo_Wine_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = usesleepwine;
	scemeName = "POTION";
	description = "Schlafwein";
};


func void usesleepwine()
{
};


instance ITWR_NEFARIUS_DIARY(C_Item)
{
	name = "Tagebuch-Seite";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_nefarius_diary;
	description = name;
	text[1] = "Eine stark verwitterte Seite, deren Schrift man";
	text[2] = "kaum noch entziffern kann.";
	text[3] = "Der ehemalige Besitzer scheint Nefarius der";
	text[4] = "Wassermagier gewesen zu sein.";
};


func void use_nefarius_diary()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_PrintLine(nDocID,0,"107. Tag");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLines(nDocID,0,"Milten und unser einstiger Held haben uns heute schmählich verraten! Sie haben hinter unserem Rücken die magische Energie aus dem grossen Erzhaufen in irgendein altes Artefakt gesaugt. All unsere Hoffnungen auf ein Entkommen aus der Barriere sind jetzt endgültig zerstört!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_PrintLine(nDocID,0,"129. Tag");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLines(nDocID,0,"Das Unglück ist über uns hereingebrochen! Obwohl die magische Barriere plötzlich verschwand, wurde unser Lager von schwersten Beben fast zerstört. Alle hier haben den Verstand verloren und massakrieren sich gegenseitig. Ich muss weg von hier...");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_PrintLine(nDocID,0,"130. Tag");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLines(nDocID,0,"Wir werden heute nacht bei Cavelorn in seiner Hütte bleiben, und morgen weiterziehen. Ich hoffe nur, dass keine Orkhorden mehr durch diese Gegend ziehen...");
	Doc_Show(nDocID);
};


instance ITWR_BULLIT_NOTE(C_Item)
{
	name = "Notiz von Bullit";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_bullit_note;
	description = name;
	text[1] = "Eine stark verwitterte Seite, deren Schrift man";
	text[2] = "kaum noch entziffern kann.";
	text[3] = "Der ehemalige Besitzer scheint ein Gardist";
	text[4] = "Namens Bullit gewesen zu sein.";
};


func void use_bullit_note()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_PrintLine(nDocID,0,"Notiz");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLines(nDocID,0,"Gomez ist wahnsinnig geworden! Er will doch tatsächlich,dass wir Gardisten alle Feuermagier hinterrücks umbringen, nur weil Corristo, dieser Narr von Erzmagier, sich offen gegen ihn ausgesprochen hat.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Besser ich schaffe einige Vorräte beiseite. Für schlechte Zeiten. Man kann nie wissen was kommt.");
	Doc_Show(nDocID);
};


instance ITWR_PHOENIX1(C_Item)
{
	name = "Die Spur des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix1;
	scemeName = "MAP";
	description = name;
	text[1] = "Ein vergilbtes Buch mit brüchigen Seiten.";
	text[2] = "Sein Verfasser scheint ein Feuermagier";
	text[3] = "mit Namen Corristo gewesen zu sein.";
};


func void use_phoenix1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Spur des Phoenix");
	Doc_PrintLine(nDocID,0,"------------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLines(nDocID,0,"Der Sturm zieht auf. Ich weiss es und kann doch nicht dagegen ankämpfen. Ich selbst verhalf einst dem Sturm zu seiner Macht und sonnte mich in seinem Glanz. Doch nun ist der Bund mit dem Sturm zum Pakt mit dem Teufel geworden und meine Seele ist verloren.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doch das Feuer wird weiterbestehen, muss weiterbestehen. Sein  Wissen wird sich erheben wie ein Phoenix aus der Asche. Derjenige, der gewillt ist, der Spur des Phoenix zu folgen, wird die Wiederauferstehung des Wissens über das Feuer erleben.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Spur des Phoenix beginnt in den tiefsten Tiefen seines runden Hortes. Dort, wo der Bund mit dem Sturm begann liegt die Asche des Phoenix begraben.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 0)
	{
		Log_CreateTopic(CH1_PHOENIX,LOG_MISSION);
		Log_SetTopicStatus(CH1_PHOENIX,LOG_RUNNING);
		B_LogEntry(CH1_PHOENIX,"Offensichtlich ahnte der oberste Feuermagier Corristo, dass ihm übles wiederfahren wird, und hat eine rätselhafte 'Spur des Phoenix' gelegt. Am Ende dieser Spur soll das 'Wissen des Feuers' zu finden sein, was immer der ermordete Zauberer auch damit meinte.");
		Wld_InsertItem(itwr_phoenix2,"FP_SPAWN_PHOENIX_2");
		PHOENIX_STATE = 1;
	};
};


instance ITWR_PHOENIX2(C_Item)
{
	name = "Die Asche des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix2;
	scemeName = "MAP";
	description = name;
	text[1] = "Dies ist der zweite Teil der";
	text[2] = "rätselhaften Spur des Phoenix";
	text[3] = "die Corristo verfasst hat.";
};


func void use_phoenix2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Die Asche des");
	Doc_PrintLine(nDocID,0,"Phoenix");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Einst, als ich den Kindern des Sturmes zur Macht verhalf, fegten sie ihre Unterdrücker hinweg. Doch ihre Grausamkeit stand der, der Unterdrücker in nichts nach.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Sie raubten, mordeten und trieben die Schwachen zu unwürdiger Arbeit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Was einst felsenfest verbunden war, brach durch die Macht des Sturms entzwei. An dieser Stelle beginnt der Aufstieg der Macht des Feuers, gleich dem Aufstieg des Phoenix. Doch der Phoenix hat an der Stelle des Bruches eine Feder hinterlassen. Die Feder des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 1)
	{
		B_GiveXP(XP_PHOENIX2);
		B_LogEntry(CH1_PHOENIX,"Ich habe das zweite Buch von der 'Spur des Phoenix' gefunden. Es spricht von einem Bruch, der etwas 'felsenfest Verbundenes durch die Macht des Sturmes entzweite'.");
		Wld_InsertItem(itwr_phoenix3,"FP_SPAWN_PHOENIX_3");
		PHOENIX_STATE = 2;
	};
};


instance ITWR_PHOENIX3(C_Item)
{
	name = "Die Feder des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix3;
	scemeName = "MAP";
	description = name;
	text[1] = "Der dritte Teil der Spur des";
	text[2] = "Phoenix von Corristo dem";
	text[3] = "obersten Feuermagier.";
};


func void use_phoenix3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Die Feder des");
	Doc_PrintLine(nDocID,0,"Phoenix");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Kinder des Sturms wurden zu den neuen Unterdrückern und die Macht des Feuers stärkte sie. Nichts war vor der Gier des Sturms sicher.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schon bald versammelten sich die Unzufriedenen und verliessen den Hort. Sie wurden von der Weisheit des Wassers hinfortgetragen und von seiner Macht beschützt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dort, wo die Macht des Wassers den Hort verlässt, findest du die Wellen des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 2)
	{
		B_GiveXP(XP_PHOENIX3);
		B_LogEntry(CH1_PHOENIX,"Das dritte Buch von der 'Spur des Phoenix' ist nicht minder rätselhaft. Ich soll nach einer Stelle suchen, an der 'die Macht des Wassers den Hort verlässt'.");
		Wld_InsertItem(itwr_phoenix4,"FP_SPAWN_PHOENIX_4");
		PHOENIX_STATE = 3;
	};
};


instance ITWR_PHOENIX4(C_Item)
{
	name = "Die Wellen des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix4;
	scemeName = "MAP";
	description = name;
	text[1] = "Der vierte Teil der Spur des";
	text[2] = "Phoenix von Corristo dem";
	text[3] = "obersten Feuermagier.";
};


func void use_phoenix4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Die Wellen des");
	Doc_PrintLine(nDocID,0,"Phoenix");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"So errichteten Die Kinder des Sturmes um sich herum hohe Dämme um sich vor den Wogen des Wassers zu schützen. Sie hielten Ausschau nach ihren einstigen Leidensgenossen und trieben die Verbliebenen erbarmungslos zu harter Arbeit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Der anfänglich so reine Sturm der Gerechtigkeit wandelte sein Gesicht und wurde schlimmer als das, was er einst ersetzte.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Beschreite den Damm und halte nach den Wogen des Wassers Ausschau. Dann wirst du vielleicht auch die Sehnsucht des Phoenix erblicken können.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 3)
	{
		B_GiveXP(XP_PHOENIX4);
		B_LogEntry(CH1_PHOENIX,"Das vierte Buch von der 'Spur des Phoenix' wird immer rätselhafter. Es spricht davon, dass man auf einem Damm Ausschau halten soll, um die 'Sehnsucht des Phoenix' erblicken zu können.");
		Wld_InsertItem(itwr_phoenix5,"FP_SPAWN_PHOENIX_5");
		PHOENIX_STATE = 4;
	};
};


instance ITWR_PHOENIX5(C_Item)
{
	name = "Die Sehnsucht des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix5;
	scemeName = "MAP";
	description = name;
	text[1] = "Der fünfte Teil der Spur des";
	text[2] = "Phoenix verfasst von Corristo.";
};


func void use_phoenix5()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Die Sehnsucht");
	Doc_PrintLine(nDocID,0,"des Phoenix");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zuerst versteckten sich die Kinder des Wassers, die aus dem Hort flohen. Sie suchten Zuflucht in versteckten Höhlen, doch schon bald fanden sie einen eigenen Hort, der sie vor dem Zorn des Sturms schützte. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nicht alle Höhlen kann man trockenen Fusses betreten. Doch genau diese Höhlen sind oft die besten Verstecke. Der feurige Phoenix hasst solche Höhlen, hat er doch Angst vor dem fliessenden Element. Solche Höhlen sind der Alptraum des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 4)
	{
		B_GiveXP(XP_PHOENIX5);
		B_LogEntry(CH1_PHOENIX,"Das fünfte Buch von der 'Spur des Phoenix' erzählt davon, dass Höhlen, die man nicht trockenen Fusses erreichen kann, der Alptraum eines jeden Phoenix sind.");
		Wld_InsertItem(itwr_phoenix6,"FP_SPAWN_PHOENIX_6");
		PHOENIX_STATE = 5;
	};
};


instance ITWR_PHOENIX6(C_Item)
{
	name = "Der Alptraum des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix6;
	scemeName = "MAP";
	description = name;
	text[1] = "Der sechste Teil der Spur des";
	text[2] = "Phoenix verfasst von Corristo.";
};


func void use_phoenix6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Der Alptraum");
	Doc_PrintLine(nDocID,0,"des Phoenix");
	Doc_PrintLine(nDocID,0,"--------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schon bald riss der Schnabel des Sturmes aufs neue Fleisch aus seiner eigenen Seite und dieses Fleisch wurde zu den Kindern des Geistes. Sie versteckten sich in felsigen Höhlen, bevor sie ein eigenen Hort inmitten von Schlamm und Ungeziefer gründeten.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dies war die Geburts- stunde unseres eigenen Untergangs, denn die Macht des Geistes erschütterte das Gefüge der Welt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der Phoenix zieht seine Jungen in einem Felsennest in luftiger Höhe auf. Dort wo kein Weg hinführt, brennt das feurige Nest des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 5)
	{
		B_GiveXP(XP_PHOENIX6);
		B_LogEntry(CH1_PHOENIX,"Das sechste Buch von der 'Spur des Phoenix' spricht von einem 'brennenden Felsennest in luftiger Höhe', dem Nest des Phoenix.");
		Wld_InsertItem(itwr_phoenix7,"FP_SPAWN_PHOENIX_7");
		Wld_SetObjectRoutine(0,0,"FIRE_OW_PHOENIX_NEST",1);
		Wld_SetObjectRoutine(12,0,"FIRE_OW_PHOENIX_NEST",1);
		PHOENIX_STATE = 6;
	};
};


instance ITWR_PHOENIX7(C_Item)
{
	name = "Das Nest des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix7;
	scemeName = "MAP";
	description = name;
	text[1] = "Der siebente Teil der Spur des";
	text[2] = "Phoenix verfasst von Corristo.";
};


func void use_phoenix7()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Das Nest");
	Doc_PrintLine(nDocID,0,"des Phoenix");
	Doc_PrintLine(nDocID,0,"-------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"So zogen die Jahre ins Land und der Zorn des Sturmes wetteiferte mit den Wogen des Wassers und den Kindern des Geistes. Das Feuer, dass einst den Sturm so eifrig ernährte, wurde immer schwächer und heute lodert es nur noch unbedeutend.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vorkehrungen müssen getroffen werden, um das Wissen des Feuers zu bewahren.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Neigen sich die Tage eines Phoenix seinem Ende, so lässt er sich am höchsten Ort seines Hortes nieder und erwartet das Unausweichliche. Er erwartet dort den Tod des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 6)
	{
		B_GiveXP(XP_PHOENIX7);
		B_LogEntry(CH1_PHOENIX,"Das siebente Buch beschreibt den Tod des Phoenix am höchsten Ort seines Hortes.");
		Wld_InsertItem(itwr_phoenix8,"FP_SPAWN_PHOENIX_8");
		PHOENIX_STATE = 7;
	};
};


instance ITWR_PHOENIX8(C_Item)
{
	name = "Der Tod des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenix8;
	scemeName = "MAP";
	description = name;
	text[1] = "Der achte Teil der Spur des";
	text[2] = "Phoenix verfasst von Corristo.";
};


func void use_phoenix8()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Der Tod des");
	Doc_PrintLine(nDocID,0,"Phoenix");
	Doc_PrintLine(nDocID,0,"-------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das Gefüge der Welt bebte. Erst langsam und schwach, dann immer öfter und immer heftiger. Das Ende ist nah, dessen bin ich mir sicher. Weder Sturm noch Wasser noch Geist erkennen es. Doch das Feuer weiss um die Wahrheit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Es muss weiterbestehen. Es war immer so. Es wird immer so sein.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Das Leben des Phoenix ist ein immerwährender Kreislauf. Er kehrt stets dorthin zurück, wo er einst begonnen hat, um sich aus der Asche wieder zu neuem Leben zu erheben. Dies ist die Auferstehung des Phoenix.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE == 7)
	{
		B_GiveXP(XP_PHOENIX8);
		B_LogEntry(CH1_PHOENIX,"Das achte Buch klingt wie der Abschluss der 'Spur des Phoenix'. Nur ist dieser Hinweis der rätselhafteste von allen.");
		PHOENIX_STATE = 8;
	};
};


instance ITWR_PHOENIXCHEAT(C_Item)
{
	name = "Der Cheat des Phoenix";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_phoenixcheat;
	scemeName = "MAP";
	description = name;
	text[1] = "Der achte Teil der Spur des";
	text[2] = "Phoenix verfasst von Corristo.";
};


func void use_phoenixcheat()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Der Cheat");
	Doc_PrintLine(nDocID,0,"des Phoenix");
	Doc_PrintLine(nDocID,0,"-------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wer keine Lust hat, nach allen 8 Phoenix-Büchern zu suchen, der muss es auch nicht.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dieses Buch schaltet die Geheime Kammer auch sofort frei.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"BlaBlaBa");
	Doc_Show(nDocID);
	PHOENIX_STATE = 8;
};


instance ITPO_ELEXIROFMIND(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItFo_Potion_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = use_elexirofmind;
	scemeName = "POTIONFAST";
	description = "ELIXIER DES GEISTES";
	text[0] = "Dies ist das Elixier, das Xardas benötigt";
	text[1] = "Ich weiss nicht wie es genau wirkt, aber";
	text[2] = "ich sollte es auf KEINEN Fall trinken";
	text[3] = "bevor ich mit Xardas gesprochen habe!";
};


func void use_elexirofmind()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"Use_ElexirOfMind");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};


instance ITFO_PLACEBO(C_Item)
{
	name = "Klarer Trank";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItFo_Potion_Water_01.3ds";
	material = MAT_GLAS;
	description = name;
	text[0] = "Diese flüssige Substanz ist so rein und klar";
	text[1] = "dass man ihr alle möglichen Fähigkeiten";
	text[2] = "zutrauen könnte.";
};

instance ITWR_BLOODTHISTLE(C_Item)
{
	name = "Abschrift";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_bloodthistle;
	description = name;
	text[1] = "Eine stark verwitterte Seite, deren Schrift man";
	text[2] = "noch erstaunlich gut entziffern kann.";
};


func void use_itwr_bloodthistle()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das Kraut, das den Namen Blutdistel trägt, sucht sich zum Wachsen meist die großen Wasserpflanzen.");
	Doc_PrintLines(nDocID,0,"In ihrem Schutz gedeihen sie reichlich an feuchten Ufern und sandigen Inseln, an Seen und Flüßen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Abschrift aus HEILKRAFT DER NATUR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"von Bota Niker");
	Doc_Show(nDocID);
	b_learnbloodthistle();
};


instance ITWR_HELVEGOR(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_helvegor;
	description = name;
	text[1] = "ein Brief von Osric an Helvegor ";
};


func void use_itwr_helvegor()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"HelvegoR, ");
	Doc_PrintLines(nDocID,0,"hier im lager wimmelt es nur so von dieben und gesindeL. du bist der einzige, dem ich noch vertraue.");
	Doc_PrintLines(nDocID,0,"falls mir etwas zustossen solLte, ich habe ein paar nützliche dinge in sichere verwahRung gebracht. erinnerst du dich noch an die zeit, als wir hier ankamen?");
	Doc_PrintLines(nDocID,0,"bevor wir für agon gearbeitet haben? Das gerüst ist Leer und verlassen, die aRbeiten sind eingestellt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Die Kombination steckt mittendrin. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"osric");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_GODS(C_Item)
{
	name = "Über die Götter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_gods;
	description = name;
	text[1] = "Sieht aus, wie eine Abschrift aus einem Buch";
};


func void use_itwr_gods()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Innos der Gott des Feuers und der Gesetzes");
	Doc_PrintLines(nDocID,0,"Wahrer der Ordnung ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Adanos Gott des Wassers und der Gerechtigkeit");
	Doc_PrintLine(nDocID,0,"Waagschale der Menschheit ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Beliar Gott des Todes und der Dunkelheit");
	Doc_PrintLine(nDocID,0,"Herrscher der Nacht ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Zusammen bilden sie die göttliche Dreifaltigkeit ");
	Doc_PrintLine(nDocID,0,"Den Ursprung der Welt, ihren Weg und ihr Ende");
	Doc_Show(nDocID);
	if(KNOWS_GODS == FALSE)
	{
		B_GiveXP(XP_KNOWSGODS);
		KNOWS_GODS = TRUE;
	};
};


instance ITWR_PALGUR(C_Item)
{
	name = "Seite";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_palgur;
	description = name;
	text[1] = "Ein einzelner Tagebuch Eintrag";
};


func void use_itwr_palgur()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Isgar hat seine Tränke herumstehen lassen. Wie unvorsichtig von ihm. Und wie gut, das es Diebe gibt, denen man es anhängen kann.");
	Doc_PrintLines(nDocID,0,"Die Tränke habe ich dort versteckt, wo viele hergehen, aber niemand bleibt.");
	Doc_PrintLines(nDocID,0,"Nur als reine Vorsichtsmassnahme. Wer weiß denn schon, was uns noch alles bevorsteht.");
	Doc_PrintLines(nDocID,0,"Talamon ist viel zu sehr mit seinen Forschungen beschäftigt, und Isgar ist nur darauf aus Silber zu kassieren, ");
	Doc_PrintLines(nDocID,0," als das sie an Massnahmen für den Fall eines Angriffes denken.");
	Doc_Show(nDocID);
};


instance ITWR_WORKER(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_worker;
	description = name;
	text[1] = "Ein Teil eines Briefes";
	text[2] = "ohne erkennbaren Anfang oder Ende";
};


func void use_itwr_worker()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Es ist furchtbar. Die Orks ziehen durchs Land und plündern die Dörfer. Auf dem Weg ins Tal von Khorinis haben wir einen Zug anderer Flüchtender gesehen. ");
	Doc_PrintLines(nDocID,0,"Sie sind den Orks in die Hände gefallen. Bei Innos, die Orks haben schreckliche Dinge mit ihnen getan. ");
	Doc_PrintLines(nDocID,0,"Innos sei Dank, zumindest haben wir es ins Lager geschafft. Der König ist ebenfalls hier im Tal. Das gibt vielen hier Mut und Kraft. ");
	Doc_PrintLines(nDocID,0,"Aber es gibt noch viel zu tun. Wir müssen den Wall wieder aufbauen, um uns vor den Orks zu schützen.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

