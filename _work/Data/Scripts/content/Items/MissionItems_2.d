//MISSION ITEMS_2


INSTANCE ItWr_Morogh_List(C_Item)
{
//	name 				=	"Liste von Morogh";
	name 				=	"Dopis od Morogha";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material			=	MAT_LEATHER;

	scemeName			=	"MAP";
	on_state[0]			=	Use_ItWr_Morogh_List;

	description			=	name;
//	TEXT[0]				=	"Liste mit Zutaten ";
//	TEXT[1]				=	"die Morogh benötigt";
//	TEXT[3]				=	"";
	TEXT[0]				=	"Seznam přísad, ";
	TEXT[1]				=	"které potřebuje Morogh";
	TEXT[3]				=	"";
};

FUNC void Use_ItWr_Morogh_List()
{
	var int nDocID;

	nDocID = 	Doc_Create		()			  ;
				Doc_SetPages	(nDocID,  1 );
				Doc_SetPage 	(nDocID,  0, "letters.TGA"  , 0);
				Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont 	(nDocID, -1, FONT_BOOK_SMALL);
				
//				Doc_PrintLine	(nDocID,  0, "Folgende Zutaten werden alsbald gebraucht:");
				Doc_PrintLine	(nDocID,  0, "Brzy budou zapotřebí následující ingredience:");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "9 Fläschchen reinster klarer Alkohol ");
				Doc_PrintLine	(nDocID,  0, "9 lahví nejčistšího čirého alkoholu ");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "7 Gewächse von der Art der Nachtschatten");
				Doc_PrintLine	(nDocID,  0, "7 rostlinek potměchuti");
				Doc_PrintLine	(nDocID,  0, "");
//				Doc_PrintLine	(nDocID,  0, "8 frische Steinwurzeln");
				Doc_PrintLine	(nDocID,  0, "8 čerstvých kamenných kořenů");
				
				
				Doc_Show		(nDocID);
};

