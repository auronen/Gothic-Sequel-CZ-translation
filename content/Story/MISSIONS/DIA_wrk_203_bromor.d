instance  WRK_203_Bromor_Exit (C_INFO)
{
	npc			=  WRK_203_Bromor;
	nr			=  999;
	condition	=  WRK_203_Bromor_Exit_Condition;
	information	=  WRK_203_Bromor_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  WRK_203_Bromor_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  WRK_203_Bromor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//------------------------------------------------------------------------------------
instance  WRK_203_Bromor_HI (C_INFO)
{
	npc				= WRK_203_Bromor;
	condition		= WRK_203_Bromor_HI_Condition;
	information		= WRK_203_Bromor_HI_Info;
//	description		= "Was machst du hier?";
	description		= "Co tu děláš?";
};

FUNC int  WRK_203_Bromor_HI_Condition()
{
	return TRUE;
};


FUNC void  WRK_203_Bromor_HI_Info()
{
//	AI_Output (other, self,"WRK_203_Bromor_HI_Info_15_01"); //Was machst du hier?
	AI_Output (other, self,"WRK_203_Bromor_HI_Info_15_01"); //Co tu děláš?
//	AI_Output (self, other,"WRK_203_Bromor_HI_Info_00_02"); //Ich bin der Baumeister. Ich muss mich um die Arbeiter und die Organisation kümmern.
	AI_Output (self, other,"WRK_203_Bromor_HI_Info_00_02"); //Jsem stavbyvedoucí. Musím dohlížet na dělníky a starat se o organizaci .
//	AI_Output (self, other,"WRK_203_Bromor_HI_Info_00_03"); //Zur Zeit arbeiten wir am Aussenwall. Das ist das Wichtigste. Suchst du Arbeit?
	AI_Output (self, other,"WRK_203_Bromor_HI_Info_00_03"); //Občas pracujeme na zdi. To je to nejdůležitější. Hledáš práci?

	Info_ClearChoices (WRK_203_Bromor_HI);
//	Info_AddChoice (WRK_203_Bromor_HI,"Nein, ich bin nur interessiert",WRK_203_Bromor_HI_NO);
	Info_AddChoice (WRK_203_Bromor_HI,"Ne, jen jsem zvědavý.",WRK_203_Bromor_HI_NO);
//	Info_AddChoice (WRK_203_Bromor_HI,"Ja, ich suche Arbeit",WRK_203_Bromor_HI_YES);
	Info_AddChoice (WRK_203_Bromor_HI,"Ano, hledám práci.",WRK_203_Bromor_HI_YES);
};
FUNC VOID WRK_203_Bromor_HI_YES()
{
//	AI_Output (other, self,"WRK_203_Bromor_HI_YES_Info_15_01"); //Ja, ich suche Arbeit.
	AI_Output (other, self,"WRK_203_Bromor_HI_YES_Info_15_01"); //Ano, hledám práci.
//	AI_Output (self, other,"WRK_203_Bromor_HI_YES_Info_00_02"); //Im Moment habe ich keine Arbeit für dich. Frag mal Diego. Oder die Jungs von der Miliz. So einen wie dich können die stimmt brauchen.
	AI_Output (self, other,"WRK_203_Bromor_HI_YES_Info_00_02"); //Momentálně pro tebe nic nemám. Zeptej se Diega. Nebo hochů od domobrany. Někdo jako ty se jim jistě bude hodit.
	Info_ClearChoices (WRK_203_Bromor_HI);
};
FUNC VOID WRK_203_Bromor_HI_NO()
{
//	AI_Output (other, self,"WRK_203_Bromor_HI_NO_Info_15_01"); //Nein, ich bin nur interessiert.
	AI_Output (other, self,"WRK_203_Bromor_HI_NO_Info_15_01"); //Ne, jsem jen zvědavý.
//	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_02"); //Als wir hier ankamen, lag das halbe Lager in Schutt und Asche.
	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_02"); //Když jsme sem přišli, ležela půlka tábora v prachu a popelu.
//	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_03"); //Aber wir haben nicht die Hände in den Schoß gelegt, sondern Material beschafft und losgelegt.
	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_03"); //Ale nezůstali jsme sedět s rukama v klíně, ale postarali jsme se o materiál a pustili se do práce.
//	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_04"); //Ja, wir haben schon eine ganze Menge geschafft.
	AI_Output (self, other,"WRK_203_Bromor_HI_NO_Info_00_04"); //Jo, dost jsme tu s tím pohnuli.
	Info_ClearChoices (WRK_203_Bromor_HI);
};
///////////////////////////////////////////////////////////////////////
//	Info HOW
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_HOW		(C_INFO)
{
	npc		 = 	WRK_203_Bromor;
	nr		 = 	12;
	condition	 = 	WRK_203_Bromor_HOW_Condition;
	information	 = 	WRK_203_Bromor_HOW_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wie kommt ihr voran?";
	description	 = 	"Jak se vám to daří?";
};

func int WRK_203_Bromor_HOW_Condition ()
{
	if	Npc_KnowsInfo(hero,WRK_203_Bromor_HI)
	{
		return TRUE;
	};
};
func void WRK_203_Bromor_HOW_Info ()
{
//	AI_Output			(hero, self, "WRK_203_HOW_15_01"); //Wie kommt ihr voran?
	AI_Output			(hero, self, "WRK_203_HOW_15_01"); //Jak se vám to daří?
//	AI_Output			(self, hero, "WRK_203_HOW_09_02"); //Es ist zum Kotzen! Wir hinken unserem Zeitplan um drei Wochen hinterher!
	AI_Output			(self, hero, "WRK_203_HOW_09_02"); //Jde to na pytel! Zaostáváme asi o tři týdny za plánem!
//	AI_Output			(self, hero, "WRK_203_HOW_09_03"); //Jedem Arbeiter muss ich genau sagen, was er machen soll, sonst bringen die es fertig und reissen den Wall ein, anstatt ihn aufzubauen!
	AI_Output			(self, hero, "WRK_203_HOW_09_03"); //Musím každému dělníkovi říkat, co má dělat, jinak to tu dodělají a místo, abychom zeď postavili, tak ji srovnáme se zemí!
//	AI_Output			(self, hero, "WRK_203_HOW_09_04"); //Die meisten hier halten mich für einen 'Sklaventreiber'. Aber die Arbeit muss gemacht werden und die Jungs arbeiten.
	AI_Output			(self, hero, "WRK_203_HOW_09_04"); //Většina z nich mě má za "otrokáře". Ale tu práci někdo udělat musí a to tihle hoši.
};

///////////////////////////////////////////////////////////////////////
//	Info TROPHYS
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_TROPHYS		(C_INFO)
{
	npc		 = 	WRK_203_Bromor;
	nr		 = 	23;
	condition	 = 	WRK_203_Bromor_TROPHYS_Condition;
	information	 = 	WRK_203_Bromor_TROPHYS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich hörte, du sammelst Trophäen?";
	description	 = 	"Slyšel jsem, že sbíráš trofeje..?";
};

func int WRK_203_Bromor_TROPHYS_Condition ()
{
	if Npc_KnowsInfo (hero, BEG_701_Jose_NEWS)
	{
		return TRUE;
	};
};
func void WRK_203_Bromor_TROPHYS_Info ()
{
//	AI_Output			(hero, self, "WRK_203_TROPHYS_15_01"); //Ich hörte, du sammelst Trophäen?
	AI_Output			(hero, self, "WRK_203_TROPHYS_15_01"); //Slyšel jsem, že sbíráš trofeje..?
//	AI_Output			(self, hero, "WRK_203_TROPHYS_09_02"); //Das stimmt. Aber nicht dieses Wolfs- und Scavenger Zeug. Davon habe ich schon genug.
	AI_Output			(self, hero, "WRK_203_TROPHYS_09_02"); //Ano, tak. Ale ne tyhle cetky z vlků nebo mrchožroutů. Těch už mám až dost.
//	AI_Output			(self, hero, "WRK_203_TROPHYS_09_03"); //Aber wenn du mir ein SchattenläuferHorn oder -Fell bringst, dafür zahle ich hundert Silberstücke!
	AI_Output			(self, hero, "WRK_203_TROPHYS_09_03"); //Ale kdybys mi přinesl roh nebo kůži stínové šelmy, dal bych ti za ně sto stříbrných!
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_TRADE		(C_INFO)
{
	npc		 = 	WRK_203_Bromor;
	nr		 = 	44;
	condition	 = 	WRK_203_Bromor_TRADE_Condition;
	information	 = 	WRK_203_Bromor_TRADE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich habe hier was für dich";
	description	 = 	"Něco tu pro tebe mám.";
};

func int WRK_203_Bromor_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero,WRK_203_Bromor_TROPHYS)
	&& ((Bromor_ShadowHorn == FALSE) || (Bromor_ShadowFur  == FALSE))
	&& ((Npc_HasItems (hero, ItAt_ShadowFur) >= 1) || (Npc_HasItems (hero, ItAt_ShadowHorn) >= 1))
	{
		return TRUE;
	};
};
func void WRK_203_Bromor_TRADE_Info ()
{
//	AI_Output			(hero, self, "WRK_203_TRADE_15_01"); //Ich habe hier was für dich.
	AI_Output			(hero, self, "WRK_203_TRADE_15_01"); //Něco tu pro tebe mám.

	if (Bromor_ShadowFur  == FALSE)
	{
		Info_AddChoice	(WRK_203_Bromor_TRADE, "Fell geben", WRK_203_Bromor_TRADE_FUR );
	};
	if (Bromor_ShadowHorn == FALSE)
	{
		Info_AddChoice	(WRK_203_Bromor_TRADE, "Horn geben", WRK_203_Bromor_TRADE_HORN );
	};

};
func void WRK_203_Bromor_TRADE_HORN ()
{
//	AI_Output			(hero, self, "WRK_203_TRADE_HORN_15_01"); //Hier ist das Horn eines Schattenläufers.
	AI_Output			(hero, self, "WRK_203_TRADE_HORN_15_01"); //Tady je roh stínové šelmy.
	B_GiveInvItems		(hero, self, ItAt_ShadowHorn,1);
//	AI_Output			(self, hero, "WRK_203_TRADE_HORN_09_02"); //Weißt du eigentlich, wie lange ich danach suche?
	AI_Output			(self, hero, "WRK_203_TRADE_HORN_09_02"); //Víš, jak už dlouho něco takového hledám?
//	AI_Output			(self, hero, "WRK_203_TRADE_HORN_09_03"); //Hier ist dein Silber, du hast es dir verdient!
	AI_Output			(self, hero, "WRK_203_TRADE_HORN_09_03"); //Tady máš svoje stříbro, vydělal sis ho!
	B_GiveInvItems		(self, hero, ItMi_Silver,100);
	Bromor_ShadowHorn = TRUE;
};

func void WRK_203_Bromor_TRADE_FUR ()
{
//	AI_Output			(hero, self, "WRK_203_TRADE_FUR_15_01"); //Ich habe hier das Fell eines Schattenläufers.
	AI_Output			(hero, self, "WRK_203_TRADE_FUR_15_01"); //Mám tady kůži stínové šelmy.
	B_GiveInvItems		(hero, self, ItAt_ShadowFur,1);
//	AI_Output			(self, hero, "WRK_203_TRADE_FUR_09_02"); //Ausgezeichnet. Dann sollst du auch dein Silber bekommen.
	AI_Output			(self, hero, "WRK_203_TRADE_FUR_09_02"); //Výtečně. Taky za to dostaneš svoje stříbro.
	B_GiveInvItems		(self, hero, ItMi_Silver,100);
	Bromor_ShadowFur = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RASSMUSON
///////////////////////////////////////////////////////////////////////
instance WRK_203_Bromor_RASSMUSON		(C_INFO)
{
	npc		 	 = 	WRK_203_Bromor;
	nr		 	 = 	12;
	condition	 = 	WRK_203_Bromor_RASSMUSON_Condition;
	information	 = 	WRK_203_Bromor_RASSMUSON_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Rassmuson will abhauen!";
	description	 = 	"Rassmuson toho chce nechat!";
};

func int WRK_203_Bromor_RASSMUSON_Condition ()
{
	if (Knows_Rassmuson == TRUE)
	|| Npc_KnowsInfo (hero,Wrk_212_Rassmuson_HI)
	{
		return TRUE;
	};
};
func void WRK_203_Bromor_RASSMUSON_Info ()
{
//	AI_Output			(hero, self, "WRK_203_RASSMUSON_15_01"); //Rassmuson will abhauen!
	AI_Output			(hero, self, "WRK_203_RASSMUSON_15_01"); //Rassmuson toho chce nechat!
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_02"); //Warum erzähslt du mir das? Willst du dich mit mir gut stellen?
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_02"); //Proč mi to jako říkáš? To se mnou chceš dobře vycházet?
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_03"); //Glaubst du etwa, ich sehe nicht, das er nicht arbeitet?
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_03"); //Myslíš si snad, že nevidím, že nepracuje?
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_04"); //Hast du geglaubt, ich würde dich belohnen, wenn du mir das erzählst?
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_04"); //Myslel sis snad, že tě odměním, když mi tohle řekneš?
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_05"); //Manche nennen mich einen Sklaventreiber. Vielleicht bin ich manchmal zu hart mit den Jungs.
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_05"); //Někteří mi říkají otrokář. Možná že jsem na hochy poněkud tvrdý.
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_06"); //Aber Typen wie du, bringen mich zum Kotzen! Du hast keinen Anstand, kein Ehrgefühl und keinen Stolz.
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_06"); //Ale z lidí jako ty mi je na blití! Nemáš v sobě kousek cti, důstojnosti ani slušnosti.
//	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_07"); //Geh mir aus den Augen, du schmieriger Wicht!
	AI_Output			(self, hero, "WRK_203_RASSMUSON_09_07"); //Jdi mi z očí, ty parchante hnusnej!

	B_SetAttitude		(self,ATT_ANGRY);
};
