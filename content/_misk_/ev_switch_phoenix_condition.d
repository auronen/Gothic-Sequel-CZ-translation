
func int ev_switch_phoenix_condition()
{
	printdebugmobsi("EV_PHOENIX_CONDITION");
	if(PHOENIX_STATE < 8)
	{
		PrintScreen(_STR_MESSAGE_PHOENIX_NOTYET,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
		return FALSE;
	}
	else
	{
		return TRUE;
	};
};

func void ev_book_phoenix_s1()
{
	var int nDocID;
	printdebugmobsi("EV_BOOK_PHOENIX_S1");
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Widerauferstehung");
	Doc_PrintLine(nDocID,0,"des Phoenix");
	Doc_PrintLine(nDocID,0,"-------------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Du hast das Rätsel des Phoenix entschlüsselt. Du bist würdig, das Wissen des Feuers an dich zu nehmen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bewahre das Wissen und vergeude es nicht sinnlos. Dies ist der letzte Hort des Feuers innerhalb der Barriere.");
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
	Doc_PrintLines(nDocID,1,"Der Phoenix hat sich aus seiner Asche erhoben, und die Macht des Feuers erstrahlt in neuem Glanz. Dies ist der Kreislauf des Lebens. Es war immer so. Es wird immer so sein.");
	Doc_Show(nDocID);
	if(PHOENIX_STATE < 9)
	{
		B_GiveXP(XP_PHOENIX9);
		B_LogEntry(CH1_PHOENIX,"Ich habe die Geheime Kammer der Feuermagier gefunden. Doch Corristo warnte im letzten Buch davor, das Wissen zu verschwenden, denn es sei 'der letzte Hort des Feuers innerhalb der Barriere'.");
		Log_SetTopicStatus(CH1_PHOENIX,LOG_SUCCESS);
		PHOENIX_STATE = 9;
	};
};

