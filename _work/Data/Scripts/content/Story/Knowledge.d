///////////////////////////////////////
//	SC-Kenntnisse über Tierverwertung
///////////////////////////////////////
var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;


////////////////////////////////////////
//	SC-Kenntnisse über Schmiedewaffen
////////////////////////////////////////
var int	Knows_Shortsword;
var int	Knows_Longsword;
var int	Knows_Broadsword;
var int	Knows_Bastardsword;
var int	Knows_2HSword;
var int	Knows_OrcSword;

var int	Knows_Hatchet;
var int	Knows_Battleaxe;
var int	Knows_DoublebladedAxe;
var int	Knows_BerserkAxe;
var int	Knows_OrcAxe;

var int	Knows_IronClub;
var int	Knows_Mace;
var int	Knows_Morningstar;
var int	Knows_Warhammer;
var int	Knows_OrcHammer;

////////////////////////////////////////
//	SC-Kenntnisse über Kochrezepte
////////////////////////////////////////

var int Knows_RecipeMeatbug;
var int Knows_RecipeMolerat;
var int Knows_RecipeHerb;
var int Knows_RecipeMushroom;
var int Knows_RecipeMeat;

////////////////////////////////////////
//	SC-Kenntnisse über Alchemierezepte
////////////////////////////////////////
var int Knows_ManaPotions;
var int Knows_HealingPotions;
var int Knows_SpeedPotions;
var int Knows_DexterityPotions;
var int Knows_StrengthPotions;
var int Knows_HpMaxPotions;
var int Knows_ManaMaxPotions;


////////////////////////////////////////
//	SC-Kenntnisse über Bogenherstellung
////////////////////////////////////////
var int Knows_RecipeBow;
var int Knows_RecipeLongBow;
var int Knows_RecipeCrossBow;

////////////////////////////////////////
//	SC-Kenntnisse über Pflanzen
////////////////////////////////////////
var int	Knows_MountainMoss;
var int	Knows_Stoneroot;
var int Knows_BloodThistle;
var int Knows_OrcLeaf;
var int Knows_Ravenherb;
var int Knows_Nightshade;
var int Knows_CaveMushroom;
var int Knows_Woodberry;
var int Knows_Flameberry;
var int Knows_Trollberry;




//#################################################################################
//#################################################################################
//
//	WISSEN - Nahkampfwaffen
//
//#################################################################################
//#################################################################################
func void B_LearnShortsword()
{
	if	!Knows_Shortsword
	{
		Knows_Shortsword 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "KURZSCHWERT: Eine kurze Klinge eine Elle lang und doppelschneidig. Die Parierstange ist kurz und rundlich. Die Waffe selbst ist bei Dieben und Mördern sehr beliebt, da sie leicht zu verbergen ist und auch im dichtesten Handgemenge nicht behindert.");
	};
		B_LogEntry		(GE_SmithWeapons, "KRÁTKÝ MEČ: Krátká čepel, dlouhá zhruba jeden loket, s ostřím na obou stranách. Záštita je krátká a zakulacená. Tato zbraň je velice oblíbená u zlodějů a vrahů, protože je možné ji snadno skrýt a neomezuje ani při té nejhustší rvačce.");
};

func void B_LearnLongsword()
{
	if	!Knows_Longsword
	{
		Knows_Longsword 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "LANGSCHWERT: Die ideale Waffe für die Verteidigung des Heims ebenso wie für den fahrenden Wanderer. Die drei Fuß messende, doppelschneidige Klinge wird mit einem Quereisen als Parierstange sowie einem Lederumwickelten Griff abgesetzt. Mit wenig Kraft zu schwingen, kann diese Waffe doch heftige Wunden in Mensch wie Tier reissen.");
		B_LogEntry		(GE_SmithWeapons, "DLOUHÝ MEČ: Ideální zbraň pro ochranu domova a majetku, stejně tak jako pro pocestné. Tři stopy měřící oboustranná čepel je osazena diagonální záštitou a kůží potaženou rukojetí. S docela malou silou dokáže tato zbraň napáchat veliké škody lidským i zvířecím protivníkům");
	};
};

func void B_LearnBroadsword()
{
	if	!Knows_Broadsword
	{
		Knows_Broadsword 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "BREITSCHWERT: Drei Fuß messender Stahl, dessen gewaltige Wucht von der breiten doppelschneidigen Klinge herrührt. Dies ist die Waffe von Kriegern und Söldnern und nichts für Anfänger. Die ein Fuß messende Parierstange kann auch die stärksten Attacken abwehren und der Griff aus kreuzweise umwundenen Draht gibt der Hand, die diese schwere Waffe in den Kampf führt, optimalen Halt.");
		B_LogEntry		(GE_SmithWeapons, "ŠIROKÝ MEČ: Tři stopy měřící zbraň, jejíž síla vychází ze široké dvoubřité čepele. Toto je zbraň válečníků a vojáků a ne pro začátečníky. Stopu široká záštita dokáže odrazit ty nejsilnější útoky a rukojeť s křížovým drátěným vinutím umožňuje pohodlné držení této těžké zbraně.");
	};
};

func void B_LearnBastardsword()
{
	if	!Knows_Bastardsword
	{
		Knows_Bastardsword 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "BASTARDSCHWERT: Wer diese vier Fuß lange, gewaltige Klinge einhändig in den Kampf führen kann, gehört zur Elite unter den Schwertkämpfern. Die Verbindung von Klinge, Parierstange und Griff muß besonders robust ausgeführt werden, um die Wucht der Schläge auch dauerhaft unbeschadet zu überstehen.");
		B_LogEntry		(GE_SmithWeapons, "MEČ BASTARD: Ten, kdo dokáže tuto čtyři stopy dlouhou zbraň vést jednou rukou, patří mezi šermířskou elitu. Spojení čepele, záštity a rukojeti musí být obzvláště robustní, aby vydrželo sílu úderů a zabránilo tak trvalému poškození.");
	};
};

func void B_Learn2HSword()
{
	if	!Knows_2HSword
	{
		Knows_2HSword 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "ZWEIHÄNDER: Dies ist die Köngisklasse unter den Schwertern. die fast fünf Fuß messende, zweischneidige Klinge muß auch von den stärksten Kriegern beidhändig geführt werden. Trifft sie dann aber ihr Ziel, so läßt sie meist nur den Tod zurück. Während das obere Ende der Klinge mit herausgeschliffenen Wellen versehen ist, um mehr Schaden anzurichten, so wurde das  Ende vor der Parierstange mit wehrhaften Stacheln versehen, um auch im Handgemenge den Gegner verletzen zu können.");
		B_LogEntry		(GE_SmithWeapons, "OBOURUČÁK: Král mezi meči. Skoro pět stop dlouhou čepel musí oběma rukama ovládat i ti nejsilnější bojovníci. Zasáhne-li však svůj cíl, nezanechá za sebou zpravidla pouze smrt. Zatímco je horní konec čepele opatřen vybroušenými vlnkami, aby způsobil co nejvyšší poškození, konec čepele před záštitou je osazen hroty, které je možné použít ke zranění protivníka ve rvačce.");
	};
};

func void B_LearnOrcSword()
{
	if	!Knows_OrcSword
	{
		Knows_OrcSword 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "KRUSH VARROK: Diese Orkwaffe ein Schwert zu nennen wäre Ketzerei. Es ist ein Vernichter. Diese fünf Fuß lange, axtförmig gebogene Schwertklinge, wird an einer Griffstange geführt, die hinter der Schneide auf fast der gesamten Waffenlänge verläuft. Dieses Schwert muß aus dem seltenen Bluterz gefertig werden und ist zwar die leichteste Orkwaffe, aber dennoch tödlicher, als jede von Menschen hergestellte Klinge.");
		B_LogEntry		(GE_SmithWeapons, "KRUSH VARROK: Nazvat tuto skřetí zbraň mečem by bylo kacířství. Je to ničitel. Tato pět stop dlouhá zbraň má ostří ve tvaru obrovské sekery, které zakrývajícím rukojeť zbraně. Tato čepel musí být vyrobena ze vzácné krvavé rudy a je nejlehčí skřetí zbraní, ale stále smrtelnější, než jakákoliv zbraň vyrobená lidmi.");
	};
};

func void B_LearnHatchet()
{
	if	!Knows_Hatchet
	{
		Knows_Hatchet 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "BEIL: Ein kleines Axtblatt und ein anderthalb Fuß messender Schaft bilden das ideale Werkzeug des Waldläufers. Ob Brennholz geschlagen oder die kleineren Raubtiere des Waldes abgewehrt werden sollen, das Beil ist ein zuverlässiger Begleiter.");
		B_LogEntry		(GE_SmithWeapons, "SEKERA: Malá sekera a stopu a půl dlouhé topůrko tvoří tento ideální nástroj pro dobrodruhy. Ať už potřebujete připravit dřevo na oheň, nebo odhánět malá divoká  lesní zvířata, sekera je spolehlivým společníkem.");
	};
};

func void B_LearnBattleaxe()
{
	if	!Knows_Battleaxe
	{
		Knows_Battleaxe 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "STREITAXT: Die Waffe für den ungestümen Krieger. Das wuchtige Axtblatt kann von starken Kämpfern noch einhändig geführt werden und so sowohl Mensch wie auch Tier schmerzhafte Wunden zufügen.");
		B_LogEntry		(GE_SmithWeapons, "BOJOVÁ SEKYRA: Zbraň pro temperamentní válečníky. Mohutné ostří sekyry mohou silní bojovníci ovládat jednou rukou a způsobit tak bolestivá zranění lidem a zvířatům.");
	};
};

func void B_LearnDoublebladedAxe()
{
	if	!Knows_DoublebladedAxe
	{
		Knows_DoublebladedAxe	= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "DOPPELBLATT-AXT: Der zwei Fuß durchmessende, zweischneidige  Axtkopf sitzt auf einem mit Metallringen verstärktem extralangen Schaft der es erlaubt, diese verherende Waffe mit beiden Händen zu führen. Falls der Kämpfer über ausreichend Kraft verfügt, so kann er mit diesem Werkzeug der Zerstörung nicht nur Bäume fällen... .");
		B_LogEntry		(GE_SmithWeapons, "DVOUBŘITÁ SEKYRA: Dvoubřitá sekyra s ostřím o průměru téměř dvou stop je zasazena do topůrka vyztuženého kovovými kroužky. Váha zbraně omezuje bojovníka na používání zbraně v obou rukou. Pokud je bojovník obdařen velikou silou, může tento nástroj ničení použít nejen na kácení stromů...");
	};
};

func void B_LearnBerserkAxe()
{
	if	!Knows_BerserkAxe
	{
		Knows_BerserkAxe		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "BERSERKERAXT: Noch größer und wuchtiger als die Doppelblättrige Axt ist diese Waffe schon kaum mehr als Axt zu bezeichnen. Ein einzelner Krieger kann mit diesem Monster aus Stahl Breschen in ganze Infantrieformationen schlagen. Sollte bei keinem Feldzug fehlen!");
		B_LogEntry		(GE_SmithWeapons, "SEKYRA BERSERKERA: Tato zbraň je mnohem větší a mohutnější, než dvoubřitá sekyra, stěží ji můžeme nazývat sekyrou. Jediný válečník se může tímto ocelovým monstrem prosekávat skrze celé formace nepřátelských vojáků. Neměla by chybět při žádném válečném tažení.");
	};
};

func void B_LearnOrcAxe()
{
	if	!Knows_OrcAxe
	{
		Knows_OrcAxe			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "KRUSH BROKDAR: Endlich ist klar, wie die Orks ihre menschlichen Wiedersacher in derart vernichtenden Schlachten immer wieder in die Flucht schlagen konnten. Nur aus dem seltenen Bluterz herzustellen ist diese orkische Axt der Gipfel der Vernichtung. Sie kann nur von den allerstärksten Menschen geführt werden kann, mäht aber Gegner nieder wie die Sense das Gras. Eine hässliche Waffe, die hässliche Wunden schlägt.");
		B_LogEntry		(GE_SmithWeapons, "KRUSH BROKDAR: Konečně je jasné, jak se mohlo skřetům v ničivých bitvách podařit zahnat své lidské protivníky na útěk. Tato skřetí sekyra, vyráběna jedině ze vzácné krvavé rudy, je vrcholem ničení. Dokáží ji nosit jen ti nejsilnější z lidských bojovníků, ale potom poráží své protivníky jako trávu kosou. Ošklivá zbraň, která pusobí ošklivá poškození.");
	};
};

func void B_LearnIronclub()
{
	if	!Knows_Ironclub
	{
		Knows_Ironclub 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "EISENKEULE: Ein eiserner Schaft, der an seinem Ende etwas verdickt ist, um mehr Wucht hinter den Schlag zu setzen. Diese metallene Variante des Holzknüppels ist die ideale Ergänzung für eine Kneipenschlägerei und das blose Tragen eines solchen Gegenstandes vermeidet oft unangenehme nächtliche Begegnungen.");
		B_LogEntry		(GE_SmithWeapons, "ŽELEZNÝ KYJ: Železná tyč se na konci mírně rozšiřuje, aby při úderu způsobila větší poškození. Tato železná varianta dřevěné hole je ideální nástroj pro hospodskou rvačku. Nošením této zbraně se člověk často vyhne nepříjemným nočním setkáním.");
	};
};

func void B_LearnMace()
{
	if	!Knows_Mace
	{
		Knows_Mace 				= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "STREITKOLBEN: Auf einem metallenen Waffenstumpf sitzt ein etwa kindskopfgroßes Gebilde aus pilzartig angeordneten Eisenlamellen. Diese wehrhafte Waffe ist schnell und besitzt doch ausreichend Wucht, um auch schwere Rüstungen ordentlich zu verbeulen. Sehr beliebt bei religiösen Fanatikern und als Zweitwaffe auch bei königlichen Paladinen stark im Kommen.");
		B_LogEntry		(GE_SmithWeapons, "PALCÁT: Na kovovém válci sedí útvar velikosti dětské hlavy pokrytý kovovými lamelami. Tato zbraň je rychlá a přesto má dostatek síly na to, aby prorazila i těžké brnění. Zbraň je velice oblíbená u náboženských fanatiků a jako druhá zbraň královských paladinů.");
	};
};

func void B_LearnMorningstar()
{
	if	!Knows_Morningstar
	{
		Knows_Morningstar 		= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "MORGENSTERN: Dies ist die unhöfliche Variante des Streitkolbens. Ein massiver, mit hässlichen Dornen gespickter Eisenkopf sitzt auf einem verstärkten Schaft. Diese Waffe ist nicht nur bei Rittern weithin gefürchtet, sondern kann auch gut geschützte Monsterpanzer mit Leichtigkeit knacken.");
		B_LogEntry		(GE_SmithWeapons, "KROPÁČ: Jedná se o hrubou variantu krumpáče. Masivní hlavice s ošklivými trny sendí na zesílené rukojeti. Této zbraně se nebojí pouze rytíři, ale také krunýři chránená zvířata.");
	};
};

func void B_LearnWarhammer()
{
	if	!Knows_Warhammer
	{
		Knows_Warhammer			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "KRIEGSHAMMER: Was aus einem glühenden Stück Eisen ein Schwertklinge formen kann, zermalmt auch den härtesten Gegner. Der große Bruder des Schmiedehammers muß allerdings beidhändig geführt werden, wiegt doch alleine der massive Hammerkopf mehr als ein ganzer Kochkessel. Die größte Genugtung bereitet aber immer noch das Zerbersten der Steingolems, die das Unglück haben, mit diesem Erdbeben von Waffe Bekanntschaft zu machen.");
		B_LogEntry		(GE_SmithWeapons, "VÁLEČNÉ KLADIVO: To, co dokáže ze žhnoucího železa vytvarovat čepel, rozdrtí i toho nejtvrdšího protivníka. Velký bratr kovářského kladiva však musí být používán oběma rukama, protože celá hlavice váží víc, než velký kotel na vaření. Největším uspokojením je roztříštění kamenných golemů, kteří mají tu smůlu, že se měli šanci seznámit s touto mohutnou zbraní.");
	};
};

func void B_LearnOrcHammer()
{
	if	!Knows_OrcHammer
	{
		Knows_OrcHammer			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNSMITH, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_SmithWeapons, LOG_NOTE);
//		B_LogEntry		(GE_SmithWeapons, "KRUSH KARROK: Bisher war nicht bekannt, daß Orks auch mit riesigen Hämmern kämpfen, doch scheint dies vor vielen Jahrhunderten tatsächlich der Fall gewesen zu sein. Diese Apokalypse von Waffe besteht aus einem mannsgroßen Eisenschaft, der von einem enorm wuchtigen und doch sehr scharfkantigen Hammerkopf gekrönt wird. Wo dieses Monstrum aufschlägt, wächst kein Gras mehr. Mit einer solchen Waffe werden die meisten gegnerischen Rüstungen reine Formsache.");
		B_LogEntry		(GE_SmithWeapons, "KRUSH KARROK: Dříve nebylo známo, že skřeti také používají válečná kladiva, ale zdá se, že tomu tak je už po mnohá staletí. Tato apokalyptická zbraň se skládá z ze železného topůrka délky dospělého člověka, které je korunováno těžkou, ale velice ostrou hlavou kladiva. Kde toto monstrum udeří, tam už tráva neroste. S takovouto zbraní nejsou nepřátelská brnění překážkou.");
	};
};

//---------------------------------------------------------------------------------------
// Abfrage von Waffenkategorien
//---------------------------------------------------------------------------------------
func int B_KnowsSword()
{
	if	Knows_Shortsword
	||	Knows_Longsword
	||	Knows_Broadsword
	||	Knows_Bastardsword
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_Knows2HSword()
{
	if	Knows_2HSword
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_KnowsAxe()
{
	if	Knows_Hatchet
	||	Knows_Battleaxe
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_Knows2HAxe()
{
	if	Knows_DoublebladedAxe
	||	Knows_BerserkAxe
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_KnowsBlunt()
{
	if	Knows_IronClub
	||	Knows_Mace
	||	Knows_Morningstar
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_Knows2HBlunt()
{
	if	Knows_Warhammer
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_Knows2HWeapon()
{
	if	Knows_2HSword
	||	Knows_DoublebladedAxe
	||	Knows_BerserkAxe
	||	Knows_Warhammer
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_KnowsOrcWeapon()
{
	if	Knows_OrcSword
	||	Knows_OrcAxe
	||	Knows_OrcHammer
	{
		return	TRUE;
	}
	else
	{
		return	FALSE;
	};
};

func int B_KnowsDemonWeapon()
{
	return	FALSE;
};




//#################################################################################
//#################################################################################
//
//	WISSEN - Kochrezepte
//
//#################################################################################
//#################################################################################
func void B_LearnRecipeMeatbug()
{
	if	!Knows_RecipeMeatbug
	{
		Knows_RecipeMeatbug 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNCOOK, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_CookingRecipies, LOG_NOTE);

		var string string_logEntry;
//		string_logEntry =	B_BuildCookRecipeString	("WANZEN-Rezepte: ", NAME_Meatbug);
		string_logEntry =	B_BuildCookRecipeString	("Recepty ze žravých štěnic:\n", NAME_Meatbug);
		B_LogEntry		(GE_CookingRecipies, string_logEntry);
	};
};

func void B_LearnRecipeMolerat ()
{
	if	!Knows_RecipeMolerat
	{
		Knows_RecipeMolerat 				= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNCOOK, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_CookingRecipies, LOG_NOTE);
		var string string_logEntry;
//		string_logEntry =	B_BuildCookRecipeString	("MOLERAT-Rezepte: ", NAME_MoleratGrease);
		string_logEntry =	B_BuildCookRecipeString	("Recepty z krysokrtího masa:\n", NAME_MoleratGrease);
		B_LogEntry		(GE_CookingRecipies, string_logEntry);
	};
};

func void B_LearnRecipeHerb()
{
	if	!Knows_RecipeHerb
	{
		Knows_RecipeHerb 				= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNCOOK, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_CookingRecipies, LOG_NOTE);
		var string string_logEntry;
//		string_logEntry =	B_BuildCookRecipeString	("SUMPFKRAUT-Rezepte: ", NAME_Swampweed);
		string_logEntry =	B_BuildCookRecipeString	("Recepty z trávy z bažin:\n", NAME_Swampweed);
		B_LogEntry		(GE_CookingRecipies, string_logEntry);
	};
};

func void B_LearnRecipeMushroom()
{
	if	!Knows_RecipeMushroom
	{
		Knows_RecipeMushroom 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNCOOK, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_CookingRecipies, LOG_NOTE);

		var string string_logEntry;
//		string_logEntry =	B_BuildCookRecipeString	("PILZ-Rezepte: ", Name_CaveMushroom);
		string_logEntry =	B_BuildCookRecipeString	("Recepty z hub:\n", Name_CaveMushroom);
		B_LogEntry		(GE_CookingRecipies, string_logEntry);
	};
};

func void B_LearnRecipeMeat()
{
	if	!Knows_RecipeMeat
	{
		Knows_RecipeMeat	 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNCOOK, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_CookingRecipies, LOG_NOTE);
		var string string_logEntry;
//		string_logEntry =	B_BuildCookRecipeString	("FLEISCH-Rezepte: ", NAME_Mutton);
		string_logEntry =	B_BuildCookRecipeString	("Recepty z masa:\n", NAME_Mutton);
		B_LogEntry		(GE_CookingRecipies, string_logEntry);
	};
};



//#################################################################################
//#################################################################################
//
//	WISSEN - Alchemierezepte
//
//#################################################################################
//#################################################################################
func void B_LearnRecipeHealingPotions()
{
	if	!Knows_HealingPotions
	{
		Knows_HealingPotions 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNALCHEMIE, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_AlchemieRecipies, LOG_NOTE);

		var string string_logEntry;
//		string_logEntry =	B_BuildAlchemieRecipeString	("Die Herstellung von HEILTRÄNKEN erfordert folgende Reagenzien: ", NAME_MountainMoss);
		string_logEntry =	B_BuildAlchemieRecipeString	("Příprava LÉČIVÝCH lektvarů vyžaduje následující ingredience: ", NAME_MountainMoss);
		B_LogEntry		(GE_AlchemieRecipies , string_logEntry);
	};
};

func void B_LearnRecipeManaPotions()
{
	if	!Knows_ManaPotions
	{
		Knows_ManaPotions 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNALCHEMIE, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_AlchemieRecipies, LOG_NOTE);

		var string string_logEntry;
//		string_logEntry =	B_BuildAlchemieRecipeString	("MANATRÄNKE benötigen für ihre Herstellung: ", NAME_StoneRoot);
		string_logEntry =	B_BuildAlchemieRecipeString	("Lektvary MANY vyžadují ke své přípravě: ", NAME_StoneRoot);
		B_LogEntry		(GE_AlchemieRecipies , string_logEntry);
	};
};

func void B_LearnRecipeSpeedPotions()
{
	if	!Knows_SpeedPotions
	{
		Knows_SpeedPotions 			= TRUE;

		PrintScreen		(_STR_MESSAGE_LEARNALCHEMIE, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

		Log_CreateTopic	(GE_AlchemieRecipies, LOG_NOTE);

		var string string_logEntry;
//		string_logEntry =	B_BuildAlchemieRecipeString	("Tränke der SCHNELLIGKEIT sind werden aus folgenden Reagenzien hergestellt: ", NAME_BloodThistle);
		string_logEntry =	B_BuildAlchemieRecipeString	("Lektvary RYCHLOSTI se připravuji z následujících přísad: ", NAME_BloodThistle);
		B_LogEntry		(GE_AlchemieRecipies , string_logEntry);
	};
};




//#################################################################################
//#################################################################################
//
//	WISSEN - Pflanzen
//
//#################################################################################
//#################################################################################
func int B_LearnWoodberry ()
{
	if	!Knows_Woodberry
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "WALDBEEREN mögen kein helles Licht. Sie wachsen bevorzugt unter kleineren Büschen, aber manchmal auch in dichterem Wald.");
		B_LogEntry		(GE_Plants , "BORŮVKY nemají rády jasné světlo. Nejradši rostou pod menšími keříky, ale někdy i v hustých lesích.");
	};
};

func int B_LearnFlameberry ()
{
	if	!Knows_Flameberry
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "FLAMMBEEREN sind eng mit den Waldbeeren verwandt, aber weitaus seltener. Auch sie wachsen im Dunkel von kleineren Büschen und im Wald. Häufig findet man Flammbeeren einzeln in einer grösseren Gruppe von Waldbeeren.");
		B_LogEntry		(GE_Plants , "OHNIVÉ TRNY jsou příbuzné borůvkám, ale vyskytují se méně často. Také ony rostou ve stínu menších keřů a v lesích. Ohnivé trny se většinou vyskytují jednotlivé mezi velkými skupinami borůvek.");
	};
};

func int B_LearnTrollberry ()
{
	if	!Knows_Trollberry
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "TROLLKIRSCHEN sind eine extrem seltene Unterart der Waldbeeren. Sie scheinen im Gegensatz zu ihren Verwandten äusserst giftig zu sein und wachsen ausschliesslich in Trollhorten.");
		B_LogEntry		(GE_Plants , "TROLLÍ BOBULE jsou extrémně vzácný poddruh borůvek. Na rozdíl od jejich příbuzných jsou trollí bobule velice jedovaté a rostou pouze v trollím trusu.");
	};
};

func int B_LearnCaveMushroom ()
{
	if	!Knows_CaveMushroom
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "HÖHLENPILZE brauchen die feuchte Dunkelheit. In alten muffigen Kellern und Verliessen aber auch in vielen natürlichen Höhlen stolpert man oft über ganze Teppiche dieser Pflanzen.");
        // # tady jsem místo koberce použil trsy, zní mi to lépe
		B_LogEntry		(GE_Plants , "PEKELNÉ HOUBY potřebují vlhko a tmu. Na celé trsy těchto hub je možné narazit ve vlhkých kobkách a sklepeních, ale také v mnoha přírodních jeskyních.");
	};
};

func int B_LearnMountainMoss ()
{
	if	!Knows_MountainMoss
	{
		// gelehrt von HLR_501_Talamon
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "BERGMOOS mag die dünne Luft hoch in den Bergen oder Felsen. Oft muss ein Fundort mühevoll erklettert werden.");
		B_LogEntry		(GE_Plants , "HORSKÝ MECH má rád řídký horský vzduch. Roste vysoko ve skalách a na horách. Často se do těchto míst musí vyšplhat.");
	};
};

func int B_LearnStoneroot ()
{
	if	!Knows_Stoneroot
	{
		// gelehrt von HLR_501_Talamon
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "Die STEINWURZEL bevorzugt erdige Böden, man findet sie am Waldrand und  auf erdigen Feldern. Oft wachsen sie dort auf kleinen Felsfindlingen.");
		B_LogEntry		(GE_Plants , "KAMENNÝ KOŘEN preferuje pro svůj růst kamenitou půdu, je možné jej najít na okrajích lesa a na kamenitých polích. Často rostou u velkých balvanů.");
	};
};

func int B_LearnBloodThistle ()
{
	if	!Knows_BloodThistle
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "Die BLUTDISTEL mag das Ufer von Seen und Flüssen. Sie wächst häufig in ganzen Gruppen und ist oft in der Nähe von grossen Schilfpflanzen zu finden.");
		B_LogEntry		(GE_Plants , "KRVAVÝ BODLÁK má rád břehy jezer a řek. Roste v početných skupinách, často v blízkosti rákosí.");
	};
};

func int B_LearnOrcLeaf ()
{
	if	!Knows_OrcLeaf
	{
		// gelehrt von HLR_501_Talamon
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "ORKBLATT wächss bevorzugt auf niedrigen Felsvorsprüngen, oder direkt am Fusse von Felsen und Bergen.");
		B_LogEntry		(GE_Plants , "SKŘETÍ LIST dává přednost růstu na nízkých skalních římsách nebo přímo na úpatí hor a skalních stěn.");
	};
};

func int B_LearnRavenHerb ()
{
	if	!Knows_RavenHerb
	{
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "RABENKRAUT mag die Nachbarschaft zum Wasser, sei es Meer oder ein Binnengewässer.");
		B_LogEntry		(GE_Plants , "HAVRANÍ BYLINY rády rostou poblíž vodních ploch, ať už se jedná o moře nebo o sladkovodní jezera.");
	};
};

func int B_LearnNightshade ()
{
	if	!Knows_Nightshade
	{
		// gelehrt von HLR_501_Talamon
		PrintScreen		(_STR_MESSAGE_LEARNPLANTS, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic	(GE_Plants, LOG_NOTE);
//		B_LogEntry		(GE_Plants , "NACHTSCHATTEN sucht, wie der Name schon andeutet, die Dunkelheit. Er sollte in Höhlen und Räumen oder den finstersten Ecken des Waldes zu finden sein.");
		B_LogEntry		(GE_Plants , "POTMĚCHUŤ vyhledává, jak už název napovídá, tmu. Měl by být k nalezení v jeskyních a sklepeních nebo v nejtemnějších zákoutích lesů.");
	};
};



//#################################################################################
//#################################################################################
//
//	WISSEN - Fernkampfwaffen
//
//#################################################################################
//#################################################################################
func void B_LearnRecipeBow()
{
	Knows_RecipeBow 			= TRUE;

	PrintScreen		(_STR_MESSAGE_LEARNBOW, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

	Log_CreateTopic	(GE_BowMaker, LOG_NOTE);
	var string 		string_ConcatBow;
	var string		string_Amnt;
	string_Amnt		=	IntToString	(Amnt_ShortBow);
//	string_ConcatBow	= ConcatStrings	("Kurzbögen jeder Bauart sind vom Bauplan her bekannt. Für den Kurzbogen werden ", string_Amnt);
	string_ConcatBow	= ConcatStrings	("Krátké luky všeho druhu jsou známe z nákresů. Na výrobu KRÁTKÉHO LUKU je potřeba ", string_Amnt);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Holz benötigt. ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_RiderBow);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Für den Reiterbogen werden ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, "\nVýrobu JEZDECKÉHO LUKU spotřebuje ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, string_Amnt);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Holz benötigt. ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_FieldBow);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Für den Feldbogen werden ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, "\nNa výrobu POLNÍHO LUKU je potřeba ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, string_Amnt);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Holz benötigt. ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_HuntingBow);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Für den Jagdbogen werden ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, "\nPři výrobě LOVECKÉHO LUKU potřebuji ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, string_Amnt);
//	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " Holz benötigt. ");
	string_ConcatBow	= ConcatStrings	(string_ConcatBow, " kusů dřeva. ");

	B_LogEntry		(GE_BowMaker, string_ConcatBow);
};

func void B_LearnRecipeLongBow()
{
	Knows_RecipeLongBow 			= TRUE;

	PrintScreen		(_STR_MESSAGE_LEARNBOW, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);

	Log_CreateTopic	(GE_BowMaker, LOG_NOTE);
	var string 		string_ConcatLongBow;
	var string		string_Amnt;
	string_Amnt				=	IntToString	(Amnt_LongBow);
//	string_ConcatLongBow	= ConcatStrings	("Langbögen jeder Bauart sind vom Bauplan her bekannt. Für den Langbogen werden ", string_Amnt);
	string_ConcatLongBow	= ConcatStrings	("Dlouhé luky všeho druhu jsou známe z nákresů.\nNa výrobu DLOUHÉHO LUKU spotřebuji ", string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	string_Amnt				=	IntToString	(Amnt_HedgeBow);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Für den Heckenbogen werden ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, "\nNa výrobu DŘEVĚNÉHO LUKU je potřeba ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	string_Amnt				=	IntToString	(Amnt_WillowBow);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Für den Weidenbogen werden ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, "\nVýroba JEZDECKÉHO LUKU spotřebuje ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	string_Amnt				=	IntToString	(Amnt_ArmyBow);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Für den Armeebogen werden ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, "\nNa výrobu ARMÁDNÍHO LUKU je potřeba ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	string_Amnt				=	IntToString	(Amnt_WarBow);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow," Für den Kriegsbogen werden ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow,"\nPři výrobě VÁLEČNÉHO LUKU musím zpracovat ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	string_Amnt				=	IntToString	(Amnt_StormBow);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow," Für den Sturmbogen werden ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow,"\nNa výrobu ÚTOČNÉHO LUKU je potřeba ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, string_Amnt);
//	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " Holz benötigt. ");
	string_ConcatLongBow	= ConcatStrings	(string_ConcatLongBow, " kusů dřeva. ");

	B_LogEntry		(GE_BowMaker, string_ConcatLongBow);

};

func void B_LearnRecipeCrossBow()
{
	Knows_RecipeCrossBow 			= TRUE;

	PrintScreen		(_STR_MESSAGE_LEARNBOW, -1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);


	Log_CreateTopic	(GE_BowMaker, LOG_NOTE);
	var string 		string_Concat;
	var string		string_Amnt;
	string_Amnt		=	IntToString	(Amnt_LightCrossBow);
//	string_Concat	= ConcatStrings	("Armbrüste jeder Bauart sind vom Bauplan her bekannt. Für die leichte Armbrust werden ", string_Amnt);
	string_Concat	= ConcatStrings	("Kuše všeho druhu jsou známe z nákresů.\nNa výrobu LEHKÉ KUŠE spotřebuji ", string_Amnt);
//	string_Concat	= ConcatStrings	(string_Concat, " Holz benötigt. ");
	string_Concat	= ConcatStrings	(string_Concat, "  kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_CrossBow);
//	string_Concat	= ConcatStrings	(string_Concat, " Für die Armbrust werden ");
	string_Concat	= ConcatStrings	(string_Concat, "\nVýrobou KUŠE spotřebuji ");
	string_Concat	= ConcatStrings	(string_Concat, string_Amnt);
//	string_Concat	= ConcatStrings	(string_Concat, " Holz benötigt. ");
	string_Concat	= ConcatStrings	(string_Concat, "  kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_HeavyCrossBow);
//	string_Concat	= ConcatStrings	(string_Concat, " Für die schwere Armbrust werden ");
	string_Concat	= ConcatStrings	(string_Concat, "\nNa výrobu TĚŽKÉ KUŠE potřebuji ");
	string_Concat	= ConcatStrings	(string_Concat, string_Amnt);
//	string_Concat	= ConcatStrings	(string_Concat, " Holz benötigt. ");
	string_Concat	= ConcatStrings	(string_Concat, "  kusů dřeva. ");

	string_Amnt		=	IntToString	(Amnt_WarCrossBow);
//	string_Concat	= ConcatStrings	(string_Concat, " Für die Kriegsarmbrust werden ");
	string_Concat	= ConcatStrings	(string_Concat, "\nVÁLEČNOU KUŠI vyrobím z ");
	string_Concat	= ConcatStrings	(string_Concat, string_Amnt);
//	string_Concat	= ConcatStrings	(string_Concat, " Holz benötigt. ");
	string_Concat	= ConcatStrings	(string_Concat, "  kusů dřeva. ");

	B_LogEntry		(GE_BowMaker, string_Concat);

};