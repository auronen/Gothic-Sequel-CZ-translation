/////////////////////////////////////////////////////////////////
//	Verteilfunktionen für die Stimmen bei Mord	(JP)
//	====================================================
//
//	- hier werden die Reaktionen auf Mord für die einzelnen
//	Stimmnummern vorgenommen
//
//
///////////////////////////////////////////////////////////////////


// -------------------------------------------------------------------------
instance  Murder (C_INFO)
{
	nr				=  10;
	condition		= Murder_Condition;
	information		= Murder_Info;
	description		= "Dreckiger Mörder";
	permanent		= TRUE;
	IMPORTANT		= TRUE;
};

FUNC int  Murder_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK,"Murder_Condition");
	if ((int_MurderCount == 1)
	&&	C_NpcIsInvincible (hero))
	{
		PrintDebugNpc(PD_ZS_CHECK,"Murder_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC void  Murder_Info()
{
	Info_ClearChoices	(Murder);

	B_Say 	(self, other,"$YOUKILLEDMYFRIEND");

};





// -------------------------------------------------------------------------
instance  Murder2 (C_INFO)
{
	nr				=  10;
	condition		= Murder2_Condition;
	information		= Murder2_Info;
	description		= "Dreckiger Mörder";
	permanent		= TRUE;
	IMPORTANT		= TRUE;
};

FUNC int  Murder2_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK,"Murder_Condition");
	if ((int_MurderCount >= 2)
	&&	C_NpcIsInvincible (hero))
	{
		PrintDebugNpc(PD_ZS_CHECK,"Murder_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC void  Murder2_Info()
{
	Info_ClearChoices	(Murder);
	// !!! FixME, hier noch ein Svm rein, das der ßituation angemessen ist (2.Mord--> DuBisttot)
	B_Say				(self, other, "$YOUKILLEDMYFRIEND");
	AI_StopProcessInfos	(self);
	B_SetAttitude		(self, ATT_HOSTILE);
	Npc_SetTarget		(self, hero);
	AI_StartState		(self, ZS_Attack, 0, "");

};


// -------------------------------------------------------------------------
//	Hier wird die Info dynamischen an den Aufrufenden Nsc vergeben
// -------------------------------------------------------------------------
FUNC VOID B_AssignMurderInfos (var c_NPC slf)
{

	PrintDebugNpc(PD_ZS_CHECK,"AssignMurderInfos");

	Murder.npc						= Hlp_GetInstanceID(slf);
	Murder2.npc						= Hlp_GetInstanceID(slf);
};
