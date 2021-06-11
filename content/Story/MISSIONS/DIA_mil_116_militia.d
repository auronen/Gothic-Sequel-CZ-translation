///////////////////////////////////////////////////////////////////////
//	Info WAIT
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_WAIT		(C_INFO)
{
	npc		 = 	MIL_116_Militia;
	nr		 = 	12;
	condition	 = 	MIL_116_Militia_WAIT_Condition;
	information	 = 	MIL_116_Militia_WAIT_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_116_Militia_WAIT_Condition ()
{
	if	(subChapter < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void MIL_116_Militia_WAIT_Info ()
{
//	AI_Output			(self, hero, "MIL_116_WAIT_06_01"); //Hey, wo willst du hin?
	AI_Output			(self, hero, "MIL_116_WAIT_06_01"); //Hej, kam to jdeš?

//	Info_AddChoice		(MIL_116_Militia_WAIT, "Ich suche meinen alten Freund Diego."	, MIL_116_Militia_WAIT_TROUBLE );
	Info_AddChoice		(MIL_116_Militia_WAIT, "Hledám Diega, svého starého známého."	, MIL_116_Militia_WAIT_TROUBLE );
//	Info_AddChoice		(MIL_116_Militia_WAIT, "Ich will ins Lager."					, MIL_116_Militia_WAIT_CAMP );
	Info_AddChoice		(MIL_116_Militia_WAIT, "Chci jít do tábora."					, MIL_116_Militia_WAIT_CAMP );
};
func void MIL_116_Militia_WAIT_CAMP ()
{
//	AI_Output			(hero, self, "MIL_116_WAIT_CAMP_15_01"); //Ich will ins Lager.
	AI_Output			(hero, self, "MIL_116_WAIT_CAMP_15_01"); //Chci jít do tábora.
//	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_02"); //Auf der Flucht vor den Orks , wie?
	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_02"); //Utíkáš před skřety, co?
//	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_03"); //Damit das eine mal klar ist, hier drin wird gearbeitet und trainiert.
	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_03"); //Aby bylo jasno, tady se pracuje a trénuje.
//	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_04"); //Wenn du vorhast Ärger zu machen, kannst du direkt wieder gehen.
	AI_Output			(self, hero, "MIL_116_WAIT_CAMP_06_04"); //Pokud chceš dělat potíže, tak běž rovnou jinam.

	subChapter			= CH1_ARRIVED_AT_OC;

	AI_StopProcessInfos (self);
};

func void MIL_116_Militia_WAIT_TROUBLE ()
{
//	AI_Output			(hero, self, "MIL_116_WAIT_TROUBLE_15_01"); //Ich suche meinen alten Freund Diego.
	AI_Output			(hero, self, "MIL_116_WAIT_TROUBLE_15_01"); //Hledám Diega, svého starého známého.
//	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_02"); //Schon wieder einer, der meint ein Freund von Diego zu sein.
	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_02"); //Další takový, kdo si myslí, že je Diegův kámoš.
//	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_03"); //Damit das klar ist, Bürschchen. Diego ist hier der Boss im Lager und er hat bestimmt keine Zeit, mit jedem dahergelaufenen Penner zu reden.
	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_03"); //Aby bylo jasno, chlapče. Diego je tu šéfem tábora a rozhodně nemá čas, aby klábosil s každým pobudou, co sem přiběhne.
//	AI_Output			(hero, self, "MIL_116_WAIT_TROUBLE_15_04"); //Und wo finde ich nun ...euren Boss?
	AI_Output			(hero, self, "MIL_116_WAIT_TROUBLE_15_04"); //A kde najdu ...vašeho šéfa?
//	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_05"); //Er hält Rat im alten Erzbaronhaus innerhalb der Burg. Und nun zieh Leine!
	AI_Output			(self, hero, "MIL_116_WAIT_TROUBLE_06_05"); //Má poradu ve starém rudobaronském domě uvnitř hradu. A teď vypadni.

	subChapter			= CH1_ARRIVED_AT_OC;

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DEFEAT
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_DEFEAT		(C_INFO)
{
	npc		 = 	MIL_116_Militia;
	nr		 = 	12;
	condition	 = 	MIL_116_Militia_DEFEAT_Condition;
	information	 = 	MIL_116_Militia_DEFEAT_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int MIL_116_Militia_DEFEAT_Condition ()
{
	if Npc_KnowsInfo (hero, MIL_116_Militia_WAIT)
	&& (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	&& C_NPCisinvincible (self)
	{
		return TRUE;
	};
};
func void MIL_116_Militia_DEFEAT_Info ()
{
//	AI_Output			(self, hero, "MIL_116_DEFEAT_06_01"); //Willst du noch 'ne Runde?
	AI_Output			(self, hero, "MIL_116_DEFEAT_06_01"); //Chceš ještě jednu rundu?
};

///////////////////////////////////////////////////////////////////////
//	Info ORECAVE
///////////////////////////////////////////////////////////////////////
instance MIL_116_Militia_ORECAVE		(C_INFO)
{
	npc			 = 	MIL_116_Militia;
	nr			 =	1;
	condition	 = 	MIL_116_Militia_ORECAVE_Condition;
	information	 = 	MIL_116_Militia_ORECAVE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Weisst du was von einer Molerat-Höhle hier in der Nähe?";
	description	 = 	"Nevíš něco o nějaké krysokrtí jeskyni poblíž?";
};

func int MIL_116_Militia_ORECAVE_Condition ()
{
	if	Npc_KnowsInfo(hero,Info_Gotmar_WHEREORE3)
	{
		return TRUE;
	};
};

func void MIL_116_Militia_ORECAVE_Info ()
{
//	AI_Output			(hero, self, "MIL_116_ORECAVE_15_01"); //Weisst du was von einer Molerat-Höhle hier in der Nähe?
	AI_Output			(hero, self, "MIL_116_ORECAVE_15_01"); //Nevíš něco o nějaké krysokrtí jeskyni poblíž?
//	AI_Output			(self, hero, "MIL_116_ORECAVE_06_02"); //Siehst du da drüben die Brücke über den Fluss?
	AI_Output			(self, hero, "MIL_116_ORECAVE_06_02"); //Vidíš tamhle ten most přes řeku?
//	AI_Output			(hero, self, "MIL_116_ORECAVE_15_03"); //Ja!
	AI_Output			(hero, self, "MIL_116_ORECAVE_15_03"); //Ano!
//	AI_Output			(self, hero, "MIL_116_ORECAVE_06_04"); //Links davon ist eine Höhle in der sich solche Biester eingenistet haben.
	AI_Output			(self, hero, "MIL_116_ORECAVE_06_04"); //Vlevo od něj je jeskyně, ve které se tyhle potvory usídlily.
//	AI_Output			(self, hero, "MIL_116_ORECAVE_06_05"); //Diese Viecher sind ziemlich hinterhältig. Beobachten einen nur und beissen genau in dem Moment zu, in dem man selbst zum Schlag ausholen will.
	AI_Output			(self, hero, "MIL_116_ORECAVE_06_05"); //Ta verbež je docela záludná. Jen tak na tebe koukají, a pak tě hryznou přesně ve chvíli, kdy je chceš praštit.
};













