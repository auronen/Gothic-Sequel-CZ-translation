/*****************************************************************************************
 * 
 * Tento dopis testuje nové fonty s diakritikou 
 * This letter tests new czech fonts
 * "font_old_20_white.tga"
 * "font_old_10_white.tga"
 * 
 ****************************************************************************************/ 
 
 INSTANCE test_text1(C_Item)
{
	name 				=	"Testující dopis";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_test_text1;
	
	TEXT[0]				=	"Tento dopis testuje";
	TEXT[1]				=	"české znaky.";
	description			=	name;
	
};

FUNC void Use_test_text1()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				Doc_PrintLines	(nDocID,  0, "Příliš žluťoučký kůň úpěl ďábelské ódy.");
				Doc_PrintLines	(nDocID,  0, "PŘÍLIŠ ŽLUŤOUČKÝ KŮŇ ÚPĚL ĎÁBELSKÉ ÓDY.");
				Doc_PrintLines	(nDocID,  0, "1234567890!#$%&()+,-./:;<=>?@ \_{|}~‚„‘a’a“a”–™§©®");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, "font_old_20_white.tga");
				Doc_PrintLines	(nDocID,  0, "Příliš žluťoučký kůň úpěl ďábelské ódy.");
				Doc_PrintLines	(nDocID,  0, "PŘÍLIŠ ŽLUŤOUČKÝ KŮŇ ÚPĚL ĎÁBELSKÉ ÓDY.");
				Doc_PrintLines	(nDocID,  0, "1234567890!#$%&()+,-./:;<=>?@ \_{|}~‚„‘a’a“a”–™§©®");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_SetFont 	(nDocID, -1, "font_old_10_white.tga");
				Doc_PrintLines	(nDocID,  0, "Příliš žluťoučký kůň úpěl ďábelské ódy.");
				Doc_PrintLines	(nDocID,  0, "PŘÍLIŠ ŽLUŤOUČKÝ KŮŇ ÚPĚL ĎÁBELSKÉ ÓDY.");
				Doc_PrintLines	(nDocID,  0, "1234567890!#$%&()+,-./:;<=>?@ \_{|}~‚„‘a’a“a”–™§©®");
				Doc_PrintLine	(nDocID,  0, "");
				Doc_PrintLine	(nDocID,  0, "         VaanaCZ & Auronen & Tým™");
				Doc_Show		(nDocID);

	Diego_LetterRead = TRUE;
};