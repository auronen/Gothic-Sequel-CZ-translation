//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1039_Paladin
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
CONST STRING	PAL_1039_CHECKPOINT		= "BF_BRIDGE_02";

INSTANCE PAL_1039_FirstWarn (C_INFO)
{
	npc			= PAL_1039_Paladin;
	nr			= 1;
	condition	= PAL_1039_FirstWarn_Condition;
	information	= PAL_1039_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT PAL_1039_FirstWarn_Condition()
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

FUNC VOID PAL_1039_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

//	AI_Output (self, hero,"PAL_1039_FirstWarn_Info_07_01"); //HALT!
	AI_Output (self, hero,"PAL_1039_FirstWarn_Info_07_01"); //STÁT!
//	AI_Output (hero, self,"PAL_1039_FirstWarn_Info_15_02"); //Kann ich passieren!
	AI_Output (hero, self,"PAL_1039_FirstWarn_Info_15_02"); //Můžu jít dál?
//	AI_Output (SELF, HERO,"PAL_1039_FIRSTWARN_INFO_07_03"); //NEIN!
	AI_Output (SELF, HERO,"PAL_1039_FIRSTWARN_INFO_07_03"); //NE!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE PAL_1039_LastWarn (C_INFO)
{
	npc			= PAL_1039_Paladin;
	nr			= 1;
	condition	= PAL_1039_LastWarn_Condition;
	information	= PAL_1039_LastWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1039_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func int PAL_1039_LastWarn_Info()
{
//	AI_Output (self, hero,"PAL_1039_LastWarn_07_01"); 		//BLEIB SOFORT STEHEN!!!
	AI_Output (self, hero,"PAL_1039_LastWarn_07_01"); 		//OKAMŽITĚ SE ZASTAV!!!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,PAL_1039_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE PAL_1039_Attack (C_INFO)
{
	npc			= PAL_1039_Paladin;
	nr			= 1;
	condition	= PAL_1039_Attack_Condition;
	information	= PAL_1039_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1039_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,PAL_1039_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return 			TRUE;
	};
};

func int PAL_1039_Attack_Info()
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
INSTANCE PAL_1039_EXIT (C_INFO)
{
	npc			= PAL_1039_Paladin;
	nr			= 999;
	condition	= PAL_1039_EXIT_Condition;
	information	= PAL_1039_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};

FUNC INT PAL_1039_EXIT_Condition()
{
	return 1;
};

FUNC VOID PAL_1039_EXIT_Info()
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
instance PAL_1039_Paladin_WANTIN		(C_INFO)
{
	npc		 	 = 	PAL_1039_Paladin;
	nr			 =	10;
	condition	 = 	PAL_1039_Paladin_WANTIN_Condition;
	information	 = 	PAL_1039_Paladin_WANTIN_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Warum kann ich nicht in die Festung?";
	description	 = 	"Proč nemůžu do pevnosti?";
};

func int PAL_1039_Paladin_WANTIN_Condition ()
{
	if	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func void PAL_1039_Paladin_WANTIN_Info ()
{
//	AI_Output			(hero, self, "PAL_1039_WANTIN_15_01"); //Warum kann ich nicht in die Festung?
	AI_Output			(hero, self, "PAL_1039_WANTIN_15_01"); //Proč nemůžu do pevnosti?
//	AI_Output			(self, hero, "PAL_1039_WANTIN_07_02"); //Du siehst nicht aus wie ein Gefolgsmann des Königs!
	AI_Output			(self, hero, "PAL_1039_WANTIN_07_02"); //Nevypadáš jako jeden z králova doprovodu!
	BF_InnerGate_Bribable	= TRUE;
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRIBE
///////////////////////////////////////////////////////////////////////
instance PAL_1039_Paladin_BRIBE		(C_INFO)
{
	npc		 = 	PAL_1039_Paladin;
	condition	 = 	PAL_1039_Paladin_BRIBE_Condition;
	information	 = 	PAL_1039_Paladin_BRIBE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Vielleicht kann ein wenig Silber das ändern.";
	description	 = 	"Možná by to mohla změnit trocha stříbra.";
};

func int PAL_1039_Paladin_BRIBE_Condition ()
{
	if	BF_InnerGate_Bribable
	{
		return TRUE;
	};
};

func void PAL_1039_Paladin_BRIBE_Info ()
{
//	AI_Output			(hero, self, "PAL_1039_BRIBE_15_01"); //Vielleicht kann ein wenig Silber das ändern.
	AI_Output			(hero, self, "PAL_1039_BRIBE_15_01"); //Možná by to mohla změnit trocha stříbra.
//	AI_Output			(self, hero, "PAL_1039_BRIBE_08_02"); //(wütend) Soldat des Königs sind unbestechlich!
	AI_Output			(self, hero, "PAL_1039_BRIBE_08_02"); //(zlostně) Královi vojáci jsou neúplatní!
//	AI_Output			(self, hero, "PAL_1039_BRIBE_08_03"); //Ich werde dafür sorgen, dass du das nie vergisst!
	AI_Output			(self, hero, "PAL_1039_BRIBE_08_03"); //Postarám se, abys to nikdy nezapomněl!
	B_AttackProper	(self, hero);
	BF_InnerGate_Attacked	= TRUE;
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
instance PAL_1039_Paladin_HALTTHORA		(C_INFO)
{
	npc		 	 = 	PAL_1039_Paladin;
	condition	 = 	PAL_1039_Paladin_HALTTHORA_Condition;
	information	 = 	PAL_1039_Paladin_HALTTHORA_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int PAL_1039_Paladin_HALTTHORA_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&&	B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func void PAL_1039_Paladin_HALTTHORA_Info ()
{
	var c_npc thora;
	thora = Hlp_GetNpc(AMZ_900_Thora);

	AI_TurnToNpc		(self, thora);

//	AI_Output			(self, hero, "PAL_1039_HALTTHORA_07_01"); //Thora, du kannst passieren...mit Begleitung!
	AI_Output			(self, hero, "PAL_1039_HALTTHORA_07_01"); //Thoro, ty projít můžeš...i s doprovodem!

	AI_StopProcessInfos	(self);
};















