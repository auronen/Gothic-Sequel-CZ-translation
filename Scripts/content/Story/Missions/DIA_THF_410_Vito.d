///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE THF_410_Vito_EXIT   (C_INFO)
{
	npc         = THF_410_Vito;
	nr          = 999;
	condition   = THF_410_Vito_EXIT_Condition;
	information = THF_410_Vito_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT THF_410_Vito_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID THF_410_Vito_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info TASSIO
///////////////////////////////////////////////////////////////////////
instance THF_410_Vito_TASSIO		(C_INFO)
{
	npc		 	 = 	THF_410_Vito;
	condition	 = 	THF_410_Vito_TASSIO_Condition;
	information	 = 	THF_410_Vito_TASSIO_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int THF_410_Vito_TASSIO_Condition ()
{
	if	Npc_KnowsInfo(hero, THF_411_Tassio_YOURJOB)
	{
		return TRUE;
	};
};

func void THF_410_Vito_TASSIO_Info ()
{
//	AI_Output			(self, hero, "THF_410_TASSIO_07_01"); //Der arme Tassio ist etwas langsam... auch im Kopf, weisst du.
	AI_Output			(self, hero, "THF_410_TASSIO_07_01"); //Ubohý Tassio je poněkud pomalý... i v hlavě, chápeš.
//	AI_Output			(hero, self, "THF_410_TASSIO_15_02"); //Verstehe.
	AI_Output			(hero, self, "THF_410_TASSIO_15_02"); //Chápu.
//	AI_Output			(self, hero, "THF_410_TASSIO_07_03"); //Am besten du hälst dich an mich.
	AI_Output			(self, hero, "THF_410_TASSIO_07_03"); //Nejlépe uděláš, když budeš trpělivý.
};

///////////////////////////////////////////////////////////////////////
//	Info YOURJOB
///////////////////////////////////////////////////////////////////////
instance THF_410_Vito_YOURJOB		(C_INFO)
{
	npc		 	 = 	THF_410_Vito;
	condition	 = 	THF_410_Vito_YOURJOB_Condition;
	information	 = 	THF_410_Vito_YOURJOB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was macht ihr hier oben in den Bergen?";
	description	 = 	"Co děláte tady v horách?";
};

func int THF_410_Vito_YOURJOB_Condition ()
{
	return TRUE;
};

func void THF_410_Vito_YOURJOB_Info ()
{
//	AI_Output			(hero, self, "THF_410_YOURJOB_15_01"); //Was macht ihr hier oben in den Bergen?
	AI_Output			(hero, self, "THF_410_YOURJOB_15_01"); //Co děláte tady v horách?
//	AI_Output			(self, hero, "THF_410_YOURJOB_07_02"); //Wir wollen Soldaten des Königs werden, doch das ist schwieriger als ich dachte.
	AI_Output			(self, hero, "THF_410_YOURJOB_07_02"); //Chtěli jsme se stát vojáky krále, ale je to jaksi těžší, než jsem očekával.
};

///////////////////////////////////////////////////////////////////////
//	Info DIFFICULT
///////////////////////////////////////////////////////////////////////
instance THF_410_Vito_DIFFICULT		(C_INFO)
{
	npc		 	 = 	THF_410_Vito;
	condition	 = 	THF_410_Vito_DIFFICULT_Condition;
	information	 = 	THF_410_Vito_DIFFICULT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wieso?";
	description	 = 	"Jak to?";
};

func int THF_410_Vito_DIFFICULT_Condition ()
{
	if	Npc_KnowsInfo(hero, THF_410_Vito_YOURJOB)
	{
		return TRUE;
	};
};

func void THF_410_Vito_DIFFICULT_Info ()
{
//	AI_Output			(hero, self, "THF_410_DIFFICULT_15_01"); //Wieso?
	AI_Output			(hero, self, "THF_410_DIFFICULT_15_01"); //Jak to?
//	AI_Output			(self, hero, "THF_410_DIFFICULT_07_03"); //Diese Torwachen da drüben sagen, wir müssten es erst mal zu den Hilfstruppen schaffen, bevor wir richtige Soldaten werden können.
	AI_Output			(self, hero, "THF_410_DIFFICULT_07_03"); //Ti strážní tam u brány říkají, že se musíme nejprve dostat k pomocným vojskům, než se z nás budou moci stát skuteční vojáci.
//	AI_Output			(hero, self, "THF_410_DIFFICULT_15_04"); //Aha.
	AI_Output			(hero, self, "THF_410_DIFFICULT_15_04"); //Aha.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_07_05"); //Und wenn wir gute Soldaten sind, dann könnten wir vielleicht sogar mal echte Paladine des Königs werden.
	AI_Output			(self, hero, "THF_410_DIFFICULT_07_05"); //A až budeme dobří vojáci, pak se z nás třeba můžou stát dokonce skuteční královští paladinové.
//	AI_Output			(hero, self, "THF_410_DIFFICULT_15_06"); //Soso.
	AI_Output			(hero, self, "THF_410_DIFFICULT_15_06"); //Rozumím.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_07_02"); //Aber die wollen uns nicht mal bei den Hilfstruppen haben, weil sie sagen wir wären keine guten Kämpfer.
	AI_Output			(self, hero, "THF_410_DIFFICULT_07_02"); //Ale ti u pomocných vojsk nás nechtějí, protože říkají, že nejsme dobří bojovníci.
//	AI_Output			(hero, self, "THF_410_DIFFICULT_15_06"); //Ich verstehe.
	AI_Output			(hero, self, "THF_410_DIFFICULT_15_06"); //Rozumím.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_07_07"); //Willst du auch Soldat werden?
	AI_Output			(self, hero, "THF_410_DIFFICULT_07_07"); //Ty chceš být taky voják?

//	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Das geht dich nichts an.", THF_410_Vito_DIFFICULT_NOBUSINESS );
	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Do toho ti nic není.", THF_410_Vito_DIFFICULT_NOBUSINESS );
//	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Nein, ich will nur in die Bergfestung.", THF_410_Vito_DIFFICULT_NO );
	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Ne, já chci jen do Horské pevnosti.", THF_410_Vito_DIFFICULT_NO );
//	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Ja.", THF_410_Vito_DIFFICULT_YES );
	Info_AddChoice		(THF_410_Vito_DIFFICULT, "Ano.", THF_410_Vito_DIFFICULT_YES );


};
func void THF_410_Vito_DIFFICULT_YES ()
{
	Info_ClearChoices	(THF_410_Vito_DIFFICULT);
//	AI_Output			(hero, self, "THF_410_DIFFICULT_YES_15_01"); //Ja.
	AI_Output			(hero, self, "THF_410_DIFFICULT_YES_15_01"); //Ano.
	AI_StandUp			(self);
	AI_TurnToNpc		(self, hero);
	AI_TurnToNpc		(hero, self);
//	AI_Output			(self, hero, "THF_410_DIFFICULT_YES_07_02"); //HEHH!!! Wir waren zuerst hier!
	AI_Output			(self, hero, "THF_410_DIFFICULT_YES_07_02"); //HEHH!!! My tu byli dřív!
//	AI_Output			(self, hero, "THF_410_DIFFICULT_YES_07_03"); //Stell dich gefälligst hinten an, verstanden?
	AI_Output			(self, hero, "THF_410_DIFFICULT_YES_07_03"); //Takže si laskavě stoupni do řady, jasný?
	AI_StopProcessInfos	(self);
};

func void THF_410_Vito_DIFFICULT_NO ()
{
	Info_ClearChoices	(THF_410_Vito_DIFFICULT);
//	AI_Output			(hero, self, "THF_410_DIFFICULT_NO_15_01"); //Nein, ich will nur in die Bergfestung.
	AI_Output			(hero, self, "THF_410_DIFFICULT_NO_15_01"); //Ne, já chci jen do Horské pevnosti.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_NO_07_02"); //Haha, du kommst nie so einfach durch dieses Tor. Da wette ich meine letzte Buddel drauf.
	AI_Output			(self, hero, "THF_410_DIFFICULT_NO_07_02"); //Haha, touhle branou tak snadno neprojdeš. Na to klidně vsadím svoji poslední flašku.
//	AI_Output			(hero, self, "THF_410_DIFFICULT_NO_15_03"); //Ich werde mir dann nachher die Flasche abholen. Wir sehen uns!
	AI_Output			(hero, self, "THF_410_DIFFICULT_NO_15_03"); //Tak to se tu potom pro pro tu lahev zastavím. Zatím!
	AI_StopProcessInfos	(self);
};

func void THF_410_Vito_DIFFICULT_NOBUSINESS ()
{
	Info_ClearChoices	(THF_410_Vito_DIFFICULT);
//	AI_Output			(hero, self, "THF_410_DIFFICULT_NOBUSINESS_15_01"); //Das geht dich nichts an.
	AI_Output			(hero, self, "THF_410_DIFFICULT_NOBUSINESS_15_01"); //Do toho ti nic není.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_02"); //Pahh!! Du bist genauso arrogant wie diese Torwachen da drüben.
	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_02"); //Pahh!! Jsi zrovna tak arogantní jak ti strážní tamhle.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_03"); //Würdest gut zu diesen Paladinen passen. Die sind ihre Anführer und die Ausgeburt an Arroganz.
	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_03"); //Ty dobře zapadneš mezi tyhle paladiny. To jsou jejich velitelé, přímo výplody arogance.
//	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_04"); //Sprechen kaum ein Wort mit dir und schauen über dich hinweg als ob du Fliegenmist wärst.
	AI_Output			(self, hero, "THF_410_DIFFICULT_NOBUSINESS_07_04"); //Neprohodí s tebou ani slovo a dívají se na tebe spatra jako na žravou štěnici.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance THF_410_Vito_HOWDY		(C_INFO)
{
	npc		 	 = 	THF_410_Vito;
	condition	 = 	THF_410_Vito_HOWDY_Condition;
	information	 = 	THF_410_Vito_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Na, immer noch hier draussen?";
	description	 = 	"Tak co, pořád tady venku?";
};

func int THF_410_Vito_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero, THF_410_Vito_DIFFICULT)
	{
		return TRUE;
	};
};

func void THF_410_Vito_HOWDY_Info ()
{
//	AI_Output			(hero, self, "THF_410_HOWDY_15_01"); //Na, immer noch hier draussen?
	AI_Output			(hero, self, "THF_410_HOWDY_15_01"); //Tak co, pořád tady venku?
//	AI_Output			(self, hero, "THF_410_HOWDY_07_02"); //Noch! Bestimmt werden wir schon bald bei den Hilfstruppen sein, wart' nur ab.
	AI_Output			(self, hero, "THF_410_HOWDY_07_02"); //Pořád! Určitě nás ale brzo přijmou k pomocným vojskům, jen počkej!
};




















