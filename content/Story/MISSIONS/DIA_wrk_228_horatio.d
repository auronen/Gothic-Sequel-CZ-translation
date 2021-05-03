
instance WRK_228_HORATIO_EXIT(C_Info)
{
	npc = wrk_228_horatio;
	nr = 999;
	condition = wrk_228_horatio_exit_condition;
	information = wrk_228_horatio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_228_horatio_exit_condition()
{
	return TRUE;
};

func void wrk_228_horatio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_228_HORATIO_HELLO(C_Info)
{
	npc = wrk_228_horatio;
	condition = wrk_228_horatio_hello_condition;
	information = wrk_228_horatio_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_228_horatio_hello_condition()
{
	if(c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void wrk_228_horatio_hello_info()
{
	AI_Output(self,hero,"WRK_228_HELLO_09_01");	//Ich glaube meine müden Augen lassen mich im Stich, bist du es wirklich?
	AI_Output(hero,self,"WRK_228_HELLO_15_02");	//Wie geht es diesem Reislord und seinem Handlanger Lefty?
	AI_Output(self,hero,"WRK_228_HELLO_09_03");	//Keine Ahnung, aber du hast ihnen ja damals gezeigt, wo der Hammer hängt.
	AI_Output(self,hero,"WRK_228_HELLO_09_04");	//Seit dem Zusammenbruch der Barriere habe ich sie allerdings beide nicht mehr gesehen.
};


instance WRK_228_HORATIO_NEWCAMP(C_Info)
{
	npc = wrk_228_horatio;
	condition = wrk_228_horatio_newcamp_condition;
	information = wrk_228_horatio_newcamp_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum bist du nicht mehr im Neuen Lager?";
};


func int wrk_228_horatio_newcamp_condition()
{
	if(Npc_KnowsInfo(hero,wrk_228_horatio_hello))
	{
		return TRUE;
	};
};

func void wrk_228_horatio_newcamp_info()
{
	AI_Output(hero,self,"WRK_228_NEWCAMP_15_01");	//Warum bist du nicht mehr im Neuen Lager?
	AI_Output(self,hero,"WRK_228_NEWCAMP_09_02");	//Der Zusammenbruch der Barriere wurde von schwersten Beben begleitet.
	AI_Output(self,hero,"WRK_228_NEWCAMP_09_03");	//Banditen und Söldner verfielen in Panik und rannten entweder planlos umher oder gingen sich gegenseitig an die Gurgel.
	AI_Output(self,hero,"WRK_228_NEWCAMP_09_04");	//Nur sehr wenige entkamen diesem Hexenkessel an jenem Tag. Ich war einer davon!
	AI_Output(self,hero,"WRK_228_NEWCAMP_09_05");	//Hier fand ich, wie andere auch, einen einigermassen sicheren Zufluchtsort.
};


instance WRK_228_HORATIO_WATERMAGES(C_Info)
{
	npc = wrk_228_horatio;
	condition = wrk_228_horatio_watermages_condition;
	information = wrk_228_horatio_watermages_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie ist es den Wassermagiern ergangen?";
};


func int wrk_228_horatio_watermages_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_whatnext) && Npc_KnowsInfo(hero,wrk_228_horatio_newcamp))
	{
		return TRUE;
	};
};

func void wrk_228_horatio_watermages_info()
{
	AI_Output(hero,self,"WRK_228_WATERMAGES_15_01");	//Wie ist es den Wassermagiern ergangen?
	AI_Output(self,hero,"WRK_228_WATERMAGES_09_02");	//Schwer zu sagen. Das neue Lager wurde grösstenteils verschüttet und es trieben sich überall eine Menge Orks herum.
	AI_Output(self,hero,"WRK_228_WATERMAGES_09_03");	//Aber ich weiss, dass der Wassermagier Nefarius mit einigen Söldnern versuchte, sich ebenfalls hier ins Alte Lager zu retten.
	AI_Output(self,hero,"WRK_228_WATERMAGES_09_04");	//Niemand hier im Lager hat je von ihm gehört also denke ich, dass es ihn unterwegs erwischt hat.
};


instance WRK_228_HORATIO_LOOKWHERE(C_Info)
{
	npc = wrk_228_horatio;
	condition = wrk_228_horatio_lookwhere_condition;
	information = wrk_228_horatio_lookwhere_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo fange ich am besten an, nach Nefarius zu suchen?";
};


func int wrk_228_horatio_lookwhere_condition()
{
	if(Npc_KnowsInfo(hero,wrk_228_horatio_watermages))
	{
		return TRUE;
	};
};

func void wrk_228_horatio_lookwhere_info()
{
	AI_Output(hero,self,"WRK_228_LOOKWHERE_15_01");	//Wo fange ich am besten an, nach Nefarius zu suchen?
	AI_Output(self,hero,"WRK_228_LOOKWHERE_09_02");	//Kennst du noch den Weg von hier ins Neue Lager?
	AI_Output(hero,self,"WRK_228_LOOKWHERE_15_03");	//Ja, von hier aus Richtung Westen durch die Talsenke. Immer den Weg entlang und vorbei an Cavelorns Hütte.
	AI_Output(self,hero,"WRK_228_LOOKWHERE_09_04");	//Richtig!
	b_story_setnefariusremains();
	B_LogEntry(CH1_LEARNRUNEMAKING,"Ein Wassermagier namens Nefarius ist auf dem Weg vom Neuen Lager hierher verschollen. Der Weg zum Neuen Lager führt nach Westen durch eine Talsenke und vorbei an einer alten Hütte.");
	AI_StopProcessInfos(self);
};


instance WRK_228_HORATIO_HOWDY(C_Info)
{
	npc = wrk_228_horatio;
	condition = wrk_228_horatio_howdy_condition;
	information = wrk_228_horatio_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du nun?";
};


func int wrk_228_horatio_howdy_condition()
{
	if(Npc_KnowsInfo(hero,wrk_228_horatio_newcamp))
	{
		return TRUE;
	};
};

func void wrk_228_horatio_howdy_info()
{
	AI_Output(hero,self,"WRK_228_HOWDY_15_01");	//Was machst du nun?
	AI_Output(self,hero,"WRK_228_HOWDY_09_02");	//Ich setze meine Kraft für friedliche und nützliche Dinge ein.
	AI_Output(self,hero,"WRK_228_HOWDY_09_03");	//Steineklopfen ist da genau das richtige für mich!
	AI_Output(self,hero,"WRK_228_HOWDY_09_04");	//Du solltest es auch mal versuchen!
};

