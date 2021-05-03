
instance WRK_201_GORDIAN_EXIT(C_Info)
{
	npc = wrk_201_gordian;
	nr = 999;
	condition = wrk_201_gordian_exit_condition;
	information = wrk_201_gordian_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int wrk_201_gordian_exit_condition()
{
	return TRUE;
};

func void wrk_201_gordian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_201_GORDIAN_HI(C_Info)
{
	npc = wrk_201_gordian;
	condition = wrk_201_gordian_hi_condition;
	information = wrk_201_gordian_hi_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_201_gordian_hi_condition()
{
	return TRUE;
};

func void wrk_201_gordian_hi_info()
{
	AI_Output(self,hero,"Wrk_201_HI_09_01");	//Äh, oh,... was willst du von mir?
};


instance WRK_201_GORDIAN_FIRST(C_Info)
{
	npc = wrk_201_gordian;
	nr = 10;
	condition = wrk_201_gordian_first_condition;
	information = wrk_201_gordian_first_info;
	description = "Wer bist du?";
};


func int wrk_201_gordian_first_condition()
{
	return TRUE;
};

func void wrk_201_gordian_first_info()
{
	AI_Output(other,self,"Wrk_201_Gordian_FIRST_Info_15_01");	//Wer bist du?
	AI_Output(self,other,"Wrk_201_Gordian_FIRST_Info_09_02");	//Mein Name ist Gordian. Schriftgelehrter und Schreiber. Ich erstelle Abschriften.
};


instance WRK_201_GORDIAN_POSSESSEDRECIPE(C_Info)
{
	npc = wrk_201_gordian;
	nr = 5;
	condition = wrk_201_gordian_possessedrecipe_condition;
	information = wrk_201_gordian_possessedrecipe_info;
	description = "Ich suche eine Rezeptur für die Heiler";
	permanent = FALSE;
};


func int wrk_201_gordian_possessedrecipe_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_recipeformoney) && !Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void wrk_201_gordian_possessedrecipe_info()
{
	AI_Output(hero,self,"Wrk_201_POSSESSEDRECIPE_15_01");	//Ich suche eine Rezeptur für die Heiler
	AI_Output(self,hero,"Wrk_201_POSSESSEDRECIPE_09_02");	//Talamon hat Dich geschickt, was? Er ist zu ungeduldig!
	AI_Output(self,hero,"Wrk_201_POSSESSEDRECIPE_09_03");	//Ich hab mir schon viele Nächte um die Ohren geschlagen, um Hinweise darüber zu entdecken!
	AI_Output(hero,self,"Wrk_201_POSSESSEDRECIPE_15_04");	//Was hast du herausgefunden?
	AI_Output(self,hero,"Wrk_201_POSSESSEDRECIPE_09_05");	//Für diese Informationen scheinen mir 15 Silber angemessen zu sein. Ich hatte schließlich viel Arbeit!
};


instance WRK_201_GORDIAN_PAYFORINFO(C_Info)
{
	npc = wrk_201_gordian;
	nr = 5;
	condition = wrk_201_gordian_payforinfo_condition;
	information = wrk_201_gordian_payforinfo_info;
	important = FALSE;
	permanent = TRUE;
	description = "(15 Silber für die Information bezahlen)";
};


func int wrk_201_gordian_payforinfo_condition()
{
	if(Npc_KnowsInfo(hero,wrk_201_gordian_possessedrecipe))
	{
		return TRUE;
	};
};

func void wrk_201_gordian_payforinfo_info()
{
	if(Npc_HasItems(hero,itmi_silver) >= 15)
	{
		B_GiveInvItems(hero,self,itmi_silver,15);
		AI_Output(hero,self,"Wrk_201_PAYFORINFO_15_01");	//Na gut, erzähl mir was du weisst.
		AI_Output(self,hero,"Wrk_201_PAYFORINFO_09_02");	//Die Feuermagier haben an einer Rezeptur, wie Talamon sie sucht, gearbeitet.
		AI_Output(self,hero,"Wrk_201_PAYFORINFO_09_03");	//Ich habe die gesamte Bibliothek im Magierhaus auf den Kopf gestellt.
		AI_Output(self,hero,"Wrk_201_PAYFORINFO_09_04");	//Aber alle Bücher drehen sich um irgendwelche abstrusen Themen, die ...äusserst... mystisch formuliert sind!
		AI_Output(self,hero,"Wrk_201_PAYFORINFO_09_05");	//Ts ts, Magier halt. Es ist zum Verzweifeln, aber ich werde aus diesen Büchern einfach nicht schlau.
		AI_Output(hero,self,"Wrk_201_PAYFORINFO_15_06");	//(ungläubig) Das ist alles ???
		AI_Output(self,hero,"Wrk_201_PAYFORINFO_09_07");	//Ist vielleicht nicht viel, aber es war harte Arbeit das herauszufinden.
		wrk_201_gordian_payforinfo.permanent = FALSE;
		B_LogEntry(CH1_LEARNALCHEMY,"Gordian war keine grosse Hilfe. Er suchte erfolglos nach Hinweisen in der Bibliothek des Magierhauses. Aber vielleicht hat er etwas übersehen.");
	}
	else
	{
		B_Say(self,hero,"$NotEnoughSilver");
		AI_StopProcessInfos(self);
	};
};


instance WRK_201_GORDIAN_WRITEBOOK(C_Info)
{
	npc = wrk_201_gordian;
	nr = 5;
	condition = wrk_201_gordian_writebook_condition;
	information = wrk_201_gordian_writebook_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich brauche eine Abschrift dieses Buches";
};


func int wrk_201_gordian_writebook_condition()
{
	if(Npc_KnowsInfo(other,hlr_501_talamon_learnalchemy) && !INT_BOOKWRITTEN)
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_201_gordian_writebook_info()
{
	AI_Output(hero,self,"Wrk_201_WRITEBOOK_15_01");	//Ich brauche eine Abschrift dieses Buches.
	AI_Output(self,hero,"Wrk_201_WRITEBOOK_09_02");	//Kein Problem. Das kostet 15 Silber.
	Info_ClearChoices(wrk_201_gordian_writebook);
	Info_AddChoice(wrk_201_gordian_writebook,"(15 Silber geben)",wrk_201_gordian_writebook_yes);
	Info_AddChoice(wrk_201_gordian_writebook,"Ich überleg's mir.",wrk_201_gordian_writebook_no);
};

func void wrk_201_gordian_writebook_no()
{
	AI_Output(hero,self,"Wrk_201_WRITEBOOK_No_15_01");	//Ich überleg's mir.
	AI_StopProcessInfos(self);
};

func void wrk_201_gordian_writebook_yes()
{
	AI_Output(hero,self,"Wrk_201_WRITEBOOK__15_01");	//Der Preis klingt angemessen.
	if(Npc_HasItems(hero,itmi_silver) >= 15)
	{
		if(Npc_HasItems(hero,itwr_book_healingpotions) >= 1)
		{
			AI_Output(self,hero,"Wrk_201_WRITEBOOK__09_02");	//Hier ist deine Abschrift.
			INT_BOOKWRITTEN = TRUE;
			CreateInvItem(self,itwr_book_healingpotions);
			B_GiveInvItems(hero,self,itmi_silver,15);
			B_GiveInvItems(self,hero,itwr_book_healingpotions,1);
		}
		else
		{
			AI_Output(self,hero,"Wrk_201_WRITEBOOK_09_03");	//Wenn Du kein Buch hast, kann ich auch keine Abschrift anfertigen.
		};
	}
	else
	{
		AI_Output(self,hero,"Wrk_201_WRITEBOOK_09_04");	//Komm wieder, wenn Du genug Geld hast
	};
	AI_StopProcessInfos(self);
};

