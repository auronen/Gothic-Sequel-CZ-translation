///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_223_Ruga_EXIT   (C_INFO)
{
	npc         = WRK_223_Ruga;
	nr          = 999;
	condition   = WRK_223_Ruga_EXIT_Condition;
	information = WRK_223_Ruga_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_223_Ruga_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_223_Ruga_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Start
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_START		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	12;
	condition	 = 	WRK_223_Ruga_START_Condition;
	information	 = 	WRK_223_Ruga_START_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wer bist Du?";
	description	 = 	"Kdo jsi?";
};

func int WRK_223_Ruga_START_Condition ()
{
	if (!Npc_KnowsInfo	(hero, WRK_223_Ruga_ARMORPRICE))
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_START_Info ()
{
//	AI_Output			(hero, self, "WRK_223_START_15_01"); //Wer bist Du?
	AI_Output			(hero, self, "WRK_223_START_15_01"); //Kdo jsi?
//	AI_Output			(self, hero, "WRK_223_START_09_02"); //Man nennt mich Ruga. Ich bin der Rüstungsmacher.
	AI_Output			(self, hero, "WRK_223_START_09_02"); //Říkají mi Ruga. Jsem zbrojíř.
	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC,"Ruga verkauft RÜSTUNGEN. Er hat sein Geschäft im Händlerviertel.");
	B_LogEntry			(GE_TraderOC,"Ruga prodává ZBROJE. Má svůj obchod v obchodní čtvrti.");
};


///////////////////////////////////////////////////////////////////////
//	Info ARMORPRICE
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_ARMORPRICE		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	5;
	condition	 = 	WRK_223_Ruga_ARMORPRICE_Condition;
	information	 = 	WRK_223_Ruga_ARMORPRICE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie teuer sind deine Rüstungen?";
	description	 = 	"Jak drahé jsou tvé zbroje?";
};

func int WRK_223_Ruga_ARMORPRICE_Condition ()
{
	if (Npc_KnowsInfo	(hero, WRK_223_Ruga_START))
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_ARMORPRICE_Info ()
{
//	AI_Output			(hero, self, "WRK_223_ARMORPRICE_15_01"); //Wie teuer sind deine Rüstungen?
	AI_Output			(hero, self, "WRK_223_ARMORPRICE_15_01"); //Jak drahé jsou tvé zbroje?
//	AI_Output			(self, hero, "WRK_223_ARMORPRICE_09_02"); //Kommt darauf an welche du haben willst!
	AI_Output			(self, hero, "WRK_223_ARMORPRICE_09_02"); //Jde o to, o kterou máš zájem!
};


///////////////////////////////////////////////////////////////////////
//	Info ARMORSELECTION
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_ARMORSELECTION		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	5;
	condition	 = 	WRK_223_Ruga_ARMORSELECTION_Condition;
	information	 = 	WRK_223_Ruga_ARMORSELECTION_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Welche Rüstungen verkaufst du?";
	description	 = 	"Jaké prodáváš zbroje?";
};

func int WRK_223_Ruga_ARMORSELECTION_Condition ()
{
	if (Npc_KnowsInfo	(hero, WRK_223_Ruga_START))
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_ARMORSELECTION_Info ()
{
//	AI_Output			(hero, self, "WRK_223_ARMORSELECTION_15_01"); //Welche Rüstungen verkaufst du?
	AI_Output			(hero, self, "WRK_223_ARMORSELECTION_15_01"); //Jaké prodáváš zbroje?
//	AI_Output			(self, hero, "WRK_223_ARMORSELECTION_09_02"); //Kommt darauf an, wieviel du ausgeben willst!
	AI_Output			(self, hero, "WRK_223_ARMORSELECTION_09_02"); //Jde o to, kolik chceš utratit!
};



///////////////////////////////////////////////////////////////////////
//	Info NOANSWER
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_NOANSWER		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	6;
	condition	 = 	WRK_223_Ruga_NOANSWER_Condition;
	information	 = 	WRK_223_Ruga_NOANSWER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Irgendwie kommen wir so nicht weiter!";
	description	 = 	"Takhle se nikam nedostaneme!";
};

func int WRK_223_Ruga_NOANSWER_Condition ()
{
	if (Npc_KnowsInfo	(hero,WRK_223_Ruga_ARMORPRICE)
	&& (Npc_KnowsInfo	(hero,WRK_223_Ruga_ARMORSELECTION)))
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_NOANSWER_Info ()
{
//	AI_Output			(hero, self, "WRK_223_NOANSWER_15_01"); //Irgendwie kommen wir so nicht weiter!
	AI_Output			(hero, self, "WRK_223_NOANSWER_15_01"); //Takhle se nikam nedostaneme!
//	AI_Output			(self, hero, "WRK_223_NOANSWER_09_02"); //Irgendwie glaube ich auch nicht, daß du genug Silber hast, um dir ne Rüstung zu kaufen!
	AI_Output			(self, hero, "WRK_223_NOANSWER_09_02"); //Také si nemyslím, že bys měl dost stříbra na nějakou zbroj!
//	Info_AddChoice	(WRK_223_Ruga_NOANSWER, "Wenn das so ist, steck dir die Rüstungen doch sonstwohin!", WRK_223_Ruga_NOANSWER_End );
	Info_AddChoice	(WRK_223_Ruga_NOANSWER, "Pokud to tak je, tak si ty zbroje můžeš strčit ty víš kam!", WRK_223_Ruga_NOANSWER_End );
//	Info_AddChoice	(WRK_223_Ruga_NOANSWER, "Sag mir doch einfach, was die Dinger kosten.", WRK_223_Ruga_NOANSWER_Ok );
	Info_AddChoice	(WRK_223_Ruga_NOANSWER, "Prostě mi řekni, kolik ty věci stojí.", WRK_223_Ruga_NOANSWER_Ok );
};

func void WRK_223_Ruga_NOANSWER_Ok ()
{
//	AI_Output			(hero, self, "WRK_223_NOANSWER_Ok_15_01"); //Sag mir doch einfach, was die Dinger kosten.
	AI_Output			(hero, self, "WRK_223_NOANSWER_Ok_15_01"); //Prostě mi řekni, kolik ty věci stojí.
//	AI_Output			(self, hero, "WRK_223_NOANSWER_Ok_09_02"); //Na gut, du scheinst ja wirklich interessiert zu sein.
	AI_Output			(self, hero, "WRK_223_NOANSWER_Ok_09_02"); //No dobře, vypadá to, že tě to opravdu zajímá.
//	AI_Output			(self, hero, "WRK_223_NOANSWER_Ok_09_03"); //Ich hasse es, stundenlang zu reden, wenn dann doch nichts gekauft wird!
	AI_Output			(self, hero, "WRK_223_NOANSWER_Ok_09_03"); //Nesnáším, když se celé hodiny jen mluví, když si potom ten druhý nic nekoupí!
	Info_ClearChoices	(WRK_223_Ruga_NOANSWER);
	int_RugaCalm	=	TRUE;
};

func void WRK_223_Ruga_NOANSWER_End ()
{
//	AI_Output			(hero, self, "WRK_223_NOANSWER_End_15_01"); //Wenn das so ist, steck dir die Rüstungen doch sonstwohin!
	AI_Output			(hero, self, "WRK_223_NOANSWER_End_15_01"); //Pokud to tak je, tak si ty zbroje můžeš strčit ty víš kam!
//	AI_Output			(self, hero, "WRK_223_NOANSWER_End_09_02"); //Hab ich erwähnt, daß ich hier der EINZIGE Rüstungsmacher bin, Klugscheisser?
	AI_Output			(self, hero, "WRK_223_NOANSWER_End_09_02"); //Zmínil jsem se o tom, že jsem tu JEDINÝ zbrojíř, chytráku?
	int_RugaAngry		= 	TRUE;
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info NoTrade
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_NOTRADE		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	1;
	condition	 = 	WRK_223_Ruga_NOTRADE_Condition;
	information	 = 	WRK_223_Ruga_NOTRADE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich möchte doch gerne ne Rüstung kaufen!";
	description	 = 	"Chtěl bych si koupit nějaké brnění!";
};

func int WRK_223_Ruga_NOTRADE_Condition ()
{
	if int_RugaAngry
	&&	(!int_RugaWantsMeal)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_NOTRADE_Info ()
{
	Info_ClearChoices	(WRK_223_Ruga_NOTRADE);
//	AI_Output			(hero, self, "WRK_223_NOTRADE_15_01"); //Ich möchte doch gerne ne Rüstung kaufen!
	AI_Output			(hero, self, "WRK_223_NOTRADE_15_01"); //Chtěl bych si koupit nějaké brnění!
//	AI_Output			(self, hero, "WRK_223_NOTRADE_09_02"); //Ach ja? Dann musst du mir einen kleinen Gefallen tun.
	AI_Output			(self, hero, "WRK_223_NOTRADE_09_02"); //Ach ano? To mi pak musíš prokázat malou službičku.
//	AI_Output			(self, hero, "WRK_223_NOTRADE_09_03"); //Ich hätte gerne was warmes zu essen. Aber ich lasse mein Geschäft ungern allein.
	AI_Output			(self, hero, "WRK_223_NOTRADE_09_03"); //Rád bych si dal něco teplého k jídlu. Ale nerad nechávám svůj obchod bez dozoru.
//	AI_Output			(self, hero, "WRK_223_NOTRADE_09_04"); //Wenn du mir ne Meatbugsuppe bringst, sind wir wieder im Geschäft!
	AI_Output			(self, hero, "WRK_223_NOTRADE_09_04"); //Pokud mi doneseš polévku ze žravých štěnic, můžeme zase obchodovat!
//	Info_AddChoice	(WRK_223_Ruga_NOTRADE, "Ich bin doch nicht dein Laufbursche!", WRK_223_Ruga_NOTRADE_WhatCanIDo_Bring1 );
	Info_AddChoice	(WRK_223_Ruga_NOTRADE, "Nejsem tvůj poslíček!", WRK_223_Ruga_NOTRADE_WhatCanIDo_Bring1 );
//	Info_AddChoice	(WRK_223_Ruga_NOTRADE, "Ich bring dir die Suppe.", WRK_223_Ruga_NOTRADE_WhatCanIDo_Meal );
	Info_AddChoice	(WRK_223_Ruga_NOTRADE, "Přinesu ti tu polévku.", WRK_223_Ruga_NOTRADE_WhatCanIDo_Meal );
};


func void WRK_223_Ruga_NOTRADE_WhatCanIDo_Meal ()
{
//	AI_Output			(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Meal_15_01"); //Ich bring dir die Suppe.
	AI_Output			(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Meal_15_01"); //Přinesu ti tu polévku.
//	AI_Output			(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Meal_09_02"); //Das klingt doch vernünftig.
	AI_Output			(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Meal_09_02"); //To zní rozumně.
	int_RugaWantsMeal	=	TRUE;
	Log_CreateTopic		(CH1_RugaWantsMeal, LOG_MISSION);
	Log_SetTopicStatus	(CH1_RugaWantsMeal, LOG_RUNNING);
//	B_LogEntry			(CH1_RugaWantsMeal,"Wenn ich Ruga eine Meatbugsuppe besorge, handelt er wieder mit mir.");
	B_LogEntry			(CH1_RugaWantsMeal,"Když Rugovi přinesu polévku ze žravých štěnic, bude se mnou obchodovat..");
	AI_StopProcessInfos	(self);
};


func void WRK_223_Ruga_NOTRADE_WhatCanIDo_Bring1 ()
{
	Info_ClearChoices	(WRK_223_Ruga_NOTRADE);
//	AI_Output			(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Bring1_15_01"); //Ich bin doch nicht dein Laufbursche!
	AI_Output			(hero, self, "WRK_223_NOTRADE_WhatCanIDo_Bring1_15_01"); //Nejsem tvůj poslíček!
//	AI_Output			(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Bring1_09_02"); //So bekommst Du nie eine Rüstung von mir!
	AI_Output			(self, hero, "WRK_223_NOTRADE_WhatCanIDo_Bring1_09_02"); //Tak to ode mě nedostaneš žádné brnění!
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info TradeArmor
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_TRADEARMOR		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	2;
	condition	 = 	WRK_223_Ruga_TRADEARMOR_Condition;
	information	 = 	WRK_223_Ruga_TRADEARMOR_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Welche Rüstungen hast du?";
	description	 = 	"Jaká brnění nabízíš?";
};

func int WRK_223_Ruga_TRADEARMOR_Condition ()
{
	if int_RugaCalm
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_TRADEARMOR_Info ()
{
	Info_ClearChoices	(WRK_223_Ruga_TradeArmor);
//	AI_Output			(hero, self, "WRK_223_TRADEARMOR_15_01"); //Welche Rüstungen hast du?
	AI_Output			(hero, self, "WRK_223_TRADEARMOR_15_01"); //Jaká brnění nabízíš?
//	AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_04"); //Welche willst du?
	AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_04"); //Jaké chceš?

	if (Npc_HasItems	(hero, ItMi_Silver) <250)
	{
//		AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_02"); //Für 250 Silber bekommst du ne leichte Buddlerhose oder Schürferklamotten. Für 500 eine vernünftige Buddlerhose.
		AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_02"); //Za 250 stříbrných dostaneš lehké kalhoty kopáče nebo oděv rudaře. Za 500 dostaneš kalhoty kopáče.
//		AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_03"); //Komm wieder, wenn Du genug Silber hast.
		AI_Output			(self, hero, "WRK_223_TRADEARMOR_09_03"); //Přijď, až budeš mít více stříbra.

		AI_StopProcessInfos (self);
	};
	Info_AddChoice	(WRK_223_Ruga_TRADEARMOR, DIALOG_ENDE, WRK_223_Ruga_EXIT_Info);

	if (Npc_HasItems	(hero, ItMi_Silver) >= 250)
	{
		Info_AddChoice	(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString (VLK_ARMOR_L), WRK_223_Ruga_TRADEARMOR_ArmorVlk_L );
	};
	if (Npc_HasItems	(hero, ItMi_Silver) >= 500)
	{
		Info_AddChoice	(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString (VLK_ARMOR_M), WRK_223_Ruga_TRADEARMOR_VlkArmor_M );
	};
	if (Npc_HasItems	(hero, ItMi_Silver) >= 250)
	{
		Info_AddChoice	(WRK_223_Ruga_TRADEARMOR, B_BuildBuyArmorString (SFB_ARMOR_L), WRK_223_Ruga_TRADEARMOR_SfbArmor_L );
	};
};


func void WRK_223_Ruga_TRADEARMOR_SfbArmor_L ()
{
	B_GiveInvItems		(hero, self, ItMi_Silver, SFB_ARMOR_L.value);
//	AI_Output			(self, hero, "WRK_223_TRADEARMOR_SfbArmor_L_09_01"); //Hier ist deine Ware.
	AI_Output			(self, hero, "WRK_223_TRADEARMOR_SfbArmor_L_09_01"); //Tady je tvoje zboží.
	B_GiveInvItems		(self, hero, SFB_ARMOR_L, 1);
	AI_StopProcessInfos	(self);

};

func void WRK_223_Ruga_TRADEARMOR_VlkArmor_M ()
{
	B_GiveInvItems		(hero, self, ItMi_Silver, VLK_ARMOR_M.value);
//	AI_Output			(self, hero, "WRK_223_TRADEARMOR_VlkArmor_M_09_01"); //Ich hoffe, du wirst glücklich damit.
	AI_Output			(self, hero, "WRK_223_TRADEARMOR_VlkArmor_M_09_01"); //Doufám, že s nimi budeš spokojen.
	B_GiveInvItems		(self, hero, VLK_ARMOR_M, 1);
	AI_StopProcessInfos	(self);
};

func void WRK_223_Ruga_TRADEARMOR_ArmorVlk_L ()
{
	B_GiveInvItems		(hero, self, ItMi_Silver, VLK_ARMOR_L.value);
//	AI_Output			(self, hero, "WRK_223_TRADEARMOR_ArmorVlk_L_09_01"); //Eine gute Wahl.
	AI_Output			(self, hero, "WRK_223_TRADEARMOR_ArmorVlk_L_09_01"); //Dobrá volba.
	B_GiveInvItems		(self, hero, VLK_ARMOR_L, 1);
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BringMeal
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_BRINGMEAL		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	6;
	condition	 = 	WRK_223_Ruga_BRINGMEAL_Condition;
	information	 = 	WRK_223_Ruga_BRINGMEAL_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Ich hab deine Suppe.";
	description	 = 	"Mám tu pro tebe tu polévku.";
};

func int WRK_223_Ruga_BRINGMEAL_Condition ()
{
	if int_RugaWantsMeal
	&&	(Npc_HasItems	(hero, ItFo_MeatBugSoup) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_BRINGMEAL_Info ()
{
//	AI_Output			(hero, self, "WRK_223_BRINGMEAL_15_01"); //Ich hab deine Suppe.
	AI_Output			(hero, self, "WRK_223_BRINGMEAL_15_01"); //Mám tu pro tebe tu polévku.
	B_GiveInvItems		(self, hero, ItFo_MeatBugSoup, 1);
//	AI_Output			(self, hero, "WRK_223_BRINGMEAL_09_02"); //Immer her damit!
	AI_Output			(self, hero, "WRK_223_BRINGMEAL_09_02"); //Sem s ní!

	int_RugaWantsMeal = FALSE;
	int_RugaAngry	= FALSE;
	int_RugaCalm	= TRUE;
	Log_SetTopicStatus	(CH1_RugaWantsMeal, LOG_SUCCESS);
//	B_LogEntry			(CH1_RugaWantsMeal,"Ruga hat sich beruhigt, nachdem ich Ihm die Suppe gebracht habe.");
	B_LogEntry			(CH1_RugaWantsMeal,"Ruga se uklidnil, když jsem mu přinesl polévku ze žravých štěnic.");
};

///////////////////////////////////////////////////////////////////////
//	Info BringMealNotReady
///////////////////////////////////////////////////////////////////////
instance WRK_223_Ruga_BRINGMEALNOTREADY		(C_INFO)
{
	npc		 = 	WRK_223_Ruga;
	nr		 = 	7;
	condition	 = 	WRK_223_Ruga_BRINGMEALNOTREADY_Condition;
	information	 = 	WRK_223_Ruga_BRINGMEALNOTREADY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Welches Essen soll ich dir bringen?";
	description	 = 	"Jaké jídlo bych ti měl přinést?";
};

func int WRK_223_Ruga_BRINGMEALNOTREADY_Condition ()
{
	if int_RugaWantsMeal
	&&	(Npc_HasItems	(hero, ItFo_MeatBugSoup) < 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void WRK_223_Ruga_BRINGMEALNOTREADY_Info ()
{
//	AI_Output			(hero, self, "WRK_223_BRINGMEALNOTREADY_15_01"); //Welches Essen soll ich dir bringen?
	AI_Output			(hero, self, "WRK_223_BRINGMEALNOTREADY_15_01"); //Jaké jídlo bych ti měl přinést?
//	AI_Output			(self, hero, "WRK_223_BRINGMEALNOTREADY_09_02"); //Meatbugsuppe! Das solltest selbst du dir merken können!
	AI_Output			(self, hero, "WRK_223_BRINGMEALNOTREADY_09_02"); //Polévku ze žravých štěnic! Měl by sis to dobře zapamatovat!
	AI_StopProcessInfos	(self);
};











































