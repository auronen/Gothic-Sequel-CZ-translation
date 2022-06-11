/////////////////////////////////////////////////////////////////
//	Verteilfunktionen für die Stimmen bei Diebstahl	(JP)
//	====================================================
//
//	- hier werden die Reaktionen auf Diebstahl für die einzelnen
//	Stimmnummern vorgenommen
//
//
///////////////////////////////////////////////////////////////////

instance  Thief_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Thief_Exit_Condition;
	information	=  Thief_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Thief_Exit_Condition()
{
	if (self.aivar[AIV_THEFTWITTNESS] > AIV_NODEED)
	{
		return TRUE;
	};
};
FUNC VOID  Thief_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// -------------------------------------------------------------------------
instance  Thief_ANGRY (C_INFO)
{
	nr				=  10;
	condition		= Thief_ANGRY_Condition;
	information		= Thief_ANGRY_Info;
//	description		= "Dreckiger Dieb";
	description		= "Zatracený zloději!";
	permanent		= TRUE;
	IMPORTANT		= TRUE;
};

FUNC int  Thief_ANGRY_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK,"Thief_ANGRY_Condition");
	if ((self.aivar[AIV_THEFTWITTNESS] > AIV_NODEED)
	&&	( Npc_GetPermAttitude	( self, other) == ATT_ANGRY )
	&&	C_NpcIsInvincible (hero))
	{
		PrintDebugNpc(PD_ZS_CHECK,"Thief_ANGRY_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

FUNC void  Thief_ANGRY_Info()
{
	Info_ClearChoices	(Thief_ANGRY);

	B_Say 	(self, other,"$YOUSTOLEFROMME");

	var string string_buildChoice;

//	string_buildChoice = ConcatStrings ("Tut mir leid! (", B_SilverAmountToSatisfy_String ());
	string_buildChoice = ConcatStrings ("Mrzí mě to! (dát ", B_SilverAmountToSatisfy_String ());
//	string_buildChoice = ConcatStrings (string_buildChoice,"Silber geben)");
	string_buildChoice = ConcatStrings (string_buildChoice," stříbra)");

	Info_AddChoice (Thief_Angry, string_buildChoice, Thief_Angry_Lieb);
//	Info_AddChoice (Thief_Angry,"(ignorieren)"	,Thief_Angry_HauAb);
	Info_AddChoice (Thief_Angry,"(ignorovat)"	,Thief_Angry_HauAb);
};



// -------------------------------------------------------------------------

FUNC VOID B_AssignTheftInfos (var c_NPC slf)
{

	PrintDebugNpc(PD_ZS_CHECK,"AssignTheftInfos");
	Thief_Exit.npc						= Hlp_GetInstanceID(slf);
	Thief_ANGRY.npc						= Hlp_GetInstanceID(slf);
};


func void Thief_Angry_Lieb ()
{
	PrintDebugNpc(PD_ZS_CHECK,"Thief_Angry_Lieb");

	if (B_HasPlayerSilverToSatisfy ())
	{
		// FIXME: Hier mal noch ein Svm rein, damit nicht nur Sachen getauscht werden
		// B_Say	(self, other, "$LetsForgetOurLittleFight");
		B_ExchangeMemoryAttitude ();
	}
	else
	{
		var string string_choice;
//		string_choice = ConcatStrings ("Nicht genug Silber, ich will ",B_SilverAmountToSatisfy_String ());
		string_choice = ConcatStrings ("To není dostatek stříbra, chci ",B_SilverAmountToSatisfy_String ());
		PrintScreen	(string_choice, -1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN);
	};
	AI_StopProcessInfos (self);
};

func void Thief_Angry_HauAb ()
// Spieler wählt Hau Ab-Option, die Attitüde des Nsc ändert sich nicht und er drückt dem SPieler noch einen Spruch
{
	B_Say	(self, other, "$YoullBeSorryForThis");

	AI_StopProcessInfos (self);
	AI_ContinueRoutine	(self);
};

func void Thief_Angry_NoMoney ()
{
	AI_StopProcessInfos (self);
};

