// This variable is a workaround for a bug -> function Npc_KnowsInfo() doesn't work on permanent = TRUE dialogues
// BF_ prefix is used on all newly introduced variables
const int BF_Gerion_LOCKPICK_1 = FALSE; 
///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE THF_403_Gerion_EXIT   (C_INFO)
{
	npc         = THF_403_Gerion;
	nr          = 999;
	condition   = THF_403_Gerion_EXIT_Condition;
	information = THF_403_Gerion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT THF_403_Gerion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID THF_403_Gerion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info 23
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_23		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	45;
	condition	 = 	THF_403_Gerion_23_Condition;
	information	 = 	THF_403_Gerion_23_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tady děláš?";
};

func int THF_403_Gerion_23_Condition ()
{
	return TRUE;
};

func void THF_403_Gerion_23_Info ()
{
//	AI_Output			(hero, self, "THF_403_23_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "THF_403_23_15_01"); //Co tady děláš?
//	AI_Output			(self, hero, "THF_403_23_11_02"); //Ich bin Gerion aus Khorinis. Vor einigen Wochen habe ich die Stadt verlassen.
	AI_Output			(self, hero, "THF_403_23_11_02"); //Já jsem Gerion z Khorinisu. Před týdenem jsem město opustil.
//	AI_Output			(self, hero, "THF_403_23_11_03"); //Was eine gute Entscheidung war, denn kurz darauf kamen die Orks.
	AI_Output			(self, hero, "THF_403_23_11_03"); //A bylo to dobré rozhodnutí, krátce na to přišli skřeti.
//	AI_Output			(self, hero, "THF_403_23_11_04"); //Jetzt bin ich hier. Aber ich weiß nicht, ob das auch ne gute Entscheidung war, denn hier haben die Orks alles abgeriegelt.
	AI_Output			(self, hero, "THF_403_23_11_04"); //A teď jsem tady. Ale nevím, jestli to bylo dobré rozhodnutí, skřeti to tu celé obklíčili.
};

 ///////////////////////////////////////////////////////////////////////
//	Info DIEGO
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_DIEGO		(C_INFO)
{
	npc			 = 	THF_403_Gerion;
	nr		 	= 	13;
	condition	 = 	THF_403_Gerion_DIEGO_Condition;
	information	 = 	THF_403_Gerion_DIEGO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich will die Kunst der Diebe lernen.";
	description	 = 	"Chtěl bych se naučit zlodějskému umění.";
};

func int THF_403_Gerion_DIEGO_Condition ()
{
	if Npc_KnowsInfo (hero,PC_Thief_STARTRAINING_THIEF)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_DIEGO_Info ()
{
//	AI_Output			(hero, self, "THF_403_DIEGO_15_01"); //Ich will die Kunst der Diebe lernen.
	AI_Output			(hero, self, "THF_403_DIEGO_15_01"); //Chtěl bych se naučit zlodějskému umění.
//	AI_Output			(self, hero, "THF_403_DIEGO_11_02"); //Warum schreist du nicht noch lauter, damit es auch wirklich JEDER mitkriegt!?
	AI_Output			(self, hero, "THF_403_DIEGO_11_02"); //Proč nemluvíš ještě hlasitěji, aby to KAŽDÝ slyšel?
//	AI_Output			(self, hero, "THF_403_DIEGO_11_03"); //Ausserdem weiß ich gar nicht wovon du redest.
	AI_Output			(self, hero, "THF_403_DIEGO_11_03"); //Kromě toho ani nevím o čem mluvíš.
};

///////////////////////////////////////////////////////////////////////
//	Info BERENGAR
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TELLDIEGO		(C_INFO)
{
	npc		 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_TELLDIEGO_Condition;
	information	 = 	THF_403_Gerion_TELLDIEGO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Dann kann ich also Diego von deinen Raubzügen erzählen?";
	description	 = 	"Potom tedy můžu říci Diegovi o tvých krádežích?";
};

func int THF_403_Gerion_TELLDIEGO_Condition ()
{
	if Npc_KnowsInfo (hero,THF_403_Gerion_DIEGO)
	&& Npc_KnowsInfo (hero,PC_Thief_GERIONTHIEF)
	&& !Npc_IsInRoutine (self, ZS_Sleep)
	&& !Npc_KnowsInfo (hero,THF_403_Gerion_TELLDIEGO2)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_TELLDIEGO_Info ()
{
//	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO_15_01"); //Dann kann ich also Diego von deinen kleinen Raubzügen erzählen?
	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO_15_01"); //Potom tedy můžu říci Diegovi o tvých krádežích?
//	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO_11_02"); //Hey, nicht so laut! Laß uns woanders hingehen. Komm mit!
	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO_11_02"); //Hej, ne tak nahlas! Pojďme někam jinam. Pojď se mnou!

	GuidePC_Destination = GERION_WP;
	Npc_ExchangeRoutine (self,"GOTOHUT");
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info wenn Berengar bereits in seiner Hütte ist
///////////////////////////////////////////////////////////////////////

// FIXME: sollte raus!! Nachts Standard-AI, die den SC auffordert später wiederzukommen!
instance THF_403_Gerion_TELLDIEGO2		(C_INFO)
{
	npc		 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_TELLDIEGO2_Condition;
	information	 = 	THF_403_Gerion_TELLDIEGO2_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich könnte Diego von deinen Raubzügen erzählen!";
	description	 = 	"Mohl bych Diegovi povyprávět o tvých loupežích!";
};

func int THF_403_Gerion_TELLDIEGO2_Condition ()
{
	if Npc_KnowsInfo (hero,THF_403_Gerion_DIEGO)
	&& Npc_KnowsInfo (hero,PC_Thief_GERIONTHIEF)
	&& Npc_IsInRoutine (self,ZS_Sleep)
	&& !Npc_KnowsInfo (hero,THF_403_Gerion_TELLDIEGO)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_TELLDIEGO2_Info ()
{
//	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO2_15_01"); //Ich könnte Diego von deinen kleinen Raubzügen erzählen!
	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO2_15_01"); //Mohl bych Diegovi povyprávět o tvých loupežích!
//	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_02"); //Ich schlag dir ein Geschäft vor!
	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_02"); //Navrhuji ti dohodu!
//	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_03"); //Du behältst das für dich und dafür zeige ich dir die Talente der Diebe.
	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_03"); //Necháš si to pro sebe a já ti ukážu zlodějské dovednosti.
//	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO2_15_04"); //Ich wußte, das wir uns verstehen würden.
	AI_Output			(hero, self, "THF_403_Gerion_TELLDIEGO2_15_04"); //Já věděl, že si budeme rozumět.
//	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_05"); //Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_05"); //První co se musíš naučit je tiše se pohybovat.
//	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_06"); //Sag mir Bescheid, wenn du bereit bist.
	AI_Output			(self, hero, "THF_403_Gerion_TELLDIEGO2_11_06"); //Až budeš připraven, dej mi vědět.

};

///////////////////////////////////////////////////////////////////////
//	Info INSIDER
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_INSIDER		(C_INFO)
{
	npc			 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_INSIDER_Condition;
	information	 = 	THF_403_Gerion_INSIDER_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int THF_403_Gerion_INSIDER_Condition ()
{
	if Npc_IsInRoutine (self, ZS_GuidePC)
	&&(Npc_GetDistToWP (self,"OCR_HUT_79") <= 200)
	&& Npc_KnowsInfo (hero,THF_403_Gerion_TELLDIEGO)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_INSIDER_Info ()
{
//	AI_Output			(self, hero, "THF_403_INSIDER_11_01"); //Ich schlage dir ein Geschäft vor.
	AI_Output			(self, hero, "THF_403_INSIDER_11_01"); //Navrhuji ti dohodu.
//	AI_Output			(hero, self, "THF_403_INSIDER_15_02"); //Nämlich?
	AI_Output			(hero, self, "THF_403_INSIDER_15_02"); //A to?
//	AI_Output			(self, hero, "THF_403_INSIDER_11_03"); //Du verpfeifst mich nicht und dafür zeige ich dir die Talente der Diebe.
	AI_Output			(self, hero, "THF_403_INSIDER_11_03"); //Ty mě nevyprášíš a já tě naučím zlodějské dovednosti.
//	AI_Output			(hero, self, "THF_403_INSIDER_15_04"); //Ich wußte das wir uns verstehen würden.
	AI_Output			(hero, self, "THF_403_INSIDER_15_04"); //Já jsem věděl, že si budeme rozumět.
//	AI_Output			(self, hero, "THF_403_INSIDER_11_05"); //Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output			(self, hero, "THF_403_INSIDER_11_05"); //První co se musíš naučit je tiše se pohybovat.
//	AI_Output			(self, hero, "THF_403_INSIDER_11_06"); //Sag mir Bescheid, wenn du bereit bist.
	AI_Output			(self, hero, "THF_403_INSIDER_11_06"); //Až budeš připraven, dej mi vědět.

	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info LEARNSNEAK
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LEARNSNEAK		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr			 = 	23;
	condition	 = 	THF_403_Gerion_LEARNSNEAK_Condition;
	information	 = 	THF_403_Gerion_LEARNSNEAK_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_LearnSneak, LPCOST_TALENT_SNEAK,0);
};

func int THF_403_Gerion_LEARNSNEAK_Condition ()
{
	if	(Npc_KnowsInfo(hero,THF_403_Gerion_INSIDER) || Npc_KnowsInfo(hero, THF_403_Gerion_TELLDIEGO2))
	&&	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_LEARNSNEAK_Info ()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
//		AI_Output			(hero, self, "THF_403_LEARNSNEAK_15_01"); //Zeig mir, wie ich mich lautlos bewegen kann.
		AI_Output			(hero, self, "THF_403_LEARNSNEAK_15_01"); //Ukaž mi, jak se mohu tiše pohybovat.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_02"); //Das wichtigste ist, sein Körpergewicht optimal zu verteilen.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_02"); //Nejdůležitější je optimální rozložení tělesné váhy.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_03"); //Dann hast du den Boden besser im Blick und deinen Körper besser unter Kontrolle.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_03"); //Tak máš lepší výhled na zem a máš své tělo lépe pod kontrolou.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_04"); //Wenn du schleichst hört dich zwar niemand, aber du bist nicht unsichtbar. Paß auf, daß dich keiner beobachtet.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_04"); //Když se plížíš, nikdo tě neslyší, ale nejsi neviditelný! Ujisti se, že tě nikdo nesleduje.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_05"); //Wenn jemand dich herumschleichen sieht, wird er dich im Auge behalten!
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_05"); //Pokud tě někdo zpozoruje, jak se plížíš, bude tě pozorovat!
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_06"); //Ich hab 'ne kleine Aufgabe für dich.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_06"); //Mám pro tebe malý úkol.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_07"); //Im Haus der Erzbarone, im Obergeschoß gibt es einen Schlafraum. Dort liegt irgendwo ein Schlüssel. Den brauche ich.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_07"); //V budově Rudobaronů, v horním patře, je ložnice. Někde v té ložnici leží klíč. Ten potřebuji!
//		AI_Output			(hero, self, "THF_403_LEARNSNEAK_15_08"); //Klingt einfach.
		AI_Output			(hero, self, "THF_403_LEARNSNEAK_15_08"); //To zní docela snadně.
//		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_09"); //Ist es auch! Osbert bewacht zwar den Raum, aber du weisst ja jetzt, wie du unbemerkt an ihm vorbeikommst.
		AI_Output			(self, hero, "THF_403_LEARNSNEAK_11_09"); //To také je! Osbert stojí před tou místností stráž, ale teď už víš, jak se kolem něj nepozorovaně proplížit.

		Log_CreateTopic (CH1_TrainSneak,LOG_MISSION);
		Log_SetTopicStatus  (CH1_TrainSneak,LOG_RUNNING);
//		B_LogEntry (CH1_TrainSneak,"Gerion will einen Schlüssel aus dem Obergeschoß des Erzbaronhauses haben. Ich muß mich an Osbert vorbeischleichen, der den Raum bewacht.");
		B_LogEntry (CH1_TrainSneak,"Gerion chce klíč z ložnice z druhého patra budovy Rudobaronů. Musím se proplížit kolem Osberta, který před dveřmi stojí stráž.");

		THF_403_Gerion_LEARNSNEAK.permanent = FALSE;
		LearnSneak = LOG_RUNNING;

		Mob_CreateItems ("OCC_GOMEZROOM_THRONE_01", ItKe_Jail,1);
		Mob_CreateItems ("OCC_GOMEZROOM_THRONE_01", ItMi_Silver,10);

		AI_StopProcessInfos (self);
	};

};
///////////////////////////////////////////////////////////////////////
//	Info KEYRUNNING
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_KEYRUNNING		(C_INFO)
{
	npc			 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_KEYRUNNING_Condition;
	information	 = 	THF_403_Gerion_KEYRUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int THF_403_Gerion_KEYRUNNING_Condition ()
{
	if (Npc_HasItems (hero, ITKE_Jail) == 0)
	&& LearnSneak == LOG_RUNNING
	&& !Npc_KnowsInfo (hero,MIL_123_Osbert_THIEF)
	&&  C_NPCisinvincible(self)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_KEYRUNNING_Info ()
{
//	AI_Output			(self, hero, "THF_403_KEYRUNNING_11_01"); //Hast du den Schlüssel schon?
	AI_Output			(self, hero, "THF_403_KEYRUNNING_11_01"); //Už máš ten klíč?
//	AI_Output			(self, hero, "THF_403_KEYRUNNING_11_02"); //Wenn du an Osbert vorbeischleichst, sollte das kein Problem sein.
	AI_Output			(self, hero, "THF_403_KEYRUNNING_11_02"); //Když se proplížíš kolem Osberta, neměl bys mít problém ten klíč najít.
};


///////////////////////////////////////////////////////////////////////
//	Info GOTKEY
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTKEY		(C_INFO)
{
	npc		 	= 	THF_403_Gerion;
	nr		 	= 	24;
	condition	 = 	THF_403_Gerion_GOTKEY_Condition;
	information	 = 	THF_403_Gerion_GOTKEY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe den Schlüssel";
	description	 = 	"Mám ten klíč.";
};

func int THF_403_Gerion_GOTKEY_Condition ()
{
	if (Npc_HasItems (hero, ITKE_Jail) >=1)
	&& LearnSneak == LOG_RUNNING
	{
		return TRUE;
	};
};
func void THF_403_Gerion_GOTKEY_Info ()
{
//	AI_Output			(hero, self, "THF_403_GOTKEY_15_01"); //Ich habe den Schlüssel.
	AI_Output			(hero, self, "THF_403_GOTKEY_15_01"); //Mám ten klíč.
	B_GiveInvItems		(hero, self, Itke_Jail,1);
//	AI_Output			(self, hero, "THF_403_GOTKEY_11_02"); //Gute Arbeit! Vielleicht wird aus dir noch ein richtig guter Dieb.
	AI_Output			(self, hero, "THF_403_GOTKEY_11_02"); //Dobrá práce! Možná z tebe nakonec bude dobrý zloděj.
//	AI_Output			(self, hero, "THF_403_GOTKEY_11_03"); //Ich kann dir noch etwas über TASCHENDIEBSTAHL und SCHLÖSSER KNACKEN beibringen.
	AI_Output			(self, hero, "THF_403_GOTKEY_11_03"); //Ještě tě mohu něco naučit o VYBÍRÁNÍ KAPES a PÁČENÍ ZÁMKŮ.

	LearnSneak = LOG_SUCCESS;

	Log_SetTopicStatus  (CH1_TrainSneak,LOG_SUCCESS);
//	B_LogEntry (CH1_TrainSneak,"Ich habe Gerion den Schlüssel besorgt. Jetzt ist er bereit mir Grundkenntnisse in TASCHENDIEBSTAHL und SCHLÖSSER KNACKEN beizubringen.");
	B_LogEntry (CH1_TrainSneak,"Obstaral jsem Gerionovi ten klíč. Teď je připraven mě naučit základy VYBÍRÁNÍ KAPES a PÁČENÍ ZÁMKŮ.");
};

///////////////////////////////////////////////////////////////////////
//	Info SNEAKFAILED
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SNEAKFAILED		(C_INFO)
{
	npc		     = 	THF_403_Gerion;
	nr		 	 = 	45;
	condition	 = 	THF_403_Gerion_SNEAKFAILED_Condition;
	information	 = 	THF_403_Gerion_SNEAKFAILED_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wegen dem Schlüssel...";
	description	 = 	"O tom klíči...";
};

func int THF_403_Gerion_SNEAKFAILED_Condition ()
{
	if	(LearnSneak == LOG_RUNNING)
	&&	Npc_KnowsInfo(hero, MIL_123_Osbert_THIEF)
	&&	!Npc_HasItems(hero, ITKE_Jail)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_SNEAKFAILED_Info ()
{
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_01"); //Wegen dem Schlüssel...
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_01"); //O tom klíči...
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_02"); //Hast du ihn?
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_02"); //Máš ho?
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_03"); //Osbert hat ihn mir abgenommen.
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_03"); //Osbert mě s ním načapal.
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_04"); //Dann sehe ich jetzt drei Möglichkeiten.
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_04"); //Potom vidím tři možnosti.
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_05"); //Und welche?
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_05"); //Jaké?
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_06"); //Wir könnten die ganze Sache einfach vergessen und Du schminkst dir ab, weitere Diebestalente zu lernen.
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_06"); //Můžeme na celou tu záležitost zapomenout a ty se vzdáš možnosti naučit se zlodějským dovednostem.
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_07"); //Du könntest Osbert auch niederschlagen und ihm den Schlüssel abnehmen. Das dürfte aber sehr schwierig werden!
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_07"); //Mohl bys Osberta zmlátit a klíč mu vzít. Ale to by mohlo být velmi obtížné!
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_08"); //...oder?
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_15_08"); //...nebo?
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_09"); //Oder ich zeige dir den TASCHENDIEBSTAHL und du nimmst ihm den Schlüssel heimlich ab!
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_11_09"); //Nebo ti ukážu jak VYBÍRAT KAPSY a ty mu ten klíč ukradneš!

//	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Zeige mir den Taschendiebstahl", THF_403_Gerion_SNEAKFAILED_PICKPOCK );
	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Ukaž mi jak vybírat kapsy.", THF_403_Gerion_SNEAKFAILED_PICKPOCK );
//	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Ich werde Osbert niederschlagen", THF_403_Gerion_SNEAKFAILED_FIGHT );
	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Zmlátím Osberta!", THF_403_Gerion_SNEAKFAILED_FIGHT );
//	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Gut, vergessen wir die Sache", THF_403_Gerion_SNEAKFAILED_NEVERTHF );
	Info_AddChoice	(THF_403_Gerion_SNEAKFAILED, "Dobře, zapomeňme na to.", THF_403_Gerion_SNEAKFAILED_NEVERTHF );


};
func void THF_403_Gerion_SNEAKFAILED_NEVERTHF ()
{
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_NEVERTHF_15_01"); //Gut, vergessen wir die Sache.
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_NEVERTHF_15_01"); //Dobře, zapomeňme na to.
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_NEVERTHF_11_02"); //Als Dieb taugst du wirklich nicht viel! Besser du lernst etwas anderes.
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_NEVERTHF_11_02"); //Na zloděje se vůbec nehodíš! Radši se nauč něco jiného.

	LearnSneak = LOG_OBSOLETE;
	AI_StopProcessInfos (self);

	Log_SetTopicStatus  (CH1_TrainSneak,LOG_OBSOLETE);
//	B_LogEntry (CH1_TrainSneak,"Nachdem ich schon bei meiner ersten Aufgabe als Dieb gescheitert bin, ist es wohl besser, keine weitere Zeit und Mühe in die Diebeskunst zu investieren.");
	B_LogEntry (CH1_TrainSneak,"Po tom, co jsem selhal při plnění své první zlodějské mise, bude pravděpodobně lepší, když se nebudu zlodějským řemeslem dále zabývat.");
};

func void THF_403_Gerion_SNEAKFAILED_FIGHT ()
{
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_FIGHT_15_01"); //Ich werde Osbert niederschlagen
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_FIGHT_15_01"); //Zmlátím Osberta!
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_FIGHT_11_02"); //Oder er Dich! Viel Glück! Wenn du es dir anders überlegst, sag mir Bescheid.
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_FIGHT_11_02"); //Nebo on tebe! Hodně štěstí! Pokud si to rozmyslíš, dej mi vědět.

	LearnSneak = LOG_FAILED;
	AI_StopProcessInfos (self);
};

func void THF_403_Gerion_SNEAKFAILED_PICKPOCK ()
{
//	AI_Output			(hero, self, "THF_403_SNEAKFAILED_PICKPOCK_15_01"); //Zeig mir den Taschendiebstahl.
	AI_Output			(hero, self, "THF_403_SNEAKFAILED_PICKPOCK_15_01"); //Ukaž mi jak vybírat kapsy.
//	AI_Output			(self, hero, "THF_403_SNEAKFAILED_PICKPOCK_11_02"); //Das ist die Antwort eines Diebes! Wir können sofort anfangen, wenn du bereit bist.
	AI_Output			(self, hero, "THF_403_SNEAKFAILED_PICKPOCK_11_02"); //To je odpověď zloděje! Můžeme začít hned, jak budeš připraven.

	Info_ClearChoices (THF_403_Gerion_SNEAKFAILED);
	LearnSneak = LOG_FAILED;

};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
func void THF_403_BuysWarez ()
{
	if	!Gerion_Dealer
	{
//		AI_Output			(self, hero, "THF_403_BUYSWAREZ_1_11_01"); //Ach... und nochwas!
		AI_Output			(self, hero, "THF_403_BUYSWAREZ_1_11_01"); //Ach... a ještě něco!
//		AI_Output			(hero, self, "THF_403_BUYSWAREZ_1_15_02"); //Was?
		AI_Output			(hero, self, "THF_403_BUYSWAREZ_1_15_02"); //Co?
//		AI_Output			(self, hero, "THF_403_BUYSWAREZ_1_11_03"); //Wenn du jemanden suchst, der dir organisierte Waren abnimmt... sprich mich an!
		AI_Output			(self, hero, "THF_403_BUYSWAREZ_1_11_03"); //Pokud hledáš někoho, kdo ti pomůže od kradeného zboží... obrať se na mě!
//		AI_Output			(hero, self, "THF_403_BUYSWAREZ_1_15_04"); //Werde es im Hinterkopf behalten.
		AI_Output			(hero, self, "THF_403_BUYSWAREZ_1_15_04"); //Budu si to pamatovat.

		Gerion_Dealer		= TRUE;

		B_Give_Gerion_ChapterItems(chapter);

		Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//		B_LogEntry			(GE_TraderOC, "Gerion kauft HEHLERWARE aller Art ab. Er treibt sich am hinteren Tor herum.");
		B_LogEntry			(GE_TraderOC, "Gerion kupuje KRADENÉ ZBOŽÍ všeho druhu. Zdržuje se kolem zadní brány.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PICKPOCKET_1
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_PICKPOCKET_1		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr			 = 	33;
	condition	 = 	THF_403_Gerion_PICKPOCKET_1_Condition;
	information	 = 	THF_403_Gerion_PICKPOCKET_1_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_LearnPickpocket_1, LPCOST_TALENT_PICKPOCKET_1,0);
};

func int THF_403_Gerion_PICKPOCKET_1_Condition ()
{
	if	((LearnSneak == LOG_FAILED)	||	(LearnSneak == LOG_SUCCESS))
	&&	(Npc_GetTalentSkill(self, NPC_TALENT_PICKPOCKET) == 0)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_PICKPOCKET_1_Info ()
{
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
	{
//		AI_Output			(hero, self, "THF_403_PICKPOCKET_1_15_01"); //Zeig mir den Taschendiebstahl.
		AI_Output			(hero, self, "THF_403_PICKPOCKET_1_15_01"); //Ukaž mi jak vybírat kapsy.
//		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_02"); //Die hohe Kunst der Diebe! Es ist viel riskanter einen Menschen zu bestehlen, als eine Truhe zu knacken.
		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_02"); //To nejvyšší zlodějské umění! Je mnohem riskantnější okrást člověka, než mu vykrást truhlu.
//		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_03"); //Du musst dich anschleichen, damit dein Opfer dich nicht bemerkt.
		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_03"); //Musíš si dát pozor, aby tě tvá oběť nezpozorovala.
//		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_04"); //Und paß auf, daß dich niemand beobachtet! Such dir jemanden aus, der alleine ist oder schläft.
		AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_04"); //A také si dej pozor, aby tě nikdo nesledoval! Vyber si někoho, kdo je samotě nebo spí.

		THF_403_Gerion_PICKPOCKET_1.permanent = FALSE;

		if	Npc_KnowsInfo(hero,THF_403_Gerion_SNEAKFAILED)
		&&	(LearnSneak == LOG_FAILED)
		&&	!Npc_HasItems(hero, ITKE_Jail)
		{
//			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_05"); //jetzt kannst du ja versuchen, Osbert den Schlüssel aus der Tasche zu nehmen.
			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_05"); //Nyní si to můžeš vyzkoušet. Vytáhni Osbertovi z kapsy ten klíč!
//			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_06"); //Es wäre schlau es bei dem Schlüssel zu belassen. Je mehr du ihm wegnimmst, desto größer ist die Wahrscheinlichkeit, daß er dich erwischt!
			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_06"); //Bude rozumné vzít jen ten klíč. Čím věcí vezmeš, tím větší šance, že tě tvá oběť přistihne!

//			B_LogEntry (CH1_TrainSneak,"Gerion hat mir das Talent des Taschendiebstahls gezeigt. Jetzt kann ich Osbert den Schlüssel unbemerkt abnehmen");
			B_LogEntry (CH1_TrainSneak,"Gerion mi ukázal jak vybírat kapsy. Teď mohu Osbertovi nepozorovaně sebrat ten klíč.");
		};

		if	(LearnSneak == LOG_SUCCESS)
		{
//			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_07"); //Wenn du dir noch was verdienen willst, hätte ich noch was zu tun für dich.
			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_07"); //Pokud si chceš ještě něco vydělat, mám tu pro tebe ještě něco.
//			AI_Output			(hero, self, "THF_403_PICKPOCKET_1_15_08"); //Lass hören.
			AI_Output			(hero, self, "THF_403_PICKPOCKET_1_15_08"); //Poslouchám.
//			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_09"); //Wylfern, ein Rekrut der Miliz, besitzt einen Ring. Der ist mir 250 Silberstücke wert.
			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_09"); //Wylfern, rekrut milice, vlastní jeden prsten. Má pro mě hodnotu 250 stříbrných.
//			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_10"); //Du solltest es versuchen, wenn Wylfern alleine ist!
			AI_Output			(self, hero, "THF_403_PICKPOCKET_1_11_10"); //Měl bys to vyzkoušet, až bude Wylfern sám!

			LearnPickPocket_1	= LOG_RUNNING;
			Log_CreateTopic		(CH1_TrainPickpocket_1,LOG_MISSION);
			Log_SetTopicStatus	(CH1_TrainPickpocket_1,LOG_RUNNING);
//			B_LogEntry			(CH1_TrainPickpocket_1,"Wylfern, Rekrut der Miliz, besitzt einen Ring. Gerion würde mir 250 Silberstücke daür geben.");
			B_LogEntry			(CH1_TrainPickpocket_1,"Wylfern, rekrut milice, má u sebe jeden prsten. Gerion mi za něj dá 250 stříbrných.");
		};

		THF_403_BuysWarez	();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SECONDCHANCE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SECONDCHANCE		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	45;
	condition	 = 	THF_403_Gerion_SECONDCHANCE_Condition;
	information	 = 	THF_403_Gerion_SECONDCHANCE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe den Schlüssel!";
	description	 = 	"Mám ten klíč!";
};

func int THF_403_Gerion_SECONDCHANCE_Condition ()
{
	if	(Npc_GetTalentSkill(self, NPC_TALENT_PICKPOCKET) == 1)
	&&	(LearnSneak == LOG_FAILED)
	&&	Npc_HasItems(hero, ITKE_Jail)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_SECONDCHANCE_Info ()
{
//	AI_Output			(hero, self, "THF_403_SECONDCHANCE_15_01"); //Ich habe den Schlüssel!
	AI_Output			(hero, self, "THF_403_SECONDCHANCE_15_01"); //Mám ten klíč!
	B_GiveInvItems		(hero, self, Itke_Jail,1);
//	AI_Output			(self, hero, "THF_403_SECONDCHANCE_11_02"); //Na also. Du bist ja doch zu gebrauchen. Wenn du noch SCHLÖSSER KNACKEN lernen willst, bin ich dein Mann.
	AI_Output			(self, hero, "THF_403_SECONDCHANCE_11_02"); //No podívejme. Přeci jsi k něčemu užitečný. Pokud se chceš naučit PÁČIT ZÁMKY, stačí se zeptat.

	LearnSneak			= LOG_SUCCESS;
	Log_SetTopicStatus  (CH1_TrainSneak,LOG_SUCCESS);
//	B_LogEntry			(CH1_TrainSneak,"Ich habe Osbert den Schlüssel unbemerkt abgenommen. Gerion ist nun auch bereit mir Grundkenntnisse über SCHLÖSSER KNACKEN beizubringen");
	B_LogEntry			(CH1_TrainSneak,"Nepozorovaně jsem sebral Osbertovi klíč. Gerion je mě teď připraven naučit PÁČENÍ ZÁMKŮ.");
};

///////////////////////////////////////////////////////////////////////
//	Info OSBERTDOWN
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_OSBERTDOWN		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		     = 	13;
	condition	 = 	THF_403_Gerion_OSBERTDOWN_Condition;
	information	 = 	THF_403_Gerion_OSBERTDOWN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe Osbert niedergeschlagen. Hier ist der Schlüssel.";
	description	 = 	"Zmlátil jsem Osberta. Tady je ten klíč.";
};

func int THF_403_Gerion_OSBERTDOWN_Condition ()
{
	var C_NPC Osbert;
	Osbert = Hlp_GetNpc (MIL_123_Osbert);

	if	Osbert.aivar [AIV_WASDEFEATEDBYSC]
	{
		return TRUE;
	};
};
func void THF_403_Gerion_OSBERTDOWN_Info ()
{
//	AI_Output			(hero, self, "THF_403_OSBERTDOWN_15_01"); //Ich habe Osbert niedergeschlagen.
	AI_Output			(hero, self, "THF_403_OSBERTDOWN_15_01"); //Zmlátil jsem Osberta. Tady je ten klíč.
	B_GiveInvItems		(hero, self, Itke_Jail,1);
//	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_02"); //Tatsächlich? Dir scheint ja der direkte Weg besser zu liegen als der elegante.
	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_02"); //Opravdu? Zdá se, že se ti líbí spíš přímá cesta, než ta elegantní.
//	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_03"); //Ich löse Probleme auf andere Art. Mit dem Kopf, nicht mit der Waffe.
	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_03"); //Já řeším problémy jinak, hlavou a ne zbraní.
//	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_04"); //Zu einem guten Dieb gehört mehr, als nur das Aneignen von Besitz.
	AI_Output			(self, hero, "THF_403_OSBERTDOWN_11_04"); //Být zlodějem je něco víc, než jen hromadění majetku.

	LearnSneak			= LOG_SUCCESS;
	Log_SetTopicStatus  (CH1_TrainSneak,LOG_SUCCESS);
//	B_LogEntry			(CH1_TrainSneak,"Ich habe Osbert niedergeschlagen und Gerion den Schlüssel gebracht. Das war zwar nicht ganz im Sinn der Aufgabe, aber er wird mich weiterhin unterrichten");
	B_LogEntry			(CH1_TrainSneak,"Zmlátil jsem Osberta a přinesl jsem Gerionovi klíč. Nebylo to sice v duchu úkolu, ale bude mě učit dál.");
};

///////////////////////////////////////////////////////////////////////
//	Info LOCKPICK_1
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LOCKPICK_1		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	7;
	condition	 = 	THF_403_Gerion_LOCKPICK_1_Condition;
	information	 = 	THF_403_Gerion_LOCKPICK_1_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 =	B_BuildLearnString(NAME_LearnPicklock_1, LPCOST_TALENT_PICKLOCK_1, 0);
};

func int THF_403_Gerion_LOCKPICK_1_Condition ()
{
	if	(LearnSneak == LOG_SUCCESS)
	&&	(Npc_GetTalentSkill(self, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_LOCKPICK_1_Info ()
{
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
//		AI_Output			(hero, self, "THF_403_LOCKPICK_1_15_01"); //Zeige mir, wie ich Schlösser öffnen kann.
		AI_Output			(hero, self, "THF_403_LOCKPICK_1_15_01"); //Ukaž mi, jak mohu otevírat zámky.
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_02"); //Du brauchst auf jeden Fall Dietriche dazu.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_02"); //Každopádně k tomu potřebuješ nějaké šperháky.
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_03"); //Wenn du vorsichtig bist, wirst du weniger davon verbrauchen.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_03"); //Pokud budeš opatrný, nebudeš jich k tomu potřebovat tolik.
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_04"); //Bewege den Dietrich nach links oder rechts bis das Schloß aufgeht.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_04"); //Otáčej šperhákem doprava a doleva, dokud se zámek neotevře.
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_05"); //Bevor ich dir mehr beibringe, habe ich eine Aufgabe für dich.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_05"); //Před tím, než tě budu moci naučit víc, mám pro tebe úkol.
//		AI_Output			(hero, self, "THF_403_LOCKPICK_1_15_06"); //Wer hätte das gedacht?
		AI_Output			(hero, self, "THF_403_LOCKPICK_1_15_06"); //Kdo by si to pomyslel?
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_07"); //Ich brauche 20 Stengel Sumpfkraut. Einer der Bettler, Lakarus, handelt damit. Er hat einen Vorrat in seiner Hütte.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_07"); //Potřebuji 20 stonků trávy z bažin. Jeden žebrák, Lakarus, s ní obchoduje. Má zásoby ve své chatrči.
//		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_08"); //Warte auf einen günstigen Augenblick und besorge dir das Kraut.
		AI_Output			(self, other,"THF_403_LOCKPICK_1_11_08"); //Počkej si na správný okamžik a obstarej mi ty rostliny.

		Log_CreateTopic		(CH1_TrainLockpick_1,LOG_MISSION);
		Log_SetTopicStatus	(CH1_TrainLockpick_1,LOG_RUNNING);
//		B_LogEntry			(CH1_TrainLockpick_1,"Lakarus der Bettler verwahrt seinen Sumpfkrautvorrat in seiner Hütte. Gerion braucht 20 Stengel.");
		B_LogEntry			(CH1_TrainLockpick_1,"Lakarus, ten žebrák, uchovává své zásoby trávy z bažin v truhle ve své chatrči. Gerion potřebuje 20 kousků.");
		LearnPicklock_1		= LOG_RUNNING;

// This does nothing
//		THF_403_Gerion_LOCKPICK_1.permanent = FALSE;
		BF_Gerion_LOCKPICK_1 = TRUE;
	};

};
///////////////////////////////////////////////////////////////////////
//	Info WHEREHUT
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_WHEREHUT		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	44;
	condition	 = 	THF_403_Gerion_WHEREHUT_Condition;
	information	 = 	THF_403_Gerion_WHEREHUT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo hat Lakarus seine Hütte?";
	description	 = 	"Kde má Lakarus svojí chatrč?";
};

func int THF_403_Gerion_WHEREHUT_Condition ()
{
//	if	Npc_KnowsInfo (hero,THF_403_Gerion_LOCKPICK_1)
	if	Npc_KnowsInfo (hero,BF_Gerion_LOCKPICK_1)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_WHEREHUT_Info ()
{
//	AI_Output			(hero, self, "THF_403_WHEREHUT_15_01"); //Wo hat Lakarus seine Hütte?
	AI_Output			(hero, self, "THF_403_WHEREHUT_15_01"); //Kde má Lakarus svojí chatrč?
//	AI_Output			(self, hero, "THF_403_WHEREHUT_11_02"); //Oberhalb der Arena. Er sitzt die meiste Zeit davor...
	AI_Output			(self, hero, "THF_403_WHEREHUT_11_02"); //Nad arénou, celou dobu před ní posedává...

//	B_LogEntry (CH1_TrainLockpick_1,"Die Hütte von Lakarus steht oberhalb der Arena.");
	B_LogEntry (CH1_TrainLockpick_1,"Lakarova chatrč je nad arénou.");
};

///////////////////////////////////////////////////////////////////////
//	Info HERB
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_HERB		(C_INFO)
{
	npc		 = 	THF_403_Gerion;
	nr		 = 	13;
	condition	 = 	THF_403_Gerion_HERB_Condition;
	information	 = 	THF_403_Gerion_HERB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was willst du mit dem Sumpfkraut?";
	description	 = 	"Co chceš s tou trávou z bažin dělat?";
};

func int THF_403_Gerion_HERB_Condition ()
{
	if	(LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_HERB_Info ()
{
//	AI_Output			(hero, self, "THF_403_HERB_15_01"); //Was willst du mit dem Sumpfkraut?
	AI_Output			(hero, self, "THF_403_HERB_15_01"); //Co chceš s tou trávou z bažin dělat?
//	AI_Output			(self, hero, "THF_403_HERB_11_02"); //Das sage ich dir, wenn du mir das Kraut gebracht hast.
	AI_Output			(self, hero, "THF_403_HERB_11_02"); //To ti řeknu, až mi ji doneseš.
};
///////////////////////////////////////////////////////////////////////
//	Info LOCKPICKER
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_LOCKPICKER		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	14;
	condition	 = 	THF_403_Gerion_LOCKPICKER_Condition;
	information	 = 	THF_403_Gerion_LOCKPICKER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Woher bekomme ich Dietriche?";
	description	 = 	"Kde získám šperháky?";
};

func int THF_403_Gerion_LOCKPICKER_Condition ()
{
	if	(LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_LOCKPICKER_Info ()
{
//	AI_Output			(hero, self, "THF_403_LOCKPICKER_15_01"); //Woher bekomme ich Dietriche?
	AI_Output			(hero, self, "THF_403_LOCKPICKER_15_01"); //Kde získám šperháky?
//	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_02"); //Die sind sehr schwer zu kriegen.
	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_02"); //Ty je docela obtížné obstarat.
//	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_03"); //Ich gebe dir zwei Stück. Alle weiteren musst du dir selber besorgen.
	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_03"); //Dám ti dva kousky. Další si musíš koupit.
	B_GiveInvItems		(self, hero, ItKe_Lockpick,2);
//	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_04"); //Ich kann dir natürlich auch noch weitere Dietriche geben, aber das kostet dich dann eine Kleinigkeit.
	AI_Output			(self, hero, "THF_403_LOCKPICKER_11_04"); //Samozřejmě ti jich mohu dát více, ale bude tě to něco stát.
//	AI_Output			(hero, self, "THF_403_LOCKPICKER_15_05"); //Verstehe!
	AI_Output			(hero, self, "THF_403_LOCKPICKER_15_05"); //Rozumím!

	THF_403_BuysWarez	();
};

///////////////////////////////////////////////////////////////////////
//	Info GOTHERB
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTHERB		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr			 = 	3;
	condition	 = 	THF_403_Gerion_GOTHERB_Condition;
	information	 = 	THF_403_Gerion_GOTHERB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe das Sumpfkraut!";
	description	 = 	"Mám trávu z bažin!";
};

func int THF_403_Gerion_GOTHERB_Condition ()
{
	if	(Npc_HasItems (hero,ItPl_Swampweed) >= 20)
	&&	(LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_GOTHERB_Info ()
{
//	AI_Output			(hero, self, "THF_403_GOTHERB_15_01"); //Ich habe das Sumpfkraut!
	AI_Output			(hero, self, "THF_403_GOTHERB_15_01"); //Mám trávu z bažin!
//	AI_Output			(self, hero, "THF_403_GOTHERB_11_02"); //Gut gemacht! Bring es zu Isgar, dem Heiler.
	AI_Output			(self, hero, "THF_403_GOTHERB_11_02"); //Dobrá práce! Dones ji Isgarovi, tomu léčiteli.
//	AI_Output			(self, hero, "THF_403_GOTHERB_11_03"); //Sag ihm du willst den Wein abholen. Diesen Wein bringst du mir. Verstanden?
	AI_Output			(self, hero, "THF_403_GOTHERB_11_03"); //Řekni mu, že si chceš vyzvednout víno. To víno mi potom přines, jasný?
//	AI_Output			(hero, self, "THF_403_GOTHERB_15_04"); //Klar. Was ist das besondere an dem Wein?
	AI_Output			(hero, self, "THF_403_GOTHERB_15_04"); //Jasně. Co je na tom víně zvláštního?
//	AI_Output			(self, hero, "THF_403_GOTHERB_11_05"); //Es ist eine spezielle Mischung mit einer...einschläfernden Wirkung...
	AI_Output			(self, hero, "THF_403_GOTHERB_11_05"); //Jedná se o speciální směs s... uspávacím účinkem...



//	B_LogEntry (CH1_TrainLockpick_1,"Gerion will das ich das Sumpfkraut bei dem Heiler Isgar gegen einen 'Schlafwein' tausche.");
	B_LogEntry (CH1_TrainLockpick_1,"Gerion chce, abych u léčitele Isgara vyměnil trávu z bažin za 'uspávací' víno.");
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEPWINE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_SLEEPWINE		(C_INFO)
{
	npc		 = 	THF_403_Gerion;
	nr		 = 	12;
	condition	 = 	THF_403_Gerion_SLEEPWINE_Condition;
	information	 = 	THF_403_Gerion_SLEEPWINE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe den Wein";
	description	 = 	"Mám to víno.";
};

func int THF_403_Gerion_SLEEPWINE_Condition ()
{
	if	(Npc_HasItems(hero,ItFo_SleepWine) >= 1)
	&&	(LearnPicklock_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_SLEEPWINE_Info ()
{
//	AI_Output			(hero, self, "THF_403_SLEEPWINE_15_01"); //Ich habe den Wein.
	AI_Output			(hero, self, "THF_403_SLEEPWINE_15_01"); //Mám to víno.
//	AI_Output			(self, hero, "THF_403_SLEEPWINE_11_02"); //Ausgezeichnet. Der wird uns später noch nützlich sein.
	AI_Output			(self, hero, "THF_403_SLEEPWINE_11_02"); //Výborně. To se nám bude později hodit.

		LearnPicklock_1		= LOG_SUCCESS;
		B_GiveXP			(XP_LearnPicklock);
		Log_SetTopicStatus	(CH1_TrainLockpick_1,LOG_SUCCESS);
//	    B_LogEntry 			(CH1_TrainLockpick_1,"Gerion hat den 'Schlafwein' bekommen.");
	    B_LogEntry 			(CH1_TrainLockpick_1,"Předal jsem Gerionovi 'uspávací' víno.");
};

///////////////////////////////////////////////////////////////////////
//	Info GOTRING
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_GOTRING	(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr			 = 	3;
	condition	 = 	THF_403_Gerion_GOTRING_Condition;
	information	 = 	THF_403_Gerion_GOTRING_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe den Ring";
	description	 = 	"Mám ten prsten.";
};

func int THF_403_Gerion_GOTRING_Condition ()
{
//	if	(Npc_HasItems (hero,ItPl_Swampweed) == 1)
//	&&	(LearnPickpocket_1 == LOG_RUNNING)
// fixed a bug with bad item check
	if	(Npc_HasItems (hero,ItRi_Fire_01) >= 1)
	&&	(LearnPickpocket_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_GOTRING_Info ()
{
//	AI_Output			(hero, self, "THF_403_GOTRING_15_01"); //Ich habe den Ring.
	AI_Output			(hero, self, "THF_403_GOTRING_15_01"); //Mám ten prsten.

	B_GiveInvItems		(hero, self, ItRi_Fire_01,1);
//	AI_Output			(self, hero, "THF_403_GOTRING_11_02"); //Und ich habe hier 250 Silberstücke für dich!
	AI_Output			(self, hero, "THF_403_GOTRING_11_02"); //A já tu pro tebe mám 250 stříbrných!

	B_GiveInvItems		(self, hero, ItMi_Silver,250);

	LearnPickpocket_1 = LOG_SUCCESS;

	Log_SetTopicStatus	(CH1_TrainPickpocket_1,LOG_SUCCESS);
//	B_LogEntry			(CH1_TrainPickpocket_1,"Gerion hat den Ring und ich bin um einige Silberstücke reicher");
	B_LogEntry			(CH1_TrainPickpocket_1,"Gerion dostal prsten a já jsem o pár kousků stříbra bohatší!");
};

///////////////////////////////////////////////////////////////////////
//	Info ALLIKNOW
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_ALLIKNOW		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	nr		 	 = 	22;
	condition	 = 	THF_403_Gerion_ALLIKNOW_Condition;
	information	 = 	THF_403_Gerion_ALLIKNOW_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich möchte meine Diebeskünste verbessern!";
	description	 = 	"Chci zlepšit své zlodějské dovednosti!";

};

func int THF_403_Gerion_ALLIKNOW_Condition ()
{
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_PICKPOCKET)>=1	)
	&&	(Npc_GetTalentSkill (hero,NPC_TALENT_PICKLOCK) 	>=1	)
	&&	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) 	>=1	)
	&&	(LearnPickpocket_1	!= LOG_RUNNING					)
	&&	(LearnPicklock_1	!= LOG_RUNNING					)
	&&	(LearnSneak		 	!= LOG_RUNNING					)
	{
		return TRUE;
	};
};
func void THF_403_Gerion_ALLIKNOW_Info ()
{
//	AI_Output			(hero, self, "THF_403_ALLIKNOW_15_01"); //Ich möchte meine Diebeskünste verbessern!
	AI_Output			(hero, self, "THF_403_ALLIKNOW_15_01"); //Chci zlepšit své zlodějské dovednosti!
//	AI_Output			(self, hero, "THF_403_ALLIKNOW_11_02"); //Ich habe dir alles beigebracht, was sich weiß.
	AI_Output			(self, hero, "THF_403_ALLIKNOW_11_02"); //Naučil jsem tě všechno, co umím!
//	AI_Output			(self, hero, "THF_403_ALLIKNOW_11_03"); //Wenn du mehr lernen willst, musst du dir einen anderen Lehrer suchen.
	AI_Output			(self, hero, "THF_403_ALLIKNOW_11_03"); //Pokud se chci naučit víc, musíš si najít jiného učitele.

	Log_CreateTopic		(GE_TeacherOC,	LOG_NOTE);
//	B_LogEntry			(GE_TeacherOC,	"Gerion hat kann mir alles beigebracht, was er über die Diebeskünste weiss. Wenn ich noch mehr lernen will, muss ich mir einen anderen Lehrer suchen.");
	B_LogEntry			(GE_TeacherOC,	"Gerion mě naučil vše, co o zlodějských dovednostech ví. Pokud se chci naučit víc, musím najít zkušenějšího učitele");
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TRADE		(C_INFO)
{
	npc		 	 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_TRADE_Condition;
	information	 = 	THF_403_Gerion_TRADE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
//	description	 = 	"Ich hab' da ein paar Dinge...";
	description	 = 	"Mám tady pár věcí...";
};

func int THF_403_Gerion_TRADE_Condition ()
{
	if	Gerion_Dealer
	&&	(Npc_GetDistToWP(self, GERION_WP) > 300)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_TRADE_Info ()
{
//	AI_Output			(hero, self, "THF_403_TRADE_15_01"); //Ich hab' da ein paar Dinge...
	AI_Output			(hero, self, "THF_403_TRADE_15_01"); //Mám tady pár věcí...
//	AI_Output			(self, hero, "THF_403_TRADE_11_02"); //OK, aber nicht hier.
	AI_Output			(self, hero, "THF_403_TRADE_11_02"); //OK, ale ne tady.
//	AI_Output			(self, hero, "THF_403_TRADE_11_03"); //Komm mit.
	AI_Output			(self, hero, "THF_403_TRADE_11_03"); //Pojď za mnou.
	AI_StopProcessInfos	(self);

	TA_BeginOverlay		(self);
	TA_Stay				(00,00,00,30,GERION_WP);
	TA_EndOverlay		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADENOW
///////////////////////////////////////////////////////////////////////
instance THF_403_Gerion_TRADENOW		(C_INFO)
{
	npc		 = 	THF_403_Gerion;
	condition	 = 	THF_403_Gerion_TRADENOW_Condition;
	information	 = 	THF_403_Gerion_TRADENOW_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

//	description	 = 	"Nun lass uns zum Geschäft kommen!";
	description	 = 	"Teď můžeme obchodovat!";
};

func int THF_403_Gerion_TRADENOW_Condition ()
{
	if	Gerion_Dealer
	&&	(Npc_GetDistToWP(self, GERION_WP) <= 300)
	{
		return TRUE;
	};
};

func void THF_403_Gerion_TRADENOW_Info ()
{
//	AI_Output			(hero, self, "THF_403_TRADENOW_15_01"); //Nun lass uns zum Geschäft kommen!
	AI_Output			(hero, self, "THF_403_TRADENOW_15_01"); //Teď můžeme obchodovat!
//	AI_Output			(self, hero, "THF_403_TRADENOW_11_02"); //Nichts lieber als das (hehe)
	AI_Output			(self, hero, "THF_403_TRADENOW_11_02"); //Bude mi potěšením (hehe)
};
