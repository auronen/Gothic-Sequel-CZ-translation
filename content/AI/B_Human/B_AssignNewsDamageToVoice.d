/////////////////////////////////////////////////////////////////
//	Verteilfunktionen für die Stimmen bei Angriff	(JP)
//	====================================================
//
//	- hier werden die Reaktionen auf Angriff für die einzelnen
//	Stimmnummern vorgenommen
//
//
///////////////////////////////////////////////////////////////////

instance  Attacker_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Attacker_Exit_Condition;
	information	=  Attacker_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Attacker_Exit_Condition()
{
	if (self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	{
		return TRUE;
	};
};
FUNC VOID  Attacker_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// -------------------------------------------------------------------------
instance  Attacker_ANGRY (C_INFO)
{
	nr				=  10;
	condition		= Attacker_ANGRY_Condition;
	information		= Attacker_ANGRY_Info;
	permanent		= TRUE;
	IMPORTANT		= TRUE;
};

FUNC int  Attacker_ANGRY_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK,"Attacker_ANGRY_Condition");
	if ((self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	&&	( Npc_GetPermAttitude	( self, other) == ATT_ANGRY )
	&&	C_NpcIsInvincible (hero))
	{
		PrintDebugNpc(PD_ZS_CHECK,"Attacker_Angry_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC void  Attacker_ANGRY_Info()
{
	Info_ClearChoices	(Attacker_ANGRY);

	B_Say 	(self, other,"$YOUATTACKEDME");

	var string string_buildChoice;

	string_buildChoice = ConcatStrings ("Tut mir leid! (", B_SilverAmountToSatisfy_String ());
	string_buildChoice = ConcatStrings (string_buildChoice,"Silber geben)");

	Info_AddChoice (Attacker_Angry, string_buildChoice, Attacker_Angry_Lieb);
	Info_AddChoice (Attacker_Angry,"(ignorieren)"	,Attacker_Angry_HauAb);
};



// -------------------------------------------------------------------------

FUNC VOID B_AssignDamageInfos (var c_NPC slf)
{

	PrintDebugNpc(PD_ZS_CHECK,"AssignDamageInfos");
	Attacker_Exit.npc						= Hlp_GetInstanceID(slf);
	Attacker_ANGRY.npc						= Hlp_GetInstanceID(slf);
};


func void Attacker_Angry_Lieb ()
{
	PrintDebugNpc(PD_ZS_CHECK,"Attacker_Angry_Lieb");

	if (B_HasPlayerSilverToSatisfy ())
	{
		B_Say	(self, other, "$LetsForgetOurLittleFight");
		B_ExchangeMemoryAttitude ();
	}
	else
	{
		var string string_choice;
		string_choice = ConcatStrings ("Nicht genug Silber, ich will ",B_SilverAmountToSatisfy_String ());
		PrintScreen	(string_choice, -1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN);
	};


	AI_StopProcessInfos (self);
};

func void Attacker_Angry_HauAb ()
// Spieler wählt Hau Ab-Option, die Attitüde des Nsc ändert sich nicht und er drückt dem SPieler noch einen Spruch
{
	B_Say	(self, other, "$YoullBeSorryForThis");

	AI_StopProcessInfos (self);
	AI_ContinueRoutine	(self);
};

func void Attacker_Angry_NoMoney ()
{
	AI_StopProcessInfos (self);
};

