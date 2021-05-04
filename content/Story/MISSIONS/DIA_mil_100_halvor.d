///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE MIL_100_Halvor_EXIT   (C_INFO)
{
	npc         = MIL_100_Halvor;
	nr          = 999;
	condition   = MIL_100_Halvor_EXIT_Condition;
	information = MIL_100_Halvor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT MIL_100_Halvor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID MIL_100_Halvor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info COOK
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_COOK		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_COOK_Condition;
	information	 = 	MIL_100_Halvor_COOK_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Du musst der Koch sein!";
};

func int MIL_100_Halvor_COOK_Condition ()
{
	return TRUE;
};

func void MIL_100_Halvor_COOK_Info ()
{
	AI_Output			(hero, self, "MIL_100_COOK_15_01"); //Du musst der Koch sein!
	AI_Output			(self, hero, "MIL_100_COOK_00_02"); //Bist ja ein ganz Schlauer! Hab dich hier noch nie gesehen!
};

///////////////////////////////////////////////////////////////////////
//	Info WANTBUY
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_WANTBUY		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_WANTBUY_Condition;
	information	 = 	MIL_100_Halvor_WANTBUY_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Hast du Essen für mich?";
};

func int MIL_100_Halvor_WANTBUY_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_COOK)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_WANTBUY_Info ()
{
	AI_Output			(hero, self, "MIL_100_WANTBUY_15_01"); //Hast du Essen für mich?
	AI_Output			(self, hero, "MIL_100_WANTBUY_00_02"); //Geschnorrt wird hier nicht. Wer was zu Essen haben will bezahlt dafür!

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
	B_LogEntry			(GE_TraderOC,"Halvor betreibt die Burgküche. Er scheint sich auf FLEISCHEINTOPF 'spezialisiert' zu haben.");
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_TRADE		(C_INFO)
{
	npc		 	 = 	MIL_100_Halvor;
	nr		=	20;
	condition	 = 	MIL_100_Halvor_TRADE_Condition;
	information	 = 	MIL_100_Halvor_TRADE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;
	description	 = 	"Zeig mir deine Speisekarte!";
};

func int MIL_100_Halvor_TRADE_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_WANTBUY)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_TRADE_Info ()
{
	AI_Output			(hero, self, "MIL_100_TRADE_15_01"); //Zeig mir deine Speisekarte!
	AI_Output			(self, hero, "MIL_100_TRADE_00_02"); //Was willst du haben?

	Info_ClearChoices	(MIL_100_Halvor_TRADE);
	Info_AddChoice		(MIL_100_Halvor_TRADE,	DIALOG_BACK,												MIL_100_Halvor_TRADE_BACK);
	Info_AddChoice		(MIL_100_Halvor_TRADE,	B_BuildBuyMealString(10, NAME_MeatStew, Value_MeatStew),	MIL_100_Halvor_TRADE_MANYSTEW);
	Info_AddChoice		(MIL_100_Halvor_TRADE,	B_BuildBuyMealString(5,  NAME_MeatStew, Value_MeatStew),	MIL_100_Halvor_TRADE_FEWSTEW);
	Info_AddChoice		(MIL_100_Halvor_TRADE,	B_BuildBuyMealString(1,  NAME_MeatStew, Value_MeatStew),	MIL_100_Halvor_TRADE_1STEW);
};

func void	MIL_100_Halvor_TRADE_MEAL (var int amount, var int itemInstance, var int price)
{
	if	(Npc_HasItems(hero, ItMi_Silver) >= (amount*price))
	{
		B_GiveInvItems	(hero, self, ItMi_Silver,	amount*price);
		B_GiveInvItems	(self, hero, itemInstance,	amount);

		AI_Output		(self, hero, "MIL_100_TRADE_MEAL_00_01"); //Silber gegen Ware, so gefällt mir das!

		Halvor_BoughtMeatStew = TRUE;
	}
	else
	{
		B_Say			(self, hero, "$NotEnoughSilver");
	};
};

func void	MIL_100_Halvor_TRADE_1STEW ()
{
	Info_ClearChoices			(MIL_100_Halvor_TRADE);
	MIL_100_Halvor_TRADE_MEAL	(1,ItFo_MeatStew, Value_MeatStew);
};


func void	MIL_100_Halvor_TRADE_FEWSTEW ()
{
	Info_ClearChoices			(MIL_100_Halvor_TRADE);
	MIL_100_Halvor_TRADE_MEAL	(5,ItFo_MeatStew, Value_MeatStew);
};

func void	MIL_100_Halvor_TRADE_MANYSTEW ()
{
	Info_ClearChoices			(MIL_100_Halvor_TRADE);
	MIL_100_Halvor_TRADE_MEAL	(10,ItFo_MeatStew, Value_MeatStew);
};

func void	MIL_100_Halvor_TRADE_BACK ()
{
	Info_ClearChoices			(MIL_100_Halvor_TRADE);
};

///////////////////////////////////////////////////////////////////////
//	Info STEWGOOD
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_STEWGOOD		(C_INFO)
{
	npc		 	 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_STEWGOOD_Condition;
	information	 = 	MIL_100_Halvor_STEWGOOD_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Dein Fleischeintopf schmeckt sehr gut!";
};

func int MIL_100_Halvor_STEWGOOD_Condition ()
{
	if	Halvor_BoughtMeatStew
	&&	Npc_KnowsInfo(hero,WRK_227_Snaf_IGO)
	&&	!Npc_KnowsInfo(hero,MIL_100_Halvor_FEWCHOICES)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_STEWGOOD_Info ()
{
	AI_Output			(hero, self, "MIL_100_STEWGOOD_15_01"); //Dein Fleischeintopf schmeckt sehr gut!
	AI_Output			(self, hero, "MIL_100_STEWGOOD_00_02"); //HA... Das kannst du laut sagen.
};

///////////////////////////////////////////////////////////////////////
//	Info FEWCHOICES
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_FEWCHOICES		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_FEWCHOICES_Condition;
	information	 = 	MIL_100_Halvor_FEWCHOICES_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Deine Auswahl ist ja nicht gerade berauschend!";
};

func int MIL_100_Halvor_FEWCHOICES_Condition ()
{
	if	Halvor_BoughtMeatStew
	&&	Npc_KnowsInfo(hero,WRK_227_Snaf_IGO)
	&&	!Npc_KnowsInfo(hero,MIL_100_Halvor_STEWGOOD)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_FEWCHOICES_Info ()
{
	AI_Output			(hero, self, "MIL_100_FEWCHOICES_15_01"); //Deine Auswahl ist ja nicht gerade berauschend!
	AI_Output			(self, hero, "MIL_100_FEWCHOICES_00_02"); //Wenn es dir nicht passt, kannst du ja den Schweinefrass von diesem Versager Snaf essen!
};



///////////////////////////////////////////////////////////////////////
//	Info SNAF
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_SNAF		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_SNAF_Condition;
	information	 = 	MIL_100_Halvor_SNAF_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Den Leuten schmeckt es hier wohl besser als bei Snaf, was?";
};

func int MIL_100_Halvor_SNAF_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_STEWGOOD)
	||	Npc_KnowsInfo(hero,MIL_100_Halvor_FEWCHOICES)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_SNAF_Info ()
{
	AI_Output			(hero, self, "MIL_100_SNAF_15_01"); //Den Leuten schmeckt es hier wohl besser als bei Snaf, was?
	AI_Output			(self, hero, "MIL_100_SNAF_00_02"); //Snaf's jämmerliche Suppe wäre nicht mal was für den Schweinetrog meines Vetters in Khorinis.
	AI_Output			(self, hero, "MIL_100_SNAF_00_03"); //HA... dieser armseelige Nichtsnutz sollte sich mal so langsam was überlegen, wenn er im Geschäft bleiben will.
	AI_Output			(self, hero, "MIL_100_SNAF_00_04"); //Meine neues Rezept kommt sehr gut an. Die Leute können garnicht genug davon bekommen.

	B_LogEntry			(CH1_LearnCooking, "Halvor scheint offensichtlich ein neues Rezept zu verwenden, dass bei den Lagerbewohnern sehr gut anzukommen scheint.");
};

///////////////////////////////////////////////////////////////////////
//	Info RECIPE
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_RECIPE		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_RECIPE_Condition;
	information	 = 	MIL_100_Halvor_RECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Das Rezept für den Fleisch-Eintopf?";
};

func int MIL_100_Halvor_RECIPE_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_SNAF)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_RECIPE_Info ()
{
	AI_Output			(hero, self, "MIL_100_RECIPE_15_01"); //Das Rezept für den Fleisch-Eintopf?
	AI_Output			(self, hero, "MIL_100_RECIPE_00_02"); //Richtig. Ich glaube fast, das mein Kochbuch das wertvollste Stück Papier in diesem Lager hier ist! (lacht laut)
};

///////////////////////////////////////////////////////////////////////
//	Info WANTRECIPE
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_WANTRECIPE		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_WANTRECIPE_Condition;
	information	 = 	MIL_100_Halvor_WANTRECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Verkaufst du mir das Rezept?";
};

func int MIL_100_Halvor_WANTRECIPE_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_RECIPE)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_WANTRECIPE_Info ()
{
	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_01"); //Verkaufst du mir das Rezept?
	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_02"); //HA... HA... du musst mich ja für völlig verblödet halten.
	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_03"); //Das Rezept bleibt schön da wo es ist. In meiner gut verschlossenen Truhe.
	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_04"); //Verstehe!

	B_LogEntry			(CH1_LearnCooking, "Halvor bewahrt sein neues Rezept in seiner gut verschlossenen Truhe auf.");
};

///////////////////////////////////////////////////////////////////////
//	Info FROMSNAF
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_FROMSNAF		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_FROMSNAF_Condition;
	information	 = 	MIL_100_Halvor_FROMSNAF_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

	description	 = 	"Snaf hat mich beauftragt herauszufinden, warum seine Kunden...";
};

func int MIL_100_Halvor_FROMSNAF_Condition ()
{
	if	(Npc_KnowsInfo(hero,MIL_100_Halvor_STEWGOOD) || Npc_KnowsInfo(hero,MIL_100_Halvor_FEWCHOICES))
	&&	!Npc_KnowsInfo(hero,MIL_100_Halvor_WANTRECIPE)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_FROMSNAF_Info ()
{
	AI_Output			(hero, self, "MIL_100_FROMSNAF_15_01"); //Snaf hat mich beauftrag herauszufinden, warum seine Kunden zu dir überlaufen!
	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_02"); //HA..., dann solltest du Snaf zurückgehen und ihm sagen, das liegt daran, dass er ein mieserabler Koch ist.
	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_03"); //Ausserdem hab ich nichts übrig für Spione von Snaf, also mach, dass du dich hier nicht mehr sehen lässt!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SNAFSPY
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_SNAFSPY		(C_INFO)
{
	npc		 	 = 	MIL_100_Halvor;
	nr		 	 = 	2;
	condition	 = 	MIL_100_Halvor_SNAFSPY_Condition;
	information	 = 	MIL_100_Halvor_SNAFSPY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int MIL_100_Halvor_SNAFSPY_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_FROMSNAF)
	&&	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_SNAFSPY_Info ()
{
	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_01"); //Mach das du hier verschwindest.
	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_02"); //Spione von Snaf sind hier nicht willkommen!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info STOLERECIPE
///////////////////////////////////////////////////////////////////////
/*
instance MIL_100_Halvor_STOLERECIPE		(C_INFO)
{
	npc		 	 = 	MIL_100_Halvor;
	nr			 =	1;
	condition	 = 	MIL_100_Halvor_STOLERECIPE_Condition;
	information	 = 	MIL_100_Halvor_STOLERECIPE_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int MIL_100_Halvor_STOLERECIPE_Condition ()
{
	if	Npc_HasItems(hero, ItWr_HalvorRecipe)
	&&	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_STOLERECIPE_Info ()
{
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_01"); //Hey, was ist das?
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_02"); //Das ist doch MEIN Rezeptbuch!!!
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_03"); //Na warte, das gibt Prügel!
	AI_StopProcessInfos	(self);
	B_AttackProper		(self, hero);
};
*/

///////////////////////////////////////////////////////////////////////
//	Info LIAR
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_LIAR		(C_INFO)
{
	npc		 = 	MIL_100_Halvor;
	condition	 = 	MIL_100_Halvor_LIAR_Condition;
	information	 = 	MIL_100_Halvor_LIAR_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_100_Halvor_LIAR_Condition ()
{
	if	(Snaf_MilitiaFrightened >= 1)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_LIAR_Info ()
{
	AI_Output			(self, hero, "MIL_100_LIAR_00_01"); //Hab gehört, du verbreitest Lügen über meinen Fleischeintopf!
	AI_Output			(self, hero, "MIL_100_LIAR_00_02"); //Behauptest da wäre Menschenfleisch drin und so!
	AI_Output			(self, hero, "MIL_100_LIAR_00_03"); //Muss dir wohl ein paar Manieren beibringen, Junge!
	AI_StopProcessInfos	(self);
	B_AttackProper		(self, hero);
};

///////////////////////////////////////////////////////////////////////
//	Info LIAR2
///////////////////////////////////////////////////////////////////////
instance MIL_100_Halvor_LIAR2		(C_INFO)
{
	npc		 	 = 	MIL_100_Halvor;
	nr		 	 = 	2;
	condition	 = 	MIL_100_Halvor_LIAR2_Condition;
	information	 = 	MIL_100_Halvor_LIAR2_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int MIL_100_Halvor_LIAR2_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_100_Halvor_LIAR)
	&&	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void MIL_100_Halvor_LIAR2_Info ()
{
	AI_Output			(self, hero, "MIL_100_LIAR2_00_01"); //Mach das du hier verschwindest.
	AI_Output			(self, hero, "MIL_100_LIAR2_00_02"); //Ich kann miese Lügner wie dich nicht ausstehen!
	AI_StopProcessInfos	(self);
};



































