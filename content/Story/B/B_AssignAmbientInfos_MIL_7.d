///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_7_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Mil_7_Exit_Condition;
	information	=  Infos_Mil_7_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Mil_7_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Mil_7_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_7_HI (C_INFO)
{
	condition		= Infos_Mil_7_HI_Condition;
	information		= Infos_Mil_7_HI_Info;
	permanent	=  TRUE;
//	description		= "Wie läufts?";
	description		= "Jak to jde?";
};

FUNC int  Infos_Mil_7_HI_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_7_HI_Info()
{
//	AI_Output (other, self,"Infos_Mil_7_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Mil_7_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Mil_7_HI_Info_07_02"); //(ärgerlich) Wie läuft was? Hast du nichts zu tun? Dann such dir Arbeit! Es gibt mehr als genug zu tun!
	AI_Output (self, other,"Infos_Mil_7_HI_Info_07_02"); //(naštvaně) Jak CO jde? Nemáš co na práci? Tak si nějakou najdi! Práce tu máme až nad hlavu!

	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance	Info_Mil_7_FOODGOOD (C_INFO)
{
	condition		= Info_Mil_7_FOODGOOD_Condition;
	information		= Info_Mil_7_FOODGOOD_Info;
	permanent		=  TRUE;
//	description		= "Du bist sicher, dass du Halvor's Frass hier essen willst?";
	description		= "Jsi si jistý, že chceš jíst Halvorovo jídlo?";
};

func int	Info_Mil_7_FOODGOOD_Condition()
{
	if	B_LunchTimeAtHalvors()
	&&	(self.aivar[AIV_DEALDAY] < B_GetDay())
	&&	Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF)
	{
		return TRUE;
	};
};

func void	Info_Mil_7_FOODGOOD_Info()
{
//	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_01"); //Du bist sicher, dass du Halvor's Frass hier essen willst?
	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_01"); //Jsi si jistý, že chceš jíst Halvorovo jídlo?
//	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_02"); //Ähh... warum, was ist damit!
	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_02"); //Ahh... proč, co s ním je?
//	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_03"); //(konspirativ) Was meinst du wohl WAS für ein Fleisch in diesem Eintopf ist?
	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_03"); //(spiklenecky) Co myslíš, jaké maso je v tom guláši?
//	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_04"); //(irritiert) Ich habe nie danach gefragt?
	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_04"); //(podražděně) Na to jsem se nikdy neptal?
//	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_05"); //(konspirativ) HAST Du dich jemals gefragt, warum im Aussätzigenlager zwar immer neue Leute ankommen, ab es dort trotzdem nicht voller wird?
	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_05"); //(spiklenecky) Přemýšlel jsi někdy o tom, proč do čtvrti nemocných stále přichází noví lide, ale přesto není nikdy plná?
//	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_06"); //Du meinst doch nicht etwa....
	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_06"); //Snad nemyslíš...
//	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_07"); //(unschuldig) Ich habe nichts gesagt! Aber bei Snaf, kann dir sowas nicht passieren!
	AI_Output			(hero, self,"Info_Mil_7_FOODGOOD_15_07"); //(nevinně) Já jsem nic neřekl! Ale u Snafa by se nikdy nic takového nestalo!
//	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_08"); //Was für eine Sauerei! Hätte ich Halvor nicht zugetraut. Bei ihm esse ich jedenfalls nicht mehr!
	AI_Output			(self, hero,"Info_Mil_7_FOODGOOD_07_08"); //Takový nepořádek! Halvorovi jsem nevěřil. V každém případě už u něj nebudu jíst!

	self.aivar[AIV_DEALDAY] = B_GetDay();

	Snaf_MilitiaFrightened = Snaf_MilitiaFrightened + 1;
	if	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
	{
		B_Snaf_NewCustomers();
	};
};


///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_7_JOIN (C_INFO)
{
	condition		= Infos_Mil_7_JOIN_Condition;
	information		= Infos_Mil_7_JOIN_Info;
	permanent		=  TRUE;
//	description		= "Könnt ihr noch einen Mann gebrauchen?";
	description		= "Potřebujete dalšího muže?";
};

FUNC int  Infos_Mil_7_JOIN_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_7_JOIN_Info()
{
//	AI_Output (other, self,"Infos_Mil_4_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?
	AI_Output (other, self,"Infos_Mil_4_JOIN_Info_15_01"); //Potřebujete dalšího muže?
//	AI_Output (self, other,"Infos_Mil_4_JOIN_Info_07_02"); //Du willst zur Miliz? Das kannst du direkt vergessen! Wir nehmen nur fähige Kämpfer auf.
	AI_Output (self, other,"Infos_Mil_4_JOIN_Info_07_02"); //Ty se chceš přidat k milici? Na to můžeš rovnou zapomenout! Přijímáme pouze schopné bojovníky.
};
///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_7_STORY (C_INFO)
{
	condition		= Infos_Mil_7_STORY_Condition;
	information		= Infos_Mil_7_STORY_Info;
	permanent		=  TRUE;
//	description		= "Erzähl mir was über die Orks";
	description		= "Řekni mi něco o skřetech.";
};

FUNC int  Infos_Mil_7_STORY_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_7_STORY_Info()
{
//	AI_Output (other, self,"Infos_Mil_7_STORY_ORK_Info_15_01"); //Erzähl mir was über die Orks.
	AI_Output (other, self,"Infos_Mil_7_STORY_ORK_Info_15_01"); //Řekni mi něco o skřetech.
//	AI_Output (self, other,"Infos_Mil_7_STORY_ORK_Info_07_02"); //Die Orks haben alle Armeen des Königs aufgrieben. Sie haben alles niedergewalzt was ihnen im Weg stand.
	AI_Output (self, other,"Infos_Mil_7_STORY_ORK_Info_07_02"); //Skřeti porazili všechna královská vojska. Zničili všechno, co jim stálo v cestě.
//	AI_Output (self, other,"Infos_Mil_7_STORY_ORK_Info_07_03"); //Jetzt lassen sie uns noch ein wenig zappeln und dann sind auch wir dran!
	AI_Output (self, other,"Infos_Mil_7_STORY_ORK_Info_07_03"); //Teď nás nechají se trošku cukat a potom jsme na řadě!
};
///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_7_BOSS (C_INFO)
{

	condition		= Infos_Mil_7_BOSS_Condition;
	information		= Infos_Mil_7_BOSS_Info;
	permanent		=  TRUE;
//	description		= "Wer hat bei euch das Sagen?";
	description		= "Kdo vás má na starosti?";
};

FUNC int  Infos_Mil_7_BOSS_Condition()
{
	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);

	var C_NPC Brutus; Brutus = Hlp_GetNpc (MIL_121_Brutus);

	if (Berengar.aivar[AIV_FINDABLE] == FALSE)
	|| (Brutus.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Mil_7_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Mil_7_BOSS_Info_15_01"); //Wer hat bei euch  das Sagen?
	AI_Output (other, self,"Infos_Mil_7_BOSS_Info_15_01"); //Kdo vás má na starosti?
//	AI_Output (self, other,"Infos_Mil_7_BOSS_Info_07_02"); //Berengar, der Hauptmann. Aber mit jemanden wie dir wird er nicht reden. Ihm untersteht Leutnant Brutus.
	AI_Output (self, other,"Infos_Mil_7_BOSS_Info_07_02"); //Kapitán Berengar. Ale nebude mluvit s někým, jako jsi ty. Jeho podřízeným je poručík Brutus.

	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Brutus; Brutus = Hlp_GetNpc (MIL_121_Brutus);
	Brutus.aivar[AIV_FINDABLE] = TRUE;


};



///////////////////////////////////////////////////////////////////////
//	Zuweisung der Infos zum NSC
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AssignAmbientInfos_Mil_7(var c_NPC slf)// Sadist
{
	B_AssignFindNpc_WRK (slf);

	Infos_Mil_7_Exit.npc	= Hlp_GetInstanceID(slf);
	Infos_Mil_7_HI.npc		= Hlp_GetInstanceID(slf);
	//Infos_Mil_7_JOIN.npc	= Hlp_GetInstanceID(slf);
	Infos_Mil_7_STORY.npc	= Hlp_GetInstanceID(slf);
	Infos_Mil_7_BOSS.npc	= Hlp_GetInstanceID(slf);
	Info_Mil_7_FOODGOOD.npc	= Hlp_GetInstanceID(slf);
};