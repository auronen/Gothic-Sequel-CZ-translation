//#################################################################################
//#################################################################################
//
//	Mobsi BOOK - Basisfunktionen
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	MOB_BOOK_HasBasics
///////////////////////////////////////////////////////////////////////////////////
func int	MOB_BOOK_HasBasics ()
{
	if 	(hero.aivar[AIV_ACTIVEMOBSI] == AIV_AM_BOOK)			// richtiges MOBSI?
	{
		PrintDebugMobsi	("MOB_BOOK_HasBasics...TRUE");
		return			TRUE;
	}
	else
	{
		PrintDebugMobsi	("MOB_BOOK_HasBasics...FALSE");
		return			FALSE;
	};
};

//#################################################################################
//#################################################################################
//
//	Mobsi BOOK - Spaceranbindung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Bedingung für das Benutzen
///////////////////////////////////////////////////////////////////////////////////
func int MOB_BOOK_CONDITION ()
{
	self.aivar[AIV_ACTIVEMOBSI] = AIV_AM_BOOK;

	if	Npc_IsPlayer(self)
	{
		if	MOB_BOOK_HasBasics()
		{
			PrintDebugMobsi	("MOB_BOOK_CONDITION...TRUE");
			return 			TRUE;
		};
	}
	else
	{
			return	TRUE;

	};
};

///////////////////////////////////////////////////////////////////////////////////
//	Triggerfunktion
///////////////////////////////////////////////////////////////////////////////////
func void MOB_BOOK_S0 ()
{
	PrintDebugMobsi			("MOB_BOOK_S0");
};

func void MOB_BOOK_S1 ()
{
	PrintDebugMobsi			("MOB_BOOK_S1");

	if	Npc_IsPlayer(self)
	{
		PrintDebugMobsi		("...vom SC benutzt");
		PrintGlobals		(PD_ITEM_MOBSI);

		self.aivar[AIV_INVINCIBLE] = TRUE;

		var int nDocID;
		//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
		nDocID = 	Doc_Create		()			  ;								// DocManager
		PrintDebugInt	(PD_ITEM_MOBSI, "DocNummer", nDocID);
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Formel der glühenden Kraft"			);
					Doc_PrintLine	( nDocID,  0, "--------------------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Runen herzustellen war seit alters her den besten Magier vorbehaltne, in diesem Buch verraten sie ihre Geheimnisse über das Herstellen von Runen des Feuers");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,  "Die niederen Tränke" );
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, "Tränke stärkerer Energie");
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Um diese herzustellen ist ein geübter Alchemist von nöten");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Tränke großer Macht");
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Nur ein Meister der Alchemie ist fähig diese zu erzeugen");
					Doc_Show		( nDocID );
	};
};








//#################################################################################
//#################################################################################
//
//	Mobsi BOOK - Abmeldung
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////////////////
instance MOB_BOOK_Exit (c_Info)
{
	npc				= PC_HERO;
	nr				= 999;
	condition		= MOB_BOOK_HasBasics;
	information		= MOB_BOOK_Exit_Info;
	important		= FALSE;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func VOID MOB_BOOK_Exit_Info()
{
	AI_StopProcessInfos (hero);
	self.aivar[AIV_INVINCIBLE] = FALSE;


	AI_Wait	(self, 10);
	AI_UseMob(self,SCEMENAME_BOOK,-1);
//	AI_RemoveItemFromSlot(self,"ZS_LEFTHAND");
};

///////////////////////////////////////////////////////////////////////////////////
//	Auomatische Abmeldung
///////////////////////////////////////////////////////////////////////////////////
func void MOB_BOOK_AutoExit ()
{
	PrintDebugMobsi			("MOB_BOOK_AutoExit");


		MOB_BOOK_Exit_Info	();
};

//#################################################################################
//#################################################################################
//
//	Mobsi BOOK - Produktion
//
//#################################################################################
//#################################################################################

///////////////////////////////////////////////////////////////////////////////////
//	Info 1
///////////////////////////////////////////////////////////////////////////////////
instance MOB_BOOK (c_Info)
{
	npc				= PC_HERO;
	nr				= 1;
	condition		= MOB_BOOK_HasBasics;
	information		= MOB_BOOK_Info;
	important		= TRUE;
	permanent		= TRUE;
	description		= "";
};

func VOID MOB_BOOK_Info()
{
	if ( C_NpcIsInvincible (hero))
	{
		Info_AddChoice (MOB_BOOK, "Buch lesen",        ShowBook);

		//AI_Wait	( self, 10);
		//MOB_BOOK_AutoExit();
	};
};


func void ShowBook ()
{
	AI_Wait(self,3);
	var int nDocID;
		//	!!! Hier noch die Zutaten in das Rezeptbuch eintragen
		nDocID = 	Doc_Create		()			  ;								// DocManager
		PrintDebugInt	(PD_ITEM_MOBSI, "DocNummer", nDocID);
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

					//1.Seite

  					Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   			); 	// -1 -> all pages
  					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "Formel der glühenden Kraft"			);
					Doc_PrintLine	( nDocID,  0, "--------------------------");
					Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Runen herzustellen war seit alters her den besten Magier vorbehaltne, in diesem Buch verraten sie ihre Geheimnisse über das Herstellen von Runen des Feuers");



					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1,  "Die niederen Tränke" );
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen");
					Doc_PrintLine	( nDocID,  1,  "" );
					Doc_PrintLine	( nDocID,  1, "Tränke stärkerer Energie");
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Um diese herzustellen ist ein geübter Alchemist von nöten");
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLine	( nDocID,  1, "Tränke großer Macht");
					Doc_PrintLine	( nDocID,  1, "---------------");
					Doc_PrintLines	( nDocID,  1, "Nur ein Meister der Alchemie ist fähig diese zu erzeugen");
					Doc_Show		( nDocID );
};
















