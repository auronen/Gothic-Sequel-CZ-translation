///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_Exit (C_INFO)
{
	npc			=  THF_400_Edo;
	nr			=  999;
	condition	=  Info_Edo_Exit_Condition;
	information	=  Info_Edo_Exit_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Edo_Exit_Condition()
{
	return TRUE;
};

func void	Info_Edo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};









//#####################################################################
//##
//##
//##						KAPITEL 7
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance THF_400_Edo_HOWDY		(C_INFO)
{
	npc		 = 	THF_400_Edo;
	condition	 = 	THF_400_Edo_HOWDY_Condition;
	information	 = 	THF_400_Edo_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was tust du den ganzen Tag?";
	description	 = 	"Co děláš celý den?";
};

func int THF_400_Edo_HOWDY_Condition ()
{
	if	(Npc_GetDistToWP(self, EDO_WP_SELL) > 300)
	{
		return TRUE;
	};
};

func void THF_400_Edo_HOWDY_Info ()
{
//	AI_Output			(hero, self, "THF_400_HOWDY_15_01"); //Was tust du den ganzen Tag?
	AI_Output			(hero, self, "THF_400_HOWDY_15_01"); //Co děláš celý den?
//	AI_Output			(self, hero, "THF_400_HOWDY_00_02"); //Ich geniese die Sonne, wenn sie dann mal schient!
	AI_Output			(self, hero, "THF_400_HOWDY_00_02"); //Užívám si slunce, když svítí!
//	AI_Output			(self, hero, "THF_400_HOWDY_00_03"); //Ansonsten bin ich bemüht, mich nicht zu überanstrengen!
	AI_Output			(self, hero, "THF_400_HOWDY_00_03"); //Jinak se snažím se nepřepínat!
//	AI_Output			(hero, self, "THF_400_HOWDY_15_04"); //Ja das sehe ich!
	AI_Output			(hero, self, "THF_400_HOWDY_15_04"); //Jo, to vidím!
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info ORE
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_ORE (C_INFO)
{
	npc				= THF_400_Edo;
	condition		= Info_Edo_ORE_Condition;
	information		= Info_Edo_ORE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ich komme gerade von Gotmar...";
	description		= "Přicházím přímo od Gotmara...";
};

func int	Info_Edo_ORE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gotmar_WHEREORE)
	{
		return TRUE;
	};
};

func void	Info_Edo_ORE_Info()
{
//	AI_Output			(hero, self,"Info_Edo_ORE_15_01"); //Ich komme gerade von Gotmar...
	AI_Output			(hero, self,"Info_Edo_ORE_15_01"); //Přicházím přímo od Gotmara...
//	AI_Output			(self, hero,"Info_Edo_ORE_00_02"); //So? Was will denn dieser Wichtigtuer von einem Schmied?
	AI_Output			(self, hero,"Info_Edo_ORE_00_02"); //A? Co chce ten nafoukaný kovář?
//	AI_Output			(hero, self,"Info_Edo_ORE_15_03"); //Er sagt, du hättest Erz von ihm gestohlen!
	AI_Output			(hero, self,"Info_Edo_ORE_15_03"); //Říká, že máš jeho rudu!
	AI_StandUp			(self);
	B_DrawWeapon		(self, hero);
	AI_TurnToNpc		(self, hero);
//	AI_Output			(self, hero,"Info_Edo_ORE_00_04"); //WAAAS??? Du nennst mich eine Dieb???
	AI_Output			(self, hero,"Info_Edo_ORE_00_04"); //CO? Ty tvrdíš, že jsem zloděj?

	Info_ClearChoices	(Info_Edo_ORE);
//	Info_AddChoice		(Info_Edo_ORE,	"Bist Du denn einer?",		Info_Edo_ORESTOLENYOU);
	Info_AddChoice		(Info_Edo_ORE,	"A jsi?",					Info_Edo_ORESTOLENYOU);
//	Info_AddChoice		(Info_Edo_ORE,	"Nein, Gotmar tut das!",	Info_Edo_ORESTOLENNO);
	Info_AddChoice		(Info_Edo_ORE,	"Ne, to Gotmar!",			Info_Edo_ORESTOLENNO);
//	Info_AddChoice		(Info_Edo_ORE,	"Ja! Was dagegen?",			Info_Edo_ORESTOLENYES);
	Info_AddChoice		(Info_Edo_ORE,	"Ano! Co s tím?",			Info_Edo_ORESTOLENYES);
};

func void Info_Edo_ORESTOLENYOU ()
{
//	AI_Output			(hero, self,"Info_Edo_ORESTOLENYOU_15_01"); //Bist Du denn einer?
	AI_Output			(hero, self,"Info_Edo_ORESTOLENYOU_15_01"); //A jsi?
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_02"); //HUA, HUA, HUA,...... du gefällst mir. Bist nicht auf den Kopf gefallen.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_02"); //HA, HA, HA,..... ty se mi líbíš. Nejsi padlý na hlavu.
	B_RemoveWeapon		(self);
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_03"); //(leiser) So ganz unter uns: Dieb zu sein ist eine Ehre, nur reagieren die anderen hier etwas allergisch auf dieses Thema.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_03"); //(potichu) Jen tak mezi námi: Být zlodějem je velká čest, jen ostatní na to tady v táboře reagují celkem alergicky.
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_04"); //Also behalt ich das lieber für mich. Die meisten streberhaften Handwerker hier verstehen einfach nicht, wie man WIRKLICH lebt.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_04"); //TAkže si to raději nechávám pro sebe. Většina zdejších hloupých řemeslníků nechápe, jak se dá SKUTEČNĚ žít.
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_05"); //Haben immer nur arbeiten im Kopf.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_05"); //Pořád myslí jen na práci.
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_06"); //Ich verrat dir was: Wenn Du an billige Waren kommen willst, dann frage mich danach. Ich habe eine große Auswahl an Dingen aller Art.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_06"); //Něco ti řeknu: Pokud chceš získat levné zboží, stačí se zeptat. Mám docela širokou nabídku zboží všeho druhu.
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_07"); //(unschuldig) Sind ähem... gebrauchte Dinge. Ihre Vorbesitzter haben sie irgendwann mal... verloren.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_07"); //(nevinně) Je to... ehm... použité zboží. Jednoho dne prostě ztratili svého původního majitele... 
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_08"); //Also dachte ich mir, bevor sie keiner haben will...
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYOU_00_08"); //Tak jsem si pomyslel, když je nikdo nechce...

	Info_ClearChoices	(Info_Edo_ORE);

	Edo_IsDealer		= TRUE;
};

func void Info_Edo_ORESTOLENNO ()
{
	Info_ClearChoices	(Info_Edo_ORE);
//	AI_Output			(hero, self,"Info_Edo_ORESTOLENNO_15_01"); //Nein, Gotmar tut das!
	AI_Output			(hero, self,"Info_Edo_ORESTOLENNO_15_01"); //Ne, to Gotmar!
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENNO_00_02"); //Sooooo. Dann richte Gotmar aus, dass er besser aufpassen soll, was er herumerzählt. Hier im Lager können schreckliche Unfälle passiere, vor allem nachts...
	AI_Output			(self, hero,"Info_Edo_ORESTOLENNO_00_02"); //Ták. Pak vyřiď Gotmarovi, že by měl být opatrnější na to, co vypráví lidem. Tady v táboře se může stát kdejaká nehoda. Hlavně v noci...
	B_RemoveWeapon		(self);

	Gotmar_SCBetrayed	= TRUE;
};

func void Info_Edo_ORESTOLENYES ()
{
	Info_ClearChoices	(Info_Edo_ORE);
//	AI_Output			(hero, self,"Info_Edo_ORESTOLENYES_15_01"); //Ja! Was dagegen?
	AI_Output			(hero, self,"Info_Edo_ORESTOLENYES_15_01"); //Ano! Co s tím?
//	AI_Output			(self, hero,"Info_Edo_ORESTOLENYES_00_02"); //Na warte, dir werde ich deine Beleidigungen aus der Birne prügeln.
	AI_Output			(self, hero,"Info_Edo_ORESTOLENYES_00_02"); //No počkej, však já ty urážky z tebe vymlátím.

	AI_StopProcessInfos	(self);
	B_ChangeGuild		(THF_400_Edo, GIL_NONE);
	B_AttackProper		(self, hero);

	Edo_CalledThief		= TRUE;
};






///////////////////////////////////////////////////////////////////////
//	Info DEALOUTSIDE
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_DEALOUTSIDE (C_INFO)
{
	npc				= THF_400_Edo;
	condition		= Info_Edo_DEALOUTSIDE_Condition;
	information		= Info_Edo_DEALOUTSIDE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich bin an deinen... gefundenen... Sachen interessiert.";
	description		= "Zajímají mě tvé... nalezené...věci.";
	trade			= TRUE;
};

func int	Info_Edo_DEALOUTSIDE_Condition()
{
	if	Edo_IsDealer
	&&	(Npc_GetDistToWP(self, EDO_WP_SELL) > 300)
	{
		return TRUE;
	};
};

func void	Info_Edo_DEALOUTSIDE_Info()
{
//	AI_Output				(hero, self,"Info_Edo_DEALOUTSIDE_15_01"); //Ich bin an deinen... gefundenen... Sachen interessiert.
	AI_Output				(hero, self,"Info_Edo_DEALOUTSIDE_15_01"); //Zajímají mě tvé... nalezené...věci.
//	AI_Output				(self, hero,"Info_Edo_DEALOUTSIDE_00_02"); //PSSST, nicht so laut!!!
	AI_Output				(self, hero,"Info_Edo_DEALOUTSIDE_00_02"); //PŠŠT! Ne tak nahlas!
//	AI_Output				(self, hero,"Info_Edo_DEALOUTSIDE_00_03"); //Los komm mit!
	AI_Output				(self, hero,"Info_Edo_DEALOUTSIDE_00_03"); //Pojď za mnou!

	TA_BeginOverlay			(self);
	TA_Stay					(00,00,00,15,EDO_WP_SELL);
	TA_EndOverlay			(self);

	//Npc_ExchangeRoutine		(self, "DEAL");
	AI_StopProcessInfos		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DEALINSIDE
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_DEALINSIDE (C_INFO)
{
	npc				= THF_400_Edo;
	condition		= Info_Edo_DEALINSIDE_Condition;
	information		= Info_Edo_DEALINSIDE_Info;
	important		= FALSE;
	permanent		= TRUE;
	trade			= TRUE;
//	description		= "OK, nun zeig mir deine... gefundenen... Sachen.";
	description		= "OK, tak mi ty věci ukaž.";
};

func int	Info_Edo_DEALINSIDE_Condition()
{
	if	Edo_IsDealer
	&&	(Npc_GetDistToWP(self, EDO_WP_SELL) <= 300)
	{
		return TRUE;
	};
};

func void	Info_Edo_DEALINSIDE_Info()
{
//	AI_Output				(hero, self,"Info_Edo_DEALINSIDE_15_01"); //OK, nun zeig mir deine... gefundenen... Sachen.
	AI_Output				(hero, self,"Info_Edo_DEALINSIDE_15_01"); //OK, tak mi ty věci ukaž.
//	AI_Output				(self, hero,"Info_Edo_DEALINSIDE_00_02"); //Klar, aber halt da draußen die Klappe darüber!
	AI_Output				(self, hero,"Info_Edo_DEALINSIDE_00_02"); //Jasně, ale venku o tom ani slovo!

	//Npc_ExchangeRoutine		(self, "START");
};


///////////////////////////////////////////////////////////////////////
//	Info VICTORY
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_VICTORY (C_INFO)
{
	npc				= THF_400_Edo;
	condition		= Info_Edo_VICTORY_Condition;
	information		= Info_Edo_VICTORY_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "JETZT was dagegen, dass ich dich einen Dieb nenne?";
	description		= "Tak TEĎ už ti nevadí, když ti říkám, že jsi zloděj?";
};

func int	Info_Edo_VICTORY_Condition()
{
	if	Edo_CalledThief
	&&	self.aivar[AIV_WASDEFEATEDBYSC]
	{
		return TRUE;
	};
};

func void	Info_Edo_VICTORY_Info()
{
//	AI_Output			(hero, self,"Info_Edo_VICTORY_15_01"); //JETZT was dagegen, dass ich dich einen Dieb nenne?
	AI_Output			(hero, self,"Info_Edo_VICTORY_15_01"); //Tak TEĎ už ti nevadí, když ti říkám, že jsi zloděj?
//	AI_Output			(self, hero,"Info_Edo_VICTORY_00_02"); //(ängstlich) Beruhig dich! Das war doch nur wegen der anderen hier?
	AI_Output			(self, hero,"Info_Edo_VICTORY_00_02"); //(naštvaně) Zklidni se! To bylo jen kvůli těm ostatním?
//	AI_Output			(hero, self,"Info_Edo_VICTORY_15_03"); //Hast du nun Gotmars Erz oder nicht?
	AI_Output			(hero, self,"Info_Edo_VICTORY_15_03"); //Máš tu Gotmarovu rudu nebo ne?
//	AI_Output			(self, hero,"Info_Edo_VICTORY_00_04"); //(ängstlich) Hier nimm es! Ich wusste von Anfang an, dass es mir Unglück bringen würde.
	AI_Output			(self, hero,"Info_Edo_VICTORY_00_04"); //(naštvaně) Tady, vezmi si ji! Věděl jsem od začátku, že mi přinese smůlu.

	B_ChangeGuild		(THF_400_Edo, GIL_THIEF);		// Rücksetzen von Info_Edo_ORESTOLENYES()
	B_GiveInvItems		(self, hero, ItMi_OreNugget, Edo_StolenOre);
};

///////////////////////////////////////////////////////////////////////
//	Info DEFEAT
///////////////////////////////////////////////////////////////////////
instance	Info_Edo_DEFEAT (C_INFO)
{
	npc				= THF_400_Edo;
	condition		= Info_Edo_DEFEAT_Condition;
	information		= Info_Edo_DEFEAT_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Kann ich denn Erz von dir ...KAUFEN?";
	description		= "Mohu od tebe tu rudu... KOUPIT?";
};

func int	Info_Edo_DEFEAT_Condition()
{
	if	Edo_CalledThief
	&&	self.aivar[AIV_HASDEFEATEDSC]
	{
		return TRUE;
	};
};

func void	Info_Edo_DEFEAT_Info()
{
//	AI_Output			(hero, self,"Info_Edo_DEFEAT_15_01"); //Kann ich denn Erz von dir ...KAUFEN?
	AI_Output			(hero, self,"Info_Edo_DEFEAT_15_01"); //Mohu od tebe tu rudu... KOUPIT?
//	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_02"); //Du hast ganz schön Mut mich DA-nach wieder anzusprechen, ha, ha, ha!
	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_02"); //Máš hodně odvahy, po tom všem se mnou mluvit, ha, ha, ha!
//	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_03"); //(leiser) Pass auf, ich kann dir alle möglichen Waren verkaufen.
	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_03"); //(tiše) Poslouchej, mohu ti prodat všechny možné druhy zboží.
//	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_04"); //Hab sozusagen ein gutes Sortiment auf Lager.
	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_04"); //Mám celkem široký výběr.
//	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_05"); //Alles Dinge, die ich irgendwo mal ...gefunden... habe. Deshalb sind sie auch so preiswert.
	AI_Output			(self, hero,"Info_Edo_DEFEAT_00_05"); //Všechno jsou to věci, které jsem... někde našel. Proto jsou tak levné.

	Edo_IsDealer = TRUE;
	B_ChangeGuild		(THF_400_Edo, GIL_THIEF);		// Rücksetzen von Info_Edo_ORESTOLENYES()
};






