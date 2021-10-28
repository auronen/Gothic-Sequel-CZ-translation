

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE Wrk_205_Ramirez_EXIT   (C_INFO)
{
	npc         = Wrk_205_Ramirez;
	nr          = 999;
	condition   = Wrk_205_Ramirez_EXIT_Condition;
	information = Wrk_205_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT Wrk_205_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Wrk_205_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance Wrk_205_Ramirez_HI		(C_INFO)
{
	npc		 = 	Wrk_205_Ramirez;
	nr		 = 	11;
	condition	 = 	Wrk_205_Ramirez_HI_Condition;
	information	 = 	Wrk_205_Ramirez_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tu děláš?";
};

func int Wrk_205_Ramirez_HI_Condition ()
{
	return TRUE;
};

func void Wrk_205_Ramirez_HI_Info ()
{
//	AI_Output			(hero, self, "WRK_205_HI_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "WRK_205_HI_15_01"); //Co tu děláš?
//	AI_Output			(self, hero, "WRK_205_HI_09_02"); //Ich versuche zu überleben.
	AI_Output			(self, hero, "WRK_205_HI_09_02"); //Snažím se přežít.
//	AI_Output			(hero, self, "WRK_205_HI_15_03"); //Das ist ne gute Sache. Aber warum versuchst du es nicht im Lager?
	AI_Output			(hero, self, "WRK_205_HI_15_03"); //To je dobrá věc. Ale proč se o to nesnažíš v táboře?
//	AI_Output			(hero, self, "WRK_205_HI_15_04"); //Das könnte deine Chancen erhöhen.
	AI_Output			(hero, self, "WRK_205_HI_15_04"); //Mohlo by to tvoje šance celkem zvýšit.
//	AI_Output			(self, hero, "WRK_205_HI_09_05"); //Es gab ein paar ...Missverständnisse zwischen der Miliz und mir.
	AI_Output			(self, hero, "WRK_205_HI_09_05"); //Událo se pár... nedorozumění mezi mnou a domobranou.
//	AI_Output			(self, hero, "WRK_205_HI_09_06"); //Sie waren der Meinung ich wäre ein Unruhestifter. Und dabei habe ich nur die Wahrheit gesagt.
	AI_Output			(self, hero, "WRK_205_HI_09_06"); //Měli dojem, že jsem buřič. A to jsem jenom říkal pravdu.
//	AI_Output			(self, hero, "WRK_205_HI_09_07"); //Deshalb habe ich mich hier niedergelassen. Ist sowieso besser, denn hier werden die Orks bestimmt nicht hinkommen.
	AI_Output			(self, hero, "WRK_205_HI_09_07"); //Takže jsem se usadil tady. Je to tak jako tak lepší, jelikož sem určitě nepřijdou skřeti.
};

///////////////////////////////////////////////////////////////////////
//	Info MISUNDERSTOOD
///////////////////////////////////////////////////////////////////////
instance Wrk_205_Ramirez_MISUNDERSTOOD		(C_INFO)
{
	npc		 = 	Wrk_205_Ramirez;
	nr		 = 	14;
	condition	 = 	Wrk_205_Ramirez_MISUNDERSTOOD_Condition;
	information	 = 	Wrk_205_Ramirez_MISUNDERSTOOD_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was hast du denn gesagt?";
	description	 = 	"Co jsi teda říkal?";
};

func int Wrk_205_Ramirez_MISUNDERSTOOD_Condition ()
{
	if Npc_KnowsInfo (hero,Wrk_205_Ramirez_HI)
	{
		return TRUE;
	};
};
func void Wrk_205_Ramirez_MISUNDERSTOOD_Info ()
{
//	AI_Output			(hero, self, "WRK_205_MISUNDERSTOOD_15_01"); //Was hast du denn gesagt?
	AI_Output			(hero, self, "WRK_205_MISUNDERSTOOD_15_01"); //Co jsi teda říkal?
//	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_02"); //Das Bromor die Arbeiter nicht gut behandelt und das Agon ein geldversessener Schweinhund ist.
	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_02"); //Že Bromor nezachází dobře s dělníky a že Agon je penězi posedlá svině.
//	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_03"); //Das die Miliz zwar hinter jedem Dieb her ist, aber die großen Fische in Ruhe lassen,...
	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_03"); //Že domobrana jde po každém zlodějíčkovi, ale velké ryby nechává v klidu,...
//	AI_Output			(hero, self, "WRK_205_MISUNDERSTOOD_15_04"); //Hmmm... kein Wunder das sie dich aus dem Weg haben wollten.
	AI_Output			(hero, self, "WRK_205_MISUNDERSTOOD_15_04"); //Hmmm... to nepřekvapí, že tě chtěli odklidit z cesty.
//	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_05"); //Glücklicherwiese bin ich abgehauen, bevor sie zu mir gekommen sind.
	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_05"); //Naštěstí jsem jim utekl, než ke mně stihli přijít.
//	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_06"); //Wenn du schlau bist, meidest du das Lager. Halte dich fern von diesem Rattennest.
	AI_Output			(self, hero, "WRK_205_MISUNDERSTOOD_09_06"); //Kdo je chytrý, ten se táboru vyhýbá. Drž se dál od toho krysího hnízda.
};
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance Wrk_205_Ramirez_CAMP		(C_INFO)
{
	npc		 = 	Wrk_205_Ramirez;
	nr		 = 	34;
	condition	 = 	Wrk_205_Ramirez_CAMP_Condition;
	information	 = 	Wrk_205_Ramirez_CAMP_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich muss noch ein paar Dinge im Lager erledigen";
	description	 = 	"Já ještě musím v táboře obstarat pár věcí.";
};

func int Wrk_205_Ramirez_CAMP_Condition ()
{
	if Npc_KnowsInfo (hero,Wrk_205_Ramirez_MISUNDERSTOOD)
	{
		return TRUE;
	};
};

func void Wrk_205_Ramirez_CAMP_Info ()
{
//	AI_Output			(hero, self, "WRK_205_CAMP_15_01"); //Ich muss noch ein paar Dinge im Lager erledigen.
	AI_Output			(hero, self, "WRK_205_CAMP_15_01"); //Já ještě musím v táboře obstarat pár věcí.
//	AI_Output			(self, hero, "WRK_205_CAMP_09_02"); //Dann musst du das tun. Ich werde nicht mehr zurückgehen.
	AI_Output			(self, hero, "WRK_205_CAMP_09_02"); //Tak to musíš udělat. Já už se zpátky nevracím.
//	AI_Output			(self, hero, "WRK_205_CAMP_09_03"); //Hier draussen habe ich alles was ich brauche. Bis auf eine Sache...
	AI_Output			(self, hero, "WRK_205_CAMP_09_03"); //Tady venku mám všechno, co jen mohu potřebovat. Až na jednu věc...
//	AI_Output			(hero, self, "WRK_205_CAMP_15_04"); //Und das wäre?
	AI_Output			(hero, self, "WRK_205_CAMP_15_04"); //A to je?
//	AI_Output			(self, hero, "WRK_205_CAMP_09_05"); //Pfeile. Wenn du mir Pfeile besorgst, ich kann dir dafür Fleisch bieten. Sagen wir 2 Stück Fleisch für jeden Pfeil.
	AI_Output			(self, hero, "WRK_205_CAMP_09_05"); //Šípy. Pokud bys mi sehnal šípy, mohl bych ti za ně nabídnout maso. Řekněme dva kusy masa za každý šíp.

	Info_ClearChoices (Wrk_205_Ramirez_CAMP);
//	Info_AddChoice	(Wrk_205_Ramirez_CAMP, "Vergiss es, Pfeile sind zu kostbar!", Wrk_205_Ramirez_CAMP_NO );
	Info_AddChoice	(Wrk_205_Ramirez_CAMP, "Na to zapomeň, šípy jsou moc drahé!", Wrk_205_Ramirez_CAMP_NO );
//	Info_AddChoice	(Wrk_205_Ramirez_CAMP, "Ich werde sehen was sich machen lässt", Wrk_205_Ramirez_CAMP_YES );
	Info_AddChoice	(Wrk_205_Ramirez_CAMP, "Uvidím, co mohu udělat.", Wrk_205_Ramirez_CAMP_YES );


};
func void Wrk_205_Ramirez_CAMP_YES ()
{
//	AI_Output			(hero, self, "WRK_205_CAMP_YES_15_01"); //Ich werde sehen was sich machen lässt.
	AI_Output			(hero, self, "WRK_205_CAMP_YES_15_01"); //Uvidím, co mohu udělat.
//	AI_Output			(self, hero, "WRK_205_CAMP_YES_09_02"); //Du weißt ja , wo du mich findest. Ach, noch eine Sache,...
	AI_Output			(self, hero, "WRK_205_CAMP_YES_09_02"); //Víš, kde mě najdeš. Ach, ještě jedna věc,...
//	AI_Output			(self, hero, "WRK_205_CAMP_YES_09_03"); //...wenn du wieder im Lager bist: Traue niemandem !!
	AI_Output			(self, hero, "WRK_205_CAMP_YES_09_03"); //...až budeš v táboře: nikomu nevěř!!
	Info_ClearChoices (Wrk_205_Ramirez_CAMP);
};

func void Wrk_205_Ramirez_CAMP_NO ()
{
//	AI_Output			(hero, self, "WRK_205_CAMP_NO_15_01"); //Vergiss es, Pfeile sind zu kostbar!
	AI_Output			(hero, self, "WRK_205_CAMP_NO_15_01"); //Na to zapomeň, šípy jsou moc drahé!
//	AI_Output			(self, hero, "WRK_205_CAMP_NO_09_02"); //Na, wenn du mal ein paar übrig hast, denk an mich!
	AI_Output			(self, hero, "WRK_205_CAMP_NO_09_02"); //No, kdyby ti nějaké přebývaly, vzpomeň si na mě!

	Info_ClearChoices (Wrk_205_Ramirez_CAMP);
};


///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance Wrk_205_Ramirez_TRADE		(C_INFO)
{
	npc		 = 	Wrk_205_Ramirez;
	condition	 = 	Wrk_205_Ramirez_TRADE_Condition;
	information	 = 	Wrk_205_Ramirez_TRADE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Lass uns handeln";
	description	 = 	"Pojďme obchodovat.";
};

func int Wrk_205_Ramirez_TRADE_Condition ()
{
	//Wenn Ramirez es noch nicht leid ist, mit mir zu handeln,
	//also die Anzahl der gegebenen Pfeile (Given_Arrows) kleiner ist als die Anzahl
	//der Pfeile, die er jemals im Spiel annehmen wird (Enough_Arrows), minus die "Mindestabgabemenge",
	//dann führe den Handel durch
	if Given_Arrows < Enough_Arrows-4
	&& Npc_KnowsInfo (hero,Wrk_205_Ramirez_CAMP)
	{
		return TRUE;
	};
};
func void Wrk_205_Ramirez_TRADE_Info ()
{
//	AI_Output			(hero, self, "WRK_205_TRADE_15_01"); //Lass uns handeln.
	AI_Output			(hero, self, "WRK_205_TRADE_15_01"); //Pojďme obchodovat.


	Info_AddChoice	(Wrk_205_Ramirez_TRADE, DIALOG_BACK, Wrk_205_Ramirez_TRADE_BACK );


	if !(B_Ramirez_TradeCheck(50) == 1)
	{

//		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "50 Pfeile geben für 100 Stück Fleisch", Wrk_205_Ramirez_TRADE_50 );
		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "Dát 50 šípů za 100 kusů masa", Wrk_205_Ramirez_TRADE_50 );
	};
	if !(B_Ramirez_TradeCheck(25) == 1)
	{

//		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "25 Pfeile geben für 50 Stück Fleisch", Wrk_205_Ramirez_TRADE_25 );
		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "Dát 25 šípů za 50 kusů masa", Wrk_205_Ramirez_TRADE_25 );
	};
	if !(B_Ramirez_TradeCheck(10) == 1)
	{

//		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "10 Pfeile geben für 20 Stück Fleisch", Wrk_205_Ramirez_TRADE_10 );
		Info_AddChoice	(Wrk_205_Ramirez_TRADE, "Dát 10 šípů za 20 kusů masa", Wrk_205_Ramirez_TRADE_10 );
	};

	if !(B_Ramirez_TradeCheck(5) == 1)
	{

//		Info_AddChoice	(Wrk_205_Ramirez_TRADE, " 5 Pfeile geben für 10 Stück Fleisch", Wrk_205_Ramirez_TRADE_5 );
		Info_AddChoice	(Wrk_205_Ramirez_TRADE, " Dát 5 šípů za 10 kusů masa", Wrk_205_Ramirez_TRADE_5 );
	};

};
func void Wrk_205_Ramirez_TRADE_5 ()
{
	var int NumArrows;
	NumArrows = 5;

	if (B_Ramirez_TradeCheck(NumArrows)== 0)
	{
//		AI_Output			(hero, self, "WRK_205_TRADE_5_15_01"); //Hier habe ich fünf Pfeile für dich.
		AI_Output			(hero, self, "WRK_205_TRADE_5_15_01"); //Tady, nesu ti šípy.
//		AI_Output			(self, hero, "WRK_205_TRADE_5_09_02"); //Gut, ich gebe dir zehn Stück Fleisch dafür.
		AI_Output			(self, hero, "WRK_205_TRADE_5_09_02"); //Dobře, dám ti za ně deset kusů masa.
		B_Ramirez_ProceedTrade (NumArrows);
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 2)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Ty jsi okradl šípaře? Přinesl jsi mi těch šípů víc než dost!
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 3)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Pověz, co vlastně děláš se vším tím masem? Ze zásob mi už nic nezbylo!
	};
};

func void Wrk_205_Ramirez_TRADE_10 ()
{
	var int NumArrows;
	NumArrows = 10;

	if (B_Ramirez_TradeCheck(NumArrows)== 0)
	{
//		AI_Output			(hero, self, "WRK_205_TRADE_10_15_01"); //Hier habe ich zehn Pfeile für dich.
		AI_Output			(hero, self, "WRK_205_TRADE_10_15_01"); //Tady, mám pro tebe deset šípů.
//		AI_Output			(self, hero, "WRK_205_TRADE_10_09_02"); //Gut, ich gebe dir zwanzig Stücke Fleisch dafür.
		AI_Output			(self, hero, "WRK_205_TRADE_10_09_02"); //Dobře, dám ti za ně dvacet kusů masa.
		B_Ramirez_ProceedTrade (NumArrows);
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 2)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Ty jsi okradl šípaře? Přinesl jsi mi těch šípů víc než dost!
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 3)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Pověz, co vlastně děláš se vším tím masem? Ze zásob mi už nic nezbylo!
	};
};

func void Wrk_205_Ramirez_TRADE_25 ()
{
	var int NumArrows;
	NumArrows = 25;

	if (B_Ramirez_TradeCheck(NumArrows)== 0)
	{
//		AI_Output			(hero, self, "WRK_205_TRADE_10_15_01"); //Hier habe ich fünfundzwanzig Pfeile für dich.
		AI_Output			(hero, self, "WRK_205_TRADE_10_15_01"); //Tady, mám pro tebe pětadvacet šípů.
//		AI_Output			(self, hero, "WRK_205_TRADE_10_09_02"); //Gut, ich gebe dir fünfzig Stücke Fleisch dafür.
		AI_Output			(self, hero, "WRK_205_TRADE_10_09_02"); //Dobře, dám ti za ně padesát kusů masa.
		B_Ramirez_ProceedTrade (NumArrows);
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 2)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Ty jsi okradl šípaře? Přinesl jsi mi těch šípů víc než dost!
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 3)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Pověz, co vlastně děláš se vším tím masem? Ze zásob mi už nic nezbylo!
	};
};

func void Wrk_205_Ramirez_TRADE_50 ()
{
	var int NumArrows;
	NumArrows = 50;

	if (B_Ramirez_TradeCheck(NumArrows)== 0)
	{
//		AI_Output			(hero, self, "WRK_205_TRADE_50_15_01"); //Hier habe ich fünfzig Pfeile für dich.
//		AI_Output			(self, hero, "WRK_205_TRADE_50_09_02"); //Gut, ich gebe dir hundert Stücke Fleisch dafür.
		AI_Output			(hero, self, "WRK_205_TRADE_50_15_01"); //Tady pro tebe mám padesát šípů.
		AI_Output			(self, hero, "WRK_205_TRADE_50_09_02"); //Dobře, dám ti za to sto kusů masa.
		B_Ramirez_ProceedTrade (NumArrows);
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 2)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_ENOUGH_09_00"); //Ty jsi okradl šípaře? Přinesl jsi mi těch šípů víc než dost!
	};
	if (B_Ramirez_TradeCheck(NumArrows)== 3)
	{
//		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
		AI_Output			(self, hero, "OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00"); //Pověz, co vlastně děláš se vším tím masem? Ze zásob mi už nic nezbylo!
	};
};


func void Wrk_205_Ramirez_TRADE_BACK ()
{
	Info_ClearChoices (Wrk_205_Ramirez_TRADE);
};


///////////////////////////////////////////////////////////////////////
//	Info NEWS
///////////////////////////////////////////////////////////////////////
instance Wrk_205_Ramirez_NEWS		(C_INFO)
{
	npc		 = 	Wrk_205_Ramirez;
	nr		 = 	33;
	condition	 = 	Wrk_205_Ramirez_NEWS_Condition;
	information	 = 	Wrk_205_Ramirez_NEWS_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Gibt's was Neues?";
	description	 = 	"Je něco nového?";
};

func int Wrk_205_Ramirez_NEWS_Condition ()
{
	if Npc_KnowsInfo (hero,Wrk_205_Ramirez_HI)
	{
		return TRUE;
	};
};
func void Wrk_205_Ramirez_NEWS_Info ()
{
//	AI_Output			(hero, self, "Wrk_205_NEWS_15_01"); //Gibt's was Neues?
	AI_Output			(hero, self, "Wrk_205_NEWS_15_01"); //Je něco nového?
//	AI_Output			(self, hero, "Wrk_205_NEWS_00_02"); //Es gibt noch genug Wild zum Jagen und von den Orks ist weit und breit niemand zu sehen.
	AI_Output			(self, hero, "Wrk_205_NEWS_00_02"); //V divočině je pořád co lovit a po skřetech široko daleko ani stopy.
};
