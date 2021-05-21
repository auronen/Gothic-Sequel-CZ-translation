instance  BEG_704_Lakarus_Exit (C_INFO)
{
	npc			=  BEG_704_Lakarus;
	nr			=  999;
	condition	=  BEG_704_Lakarus_Exit_Condition;
	information	=  BEG_704_Lakarus_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  BEG_704_Lakarus_Exit_Condition()
{
	return 1;
};

FUNC VOID  BEG_704_Lakarus_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_HI		(C_INFO)
{
	npc		 = 	BEG_704_Lakarus;
	nr		 = 	1;
	condition	 = 	BEG_704_Lakarus_HI_Condition;
	information	 = 	BEG_704_Lakarus_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tu děláš?";
};

func int BEG_704_Lakarus_HI_Condition ()
{
	return TRUE;
};

func void BEG_704_Lakarus_HI_Info ()
{
//	AI_Output			(hero, self, "BEG_704_HI_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "BEG_704_HI_15_01"); //Co tu děláš?
//	AI_Output			(self, hero, "BEG_704_HI_00_02"); //Ich verkaufe Sumpfkraut. Schönes frisches Sumpfkraut.
	AI_Output			(self, hero, "BEG_704_HI_00_02"); //Prodávám trávu z bažin. Krásnou, čerstvou trávu z bažin

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC, "Einer der Bettler mit Namen Lakarus verkauft SUMPFKRAUT auf dem Arenaplatz.");
	B_LogEntry			(GE_TraderOC, "Jeden z žebráků, Lakarus, prodává poblíž arény TRÁVU Z BAŽIN.");
};

///////////////////////////////////////////////////////////////////////
//	Info WHATHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_WHATHERB		(C_INFO)
{
	npc		 = 	BEG_704_Lakarus;
	nr		 = 	2;
	condition	 = 	BEG_704_Lakarus_WHATHERB_Condition;
	information	 = 	BEG_704_Lakarus_WHATHERB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was kann ich mit Sumpfkraut machen?";
	description	 = 	"Co se dá dělat s trávou z bažin?";
};

func int BEG_704_Lakarus_WHATHERB_Condition ()
{
	if Npc_KnowsInfo (hero,BEG_704_Lakarus_HI)
	{
		return TRUE;
	};
};
func void BEG_704_Lakarus_WHATHERB_Info ()
{
//	AI_Output			(hero, self, "BEG_704_WHATHERB_15_01"); //Was kann ich mit Sumpfkraut machen?
	AI_Output			(hero, self, "BEG_704_WHATHERB_15_01"); //Co se dá dělat s trávou z bažin?
//	AI_Output			(self, hero, "BEG_704_WHATHERB_00_02"); //Du kannst es rauchen. Entweder unbehandelt in eine Wasserpfeife stopfen oder stampfen, drehen und dann rauchen.
	AI_Output			(self, hero, "BEG_704_WHATHERB_00_02"); //Můžeš ji kouřit. Buď ji dáš do vodní dýmky, nebo ji nadrtíš, usušíš, a pak vykouříš.
//	AI_Output			(self, hero, "BEG_704_WHATHERB_00_03"); //Es gibt nichst vergleichbares, das dich so entspannt und beruhigt. Du solltest es unbedingt probieren.
	AI_Output			(self, hero, "BEG_704_WHATHERB_00_03"); //Nic jiného tě tak neuvolní a neuklidní. Rozhodně bys to měl vyzkoušet.
};
///////////////////////////////////////////////////////////////////////
//	Info TRADEHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_TRADEHERB		(C_INFO)
{
	npc		 = 	BEG_704_Lakarus;
	nr		 = 	5;
	condition	 = 	BEG_704_Lakarus_TRADEHERB_Condition;
	information	 = 	BEG_704_Lakarus_TRADEHERB_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	trade		 =  TRUE;
//	description	 = 	"Zeig mir deine Ware";
	description	 = 	"Ukaž mi své zboží";
};

func int BEG_704_Lakarus_TRADEHERB_Condition ()
{
	if Npc_KnowsInfo (hero,BEG_704_Lakarus_HI)
	{
		return TRUE;
	};
};

func void BEG_704_Lakarus_TRADEHERB_Info ()
{
//	AI_Output			(hero, self, "BEG_704_TRADEHERB_15_01"); //Zeig mir deine Ware
	AI_Output			(hero, self, "BEG_704_TRADEHERB_15_01"); //Ukaž mi své zboží
//	AI_Output			(self, hero, "BEG_704_TRADEHERB_00_02"); //Bei mir bekommst du nur frische Ware.
	AI_Output			(self, hero, "BEG_704_TRADEHERB_00_02"); //U mě dostaneš jenom čerstvé zboží.
};

///////////////////////////////////////////////////////////////////////
//	Info WHEREHERB
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_WHEREHERB		(C_INFO)
{
	npc		 = 	BEG_704_Lakarus;
	nr		 = 	33;
	condition	 = 	BEG_704_Lakarus_WHEREHERB_Condition;
	information	 = 	BEG_704_Lakarus_WHEREHERB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Woher bekommst du das Sumpfkraut?";
	description	 = 	"Odkud bereš trávu z bažin?";
};

func int BEG_704_Lakarus_WHEREHERB_Condition ()
{
	if Npc_KnowsInfo (hero,BEG_704_Lakarus_HI)
	{
		return TRUE;
	};
};

func void BEG_704_Lakarus_WHEREHERB_Info ()
{
//	AI_Output			(hero, self, "BEG_704_WHEREHERB_15_01"); //Woher bekommst du das Sumpfkraut?
	AI_Output			(hero, self, "BEG_704_WHEREHERB_15_01"); //Odkud bereš trávu z bažin?
//	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_02"); //Wie der Name schon sagt wächst es nur im Sumpf. Aber ich bin nicht so wahnsinnig und gehe in dorthin.
	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_02"); //Jak napovídá název, roste jenom v bažinách. Ale nejsem tak šílený, abych tam sám šel.
//	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_03"); //Niemand der klaren Verstandes ist geht dorthin. Nur ein paar Jäger trauen sich in die Sumpfgebiete.
	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_03"); //Nikdo rozumný by tam nešel. Jenom pár lovců se do těch bažin odváží.
//	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_04"); //Die Jäger kommen ab und zu ins Lager. Und von denen kaufe ich das Kraut.
	AI_Output			(self, hero, "BEG_704_WHEREHERB_00_04"); //Ti lovci se občas staví v táboře. A od nich tu trávu kupuju.
};
///////////////////////////////////////////////////////////////////////
//	Info SWAMP
///////////////////////////////////////////////////////////////////////
instance BEG_704_Lakarus_SWAMP		(C_INFO)
{
	npc		 = 	BEG_704_Lakarus;
	nr		 = 	22;
	condition	 = 	BEG_704_Lakarus_SWAMP_Condition;
	information	 = 	BEG_704_Lakarus_SWAMP_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Warum ist es im Sumpf so gefährlich?";
	description	 = 	"Proč je to v bažině tak nebezpečné?";
};

func int BEG_704_Lakarus_SWAMP_Condition ()
{
	if Npc_KnowsInfo (hero,BEG_704_Lakarus_WHEREHERB)
	{
		return TRUE;
	};
};
func void BEG_704_Lakarus_SWAMP_Info ()
{
//	AI_Output			(hero, self, "BEG_704_SWAMP_15_01"); //Warum ist es im Sumpf so gefährlich?
	AI_Output			(hero, self, "BEG_704_SWAMP_15_01"); //Proč je to v bažině tak nebezpečné?
//	AI_Output			(self, hero, "BEG_704_SWAMP_00_02"); //Dort gibt es Blutfliegen....und Sumpfhaie. Aber das ist noch nicht das schlimmste.
	AI_Output			(self, hero, "BEG_704_SWAMP_00_02"); //Jsou tam krvavé mouchy....a močáloví žraloci. Ale to ještě není to nejhorší.
//	AI_Output			(hero, self, "BEG_704_SWAMP_15_03"); //Ja, und? Was ist das 'Schlimmste'?
	AI_Output			(hero, self, "BEG_704_SWAMP_15_03"); //No a? A co je to nejhorší?
//	AI_Output			(self, hero, "BEG_704_SWAMP_00_04"); //Als die Barriere noch den Himmel überzog, war der Sumpf das Gebiet einer Bruderschaft die einen Dämon abeteten!
	AI_Output			(self, hero, "BEG_704_SWAMP_00_04"); //Když ještě bariéra pokrývala oblohu, bažina byla územím bratrstva, které uctívalo démona!
//	AI_Output			(hero, self, "BEG_704_SWAMP_15_05"); //Ja, und?
	AI_Output			(hero, self, "BEG_704_SWAMP_15_05"); //No a?
//	AI_Output			(self, hero, "BEG_704_SWAMP_00_06"); //...die verdammten Seelen der Toten spuken dort...
	AI_Output			(self, hero, "BEG_704_SWAMP_00_06"); //...straší tam prokleté duše mrtvých...
//	AI_Output			(self, hero, "BEG_704_SWAMP_00_07"); //...Untote feiern blutige Rituale...
	AI_Output			(self, hero, "BEG_704_SWAMP_00_07"); //...nemrtví tam slaví krvavé rituály... 
//	AI_Output			(self, hero, "BEG_704_SWAMP_00_08"); //...und Skelette staken durch das Sumpfwasser... //Přeložil jsem to trochu volněji.
	AI_Output			(self, hero, "BEG_704_SWAMP_00_08"); //...a kostlivci tě vtáhnou do bažinaté vody...
//	AI_Output			(hero, self, "BEG_704_SWAMP_15_09"); //Kann es sein das du zuviel rauchst?
	AI_Output			(hero, self, "BEG_704_SWAMP_15_09"); //A není to tím, že moc kouříš?
};



