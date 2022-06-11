//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============
//	NSC:		PAL_1029_Osraed
//	Lager:		Bergfestung
//	Durchgang:	Äusseres Tor (rechte Wache)
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert der SC sich trotzdem wieder, wird er angegriffen.
//////////////////////////////////////////////////////////////////////////
CONST STRING	Pal_1029_CHECKPOINT		= "VP_PLATEAU_3";

INSTANCE PAL_1029_FirstWarn (C_INFO)
{
	npc			= PAL_1029_Osraed;
	nr			= 1;
	condition	= PAL_1029_FirstWarn_Condition;
	information	= PAL_1029_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
FUNC INT PAL_1029_FirstWarn_Condition()
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

FUNC VOID PAL_1029_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

//	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_01"); //HALT!
	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_01"); //STÁT!
//	AI_Output (hero, self,"PAL_1029_FirstWarn_Info_15_02"); //Was ist?
	AI_Output (hero, self,"PAL_1029_FirstWarn_Info_15_02"); //Co je?
//	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_03"); //Hier dürfen nur Gefolgsleute des Königs passieren!
	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_03"); //Tudy smí projít pouze následovníci krále!
//	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_04"); //Also verschwinde!
	AI_Output (self, hero,"PAL_1029_FirstWarn_Info_06_04"); //Takže vypadni!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Pal_1029_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
INSTANCE PAL_1029_LastWarn (C_INFO)
{
	npc			= PAL_1029_Osraed;
	nr			= 1;
	condition	= PAL_1029_LastWarn_Condition;
	information	= PAL_1029_LastWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1029_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,Pal_1029_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func int PAL_1029_LastWarn_Info()
{
//	AI_Output (self, hero,"PAL_1029_LastWarn_06_01"); 		//Noch einen Schritt weiter und wir machen Kleinholz aus dir!
	AI_Output (self, hero,"PAL_1029_LastWarn_06_01"); 		//Ještě krok a naděláme z tebe třísky!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Pal_1029_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
INSTANCE PAL_1029_Attack (C_INFO)
{
	npc			= PAL_1029_Osraed;
	nr			= 1;
	condition	= PAL_1029_Attack_Condition;
	information	= PAL_1029_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};

FUNC INT PAL_1029_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	)
	&&  (Npc_GetDistToWP(hero,Pal_1029_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										))
	&&	!B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return 			TRUE;
	};
};

func int PAL_1029_Attack_Info()
{

	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;

	B_FullStop			(self);
	AI_StopProcessInfos	(self);					//dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	hero);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};


//------------------------------------------------------------------------
//	EXIT
//------------------------------------------------------------------------
instance PAL_1029_EXIT (C_INFO)
{
	npc			= PAL_1029_Osraed;
	nr			= 999;
	condition	= PAL_1029_EXIT_Condition;
	information	= PAL_1029_EXIT_Info;
	permanent	= 1;
	description	= DIALOG_ENDE;
};

FUNC INT PAL_1029_EXIT_Condition()
{
	return 1;
};

FUNC VOID PAL_1029_EXIT_Info()
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

//------------------------------------------------------------------------
//	Info SOLDIER
//------------------------------------------------------------------------
INSTANCE PAL_1029_SOLDIER (C_INFO)
{
	npc			= PAL_1029_Osraed;
	nr			= 1;
	condition	= PAL_1029_SOLDIER_Condition;
	information	= PAL_1029_SOLDIER_Info;
	permanent	= FALSE;
//	description	= "Lass mich rein, ich möchte Soldat des Königs werden!";
	description	= "Pusť mě dovnitř, chci se stát vojákem královy armády!";
};

FUNC INT PAL_1029_SOLDIER_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID PAL_1029_SOLDIER_Info()
{
//	AI_Output			(hero, self,"PAL_1029_SOLDIER_15_01"); //Lass mich rein, ich möchte Soldat des Königs werden!
	AI_Output			(hero, self,"PAL_1029_SOLDIER_15_01"); //Pusť mě dovnitř, chci se stát vojákem královy armády!
//	AI_Output			(self, hero,"PAL_1029_SOLDIER_06_02"); //Die zwei Spinner da vorne am Lagerfeuer möchten auch Soldat werden.
	AI_Output			(self, hero,"PAL_1029_SOLDIER_06_02"); //Ti dva blázni támhle u táboráku se také chtějí stát vojáky.
//	AI_Output			(self, hero,"PAL_1029_SOLDIER_06_03"); //(spöttisch) Fällt dir nichts besseres ein?
	AI_Output			(self, hero,"PAL_1029_SOLDIER_06_03"); //(uštěpačně) Nenapadá tě nic lepšího?
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRIBE
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_BRIBE		(C_INFO)
{
	npc		 = 	PAL_1029_Osraed;
	condition	 = 	PAL_1029_Osraed_BRIBE_Condition;
	information	 = 	PAL_1029_Osraed_BRIBE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Lass mich rein, es soll nicht dein Schaden sein!";
	description	 = 	"Pusť mě dovnitř, vždyť ti to neublíží!";
};

func int PAL_1029_Osraed_BRIBE_Condition ()
{
	if	Npc_KnowsInfo(hero, PAL_1029_SOLDIER)
	&&	(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void PAL_1029_Osraed_BRIBE_Info ()
{
//	AI_Output			(hero, self, "PAL_1029_BRIBE_15_01"); //Lass mich rein, es soll nicht dein Schaden sein!
	AI_Output			(hero, self, "PAL_1029_BRIBE_15_01"); //Pusť mě dovnitř, vždyť ti to neublíží!
//	AI_Output			(self, hero, "PAL_1029_BRIBE_06_02"); //(bedrohlich) Soso, du willst mich also bestechen!
	AI_Output			(self, hero, "PAL_1029_BRIBE_06_02"); //(hrozivě) Takže ty mě chceš podplatit!

//	Info_AddChoice	(PAL_1029_Osraed_BRIBE, "Wieviel?", PAL_1029_Osraed_BRIBE_YES );
	Info_AddChoice	(PAL_1029_Osraed_BRIBE, "Kolik?", PAL_1029_Osraed_BRIBE_YES );
//	Info_AddChoice	(PAL_1029_Osraed_BRIBE, "Nein, du musst mich missverstanden haben!", PAL_1029_Osraed_BRIBE_NO );
	Info_AddChoice	(PAL_1029_Osraed_BRIBE, "Ne, to jsi mi musel špatně rozumět!", PAL_1029_Osraed_BRIBE_NO );
};

func void PAL_1029_Osraed_BRIBE_NO ()
{
	Info_ClearChoices	(PAL_1029_Osraed_BRIBE);
//	AI_Output			(hero, self, "PAL_1029_BRIBE_NO_15_01"); //Nein, du musst mich missverstanden haben!
	AI_Output			(hero, self, "PAL_1029_BRIBE_NO_15_01"); //Ne, to jsi mi musel špatně rozumět!
//	AI_Output			(self, hero, "PAL_1029_BRIBE_NO_06_02"); //Pah! Erst das Maul aufreissen, dann den Schwanz einkneifen.
	AI_Output			(self, hero, "PAL_1029_BRIBE_NO_06_02"); //Pche! Nejdřív si otevře hubu a potom stáhne ocas mezi nohy!
	AI_StopProcessInfos	(self);
};

func void PAL_1029_Osraed_BRIBE_YES ()
{
	Info_ClearChoices	(PAL_1029_Osraed_BRIBE);
//	AI_Output			(hero, self, "PAL_1029_BRIBE_YES_15_01"); //Wieviel?
	AI_Output			(hero, self, "PAL_1029_BRIBE_YES_15_01"); //Kolik?
//	AI_Output			(self, hero, "PAL_1029_BRIBE_YES_06_02"); //100 Silber, darunter läuft nichts!
	AI_Output			(self, hero, "PAL_1029_BRIBE_YES_06_02"); //Sto stříbrných, níž nejdu!
	BF_OuterGateBribable = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info GIVESILVER
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_GIVESILVER		(C_INFO)
{
	npc		 = 	PAL_1029_Osraed;
	condition	 = 	PAL_1029_Osraed_GIVESILVER_Condition;
	information	 = 	PAL_1029_Osraed_GIVESILVER_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"(100 Silber geben)";
	description	 = 	"(předat sto stříbrných)";
};

func int PAL_1029_Osraed_GIVESILVER_Condition ()
{
	if	BF_OuterGateBribable
	&&	!BF_OuterGate_Bribed
	{
		return TRUE;
	};
};

func void PAL_1029_Osraed_GIVESILVER_Info ()
{
	if	(Npc_HasItems(hero, ItMi_Silver) >= BF_BRIBE_OUTERGATE)
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, BF_BRIBE_OUTERGATE);
//		AI_Output		(hero, self, "PAL_1029_GIVESILVER_15_01"); //Ich sagte doch, es soll nicht dein Schaden sein.
		AI_Output		(hero, self, "PAL_1029_GIVESILVER_15_01"); //Říkal jsem, že ti to neublíží.
//		AI_Output		(self, hero, "PAL_1029_GIVESILVER_06_02"); //Wenn du jemanden hiervon erzählst bist du tot!
		AI_Output		(self, hero, "PAL_1029_GIVESILVER_06_02"); //Pokud o tom někom řekneš, tak jsi mrtvej!
//		AI_Output		(self, hero, "PAL_1029_GIVESILVER_06_03"); //Jetzt mach dass du rein kommst und mach keinen Ärger!
		AI_Output		(self, hero, "PAL_1029_GIVESILVER_06_03"); //Teď běž dál a nedělej problémy!

		// Wachen auf "Passieren" schalten
		self.aivar[AIV_PASSGATE] = TRUE;
		var c_npc	comrade;
		comrade = Hlp_GetNpc(PAL_1030_Auxiliary);
		comrade.aivar[AIV_PASSGATE] = TRUE;
		BF_OuterGate_Bribed	= TRUE;
	}
	else
	{
		B_Say		(self, hero, "$NotEnoughSilver");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDYBRIBED
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_HOWDYBRIBED		(C_INFO)
{
	npc		 = 	PAL_1029_Osraed;
	condition	 = 	PAL_1029_Osraed_HOWDYBRIBED_Condition;
	information	 = 	PAL_1029_Osraed_HOWDYBRIBED_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Gib mir meine 100 Silber zurück!";
	description	 = 	"Vrať mi mých sto stříbrných!";
};

func int PAL_1029_Osraed_HOWDYBRIBED_Condition ()
{
	if	BF_OuterGate_Bribed
	&&	BF_InnerGate_Attacked
	{
		return TRUE;
	};
};

func void PAL_1029_Osraed_HOWDYBRIBED_Info ()
{
//	AI_Output			(hero, self, "PAL_1029_HOWDYBRIBED_15_01"); //Gib mir meine 100 Silber zurück!
	AI_Output			(hero, self, "PAL_1029_HOWDYBRIBED_15_01"); //Vrať mi mých sto stříbrných!
//	AI_Output			(self, hero, "PAL_1029_HOWDYBRIBED_06_02"); //(gekünstelt) Ich weiss nicht wovon du sprichst. Zieh Leine!
	AI_Output			(self, hero, "PAL_1029_HOWDYBRIBED_06_02"); //(falešně) Vůbec nevím o čem to mluvíš. A teď odejdi!
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
instance PAL_1029_Osraed_HALTTHORA		(C_INFO)
{
	npc		 = 	PAL_1029_Osraed;
	condition	 = 	PAL_1029_Osraed_HALTTHORA_Condition;
	information	 = 	PAL_1029_Osraed_HALTTHORA_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int PAL_1029_Osraed_HALTTHORA_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	&&	B_NpcIsNear(hero, AMZ_900_Thora)
	{
		return TRUE;
	};
};

func void PAL_1029_Osraed_HALTTHORA_Info ()
{
	var c_npc thora;
	thora = Hlp_GetNpc(AMZ_900_Thora);

//	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_01"); //HALT! Hier ist kein...
	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_01"); //STÁT! Tady to není žádný...

	AI_TurnToNpc			(self, thora);
//	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_02"); //(schmierig) Ah, Thora...! Mein Einladung zu einer Flasche Wein steht immer noch.!
	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_02"); //(slizce) Ah, Thora..! Moje pozvání na láhev vína stále platí!
	AI_TurnToNpc			(thora, self);
//	AI_Output			(thora, hero, "PAL_1029_HALTTHORA_06_03"); //(kalt) Träum weiter, Schmierlocke!
	AI_Output			(thora, hero, "PAL_1029_HALTTHORA_06_03"); //(chladně) Sni dál, mastňáku!
	AI_TurnToNpc			(self, hero);

//	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_04"); //Gut du kannst passieren!
	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_04"); //Dobře, můžete projít!
//	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_05"); //Ach nochwas...
	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_05"); //Ještě jedna věc...
//	AI_Output			(hero, self, "PAL_1029_HALTTHORA_15_06"); //Was?
	AI_Output			(hero, self, "PAL_1029_HALTTHORA_15_06"); //Co?
//	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_07"); //(leise) Nur das das klar ist. Finger weg von Thora, sie gehört mir (krankes Lachen)!
	AI_Output			(self, hero, "PAL_1029_HALTTHORA_06_07"); //(tiše) Jen aby bylo jasno. Drže se od Thory dál, patří mně (dýchavičný smích)!

 	// Wachen auf "Passieren" schalten
	self.aivar[AIV_PASSGATE] = TRUE;
	var c_npc	comrade;
	comrade = Hlp_GetNpc(PAL_1030_Auxiliary);
	comrade.aivar[AIV_PASSGATE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FODDER
///////////////////////////////////////////////////////////////////////
instance PAL_1029_Osraed_FODDER		(C_INFO)
{
	npc		 = 	PAL_1029_Osraed;
	condition	 = 	PAL_1029_Osraed_FODDER_Condition;
	information	 = 	PAL_1029_Osraed_FODDER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ihr seid also das billige Orkfutter der Paladine?";
	description	 = 	"Vy jste také levné paladinské žrádlo pro skřety?";
};

func int PAL_1029_Osraed_FODDER_Condition ()
{
	if	Npc_KnowsInfo(hero, AMZ_900_Thora_OUTERGATE)
	{
		return TRUE;
	};
};

func void PAL_1029_Osraed_FODDER_Info ()
{
//	AI_Output			(hero, self, "PAL_1029_FODDER_15_01"); //Ihr seid also das billige Orkfutter der Paladine?
	AI_Output			(hero, self, "PAL_1029_FODDER_15_01"); //Vy jste také levné žrádlo pro skřety paladinů?
	if	B_NpcIsNear(hero, AMZ_900_Thora)
	{
//		AI_Output		(self, hero, "PAL_1029_FODDER_06_02"); //(gepresst) Wenn du nicht mit Thora hier angekommen wärst, dann würde ich dich jetzt einen Kopf kürzer machen.
		AI_Output		(self, hero, "PAL_1029_FODDER_06_02"); //(přidušeně) Kdybys tu nebyl s Thorou udělal bych tě o hlavu kratšího!
	}
	else
	{
//		AI_Output			(self, hero, "PAL_1029_FODDER_06_03"); //Na warte, diese Beleidigung wirst du mit Deinem Leben bezahlen!
		AI_Output			(self, hero, "PAL_1029_FODDER_06_03"); //Jen počkej, za tuhle urážku zaplatíš životem!
		B_SetAttitude			(self, ATT_HOSTILE);
	};

	AI_StopProcessInfos		(self);
};













