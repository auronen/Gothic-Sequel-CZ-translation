// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

const string MOBNAME_BACKPACK_1		= "";
const string MOBNAME_CRATE			= "Bedna";
const string MOBNAME_CHEST			= "Truhla";
const string MOBNAME_BED			= "Lůžko";
const string MOBNAME_DOOR			= "Dveře";
const string MOBNAME_CAMP			= "";
const string MOBNAME_TORCH			= "";
const string MOBNAME_TORCHHOLDER	= "";
const string MOBNAME_BARBQ_SCAV		= "";
const string MOBNAME_BARRELO_OC		= "";
const string MOBNAME_BENCH			= "";
const string MOBNAME_ANVIL			= "Kovadlina";
const string MOBNAME_BUCKET			= "Vědro s vodou";
const string MOBNAME_FORGE			= "Výheň";
const string MOBNAME_GRINDSTONE		= "Brus";
const string MOBNAME_MELTER			= "Tavící pec";
const string MOBNAME_WHEEL			= "Naviják";
const string MOBNAME_LAB			= "Alchymistický stůl";
const string MOBNAME_BOOK			= "Stojan na knihy";
const string MOBNAME_CHAIR			= "";
const string MOBNAME_CAULDRON		= "Kotlík";
const string MOBNAME_THRONE			= "";
const string MOBNAME_PAN			= "Pánev";
const string MOBNAME_REPAIR			= "";
const string MOBNAME_WATERPIPE		= "Vodní dýmka";
const string MOBNAME_LADDER			= "Žebřík";
const string MOBNAME_SWITCH			= "Spínač";
const string MOBNAME_LEVER			= "Páka";
const string MOBNAME_BARONSTHRONE	= "";
const string MOBNAME_ORE			= "Magický nuget";
const string MOBNAME_ROPEWAY		= "";
const string MOBNAME_STOMPER		= "";
const string MOBNAME_STONEMILL		= "";
const string MOBNAME_ORC_MUMMY		= "Mumie";
const string MOBNAME_PILLAR			= "Sloup";
const string MOBNAME_BASKET_RICE	= "";
const string MOBNAME_DRUM			= "";
const string MOBNAME_GROUND_SLOT	= "n/a";
const string MOBNAME_HERB_PSI		= "Tlouček";
const string MOBNAME_IDOL			= "Figurka";
const string MOBNAME_LEAN_WALL		= "";
const string MOBNAME_ORCDRUM		= "";
const string MOBNAME_TARGETSTONE	= "Terč";
const string MOBNAME_SHRINE			= "Skřetí relikviář";
const string MOBNAME_SWORDSTONE		= "Podivný kámen";
const string MOBNAME_RUNEMELTER		= "Pec na tavení run";
const string MOBNAME_RUNEMAKER		= "Stůl na výrobu run";
const string MOBNAME_PHOENIX9		= "!!! Znovuzrození fénixe !!!";

// ********************************************************************************
//	Schemanamen für Mobsis 
// ********************************************************************************
//  TOTO SE NEPŘEKLÁDÁ
const string SCEMENAME_LAB			= "LAB";
const string SCEMENAME_BOW			= "BOGENMACHER";
const string SCEMENAME_FLETCHER		= "SCHNITZER";
const string SCEMENAME_ANVIL		= "BSANVIL";
const string SCEMENAME_ARENABENCH	= "ARENABENCH";
const string SCEMENAME_ARMORSTAND	= "ARMORSTAND";
const string SCEMENAME_BED			= "BED";
const string SCEMENAME_BEDHIGH		= "BEDHIGH";
const string SCEMENAME_BEDLOW		= "BEDLOW";
const string SCEMENAME_BOOK			= "BOOK";
const string SCEMENAME_CAULDRON		= "CAULDRON";
const string SCEMENAME_COOL			= "BSCOOL";
const string SCEMENAME_FIRE			= "BSFIRE";
const string SCEMENAME_MELTER		= "BSMELTER";
const string SCEMENAME_ORE			= "ORE";
const string SCEMENAME_RUNEMELTER	= "RMELTER";
const string SCEMENAME_RUNEMAKER	= "RMAKER";
const string SCEMENAME_SAW			= "BAUMSAEGE";
const string SCEMENAME_SHARP		= "BSSHARP";
const string SCEMENAME_STOMPER		= "STOMPER";
const string SCEMENAME_STONE		= "STEINMETZ";
const string SCEMENAME_WATERPIPE	= "SMOKE";
const string SCEMENAME_WOOD			= "WOOD";
const string SCEMENAME_REPAIR		= "REPAIR";
const string SCEMENAME_BENCH		= "BENCH";
const string SCEMENAME_HERB			= "HERB";
const string SCEMENAME_PAN			= "PAN";
// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
//	"(keine)",
	"(žádná)",
//	"Milizsoldat",
	"Voják milice",
//	"Arbeiter",
	"Dělník",
//	"Minenarbeiter",
	"Horník",
//	"Medikus",
	"Léčitel",
//	"Dieb",
	"Zloděj",
//	"Aussätziger",
	"Nemocný",
//	"Bettler",
	"Pobuda",
//	"Dämonenanbeter",
	"Uctívač démonů",
//	"Amazone",
	"Amazonka",
//	"Paladin",			// 10
	"Paladin",			// 10
//	"Sturmjäger-Klan",
	"Klan lovců bouře",
//	"Bluterde-Klan",
	"Klan krvavé země",
//	"Dämonenjäger",
	"Lovec démonů",
	"",
	"",
	"",
//	"Waran",			// 17
	"Ještěr",			// 17
	"",
//	"Goblin",
	"Goblin",
//	"Troll",
	"Troll",
//	"Snapper",
	"Chňapavec",
//	"Minecrawler",
	"Důlní červ",
//	"Fleischwanze",
	"Žravá štěnice",
//	"Scavenger",
	"Mrchožrout",
//	"Dämon",
	"Démon",
//	"Wolf",
	"Vlk",
//	"Schattenläufer",
	"Stínová šelma",
//	"Bloodfly",
	"Krvavá moucha",
//	"Sumpfhai",			// 30
	"Močálový žralok",			// 30
//	"Zombie",
	"Zombie",
//	"Zombie	Orc",
	"Skřetí zombie",
//	"Skelett",
	"Kostlivec",
//	"Ork-Hund",
	"Skřetí pes",
//	"Molerat",
	"Krysokrt",
//	"Golem",
	"Golem",
//	"Lurker",
	"Číhavec",
	"",				// 38
//	"Orc Schamane",
	"Skřetí šaman",
//	"Orc Krieger",
	"Skřetí bojovník",
//	"Orc Späher",
	"Skřetí zvěd",
//	"Orc Sklave"
	"Skřetí otrok"
};


// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************
// Die im TXT_SPELLS[]-Array angegebenen Namen für die Zauber werden ausschliesslich vom
// Programmcode verwendet. Für die Verwendung im Skript, folgt diesem Array eine Reihe
// von einzelnen String-Konstanten, mit gleichem Inhalt:
// -----------------------------------------------------------------------------------------
// WICHTIG: Wird in diesem Array eine Änderung vorgenommen, so muss diese Änderung auch
//			in der entsprechenden Stringkonstante NAMA_<Zaubername> erfolgen
// -----------------------------------------------------------------------------------------
/*
const STRING TXT_SPELLS	[MAX_SPELL]	=
{
	"Licht",						// SPL_LIGHT		=	0;
	"Feuerball",					// SPL_FIREBALL		=	1;
	"n/a",							// SPL_TRANSFORM	=	2;
	"Angst",						// SPL_FEAR			=	3;
	"Heilung",						// SPL_HEAL			=	4;
	"n/a",							// SPL_LIGHTNING	=	5;
	"Dämon beschwören",				// SPL_SUMMONDEMON	=	6;
	"Skelette beschwören",			// SPL_SUMMONSKELETON=	7;
	"n/a",							// SPL_FORGET		=	8;
	"Windfaust",					// SPL_WINDFIST		=	9;
	"Telekinese",					// SPL_TELEKINESIS	=	10;
	"Charme",						// SPL_CHARM		=	11;
	"Schlaf",						// SPL_SLEEP		=	12;
	"Pyrokinese",					// SPL_PYROKINESIS	=	13;
	"Todesring",					// SPL_MASSDEATH	=	14;
	"Kontrolle",					// SPL_CONTROL		=	15;
	"Untote vernichten",			// SPL_DESTROYUNDEAD=	16;
	"Feuerpfeil",					// SPL_FIREBOLT		=	17;
	"Feuersturm",					// SPL_FIRESTORM	=	18;
	"Feuerregen",					// SPL_FIRERAIN		=	19;
	"n/a",							// SPL_SPEED		=	20;
	"merkwürdiger Teleportzauber",	// SPL_TELEPORT1	=	21;
	"Teleport Wassermagier",		// SPL_TELEPORT2	=	22;
	"Teleport Dämonenbeschwörer",	// SPL_TELEPORT3	=	23;
	"Teleport Lager",				// SPL_TELEPORT4	=	24;
	"Teleport Sumpflager",			// SPL_TELEPORT5	=	25;
	"Verwandlung Blutfliege",		// SPL_TRF_BLOODFLY	=	26;
	"n/a",							// SPL_TRF_BLOODHOUND=	27;
	"Verwandlung Minecrawler",		// SPL_TRF_CRAWLER	=	28;
	"Verwandlung Lurker",			// SPL_TRF_LURKER	=	29;
	"Verwandlung Fleischwanze",		// SPL_TRF_MEATBUG	=	30;
	"Verwandlung Molerat",			// SPL_TRF_MOLERAT	=	31;
	"Verwandlung Orc-Hund",			// SPL_TRF_ORCDOG	=	32;
	"n/a",							// SPL_TRF_RAZOR	=	33;
	"Verwandlung Scavenger",		// SPL_TRF_SCAVENGER=	34;
	"n/a",							// SPL_TRF_SCAVENGER2=	35;
	"Verwandlung Schattenläufer",	// SPL_TRF_SHADOWBEAST=	36;
	"Verwandlung Snapper",			// SPL_TRF_SNAPPER	=	37;
	"Verwandlung Waran",			// SPL_TRF_WARAN	=	38;
	"Verwandlung Wolf",				// SPL_TRF_WOLF		=	39;
	"Blitz",						// SPL_CHAINLIGHTNING=	40;
	"Eispfeil",						// SPL_THUNDERBOLT	=	41;
	"Kugelblitz",					// SPL_THUNDERBALL	=	42;
	"Eisblock",						// SPL_ICECUBE		=	43;
	"Eiswelle",						// SPL_ICEWAVE		=	44;
	"Golem beschwören",				// SPL_SUMMONGOLEM	=	45;
	"Armee der Finsternis",			// SPL_ARMYOFDARKNESS=	46;
	"Sturmfaust",					// SPL_STORMFIST	=	47;
	"n/a",							// SPL_TELEKINESIS2	=	48;
	"Todeshauch",					// SPL_BREATHOFDEATH=	49;
	"Schrumpfen",					// SPL_SHRINK		=	50;
	"n/a",							// SPL_UNDRESS		=	51;
	"n/a",							// SPL_DANCE		=	52;
	"Raserei",						// SPL_BERZERK		=	53;
	"Zorn des URIZIEL",				// SPL_NEW1			=	17;
	"New2",							// SPL_NEW2			=	18;
	"New3",							// SPL_NEW3			=	19;
	"New4",							// SPL_NEW4			=	20;
	"New5"							// SPL_NEW5			=	21;
 };
*/
const STRING TXT_SPELLS	[MAX_SPELL]	=
{
	"Světlo",						// SPL_LIGHT		=	0;
	"Ohnivá koule",					// SPL_FIREBALL		=	1;
	"n/a",							// SPL_TRANSFORM	=	2;
	"Strach",						// SPL_FEAR			=	3;
	"Léčení",						// SPL_HEAL			=	4;
	"n/a",							// SPL_LIGHTNING	=	5;
	"Vyvolání démnoa",				// SPL_SUMMONDEMON	=	6;
	"Vyvolání kostlivce",			// SPL_SUMMONSKELETON=	7;
	"n/a",							// SPL_FORGET		=	8;
	"Větrná pěst",					// SPL_WINDFIST		=	9;
	"Telekineze",					// SPL_TELEKINESIS	=	10;
	"Šarm",							// SPL_CHARM		=	11;
	"Spánek",						// SPL_SLEEP		=	12;
	"Pyrokineze",					// SPL_PYROKINESIS	=	13;
	"Kruh smrti",					// SPL_MASSDEATH	=	14;
	"Ovládnutí",					// SPL_CONTROL		=	15;
	"Smrt nemrtvému",				// SPL_DESTROYUNDEAD=	16;
	"Ohnivý šíp",					// SPL_FIREBOLT		=	17;
	"Ohnivá bouře",					// SPL_FIRESTORM	=	18;
	"Ohnivý déšť",					// SPL_FIRERAIN		=	19;
	"n/a",							// SPL_SPEED		=	20;
	"Podivný teleport",				// SPL_TELEPORT1	=	21;
	"Teleport k mágům Vody",		// SPL_TELEPORT2	=	22;
	"Teleport k nekromancerovi",	// SPL_TELEPORT3	=	23;
	"Teleport do Starého tábora",	// SPL_TELEPORT4	=	24;
	"Teleport do tábora v bažinách",// SPL_TELEPORT5	=	25;
	"Proměna v krvavou mouchu",		// SPL_TRF_BLOODFLY	=	26;
	"n/a",							// SPL_TRF_BLOODHOUND=	27;
	"Proměna v důlního červa",		// SPL_TRF_CRAWLER	=	28;
	"Proměna v číhavce",			// SPL_TRF_LURKER	=	29;
	"Proměna ve žravou štěnici",	// SPL_TRF_MEATBUG	=	30;
	"Proměna v krysokrta",			// SPL_TRF_MOLERAT	=	31;
	"Proměna ve skřetího psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",							// SPL_TRF_RAZOR	=	33;
	"Proměna v mrchožrouta",		// SPL_TRF_SCAVENGER=	34;
	"n/a",							// SPL_TRF_SCAVENGER2=	35;
	"Proměna ve stínovou šelmu",	// SPL_TRF_SHADOWBEAST=	36;
	"Proměna v chňapavce",			// SPL_TRF_SNAPPER	=	37;
	"Proměna v ještěrku",			// SPL_TRF_WARAN	=	38;
	"Proměna ve vlka",				// SPL_TRF_WOLF		=	39;
	"Blesek",						// SPL_CHAINLIGHTNING=	40;
	"Ledový šíp",					// SPL_THUNDERBOLT	=	41;
	"Kulový blesk",					// SPL_THUNDERBALL	=	42;
	"Ledový blok",					// SPL_ICECUBE		=	43;
	"Ledová vlna",					// SPL_ICEWAVE		=	44;
	"Vyvolání golema",				// SPL_SUMMONGOLEM	=	45;
	"Armáda temnot",				// SPL_ARMYOFDARKNESS=	46;
	"Větrná pěst",					// SPL_STORMFIST	=	47;
	"n/a",							// SPL_TELEKINESIS2	=	48;
	"Dech smrti",					// SPL_BREATHOFDEATH=	49;
	"Zmenšit nestvůru",				// SPL_SHRINK		=	50;
	"n/a",							// SPL_UNDRESS		=	51;
	"n/a",							// SPL_DANCE		=	52;
	"Vztek",						// SPL_BERZERK		=	53;
	"Hněv Urizielu",				// SPL_NEW1			=	17;
	"New2",							// SPL_NEW2			=	18;
	"New3",							// SPL_NEW3			=	19;
	"New4",							// SPL_NEW4			=	20;
	"New5"							// SPL_NEW5			=	21;
 };

// -----------------------------------------------------------------------------------------
// WORKAROUND:	Da im Skript der Ausdruck TXT_SPELLS[SPL_LIGHT] nicht zulässig ist
//				und in einem konstanten String-Array keine String-Konstanten verwendet
//				werden können, müssen alle Namen der Zauber hier ein zweites Mal
//				angegeben werden!
// -----------------------------------------------------------------------------------------
const string	NAME_Light			=   "Světlo";						// SPL_LIGHT		=	0;
const string	NAME_Fireball		=	"Ohnivá koule";					// SPL_FIREBALL		=	1;
const string	NAME_Transform		=   "n/a";							// SPL_TRANSFORM	=	2;
const string	NAME_Fear			=	"Strach";						// SPL_FEAR			=	3;
const string	NAME_Heal			=	"Léčení";						// SPL_HEAL			=	4;
const string	NAME_Lightning		=   "n/a";							// SPL_LIGHTNING	=	5;
const string	NAME_Summondemon	=   "Vyvolání démnoa";				// SPL_SUMMONDEMON	=	6;
const string	NAME_Summonskeleton	=   "Vyvolání kostlivce";			// SPL_SUMMONSKELETON=	7;
const string	NAME_Forget			=   "n/a";							// SPL_FORGET		=	8;
const string	NAME_Windfist		=	"Větrná pěst";					// SPL_WINDFIST		=	9;
const string	NAME_Telekinesis	=   "Telekineze";					// SPL_TELEKINESIS	=	10;
const string	NAME_Charm			=   "Šarm";							// SPL_CHARM		=	11;
const string	NAME_Sleep			=   "Spánek";						// SPL_SLEEP		=	12;
const string	NAME_Pyrokinesis	=   "Pyrokineze";					// SPL_PYROKINESIS	=	13;
const string	NAME_Massdeath		=   "Kruh smrti";					// SPL_MASSDEATH	=	14;
const string	NAME_Control		=   "Ovládnutí";					// SPL_CONTROL		=	15;
const string	NAME_Destroyundead	=   "Smrt nemrtvému";				// SPL_DESTROYUNDEAD=	16;
const string	NAME_Firebolt		=	"Ohnivý šíp";					// SPL_FIREBOLT		=	17;
const string	NAME_Firestorm		=   "Ohnivá bouře";					// SPL_FIRESTORM	=	18;
const string	NAME_Firerain		=	"Ohnivý déšť";					// SPL_FIRERAIN		=	19;
const string	NAME_Speed			=   "n/a";							// SPL_SPEED		=	20;
const string	NAME_Teleport1		=   "Podivný teleport";				// SPL_TELEPORT1	=	21;
const string	NAME_Teleport2		=   "Teleport k mágům Vody";		// SPL_TELEPORT2	=	22;
const string	NAME_Teleport3		=   "Teleport k nekromancerovi";	// SPL_TELEPORT3	=	23;
const string	NAME_Teleport4		=   "Teleport do Starého tábora";	// SPL_TELEPORT4	=	24;
const string	NAME_Teleport5		=   "Teleport do tábora v bažinách";// SPL_TELEPORT5	=	25;
const string	NAME_Trf_Bloodfly	=	"Proměna v krvavou mouchu";		// SPL_TRF_BLOODFLY	=	26;
const string	NAME_Trf_Bloodhound	=   "n/a";							// SPL_TRF_BLOODHOUND=	27;
const string	NAME_Trf_Crawler	=   "Proměna v důlního červa";		// SPL_TRF_CRAWLER	=	28;
const string	NAME_Trf_Lurker		=   "Proměna v číhavce";			// SPL_TRF_LURKER	=	29;
const string	NAME_Trf_Meatbug	=   "Proměna ve žravou štěnici";	// SPL_TRF_MEATBUG	=	30;
const string	NAME_Trf_Molerat	=   "Proměna v krysokrta";			// SPL_TRF_MOLERAT	=	31;
const string	NAME_Trf_Orcdog		=   "Proměna ve skřetího psa";		// SPL_TRF_ORCDOG	=	32;
const string	NAME_Trf_Razor		=   "n/a";							// SPL_TRF_RAZOR	=	33;
const string	NAME_Trf_Scavenger	=   "Proměna v mrchožrouta";		// SPL_TRF_SCAVENGER=	34;
const string	NAME_Trf_Scavenger2	=   "n/a";							// SPL_TRF_SCAVENGER2=	35;
const string	NAME_Trf_Shadowbeast=	"Proměna ve stínovou šelmu";	// SPL_TRF_SHADOWBEAST=	36;
const string	NAME_Trf_Snapper	=   "Proměna v chňapavce";			// SPL_TRF_SNAPPER	=	37;
const string	NAME_Trf_Waran		=   "Proměna v ještěrku";			// SPL_TRF_WARAN	=	38;
const string	NAME_Trf_Wolf		=	"Proměna ve vlka";				// SPL_TRF_WOLF		=	39;
const string	NAME_Chainlightning	=   "Blesk";						// SPL_CHAINLIGHTNING=	40;
const string	NAME_Thunderbolt	=   "Ledový šíp";					// SPL_THUNDERBOLT	=	41;
const string	NAME_Thunderball	=   "Kulový blesk";					// SPL_THUNDERBALL	=	42;
const string	NAME_Icecube		=   "Ledový blok";					// SPL_ICECUBE		=	43;
const string	NAME_Icewave		=   "Ledová vlna";					// SPL_ICEWAVE		=	44;
const string	NAME_Summongolem	=   "Vyvolání golema";				// SPL_SUMMONGOLEM	=	45;
const string	NAME_Armyofdarkness	=   "Armáda temnot";				// SPL_ARMYOFDARKNESS=	46;
const string	NAME_Stormfist		=   "Větrná pěst";					// SPL_STORMFIST	=	47;
const string	NAME_Telekinesis2	=	"n/a";							// SPL_TELEKINESIS2	=	48;
const string	NAME_Breathofdeath	=   "Dech smrti";					// SPL_BREATHOFDEATH=	49;
const string	NAME_Shrink			=   "Zmenšit nestvůru";				// SPL_SHRINK		=	50;
const string	NAME_Undress		=   "n/a";							// SPL_UNDRESS		=	51;
const string	NAME_Dance			=   "n/a";							// SPL_DANCE		=	52;
const string	NAME_Berzerk		=   "Vztek";						// SPL_BERZERK		=	53;
const string	NAME_New1			=	"Hněv Urizielu";				// SPL_NEW1			=	17;
const string	NAME_New2			=	"New2";							// SPL_NEW2			=	18;
const string	NAME_New3			=	"New3";							// SPL_NEW3			=	19;
const string	NAME_New4			=	"New4";							// SPL_NEW4			=	20;
const string	NAME_New5			=	"New5";							// SPL_NEW5			=	21;

// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************

CONST STRING TXT_TALENTS [NPC_TALENT_MAX] =
{
	"",
//	"Einhänder",				// NPC_TALENT_1H
	"Jednoruční meč",		// NPC_TALENT_1H
//	"Zweihänder",               // NPC_TALENT_2H
	"Obouruční meč",         // NPC_TALENT_2H
//	"Kampfstab",                // NPC_TALENT_STAFF
	"Bojové hole",              // NPC_TALENT_STAFF
//	"Bogen",                    // NPC_TALENT_BOW
	"Luky",                     // NPC_TALENT_BOW
//	"Armbrust",                 // NPC_TALENT_CROSSBOW
	"Luš",                      // NPC_TALENT_CROSSBOW
//	"Schloss knacken",	        // NPC_TALENT_PICKLOCK
	"Otevírání zámků",	        // NPC_TALENT_PICKLOCK
//	"Diebstahl",        		// NPC_TALENT_PICKPOCKET
	"Vybírání kapes",     		// NPC_TALENT_PICKPOCKET
//	"Zaubern",                  // NPC_TALENT_MAGE
	"Magie",                    // NPC_TALENT_MAGE
//	"Schleichen",               // NPC_TALENT_SNEAK
	"Plížení",               	// NPC_TALENT_SNEAK
//	"Schmieden",                // NPC_TALENT_SMITH
	"Kovářství",                // NPC_TALENT_SMITH
//	"Kochen",                   // NPC_TALENT_COOK
	"Vaření",                   // NPC_TALENT_COOK
//	"Akrobatik",                // NPC_TALENT_ACROBAT
	"Akrobacie",                // NPC_TALENT_ACROBAT
//	"Runen erschaffen",			// NPC_TALENT_THAUMATURGY
	"Výroba run",				// NPC_TALENT_THAUMATURGY
//	"Bognerei",					// NPC_TALENT_BOWMAKER
	"Výroba luků",				// NPC_TALENT_BOWMAKER
//	"Alchemie",                 // NPC_TALENT_ALCHEMY
	"Alchymie",                 // NPC_TALENT_ALCHEMY
//	"Tiere zähmen",				// NPC_TALENT_ANIMALTAMING
	"Získávání trofejí",		// NPC_TALENT_ANIMALTAMING
	"UserDef5",
	"UserDef6",
	"UserDef7",
	"UserDef8",
	"UserDef9",
	"UserDef10"
};

CONST STRING TXT_TALENTS_SKILLS [NPC_TALENT_MAX] =
{
	"",
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_1H
	"začátečník|pokročilý|mistr",							// NPC_TALENT_1H
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_2H
	"začátečník|pokročilý|mistr",							// NPC_TALENT_2H
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_STAFF
	"začátečník|pokročilý|mistr",							// NPC_TALENT_STAFF
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_BOW
	"začátečník|pokročilý|mistr",							// NPC_TALENT_BOW
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_CROSSBOW
	"začátečník|pokročilý|mistr",							// NPC_TALENT_CROSSBOW
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_PICKLOCK
	"začátečník|pokročilý|mistr",							// NPC_TALENT_PICKLOCK
//	"ungeübt|ausgebildet|gemeistert",						// NPC_TALENT_PICKPOCKET
	"začátečník|pokročilý|mistr",							// NPC_TALENT_PICKPOCKET
//	"-|1.Kreis|2.Kreis|3.Kreis|4.Kreis|5.Kreis|6.Kreis",	// NPC_TALENT_MAGE
	"ne|Kruh 1|Kruh 2|Kruh 3|Kruh 4|Kruh 5|Kruh 6",			// NPC_TALENT_MAGE
//	"-|ausgebildet",										// NPC_TALENT_SNEAK
	"-|naučeno",											// NPC_TALENT_SNEAK
//	"-|normales Erz|Bluterz|Dunkelerz",						// NPC_TALENT_SMITH
	"-|magická ruda|krvavá ruda|tmavá ruda",				// NPC_TALENT_SMITH
//	"-|Lehrling|Geselle|Meister",							// NPC_TALENT_COOK
	"-|učeň|tovaryš|mistr",									// NPC_TALENT_COOK
//	"-|ausgebildet",										// NPC_TALENT_ACROBAT
	"-|naučeno",											// NPC_TALENT_ACROBAT
//	"-|Lehrling|Geselle|Meister",							// NPC_TALENT_THAUMATURGY
	"-|učeň|tovaryš|mistr",									// NPC_TALENT_THAUMATURGY
//	"-|Lehrling|Geselle|Meister",							// NPC_TALENT_BOWMAKER
	"-|učeň|tovaryš|mistr",									// NPC_TALENT_BOWMAKER
//	"-|Lehrling|Geselle|Meister",							// NPC_TALENT_ALCHEMY
	"-|učeň|tovaryš|mistr",									// NPC_TALENT_ALCHEMY
//	"-|Lehrling|Geselle|Meister",							// NPC_TALENT_ANIMALTAMING
	"-|učeň|tovaryš|mistr",									// NPC_TALENT_ANIMALTAMING
	"UserDef5",
	"UserDef6",
	"UserDef7",
	"UserDef8",
	"UserDef9",
	"UserDef10"
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
//	"Waffen",
	"Zbraně",
//	"Rüstungen",
	"Zbroj",
//	"Magie",
	"Magie",
//	"Artefakte",
	"Artefakty",
//	"Nahrung",
	"Jídlo",
//	"Tränke",
	"Lektvary",
//	"Schriften",
	"Rukopisy",
//	"Verschiedenes"
	"Různé"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

//CONST STRING NAME_Militia			= "Milizsoldat";
CONST STRING NAME_Militia			= "Milice";
//CONST STRING NAME_Worker			= "Arbeiter";
CONST STRING NAME_Worker			= "Dělník";
//CONST STRING NAME_Miner			= "Minenarbeiter";
CONST STRING NAME_Miner				= "Horník";
//CONST STRING NAME_Thief			= "Herumtreiber";
CONST STRING NAME_Thief				= "Pobuda";
//CONST STRING NAME_Healer			= "Medikus";
CONST STRING NAME_Healer			= "Léčitel";
//CONST STRING NAME_Possessed		= "Aussätziger";
CONST STRING NAME_Possessed			= "Posedlý";
//CONST STRING NAME_Beggar			= "Bettler";
CONST STRING NAME_Beggar			= "Žebrák";
//CONST STRING NAME_Demonic			= "Dämonenanbeter";
CONST STRING NAME_Demonic			= "Uctívač démonů";
//CONST STRING NAME_Torwache		= "Torwache";
CONST STRING NAME_Torwache			= "Strážce brány";
//CONST STRING NAME_Brueckenwache	= "Brückenwache";
CONST STRING NAME_Brueckenwache		= "Strážce mostu";
//CONST STRING NAME_Schuetze		= "Armbrustschütze";
CONST STRING NAME_Schuetze			= "Kušník"; // Tohle mi zní asi nejpřirozeněji, ale původní střelec z kuše je taky ok.
//CONST STRING NAME_Amazon			= "Amazone";
CONST STRING NAME_Amazon			= "Amazonka";
//CONST STRING NAME_Paladin			= "Wache";
CONST STRING NAME_Paladin			= "Stráž";
//CONST STRING Name_Auxiliary		= "Soldat der Hilfstruppen";
CONST STRING Name_Auxiliary			= "Voják pomocných jednotek";
//CONST STRING NAME_KDF				= "Feuermagier";
CONST STRING NAME_KDF				= "Mág Ohně";
//CONST STRING NAME_Bloodearth		= "Bluterde-Klan";
CONST STRING NAME_Bloodearth		= "Klan krvavé země"; // Pokud se to vztahuje k postavě, tak možná Příslušník klanu krvavé země?
//CONST STRING NAME_Demonhunter		= "Dämonenjäger";
CONST STRING NAME_Demonhunter		= "Lovec démonů";
//CONST STRING NAME_Trader			= "Händler";
CONST STRING NAME_Trader			= "Obchodník";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************
//const STRING DIALOG_ENDE		= "ENDE";
const STRING DIALOG_ENDE		= "Konec";
//CONST STRING DIALOG_BACK		= "ZURÜCK";
CONST STRING DIALOG_BACK		= "Zpět";
//const string DIALOG_TRADE		= "(Tauschen)";
const string DIALOG_TRADE		= "(Obchodovat)";
//const string PD_TRUE			= "...TRUE";
const string PD_TRUE			= "...Pravda";
//const string PD_FALSE			= "...FALSE";
const string PD_FALSE			= "...Lež";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

//const string NAME_Ring		= "Ring";
const string NAME_Ring			= "Prsten";
//const string NAME_Amulett		= "Amulett";
const string NAME_Amulett		= "Amulet";
//const string NAME_Trank		= "Trank";
const string NAME_Trank			= "Lektvar";
//const string NAME_Rune		= "Rune";
const string NAME_Rune			= "Runa";
//const string NAME_Spruchrolle	= "Spruchrolle";
const string NAME_Spruchrolle	= "Magický svitek";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

//const string NAME_Value			= "Wert:";
const string NAME_Value				= "Cena:";

//const string NAME_Mag_Circle		= "Kreis:";
const string NAME_Mag_Circle		= "Kruh:";
//const string NAME_Manakosten		= "Manakosten:";
const string NAME_Manakosten		= "Stojí magické energie:";
const string NAME_Manacost_book		= "Stojí many: ";


//const string NAME_ManakostenMax	= "Manakosten (max.):";
const string NAME_ManakostenMax		= "Stojí magické energie (max.):";
//const string NAME_ManaPerSec		= "Mana pro Sec.";
const string NAME_ManaPerSec		= "Mana za sek.";
//const string NAME_Duration		= "Dauer (Minuten)";
const string NAME_Duration			= "Trvání (minuty)";

//const string NAME_Mana_needed		= "benötigtes Mana:";
const string NAME_Mana_needed		= "Požadovaná mana:";
//const string NAME_Str_needed		= "benötigte Stärke:";
const string NAME_Str_needed		= "Požadovaná síla:";
//const string NAME_Dex_needed		= "benötigte Geschicklichkeit:";
const string NAME_Dex_needed		= "Požadovaná obratnost:";

//const string NAME_Spell_Load		= "Aufladbarer Zauber";
const string NAME_Spell_Load		= "Nabíjecí kouzlo";
//const string NAME_Spell_Invest	= "Aufrechterhaltungs-Zauber";
const string NAME_Spell_Invest		= "Jednorázové kouzlo";

//const string NAME_Dam_Edge		= "Waffenschaden";
const string NAME_Dam_Edge			= "Poškození zbraněmi";
//const string NAME_Dam_Point		= "Pfeilschaden";
const string NAME_Dam_Point			= "Poškození šípy";
//const string NAME_Dam_Fire		= "Feuerschaden";
const string NAME_Dam_Fire			= "Poškození ohněm";
//const string NAME_Dam_Magic		= "Magieschaden";
const string NAME_Dam_Magic			= "Poškození magií";
//const string NAME_Dam_Fly			= "Wirbelschaden";
const string NAME_Dam_Fly			= "Poškození bouří";

//const string NAME_Bonus_Edge		= "Rüstschutzbonus Waffen";
const string NAME_Bonus_Edge		= "Bonus k ochraně proti zbraním:";
//const string NAME_Bonus_Point		= "Rüstschutzbonus Pfeil";
const string NAME_Bonus_Point		= "Bonus k ochraně proti šípům:";
//const string NAME_Bonus_Fire		= "Rüstschutzbonus Feuer";
const string NAME_Bonus_Fire		= "Bonus k ochraně proti ohni:";
//const string NAME_Bonus_Magic		= "Rüstschutzbonus Magie";
const string NAME_Bonus_Magic		= "Bonus k ochraně proti magii:";

//const string NAME_Damage			= "Schaden";
const string NAME_Damage			= "Poškození";
//const string NAME_PerMana			= " (pro Mana)";
const string NAME_PerMana			= " (za manu)";
//const string NAME_DamagePerSec	= "Schaden pro Sec.";
const string NAME_DamagePerSec		= "Poškození za s.";

const string NAME_HealPerMana		= "Léčení za manu";

//const string NAME_Prot_Edge		= "Schutz vor Waffen:";
const string NAME_Prot_Edge			= "Ochrana proti zbraním:";
//const string NAME_Prot_Point		= "Schutz vor Pfeilen:";
const string NAME_Prot_Point		= "Ochrana proti šípům:";
//const string NAME_Prot_Fire		= "Schutz vor Feuer:";
const string NAME_Prot_Fire			= "Ochrana proti ohni:";
//const string NAME_Prot_Magic		= "Schutz vor Magie:";
const string NAME_Prot_Magic		= "Ochrana proti magii:";

//const string NAME_Bonus_HP		= "Lebensenergie-Bonus:";
const string NAME_Bonus_HP			= "Bonus zdraví:";
//const string NAME_Bonus_Mana		= "Mana-Bonus:";
const string NAME_Bonus_Mana		= "Bonus magické energie:";

//const string NAME_Bonus_HpMax		= "Bonus für maximale Lebensenergie:";
const string NAME_Bonus_HpMax		= "Bonus pro maximum zdraví:";
//const string NAME_Bonus_ManaMax	= "Bonus für maximales Mana:";
const string NAME_Bonus_ManaMax		= "Bonus pro maximum magické energie:";

//const string NAME_Bonus_Dex		= "Geschicklichkeits-Bonus:";
const string NAME_Bonus_Dex			= "Bonus k obratnosti:";
//const string NAME_Bonus_Str		= "Stärke-Bonus:";
const string NAME_Bonus_Str			= "Bonus k síle:";

//const string NAME_TypeOneHanded	= "Waffentyp: Einhänder";
const string NAME_TypeOneHanded		= "Typ: Jednoruční zbraň";
//const string NAME_TypeTwoHanded	= "Waffentyp: Zweihänder";
const string NAME_TypeTwoHanded		= "Typ: Obouruční zbraň";
//const string NAME_TypeStaff		= "Waffentyp: Kampfstab";
const string NAME_TypeStaff			= "Typ: Bojová hůl";
//const string NAME_TypeBow			= "Waffentyp: Bogen";
const string NAME_TypeBow			= "Typ: Luk";
//const string NAME_TypeCrossbow	= "Waffentyp: Armbrust";
const string NAME_TypeCrossbow		= "Typ: Kuš";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
//const string NAME_XPGained		= "Erfahrung + ";			// bei jedem Erfahrungsgewinn
const string NAME_XPGained			= "Zkušenost + ";
//const string NAME_LevelUp			= "Stufe gestiegen!";		// beim Stufenaufstieg
const string NAME_LevelUp			= "O úroveň výš!";

//const string NAME_LPGained		= "Lernpunkte + ";			// bei jedem Erfahrungsgewinn
const string NAME_LPGained			= "Zkušenostní body + ";
//const string NAME_NewLogEntry		= "neuer Tagebucheintrag";
const string NAME_NewLogEntry		= "Nový zápis do deníku";


// ***************************************************************************************
// Waffennamen
// ***************************************************************************************
//const string	NAME_Club					=	"Keule";
const string	NAME_Club					=	"Kyj";
//const string	NAME_Poker					=	"Schürhaken";
const string	NAME_Poker					=	"Pohrabáč";
//const string	NAME_Sickle					=	"Sichel";
const string	NAME_Sickle					=	"Srp";
//const string	NAME_Pickaxe				=	"Spitzhacke";
const string	NAME_Pickaxe				=	"Krumpáč";
//const string	NAME_Sledgehammer			=	"Schmiedehammer";
const string	NAME_Sledgehammer			=	"Kovářské kladivo";
//const string	NAME_Scythe					=	"Sense";
const string	NAME_Scythe					=	"Kosa";

//const string	NAME_Shortsword      		=	"Kurzschwert";
const string	NAME_Shortsword      		=	"Krátký meč";
//const string	NAME_Longsword       		=	"Langschwert";
const string	NAME_Longsword       		=	"Dlouhý meč";
//const string	NAME_Broadsword      		=	"Breitschwert";
const string	NAME_Broadsword      		=	"Široký meč";
//const string	NAME_Bastardsword    		=	"Bastardschwert";
const string	NAME_Bastardsword    		=	"Meč bastard";
//const string	NAME_2HSword         		=	"Zweihänder";
const string	NAME_2HSword         		=	"Obouruční meč";
//const string	NAME_OrcSword        		=	"Krush Varrok";
const string	NAME_OrcSword        		=	"Krush Varrok";
//const string	NAME_Hatchet         		=	"Beil";
const string	NAME_Hatchet         		=	"Sekyra"; // Správně je i sekera, ale beru to podle oficiálního překladu G1
//const string	NAME_Battleaxe       		=	"Streitaxt";
const string	NAME_Battleaxe       		=	"Bojová sekyra";
//const string	NAME_DoublebladedAxe 		=	"Doppelblattaxt";
const string	NAME_DoublebladedAxe 		=	"Dvoubřitá sekyra";
//const string	NAME_BerserkAxe      		=	"Berserkeraxt";
const string	NAME_BerserkAxe      		=	"Sekyra berserkera";
//const string	NAME_OrcAxe          		=	"Krush BrokDar";
const string	NAME_OrcAxe          		=	"Krush BrokDar";
//const string	NAME_IronClub        		=	"Eisenkeule";
const string	NAME_IronClub        		=	"Železný kyj";
//const string	NAME_Mace            		=	"Streitkolben";
const string	NAME_Mace            		=	"Palcát";
//const string	NAME_Morningstar     		=	"Morgenstern";
const string	NAME_Morningstar     		=	"Kropáč"; // Uvádí to i Wikipedie, spolu s Hvězda nebo Morgenštern.
//const string	NAME_Warhammer       		=	"Kriegshammer";
const string	NAME_Warhammer       		=	"Válečné kladivo";
//const string	NAME_OrcHammer       		=	"Krush Karrok";
const string	NAME_OrcHammer       		=	"Krush Karrok";

//const string	NAME_Battlestaff			=	"Kampfstab";
const string	NAME_Battlestaff			=	"Bojová hůl";

//const string	NAME_MilitiaSword      		=	"Milizschwert";
const string	NAME_MilitiaSword      		=	"Meč milice";
//const string	NAME_PaladinSword      		=	"Paladinschwert";
const string	NAME_PaladinSword      		=	"Paladinský meč";
//const string	NAME_DemonhunterAxe    		=	"Dämonenjäger-Axt";
const string	NAME_DemonhunterAxe    		=	"Sekyra lovce démonů";
//const string	NAME_AuxiliaryMace			=	"Streitkolben der Hilfstruppen";
const string	NAME_AuxiliaryMace			=	"Palcát pomocných jednotek";


//////////////////////////////////////////////////////////////////////////////////////////
// Nahrungsnamen
//////////////////////////////////////////////////////////////////////////////////////////
//const string	NAME_Apple					=	"Apfel";
const string	NAME_Apple					=	"Jablko";
//const string	NAME_Grapes					=	"Weintrauben";
const string	NAME_Grapes					=	"Hrozny";
//const string	NAME_Loaf					=	"Brot";
const string	NAME_Loaf					=	"Chléb";
//const string	NAME_Mutton					=	"gebratenes Fleisch";
const string	NAME_Mutton					=	"Opečené maso";
//const string	NAME_MuttonRaw				=	"rohes Fleisch";
const string	NAME_MuttonRaw				=	"Syrové maso";
//const string	NAME_Ham      				=	"Schinken";
const string	NAME_Ham      				=	"Šunka";
//const string	NAME_Cheese		       		=	"Käse";
const string	NAME_Cheese		       		=	"Sýr";
//const string	NAME_Soup	  		  		=	"Wurzelsuppe";
const string	NAME_Soup	  		  		=	"Polévka z kořínků";
//const string	NAME_MeatBugRagout         	=	"Fleischwanzenragout";
const string	NAME_MeatBugRagout         	=	"Ragú ze žravých štěnic";
//const string	NAME_CrawlerSoup        	=	"Minecrawlersuppe";
const string	NAME_CrawlerSoup        	=	"Polévka z důlních červů";
//const string	NAME_Beer 		      		=	"Bier";
const string	NAME_Beer 		      		=	"Pivo";
//const string	NAME_Wine			 		=	"Wein";
const string	NAME_Wine			 		=	"Víno";
//const string	NAME_Booze		      		=	"Reisschnaps";
const string	NAME_Booze		      		=	"Rýžová pálenka";

//////////////////////////////////////////////////////////////////////////////////////////
// Animaltrophis
//////////////////////////////////////////////////////////////////////////////////////////
//const string	NAME_MeatBug				=	"Wanzenfleisch";
const string	NAME_MeatBug				=	"Maso ze žravé štěnice";
//const string	NAME_MoleratGrease			=	"Moleratfett";
const string	NAME_MoleratGrease			=	"Krysokrtí sádlo";
//const string	NAME_Teeth					=	"Zähne";
const string	NAME_Teeth					=	"Zuby";
//const string	NAME_WolfFur				=	"Wolfsfell";
const string	NAME_WolfFur				=	"Vlčí kůže"; // Nebo možná kožešina? Ale v G1 a G2 je to tuším taky kůže.
//const string	NAME_OrkDogFur				=	"Orkhundfell";
const string	NAME_OrkDogFur				=	"Kůže skřetího psa";
//const string	NAME_WaranTongue			=	"Flammenzunge";
const string	NAME_WaranTongue			=	"Ohnivý jazyk";
//const string	NAME_Claws					=	"Krallen";
const string	NAME_Claws					=	"Drápy";
//const string	NAME_CrawlerPlates			=	"Panzerplatte";
const string	NAME_CrawlerPlates			=	"Plát z důlního červa";
//const string	NAME_CrawlerMandibles      	=	"Crawlerzangen";
const string	NAME_CrawlerMandibles      	=	"Kusadla důlního červa";
//const string	NAME_ShadowFur		       	=	"Fell";
const string	NAME_ShadowFur		       	=	"Kůže stínové šelmy"; // Asi? Podle ShadowFur...
//const string	NAME_ShadowHorn		      	=	"Horn";
const string	NAME_ShadowHorn		      	=	"Roh stínové šelmy";
//const string	NAME_LurkerClaw	 	  		=	"Lurkerklaue";
const string	NAME_LurkerClaw	 	  		=	"Drápy číhavce";
//const string	NAME_LurkerSkin         	=	"Lurkerhaut";
const string	NAME_LurkerSkin         	=	"Kůže číhavce";
//const string	NAME_TrollTeeth 	       	=	"Trollhauer";
const string	NAME_TrollTeeth 	       	=	"Trollí tesák";
//const string	NAME_TrollFur	         	=	"Trollfell";
const string	NAME_TrollFur	         	=	"Trollí kůže";
//const string	NAME_SwampsharkSkin 		=	"Sumpfhaihaut";
const string	NAME_SwampsharkSkin 		=	"Kůže močálového žraloka";
//const string	NAME_SwampsharkTeeth		=	"Sumpfhaizähne";
const string	NAME_SwampsharkTeeth		=	"Zub močálového žraloka";
//const string	NAME_BloodflyWings		    =	"Flügel";
const string	NAME_BloodflyWings		    =	"Křídla krvavé mouchy";
//const string	NAME_BloodflySting			=	"Blutfliegenstachel";
const string	NAME_BloodflySting			=	"Žihadlo krvavé mouchy";
//const string	NAME_DemonSting				=	"dämonischer Stachel";
const string	NAME_DemonSting				=	"Démonický trn"; // To chce asi něco lepšího, ale nevím přesně o co jde ve hře.
//const string	NAME_StonegolemHeart		=	"Herz eines Steingolems";
const string	NAME_StonegolemHeart		=	"Srdce kamenného golema";
//const string	NAME_FiregolemHeart			=	"Herz eines Feuergolems";
const string	NAME_FiregolemHeart			=	"Srdce ohnivého golema";
//const string	NAME_IcegolemHeart			=	"Herz eines Eisgolems";
const string	NAME_IcegolemHeart			=	"Srdce ledového golema";
//const string	NAME_IcegolemPiece			=	"Stück eines Eisgolems";
const string	NAME_IcegolemPiece			=	"Kus ledového golema";

//////////////////////////////////////////////////////////////////////////////////////////
// Rüstungen
//////////////////////////////////////////////////////////////////////////////////////////
//const string	NAME_ArmorKing				=	"King_Armor";
const string	NAME_ArmorKing				=	"Králova zbroj";
//const string	NAME_HeavyArmorDemonhunter	=	"schwere Demonhunterrüstung";
const string	NAME_HeavyArmorDemonhunter	=	"Těžká zbroj lovce démonů";
//const string	NAME_MediumArmorDemonhunter	=	"mittlere Demonhunterrüstung";
const string	NAME_MediumArmorDemonhunter	=	"Střední zbroj lovce démonů";
//const string	NAME_LightArmorDemonhunter	=	"leichte Demonhunterrüstung";
const string	NAME_LightArmorDemonhunter	=	"Lehká zbroj lovce démonů";
//const string	NAME_HeavyArmorDemonhunter2	=	"schwere Demonhunterrüstung2";
const string	NAME_HeavyArmorDemonhunter2	=	"Těžká zbroj lovce démonů"; // Nějaká druhá varianta? Tak či tak asi nepotřebuje být ta dvojka přímo ve hře. Immersion:tm:
//const string	NAME_MediumArmorDemonhunter2=	"mittlere Demonhunterrüstung2";
const string	NAME_MediumArmorDemonhunter2=	"Střední zbroj lovce démonů";
//const string	NAME_HeavyArmorPaladin      =	"schwere Paladinrüstung";
const string	NAME_HeavyArmorPaladin      =	"Těžká paladinská zbroj";
//const string	NAME_MediumArmorPaladin		=	"mittlere Paladinrüstung";
const string	NAME_MediumArmorPaladin		=	"Střední paladinská zbroj";
//const string	NAME_LightArmorPaladin     	=	"leichte Paladinrüstung";
const string	NAME_LightArmorPaladin     	=	"Lehká paladinská zbroj";
//const string	NAME_HighArmorHealer	 	=	"Schweres Heilergewand";
const string	NAME_HighArmorHealer	 	=	"Těžké léčitelské roucho";
//const string	NAME_MediumArmorHealer      =	"Heilergewand";
const string	NAME_MediumArmorHealer      =	"Léčitelské roucho";
//const string	NAME_ArmorDemonfollower 	=	"Dämonenanbeter-Gewand";
const string	NAME_ArmorDemonfollower 	=	"Roucho uctívače démonů";
//const string	NAME_ArmorBeggar	        =	"Bettler-Lumpen";
const string	NAME_ArmorBeggar	        =	"Žebrácké hadry";
//const string	NAME_ArmorVLk_L				=	"Leichte Buddlerhose";
const string	NAME_ArmorVLk_L				=	"Lehké kalhoty kopáče";
//const string	NAME_ArmorVLk_M				=	"Buddlerhose";
const string	NAME_ArmorVLk_M				=	"Kalhoty kopáče";
//const string	NAME_ArmorSFB_L				=	"Schürferklamotten";
const string	NAME_ArmorSFB_L				=	"Těžařské oblečení";

//////////////////////////////////////////////////////////////////////////////////////////
// Misc
//////////////////////////////////////////////////////////////////////////////////////////
//const string	NAME_Lockpick				=	"Dietrich";
const string	NAME_Lockpick				=	"Paklíč"; // Popř. šperhák, to zní krásně. Ale na Paklíč jsme zvyklí z G1.
//const string	NAME_Key					=	"Schlüssel";
const string	NAME_Key					=	"Klíč";
//const string	NAME_Stomper				=	"Krautstampfer";
const string	NAME_Stomper				=	"Tlouček"; // Tady fakt nevím. Taková ta věc na drcení bylin v hmoždíři? Dal jsem prozatím Palice.
//const string	NAME_Hammer					=	"Hammer";
const string	NAME_Hammer					=	"Kladivo";
//const string	NAME_Scoop					=	"Kochlöffel";
const string	NAME_Scoop					=	"Vařečka";
//const string	NAME_LabFlask				=	"Laborflasche";
const string	NAME_LabFlask				=	"Laboratorní baňka";
//const string	NAME_TorchFirespit 		    =	"Fackel";
const string	NAME_TorchFirespit 		    =	"Pochodeň";
//const string	NAME_Lute					=	"Laute";
const string	NAME_Lute					=	"Loutna";
//const string	NAME_Whisk 			    	=	"Palm wedel";
const string	NAME_Whisk 			    	=	"Vějíř"; // Nevím přesně, musel bych to vidět ve hře.
//const string	NAME_Brush				 	=	"Bürste";
const string	NAME_Brush				 	=	"Kartáč";
//const string	NAME_Joint1 			    =	"Grüner Novize";
const string	NAME_Joint1 			    =	"Zelený novic";
//const string	NAME_Joint2				 	=	"Schwarzer Weiser";
const string	NAME_Joint2				 	=	"Severní soumrak"; // Černý mudrc - Asi? Ale je to název jointu, tak se dá být různě kreativní.
//const string	NAME_Joint3			        =	"Traumruf";
const string	NAME_Joint3			        =	"Přivolávač snů";
//const string	NAME_Torch					=	"Fackel";
const string	NAME_Torch					=	"Pochodeň";
//const string	NAME_BurningTorch			=	"Brennende Fackel";
const string	NAME_BurningTorch			=	"Hořící pochodeň";
//const string	NAME_TorchBurned			=	"Fackel";
const string	NAME_TorchBurned			=	"Vyhaslá pochodeň";
//const string	NAME_Swampweed				=	"Sumpfkraut";
const string	NAME_Swampweed				=	"Tráva z bažin";
//const string	NAME_Sulphur				=	"Schwefel";
const string	NAME_Sulphur				=	"Síra";
//const string	NAME_Quicksilver			=	"Quecksilber";
const string	NAME_Quicksilver			=	"Rtuť";
//const string	NAME_Salt					=	"Salz";
const string	NAME_Salt					=	"Sůl";
//const string	NAME_SyrianOil 			    =	"Syrianisches Öl";
const string	NAME_SyrianOil 			    =	"Syrianský olej"; // Asi? Je to nějaká země?
//const string	NAME_Alcohol 		    	=	"Reiner Alkohol";
const string	NAME_Alcohol 		    	=	"Čistý alkohol";
//const string	NAME_FakeScroll			 	=	"Brief";
const string	NAME_FakeScroll			 	=	"Dopis";
//const string	NAME_AlarmHorn 				=	"Horn";
const string	NAME_AlarmHorn 				=	"Roh";
//const string	NAME_WorldMap				=	"Karte der Kolonie";
const string	NAME_WorldMap				=	"Mapa kolonie";
//const string	NAME_StinkingSalt			=	"Müffelsalz";
const string	NAME_StinkingSalt			=	"Smrdutá sůl"; // Tak tady fakt netuším. Chápu správně, že je to nějaká špatná sůl, kterou se dá otrávit nějaké jídlo?


//////////////////////////////////////////////////////////////////////////////////////////
// Ranged Weapons
//////////////////////////////////////////////////////////////////////////////////////////
//const string	NAME_ShortBow				=	"Kurzbogen";
const string	NAME_ShortBow				=	"Krátký luk";
//const string	NAME_RiderBow				=	"Reiterbogen";
const string	NAME_RiderBow				=	"Jezdecký luk";
//const string	NAME_FieldBow				=	"Feldbogen";
const string	NAME_FieldBow				=	"Polní luk";
//const string	NAME_HuntingBow				=	"Jagdbogen";
const string	NAME_HuntingBow				=	"Lovecký luk";
//const string	NAME_LongBow				=	"Langbogen";
const string	NAME_LongBow				=	"Dlouhý luk";
//const string	NAME_HedgeBow 			    =	"Heckenbogen";
const string	NAME_HedgeBow 			    =	"Dřevěný luk"; // Tak je to v G1, ale jako všechny jsou dřevěné, tak je to trochu divné...
//const string	NAME_YewBow 			   	=	"Eibenbogen";
const string	NAME_YewBow 			   	=	"Tisový luk";
//const string	NAME_ArmyBow			 	=	"Armeebogen";
const string	NAME_ArmyBow			 	=	"Armádní luk";
//const string	NAME_WarBow					=	"Kriegsbogen";
const string	NAME_WarBow					=	"Válečný luk";
//const string	NAME_StormBow				=	"Sturmbogen";
const string	NAME_StormBow				=	"Útočný luk"; // Opět podle G1, i když to není přesný překlad.

//const string	NAME_LightCrossBow 		    =	"Leichte Armbrust";
const string	NAME_LightCrossBow 		    =	"Lehká kuš";
//const string	NAME_CrossBow				=	"Armbrust";
const string	NAME_CrossBow				=	"Kuš";
//const string	NAME_HeavyCrossBow 			=	"Schwere Armbrust";
const string	NAME_HeavyCrossBow 			=	"Těžká kuš";
//const string	NAME_WarCrossBow			=	"Kriegs-Armbrust";
const string	NAME_WarCrossBow			=	"Válečná kuš";

//const string	NAME_Arrow 				    =	"Pfeil";
const string	NAME_Arrow 				    =	"Šíp";
//const string	NAME_Bolt				 	=	"Bolzen";
const string	NAME_Bolt				 	=	"Šipka";

//const string	NAME_WolfBow			 	=	"Wolfsfetzer";
const string	NAME_WolfBow			 	=	"Vlčí luk"; // Pokud to teda není Wolfův luk?
//const string	NAME_WindBreaker 			=	"Windbrecher";
const string	NAME_WindBreaker 			=	"Větrolam";
//const string	NAME_Nimrod					=	"Nimroder";
const string	NAME_Nimrod					=	"Myslivecký luk"; // Opět podle G1.
//const string	NAME_OrkHunter				=	"Orkhetzer";
const string	NAME_OrkHunter				=	"Lovec skřetů";
//const string	NAME_DemonBow				=	"Dämonenbogen";
const string	NAME_DemonBow				=	"Démonský luk";
//const string	NAME_DeathBringer			=	"Todbringer";
const string	NAME_DeathBringer			=	"Smrtící luk"; // Opět podle G1, ale šlo by být i kreativní...

// ***************************************************************************************
// Schmiedematerialien & Zwischenprodukte
// ***************************************************************************************
//const string	NAME_Nugget					=	"Erz";
const string	NAME_Nugget					=	"Ruda";
//const string	NAME_BloodNugget			=	"Bluterz";
const string	NAME_BloodNugget			=	"Krvavá ruda";
//const string	NAME_DarkNugget				=	"Dunkelerz";
const string	NAME_DarkNugget				=	"Tmavá ruda";

//const string	NAME_RawIron				=	"Roheisen";
const string	NAME_RawIron				=	"Surová ocel";
//const string	NAME_RawLongIron			=	"Lang-Roheisen";
const string	NAME_RawLongIron			=	"Dlouhá surová ocel";
//const string	NAME_HotIron				=	"glühendes Roheisen";
const string	NAME_HotIron				=	"Žhnoucí ocel";
//const string	NAME_HotLongIron			=	"glühendes Lang-Roheisen";
const string	NAME_HotLongIron			=	"Žhnoucí dlouhá ocel";

//const string	NAME_HotSwordBlade			=	"glühende Schwertklinge";
const string	NAME_HotSwordBlade			=	"Žhnoucí čepel meče";
//const string	NAME_HotAxeBlade			=	"glühende Axtblatt";
const string	NAME_HotAxeBlade			=	"Žhnoucí čepel sekery"; // V češtině se asi taky používá čepel spíš než list.
//const string	NAME_HotStump				=	"glühender Waffenstumpf";
const string	NAME_HotStump				=	"Žhnoucí polotovar zbraně"; // Dodal jsem tam tu zbraň, ať je to jasnější. Možná by mohl být i odlitek?
//const string	NAME_Hot2HSwordBlade		=	"glühende 2H-Schwertklinge";
const string	NAME_Hot2HSwordBlade		=	"Žhnoucí čepel obouručního meče";
//const string	NAME_Hot2HAxeBlade			=	"glühende 2H-Axtblatt";
const string	NAME_Hot2HAxeBlade			=	"Žhnoucí čepel obouruční sekery";
//const string	NAME_Hot2HStump				=	"glühender 2H-Waffenstumpf";
const string	NAME_Hot2HStump				=	"Polotovar obouruční zbraně";

//const string	NAME_SwordBlade				=	"Schwertklinge";
const string	NAME_SwordBlade				=	"Čepel meče";
//const string	NAME_AxeBlade				=	"Axtblatt";
const string	NAME_AxeBlade				=	"Čepel sekery";
//const string	NAME_Stump					=	"Waffenstumpf";
const string	NAME_Stump					=	"Polotovar zbraně";
//const string	NAME_2HSwordBlade			=	"2H-Schwertklinge";
const string	NAME_2HSwordBlade			=	"Čepel obouručního meče";
//const string	NAME_2HAxeBlade				=	"2H-Axtblatt";
const string	NAME_2HAxeBlade				=	"Čepel obouruční sekery";
//const string	NAME_2HStump				=	"2H-Waffenstumpf";
const string	NAME_2HStump				=	"Polotovar obouruční zbraně";

const string	NAME_Ore					=	"";
//const string	NAME_BloodOre				=	" aus Bluterz";
const string	NAME_BloodOre				=	" z krvavé rudy";
//const string	NAME_DarkOre				=	" aus Dunkelerz";
const string	NAME_DarkOre				=	" z tmavé rudy";

//const string	NAME_Smith_Melter			=	" einschmelzen";
const string	NAME_Smith_Melter			=	" taví se";
//const string	NAME_Smith_Fire				=	" erhitzen";
const string	NAME_Smith_Fire				=	" žhaví se";
//const string	NAME_Smith_Anvil			=	" schmieden";
const string	NAME_Smith_Anvil			=	" kovám";
//const string	NAME_Smith_Cool				=	" abkühlen";
const string	NAME_Smith_Cool				=	" kalí se";
//const string	NAME_Smith_Sharp			=	" schleifen";
const string	NAME_Smith_Sharp			=	" brousím";

//const string	NAME_Smith_Ore_Done			=	" geschürft";
const string	NAME_Smith_Ore_Done			=	" vytěženo";
//const string	NAME_Smith_Melter_Done		=	" eingeschmolzen";
const string	NAME_Smith_Melter_Done		=	" roztaveno";
//const string	NAME_Smith_Fire_Done		=	" erhitzt";
const string	NAME_Smith_Fire_Done		=	" nažhaveno";
//const string	NAME_Smith_Anvil_Done		=	" geschmiedet";
const string	NAME_Smith_Anvil_Done		=	" vykováno";
//const string	NAME_Smith_Cool_Done		=	" abgekühlt";
const string	NAME_Smith_Cool_Done		=	" zakaleno";
//const string	NAME_Smith_Sharp_Done		=	" geschliffen";
const string	NAME_Smith_Sharp_Done		=	" nabroušeno";

// ***************************************************************************************
// Kochprodukte
// ***************************************************************************************
//const string	NAME_MeatbugSoup			= 	"Meatbug-Suppe";
const string	NAME_MeatbugSoup			= 	"Polévka ze žravých štěnic";
//const string	NAME_MushroomSoup			=	"Pilz-Suppe";
const string	NAME_MushroomSoup			=	"Houbová polévka";
//const string	NAME_HerbSoup				=	"Kraut-Suppe";
const string	NAME_HerbSoup				=	"Bylinková polévka";
//const string	NAME_MeatSoup				=	"Fleisch-Suppe";
const string	NAME_MeatSoup				=	"Masová polévka";
//const string	NAME_MoleratSoup			=	"Molerat-Suppe";
const string	NAME_MoleratSoup			=	"Krysokrtí polévka";

//const string	NAME_MeatbugStew			= 	"Meatbug-Eintopf";
const string	NAME_MeatbugStew			= 	"Dušená žravá štěnice"; // Ono to stew se blbě překládá, ale v podstatě je to taková gulášovitá konzistence, tak by se to všechno popř. dalo přeložit jako guláše...
//const string	NAME_MushroomStew			=	"Pilz-Eintopf";
const string	NAME_MushroomStew			=	"Dušené houby";
//const string	NAME_HerbStew				=	"Kraut-Eintopf";
const string	NAME_HerbStew				=	"Dušené bylinky";
//const string	NAME_MeatStew				=	"Fleisch-Eintopf";
const string	NAME_MeatStew				=	"Dušené maso";
//const string	NAME_MoleratStew			=	"Molerat-Eintopf";
const string	NAME_MoleratStew			=	"Dušené krysokrtí maso";

//const string	NAME_MeatbugPie				= 	"Meatbug-Ragout";
const string	NAME_MeatbugPie				= 	"Ragú ze žravých štěnic";
//const string	NAME_MushroomPie			=	"Pilz-Ragout";
const string	NAME_MushroomPie			=	"Houbové ragú";
//const string	NAME_HerbPie				=	"Kraut-Ragout";
const string	NAME_HerbPie				=	"Bylinkové ragú";
//const string	NAME_MeatPie				=	"Fleisch-Ragout";
const string	NAME_MeatPie				=	"Masové ragú";
//const string	NAME_MoleratPie				=	"Molerat-Ragout";
const string	NAME_MoleratPie				=	"Ragú z krysokrta";

//const string	NAME_RecipeMeatbug			=	"schmackhafte Wanzenrezepte";
const string	NAME_RecipeMeatbug			=	"Recept na mňamku ze žravé štěnice";
//const string	NAME_RecipeMolerat			=	"ungewöhnliche Moleratgerichte";
const string	NAME_RecipeMolerat			=	"Neobvyklý recept na krysokrta";
//const string	NAME_RecipeHerb				=	"delikate Kräuterrezepte";
const string	NAME_RecipeHerb				=	"Lahodný recept na bylinky";
//const string	NAME_RecipeMushroom			=	"wunderliche Pilzgerichte";
const string	NAME_RecipeMushroom			=	"Úžasný recept na houby";
//const string	NAME_RecipeMeat				=	"leckere Fleischzubereitung";
const string	NAME_RecipeMeat				=	"Výtečný recept na maso";

//const string	NAME_CAULDRON_Done			=	" zubereitet";
const string	NAME_CAULDRON_Done			=	" připraveno";

//const string	NAME_Bow_Done				=	" gespannt";
const string	NAME_Bow_Done				=	" napnutý";
//const string	NAME_RUNEMAKER_Done			=	" aufgeladen";
const string	NAME_RUNEMAKER_Done			=	" vyrobena";
//const string	NAME_RUNEMELTER_Done		=	" gegossen";
const string	NAME_RUNEMELTER_Done		=	" odlita";
//const string	NAME_WOOD_Done				=	" geschnitten";
const string	NAME_WOOD_Done				=	" připraveno";
//const string	NAME_STOMPER_DONE			=	" gerollt";
const string	NAME_STOMPER_DONE			=	" ubaleno";
//const string	NAME_FLETCHER_DONE			=	" geschnitzt";
const string	NAME_FLETCHER_DONE			=	" vyřezán";

//const string	NAME_Ration					=	" Portion ";
const string	NAME_Ration					=	" porce ";
//const string	NAME_Rations				=	" Portionen ";
const string	NAME_Rations				=	" porce ";

// ***************************************************************************************
// Pflanzen
// ***************************************************************************************
//const string 	NAME_MountainMoss			=	"Bergmoos";
const string 	NAME_MountainMoss			=	"Horský mech";
//const string 	NAME_Stoneroot				=	"Steinwurzel";
const string 	NAME_Stoneroot				=	"Kamenný kořen";
//const string 	NAME_BloodThistle			=	"Blutdistel";
const string 	NAME_BloodThistle			=	"Krvavý bodlák";
//const string 	NAME_OrcLeaf				=	"Orkblatt";
const string 	NAME_OrcLeaf				=	"Skřetí list";
//const string 	NAME_RavenHerb				=	"Rabenkraut";
const string 	NAME_RavenHerb				=	"Havraní byliny";
//const string 	NAME_Nightshade				=	"Nachtschatten";
const string 	NAME_Nightshade				=	"Potměchuť";
//const string 	NAME_CaveMushroom			=	"Höhlenpilz";
const string 	NAME_CaveMushroom			=	"Pekelná houba";
//const string 	NAME_Woodberry				=	"Waldbeeren";
const string 	NAME_Woodberry				=	"Borůvky"; // známe z G1
//const string 	NAME_Flameberry				=	"Flammbeeren";
const string 	NAME_Flameberry				=	"Ohnivý trn";
//const string 	NAME_Trollberry				=	"Trollkirsche";
const string 	NAME_Trollberry				=	"Trollí bobule";

// ***************************************************************************************
// Alchemie
// ***************************************************************************************
//const string	NAME_LAB_Done				=	" gebraut";
const string	NAME_LAB_Done				=	" namíchán";

//const string	NAME_HealthPotion1			=	"Essenz der Heilung";
const string	NAME_HealthPotion1			=	"Esence hojivé síly";
//const string	NAME_HealthPotion2			=	"Extrakt der Heilung";
const string	NAME_HealthPotion2			=	"Extrakt hojivé síly";
//const string	NAME_HealthPotion3			=	"Elixier der Heilung";
const string	NAME_HealthPotion3			=	"Elixír hojivé síly";
//const string	NAME_HealthPotionAll		=	"Trank völliger Genesung";
const string	NAME_HealthPotionAll		=	"Lektvar úplného uzdravení";
//const string	NAME_ManaPotion1			=	"Essenz der Magie";
const string	NAME_ManaPotion1			=	"Esence magické energie";
//const string	NAME_ManaPotion2			=	"Extrakt der Magie";
const string	NAME_ManaPotion2			=	"Extrakt magické energie";
//const string	NAME_ManaPotion3			=	"Elixier der Magie";
const string	NAME_ManaPotion3			=	"Elixír magické energie";
//const string	NAME_ManaPotionAll			=	"Trank der Magiewiderherstellung";
const string	NAME_ManaPotionAll			=	"Letvar obnovy magické energie";
//const string	NAME_SpeedPotion1			=	"Essenz der Eile";
const string	NAME_SpeedPotion1			=	"Esence spěchu";
//const string	NAME_SpeedPotion2			=	"Extrakt der Eile";
const string	NAME_SpeedPotion2			=	"Extrakt spěchu";
//const string	NAME_SpeedPotion3			=	"Elixier der Eile";
const string	NAME_SpeedPotion3			=	"Elixír spěchu";
//const string	NAME_StrPotion1				=	"Essenz der Stärke";
const string	NAME_StrPotion1				=	"Esence síly";
//const string	NAME_StrPotion2				=	"Extrakt der Stärke";
const string	NAME_StrPotion2				=	"Extrakt síly";
//const string	NAME_StrPotion3				=	"Elixier der Stärke";
const string	NAME_StrPotion3				=	"Elixír síly";
//const string	NAME_DexPotion1				=	"Essenz der Geschicklichkeit";
const string	NAME_DexPotion1				=	"Esence obratnosti";
//const string	NAME_DexPotion2				=	"Extrakt der Geschicklichkeit";
const string	NAME_DexPotion2				=	"Extrakt obratnosti";
//const string	NAME_DexPotion3				=	"Elixier der Geschicklichkeit";
const string	NAME_DexPotion3				=	"Elixír obratnosti";
//const string	NAME_StrDexPotion1			=	"Trank der Macht";
const string	NAME_StrDexPotion1			=	"Lektvar moci";
//const string	NAME_StrDexPotion2			=	"Trank der Herrschaft";
const string	NAME_StrDexPotion2			=	"Lektvar nejvyšší moci";
//const string	NAME_HealthPermaPotion1		=	"Essenz des Lebens";
const string	NAME_HealthPermaPotion1		=	"Esence zdraví";
//const string	NAME_HealthPermaPotion2		=	"Extrakt des Lebens";
const string	NAME_HealthPermaPotion2		=	"Extrakt zdraví";
//const string	NAME_HealthPermaPotion3		=	"Elixier des Lebens";
const string	NAME_HealthPermaPotion3		=	"Elixír zdraví";
//const string	NAME_ManaPermaPotion1		=	"Essenz des Geistes";
const string	NAME_ManaPermaPotion1		=	"Esence ducha";
//const string	NAME_ManaPermaPotion2		=	"Extrakt des Geistes";
const string	NAME_ManaPermaPotion2		=	"Extrakt ducha";
//const string	NAME_ManaPermaPotion3		=	"Elixier des Geistes";
const string	NAME_ManaPermaPotion3		=	"Elixír ducha";

//const string	NAME_Essence				=	"Essenz";
const string	NAME_Essence				=	"Esence";
//const string	NAME_Extract				=	"Extrakt";
const string	NAME_Extract				=	"Extrakt";
//const string	NAME_Elixir					=	"Elixier";
const string	NAME_Elixir					=	"Elixír";

//const string	NAME_BookHealingPotions		=	"Rezepturen für Heiltränke";
const string	NAME_BookHealingPotions		=	"Recepty na léčivé lektvary";
//const string	NAME_BookManaPotions		=	"Rezepturen für Manatränke";
const string	NAME_BookManaPotions		=	"Recepty na lektvary many";
//const string	NAME_BookSpeedPotions		=	"Rezepturen für Tränke der Eile";
const string	NAME_BookSpeedPotions		=	"Recepty na lektvary rychlosti";

// ***************************************************************************************
// Runen erschaffen
// ***************************************************************************************
//const string	NAME_BlankRune				=	"leere Rune";
const string	NAME_BlankRune				=	"prázdná runa";
//const string	NAME_BlankBloodRune			=	"leere Blutrune";
const string	NAME_BlankBloodRune			=	"prázdná krvavá runa";
//const string	NAME_BlankDarkRune			=	"leere Dunkelrune";
const string	NAME_BlankDarkRune			=	"prázdná tmavá runa";
//const string	NAME_RunePostfix			=	"-Rune";
const string	NAME_RunePostfix			=	"-runa";

// ***************************************************************************************
// sonstige Gegenstände
// ***************************************************************************************
//const string	NAME_Silver					=	"Silber";
const string	NAME_Silver					=	"Stříbro";
//const string	NAME_Pliers					=	"Schmiedezange";
const string	NAME_Pliers					=	"Kovářské kleště";
//const string	NAME_FletcherWood			=	"Holz für Pfeile";
const string	NAME_FletcherWood			=	"Dřevo na šípy";
//const string	NAME_FletcherKnife			=	"Schnitzmesser";
const string	NAME_FletcherKnife			=	"Řezbářský nůž";
//const string	NAME_BowWood				=	"Holz für Bogen";
const string	NAME_BowWood				=	"Dřevo na luk";


//***************************************************************************************
// FONT-Konstanten
//***************************************************************************************
const string	FONT_OLD_BIG				=	"FONT_OLD_20_WHITE.TGA";		// Farbe beige
const string	FONT_OLD_BIG_HI				=	"FONT_OLD_20_WHITE_HI.TGA";		// Farbe weiss
const string	FONT_OLD_SMALL				=	"FONT_OLD_10_WHITE.TGA";		// Farbe beige
const string	FONT_OLD_SMALL_HI			=	"FONT_OLD_10_WHITE_HI.TGA";		// Farbe weiss

const string	FONT_BOOK_SMALL				=	"FONT_10_BOOK.TGA";				// Farbe schwarz
const string	FONT_BOOK_BIG				=	"FONT_15_BOOK.TGA";				// Farbe schwarz

//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
//const string _STR_INVALID					= "(Unbekannt)-"									;
const string _STR_INVALID					= "(nenaučeno)-"									;

//const string _STR_ATTRIBUTE_HITPOINTS		= "Lebens-"											; // tady u těch věcí si nejsem jistý pády, nevím v jakém kontextu to je, ale asi když je požadováno určité množství něčeho?
const string _STR_ATTRIBUTE_HITPOINTS		= "Životní energie-"											;
//const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "maximale Lebens-"								;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maximum životní energie-"								;
//const string _STR_ATTRIBUTE_MANA			= "Mana-"											;
const string _STR_ATTRIBUTE_MANA			= "Magická energie-"											;
//const string _STR_ATTRIBUTE_MANA_MAX		= "maximale Mana-"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Maximum magické energie-"									;
//const string _STR_ATTRIBUTE_STRENGTH		= "Stärke-"											;
const string _STR_ATTRIBUTE_STRENGTH		= "Síly-"											;
//const string _STR_ATTRIBUTE_DEXTERITY		= "Geschicklichkeits-"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Obratnosti-"								;
//const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "magische Zauber-"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Kruh magie-"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
//const string _STR_CANNOTUSE_PRE_PLAYER	= "es fehlen "										;
const string _STR_CANNOTUSE_PRE_PLAYER		= "Nedostatek "										;
//const string _STR_CANNOTUSE_POINTS		= "Punkte"											;
const string _STR_CANNOTUSE_POINTS			= " body"											;
//const string _STR_CANNOTUSE_LEVELS		= "Stufen"											;
const string _STR_CANNOTUSE_LEVELS		    = " úrovně"											;
//const string _STR_CANNOTUSE_POST			= ", um diesen Gegenstand anzulegen"				;
const string _STR_CANNOTUSE_POST			= ", pro použití této položky"				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
//const string _STR_CANNOTUSE_POST_NPC		= ") fehlen"										;
const string _STR_CANNOTUSE_POST_NPC		= ") schází"										;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
//const string _STR_MESSAGE_INTERACT_NO_KEY		= "kein Dietrich oder passender Schlüssel";
const string _STR_MESSAGE_INTERACT_NO_KEY		= "Žádný klíč ani paklíč";
//const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "das hörte sich gut an";
const string _STR_MESSAGE_PICKLOCK_SUCCESS		= "To zní dobře.";
//const string _STR_MESSAGE_PICKLOCK_UNLOCK		= "das Schloß ist geknackt";
const string _STR_MESSAGE_PICKLOCK_UNLOCK		= "Zámek byl otevřen";
//const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Mist.. wieder von vorne";
const string _STR_MESSAGE_PICKLOCK_FAILURE		= "Sakra... a znova od začátku";
//const string _STR_MESSAGE_PICKLOCK_BROKEN		= "der Dietrich ist abgebrochen";
const string _STR_MESSAGE_PICKLOCK_BROKEN		= "Paklíč se zlomil.";

// Textausgabe für Mob-Benutzung
//const string _STR_MESSAGE_MOBSI_MISSING_KEY_OR_LOCKPICK	=	"weder Schlüssel noch Dietrich vorhanden!";
const string _STR_MESSAGE_MOBSI_MISSING_KEY_OR_LOCKPICK		=	"Nemám klíč ani paklíč!";
//const string _STR_MESSAGE_MOBSI_MISSING_KEY				=	"kein Schlüssel vorhanden!";
const string _STR_MESSAGE_MOBSI_MISSING_KEY					=	"Nemám klíč!";
//const string _STR_MESSAGE_MOBSI_MISSING_LOCKPICK			= 	"kein Dietrich vorhanden!";
const string _STR_MESSAGE_MOBSI_MISSING_LOCKPICK			= 	"Nemám paklíč!";
//const string _STR_MESSAGE_MOBSI_NEVER_OPEN				=	"fest verschlossen!";
const string _STR_MESSAGE_MOBSI_NEVER_OPEN					=	"Důkladně zavřené!";
//const string _STR_MESSAGE_MOBSI_MISSING_ITEM				=	"fehlender Gegenstand!";
const string _STR_MESSAGE_MOBSI_MISSING_ITEM				=	"Chybí předmět!";
//const string _STR_MESSAGE_MOBSI_ANOTHER_IS_USING			=	"wird gerade benutzt!";
const string _STR_MESSAGE_MOBSI_ANOTHER_IS_USING			=	"Je používán!";
//const string _STR_MESSAGE_MOBSI_TOO_FAR_AWAY				=	"ist zu weit weg!";
const string _STR_MESSAGE_MOBSI_TOO_FAR_AWAY				=	"Je příliš daleko!";
//const string _STR_MESSAGE_MOBSI_WRONG_SIDE				=	"falsche Seite!";
const string _STR_MESSAGE_MOBSI_WRONG_SIDE					=	"Špatná strana!";

// Bidschrimausgabe zum Thema Hebel/Winden
//const string _STR_MESSAGE_OCLEVER_STUCKS	= "der Hebel bewegt sich kein Haarbreit";
const string _STR_MESSAGE_OCLEVER_STUCKS	= "S tou pákou nejde vůbec pohnout.";
//const string _STR_MESSAGE_WHEEL_STUCKS	= "die Winde klemmt";
const string _STR_MESSAGE_WHEEL_STUCKS		= "Naviják se zamotal.";
//const string _STR_MESSAGE_ARENAWHEEL		= "die Winde darf nur vom Arenameister bedient werden";
const string _STR_MESSAGE_ARENAWHEEL		= "Naviják smí používat pouze mistr arény.";

// Bidschrimausgabe beim storybedingten Transfer von Items
//const string _STR_MESSAGE_ITEM_GIVEN		= " Gegenstand gegeben";	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_GIVEN		= " položka předána!";
//const string _STR_MESSAGE_ITEMS_GIVEN		= " Gegenstände gegeben";
const string _STR_MESSAGE_ITEMS_GIVEN		= " položek předána!";
//const string _STR_MESSAGE_SILVER_GIVEN	= " Silber gegeben";
const string _STR_MESSAGE_SILVER_GIVEN		= " stříbra předáno!";
//const string _STR_MESSAGE_GOLD_GIVEN		= " Gold gegeben";
const string _STR_MESSAGE_GOLD_GIVEN		= " zlata předáno!";
//const string _STR_MESSAGE_ITEM_TAKEN		= " Gegenstand erhalten";
const string _STR_MESSAGE_ITEM_TAKEN		= " položka přijata!";
//const string _STR_MESSAGE_ITEMS_TAKEN		= " Gegenstände erhalten";
const string _STR_MESSAGE_ITEMS_TAKEN		= " položek přijato!";
//const string _STR_MESSAGE_SILVER_TAKEN	= " Silber erhalten";
const string _STR_MESSAGE_SILVER_TAKEN		= " stříbra přijato!";
//const string _STR_MESSAGE_GOLD_TAKEN		= " Gold erhalten";
const string _STR_MESSAGE_GOLD_TAKEN		= " zlata přijato!";

// Bildschirmausgaben beim Plündern
//const string _STR_MESSAGE_ITEM_PLUNDERED		= " Gegenstand genommen"	;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_PLUNDERED		= " položka sebraná!"	;	
//const string _STR_MESSAGE_ITEMS_PLUNDERED		= " Gegenstände genommen"	;
const string _STR_MESSAGE_ITEMS_PLUNDERED		= " položek sebráno!"	;
//const string _STR_MESSAGE_SILVER_PLUNDERED	= " Silber genommen"		;
const string _STR_MESSAGE_SILVER_PLUNDERED		= " stříbra sebráno!"		;
//const string _STR_MESSAGE_GOLD_PLUNDERED		= " Gold gegeben"			;
const string _STR_MESSAGE_GOLD_PLUNDERED		= " zlata sebráno!"			;

// Bidschrimausgabe fürs Tausch-Fenster
//const string _STR_MESSAGE_TRADE_FAILURE		= "der Wert deiner Tauschware ist nicht hoch genug"	;
const string _STR_MESSAGE_TRADE_FAILURE			= "Hodnota tvého zboží není dost vysoká!"	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
//const string _STR_MESSAGE_Joincamp			=	"Voraussetzung für die Aufnahme: Stufe ";
const string _STR_MESSAGE_Joincamp				=	"Podmínka pro přijetí: Úroveň";

// nicht beklaubare NSCs
//const string _STR_MESSAGE_CANNOTSTEAL			=	"kann nicht beklaut werden";
const string _STR_MESSAGE_CANNOTSTEAL			=	"Nelze ukrást.";

// MOBSI-Fehlermeldungen
//const string _STR_MESSAGE_MOBSI_ORE_TOOL		=	"keine Spitzhacke vorhanden!";
const string _STR_MESSAGE_MOBSI_ORE_TOOL		=	"Žádný krumpáč k dispozici!";
//const string _STR_MESSAGE_MOBSI_ORE_MAT			=	"Erzader erschöpft!";
const string _STR_MESSAGE_MOBSI_ORE_MAT			=	"Žíla byla vytěžena!";
//const string _STR_MESSAGE_MOBSI_MELTER_TAL		=	"Talent SCHMIEDEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_MELTER_TAL		=	"Nedostatečná úroveň kovářství!";
//const string _STR_MESSAGE_MOBSI_MELTER_MAT		=	"zu wenig Erznuggets vorhanden!";
const string _STR_MESSAGE_MOBSI_MELTER_MAT		=	"Příliš málo nugetů k dispozici!";
//const string _STR_MESSAGE_MOBSI_MELTER_TOOL		=	"keine Schmiedezange vorhanden!";
const string _STR_MESSAGE_MOBSI_MELTER_TOOL		=	"Žádné kovářské náčiní k dispozici!";
//const string _STR_MESSAGE_MOBSI_FIRE_TAL		=	"Talent SCHMIEDEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_FIRE_TAL		=	"Nedostatečná úroveň kovářství!";
//const string _STR_MESSAGE_MOBSI_FIRE_MAT		=	"kein Roheisen vorhanden!";
const string _STR_MESSAGE_MOBSI_FIRE_MAT		=	"Žádné surové železo k dispozici!";
//const string _STR_MESSAGE_MOBSI_ANVIL_TAL		=	"Talent SCHMIEDEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_ANVIL_TAL		=	"Nedostatečná úroveň kovářství!";
//const string _STR_MESSAGE_MOBSI_ANVIL_MAT		=	"kein glühendes Roheisen vorhanden!";
const string _STR_MESSAGE_MOBSI_ANVIL_MAT		=	"Žádné žhavé surové železo k dispozici!";
//const string _STR_MESSAGE_MOBSI_ANVIL_TOOL		=	"kein Schmiedehammer vorhanden!";
const string _STR_MESSAGE_MOBSI_ANVIL_TOOL		=	"Žádné kovářské kladivo k dispozici!";
//const string _STR_MESSAGE_MOBSI_COOL_TAL		=	"Talent SCHMIEDEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_COOL_TAL		=	"Nedostatečná úroveň kovářství!";
//const string _STR_MESSAGE_MOBSI_COOL_MAT		=	"kein glühender Waffenrohling vorhanden!";
const string _STR_MESSAGE_MOBSI_COOL_MAT		=	"Žádný žhavý polotovar zbraně k dispozici!";
//const string _STR_MESSAGE_MOBSI_SHARP_TAL		=	"Talent SCHMIEDEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_SHARP_TAL		=	"Nedostatečná úroveň kovářství!";
//const string _STR_MESSAGE_MOBSI_SHARP_MAT		=	"kein abgekühlter Waffenrohling vorhanden!";
const string _STR_MESSAGE_MOBSI_SHARP_MAT		=	"Žádný schlazený polotovar zbraně k dispozici!";
//const string _STR_MESSAGE_MOBSI_PAN_MAT			=	"kein Fleisch mehr vorhanden";
const string _STR_MESSAGE_MOBSI_PAN_MAT			=	"Už žádné maso k dispozici";

//const string _STR_MESSAGE_MOBSI_CAULDRON_TAL	=	"Talent KOCHEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_CAULDRON_TAL	=	"Nedostatečná úroveň vaření!";
//const string _STR_MESSAGE_MOBSI_CAULDRON_MAT	=	"Keine Zutaten für eine Rezeptur vorhanden!";
const string _STR_MESSAGE_MOBSI_CAULDRON_MAT	=	"Žádné přísady pro recept k dispozici";
//const string _STR_MESSAGE_MOBSI_CAULDRON_TOOL	=	"kein Kochlöffel vorhanden!";
const string _STR_MESSAGE_MOBSI_CAULDRON_TOOL	=	"Žádná vařečka k dispozici!";
//const string _STR_MESSAGE_MOBSI_CAULDRON_HALVOR	=	"Halvor kann dich sehen!";
const string _STR_MESSAGE_MOBSI_CAULDRON_HALVOR	=	"Halvor tě vidí!";

//const string _STR_MESSAGE_MOBSI_LAB_MAT			=	"Keine ausreichenden Zutaten für eine Rezeptur!";
const string _STR_MESSAGE_MOBSI_LAB_MAT			=	"Nedostatek přísad pro recepturu!";
//const string _STR_MESSAGE_MOBSI_LAB_TAL			=	"Talent ALCHEMIE ist nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_LAB_TAL			=	"Nedostatečná úroveň alchymie!";

//const string _STR_MESSAGE_MOBSI_RUNEMELTER_MAT	=	"nicht genug Erz vorhanden!";
const string _STR_MESSAGE_MOBSI_RUNEMELTER_MAT	=	"Nedostatek rudy!";
//const string _STR_MESSAGE_MOBSI_RUNEMAKER_MAT	=	"kein leerer Runenstein oder Spruchrolle vorhanden!";
const string _STR_MESSAGE_MOBSI_RUNEMAKER_MAT	=	"Žádný runový kámen nebo svitek k dispozici!";
//const string _STR_MESSAGE_MOBSI_RUNE_TOOL		=	"keine Schmiedezange vorhanden!";
const string _STR_MESSAGE_MOBSI_RUNE_TOOL		=	"Žádné kovářské kleště k dispozici!";
//const string _STR_MESSAGE_MOBSI_RUNE_TAL		=	"Talent RUNEN ERSCHAFFEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_RUNE_TAL		=	"Nedostatečná úroveň výroby run!";
//const string _STR_MESSAGE_MOBSI_RUNE_MANA		=	"Nicht genug Mana für die Erschaffung!";
const string _STR_MESSAGE_MOBSI_RUNE_MANA		=	"Nedostatek many pro výrobu!";

//const string _STR_MESSAGE_MOBSI_WOOD_TOOL		=	"kein Holzmesser vorhanden!";
const string _STR_MESSAGE_MOBSI_WOOD_TOOL		=	"Žádný nůž na dřevo k dispozici!";
//const string _STR_MESSAGE_MOBSI_WOOD_MAT		=	"Bogenholz ist abgeerntet!";
const string _STR_MESSAGE_MOBSI_WOOD_MAT		=	"Dřevo na luk je sklizeno!"; // Asi to není úplně správný výraz.

//const string _STR_MESSAGE_MOBSI_BOW_TAL			=	"Talent BOGENMACHEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_BOW_TAL			=	"Nedostatečná úroveň výroby luků!";
//const string _STR_MESSAGE_MOBSI_BOW_MAT			=	"Nicht genug Materialien vorhanden!";
const string _STR_MESSAGE_MOBSI_BOW_MAT			=	"Nedostatek materiálu k dispozici!";
//const string _STR_MESSAGE_MOBSI_BOW_TOOL		=	"Kein Bogenmachermesser vorhanden!";
const string _STR_MESSAGE_MOBSI_BOW_TOOL		=	"Žádný nůž na výrobu luku k dispozici!";
//const string _STR_MESSAGE_MOBSI_Bow_Book		=	"Noch kein Rezept gelernt!";
const string _STR_MESSAGE_MOBSI_Bow_Book		=	"Ještě neznáš žádný recept!";

//const string _STR_MESSAGE_MOBSI_FLETCHER_TAL	=	"Talent BOGENMACHEN nicht ausreichend!";
const string _STR_MESSAGE_MOBSI_FLETCHER_TAL	=	"Nedostatečná úroveň výroby luků!";
//const string _STR_MESSAGE_MOBSI_FLETCHER_MAT	=	"Nicht genug Materialien vorhanden!";
const string _STR_MESSAGE_MOBSI_FLETCHER_MAT	=	"Nedostatek materiálu k dispozici!";
//const string _STR_MESSAGE_MOBSI_FLETCHER_TOOL	=	"Kein Bogenmachermesser!";
const string _STR_MESSAGE_MOBSI_FLETCHER_TOOL	=	"Žádný nůž na výrobu luku!";

//const string _STR_MESSAGE_MOBSI_WATERPIPE_MAT	=	"Nicht genug Sumpfkraut dabei!";
const string _STR_MESSAGE_MOBSI_WATERPIPE_MAT	=	"Nemáš k tomu dost trávy z bažin!";

//const string _STR_MESSAGE_MOBSI_STOMPER_MAT		=	"Nicht genug Sumpfkraut dabei!";
const string _STR_MESSAGE_MOBSI_STOMPER_MAT		=	"Nemáš k tomu dost trávy z bažin!";
//const string _STR_MESSAGE_MOBSI_STOMPER_TOOL	=	"Kein Krautstamper vorhanden!";
const string _STR_MESSAGE_MOBSI_STOMPER_TOOL	=	"Žádná palice k dispozici!"; // Nevím jak správně přeložit, ale asi je to prostě palice na drcení bylin?

//const string _STR_MESSAGE_MOBSI_ARENABENCH_GLADIATOR	=	"nur für die Kampfvorbereitung!";
const string _STR_MESSAGE_MOBSI_ARENABENCH_GLADIATOR	=	"Jen pro přípravu na souboj!";
//const string _STR_MESSAGE_MOBSI_ARENABENCH_CHAMBER	=	"falsche Vorbereitungskammer!";
const string _STR_MESSAGE_MOBSI_ARENABENCH_CHAMBER		=	"Špatná místnost na přípravu!";

// Textausgabe für Steal
//const string _STR_MESSAGE_STEAL_NPC_IS_AWARE			=	"mein Opfer beobachtet mich";
const string _STR_MESSAGE_STEAL_NPC_IS_AWARE			=	"Moje oběť mě sleduje";
//const string _STR_MESSAGE_STEAL_NO_TALENT				=	"kein Taschendiebstahl-Talent";
const string _STR_MESSAGE_STEAL_NO_TALENT				=	"neumím vybírat kapsy";
//const string _STR_MESSAGE_STEAL_NOT_IN_RANGE			=	"zu weit weg!";
const string _STR_MESSAGE_STEAL_NOT_IN_RANGE			=	"Příliš daleko!";
//const string _STR_MESSAGE_STEAL_NPC_IS_EMPTY			=	"der hat nichts dabei!";
const string _STR_MESSAGE_STEAL_NPC_IS_EMPTY			=	"Nemá nic u sebe!";

// Textausgabe für bereits geplünderte Leiche
//const string _STR_MESSAGE_PLUNDER_IS_EMPTY			=	"da ist nichts mehr zu holen!";
const string _STR_MESSAGE_PLUNDER_IS_EMPTY				=	"Nic víc k sebrání!";

// Textausgabe wenn Muntion alle ist
//const string _STR_MESSAGE_RANGED_NO_AMMO				=	"keine Munition!";
const string _STR_MESSAGE_RANGED_NO_AMMO				=	"Žádná munice!";

// Lern-Meldungen
//const string _STR_MESSAGE_LEARNSMITH			=	"Wissen über neue Waffe erlernt!";
const string _STR_MESSAGE_LEARNSMITH			=	"Naučil jsem se kovat nové zbraně!";
//const string _STR_MESSAGE_LEARNCOOK			=	"Wissen über neues Kochrezept erlernt!";
const string _STR_MESSAGE_LEARNCOOK				=	"Naučil jsem se nové recepty!";
//const string _STR_MESSAGE_LEARNALCHEMIE		=	"Wissen über neues Alchemierezept erlernt!";
const string _STR_MESSAGE_LEARNALCHEMIE			=	"Naučil jsem se nové alchymistické receptury!";
//const string _STR_MESSAGE_LEARNthaumaturgy	=	"Wissen über neue Rune erlernt!";
const string _STR_MESSAGE_LEARNthaumaturgy		=	"Naučil jsem se vytvářet nové runy!";
//const string _STR_MESSAGE_LEARNBOW			=	"Wissen über das Bogenmachen erlernt!";
const string _STR_MESSAGE_LEARNBOW				=	"Naučil jsem se vyrábět luky!";
//const string _STR_MESSAGE_LEARNPLANTS			=	"Wissen über Pflanzen erlernt!";
const string _STR_MESSAGE_LEARNPLANTS			=	"Naučil jsem se o bylinkách!";

//const string _STR_MESSAGE_ADDDARKPOINTS	=	"deine dunkle Seite wird stärker!";
const string _STR_MESSAGE_ADDDARKPOINTS		=	"Tvoje temná stránka sílí!";
//const string _STR_MESSAGE_ADDFAME			=	"deine Bekanntheit wächst!";
const string _STR_MESSAGE_ADDFAME			=	"Tvoje proslulost roste!";

const string _STR_MESSAGE_ARENARANK			=	"Místo ";
const string _STR_MESSAGE_ARENAVICTORY		=	" Vítězství";
const string _STR_MESSAGE_ARENAVICTORIES	=	" Vítězství";
const string _STR_MESSAGE_ARENAPENALTY1		=	"Postih!";
const string _STR_MESSAGE_ARENAPENALTY2		=	"(Protivník není připraven)";
const string _STR_MESSAGE_ARENAPLAYERVICTORY=	"Vyhrál jsi!";
const string _STR_MESSAGE_ARENAPLAYERDEFEAT =	"Byl jsi poražen!";

//const string _STR_MESSAGE_EXPLO				=	"Verborgener Ort entdeckt !";
const string _STR_MESSAGE_EXPLO				=	"Objeveno skryté místo!";

//const string _STR_MESSAGE_PHOENIX_NOTYET	=	"Merkwürdige Kiste! Lässt sich kein haarbreit bewegen!";
const string _STR_MESSAGE_PHOENIX_NOTYET	=	"Prazvláštní bedna! Nechce se pohnout ani o chlup!"; // Asi není ideální, neznám kontext.
//const string _STR_MESSAGE_DTCELL_NOTYET	=	"Der Hebel scheint magisch blockiert zu sein!";
const string _STR_MESSAGE_DTCELL_NOTYET		=	"Ta páka je asi blokovaná pomocí magie!";

//const string _STR_MESSAGE_DEATH0			=	"Dies ist dein Ende!";
const string _STR_MESSAGE_DEATH0			=	"To je tvůj konec!";
//const string _STR_MESSAGE_DEATH1			=	"Du hast versagt!";
const string _STR_MESSAGE_DEATH1			=	"Selhal jsi!";
//const string _STR_MESSAGE_DEATH2			=	"Deine Reise endet hier!";
const string _STR_MESSAGE_DEATH2			=	"Tvá pouť končí zde!";
//const string _STR_MESSAGE_DEATH3			=	"Der Tod siegt immer!";
const string _STR_MESSAGE_DEATH3			=	"Smrt vždy zvítězí!";
//const string _STR_MESSAGE_DEATH4			=	"Dein Leben endet hier!";
const string _STR_MESSAGE_DEATH4			=	"Tvůj život končí zde!";
//const string _STR_MESSAGE_DEATH5			=	"Dein Tod ist die Freiheit der Dämonen!";
const string _STR_MESSAGE_DEATH5			=	"Tvoje smrt znamená osvobození démonů!";
//const string _STR_MESSAGE_DEATH6			=	"Du warst nicht gut genug!";
const string _STR_MESSAGE_DEATH6			=	"Nebyl jsi dost dobrý!";
//const string _STR_MESSAGE_DEATH7			=	"Die Dämonen werden siegen!";
const string _STR_MESSAGE_DEATH7			=	"Démoni zvítězí!";
//const string _STR_MESSAGE_DEATH8			=	"Am Ende aller Dinge steht der Tod!";
const string _STR_MESSAGE_DEATH8			=	"Na konci všech věcí stojí smrt!";
//const string _STR_MESSAGE_DEATH9			=	"Dämonen werden nun Einzug halten...!";
const string _STR_MESSAGE_DEATH9			=	"Příchodu démonů už nebude zabráněno...!";
//const string _STR_MESSAGE_DEATH10  		=	"Du bist Tot!";
const string _STR_MESSAGE_DEATH10  			=	"Jsi mrtvý!";
//const string _STR_MESSAGE_DEATH11  		=	"Dein Weg endet hier!";
const string _STR_MESSAGE_DEATH11  			=	"Tvoje cesta zde končí!";
//const string _STR_MESSAGE_DEATH12			=	"Jeder muss einmal sterben!";
const string _STR_MESSAGE_DEATH12			=	"Každý musí někdy zemřít!";

//const string _STR_MESSAGE_RUNEINACTIVE	=	"Das magische Pentagramm wurde blockiert!";
const string _STR_MESSAGE_RUNEINACTIVE		=	"Magický pentagram byl zablokován!";
//const string _STR_MESSAGE_SPELLWRONGPLACE	=	"Der Zauber scheint hier nicht zu wirken!";
const string _STR_MESSAGE_SPELLWRONGPLACE	=	"Zdá se, že to kouzlo zde nefunguje!";
//const string _STR_MESSAGE_SPELLWRONG		=	"Der Zauber benötigt noch irgendetwas...";
const string _STR_MESSAGE_SPELLWRONG		=	"To kouzlo ještě něco potřebuje...";

//const string _STR_MESSAGE_GAMESTART		=	"Arbeitsversion der 2. Etappe !!!";
const string _STR_MESSAGE_GAMESTART			=	"Pracovní verze druhé etapy!!!";
//const string _STR_MESSAGE_GAMEEND			=	"Hier endet das Zwischen-Release !";
const string _STR_MESSAGE_GAMEEND			=	"Tady Sequel končí!";

//const string _STR_MESSAGE_WHEEL_JAMMED	=	"die Winde klemmt!";
const string _STR_MESSAGE_WHEEL_JAMMED		=	"Naviják se zamotal.";
//const string _STR_MESSAGE_MOBSI_BROKEN	=	"nicht mehr zu gebrauchen!";
const string _STR_MESSAGE_MOBSI_BROKEN		=	"to už nepůjde použít";

//const string _STR_MESSAGE_LEVELTOOLOW		=	"benötigte Stufe: ";
const string _STR_MESSAGE_LEVELTOOLOW		=	"Potřebná úroveň: ";

// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
const int	_XPOS_MESSAGE_ARENARANK			=	35;
const int	_XPOS_MESSAGE_ARENANAME			=	47;
const int	_XPOS_MESSAGE_ARENAVICTORIES	=	60;


// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
const int	_YPOS_MESSAGE_GIVEN				=	37;
const int	_YPOS_MESSAGE_TAKEN				=	40;
const int	_YPOS_MESSAGE_CHANGEATTITUDE	=	43;
const int	_YPOS_MESSAGE_LOGENTRY			=	45;
const int	_YPOS_MESSAGE_XPGAINED			=	50;
const int	_YPOS_MESSAGE_LPGAINED			=	50;
const int	_YPOS_MESSAGE_LEVELUP			=	55;
const int	_YPOS_MESSAGE_PICKLOCK_SUCCESS	=	6;
const int	_YPOS_MESSAGE_PICKLOCK_UNLOCK	=	9;
const int	_YPOS_MESSAGE_PICKLOCK_FAILURE	=	12;
const int 	_YPOS_MESSAGE_PICKLOCK_BROKEN	=	15;
const int	_YPOS_MESSAGE_CANNOTSTEAL		=	6;
const int	_YPOS_MESSAGE_MOBSI				=	6;
const int	_YPOS_MESSAGE_LEARN				=	60;
const int	_YPOS_MESSAGE_PRODUCE			=	60;
const int	_YPOS_MESSAGE_ADDDARKPOINTS		=	60;
const int	_YPOS_MESSAGE_ADDFAME			=	60;
const int	_YPOS_MESSAGE_ARENARANKING		=	30;
const int	_YPOS_MESSAGE_ARENARANKINGROW	=	3;
const int	_YPOS_MESSAGE_ARENAPENALTY1		=	50;
const int	_YPOS_MESSAGE_ARENAPENALTY2		=	55;
const int	_YPOS_MESSAGE_ARENARESULT		=	42;
const int	_YPOS_MESSAGE_REFUSEACTION		=	6;
const int	_YPOS_MESSAGE_EXPLO				=	40;
const int	_YPOS_MESSAGE_LEVELTOOLOW		=	50;


// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
const int	_TIME_MESSAGE_GIVEN				=	1;
const int	_TIME_MESSAGE_TAKEN				=	1;
const int	_TIME_MESSAGE_LOGENTRY			=	1;
const int	_TIME_MESSAGE_XPGAINED			=	1;
const int	_TIME_MESSAGE_LPGAINED			=	2;
const int	_TIME_MESSAGE_LEVELUP			=	2;
const int	_TIME_MESSAGE_RAISEATTRIBUTE	=	4;
const int	_TIME_MESSAGE_PICKLOCK			=	3;
const int	_TIME_MESSAGE_CANNOTSTEAL		=	2;
const int	_TIME_MESSAGE_MOBSI				=	2;
const int	_TIME_MESSAGE_LEARN				=	5;
const int	_TIME_MESSAGE_PRODUCE			=	1;
const int	_TIME_MESSAGE_ADDDARKPOINTS		=	2;
const int	_TIME_MESSAGE_ADDFAME			=	2;
const int	_TIME_MESSAGE_ARENARANKING		=	5;
const int	_TIME_MESSAGE_ARENAPENALTY		=	2;
const int	_TIME_MESSAGE_ARENARESULT		=	3;
const int	_TIME_MESSAGE_REFUSEACTION		=	1;
const int	_TIME_MESSAGE_EXPLO				=	2;
const int	_TIME_MESSAGE_DEATH				=	2;
const int	_TIME_MESSAGE_CHANGEATTITUDE	=	2;
const int	_TIME_MESSAGE_GAMESTART			=	7;
const int	_TIME_MESSAGE_GAMEEND			=	10;
const int	_TIME_MESSAGE_LEVELTOOLOW		=	3;

// ***************************************************************************************
// Sounds-Definitionen
// ***************************************************************************************
const string _SOUND_PICKLOCK_SUCCESS	= "PICKLOCK_SUCCESS"								;
const string _SOUND_PICKLOCK_FAILURE	= "PICKLOCK_FAILURE"								;
const string _SOUND_PICKLOCK_UNLOCK		= "PICKLOCK_UNLOCK"									;
const string _SOUND_PICKLOCK_BROKEN		= "PICKLOCK_BROKEN"									;


// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
const string NAME_BuyPrefix			=	" koupit (";
const string NAME_BuyPostfix		=	" stříbra)";
const string NAME_BuyArmorPrefix	=	" (";
const string NAME_BuyArmorPostfix	=	" stříbra)";
const string NAME_PrizePostfix		=	" stříbra";
const string NAME_LearnPrefix		=	" (";
const string NAME_LearnMidfix		=	" stříbra, ";
const string NAME_LearnPostfixS		=	" Vědomostní bod)";
const string NAME_LearnPostfixP		=	" Vědomostních bodů)";

const string NAME_LearnStrength_1	=	"Síla +1";
const string NAME_LearnStrength_5	=	"Síla +5";
const string NAME_LearnStrength_10	=	"Síla +10";
const string NAME_LearnStrength_20	=	"Síla +20";

const string NAME_LearnDexterity_1	=	"Obratnost +1";
const string NAME_LearnDexterity_5	=	"Obratnost +5";
const string NAME_LearnDexterity_10	=	"Obratnost +10";
const string NAME_LearnDexterity_20	=	"Obratnost +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Jednoruční zbraň - Úroveň 1";
const string NAME_Learn1h_2			=	"Jednoruční zbraň - Úroveň 2";
const string NAME_Learn2h_1			=	"Obouruční zbraň - Úroveň 1";
const string NAME_Learn2h_2			=	"Obouruční zbraň - Úroveň 2";
const string NAME_LearnStaff_1		=	"Boj s holí - Úroveň 1";
const string NAME_LearnStaff_2		=	"Boj s holí - Úroveň 2";

const string NAME_LearnBow_1		=	"Luk - Úroveň 1";
const string NAME_LearnBow_2		=	"Luk - Úroveň 2";
const string NAME_LearnCrossbow_1	=	"Kuš - Úroveň 1";
const string NAME_LearnCrossbow_2	=	"Kuš - Úroveň 2";

const string NAME_LearnMage_1		=	"1. Kruh magie";
const string NAME_LearnMage_2		=	"2. Kruh magie";
const string NAME_LearnMage_3		=	"3. Kruh magie";
const string NAME_LearnMage_4		=	"4. Kruh magie";
const string NAME_LearnMage_5		=	"5. Kruh magie";
const string NAME_LearnMage_6		=	"6. Kruh magie";

const string NAME_LearnPickpocket_1	=	"Vybírání kapes - Úroveň 1";
const string NAME_LearnPickpocket_2	=	"Vybírání kapes - Úroveň 2";
const string NAME_LearnPicklock_1	=	"Otevírání zámků - Úroveň 1";
const string NAME_LearnPicklock_2	=	"Otevírání zámků - Úroveň 2";

const string NAME_LearnAcrobat		=	"Akrobacie";
const string NAME_LearnSneak		=	"Plížení";

const string NAME_LearnSmith_1		=	"Kovářství - Úroveň 1";
const string NAME_LearnSmith_2		=	"Kovářství - Úroveň 2";
const string NAME_LearnSmith_3		=	"Kovářství - Úroveň 3";

const string NAME_LearnCook_1		=	"Vaření - Úroveň 1";
const string NAME_LearnCook_2		=	"Vaření - Úroveň 2";
const string NAME_LearnCook_3		=	"Vaření - Úroveň 3";

const string NAME_LearnAlchemy_1	=	"Alchymie - Úroveň 1";
const string NAME_LearnAlchemy_2	=	"Alchymie - Úroveň 2";
const string NAME_LearnAlchemy_3	=	"Alchymie - Úroveň 3";

const string NAME_LearnThaumaturgy_1=	"Výroba run -  Úroveň 1";
const string NAME_LearnThaumaturgy_2=	"Výroba run -  Úroveň 2";
const string NAME_LearnThaumaturgy_3=	"Výroba run -  Úroveň 3";

const string NAME_LearnBowmaker_1	=	"Výroba luků - Úroveň 1";
const string NAME_LearnBowmaker_2	=	"Výroba luků - Úroveň 2";
const string NAME_LearnBowmaker_3	=	"Výroba luků - Úroveň 3";


const string NAME_RaiseStrength		=	"Síla +";
const string NAME_RaiseDexterity	=	"Obratnost +";
const string NAME_RaiseStrDex		=	"Síla a obratnost +";
const string NAME_RaiseManaMax		=	"Maximum magické energie +";
const string NAME_RaiseHealthMax	=	"Maximum zdraví +";


// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Některé změny v nastavení se projeví až po dalším spuštění hry.";

// ***************************************************************************************
// Missionen-Konstanten
// ***************************************************************************************
const int	NAME_IgarazSilver		= 20;


