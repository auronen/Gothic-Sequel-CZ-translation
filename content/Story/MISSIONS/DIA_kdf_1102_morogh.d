// 			EXIT

instance  KDF_1102_Morogh_Exit (C_INFO)
{
	npc			=  KDF_1102_Morogh;
	nr			=  999;
	condition	=  KDF_1102_Morogh_Exit_Condition;
	information	=  KDF_1102_Morogh_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  KDF_1102_Morogh_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_1102_Morogh_Exit_Info()
{
	AI_StopProcessInfos		(self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance KDF_1102_Morogh_WELCOME		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	1;
	condition	 = 	KDF_1102_Morogh_WELCOME_Condition;
	information	 = 	KDF_1102_Morogh_WELCOME_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
	
};

func int KDF_1102_Morogh_WELCOME_Condition ()
{	
	if C_NPCisinvincible (self)
	&& !Npc_KnowsInfo (hero,PC_Mage_TODO)
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_WELCOME_Info ()
{
	var int randomizer;
	randomizer	= Hlp_Random(3); 
	
	if (randomizer == 1)
	{
//		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_01"); //Was hast du hier zu suchen? Mach dich irgendwo nützlich! - Woanders !
		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_01"); //Co tady pohledáváš? Dělej někde něco užitečného! - Někde jinde !
	
		AI_StopProcessInfos		(self);
	};
	if (randomizer == 2)
	{
//		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_02"); //Hast du nichts anderes zu tun, als mich zu belästigen? 
		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_02"); //Nemáš nic jiného na práci, než mě otravovat?
	
		AI_StopProcessInfos		(self);
	};
	if (randomizer == 3)
	{
//		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_03"); //Du stiehlst meine Zeit! Verschwinde!
		AI_Output			(self, hero, "KDF_1102_Morogh_WELCOME_00_03"); //Kradeš mi čas! Zmizni!   
	
		AI_StopProcessInfos		(self);
	};

};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
/* TEMPORÄR OBSOLETE
instance KDF_1102_Morogh_HI		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	2;
	condition	 = 	KDF_1102_Morogh_HI_Condition;
	information	 = 	KDF_1102_Morogh_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"(Konzentration der magischen Tränke) ";
	description	 = 	"(Koncentrace magických lektvarů) ";
};

func int KDF_1102_Morogh_HI_Condition ()
{	
	if Npc_KnowsInfo (hero,PC_Mage_TODO)
	
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_HI_Info ()
{
//	AI_Output			(hero, self, "KDF_1102_HI_15_01"); //Ich hörte, du suchst nach einer Möglichkeit  die Konzentration der magischen Tränke zu erhöhen?
	AI_Output			(hero, self, "KDF_1102_HI_15_01"); //Slyšel jsem, že hledáš možnost, jak zvýšit koncentraci magických lektvarů. 
//	AI_Output			(self, hero, "KDF_1102_HI_14_02"); //Tatsächlich. Und was willst du von mir?
	AI_Output			(self, hero, "KDF_1102_HI_14_02"); //Vskutku. A co ode mě chceš?
	
	Info_ClearChoices (KDF_1102_Morogh_HI);
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_ALCHEMY) >= 1 )
	{
//		Info_AddChoice (KDF_1102_Morogh_HI,"Wir sind Kollegen",KDF_1102_Morogh_HI_PARTNER);
		Info_AddChoice (KDF_1102_Morogh_HI,"Jsme kolegové",KDF_1102_Morogh_HI_PARTNER);
//		Info_AddChoice (KDF_1102_Morogh_HI,"Ich hab schon mal ein paar Tränke gebraut",KDF_1102_Morogh_HI_COOL);
		Info_AddChoice (KDF_1102_Morogh_HI,"Už jsem taky pár lektvarů uvařil",KDF_1102_Morogh_HI_COOL);
	};
	
//	Info_AddChoice (KDF_1102_Morogh_HI,"Vielleicht kann ich dir helfen? ",KDF_1102_Morogh_HI_SUGGEST);
	Info_AddChoice (KDF_1102_Morogh_HI,"Možná bych ti mohl pomoct? ",KDF_1102_Morogh_HI_SUGGEST);
	
};
FUNC VOID KDF_1102_Morogh_HI_PARTNER()
{
//	AI_Output			(hero, self, "KDF_1102_HI_PARTNER_15_01"); //Wir sind Kollegen.
	AI_Output			(hero, self, "KDF_1102_HI_PARTNER_15_01"); //Jsme kolegové.
	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_02"); //
	
	Info_ClearChoices (KDF_1102_Morogh_HI);
};
FUNC VOID KDF_1102_Morogh_HI_COOL()
{
//	AI_Output			(hero, self, "KDF_1102_HI_COOL_15_01"); //Ich hab schon mal ein paar Tränke gebraut.
	AI_Output			(hero, self, "KDF_1102_HI_COOL_15_01"); //Už jsem taky pár lektvarů uvařil.
//	AI_Output			(self, hero, "KDF_1102_HI_COOL_14_02"); //So, dann verstehst du ja wie wichtig die Dosierung verschiedener Zutaten ist.
	AI_Output			(self, hero, "KDF_1102_HI_COOL_14_02"); //Pak rozumíš, jak důležité je dávkování různých přísad.
//	AI_Output			(self, hero, "KDF_1102_HI_COOL_14_03"); //Ich benötige einige Zutaten und mein Lieferant ist längst überfällig.
	AI_Output			(self, hero, "KDF_1102_HI_COOL_14_03"); //Potřebuji nějaké přísady, a můj dodavatel už má velké zpoždění.
	
	Info_ClearChoices (KDF_1102_Morogh_HI);
};
FUNC VOID KDF_1102_Morogh_HI_SUGGEST()
{
//	AI_Output			(hero, self, "KDF_1102_HI_PARTNER_15_01"); //Vielleicht kann ich dir helfen?
	AI_Output			(hero, self, "KDF_1102_HI_PARTNER_15_01"); //Možná bych ti mohl pomoct?
//	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_02"); //Du? Nein, ich....ja, ja warum nicht. Das ist eine gute Idee. 
	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_02"); //Ty? Ne, já....vlastně proč ne. To je dobrý nápad. 
//	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_03"); //So höre, ich bin gerade mit einem höchst wichtigen Experiment beschäftigt.
	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_03"); //Poslyš, jsem zaměstnán velmi důležitým experimentem.
//	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_04"); //Jedoch fehlen mir dazu noch einige Zutaten und mein Lieferant ist längst überfällig.
	AI_Output			(self, hero, "KDF_1102_HI_PARTNER_14_04"); //Avšak chybí mi k němu nějaké přísady a můj dodavatel už má velké zpoždění.
	
	Info_ClearChoices (KDF_1102_Morogh_HI);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance KDF_1102_Morogh_MISSION		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	4;
	condition	 = 	KDF_1102_Morogh_MISSION_Condition;
	information	 = 	KDF_1102_Morogh_MISSION_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich hörte du verbesserst die Konzentration magischer Tränke ?!";
	description	 = 	"Slyšel jsem, že vylepšuješ koncentraci magických lektvarů?!";
};

func int KDF_1102_Morogh_MISSION_Condition ()
{	
	if Npc_KnowsInfo  (hero,PC_Mage_TODO)
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_MISSION_Info ()
{
//	AI_Output			(hero, self, "KDF_1102_MISSION_15_01"); //Ich hörte du verbesserst die Konzentration magischer Tränke ?!
	AI_Output			(hero, self, "KDF_1102_MISSION_15_01"); //Slyšel jsem, že vylepšuješ koncentraci magických lektvarů ?!
//	AI_Output			(self, hero, "KDF_1102_MISSION_14_02"); //Tatsächlich. Und was willst du von mir? 
	AI_Output			(self, hero, "KDF_1102_MISSION_14_02"); //Vskutku. A co ode mě chceš? 
	
	Info_ClearChoices (KDF_1102_Morogh_MISSION);
	
//	Info_AddChoice (KDF_1102_Morogh_MISSION,"Ich hab schon mal ein paar Tränke gebraut.",KDF_1102_Morogh_MISSION_COOl);
	Info_AddChoice (KDF_1102_Morogh_MISSION,"Už jsem taky pár lektvarů uvařil.",KDF_1102_Morogh_MISSION_COOl);
//	Info_AddChoice (KDF_1102_Morogh_MISSION,"Wir sind Kollegen",KDF_1102_Morogh_MISSION_PARTNER);
	Info_AddChoice (KDF_1102_Morogh_MISSION,"Jsme kolegové",KDF_1102_Morogh_MISSION_PARTNER);
//	Info_AddChoice (KDF_1102_Morogh_MISSION,"Vielleicht kann ich dir helfen",KDF_1102_Morogh_MISSION_SUGGEST);
	Info_AddChoice (KDF_1102_Morogh_MISSION,"Možná bych ti mohl pomoct",KDF_1102_Morogh_MISSION_SUGGEST);
};
FUNC VOID KDF_1102_Morogh_MISSION_COOl()
{
//	AI_Output			(hero, self, "KDF_1102_MISSION_COOL_15_01"); //Ich hab schon mal ein paar Tränke gebraut.
	AI_Output			(hero, self, "KDF_1102_MISSION_COOL_15_01"); //Už jsem taky pár lektvarů uvařil.
//	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_02"); //So, dann weißt du ja wie aufwendig weiterführende Forschungen sind.
	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_02"); //Pak víš, jak pracný je další výzkum.
//	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_03"); //Wie du eben richtig bemerkt hast, versuche ich die Konzentration von magsichen Tränken zu erhöhen. 
	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_03"); //Jak sis správně všimnul, snažím se zvýšit koncentraci magických lektvarů
//	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_04"); //Jedoch fehlen mir noch einige Zutaten. Denn bedauerlicherweise ist mein Lieferant längst überfällig.
	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_04"); //Ale chybí mi nějaké přísady. Bohužel má můj dodavatel už velké zpoždění.
//	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_05"); //Wenn du mir die benötigten Zutaten bringst, wäre ich einen großen Schritt weiter.
	AI_Output			(self, hero, "KDF_1102_MISSION_COOL_14_05"); //Kdybys mi přinesl potřebné přísady, posunul bych se o kus dál.
	
	Info_ClearChoices (KDF_1102_Morogh_MISSION);
};
FUNC VOID KDF_1102_Morogh_MISSION_PARTNER() 
{
//	AI_Output			(hero, self, "KDF_1102_MISSION_PARTNER_15_01"); //Wir sind Kollegen.
	AI_Output			(hero, self, "KDF_1102_MISSION_PARTNER_15_01"); //Jsme kolegové.
//	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_02"); //Kollegen? Ach ja? dann hör mal gut zu 'Kollege'. 
	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_02"); //Kolegové? Aha, tak? Tedy dobře poslouchej, 'kolego'.  
//	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_03"); //Ich glaube nicht das du imstande bist, nachzuvollziehen WIEVIEL Arbeit ich in diese Forschungen gesteckt habe.
	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_03"); //Nevěřím, že bys byl schopen pochopit, JAK MOC práce jsem strávil s tímto výzkumem
//	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_04"); //Und nun, da ich kurz vor dem Ziel bin, fehlen mir nur noch ein paar Zutaten. Aber mein Lieferant ist längst überfällig.
	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_04"); //A teď, když už jsem tak blízko cíle, mi chybí ještě pár přísad. Ale můj dodavatel už má velké zpoždění. 
//	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_05"); //Also würde ich vorschlagen, so von 'Kollege zu Kollege' das du mir stattdessen dei Zutaten besorgst. 
	AI_Output			(self, hero, "KDF_1102_MISSION_PARTNER_14_05"); //Navrhnul bych tedy, jako 'kolega kolegovi', abys mi ty přísady obstaral místo něj. 
	
	Info_ClearChoices (KDF_1102_Morogh_MISSION);
};
FUNC VOID KDF_1102_Morogh_MISSION_SUGGEST()
{
//	AI_Output			(hero, self, "KDF_1102_MISSION_SUGGEST_15_01"); //Vielleicht kann ich dir helfen?
	AI_Output			(hero, self, "KDF_1102_MISSION_SUGGEST_15_01"); //Možná bych ti mohl pomoct?
//	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_02"); //Du? Nein, ich....ja, ja warum nicht. Das ist eine gute Idee.
	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_02"); //Ty? Ne, já....vlastně proč ne. To je dobrý nápad. 
//	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_03"); //So höre, ich bin gerade mit einem höchst wichtigen Experiment beschäftigt. 
	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_03"); //Poslyš, jsem zaměstnán velmi důležitým experimentem. 
//	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_04"); //Jedoch fehlen mir dazu noch einige Zutaten und mein Lieferant ist längst überfällig.
	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_04"); //Avšak chybí mi k němu nějaké přísady a můj dodavatel už má velké zpoždění. 
//	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_05"); //Wenn du mir die benötigten Zutaten bringst, wäre ich dir überaus... dankbar. 
	AI_Output			(self, hero, "KDF_1102_MISSION_SUGGEST_14_05"); //Pokud bys mi ty potřebné přísady přinesl, byl bych ti nesmírně... vděčný.
	
	Info_ClearChoices (KDF_1102_Morogh_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info INGREDENCIA
///////////////////////////////////////////////////////////////////////
instance KDF_1102_Morogh_INGREDENCIA		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	2;
	condition	 = 	KDF_1102_Morogh_INGREDENCIA_Condition;
	information	 = 	KDF_1102_Morogh_INGREDENCIA_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Welche Zutaten brauchst du?";
	description	 = 	"Jaké přísady potřebuješ?";
};

func int KDF_1102_Morogh_INGREDENCIA_Condition ()
{	
	if Npc_KnowsInfo (hero,KDF_1102_Morogh_MISSION)
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_INGREDENCIA_Info ()
{
//	AI_Output			(hero, self, "KDF_1102_INGREDENCIA_15_01"); //Welche Zutaten brauchst du?
	AI_Output			(hero, self, "KDF_1102_INGREDENCIA_15_01"); //Jaké přísady potřebuješ?
//	AI_Output			(self, hero, "KDF_1102_INGREDENCIA_14_02"); //Hier ist eine Liste mit den Sachen, die ich benötige.
	AI_Output			(self, hero, "KDF_1102_INGREDENCIA_14_02"); //Tady je seznam věcí, které potřebuji. 
	B_GiveInvItems 		(self,hero,ItWr_Morogh_List,1);
//	AI_Output			(self, hero, "KDF_1102_INGREDENCIA_14_02"); //Ich habe jetzt zu tun. Und komm nicht ohne die ausreichende Menge wieder! 
	AI_Output			(self, hero, "KDF_1102_INGREDENCIA_14_02"); //Teď mám co na práci. A nevracej se bez potřebného množství! 
	
	AI_StopProcessInfos		(self);
	Morogh_Trust = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info RYAN
///////////////////////////////////////////////////////////////////////
instance KDF_1102_Morogh_RYAN		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	4;
	condition	 = 	KDF_1102_Morogh_RYAN_Condition;
	information	 = 	KDF_1102_Morogh_RYAN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wer ist dein Lieferant?";
	description	 = 	"Kdo je tvůj dodavatel?";
};

func int KDF_1102_Morogh_RYAN_Condition ()
{
	if Npc_KnowsInfo (hero,KDF_1102_Morogh_MISSION)
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_RYAN_Info ()
{
//	AI_Output			(hero, self, "KDF_1102_RYAN_15_01"); //Wer ist dein Lieferant?
	AI_Output			(hero, self, "KDF_1102_RYAN_15_01"); //Kdo je tvůj dodavatel?
//	AI_Output			(self, hero, "KDF_1102_RYAN_14_02"); //Ein Kerl namens Ryan. Bisher war er zuverlässig aber er sollte längst wieder hier sein.
	AI_Output			(self, hero, "KDF_1102_RYAN_14_02"); //Chlápek jménem Ryan. Doposud byl spolehlivý, ale už tu dávno měl být.
//	AI_Output			(self, hero, "KDF_1102_RYAN_14_03"); //Na, wahrscheinlich haben ihn die Wölfe gefressen. 
	AI_Output			(self, hero, "KDF_1102_RYAN_14_03"); //No, nejspíše jej sežrali vlci.
};

///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance KDF_1102_Morogh_SUCCESS		(C_INFO)
{
	npc		 = 	KDF_1102_Morogh;
	nr		 = 	3;
	condition	 = 	KDF_1102_Morogh_SUCCESS_Condition;
	information	 = 	KDF_1102_Morogh_SUCCESS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe die benötigten Zutaten";
	description	 = 	"Mám potřebné přísady";
};

func int KDF_1102_Morogh_SUCCESS_Condition ()
{	
	if (Morogh_Trust == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItMi_Alcohol) >=  9)
	&& (Npc_HasItems (hero, ItPl_Stoneroot) >= 8)
	&& (Npc_HasItems (hero, ItPl_Nightshade) >= 7) 
	{
		return TRUE;
	};
};
func void KDF_1102_Morogh_SUCCESS_Info ()
{
//	AI_Output			(hero, self, "KDF_1102_SUCCESS_15_01"); //Ich habe die benötigten Zutaten.
	AI_Output			(hero, self, "KDF_1102_SUCCESS_15_01"); //Mám potřebné přísady.
	
	B_GiveInvItems (hero,self, ItMi_Alcohol,9); 		
	B_GiveInvItems (hero,self, ItPl_Stoneroot,8);
	B_GiveInvItems (hero,self, ItPl_Nightshade,7);
	
//	AI_Output			(self, hero, "KDF_1102_SUCCESS_14_02"); //Schön, schön. Dann kann ich meine Forschungen weiterführen. 
	AI_Output			(self, hero, "KDF_1102_SUCCESS_14_02"); //Pěkné, pěkné. Teď můžu pokračovat ve svém výzkumu. 
//	AI_Output			(self, hero, "KDF_1102_SUCCESS_14_03"); //War noch was? Ach so ja, ich werde erwähnen das du ganz brauchbar bist. 
	AI_Output			(self, hero, "KDF_1102_SUCCESS_14_03"); //Ještě něco? Ach ano, zmíním se, že jsi byl užitečný.
	
	Morogh_Trust = LOG_SUCCESS;
};
