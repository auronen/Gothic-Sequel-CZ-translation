//////////////////////////////////////////////////////////////////////////
//	EV_PHOENIX.D
//	============
//	Funktionien für die Objekte zum Phoenix-Rätsel (geheimes Magierversteck)
//////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
// Kistenschalter im Schlafrauf des Magierhauses
///////////////////////////////////////////////////////////////////////
func int EV_SWITCH_PHOENIX_CONDITION ()
{
	PrintDebugMobsi		("EV_PHOENIX_CONDITION");

	if	(Phoenix_State < 8)
	{
		PrintScreen	(_STR_MESSAGE_PHOENIX_NOTYET, -1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
		return		FALSE;
	}
	else
	{
		return		TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
// Letzer Band als Standbuch im Geheimversteck
///////////////////////////////////////////////////////////////////////
func void EV_BOOK_PHOENIX_S1 ()
{
	PrintDebugMobsi		("EV_BOOK_PHOENIX_S1");

	var int nDocID;
	nDocID = 	Doc_Create		()			  ;									// DocManager

	Doc_SetPages	( nDocID,  2 );                         		//wieviel Pages

	Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		);
	Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);

	//1.Seite
	Doc_SetFont 	( nDocID, -1, FONT_BOOK_BIG	   		); 	// -1 -> all pages
	Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
	Doc_PrintLine	( nDocID,  0, "Widerauferstehung"			);
	Doc_PrintLine	( nDocID,  0, "des Phoenix"					);
	Doc_PrintLine	( nDocID,  0, "-------------------"			);
	Doc_SetFont 	( nDocID, -1, FONT_BOOK_SMALL	 		); 	// -1 -> all pages
	Doc_PrintLine	( nDocID,  0, "");
//	Doc_PrintLines	( nDocID,  0, "Du hast das Rätsel des Phoenix entschlüsselt. Du bist würdig, das Wissen des Feuers an dich zu nehmen.");
	Doc_PrintLines	( nDocID,  0, "Rozluštil jsi hádanku fénixe. Jsi hoden přijmout poznání Ohně.");
	Doc_PrintLine	( nDocID,  0, "");
//	Doc_PrintLines	( nDocID,  0, "Bewahre das Wissen und vergeude es nicht sinnlos. Dies ist der letzte Hort des Feuers innerhalb der Barriere.");
	Doc_PrintLines	( nDocID,  0, "Chovej jej v bezpečí a zbytečně jím nemrhej. Je to poslední útočiště Ohně v Bariéře.");


	//2.Seite
	Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1  	 		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
	Doc_PrintLine	( nDocID,  1, "");
//	Doc_PrintLines	( nDocID,  1, "Der Phoenix hat sich aus seiner Asche erhoben, und die Macht des Feuers erstrahlt in neuem Glanz. Dies ist der Kreislauf des Lebens. Es war immer so. Es wird immer so sein.");
	Doc_PrintLines	( nDocID,  1, "Fénix se znovu zrodil z popela a jeho mocný Oheň třpytivě zaří. To je kolběh života. Tak to vždy bylo a tak to vžy bude.");
	Doc_Show		( nDocID );

	if	(Phoenix_State < 9)
	{
			B_GiveXP			(XP_Phoenix9);
//			B_LogEntry			(CH1_Phoenix, "Ich habe die Geheime Kammer der Feuermagier gefunden. Doch Corristo warnte im letzten Buch davor, das Wissen zu verschwenden, denn es sei 'der letzte Hort des Feuers innerhalb der Barriere'.");
			B_LogEntry			(CH1_Phoenix, "Našel jsem tajnou komnatu Mágů ohně. Ale Corristo varoval v poslední knize před mrháním vědomostmi, neboť jsou 'poslední útočiště Ohně v Bariéře'.");
			Log_SetTopicStatus	(CH1_Phoenix, LOG_SUCCESS);
			Phoenix_State = 9;
	};
};







