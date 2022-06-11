// This variable is a workaround for a bug -> function Npc_KnowsInfo() doesn't work on permanent = TRUE dialogues
// BF_ prefix is used on all newly introduced variables
const int BF_Jose_Knows = FALSE; 

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE BEG_701_Jose_EXIT   (C_INFO)
{
	npc         = BEG_701_Jose;
	nr          = 999;
	condition   = BEG_701_Jose_EXIT_Condition;
	information = BEG_701_Jose_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT BEG_701_Jose_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID BEG_701_Jose_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance BEG_701_Jose_HI		(C_INFO)
{
	npc		 = 	BEG_701_Jose;
	nr		 = 	1;
	condition	 = 	BEG_701_Jose_HI_Condition;
	information	 = 	BEG_701_Jose_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tu děláš?";
};

func int BEG_701_Jose_HI_Condition ()
{
	return TRUE;
};

func void BEG_701_Jose_HI_Info ()
{
//	AI_Output			(hero, self, "BEG_701_HI_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "BEG_701_HI_15_01"); //Co tu děláš?
//	AI_Output			(self, hero, "BEG_701_HI_02_02"); //Ich schau mir an wer hier ein und ausgeht. Die Soldaten achten nicht auf alles. Ich schon. 
	AI_Output			(self, hero, "BEG_701_HI_02_02"); //Dívám se, kdo sem přichází a odchází. Vojáci nedávají pozor na všechno, já ano.
//	AI_Output			(hero, self, "BEG_701_HI_15_03"); //Und warum?
	AI_Output			(hero, self, "BEG_701_HI_15_03"); //A proč?
//	AI_Output			(self, hero, "BEG_701_HI_02_04"); //Es gibt immer jemanden der bereit ist, für Neuigkeiten zu bezahlen. 
	AI_Output			(self, hero, "BEG_701_HI_02_04"); //Vždycky se najde někdo, kdo je ochoten za novinky zaplatit.
	
	BF_Jose_Knows = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info NEWS
///////////////////////////////////////////////////////////////////////
instance BEG_701_Jose_NEWS		(C_INFO)
{
	npc		 = 	BEG_701_Jose;
	nr		 = 	13;
	condition	 = 	BEG_701_Jose_NEWS_Condition;
	information	 = 	BEG_701_Jose_NEWS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Und, gibt's was Neues?";
	description	 = 	"A, co je nového?";
};

func int BEG_701_Jose_NEWS_Condition ()
{	
//	if Npc_KnowsInfo (hero, BEG_701_Jose_HI 
//	&& (Beggars_Secrets >= 3) ) 
	if (BF_Jose_Knows //a bug fix introduced by the czech translation team
	&& (Beggars_Secrets >= 3) ) 
	{
		return TRUE;
	};
};
func void BEG_701_Jose_NEWS_Info ()
{
//	AI_Output			(hero, self, "BEG_701_NEWS_15_01"); //Und, gibt's was Neues?
	AI_Output			(hero, self, "BEG_701_NEWS_15_01"); //A, co je nového?
//	AI_Output			(self, hero, "BEG_701_NEWS_02_02"); //Es gibt immer was Neues. Bei so viel Verrückten hier...
	AI_Output			(self, hero, "BEG_701_NEWS_02_02"); //Tady je pořád něco nového. S tolika šílenými lidmi tady všude kolem....
//	AI_Output			(hero, self, "BEG_701_NEWS_15_03"); //Wie meinst du das?
	AI_Output			(hero, self, "BEG_701_NEWS_15_03"); //Jak to myslíš?
//	AI_Output			(self, hero, "BEG_701_NEWS_02_04"); //Zum Beispiel Bromor. Der Baumeister sammelt Trophäen von Tieren.
	AI_Output			(self, hero, "BEG_701_NEWS_02_04"); //Například Bromor. Stavitel a sbírá zvířecí trofeje.
//	AI_Output			(self, hero, "BEG_701_NEWS_02_05"); //Und die meisten anderen trauen sich selber nicht über den Weg. Alles Verrückte! 
	AI_Output			(self, hero, "BEG_701_NEWS_02_05"); //A většina ostatních si vůbec nedůvěřují. Všechno je šílené!
//	AI_Output			(self, hero, "BEG_701_NEWS_02_06"); //Und ich bin mittendrin und krieg alles mit. Das ist besser als Arenakämpfe ansehen. 
	AI_Output			(self, hero, "BEG_701_NEWS_02_06"); //A já jsem tu uprostřed toho všeho a všechno pozoruji.
};
