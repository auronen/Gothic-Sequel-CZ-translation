//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1040_Paladin
//	Lager:		Bergfestung
//	Durchgang:	Äusseres Tor (linke Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert der SC sich trotzdem wieder, wird er angegriffen.
//////////////////////////////////////////////////////////////////////////
CONST STRING	PAL_1040_CHECKPOINT		= "BF_BRIDGE_02";

INSTANCE PAL_1040_FirstWarn (C_INFO)
{
	npc			= PAL_1040_Paladin;
	nr			= 1;
	condition	= PAL_1040_FirstWarn_Condition;
	information	= PAL_1040_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT PAL_1040_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		)
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

FUNC VOID PAL_1040_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

//	AI_Output (self, hero,"PAL_1040_FirstWarn_Info_07_01"); //KEIN ZUTRITT!
	AI_Output (self, hero,"PAL_1040_FirstWarn_Info_07_01"); //ZÁKAZ VSTUPU!
//	AI_Output (hero, self,"PAL_1040_FirstWarn_Info_15_02"); //Ich will in die Festung!
	AI_Output (hero, self,"PAL_1040_FirstWarn_Info_15_02"); //Chci jít do pevnosti!
//	AI_Output (self, hero,"PAL_1040_FirstWarn_Info_07_03"); //Nur Gefolgsleute des Königs!
	AI_Output (self, hero,"PAL_1040_FirstWarn_Info_07_03"); //Jen pro královu družinu!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE PAL_1040_LastWarn (C_INFO)
{
	npc			= PAL_1040_Paladin;
	nr			= 1;
	condition	= PAL_1040_LastWarn_Condition;
	information	= PAL_1040_LastWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1040_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func int PAL_1040_LastWarn_Info()
{
//	AI_Output (self, hero,"PAL_1040_LastWarn_07_01"); 		//KEINEN SCHRITT WEITER!
	AI_Output (self, hero,"PAL_1040_LastWarn_07_01"); 		//ANI O KROK DÁL!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,PAL_1040_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE PAL_1040_Attack (C_INFO)
{
	npc			= PAL_1040_Paladin;
	nr			= 1;
	condition	= PAL_1040_Attack_Condition;
	information	= PAL_1040_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1040_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,PAL_1040_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return 			TRUE;
	};
};

func int PAL_1040_Attack_Info()
{

	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;

	B_FullStop			(self);
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

//------------------------------------------------------------------------
//	EXIT
//------------------------------------------------------------------------
INSTANCE PAL_1040_EXIT (C_INFO)
{
	npc			= PAL_1040_Paladin;
	nr			= 999;
	condition	= PAL_1040_EXIT_Condition;
	information	= PAL_1040_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};

FUNC INT PAL_1040_EXIT_Condition()
{
	return 1;
};

FUNC VOID PAL_1040_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};







//#####################################################################
//##
//##
//##					Einlass ohne Thora
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info WANTIN
///////////////////////////////////////////////////////////////////////
instance PAL_1040_Paladin_WANTIN		(C_INFO)
{
	npc		 = 	PAL_1040_Paladin;
	nr		=	10;
	condition	 = 	PAL_1040_Paladin_WANTIN_Condition;
	information	 = 	PAL_1040_Paladin_WANTIN_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich möchte in die Festung!";
	description	 = 	"Chci jít do pevnosti!";
};

func int PAL_1040_Paladin_WANTIN_Condition ()
{
	if	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func void PAL_1040_Paladin_WANTIN_Info ()
{
//	AI_Output			(hero, self, "PAL_1040_WANTIN_15_01"); //Ich möchte in die Festung.
	AI_Output			(hero, self, "PAL_1040_WANTIN_15_01"); //Chci jít do pevnosti.
//	AI_Output			(self, hero, "PAL_1040_WANTIN_07_02"); //Nur Gefolgsleute des Königs!
	AI_Output			(self, hero, "PAL_1040_WANTIN_07_02"); //Jen pro královu družinu!
	AI_StopProcessInfos	(self);
};








//#####################################################################
//##
//##
//##					Einlass mit Thora
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HALTTHORA
///////////////////////////////////////////////////////////////////////
instance PAL_1040_Paladin_HALTTHORA		(C_INFO)
{
	npc		 = 	PAL_1040_Paladin;
	condition	 = 	PAL_1040_Paladin_HALTTHORA_Condition;
	information	 = 	PAL_1040_Paladin_HALTTHORA_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int PAL_1040_Paladin_HALTTHORA_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&&	B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func void PAL_1040_Paladin_HALTTHORA_Info ()
{
	var c_npc thora;
	thora = Hlp_GetNpc(AMZ_900_Thora);

	AI_TurnToNpc		(self, thora);

//	AI_Output			(self, hero, "PAL_1040_HALTTHORA_07_01"); //Thora, du kannst passieren...mit Begleitung!
	AI_Output			(self, hero, "PAL_1040_HALTTHORA_07_01"); //Thoro, ty projít můžeš...i s doprovodem!

	AI_StopProcessInfos	(self);
};












