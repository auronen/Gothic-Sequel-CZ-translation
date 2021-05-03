
instance MIL_100_HALVOR_EXIT(C_Info)
{
	npc = mil_100_halvor;
	nr = 999;
	condition = mil_100_halvor_exit_condition;
	information = mil_100_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mil_100_halvor_exit_condition()
{
	return TRUE;
};

func void mil_100_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_100_HALVOR_COOK(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_cook_condition;
	information = mil_100_halvor_cook_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du musst der Koch sein!";
};


func int mil_100_halvor_cook_condition()
{
	return TRUE;
};

func void mil_100_halvor_cook_info()
{
	AI_Output(hero,self,"MIL_100_COOK_15_01");	//Du musst der Koch sein!
	AI_Output(self,hero,"MIL_100_COOK_00_02");	//Bist ja ein ganz Schlauer! Hab dich hier noch nie gesehen!
};


instance MIL_100_HALVOR_WANTBUY(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_wantbuy_condition;
	information = mil_100_halvor_wantbuy_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du Essen für mich?";
};


func int mil_100_halvor_wantbuy_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_cook))
	{
		return TRUE;
	};
};

func void mil_100_halvor_wantbuy_info()
{
	AI_Output(hero,self,"MIL_100_WANTBUY_15_01");	//Hast du Essen für mich?
	AI_Output(self,hero,"MIL_100_WANTBUY_00_02");	//Geschnorrt wird hier nicht. Wer was zu Essen haben will bezahlt dafür!
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Halvor betreibt die Burgküche. Er scheint sich auf FLEISCHEINTOPF 'spezialisiert' zu haben.");
};


instance MIL_100_HALVOR_TRADE(C_Info)
{
	npc = mil_100_halvor;
	nr = 20;
	condition = mil_100_halvor_trade_condition;
	information = mil_100_halvor_trade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Zeig mir deine Speisekarte!";
};


func int mil_100_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_wantbuy))
	{
		return TRUE;
	};
};

func void mil_100_halvor_trade_info()
{
	AI_Output(hero,self,"MIL_100_TRADE_15_01");	//Zeig mir deine Speisekarte!
	AI_Output(self,hero,"MIL_100_TRADE_00_02");	//Was willst du haben?
	Info_ClearChoices(mil_100_halvor_trade);
	Info_AddChoice(mil_100_halvor_trade,DIALOG_BACK,mil_100_halvor_trade_back);
	Info_AddChoice(mil_100_halvor_trade,b_buildbuymealstring(10,NAME_MEATSTEW,VALUE_MEATSTEW),mil_100_halvor_trade_manystew);
	Info_AddChoice(mil_100_halvor_trade,b_buildbuymealstring(5,NAME_MEATSTEW,VALUE_MEATSTEW),mil_100_halvor_trade_fewstew);
	Info_AddChoice(mil_100_halvor_trade,b_buildbuymealstring(1,NAME_MEATSTEW,VALUE_MEATSTEW),mil_100_halvor_trade_1stew);
};

func void mil_100_halvor_trade_meal(var int amount,var int itemInstance,var int price)
{
	if(Npc_HasItems(hero,itmi_silver) >= (amount * price))
	{
		B_GiveInvItems(hero,self,itmi_silver,amount * price);
		B_GiveInvItems(self,hero,itemInstance,amount);
		AI_Output(self,hero,"MIL_100_TRADE_MEAL_00_01");	//Silber gegen Ware, so gefällt mir das!
		HALVOR_BOUGHTMEATSTEW = TRUE;
	}
	else
	{
		B_Say(self,hero,"$NotEnoughSilver");
	};
};

func void mil_100_halvor_trade_1stew()
{
	Info_ClearChoices(mil_100_halvor_trade);
	mil_100_halvor_trade_meal(1,4558,VALUE_MEATSTEW);
};

func void mil_100_halvor_trade_fewstew()
{
	Info_ClearChoices(mil_100_halvor_trade);
	mil_100_halvor_trade_meal(5,4558,VALUE_MEATSTEW);
};

func void mil_100_halvor_trade_manystew()
{
	Info_ClearChoices(mil_100_halvor_trade);
	mil_100_halvor_trade_meal(10,4558,VALUE_MEATSTEW);
};

func void mil_100_halvor_trade_back()
{
	Info_ClearChoices(mil_100_halvor_trade);
};


instance MIL_100_HALVOR_STEWGOOD(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_stewgood_condition;
	information = mil_100_halvor_stewgood_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dein Fleischeintopf schmeckt sehr gut!";
};


func int mil_100_halvor_stewgood_condition()
{
	if(HALVOR_BOUGHTMEATSTEW && Npc_KnowsInfo(hero,wrk_227_snaf_igo) && !Npc_KnowsInfo(hero,mil_100_halvor_fewchoices))
	{
		return TRUE;
	};
};

func void mil_100_halvor_stewgood_info()
{
	AI_Output(hero,self,"MIL_100_STEWGOOD_15_01");	//Dein Fleischeintopf schmeckt sehr gut!
	AI_Output(self,hero,"MIL_100_STEWGOOD_00_02");	//HA... Das kannst du laut sagen.
};


instance MIL_100_HALVOR_FEWCHOICES(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_fewchoices_condition;
	information = mil_100_halvor_fewchoices_info;
	important = FALSE;
	permanent = FALSE;
	description = "Deine Auswahl ist ja nicht gerade berauschend!";
};


func int mil_100_halvor_fewchoices_condition()
{
	if(HALVOR_BOUGHTMEATSTEW && Npc_KnowsInfo(hero,wrk_227_snaf_igo) && !Npc_KnowsInfo(hero,mil_100_halvor_stewgood))
	{
		return TRUE;
	};
};

func void mil_100_halvor_fewchoices_info()
{
	AI_Output(hero,self,"MIL_100_FEWCHOICES_15_01");	//Deine Auswahl ist ja nicht gerade berauschend!
	AI_Output(self,hero,"MIL_100_FEWCHOICES_00_02");	//Wenn es dir nicht passt, kannst du ja den Schweinefrass von diesem Versager Snaf essen!
};


instance MIL_100_HALVOR_SNAF(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_snaf_condition;
	information = mil_100_halvor_snaf_info;
	important = FALSE;
	permanent = FALSE;
	description = "Den Leuten schmeckt es hier wohl besser als bei Snaf, was?";
};


func int mil_100_halvor_snaf_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_stewgood) || Npc_KnowsInfo(hero,mil_100_halvor_fewchoices))
	{
		return TRUE;
	};
};

func void mil_100_halvor_snaf_info()
{
	AI_Output(hero,self,"MIL_100_SNAF_15_01");	//Den Leuten schmeckt es hier wohl besser als bei Snaf, was?
	AI_Output(self,hero,"MIL_100_SNAF_00_02");	//Snaf's jämmerliche Suppe wäre nicht mal was für den Schweinetrog meines Vetters in Khorinis.
	AI_Output(self,hero,"MIL_100_SNAF_00_03");	//HA... dieser armseelige Nichtsnutz sollte sich mal so langsam was überlegen, wenn er im Geschäft bleiben will.
	AI_Output(self,hero,"MIL_100_SNAF_00_04");	//Meine neues Rezept kommt sehr gut an. Die Leute können garnicht genug davon bekommen.
	B_LogEntry(CH1_LEARNCOOKING,"Halvor scheint offensichtlich ein neues Rezept zu verwenden, dass bei den Lagerbewohnern sehr gut anzukommen scheint.");
};


instance MIL_100_HALVOR_RECIPE(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_recipe_condition;
	information = mil_100_halvor_recipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Das Rezept für den Fleisch-Eintopf?";
};


func int mil_100_halvor_recipe_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_snaf))
	{
		return TRUE;
	};
};

func void mil_100_halvor_recipe_info()
{
	AI_Output(hero,self,"MIL_100_RECIPE_15_01");	//Das Rezept für den Fleisch-Eintopf?
	AI_Output(self,hero,"MIL_100_RECIPE_00_02");	//Richtig. Ich glaube fast, das mein Kochbuch das wertvollste Stück Papier in diesem Lager hier ist! (lacht laut)
};


instance MIL_100_HALVOR_WANTRECIPE(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_wantrecipe_condition;
	information = mil_100_halvor_wantrecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Verkaufst du mir das Rezept?";
};


func int mil_100_halvor_wantrecipe_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_recipe))
	{
		return TRUE;
	};
};

func void mil_100_halvor_wantrecipe_info()
{
	AI_Output(hero,self,"MIL_100_WANTRECIPE_15_01");	//Verkaufst du mir das Rezept?
	AI_Output(self,hero,"MIL_100_WANTRECIPE_00_02");	//HA... HA... du musst mich ja für völlig verblödet halten.
	AI_Output(self,hero,"MIL_100_WANTRECIPE_00_03");	//Das Rezept bleibt schön da wo es ist. In meiner gut verschlossenen Truhe.
	AI_Output(hero,self,"MIL_100_WANTRECIPE_15_04");	//Verstehe!
	B_LogEntry(CH1_LEARNCOOKING,"Halvor bewahrt sein neues Rezept in seiner gut verschlossenen Truhe auf.");
};


instance MIL_100_HALVOR_FROMSNAF(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_fromsnaf_condition;
	information = mil_100_halvor_fromsnaf_info;
	important = FALSE;
	permanent = FALSE;
	description = "Snaf hat mich beauftragt herauszufinden, warum seine Kunden...";
};


func int mil_100_halvor_fromsnaf_condition()
{
	if((Npc_KnowsInfo(hero,mil_100_halvor_stewgood) || Npc_KnowsInfo(hero,mil_100_halvor_fewchoices)) && !Npc_KnowsInfo(hero,mil_100_halvor_wantrecipe))
	{
		return TRUE;
	};
};

func void mil_100_halvor_fromsnaf_info()
{
	AI_Output(hero,self,"MIL_100_FROMSNAF_15_01");	//Snaf hat mich beauftrag herauszufinden, warum seine Kunden zu dir überlaufen!
	AI_Output(self,hero,"MIL_100_FROMSNAF_00_02");	//HA..., dann solltest du Snaf zurückgehen und ihm sagen, das liegt daran, dass er ein mieserabler Koch ist.
	AI_Output(self,hero,"MIL_100_FROMSNAF_00_03");	//Ausserdem hab ich nichts übrig für Spione von Snaf, also mach, dass du dich hier nicht mehr sehen lässt!
	AI_StopProcessInfos(self);
};


instance MIL_100_HALVOR_SNAFSPY(C_Info)
{
	npc = mil_100_halvor;
	nr = 2;
	condition = mil_100_halvor_snafspy_condition;
	information = mil_100_halvor_snafspy_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_100_halvor_snafspy_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_fromsnaf) && c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void mil_100_halvor_snafspy_info()
{
	AI_Output(self,hero,"MIL_100_SNAFSPY_00_01");	//Mach das du hier verschwindest.
	AI_Output(self,hero,"MIL_100_SNAFSPY_00_02");	//Spione von Snaf sind hier nicht willkommen!
	AI_StopProcessInfos(self);
};


instance MIL_100_HALVOR_LIAR(C_Info)
{
	npc = mil_100_halvor;
	condition = mil_100_halvor_liar_condition;
	information = mil_100_halvor_liar_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_100_halvor_liar_condition()
{
	if(SNAF_MILITIAFRIGHTENED >= 1)
	{
		return TRUE;
	};
};

func void mil_100_halvor_liar_info()
{
	AI_Output(self,hero,"MIL_100_LIAR_00_01");	//Hab gehört, du verbreitest Lügen über meinen Fleischeintopf!
	AI_Output(self,hero,"MIL_100_LIAR_00_02");	//Behauptest da wäre Menschenfleisch drin und so!
	AI_Output(self,hero,"MIL_100_LIAR_00_03");	//Muss dir wohl ein paar Manieren beibringen, Junge!
	AI_StopProcessInfos(self);
	b_attackproper(self,hero);
};


instance MIL_100_HALVOR_LIAR2(C_Info)
{
	npc = mil_100_halvor;
	nr = 2;
	condition = mil_100_halvor_liar2_condition;
	information = mil_100_halvor_liar2_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_100_halvor_liar2_condition()
{
	if(Npc_KnowsInfo(hero,mil_100_halvor_liar) && c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void mil_100_halvor_liar2_info()
{
	AI_Output(self,hero,"MIL_100_LIAR2_00_01");	//Mach das du hier verschwindest.
	AI_Output(self,hero,"MIL_100_LIAR2_00_02");	//Ich kann miese Lügner wie dich nicht ausstehen!
	AI_StopProcessInfos(self);
};

