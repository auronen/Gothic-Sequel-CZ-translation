///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_6_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Mil_6_Exit_Condition;
	information	=  Infos_Mil_6_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Mil_6_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Mil_6_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_6_HI (C_INFO)
{
	condition		= Infos_Mil_6_HI_Condition;
	information		= Infos_Mil_6_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak to jde?";
	permanent		= TRUE;
};

FUNC int  Infos_Mil_6_HI_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_6_HI_Info()
{
//	AI_Output (other, self,"Infos_Mil_6_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Mil_6_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Mil_6_HI_Info_06_02"); //Wie es im Krieg halt so läuft. Wenn die Orks kommen, greifen wir an. Wenn nicht, dann warten wir weiter.
	AI_Output (self, other,"Infos_Mil_6_HI_Info_06_02"); //Tak, jak to ve válce chodí. Pokud skřeti přijdou, zaútočíme. Pokud ne, budeme čekat

};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance	Info_Mil_6_FOODGOOD (C_INFO)
{
	condition		= Info_Mil_6_FOODGOOD_Condition;
	information		= Info_Mil_6_FOODGOOD_Info;
	permanent 		= TRUE;
//	description		= "Ich hab hier etwas Silber, warum isst du ab Morgen nicht einfach bei Snaf?";
	description		= "Mám tu pro tebe nějaké stříbro, proč se jednoduše nenajíš u Snafa?";
};

func int	Info_Mil_6_FOODGOOD_Condition()
{
	if	B_LunchTimeAtHalvors()
	&&	(self.aivar[AIV_DEALDAY] < B_GetDay())
	&&	Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF)
	{
		return TRUE;
	};
};

func void	Info_Mil_6_FOODGOOD_Info()
{
//	AI_Output			(hero, self,"Info_Mil_6_FOODGOOD_15_01"); //Ich hab hier etwas Silber, warum isst du ab Morgen nicht einfach bei Snaf?
	AI_Output			(hero, self,"Info_Mil_6_FOODGOOD_15_01"); //Mám tu pro tebe nějaké stříbro, proč se jednoduše nenajíš u Snafa?

	if	(Npc_HasItems(hero, ItMi_Silver) >= SNAF_BRIBE_SUM)
	{
		B_GiveInvItems	(hero, self, ItMi_Silver, SNAF_BRIBE_SUM);
//		AI_Output		(self, hero,"Info_Mil_6_FOODGOOD_06_03"); //Das ist ein Wort! Halvor's Eintopf schmeckt zwar gut, aber er ist auch ziemlich teuer.
		AI_Output		(self, hero,"Info_Mil_6_FOODGOOD_06_03"); //To je slovo chlapa! Halvorův guláš chutná sice dobře, ale je také poměrně drahý.
		self.aivar[AIV_DEALDAY] = B_GetDay();

		Snaf_MilitiaBribed = Snaf_MilitiaBribed + 1;
		if	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
		{
			B_Snaf_NewCustomers();
		};
	}
	else
	{
		B_Say			(self, hero, "$NotEnoughSilver");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_6_JOIN (C_INFO)
{
	condition		= Infos_Mil_6_JOIN_Condition;
	information		= Infos_Mil_6_JOIN_Info;
//	description		= "Könnt ihr noch einen Mann gebrauchen?";
	description		= "Potřebujete dalšího muže?";
	permanent 		= TRUE;
};

FUNC int  Infos_Mil_6_JOIN_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_6_JOIN_Info()
{
//	AI_Output (other, self,"Infos_Mil_6_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?
	AI_Output (other, self,"Infos_Mil_6_JOIN_Info_15_01"); //Potřebujete dalšího muže?
	if (Militia_Answer == TRUE)
	&& (other.attribute [ATR_STRENGTH] >= 35)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_1H)>= 1)
	{
//		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_03"); //Ich glaube du bist soweit. Sprich mal mit Cassian. Einer Aufnahme steht wohl nichts mehr im Weg.
		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_03"); //Myslím, že jsi připraven. Promluv si s Cassianem. Tvému vstupu do našich řad nestojí nic v cestě.
	}
	else if (Militia_Answer == TRUE)
	&& ((other.attribute [ATR_STRENGTH] < 35)
	|| (Npc_GetTalentSkill (other, NPC_TALENT_1H)== 0) )
	{
//		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_04"); //Du bist noch nicht soweit. Sprich mit Leutnant Cassian , wenn du trainiert hast!
		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_04"); //Ještě nejsi připravený. Ještě trochu trénuj a potom si promluv s poručíkem Cassianem.
	}
	else if (Militia_Answer == FALSE)
	{
//		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_02"); //Natürlich. Gute Männer können wir immer gebrauchen. Die Frage ist, bist du gut?
		AI_Output (self, other,"Infos_Mil_6_JOIN_Info_06_02"); //Samozřejmě! Dobří chlapi se vždy hodí. Otázkou je, jsi dobrý?

		Info_ClearChoices (Infos_Mil_6_JOIN);

//		Info_AddChoice (Infos_Mil_6_JOIN,"Ich weiß es nicht",Infos_Mil_6_JOIN_DONTKNOW);
		Info_AddChoice (Infos_Mil_6_JOIN,"To nevím.",Infos_Mil_6_JOIN_DONTKNOW);
//		Info_AddChoice (Infos_Mil_6_JOIN,"Ich bin der Beste",Infos_Mil_6_JOIN_BEST);
		Info_AddChoice (Infos_Mil_6_JOIN,"Jsem nejlepší.",Infos_Mil_6_JOIN_BEST);
//		Info_AddChoice (Infos_Mil_6_JOIN,"Ich  bin verdammt gut",Infos_Mil_6_JOIN_DAMNGOOD);
		Info_AddChoice (Infos_Mil_6_JOIN,"Jsem zatracené dobrý.",Infos_Mil_6_JOIN_DAMNGOOD);
//		Info_AddChoice (Infos_Mil_6_JOIN,"Ich bin gut",Infos_Mil_6_JOIN_GOOD);
		Info_AddChoice (Infos_Mil_6_JOIN,"Jsem dobrý.",Infos_Mil_6_JOIN_GOOD);
	};

};

FUNC VOID Infos_Mil_6_JOIN_DONTKNOW()
{
//	AI_Output (other, self,"Infos_Mil_6_JOIN_DONTKNOW_Info_15_01"); //Ich weiß es nicht.
	AI_Output (other, self,"Infos_Mil_6_JOIN_DONTKNOW_Info_15_01"); //To nevím.
//	AI_Output (self, other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_02"); //Wenn du es nicht weißt, wer soll es dann wissen?
	AI_Output (self, other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_02"); //Když to nevíš ty, kdo by to měl vědět?
//	AI_Output (self, other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_03"); //Ist vielleicht besser, du trainierst noch ne Weile, bevor du uns beitrittst.
	AI_Output (self, other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_03"); //Možná by bylo dobré, kdybys ještě trošku trénoval.

	Info_ClearChoices (Infos_Mil_6_JOIN);
	Militia_Answer	= TRUE;
};
FUNC VOID Infos_Mil_6_JOIN_BEST()
{
//	AI_Output (other, self,"Infos_Mil_6_JOIN_BEST_Info_15_01"); 	//Ich bin der Beste.
	AI_Output (other, self,"Infos_Mil_6_JOIN_BEST_Info_15_01"); 	//Jsem nejlepší.
	//AI_Output (self, other,"Infos_Mil_6_JOIN_BEST_Info_06_02"); 	//Scheinst ja sehr von dir überzeugt zu sein. Dann wirst du ja auch alleine zurecht kommen.
	AI_Output (self, other,"Infos_Mil_6_JOIN_BEST_Info_06_02"); 	//Jsi dost sebevědomý. Tak to si určitě poradíš sám.

	Info_ClearChoices (Infos_Mil_6_JOIN);
	Militia_Answer	= TRUE;
};
FUNC VOID Infos_Mil_6_JOIN_DAMNGOOD()
{
//	AI_Output (other, self,"Infos_Mil_6_JOIN_DAMNGOOD_Info_15_01"); //Ich  bin verdammt gut.
	AI_Output (other, self,"Infos_Mil_6_JOIN_DAMNGOOD_Info_15_01"); //Jsem zatracené dobrý.
//	AI_Output (self, other,"Infos_Mil_6_JOIN_DAMNGOOD_Info_06_02"); //Das musst du auch sein, wenn du uns beitreten willst.
	AI_Output (self, other,"Infos_Mil_6_JOIN_DAMNGOOD_Info_06_02"); //To také musíš být, pokud se k nám chceš připojit.

	Info_ClearChoices (Infos_Mil_6_JOIN);
	Militia_Answer	= TRUE;
};
FUNC VOID Infos_Mil_6_JOIN_GOOD()
{
//	AI_Output (other, self,"Infos_Mil_6_JOIN_GOOD_Info_15_01"); //Ich bin gut.
//	AI_Output (self, other,"Infos_Mil_6_JOIN_GOOD_Info_06_02"); //Das wird sich noch zeigen. Sprich mal mit Cassian. Er wird entscheiden, ob du gut genug bist.
	AI_Output (other, self,"Infos_Mil_6_JOIN_GOOD_Info_15_01"); //Jsem dobrý.
	AI_Output (self, other,"Infos_Mil_6_JOIN_GOOD_Info_06_02"); //To se ještě uvidí. Promluv si s Cassianem. On rozhodne, jestli jsi dostatečně dobrý.

	Info_ClearChoices (Infos_Mil_6_JOIN);
	Militia_Answer	= TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_6_STORY (C_INFO)
{
	condition		= Infos_Mil_6_STORY_Condition;
	information		= Infos_Mil_6_STORY_Info;
	permanent	=	TRUE;
//	description		= "Erzähl mir was über die Orks";
	description		= "Pověz mi něco o skřetech.";
};

FUNC int  Infos_Mil_6_STORY_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_6_STORY_Info()
{
//	AI_Output (other, self,"Infos_Mil_6_STORY_Info_15_01"); //Erzähl mir was über die Orks
	AI_Output (other, self,"Infos_Mil_6_STORY_Info_15_01"); //Pověz mi něco o skřetech.
//	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_02"); //Sie haben an den Tal- Zugängen Stellung bezogen. Haben sich eingenistet wie die Ratten im Gemäuer.
	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_02"); //Obsadili vstupy do údolí. Hnízdí tam jako krysy ve zdech!
//	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_03"); //Haben alle Vorteile auf ihrer Seite. Möchte wetten das sie hinter den Bergen einen Haufen Feldlager errichtet haben.
	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_03"); //Všechny výhody jsou na jejich straně. Vsadím se, že za horami rozbili spoustu táborů.
//	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_04"); //Werden wohl ein paar hundert sein. Dreckige Bastarde.
	AI_Output (self, other,"Infos_Mil_6_STORY_Info_06_04"); //Bude jich tam pár stovek. Špinaví bastardi!
};

///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_6_BOSS (C_INFO)
{

	condition		= Infos_Mil_6_BOSS_Condition;
	information		= Infos_Mil_6_BOSS_Info;
	permanent	=	TRUE;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo to tu má na starost?";
};

FUNC int  Infos_Mil_6_BOSS_Condition()
{
	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);

	var C_NPC Cassian; Cassian 	 = Hlp_GetNpc (MIL_119_Cassian);

	if (Berengar.aivar[AIV_FINDABLE] == FALSE)
	|| (Cassian.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Mil_6_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Mil_6_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Mil_6_BOSS_Info_15_01"); //Kdo to tu má na starost?
//	AI_Output (self, other,"Infos_Mil_6_BOSS_Info_01_02"); //Hauptmann Berengar. Aber halt dich fern von ihm. Er mag keine aufdringlichen Typen! Leutnant Cassian ist für Typen wie dich zuständig!
	AI_Output (self, other,"Infos_Mil_6_BOSS_Info_01_02"); //Kapitán Berengar. Ale drž se od něj dál. Nemá rád ctižádostivé chlápky! Poručík Cassian má na starosti lidi, jako jsi ty!

	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Cassian; Cassian 	 = Hlp_GetNpc (MIL_119_Cassian);
	Cassian.aivar[AIV_FINDABLE] = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Zuweisung zum NPC
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AssignAmbientInfos_Mil_6(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);

	Infos_Mil_6_Exit.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_6_HI.npc		= Hlp_GetInstanceID (slf);
//	Infos_Mil_6_JOIN.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_6_STORY.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_6_BOSS.npc	= Hlp_GetInstanceID (slf);
	Info_Mil_6_FOODGOOD.npc		=	Hlp_GetInstanceID(slf);
};
