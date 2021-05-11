///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE HLR_500_Palgur_EXIT   (C_INFO)
{
	npc         = HLR_500_Palgur;
	nr          = 999;
	condition   = HLR_500_Palgur_EXIT_Condition;
	information = HLR_500_Palgur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT HLR_500_Palgur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID HLR_500_Palgur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info _POS
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_POS		(C_INFO)
{
	npc		 = 	HLR_500_Palgur;
	nr		 = 	1;
	condition	 = 	HLR_500_Palgur_POS_Condition;
	information	 = 	HLR_500_Palgur_POS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was für eine Krankheit haben diese Leute?";
	description	 = 	"Co mají tito lidé za nemoc?";
};

func int HLR_500_Palgur_POS_Condition ()
{
	if	!Npc_KnowsInfo (hero,HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};
func int HLR_500_Palgur_POS_Info ()
{
//	AI_Output			(hero, self, "HLR_500__POS_15_01"); //Was für eine Krankheit haben diese Gestalten? //Nevím, co má být to Gestalten, tak jsem dal stejný překlad jako výše.
	AI_Output			(hero, self, "HLR_500__POS_15_01"); //Co mají tito lidé za nemoc?
//	AI_Output			(self, hero, "HLR_500__POS_08_02"); //Die Kranken verlieren ihren Verstand und ihr Körper geht jämmerlich zugrunde.
	AI_Output			(self, hero, "HLR_500__POS_08_02"); //Nemocní ztrácejí rozum a jejich tělo chřadne.
//	AI_Output			(self, hero, "HLR_500__POS_08_03"); //Wir haben bisher noch keine Aufzeichnungen darüber gefunden.
	AI_Output			(self, hero, "HLR_500__POS_08_03"); //Dosud jsme nenalezli žádný záznam o této nemoci.

};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_JOB		(C_INFO)
{
	npc		 = 	HLR_500_Palgur;
	nr		 = 	1;
	condition	 = 	HLR_500_Palgur_JOB_Condition;
	information	 = 	HLR_500_Palgur_JOB_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was ist deine Aufgabe hier?";
	description	 = 	"Jakou tu plníš úlohu?";
};

func int HLR_500_Palgur_JOB_Condition ()
{
	return TRUE;
};

func int HLR_500_Palgur_JOB_Info ()
{
//	AI_Output			(hero, self, "HLR_500_JOB_15_01"); //Was ist deine Aufgabe hier?
	AI_Output			(hero, self, "HLR_500_JOB_15_01"); //Was ist deine Aufgabe hier?
//	AI_Output			(self, hero, "HLR_500_JOB_08_02"); //Ich erforsche verschiedene Rezepturen, um ein Heilmittel zu finden
	AI_Output			(self, hero, "HLR_500_JOB_08_02"); //Zkoumám různé receptury, abych našel lék.
//	AI_Output			(self, hero, "HLR_500_JOB_08_03"); //Wir haben herausgefunden, daß die Kranken durch SUMPFKRAUT beruhigt werden.
	AI_Output			(self, hero, "HLR_500_JOB_08_03"); //Zatím jsme přišli na to, že TRÁVA Z BAŽIN nemocné uklidňuje.
//	AI_Output			(hero, self, "HLR_500_JOB_15_04"); //Das ist alles?
	AI_Output			(hero, self, "HLR_500_JOB_15_04"); //To je všechno?
//	AI_Output			(self, hero, "HLR_500_JOB_08_05"); //... alles? Wir verzeichnen das als den ersten großen Fortschritt. //volný překlad, ale to "...všechno?" by v češtině moc nedávalo smysl.
	AI_Output			(self, hero, "HLR_500_JOB_08_05"); //... to je ti málo? Vnímáme to jako první zásadní krok vpřed.
};
///////////////////////////////////////////////////////////////////////
//	Info _POS
///////////////////////////////////////////////////////////////////////
instance HLR_500_Palgur_RECIPE		(C_INFO)
{
	npc		 	 = 	HLR_500_Palgur;
	nr		 	 = 	1;
	condition	 = 	HLR_500_Palgur_RECIPE_Condition;
	information	 = 	HLR_500_Palgur_RECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie geht die Arbeit voran?";
	description	 = 	"Jak pokračuje práce?";
};

func int HLR_500_Palgur_RECIPE_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};
func int HLR_500_Palgur_RECIPE_Info ()
{
//	AI_Output			(hero, self, "HLR_500_RECIPE_15_01"); //Wie geht die Arbeit voran?
	AI_Output			(hero, self, "HLR_500_RECIPE_15_01"); //Jak pokračuje práce?
//	AI_Output			(self, hero, "HLR_500_RECIPE_08_02"); //Dank der Rezeptur, die du uns besorgt hast, können wir unsere Forschungen gezielter durchführen.
	AI_Output			(self, hero, "HLR_500_RECIPE_08_02"); //Díky receptuře, kterou jsi nám obstaral, můžeme náš výzkum lépe zacílit.
//	AI_Output			(self, hero, "HLR_500_RECIPE_08_03"); //Trotzdem ist es noch ein langer Weg, bis wir ein Heilmittel gefunden haben.
	AI_Output			(self, hero, "HLR_500_RECIPE_08_03"); //Přesto je to ještě dlouhá cesta, než nalezneme lék.

};


