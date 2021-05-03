
func int mob_book_hasbasics()
{
	if(hero.aivar[33] == AIV_AM_BOOK)
	{
		printdebugmobsi("MOB_BOOK_HasBasics...TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_BOOK_HasBasics...FALSE");
		return FALSE;
	};
};

func int mob_book_condition()
{
	self.aivar[33] = AIV_AM_BOOK;
	if(Npc_IsPlayer(self))
	{
		if(mob_book_hasbasics())
		{
			printdebugmobsi("MOB_BOOK_CONDITION...TRUE");
			return TRUE;
		};
	}
	else
	{
		return TRUE;
	};
};

func void mob_book_s0()
{
	printdebugmobsi("MOB_BOOK_S0");
};

func void mob_book_s1()
{
	var int nDocID;
	printdebugmobsi("MOB_BOOK_S1");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		nDocID = Doc_Create();
		PrintDebugInt(PD_ITEM_MOBSI,"DocNummer",nDocID);
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Formel der glühenden Kraft");
		Doc_PrintLine(nDocID,0,"--------------------------");
		Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Runen herzustellen war seit alters her den besten Magier vorbehaltne, in diesem Buch verraten sie ihre Geheimnisse über das Herstellen von Runen des Feuers");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Die niederen Tränke");
		Doc_PrintLine(nDocID,1,"---------------");
		Doc_PrintLines(nDocID,1,"Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Tränke stärkerer Energie");
		Doc_PrintLine(nDocID,1,"---------------");
		Doc_PrintLines(nDocID,1,"Um diese herzustellen ist ein geübter Alchemist von nöten");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Tränke großer Macht");
		Doc_PrintLine(nDocID,1,"---------------");
		Doc_PrintLines(nDocID,1,"Nur ein Meister der Alchemie ist fähig diese zu erzeugen");
		Doc_Show(nDocID);
	};
};


instance MOB_BOOK_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_book_hasbasics;
	information = mob_book_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func void mob_book_exit_info()
{
	AI_StopProcessInfos(hero);
	self.aivar[24] = FALSE;
	AI_Wait(self,10);
	AI_UseMob(self,SCEMENAME_BOOK,-1);
};

func void mob_book_autoexit()
{
	printdebugmobsi("MOB_BOOK_AutoExit");
	mob_book_exit_info();
};


instance MOB_BOOK(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_book_hasbasics;
	information = mob_book_info;
	important = TRUE;
	permanent = TRUE;
	description = "";
};


func void mob_book_info()
{
	if(c_npcisinvincible(hero))
	{
		Info_AddChoice(mob_book,"Buch lesen",showbook);
	};
};

func void showbook()
{
	var int nDocID;
	AI_Wait(self,3);
	nDocID = Doc_Create();
	PrintDebugInt(PD_ITEM_MOBSI,"DocNummer",nDocID);
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_BOOK_BIG);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Formel der glühenden Kraft");
	Doc_PrintLine(nDocID,0,"--------------------------");
	Doc_SetFont(nDocID,-1,FONT_BOOK_SMALL);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Runen herzustellen war seit alters her den besten Magier vorbehaltne, in diesem Buch verraten sie ihre Geheimnisse über das Herstellen von Runen des Feuers");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Die niederen Tränke");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Schon mit geringem Talent in der Alchemie ist es möglich diese herzustellen");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Tränke stärkerer Energie");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Um diese herzustellen ist ein geübter Alchemist von nöten");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Tränke großer Macht");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Nur ein Meister der Alchemie ist fähig diese zu erzeugen");
	Doc_Show(nDocID);
};

