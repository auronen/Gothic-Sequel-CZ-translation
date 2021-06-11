///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE MIL_123_Osbert_EXIT   (C_INFO)
{
	npc         = MIL_123_Osbert;
	nr          = 999;
	condition   = MIL_123_Osbert_EXIT_Condition;
	information = MIL_123_Osbert_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT MIL_123_Osbert_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID MIL_123_Osbert_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOTCHA
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_GOTCHA		(C_INFO)
{
	npc		 = 	MIL_123_Osbert;
	condition	 = 	MIL_123_Osbert_GOTCHA_Condition;
	information	 = 	MIL_123_Osbert_GOTCHA_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_123_Osbert_GOTCHA_Condition ()
{
	if (!Npc_HasItems (hero, ItKe_Jail)>=1)
	&& ! Npc_KnowsInfo (hero,MIL_123_Osbert_THIEF)
	&&  Npc_KnowsInfo (hero,PC_Thief_STARTRAINING_THIEF)
	{
			return TRUE;
	};
};
func void MIL_123_Osbert_GOTCHA_Info ()
{

//	AI_Output			(self, hero, "MIL_123_GOTCHA_00_01"); //Halt! Was hast du hier zu suchen?
	AI_Output			(self, hero, "MIL_123_GOTCHA_00_01"); //Stát! Co tady pohledáváš?
//	AI_Output			(hero, self, "MIL_123_GOTCHA_15_02"); //Ich seh mich nur mal um.
	AI_Output			(hero, self, "MIL_123_GOTCHA_15_02"); //Jenom se tu rozhlížím
//	AI_Output			(self, hero, "MIL_123_GOTCHA_00_03"); //Umsehen- okay. Aber halt die Flossen still. Wenn du versuchst irgendwas mitgehen zu lassen, dann bekommst du Ärger.
	AI_Output			(self, hero, "MIL_123_GOTCHA_00_03"); //Rozhlížíš- dobře. Ale ruce pryč. Pokud bys chtěl něco vzít, budou potíže.	
//	AI_Output			(hero, self, "MIL_123_GOTCHA_15_04"); //Kein Problem, ich steck schon nichts ein...
	AI_Output			(hero, self, "MIL_123_GOTCHA_15_04"); //Žádný problém, nic nevezmu...
	AI_TurnAway 		(hero,self);
//	AI_Output			(hero, self, "MIL_123_GOTCHA_15_05"); //(halblaut) ...und wenn, dann würdest du es sowieso nicht mitkriegen...
	AI_Output			(hero, self, "MIL_123_GOTCHA_15_05"); //(polohlasně) ...pokud jo, stejně by sis toho nevšiml...

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info THIEF
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_THIEF		(C_INFO)
{
	npc		 = 	MIL_123_Osbert;
	condition	 = 	MIL_123_Osbert_THIEF_Condition;
	information	 = 	MIL_123_Osbert_THIEF_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;


};

func int MIL_123_Osbert_THIEF_Condition ()
{
	if Npc_HasItems (hero, ItKe_Jail)
	{
		return TRUE;
	};
};
func void MIL_123_Osbert_THIEF_Info ()
{
	AI_GotoNpc 			(self, hero);
//	AI_Output			(self, hero, "MIL_123_THIEF_00_01"); //Hab ich dich erwischt! Du hast doch bestimmt was mitgenommen!
	AI_Output			(self, hero, "MIL_123_THIEF_00_01"); //Dostal jsem tě! Určitě sis něco vzal!
	B_GiveInvItems		(hero, self,Itke_Jail,1);
//	AI_Output			(self, hero, "MIL_123_THIEF_00_02"); //Aha! Der Kerkerschlüssel, wußte ich es doch! Der bleibt hier! Und du verschwindest jetzt besser!
	AI_Output			(self, hero, "MIL_123_THIEF_00_02"); //Aha! Klíč od žaláře, věděl jsem to! Zůstane tady! A ty raději zmiz!

//	B_LogEntry			(CH1_TrainSneak,"Verdammt, jetzt hat Osbert den Schlüssel. Ich sollte Gerion darüber informieren.");
	B_LogEntry			(CH1_TrainSneak,"Zatraceně, teď má ten klíč Osbert. Měl bych o tom zpravit Geriona.");

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_123_Osbert_HI		(C_INFO)
{
	npc		 = 	MIL_123_Osbert;
	nr		 = 	23;
	condition	 = 	MIL_123_Osbert_HI_Condition;
	information	 = 	MIL_123_Osbert_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was gibt's Neues?";
	description	 = 	"Co je nového?";
};

func int MIL_123_Osbert_HI_Condition ()
{
	return TRUE;
};

func void MIL_123_Osbert_HI_Info ()
{
//	AI_Output			(hero, self, "MIL_123_HI_15_01"); //Was gibt's Neues?
	AI_Output			(hero, self, "MIL_123_HI_15_01"); //Co je nového?
//	AI_Output			(self, hero, "MIL_123_HI_07_02"); //Pass auf Bürschchen, mag ja sein das du ein Freund von Diego bist,...
	AI_Output			(self, hero, "MIL_123_HI_07_02"); //Dávej si pozor, chlapče, sice můžeš být Diegův kámoš...
//	AI_Output			(self, hero, "MIL_123_HI_07_03"); //...aber wenn ich dich beim Rumschnüffeln erwische, dann bist du dran!
	AI_Output			(self, hero, "MIL_123_HI_07_03"); //...ale pokud tě přistihnu, že tady čmucháš, přijdeš na řadu!	
};

















