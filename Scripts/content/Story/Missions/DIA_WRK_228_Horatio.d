///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_228_Horatio_EXIT   (C_INFO)
{
	npc         = WRK_228_Horatio;
	nr          = 999;
	condition   = WRK_228_Horatio_EXIT_Condition;
	information = WRK_228_Horatio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_228_Horatio_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_228_Horatio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HELLO
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_HELLO		(C_INFO)
{
	npc		 = 	WRK_228_Horatio;
	condition	 = 	WRK_228_Horatio_HELLO_Condition;
	information	 = 	WRK_228_Horatio_HELLO_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int WRK_228_Horatio_HELLO_Condition ()
{
	if	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void WRK_228_Horatio_HELLO_Info ()
{
//	AI_Output			(self, hero, "WRK_228_HELLO_09_01"); //Ich glaube meine müden Augen lassen mich im Stich, bist du es wirklich?
	AI_Output			(self, hero, "WRK_228_HELLO_09_01"); //Mě snad klamou moje unavené oči, jsi to skutečně ty?
//	AI_Output			(hero, self, "WRK_228_HELLO_15_02"); //Wie geht es diesem Reislord und seinem Handlanger Lefty?
	AI_Output			(hero, self, "WRK_228_HELLO_15_02"); //Jak se daří tomu Rýžovému lordovi a jeho přisluhovači Leftymu?
//	AI_Output			(self, hero, "WRK_228_HELLO_09_03"); //Keine Ahnung, aber du hast ihnen ja damals gezeigt, wo der Hammer hängt.
	AI_Output			(self, hero, "WRK_228_HELLO_09_03"); //Nemám tušení, ale ty už jsi jim tehdy ukázal, kde je jejich místo.
//	AI_Output			(self, hero, "WRK_228_HELLO_09_04"); //Seit dem Zusammenbruch der Barriere habe ich sie allerdings beide nicht mehr gesehen.
	AI_Output			(self, hero, "WRK_228_HELLO_09_04"); //Od zhroucení Bariéry jsem už ani jednoho z nich neviděl.
};

///////////////////////////////////////////////////////////////////////
//	Info NEWCAMP
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_NEWCAMP		(C_INFO)
{
	npc		 = 	WRK_228_Horatio;
	condition	 = 	WRK_228_Horatio_NEWCAMP_Condition;
	information	 = 	WRK_228_Horatio_NEWCAMP_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum bist du nicht mehr im Neuen Lager?";
	description	 = 	"Proč už nejsi v Novém táboře?";
};

func int WRK_228_Horatio_NEWCAMP_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_228_Horatio_HELLO)
	{
		return TRUE;
	};
};

func void WRK_228_Horatio_NEWCAMP_Info ()
{
//	AI_Output			(hero, self, "WRK_228_NEWCAMP_15_01"); //Warum bist du nicht mehr im Neuen Lager?
	AI_Output			(hero, self, "WRK_228_NEWCAMP_15_01"); //Proč nuž nejsi v Novém táboře?
//	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_02"); //Der Zusammenbruch der Barriere wurde von schwersten Beben begleitet.
	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_02"); //Pád Bariéry s sebou přinesl i jedno z nejtěžších zemětřesení.
//	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_03"); //Banditen und Söldner verfielen in Panik und rannten entweder planlos umher oder gingen sich gegenseitig an die Gurgel.
	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_03"); //Bandité i žoldáci zpanikařili a rozutíkali se zmateně všemi směry a skákali si navzájem po krku.
//	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_04"); //Nur sehr wenige entkamen diesem Hexenkessel an jenem Tag. Ich war einer davon!
	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_04"); //Jen velmi málo jich prošlo tím neskutečným virválem toho dne. Já byl jedním z nich!
//	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_05"); //Hier fand ich, wie andere auch, einen einigermassen sicheren Zufluchtsort.
	AI_Output			(self, hero, "WRK_228_NEWCAMP_09_05"); //Tady jsem našel, jako i ostatní, poněkud zajištěné útočiště.
};


///////////////////////////////////////////////////////////////////////
//	Info WATERMAGES
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_WATERMAGES		(C_INFO)
{
	npc		 	 = 	WRK_228_Horatio;
	condition	 = 	WRK_228_Horatio_WATERMAGES_Condition;
	information	 = 	WRK_228_Horatio_WATERMAGES_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie ist es den Wassermagiern ergangen?";
	description	 = 	"Jak tím prošli mágové Vody?";
};

func int WRK_228_Horatio_WATERMAGES_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT)
	&&	Npc_KnowsInfo(hero, WRK_228_Horatio_NEWCAMP)
	{
		return TRUE;
	};
};

func void WRK_228_Horatio_WATERMAGES_Info ()
{
//	AI_Output			(hero, self, "WRK_228_WATERMAGES_15_01"); //Wie ist es den Wassermagiern ergangen?
	AI_Output			(hero, self, "WRK_228_WATERMAGES_15_01"); //Jak tím prošli mágové Vody?
//	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_02"); //Schwer zu sagen. Das neue Lager wurde grösstenteils verschüttet und es trieben sich überall eine Menge Orks herum.
	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_02"); //Těžko říct. Nový tábor byl téměř celý zasypán a všude v okolí se potloukala spousta skřetů.
//	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_03"); //Aber ich weiss, dass der Wassermagier Nefarius mit einigen Söldnern versuchte, sich ebenfalls hier ins Alte Lager zu retten.
	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_03"); //Ale vím, že Vodní mág Nefarius se spolu s jedním žoldákem snažil zachránit tady, ve Starém táboře.
//	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_04"); //Niemand hier im Lager hat je von ihm gehört also denke ich, dass es ihn unterwegs erwischt hat.
	AI_Output			(self, hero, "WRK_228_WATERMAGES_09_04"); //Nikdo tady v táboře o něm od té doby neslyšel, takže si myslím, že ho to venku chytilo.
};

///////////////////////////////////////////////////////////////////////
//	Info LOOKWHERE
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_LOOKWHERE		(C_INFO)
{
	npc		 	 = 	WRK_228_Horatio;
	condition	 = 	WRK_228_Horatio_LOOKWHERE_Condition;
	information	 = 	WRK_228_Horatio_LOOKWHERE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo fange ich am besten an, nach Nefarius zu suchen?";
	description	 = 	"Kde bych měl nejlépe začít Nefaria hledat?";
};

func int WRK_228_Horatio_LOOKWHERE_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_228_Horatio_WATERMAGES)
	{
		return TRUE;
	};
};

func void WRK_228_Horatio_LOOKWHERE_Info ()
{
//	AI_Output			(hero, self, "WRK_228_LOOKWHERE_15_01"); //Wo fange ich am besten an, nach Nefarius zu suchen?
	AI_Output			(hero, self, "WRK_228_LOOKWHERE_15_01"); //Kde bych měl nejlépe začít Nefaria hledat?
//	AI_Output			(self, hero, "WRK_228_LOOKWHERE_09_02"); //Kennst du noch den Weg von hier ins Neue Lager?
	AI_Output			(self, hero, "WRK_228_LOOKWHERE_09_02"); //Pamatuješ si ještě cestu odsud do Nového tábora?
//	AI_Output			(hero, self, "WRK_228_LOOKWHERE_15_03"); //Ja, von hier aus Richtung Westen durch die Talsenke. Immer den Weg entlang und vorbei an Cavelorns Hütte.
	AI_Output			(hero, self, "WRK_228_LOOKWHERE_15_03"); //Ano, odtud směrem na západ skrze údolíčko. A potom pořád podél cesty a kolem Cavalornovy chatrče.
//	AI_Output			(self, hero, "WRK_228_LOOKWHERE_09_04"); //Richtig!
	AI_Output			(self, hero, "WRK_228_LOOKWHERE_09_04"); //Správně!

	B_Story_SetNefariusRemains();
//	B_LogEntry		(CH1_LearnRunemaking, "Ein Wassermagier namens Nefarius ist auf dem Weg vom Neuen Lager hierher verschollen. Der Weg zum Neuen Lager führt nach Westen durch eine Talsenke und vorbei an einer alten Hütte.");
	B_LogEntry		(CH1_LearnRunemaking, "Mág Vody Nefarius je ztracený někde na cestě odtud k Novému táboru. Cesto k Novému táboru vede na západ skrze údolíčko a kolem staré chatrče.");
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance WRK_228_Horatio_HOWDY		(C_INFO)
{
	npc		 	 = 	WRK_228_Horatio;
	condition	 = 	WRK_228_Horatio_HOWDY_Condition;
	information	 = 	WRK_228_Horatio_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was machst du nun?";
	description	 = 	"Co teď děláš??";
};

func int WRK_228_Horatio_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_228_Horatio_NEWCAMP)
	{
		return TRUE;
	};
};

func void WRK_228_Horatio_HOWDY_Info ()
{
//	AI_Output			(hero, self, "WRK_228_HOWDY_15_01"); //Was machst du nun?
	AI_Output			(hero, self, "WRK_228_HOWDY_15_01"); //Co teď děláš?
//	AI_Output			(self, hero, "WRK_228_HOWDY_09_02"); //Ich setze meine Kraft für friedliche und nützliche Dinge ein.
	AI_Output			(self, hero, "WRK_228_HOWDY_09_02"); //Používám svou sílu pro mírotvorné a užitečné věci.
//	AI_Output			(self, hero, "WRK_228_HOWDY_09_03"); //Steineklopfen ist da genau das richtige für mich!
	AI_Output			(self, hero, "WRK_228_HOWDY_09_03"); //Lámání kamenů je pro mě přesně to pravé!
//	AI_Output			(self, hero, "WRK_228_HOWDY_09_04"); //Du solltest es auch mal versuchen!
	AI_Output			(self, hero, "WRK_228_HOWDY_09_04"); //Měl bys to taky někdy zkusit!
};
