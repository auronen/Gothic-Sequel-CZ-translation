// ************************ EXIT **************************

instance  DMC_800_Xardas_Exit (C_INFO)
{
	npc			=	DMC_800_Xardas;
	nr			=	999;
	condition	=	DMC_800_Xardas_Exit_Condition;
	information	=	DMC_800_Xardas_Exit_Info;
	important	=	0;
	permanent	=	1;
	description =	DIALOG_ENDE;
};

FUNC int  DMC_800_Xardas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DMC_800_Xardas_Exit_Info()
{
	if	(chapter == 1)
	{
		Npc_ExchangeRoutine (self,"START");
	};

	AI_StopProcessInfos	( self );
};


//#####################################################################
//##
//##
//##					KAPITEL 1 (Startszene)
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info BACK
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_BACK		(C_INFO)
{
	npc		 	 = 	DMC_800_Xardas;
	nr		 	 = 	1;
	condition	 = 	DMC_800_Xardas_BACK_Condition;
	information	 = 	DMC_800_Xardas_BACK_Info;
	//IMPORTANT	 = 	TRUE;
	permanent	 = 	FALSE;
//	description  = "(Startsatz)";
	description  = "(Úvodní věta)";
};

func int DMC_800_Xardas_BACK_Condition ()
{
	if	(subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void DMC_800_Xardas_BACK_Info ()
{
	B_Story_PrintStart	();

	B_SetAttitude		(self,	ATT_FRIENDLY);

//	AI_Output			(self, hero, "DMC_800_BACK_14_01"); //...und das ist alles was passiert ist, seit du verschüttet wurdest.
	AI_Output			(self, hero, "DMC_800_BACK_14_01"); //... a to je vše, co se událo od té doby, co jsi byl zasypán.
//	AI_Output			(hero, self, "DMC_800_BACK_15_02"); //Du warst doch auch im Tempel, als ich gegen den Schläfer kämpfte.
	AI_Output			(hero, self, "DMC_800_BACK_15_02"); //Když jsem bojoval se Spáčem, byl jsi také v chrámu.
//	AI_Output			(self, hero, "DMC_800_BACK_14_03"); //Ich konnte mit letzter Kraft entkommen, bevor der Tempel einstürzte.
	AI_Output			(self, hero, "DMC_800_BACK_14_03"); //S vypětím posledních sil se mi podařilo uniknout předtím, než se chrám zhroutil.
//	AI_Output			(self, hero, "DMC_800_BACK_14_04"); //Seitdem habe ich nach dir gesucht.
	AI_Output			(self, hero, "DMC_800_BACK_14_04"); //Od té doby jsem tě hledal.


//	Info_AddChoice	(DMC_800_Xardas_BACK, "Jetzt wird das Tal also von den Orcs belagert.", DMC_800_Xardas_BACK_PROBLEM );
	Info_AddChoice	(DMC_800_Xardas_BACK, "Hornické údolí teď obléhají skřeti.", DMC_800_Xardas_BACK_PROBLEM );
};

func void DMC_800_Xardas_BACK_PROBLEM ()
{
//	AI_Output			(hero, self, "DMC_800_BACK_PROBLEM_15_01"); //Jetzt wird das Tal also von den Orcs belagert und wir sitzen immer noch fest.
	AI_Output			(hero, self, "DMC_800_BACK_PROBLEM_15_01"); //Hornické údolí teď obléhají skřeti a my tu pořád sedíme.
//	AI_Output			(self, hero, "DMC_800_BACK_PROBLEM_14_02"); //So ist es. Aber das ist leider noch nicht unser schlimmstes Problem.
	AI_Output			(self, hero, "DMC_800_BACK_PROBLEM_14_02"); //Je to tak. Ale to bohužel není náš největší problém.

	Info_ClearChoices (DMC_800_Xardas_BACK);
};

///////////////////////////////////////////////////////////////////////
//	Info QUEST
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_QUEST		(C_INFO)
{
	npc		 = 	DMC_800_Xardas;
	nr		 = 	2;
	condition	 = 	DMC_800_Xardas_QUEST_Condition;
	information	 = 	DMC_800_Xardas_QUEST_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Von welchem Problem sprichst du?";
	description	 = 	"O jakém problému mluvíš?";
};

func int DMC_800_Xardas_QUEST_Condition ()
{
	if Npc_KnowsInfo (hero,DMC_800_Xardas_BACK)
	{
		return TRUE;
	};
};

func void DMC_800_Xardas_QUEST_Info ()
{
//	AI_Output			(hero, self, "DMC_800_QUEST_15_01"); //Von welchem Problem sprichst du?
	AI_Output			(hero, self, "DMC_800_QUEST_15_01"); //O jakém problému mluvíš?
//	AI_Output			(self, hero, "DMC_800_QUEST_14_02"); //Der Schläfer versucht von der Dämonenwelt in unsere Welt zurückzukehren. Wenn ihm das gelingt wird er ein ganzes Heer von Dämonen mit sich führen.
	AI_Output			(self, hero, "DMC_800_QUEST_14_02"); //Spáč se pokouší dostat ze světa démonů zpět do našeho světa. Pokud se mu to podaří, povede celou armádu démonů.
//	AI_Output			(hero, self, "DMC_800_QUEST_15_03"); //Aber wie? Das Tor zur Dämonenwelt ist zerstört.
	AI_Output			(hero, self, "DMC_800_QUEST_15_03"); //Ale jak? Brána do světa démonů je zničena.
//	AI_Output			(self, hero, "DMC_800_QUEST_14_04"); //Das magische Gefüge der Kolonie wurde durch die Zerstörung der Barriere geschwächt.
	AI_Output			(self, hero, "DMC_800_QUEST_14_04"); //Magická struktura Kolonie byla během pádu Bariéry poničena.
//	AI_Output			(self, hero, "DMC_800_QUEST_14_05"); //Schon bald könnte das gesamte Tal ein Tor zur Dämonenwelt sein!
	AI_Output			(self, hero, "DMC_800_QUEST_14_05"); //Brzy se z celého údolí může stát brána do světa démonů!

//	Info_AddChoice		(DMC_800_Xardas_QUEST, "Was können wir dagegen tun?", DMC_800_Xardas_QUEST_STOP );
	Info_AddChoice		(DMC_800_Xardas_QUEST, "Co proti tomu můžeme dělat?", DMC_800_Xardas_QUEST_STOP );

	Log_CreateTopic		(CH1_Demonthreat,LOG_MISSION);
	Log_SetTopicStatus	(CH1_Demonthreat,LOG_RUNNING);
//	B_LogEntry			(CH1_Demonthreat,"Der Schläfer versucht aus der Dämonenwelt in unsere Welt zurückzukommen. Er muss unter allen Umständen aufgehalten werden, sonst waren alle meine Bemühungen umsonst.");
	B_LogEntry			(CH1_Demonthreat,"Spáč se pokouší dostat ze světa démonů do našeho světa. Musí být za každou cenu zastaven, jinak bylo veškeré mé úsilí zbytečné.");
};

FUNC VOID DMC_800_Xardas_QUEST_STOP()
{
//	AI_Output			(hero, self, "DMC_800_QUEST_STOP_15_01"); //Was können wir dagegen tun?
	AI_Output			(hero, self, "DMC_800_QUEST_STOP_15_01"); //Co proti tomu můžeme dělat?
//	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_02"); //Was wir auch schon zuvor getan haben. Uns den Dämonen entgegestellen!
	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_02"); //To, co jsme udělali předtím. Budeme těm démonům čelit!
//	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_03"); //Aber zuvor musst du wieder an Kraft gewinnen und verlernte Fähigkeiten zurückerlangen.
	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_03"); //Ale předtím musíš znovu získat svou ztracenou sílu a dovednosti, které jsi zapomněl.
//	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_04"); //Begib dich ins Alte Lager. Dort ist der geeignete Ort dafür.
	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_04"); //Jdi do Starého tábora. To je pro tento účel to pravé místo.
//	AI_Output			(hero, self, "DMC_800_QUEST_STOP_15_05"); //Aber warum ausgerechnet ich?
	AI_Output			(hero, self, "DMC_800_QUEST_STOP_15_05"); //Ale proč zrovna já?
//	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_06"); //Niemand ist besser geeignet als Du. Vertrau mir!
	AI_Output			(self, hero, "DMC_800_QUEST_STOP_14_06"); //Nikdo není vhodnější než ty. Věř mi!

//	B_LogEntry			(CH1_Demonthreat, "Bevor ich der dämonischen Bedrohung begegnen kann, muss ich meine verlernten Fähigkeiten zurückerlernen und wieder in Form kommen. Das Alte Lager ist der geeignete Ort dafür.");
	B_LogEntry			(CH1_Demonthreat, "Před tím, než budu moci čelit démonům, musím získat zpět své ztracené schopnosti a dovednosti a dostat se zpět do formy. Starý tábor je pro tento účel to správné místo.");
};


///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_WHERE		(C_INFO)
{
	npc		 	 = 	DMC_800_Xardas;
	nr		 	 = 	5;
	condition	 = 	DMC_800_Xardas_WHERE_Condition;
	information	 = 	DMC_800_Xardas_WHERE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wann und wo werden die Dämonen durchbrechen?";
	description	 = 	"Kdy a kde se démoni objeví?";
};

func int DMC_800_Xardas_WHERE_Condition ()
{
	if Npc_KnowsInfo (hero,DMC_800_Xardas_QUEST)
	{
		return TRUE;
	};
};
func void DMC_800_Xardas_WHERE_Info ()
{
//	AI_Output			(hero, self, "DMC_800_WHERE_15_01"); //Wann und wo werden die Dämonen durchbrechen?
	AI_Output			(hero, self, "DMC_800_WHERE_15_01"); //Kdy a kde se démoni objeví?
//	AI_Output			(self, hero, "DMC_800_WHERE_14_02"); //Es kann überall im Tal passieren. Ich weiß noch nichts genaues.
	AI_Output			(self, hero, "DMC_800_WHERE_14_02"); //Může k tomu dojít kdekoliv v údolí. Zatím nevím přesně kde.
//	AI_Output			(self, hero, "DMC_800_WHERE_14_03"); //Aber ich werde Ort und Zeitpunkt herausfinden.
	AI_Output			(self, hero, "DMC_800_WHERE_14_03"); //Ale zjistím kde a kdy to bude.
};

///////////////////////////////////////////////////////////////////////
//	Info LEAVING
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_LEAVING		(C_INFO)
{
	npc			 = 	DMC_800_Xardas;
	nr			 = 	6;
	condition	 = 	DMC_800_Xardas_LEAVING_Condition;
	information	 = 	DMC_800_Xardas_LEAVING_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie kann ich deinen Turm verlassen? ";
	description	 = 	"Jak mohu opustit věž?";
};

func int DMC_800_Xardas_LEAVING_Condition ()
{
	if	Npc_KnowsInfo (hero,DMC_800_Xardas_QUEST)
	{
		return TRUE;
	};
};

func void DMC_800_Xardas_LEAVING_Info ()
{
//	AI_Output			(hero, self, "DMC_800_LEAVING_15_01"); //Wie kann ich deinen Turm verlassen? Du hast nicht zufällig eine Treppe einbauen lassen?
	AI_Output			(hero, self, "DMC_800_LEAVING_15_01"); //Jak mohu opustit věž? Nenechal sis náhodou postavit schodiště, že ne?
//	AI_Output			(self, hero, "DMC_800_LEAVING_14_02"); //Ich werde dich zum Alten Lager teleportieren. Sag mir, wenn du bereit bist.
	AI_Output			(self, hero, "DMC_800_LEAVING_14_02"); //Teleportuji tě do Starého tábora. Řekni mi, až budeš připraven.
//	AI_Output			(self, hero, "DMC_800_LEAVING_14_03"); //Aber sei vorsichtig. Es ist sehr gefährlich ausserhalb des Lagers.
	AI_Output			(self, hero, "DMC_800_LEAVING_14_03"); //Ale buď opatrný. Mimo tábor je to velice nebezpečné.
};


///////////////////////////////////////////////////////////////////////
//	Info TELEPORT
///////////////////////////////////////////////////////////////////////
instance DMC_800_Xardas_TELEPORT		(C_INFO)
{
	npc		 	 = 	DMC_800_Xardas;
	nr		 	 = 	5;
	condition	 = 	DMC_800_Xardas_TELEPORT_Condition;
	information	 = 	DMC_800_Xardas_TELEPORT_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich bin bereit für die Teleportation.";
	description	 = 	"Jsem připraven na teleportaci.";
};

func int DMC_800_Xardas_TELEPORT_Condition ()
{
	if	Npc_KnowsInfo (hero,DMC_800_Xardas_LEAVING)
	{
		return TRUE;
	};
};

func void DMC_800_Xardas_TELEPORT_Info ()
{
//	AI_Output			(hero, self, "DMC_800_TELEPORT_15_01"); //Ich bin bereit für die Teleportation.
	AI_Output			(hero, self, "DMC_800_TELEPORT_15_01"); //Jsem připraven na teleportaci.

//	AI_Output			(self, hero, "DMC_800_TELEPORT_14_02"); //Ich gebe dir eine Botschaft für Diego, deinen alten Weggefährten, mit. Er ist mittlerweile der Anführer der Flüchtlinge im Alten Lager.
	AI_Output			(self, hero, "DMC_800_TELEPORT_14_02"); //Dal jsem ti zprávu pro Diega, tvého starého společníka. Stal se z něj vůdce uprchlíků ve Starém táboře.
	B_GiveInvItems		(self, hero, ItWr_Xardas_Letter_Sealed, 1);
//	AI_Output			(self, hero, "DMC_800_TELEPORT_14_03"); //Übergebe ihm das Schriftstück und folge seinem Rat. Er wird wissen, was zu tun ist.
	AI_Output			(self, hero, "DMC_800_TELEPORT_14_03"); //Dej mu ten dokument a řiď se jeho radami. On bude vědět, co dělat.
//	AI_Output			(self, hero, "DMC_800_TELEPORT_14_04"); //Mache dich nun bereit.
	AI_Output			(self, hero, "DMC_800_TELEPORT_14_04"); //Připrav se.
//	AI_Output			(hero, self, "DMC_800_TELEPORT_15_05"); //Wir sehen uns wieder!
	AI_Output			(hero, self, "DMC_800_TELEPORT_15_05"); //Zase se uvidíme!

//	B_LogEntry			(CH1_DemonThreat,"Xardas gab mir eine Botschaft für Diego. Mein alter Weggefährte ist mittlerweile der Anführer des Alten Lagers. Er wird mich beraten und weiss was zu tun ist.");
	B_LogEntry			(CH1_DemonThreat,"Xardas mi dal zprávu pro Diega. Můj starý společník se během mé absence stal vůdcem Starého tábora. Poradí mi a bude vědět, co dělat dál.");

	// Spieler wird vors Alte Lager teleportiert
	AI_StopProcessInfos (self);

	AI_PlayAni			(hero,	"T_STAND_2_TELEPORT");
//	AI_Snd_Play			(hero,	"MFX_Heal_Cast");
	AI_Wait				(hero,	3);
	AI_Teleport			(hero,	TELEPORT4_WP);
	AI_PlayAni			(hero,	"T_TELEPORT_2_STAND");

	self.aivar[AIV_INVINCIBLE] = FALSE;	// SN:Workaround, da dieses Flag durch die Teleportation nicht mehr gelöscht wird!
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};



