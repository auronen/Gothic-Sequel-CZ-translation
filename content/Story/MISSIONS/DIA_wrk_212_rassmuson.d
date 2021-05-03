
instance WRK_212_RASSMUSON_EXIT(C_Info)
{
	npc = wrk_212_rassmuson;
	nr = 999;
	condition = wrk_212_rassmuson_exit_condition;
	information = wrk_212_rassmuson_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_212_rassmuson_exit_condition()
{
	return TRUE;
};

func void wrk_212_rassmuson_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_212_RASSMUSON_HI(C_Info)
{
	npc = wrk_212_rassmuson;
	nr = 12;
	condition = wrk_212_rassmuson_hi_condition;
	information = wrk_212_rassmuson_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was machst du hier?";
};


func int wrk_212_rassmuson_hi_condition()
{
	return TRUE;
};

func void wrk_212_rassmuson_hi_info()
{
	AI_Output(hero,self,"WRK_212_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"WRK_212_HI_01_02");	//Mir reicht's. Diese ewige Plockerei, die Orks, einfach alles.
	AI_Output(self,hero,"WRK_212_HI_01_03");	//Jeden Tag schuften wir uns den Arsch ab,und wofür? Wenn die Orks kommen, sind wir eh Futter!
	AI_Output(self,hero,"WRK_212_HI_01_04");	//Ich kann nicht mehr und ich will nicht mehr.
	AI_Output(hero,self,"WRK_212_HI_15_05");	//Und was willst du tun?
	AI_Output(self,hero,"WRK_212_HI_01_06");	//Ich werde mich absetzen,... aber wenn du das weitererzählst, mache ich dich fertig!
};


instance WRK_212_RASSMUSON_WHERE(C_Info)
{
	npc = wrk_212_rassmuson;
	nr = 23;
	condition = wrk_212_rassmuson_where_condition;
	information = wrk_212_rassmuson_where_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo willst du denn hin?";
};


func int wrk_212_rassmuson_where_condition()
{
	if(Npc_KnowsInfo(hero,wrk_212_rassmuson_hi))
	{
		return TRUE;
	};
};

func void wrk_212_rassmuson_where_info()
{
	AI_Output(hero,self,"WRK_212_WHERE_15_01");	//Wo willst du denn hin?
	AI_Output(self,hero,"WRK_212_WHERE_01_02");	//Keine Ahnung. Ich werde mir ein paar Vorräte und einen Bogen mitnehmen und mich den Jägern anschliessen.
	AI_Output(self,hero,"WRK_212_WHERE_01_03");	//Irgendwo finde ich schon eine Höhle wo ich unterkommen kann, bis der ganze Scheiss hier vorbei ist!
	AI_Output(self,hero,"WRK_212_WHERE_01_04");	//Ich warte nur noch auf einen günstigen Augenblick...
	AI_StopProcessInfos(self);
};


instance WRK_212_RASSMUSON_AGAIN(C_Info)
{
	npc = wrk_212_rassmuson;
	nr = 33;
	condition = wrk_212_rassmuson_again_condition;
	information = wrk_212_rassmuson_again_info;
	important = FALSE;
	permanent = TRUE;
	description = "Na, immer noch da?";
};


func int wrk_212_rassmuson_again_condition()
{
	if(Npc_KnowsInfo(hero,wrk_212_rassmuson_where))
	{
		return TRUE;
	};
};

func void wrk_212_rassmuson_again_info()
{
	AI_Output(hero,self,"WRK_212_AGAIN_15_01");	//Na, immer noch da?
	AI_Output(self,hero,"WRK_212_AGAIN_01_02");	//Ja, gute Vorbereitungen brauchen ihre Zeit.
};

