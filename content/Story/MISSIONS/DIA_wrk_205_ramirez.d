
instance WRK_205_RAMIREZ_EXIT(C_Info)
{
	npc = wrk_205_ramirez;
	nr = 999;
	condition = wrk_205_ramirez_exit_condition;
	information = wrk_205_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_205_ramirez_exit_condition()
{
	return TRUE;
};

func void wrk_205_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_205_RAMIREZ_HI(C_Info)
{
	npc = wrk_205_ramirez;
	nr = 11;
	condition = wrk_205_ramirez_hi_condition;
	information = wrk_205_ramirez_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was machst du hier?";
};


func int wrk_205_ramirez_hi_condition()
{
	return TRUE;
};

func void wrk_205_ramirez_hi_info()
{
	AI_Output(hero,self,"WRK_205_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"WRK_205_HI_09_02");	//Ich versuche zu überleben.
	AI_Output(hero,self,"WRK_205_HI_15_03");	//Das ist ne gute Sache. Aber warum versuchst du es nicht im Lager?
	AI_Output(hero,self,"WRK_205_HI_15_04");	//Das könnte deine Chancen erhöhen.
	AI_Output(self,hero,"WRK_205_HI_09_05");	//Es gab ein paar ...Missverständnisse zwischen der Miliz und mir.
	AI_Output(self,hero,"WRK_205_HI_09_06");	//Sie waren der Meinung ich wäre ein Unruhestifter. Und dabei habe ich nur die Wahrheit gesagt.
	AI_Output(self,hero,"WRK_205_HI_09_07");	//Deshalb habe ich mich hier niedergelassen. Ist sowieso besser, denn hier werden die Orks bestimmt nicht hinkommen.
};


instance WRK_205_RAMIREZ_MISUNDERSTOOD(C_Info)
{
	npc = wrk_205_ramirez;
	nr = 14;
	condition = wrk_205_ramirez_misunderstood_condition;
	information = wrk_205_ramirez_misunderstood_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was hast du denn gesagt?";
};


func int wrk_205_ramirez_misunderstood_condition()
{
	if(Npc_KnowsInfo(hero,wrk_205_ramirez_hi))
	{
		return TRUE;
	};
};

func void wrk_205_ramirez_misunderstood_info()
{
	AI_Output(hero,self,"WRK_205_MISUNDERSTOOD_15_01");	//Was hast du denn gesagt?
	AI_Output(self,hero,"WRK_205_MISUNDERSTOOD_09_02");	//Das Bromor die Arbeiter nicht gut behandelt und das Agon ein geldversessener Schweinhund ist.
	AI_Output(self,hero,"WRK_205_MISUNDERSTOOD_09_03");	//Das die Miliz zwar hinter jedem Dieb her ist, aber die großen Fische in Ruhe lassen,...
	AI_Output(hero,self,"WRK_205_MISUNDERSTOOD_15_04");	//Hmmm... kein Wunder das sie dich aus dem Weg haben wollten.
	AI_Output(self,hero,"WRK_205_MISUNDERSTOOD_09_05");	//Glücklicherwiese bin ich abgehauen, bevor sie zu mir gekommen sind.
	AI_Output(self,hero,"WRK_205_MISUNDERSTOOD_09_06");	//Wenn du schlau bist, meidest du das Lager. Halte dich fern von diesem Rattennest.
};


instance WRK_205_RAMIREZ_CAMP(C_Info)
{
	npc = wrk_205_ramirez;
	nr = 34;
	condition = wrk_205_ramirez_camp_condition;
	information = wrk_205_ramirez_camp_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich muss noch ein paar Dinge im Lager erledigen";
};


func int wrk_205_ramirez_camp_condition()
{
	if(Npc_KnowsInfo(hero,wrk_205_ramirez_misunderstood))
	{
		return TRUE;
	};
};

func void wrk_205_ramirez_camp_info()
{
	AI_Output(hero,self,"WRK_205_CAMP_15_01");	//Ich muss noch ein paar Dinge im Lager erledigen.
	AI_Output(self,hero,"WRK_205_CAMP_09_02");	//Dann musst du das tun. Ich werde nicht mehr zurückgehen.
	AI_Output(self,hero,"WRK_205_CAMP_09_03");	//Hier draussen habe ich alles was ich brauche. Bis auf eine Sache...
	AI_Output(hero,self,"WRK_205_CAMP_15_04");	//Und das wäre?
	AI_Output(self,hero,"WRK_205_CAMP_09_05");	//Pfeile. Wenn du mir Pfeile besorgst, ich kann dir dafür Fleisch bieten. Sagen wir 2 Stück Fleisch für jeden Pfeil.
	Info_ClearChoices(wrk_205_ramirez_camp);
	Info_AddChoice(wrk_205_ramirez_camp,"Vergiss es, Pfeile sind zu kostbar!",wrk_205_ramirez_camp_no);
	Info_AddChoice(wrk_205_ramirez_camp,"Ich werde sehen was sich machen lässt",wrk_205_ramirez_camp_yes);
};

func void wrk_205_ramirez_camp_yes()
{
	AI_Output(hero,self,"WRK_205_CAMP_YES_15_01");	//Ich werde sehen was sich machen lässt.
	AI_Output(self,hero,"WRK_205_CAMP_YES_09_02");	//Du weißt ja , wo du mich findest. Ach, noch eine Sache,...
	AI_Output(self,hero,"WRK_205_CAMP_YES_09_03");	//...wenn du wieder im Lager bist: Traue niemandem !!
	Info_ClearChoices(wrk_205_ramirez_camp);
};

func void wrk_205_ramirez_camp_no()
{
	AI_Output(hero,self,"WRK_205_CAMP_NO_15_01");	//Vergiss es, Pfeile sind zu kostbar!
	AI_Output(self,hero,"WRK_205_CAMP_NO_09_02");	//Na, wenn du mal ein paar übrig hast, denk an mich!
	Info_ClearChoices(wrk_205_ramirez_camp);
};


instance WRK_205_RAMIREZ_TRADE(C_Info)
{
	npc = wrk_205_ramirez;
	condition = wrk_205_ramirez_trade_condition;
	information = wrk_205_ramirez_trade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Lass uns handeln";
};


func int wrk_205_ramirez_trade_condition()
{
	if((GIVEN_ARROWS < (ENOUGH_ARROWS - 4)) && Npc_KnowsInfo(hero,wrk_205_ramirez_camp))
	{
		return TRUE;
	};
};

func void wrk_205_ramirez_trade_info()
{
	AI_Output(hero,self,"WRK_205_TRADE_15_01");	//Lass uns handeln.
	Info_AddChoice(wrk_205_ramirez_trade,DIALOG_BACK,wrk_205_ramirez_trade_back);
	if(!(b_ramirez_tradecheck(50) == 1))
	{
		Info_AddChoice(wrk_205_ramirez_trade,"50 Pfeile geben für 100 Stück Fleisch",wrk_205_ramirez_trade_50);
	};
	if(!(b_ramirez_tradecheck(25) == 1))
	{
		Info_AddChoice(wrk_205_ramirez_trade,"25 Pfeile geben für 50 Stück Fleisch",wrk_205_ramirez_trade_25);
	};
	if(!(b_ramirez_tradecheck(10) == 1))
	{
		Info_AddChoice(wrk_205_ramirez_trade,"10 Pfeile geben für 20 Stück Fleisch",wrk_205_ramirez_trade_10);
	};
	if(!(b_ramirez_tradecheck(5) == 1))
	{
		Info_AddChoice(wrk_205_ramirez_trade," 5 Pfeile geben für 10 Stück Fleisch",wrk_205_ramirez_trade_5);
	};
};

func void wrk_205_ramirez_trade_5()
{
	var int numarrows;
	numarrows = 5;
	if(b_ramirez_tradecheck(numarrows) == 0)
	{
		AI_Output(hero,self,"WRK_205_TRADE_5_15_01");	//Hier habe ich fünf Pfeile für dich.
		AI_Output(self,hero,"WRK_205_TRADE_5_09_02");	//Gut, ich gebe dir zehn Stück Fleisch dafür.
		b_ramirez_proceedtrade(numarrows);
	};
	if(b_ramirez_tradecheck(numarrows) == 2)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_ENOUGH_09_00");	//Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
	};
	if(b_ramirez_tradecheck(numarrows) == 3)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00");	//Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
	};
};

func void wrk_205_ramirez_trade_10()
{
	var int numarrows;
	numarrows = 10;
	if(b_ramirez_tradecheck(numarrows) == 0)
	{
		AI_Output(hero,self,"WRK_205_TRADE_10_15_01");	//Hier habe ich fünfundzwanzig Pfeile für dich.
		AI_Output(self,hero,"WRK_205_TRADE_10_09_02");	//Gut, ich gebe dir fünfzig Stücke Fleisch dafür.
		b_ramirez_proceedtrade(numarrows);
	};
	if(b_ramirez_tradecheck(numarrows) == 2)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_ENOUGH_09_00");	//Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
	};
	if(b_ramirez_tradecheck(numarrows) == 3)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00");	//Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
	};
};

func void wrk_205_ramirez_trade_25()
{
	var int numarrows;
	numarrows = 25;
	if(b_ramirez_tradecheck(numarrows) == 0)
	{
		AI_Output(hero,self,"WRK_205_TRADE_10_15_01");	//Hier habe ich fünfundzwanzig Pfeile für dich.
		AI_Output(self,hero,"WRK_205_TRADE_10_09_02");	//Gut, ich gebe dir fünfzig Stücke Fleisch dafür.
		b_ramirez_proceedtrade(numarrows);
	};
	if(b_ramirez_tradecheck(numarrows) == 2)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_ENOUGH_09_00");	//Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
	};
	if(b_ramirez_tradecheck(numarrows) == 3)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00");	//Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
	};
};

func void wrk_205_ramirez_trade_50()
{
	var int numarrows;
	numarrows = 50;
	if(b_ramirez_tradecheck(numarrows) == 0)
	{
		AI_Output(hero,self,"WRK_205_TRADE_50_15_01");	//Hier habe ich fünfzig Pfeile für dich.
		AI_Output(self,hero,"WRK_205_TRADE_50_09_02");	//Gut, ich gebe dir hundert Stücke Fleisch dafür.
		b_ramirez_proceedtrade(numarrows);
	};
	if(b_ramirez_tradecheck(numarrows) == 2)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_ENOUGH_09_00");	//Hast du den Pfeilschnitzer geplündert? Du hast mir mehr als genug Pfeile gebracht!
	};
	if(b_ramirez_tradecheck(numarrows) == 3)
	{
		AI_Output(self,hero,"OUMULTI_RAMIREZTRADE_NOMOREMUTTON_09_00");	//Sag mal, was machst du eigentlich mit dem ganzen Fleisch? Ich habe keine Vorräte mehr!
	};
};

func void wrk_205_ramirez_trade_back()
{
	Info_ClearChoices(wrk_205_ramirez_trade);
};


instance WRK_205_RAMIREZ_NEWS(C_Info)
{
	npc = wrk_205_ramirez;
	nr = 33;
	condition = wrk_205_ramirez_news_condition;
	information = wrk_205_ramirez_news_info;
	important = FALSE;
	permanent = TRUE;
	description = "Gibt's was Neues?";
};


func int wrk_205_ramirez_news_condition()
{
	if(Npc_KnowsInfo(hero,wrk_205_ramirez_hi))
	{
		return TRUE;
	};
};

func void wrk_205_ramirez_news_info()
{
	AI_Output(hero,self,"Wrk_205_NEWS_15_01");	//Gibt's was Neues?
	AI_Output(self,hero,"Wrk_205_NEWS_00_02");	//Es gibt noch genug Wild zum Jagen und von den Orks ist weit und breit niemand zu sehen.
};

