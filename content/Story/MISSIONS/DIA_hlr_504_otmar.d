///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE HLR_504_Otmar_EXIT   (C_INFO)
{
	npc         = HLR_504_Otmar;
	nr          = 999;
	condition   = HLR_504_Otmar_EXIT_Condition;
	information = HLR_504_Otmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT HLR_504_Otmar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID HLR_504_Otmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance HLR_504_Otmar_JOB		(C_INFO)
{
	npc		 = 	HLR_504_Otmar;
	nr		 = 	1;
	condition	 = 	HLR_504_Otmar_JOB_Condition;
	information	 = 	HLR_504_Otmar_JOB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was ist deine Aufgabe hier?";
	description	 = 	"Co tady máš za úlohu?";
};

func int HLR_504_Otmar_JOB_Condition ()
{
	return TRUE;
};

func int HLR_504_Otmar_JOB_Info ()
{
//	AI_Output			(hero, self, "HLR_504_JOB_15_01"); //Was ist deine Aufgabe hier?
	AI_Output			(hero, self, "HLR_504_JOB_15_01"); //Co tady máš za úlohu?
//	AI_Output			(self, hero, "HLR_504_JOB_00_02"); //Ich sorge dafür, daß die Bekloppten ruhig bleiben.
	AI_Output			(self, hero, "HLR_504_JOB_00_02"); //Starám se, aby šílenci zůstali v klidu.

};


///////////////////////////////////////////////////////////////////////
//	Info CALM
///////////////////////////////////////////////////////////////////////
instance HLR_504_Otmar_CALM		(C_INFO)
{
	npc		 = 	HLR_504_Otmar;
	nr		 = 	1;
	condition	 = 	HLR_504_Otmar_CALM_Condition;
	information	 = 	HLR_504_Otmar_CALM_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie bekommt man sie ruhig?";
	description	 = 	"Jak se dají uklidnit?";
};

func int HLR_504_Otmar_CALM_Condition ()
{
	if Npc_KnowsInfo (hero,HLR_504_Otmar_JOB)
	{
		return TRUE;
	};
};
func int HLR_504_Otmar_CALM_Info ()
{
//	AI_Output			(hero, self, "HLR_504_CALM_15_01"); //Wie bekommt man sie ruhig?
	AI_Output			(hero, self, "HLR_504_CALM_15_01"); //Jak se dají uklidnit?
//	AI_Output			(self, hero, "HLR_504_CALM_00_02"); //Die Heiler haben schon alles mögliche ausprobiert, ohne Erfolg. Jetzt geben wir ihnen Sumpfkraut. Das beruhigt sie.
	AI_Output			(self, hero, "HLR_504_CALM_00_02"); //Léčitelé už zkoušeli všechno, bez úspěchu. Zatím jim dáváme trávu z bažin. Ta je uklidňuje.
//	AI_Output			(self, hero, "HLR_504_CALM_00_03"); //Macht mir auch die Arbeit leichter. Das Sumpfkraut ist wirklich gut Mann, wirklich gut!
	AI_Output			(self, hero, "HLR_504_CALM_00_03"); //Taky mi to usnadňuje práci. Tráva z bažin je fakt dobrá, chlape, fakt dobrá.
};

///////////////////////////////////////////////////////////////////////
//	Info HOWCALM
///////////////////////////////////////////////////////////////////////
instance HLR_504_Otmar_HOWCALM		(C_INFO)
{
	npc		 = 	HLR_504_Otmar;
	nr		 = 	1;
	condition	 = 	HLR_504_Otmar_HOWCALM_Condition;
	information	 = 	HLR_504_Otmar_HOWCALM_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kann man mit den Kranken reden?";
	description	 = 	"Dá se s nemocnými mluvit?";
};

func int HLR_504_Otmar_HOWCALM_Condition ()
{
	if Npc_KnowsInfo (hero,HLR_504_Otmar_CALM)
	{
		return TRUE;
	};
};
func int HLR_504_Otmar_HOWCALM_Info ()
{
//	AI_Output			(hero, self, "HLR_504_HOWCALM_15_01"); //Kann man mit den Kranken reden?
	AI_Output			(hero, self, "HLR_504_HOWCALM_15_01"); //Dá se s nemocnými mluvit?
//	AI_Output			(self, hero, "HLR_504_HOWCALM_00_02"); //Wozu? Die reden nur wirres Zeug. Arme Irre.
	AI_Output			(self, hero, "HLR_504_HOWCALM_00_02"); //Na co? Říkají jen nesmysly. Chudáci blázni.

};





