
instance WRK_223_RUGA_EXIT(C_Info)
{
	npc = wrk_223_ruga;
	nr = 999;
	condition = wrk_223_ruga_exit_condition;
	information = wrk_223_ruga_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_223_ruga_exit_condition()
{
	return TRUE;
};

func void wrk_223_ruga_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_223_RUGA_START(C_Info)
{
	npc = wrk_223_ruga;
	nr = 12;
	condition = wrk_223_ruga_start_condition;
	information = wrk_223_ruga_start_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wer bist Du?";
};


func int wrk_223_ruga_start_condition()
{
	if(!Npc_KnowsInfo(hero,wrk_223_ruga_armorprice))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_start_info()
{
	AI_Output(hero,self,"WRK_223_START_15_01");	//Wer bist Du?
	AI_Output(self,hero,"WRK_223_START_09_02");	//Man nennt mich Ruga. Ich bin der Rüstungsmacher.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Ruga verkauft RÜSTUNGEN. Er hat sein Geschäft im Händlerviertel.");
};


instance WRK_223_RUGA_ARMORPRICE(C_Info)
{
	npc = wrk_223_ruga;
	nr = 5;
	condition = wrk_223_ruga_armorprice_condition;
	information = wrk_223_ruga_armorprice_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie teuer sind deine Rüstungen?";
};


func int wrk_223_ruga_armorprice_condition()
{
	if(Npc_KnowsInfo(hero,wrk_223_ruga_start))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_armorprice_info()
{
	AI_Output(hero,self,"WRK_223_ARMORPRICE_15_01");	//Wie teuer sind deine Rüstungen?
	AI_Output(self,hero,"WRK_223_ARMORPRICE_09_02");	//Kommt darauf an welche du haben willst!
};


instance WRK_223_RUGA_ARMORSELECTION(C_Info)
{
	npc = wrk_223_ruga;
	nr = 5;
	condition = wrk_223_ruga_armorselection_condition;
	information = wrk_223_ruga_armorselection_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welche Rüstungen verkaufst du?";
};


func int wrk_223_ruga_armorselection_condition()
{
	if(Npc_KnowsInfo(hero,wrk_223_ruga_start))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_armorselection_info()
{
	AI_Output(hero,self,"WRK_223_ARMORSELECTION_15_01");	//Welche Rüstungen verkaufst du?
	AI_Output(self,hero,"WRK_223_ARMORSELECTION_09_02");	//Kommt darauf an, wieviel du ausgeben willst!
};


instance WRK_223_RUGA_NOANSWER(C_Info)
{
	npc = wrk_223_ruga;
	nr = 6;
	condition = wrk_223_ruga_noanswer_condition;
	information = wrk_223_ruga_noanswer_info;
	important = FALSE;
	permanent = FALSE;
	description = "Irgendwie kommen wir so nicht weiter!";
};


func int wrk_223_ruga_noanswer_condition()
{
	if(Npc_KnowsInfo(hero,wrk_223_ruga_armorprice) && Npc_KnowsInfo(hero,wrk_223_ruga_armorselection))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_noanswer_info()
{
	AI_Output(hero,self,"WRK_223_NOANSWER_15_01");	//Irgendwie kommen wir so nicht weiter!
	AI_Output(self,hero,"WRK_223_NOANSWER_09_02");	//Irgendwie glaube ich auch nicht, daß du genug Silber hast, um dir ne Rüstung zu kaufen!
	Info_AddChoice(wrk_223_ruga_noanswer,"Wenn das so ist, steck dir die Rüstungen doch sonstwohin!",wrk_223_ruga_noanswer_end);
	Info_AddChoice(wrk_223_ruga_noanswer,"Sag mir doch einfach, was die Dinger kosten.",wrk_223_ruga_noanswer_ok);
};

func void wrk_223_ruga_noanswer_ok()
{
	AI_Output(hero,self,"WRK_223_NOANSWER_Ok_15_01");	//Sag mir doch einfach, was die Dinger kosten.
	AI_Output(self,hero,"WRK_223_NOANSWER_Ok_09_02");	//Na gut, du scheinst ja wirklich interessiert zu sein.
	AI_Output(self,hero,"WRK_223_NOANSWER_Ok_09_03");	//Ich hasse es, stundenlang zu reden, wenn dann doch nichts gekauft wird!
	Info_ClearChoices(wrk_223_ruga_noanswer);
	INT_RUGACALM = TRUE;
};

func void wrk_223_ruga_noanswer_end()
{
	AI_Output(hero,self,"WRK_223_NOANSWER_End_15_01");	//Wenn das so ist, steck dir die Rüstungen doch sonstwohin!
	AI_Output(self,hero,"WRK_223_NOANSWER_End_09_02");	//Hab ich erwähnt, daß ich hier der EINZIGE Rüstungsmacher bin, Klugscheisser?
	INT_RUGAANGRY = TRUE;
	AI_StopProcessInfos(self);
};


instance WRK_223_RUGA_NOTRADE(C_Info)
{
	npc = wrk_223_ruga;
	nr = 1;
	condition = wrk_223_ruga_notrade_condition;
	information = wrk_223_ruga_notrade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich möchte doch gerne ne Rüstung kaufen!";
};


func int wrk_223_ruga_notrade_condition()
{
	if(INT_RUGAANGRY && !INT_RUGAWANTSMEAL)
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_notrade_info()
{
	Info_ClearChoices(wrk_223_ruga_notrade);
	AI_Output(hero,self,"WRK_223_NOTRADE_15_01");	//Ich möchte doch gerne ne Rüstung kaufen!
	AI_Output(self,hero,"WRK_223_NOTRADE_09_02");	//Ach ja? Dann musst du mir einen kleinen Gefallen tun.
	AI_Output(self,hero,"WRK_223_NOTRADE_09_03");	//Ich hätte gerne was warmes zu essen. Aber ich lasse mein Geschäft ungern allein.
	AI_Output(self,hero,"WRK_223_NOTRADE_09_04");	//Wenn du mir ne Meatbugsuppe bringst, sind wir wieder im Geschäft!
	Info_AddChoice(wrk_223_ruga_notrade,"Ich bin doch nicht dein Laufbursche!",wrk_223_ruga_notrade_whatcanido_bring1);
	Info_AddChoice(wrk_223_ruga_notrade,"Ich bring dir die Suppe.",wrk_223_ruga_notrade_whatcanido_meal);
};

func void wrk_223_ruga_notrade_whatcanido_meal()
{
	AI_Output(hero,self,"WRK_223_NOTRADE_WhatCanIDo_Meal_15_01");	//Ich bring dir die Suppe.
	AI_Output(self,hero,"WRK_223_NOTRADE_WhatCanIDo_Meal_09_02");	//Das klingt doch vernünftig.
	INT_RUGAWANTSMEAL = TRUE;
	Log_CreateTopic(CH1_RUGAWANTSMEAL,LOG_MISSION);
	Log_SetTopicStatus(CH1_RUGAWANTSMEAL,LOG_RUNNING);
	B_LogEntry(CH1_RUGAWANTSMEAL,"Wenn ich Ruga eine Meatbugsuppe besorge, handelt er wieder mit mir.");
	AI_StopProcessInfos(self);
};

func void wrk_223_ruga_notrade_whatcanido_bring1()
{
	Info_ClearChoices(wrk_223_ruga_notrade);
	AI_Output(hero,self,"WRK_223_NOTRADE_WhatCanIDo_Bring1_15_01");	//Ich bin doch nicht dein Laufbursche!
	AI_Output(self,hero,"WRK_223_NOTRADE_WhatCanIDo_Bring1_09_02");	//So bekommst Du nie eine Rüstung von mir!
	AI_StopProcessInfos(self);
};


instance WRK_223_RUGA_TRADEARMOR(C_Info)
{
	npc = wrk_223_ruga;
	nr = 2;
	condition = wrk_223_ruga_tradearmor_condition;
	information = wrk_223_ruga_tradearmor_info;
	important = FALSE;
	permanent = TRUE;
	description = "Welche Rüstungen hast du?";
};


func int wrk_223_ruga_tradearmor_condition()
{
	if(INT_RUGACALM)
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_tradearmor_info()
{
	Info_ClearChoices(wrk_223_ruga_tradearmor);
	AI_Output(hero,self,"WRK_223_TRADEARMOR_15_01");	//Welche Rüstungen hast du?
	if(Npc_HasItems(hero,itmi_silver) < 250)
	{
		AI_Output(self,hero,"WRK_223_TRADEARMOR_09_02");	//Für 250 Silber bekommst du ne leichte Buddlerhose oder Schürferklamotten. Für 500 eine vernünftige Buddlerhose.
		AI_Output(self,hero,"WRK_223_TRADEARMOR_09_03");	//Komm wieder, wenn Du genug Silber hast.
		AI_StopProcessInfos(self);
	};
	Info_AddChoice(wrk_223_ruga_tradearmor,DIALOG_ENDE,wrk_223_ruga_exit_info);
	if(Npc_HasItems(hero,itmi_silver) >= 250)
	{
		Info_AddChoice(wrk_223_ruga_tradearmor,B_BuildBuyArmorString(vlk_armor_l),wrk_223_ruga_tradearmor_armorvlk_l);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 500)
	{
		Info_AddChoice(wrk_223_ruga_tradearmor,B_BuildBuyArmorString(vlk_armor_m),wrk_223_ruga_tradearmor_vlkarmor_m);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 250)
	{
		Info_AddChoice(wrk_223_ruga_tradearmor,B_BuildBuyArmorString(sfb_armor_l),wrk_223_ruga_tradearmor_sfbarmor_l);
	};
};

func void wrk_223_ruga_tradearmor_sfbarmor_l()
{
	B_GiveInvItems(hero,self,itmi_silver,sfb_armor_l.value);
	AI_Output(self,hero,"WRK_223_TRADEARMOR_SfbArmor_L_09_01");	//Hier ist deine Ware.
	B_GiveInvItems(self,hero,sfb_armor_l,1);
	AI_StopProcessInfos(self);
};

func void wrk_223_ruga_tradearmor_vlkarmor_m()
{
	B_GiveInvItems(hero,self,itmi_silver,vlk_armor_m.value);
	AI_Output(self,hero,"WRK_223_TRADEARMOR_VlkArmor_M_09_01");	//Ich hoffe, du wirst glücklich damit.
	B_GiveInvItems(self,hero,vlk_armor_m,1);
	AI_StopProcessInfos(self);
};

func void wrk_223_ruga_tradearmor_armorvlk_l()
{
	B_GiveInvItems(hero,self,itmi_silver,vlk_armor_l.value);
	AI_Output(self,hero,"WRK_223_TRADEARMOR_ArmorVlk_L_09_01");	//Eine gute Wahl.
	B_GiveInvItems(self,hero,vlk_armor_l,1);
	AI_StopProcessInfos(self);
};


instance WRK_223_RUGA_BRINGMEAL(C_Info)
{
	npc = wrk_223_ruga;
	nr = 6;
	condition = wrk_223_ruga_bringmeal_condition;
	information = wrk_223_ruga_bringmeal_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich hab deine Suppe.";
};


func int wrk_223_ruga_bringmeal_condition()
{
	if(INT_RUGAWANTSMEAL && (Npc_HasItems(hero,itfo_meatbugsoup) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_bringmeal_info()
{
	AI_Output(hero,self,"WRK_223_BRINGMEAL_15_01");	//Ich hab deine Suppe.
	B_GiveInvItems(self,hero,itfo_meatbugsoup,1);
	AI_Output(self,hero,"WRK_223_BRINGMEAL_09_02");	//Immer her damit!
	INT_RUGAWANTSMEAL = FALSE;
	INT_RUGAANGRY = FALSE;
	INT_RUGACALM = TRUE;
	Log_SetTopicStatus(CH1_RUGAWANTSMEAL,LOG_SUCCESS);
	B_LogEntry(CH1_RUGAWANTSMEAL,"Ruga hat sich beruhigt, nachdem ich Ihm die Suppe gebracht habe.");
};


instance WRK_223_RUGA_BRINGMEALNOTREADY(C_Info)
{
	npc = wrk_223_ruga;
	nr = 7;
	condition = wrk_223_ruga_bringmealnotready_condition;
	information = wrk_223_ruga_bringmealnotready_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welches Essen soll ich dir bringen?";
};


func int wrk_223_ruga_bringmealnotready_condition()
{
	if(INT_RUGAWANTSMEAL && (Npc_HasItems(hero,itfo_meatbugsoup) < 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_223_ruga_bringmealnotready_info()
{
	AI_Output(hero,self,"WRK_223_BRINGMEALNOTREADY_15_01");	//Welches Essen soll ich dir bringen?
	AI_Output(self,hero,"WRK_223_BRINGMEALNOTREADY_09_02");	//Meatbugsuppe! Das solltest selbst du dir merken können!
	AI_StopProcessInfos(self);
};

