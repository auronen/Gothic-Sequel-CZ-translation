///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance WRK_206_Nicolos_Exit (C_INFO)
{
	npc			=  WRK_206_Nicolos;
	nr			=  999;
	condition	=  WRK_206_Nicolos_Exit_Condition;
	information	=  WRK_206_Nicolos_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  WRK_206_Nicolos_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  WRK_206_Nicolos_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info GOOD
///////////////////////////////////////////////////////////////////////
instance WRK_206_Nicolos_GOOD		(C_INFO)
{
	npc		 = 	WRK_206_Nicolos;
	nr		 = 	1;
	condition	 = 	WRK_206_Nicolos_GOOD_Condition;
	information	 = 	WRK_206_Nicolos_GOOD_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wie schmeckt dir das Essen hier?";
	description	 = 	"Jak ti tu chutná?";
};

func int WRK_206_Nicolos_GOOD_Condition ()
{
	return TRUE;
};

func void WRK_206_Nicolos_GOOD_Info ()
{
//	AI_Output			(hero, self, "WRK_206_GOOD_15_01"); //Wie schmeckt dir das Essen hier?
	AI_Output			(hero, self, "WRK_206_GOOD_15_01"); //Jak ti tu chutná?
//	AI_Output			(self, hero, "WRK_206_GOOD_00_02"); //Snaf ist der beste Koch hier im Lager. Seine Suppen sind erste Klasse!
	AI_Output			(self, hero, "WRK_206_GOOD_00_02"); //Snaf je nejlepší kuchař tady v táboře. Jeho polévky jsou první třída!
};















