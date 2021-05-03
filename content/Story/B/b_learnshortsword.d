
var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;
var int knows_shortsword;
var int knows_longsword;
var int knows_broadsword;
var int knows_bastardsword;
var int knows_2hsword;
var int knows_orcsword;
var int knows_hatchet;
var int knows_battleaxe;
var int knows_doublebladedaxe;
var int knows_berserkaxe;
var int knows_orcaxe;
var int knows_ironclub;
var int knows_mace;
var int knows_morningstar;
var int knows_warhammer;
var int knows_orchammer;
var int knows_recipemeatbug;
var int knows_recipemolerat;
var int knows_recipeherb;
var int knows_recipemushroom;
var int knows_recipemeat;
var int knows_manapotions;
var int knows_healingpotions;
var int knows_speedpotions;
var int knows_dexteritypotions;
var int knows_strengthpotions;
var int knows_hpmaxpotions;
var int knows_manamaxpotions;
var int knows_recipebow;
var int knows_recipelongbow;
var int knows_recipecrossbow;
var int knows_mountainmoss;
var int knows_stoneroot;
var int knows_bloodthistle;
var int knows_orcleaf;
var int knows_ravenherb;
var int knows_nightshade;
var int knows_cavemushroom;
var int knows_woodberry;
var int knows_flameberry;
var int knows_trollberry;

func void b_learnshortsword()
{
	if(!KNOWS_SHORTSWORD)
	{
		KNOWS_SHORTSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"KURZSCHWERT: Eine kurze Klinge eine Elle lang und doppelschneidig. Die Parierstange ist kurz und rundlich. Die Waffe selbst ist bei Dieben und Mördern sehr beliebt, da sie leicht zu verbergen ist und auch im dichtesten Handgemenge nicht behindert.");
	};
};

func void b_learnlongsword()
{
	if(!KNOWS_LONGSWORD)
	{
		KNOWS_LONGSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"LANGSCHWERT: Die ideale Waffe für die Verteidigung des Heims ebenso wie für den fahrenden Wanderer. Die drei Fuß messende, doppelschneidige Klinge wird mit einem Quereisen als Parierstange sowie einem Lederumwickelten Griff abgesetzt. Mit wenig Kraft zu schwingen, kann diese Waffe doch heftige Wunden in Mensch wie Tier reissen.");
	};
};

func void b_learnbroadsword()
{
	if(!KNOWS_BROADSWORD)
	{
		KNOWS_BROADSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"BREITSCHWERT: Drei Fuß messender Stahl, dessen gewaltige Wucht von der breiten doppelschneidigen Klinge herrührt. Dies ist die Waffe von Kriegern und Söldnern und nichts für Anfänger. Die ein Fuß messende Parierstange kann auch die stärksten Attacken abwehren und der Griff aus kreuzweise umwundenen Draht gibt der Hand, die diese schwere Waffe in den Kampf führt, optimalen Halt.");
	};
};

func void b_learnbastardsword()
{
	if(!KNOWS_BASTARDSWORD)
	{
		KNOWS_BASTARDSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"BASTARDSCHWERT: Wer diese vier Fuß lange, gewaltige Klinge einhändig in den Kampf führen kann, gehört zur Elite unter den Schwertkämpfern. Die Verbindung von Klinge, Parierstange und Griff muß besonders robust ausgeführt werden, um die Wucht der Schläge auch dauerhaft unbeschadet zu überstehen.");
	};
};

func void b_learn2hsword()
{
	if(!KNOWS_2HSWORD)
	{
		KNOWS_2HSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"ZWEIHÄNDER: Dies ist die Köngisklasse unter den Schwertern. die fast fünf Fuß messende, zweischneidige Klinge muß auch von den stärksten Kriegern beidhändig geführt werden. Trifft sie dann aber ihr Ziel, so läßt sie meist nur den Tod zurück. Während das obere Ende der Klinge mit herausgeschliffenen Wellen versehen ist, um mehr Schaden anzurichten, so wurde das  Ende vor der Parierstange mit wehrhaften Stacheln versehen, um auch im Handgemenge den Gegner verletzen zu können.");
	};
};

func void b_learnorcsword()
{
	if(!KNOWS_ORCSWORD)
	{
		KNOWS_ORCSWORD = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"KRUSH VARROK: Diese Orkwaffe ein Schwert zu nennen wäre Ketzerei. Es ist ein Vernichter. Diese fünf Fuß lange, axtförmig gebogene Schwertklinge, wird an einer Griffstange geführt, die hinter der Schneide auf fast der gesamten Waffenlänge verläuft. Dieses Schwert muß aus dem seltenen Bluterz gefertig werden und ist zwar die leichteste Orkwaffe, aber dennoch tödlicher, als jede von Menschen hergestellte Klinge.");
	};
};

func void b_learnhatchet()
{
	if(!KNOWS_HATCHET)
	{
		KNOWS_HATCHET = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"BEIL: Ein kleines Axtblatt und ein anderthalb Fuß messender Schaft bilden das ideale Werkzeug des Waldläufers. Ob Brennholz geschlagen oder die kleineren Raubtiere des Waldes abgewehrt werden sollen, das Beil ist ein zuverlässiger Begleiter.");
	};
};

func void b_learnbattleaxe()
{
	if(!KNOWS_BATTLEAXE)
	{
		KNOWS_BATTLEAXE = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"STREITAXT: Die Waffe für den ungestümen Krieger. Das wuchtige Axtblatt kann von starken Kämpfern noch einhändig geführt werden und so sowohl Mensch wie auch Tier schmerzhafte Wunden zufügen.");
	};
};

func void b_learndoublebladedaxe()
{
	if(!KNOWS_DOUBLEBLADEDAXE)
	{
		KNOWS_DOUBLEBLADEDAXE = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"DOPPELBLATT-AXT: Der zwei Fuß durchmessende, zweischneidige  Axtkopf sitzt auf einem mit Metallringen verstärktem extralangen Schaft der es erlaubt, diese verherende Waffe mit beiden Händen zu führen. Falls der Kämpfer über ausreichend Kraft verfügt, so kann er mit diesem Werkzeug der Zerstörung nicht nur Bäume fällen... .");
	};
};

func void b_learnberserkaxe()
{
	if(!KNOWS_BERSERKAXE)
	{
		KNOWS_BERSERKAXE = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"BERSERKERAXT: Noch größer und wuchtiger als die Doppelblättrige Axt ist diese Waffe schon kaum mehr als Axt zu bezeichnen. Ein einzelner Krieger kann mit diesem Monster aus Stahl Breschen in ganze Infantrieformationen schlagen. Sollte bei keinem Feldzug fehlen!");
	};
};

func void b_learnorcaxe()
{
	if(!KNOWS_ORCAXE)
	{
		KNOWS_ORCAXE = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"KRUSH BROKDAR: Endlich ist klar, wie die Orks ihre menschlichen Wiedersacher in derart vernichtenden Schlachten immer wieder in die Flucht schlagen konnten. Nur aus dem seltenen Bluterz herzustellen ist diese orkische Axt der Gipfel der Vernichtung. Sie kann nur von den allerstärksten Menschen geführt werden kann, mäht aber Gegner nieder wie die Sense das Gras. Eine hässliche Waffe, die hässliche Wunden schlägt.");
	};
};

func void b_learnironclub()
{
	if(!KNOWS_IRONCLUB)
	{
		KNOWS_IRONCLUB = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"EISENKEULE: Ein eiserner Schaft, der an seinem Ende etwas verdickt ist, um mehr Wucht hinter den Schlag zu setzen. Diese metallene Variante des Holzknüppels ist die ideale Ergänzung für eine Kneipenschlägerei und das blose Tragen eines solchen Gegenstandes vermeidet oft unangenehme nächtliche Begegnungen.");
	};
};

func void b_learnmace()
{
	if(!KNOWS_MACE)
	{
		KNOWS_MACE = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"STREITKOLBEN: Auf einem metallenen Waffenstumpf sitzt ein etwa kindskopfgroßes Gebilde aus pilzartig angeordneten Eisenlamellen. Diese wehrhafte Waffe ist schnell und besitzt doch ausreichend Wucht, um auch schwere Rüstungen ordentlich zu verbeulen. Sehr beliebt bei religiösen Fanatikern und als Zweitwaffe auch bei königlichen Paladinen stark im Kommen.");
	};
};

func void b_learnmorningstar()
{
	if(!KNOWS_MORNINGSTAR)
	{
		KNOWS_MORNINGSTAR = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"MORGENSTERN: Dies ist die unhöfliche Variante des Streitkolbens. Ein massiver, mit hässlichen Dornen gespickter Eisenkopf sitzt auf einem verstärkten Schaft. Diese Waffe ist nicht nur bei Rittern weithin gefürchtet, sondern kann auch gut geschützte Monsterpanzer mit Leichtigkeit knacken.");
	};
};

func void b_learnwarhammer()
{
	if(!KNOWS_WARHAMMER)
	{
		KNOWS_WARHAMMER = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"KRIEGSHAMMER: Was aus einem glühenden Stück Eisen ein Schwertklinge formen kann, zermalmt auch den härtesten Gegner. Der große Bruder des Schmiedehammers muß allerdings beidhändig geführt werden, wiegt doch alleine der massive Hammerkopf mehr als ein ganzer Kochkessel. Die größte Genugtung bereitet aber immer noch das Zerbersten der Steingolems, die das Unglück haben, mit diesem Erdbeben von Waffe Bekanntschaft zu machen.");
	};
};

func void b_learnorchammer()
{
	if(!KNOWS_ORCHAMMER)
	{
		KNOWS_ORCHAMMER = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNSMITH,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_SMITHWEAPONS,LOG_NOTE);
		B_LogEntry(GE_SMITHWEAPONS,"KRUSH KARROK: Bisher war nicht bekannt, daß Orks auch mit riesigen Hämmern kämpfen, doch scheint dies vor vielen Jahrhunderten tatsächlich der Fall gewesen zu sein. Diese Apokalypse von Waffe besteht aus einem mannsgroßen Eisenschaft, der von einem enorm wuchtigen und doch sehr scharfkantigen Hammerkopf gekrönt wird. Wo dieses Monstrum aufschlägt, wächst kein Gras mehr. Mit einer solchen Waffe werden die meisten gegnerischen Rüstungen reine Formsache.");
	};
};

func int b_knowssword()
{
	if(KNOWS_SHORTSWORD || KNOWS_LONGSWORD || KNOWS_BROADSWORD || KNOWS_BASTARDSWORD)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knows2hsword()
{
	if(KNOWS_2HSWORD)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knowsaxe()
{
	if(KNOWS_HATCHET || KNOWS_BATTLEAXE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knows2haxe()
{
	if(KNOWS_DOUBLEBLADEDAXE || KNOWS_BERSERKAXE)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knowsblunt()
{
	if(KNOWS_IRONCLUB || KNOWS_MACE || KNOWS_MORNINGSTAR)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knows2hblunt()
{
	if(KNOWS_WARHAMMER)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knows2hweapon()
{
	if(KNOWS_2HSWORD || KNOWS_DOUBLEBLADEDAXE || KNOWS_BERSERKAXE || KNOWS_WARHAMMER)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knowsorcweapon()
{
	if(KNOWS_ORCSWORD || KNOWS_ORCAXE || KNOWS_ORCHAMMER)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int b_knowsdemonweapon()
{
	return FALSE;
};

func void b_learnrecipemeatbug()
{
	var string string_logentry;
	if(!KNOWS_RECIPEMEATBUG)
	{
		KNOWS_RECIPEMEATBUG = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNCOOK,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_COOKINGRECIPIES,LOG_NOTE);
		string_logentry = b_buildcookrecipestring("WANZEN-Rezepte: ",NAME_MEATBUG);
		B_LogEntry(GE_COOKINGRECIPIES,string_logentry);
	};
};

func void b_learnrecipemolerat()
{
	var string string_logentry;
	if(!KNOWS_RECIPEMOLERAT)
	{
		KNOWS_RECIPEMOLERAT = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNCOOK,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_COOKINGRECIPIES,LOG_NOTE);
		string_logentry = b_buildcookrecipestring("MOLERAT-Rezepte: ",NAME_MOLERATGREASE);
		B_LogEntry(GE_COOKINGRECIPIES,string_logentry);
	};
};

func void b_learnrecipeherb()
{
	var string string_logentry;
	if(!KNOWS_RECIPEHERB)
	{
		KNOWS_RECIPEHERB = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNCOOK,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_COOKINGRECIPIES,LOG_NOTE);
		string_logentry = b_buildcookrecipestring("SUMPFKRAUT-Rezepte: ",NAME_SWAMPWEED);
		B_LogEntry(GE_COOKINGRECIPIES,string_logentry);
	};
};

func void b_learnrecipemushroom()
{
	var string string_logentry;
	if(!KNOWS_RECIPEMUSHROOM)
	{
		KNOWS_RECIPEMUSHROOM = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNCOOK,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_COOKINGRECIPIES,LOG_NOTE);
		string_logentry = b_buildcookrecipestring("PILZ-Rezepte: ",NAME_CAVEMUSHROOM);
		B_LogEntry(GE_COOKINGRECIPIES,string_logentry);
	};
};

func void b_learnrecipemeat()
{
	var string string_logentry;
	if(!KNOWS_RECIPEMEAT)
	{
		KNOWS_RECIPEMEAT = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNCOOK,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_COOKINGRECIPIES,LOG_NOTE);
		string_logentry = b_buildcookrecipestring("FLEISCH-Rezepte: ",NAME_MUTTON);
		B_LogEntry(GE_COOKINGRECIPIES,string_logentry);
	};
};

func void b_learnrecipehealingpotions()
{
	var string string_logentry;
	if(!KNOWS_HEALINGPOTIONS)
	{
		KNOWS_HEALINGPOTIONS = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNALCHEMIE,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_ALCHEMIERECIPIES,LOG_NOTE);
		string_logentry = b_buildalchemierecipestring("Die Herstellung von HEILTRÄNKEN erfordert folgende Reagenzien: ",NAME_MOUNTAINMOSS);
		B_LogEntry(GE_ALCHEMIERECIPIES,string_logentry);
	};
};

func void b_learnrecipemanapotions()
{
	var string string_logentry;
	if(!KNOWS_MANAPOTIONS)
	{
		KNOWS_MANAPOTIONS = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNALCHEMIE,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_ALCHEMIERECIPIES,LOG_NOTE);
		string_logentry = b_buildalchemierecipestring("MANATRÄNKE benötigen für ihre Herstellung: ",NAME_STONEROOT);
		B_LogEntry(GE_ALCHEMIERECIPIES,string_logentry);
	};
};

func void b_learnrecipespeedpotions()
{
	var string string_logentry;
	if(!KNOWS_SPEEDPOTIONS)
	{
		KNOWS_SPEEDPOTIONS = TRUE;
		PrintScreen(_STR_MESSAGE_LEARNALCHEMIE,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_ALCHEMIERECIPIES,LOG_NOTE);
		string_logentry = b_buildalchemierecipestring("Tränke der SCHNELLIGKEIT sind werden aus folgenden Reagenzien hergestellt: ",NAME_BLOODTHISTLE);
		B_LogEntry(GE_ALCHEMIERECIPIES,string_logentry);
	};
};

func int b_learnwoodberry()
{
	if(!KNOWS_WOODBERRY)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"WALDBEEREN mögen kein helles Licht. Sie wachsen bevorzugt unter kleineren Büschen, aber manchmal auch in dichterem Wald.");
	};
};

func int b_learnflameberry()
{
	if(!KNOWS_FLAMEBERRY)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"FLAMMBEEREN sind eng mit den Waldbeeren verwandt, aber weitaus seltener. Auch sie wachsen im Dunkel von kleineren Büschen und im Wald. Häufig findet man Flammbeeren einzeln in einer grösseren Gruppe von Waldbeeren.");
	};
};

func int b_learntrollberry()
{
	if(!KNOWS_TROLLBERRY)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"TROLLKIRSCHEN sind eine extrem seltene Unterart der Waldbeeren. Sie scheinen im Gegensatz zu ihren Verwandten äusserst giftig zu sein und wachsen ausschliesslich in Trollhorten.");
	};
};

func int b_learncavemushroom()
{
	if(!KNOWS_CAVEMUSHROOM)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"HÖHLENPILZE brauchen die feuchte Dunkelheit. In alten muffigen Kellern und Verliessen aber auch in vielen natürlichen Höhlen stolpert man oft über ganze Teppiche dieser Pflanzen.");
	};
};

func int b_learnmountainmoss()
{
	if(!KNOWS_MOUNTAINMOSS)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"BERGMOOS mag die dünne Luft hoch in den Bergen oder Felsen. Oft muss ein Fundort mühevoll erklettert werden.");
	};
};

func int b_learnstoneroot()
{
	if(!KNOWS_STONEROOT)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"Die STEINWURZEL bevorzugt erdige Böden, man findet sie am Waldrand und  auf erdigen Feldern. Oft wachsen sie dort auf kleinen Felsfindlingen.");
	};
};

func int b_learnbloodthistle()
{
	if(!KNOWS_BLOODTHISTLE)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"Die BLUTDISTEL mag das Ufer von Seen und Flüssen. Sie wächst häufig in ganzen Gruppen und ist oft in der Nähe von grossen Schilfpflanzen zu finden.");
	};
};

func int b_learnorcleaf()
{
	if(!KNOWS_ORCLEAF)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"ORKBLATT wächss bevorzugt auf niedrigen Felsvorsprüngen, oder direkt am Fusse von Felsen und Bergen.");
	};
};

func int b_learnravenherb()
{
	if(!KNOWS_RAVENHERB)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"RABENKRAUT mag die Nachbarschaft zum Wasser, sei es Meer oder ein Binnengewässer.");
	};
};

func int b_learnnightshade()
{
	if(!KNOWS_NIGHTSHADE)
	{
		PrintScreen(_STR_MESSAGE_LEARNPLANTS,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
		Log_CreateTopic(GE_PLANTS,LOG_NOTE);
		B_LogEntry(GE_PLANTS,"NACHTSCHATTEN sucht, wie der Name schon andeutet, die Dunkelheit. Er sollte in Höhlen und Räumen oder den finstersten Ecken des Waldes zu finden sein.");
	};
};

func void b_learnrecipebow()
{
	var string string_concatbow;
	var string string_amnt;
	KNOWS_RECIPEBOW = TRUE;
	PrintScreen(_STR_MESSAGE_LEARNBOW,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
	Log_CreateTopic(GE_BOWMAKER,LOG_NOTE);
	string_amnt = IntToString(AMNT_SHORTBOW);
	string_concatbow = ConcatStrings("Kurzbögen jeder Bauart sind vom Bauplan her bekannt. Für den Kurzbogen werden ",string_amnt);
	string_concatbow = ConcatStrings(string_concatbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_RIDERBOW);
	string_concatbow = ConcatStrings(string_concatbow," Für den Reiterbogen werden ");
	string_concatbow = ConcatStrings(string_concatbow,string_amnt);
	string_concatbow = ConcatStrings(string_concatbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_FIELDBOW);
	string_concatbow = ConcatStrings(string_concatbow," Für den Feldbogen werden ");
	string_concatbow = ConcatStrings(string_concatbow,string_amnt);
	string_concatbow = ConcatStrings(string_concatbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_HUNTINGBOW);
	string_concatbow = ConcatStrings(string_concatbow," Für den Jagdbogen werden ");
	string_concatbow = ConcatStrings(string_concatbow,string_amnt);
	string_concatbow = ConcatStrings(string_concatbow," Holz benötigt. ");
	B_LogEntry(GE_BOWMAKER,string_concatbow);
};

func void b_learnrecipelongbow()
{
	var string string_concatlongbow;
	var string string_amnt;
	KNOWS_RECIPELONGBOW = TRUE;
	PrintScreen(_STR_MESSAGE_LEARNBOW,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
	Log_CreateTopic(GE_BOWMAKER,LOG_NOTE);
	string_amnt = IntToString(AMNT_LONGBOW);
	string_concatlongbow = ConcatStrings("Langbögen jeder Bauart sind vom Bauplan her bekannt. Für den Langbogen werden ",string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_HEDGEBOW);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Für den Heckenbogen werden ");
	string_concatlongbow = ConcatStrings(string_concatlongbow,string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_WILLOWBOW);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Für den Weidenbogen werden ");
	string_concatlongbow = ConcatStrings(string_concatlongbow,string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_ARMYBOW);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Für den Armeebogen werden ");
	string_concatlongbow = ConcatStrings(string_concatlongbow,string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_WARBOW);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Für den Kriegsbogen werden ");
	string_concatlongbow = ConcatStrings(string_concatlongbow,string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	string_amnt = IntToString(AMNT_STORMBOW);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Für den Sturmbogen werden ");
	string_concatlongbow = ConcatStrings(string_concatlongbow,string_amnt);
	string_concatlongbow = ConcatStrings(string_concatlongbow," Holz benötigt. ");
	B_LogEntry(GE_BOWMAKER,string_concatlongbow);
};

func void b_learnrecipecrossbow()
{
	var string string_concat;
	var string string_amnt;
	KNOWS_RECIPECROSSBOW = TRUE;
	PrintScreen(_STR_MESSAGE_LEARNBOW,-1,_YPOS_MESSAGE_LEARN,FONT_OLD_BIG,_TIME_MESSAGE_LEARN);
	Log_CreateTopic(GE_BOWMAKER,LOG_NOTE);
	string_amnt = IntToString(AMNT_LIGHTCROSSBOW);
	string_concat = ConcatStrings("Armbrüste jeder Bauart sind vom Bauplan her bekannt. Für die leichte Armbrust werden ",string_amnt);
	string_concat = ConcatStrings(string_concat," Holz benötigt. ");
	string_amnt = IntToString(AMNT_CROSSBOW);
	string_concat = ConcatStrings(string_concat," Für die Armbrust werden ");
	string_concat = ConcatStrings(string_concat,string_amnt);
	string_concat = ConcatStrings(string_concat," Holz benötigt. ");
	string_amnt = IntToString(AMNT_HEAVYCROSSBOW);
	string_concat = ConcatStrings(string_concat," Für die schwere Armbrust werden ");
	string_concat = ConcatStrings(string_concat,string_amnt);
	string_concat = ConcatStrings(string_concat," Holz benötigt. ");
	string_amnt = IntToString(AMNT_WARCROSSBOW);
	string_concat = ConcatStrings(string_concat," Für die Kriegsarmbrust werden ");
	string_concat = ConcatStrings(string_concat,string_amnt);
	string_concat = ConcatStrings(string_concat," Holz benötigt. ");
	B_LogEntry(GE_BOWMAKER,string_concat);
};

