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

//	description	 = 	"Du musst der Koch sein!";
	description	 = 	"Ty musíš být kuchař!";
};

func int MIL_100_Halvor_COOK_Condition ()
{
	return TRUE;
};

func void MIL_100_Halvor_COOK_Info ()
{
//	AI_Output			(hero, self, "MIL_100_COOK_15_01"); //Du musst der Koch sein!
	AI_Output			(hero, self, "MIL_100_COOK_15_01"); //Ty musíš být kuchař!
//	AI_Output			(self, hero, "MIL_100_COOK_00_02"); //Bist ja ein ganz Schlauer! Hab dich hier noch nie gesehen!
	AI_Output			(self, hero, "MIL_100_COOK_00_02"); //No, ty jsi ale chytrák! Tebe jsem tu ještě neviděl!
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

//	description	 = 	"Hast du Essen für mich?";
	description	 = 	"Máš pro mě jídlo?";
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
//	AI_Output			(hero, self, "MIL_100_WANTBUY_15_01"); //Hast du Essen für mich?
	AI_Output			(hero, self, "MIL_100_WANTBUY_15_01"); //Máš pro mě jídlo?
//	AI_Output			(self, hero, "MIL_100_WANTBUY_00_02"); //Geschnorrt wird hier nicht. Wer was zu Essen haben will bezahlt dafür!
	AI_Output			(self, hero, "MIL_100_WANTBUY_00_02"); //Somrovat se tady nebude. Kdo chce něco jíst, bude za to taky platit!

	Log_CreateTopic		(GE_TraderOC, LOG_NOTE);
//	B_LogEntry			(GE_TraderOC,"Halvor betreibt die Burgküche. Er scheint sich auf FLEISCHEINTOPF 'spezialisiert' zu haben.");
	B_LogEntry			(GE_TraderOC,"Halvor má na starosti hradní kuchyň. Vypadá to, že se 'specializoval' na MASNÝ VÝVAR.");
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
//	description	 = 	"Zeig mir deine Speisekarte!";
	description	 = 	"Ukaž mi svůj jídelní lístek!";
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
//	AI_Output			(hero, self, "MIL_100_TRADE_15_01"); //Zeig mir deine Speisekarte!
	AI_Output			(hero, self, "MIL_100_TRADE_15_01"); //Ukaž mi svůj jídelní lístek!
//	AI_Output			(self, hero, "MIL_100_TRADE_00_02"); //Was willst du haben?
	AI_Output			(self, hero, "MIL_100_TRADE_00_02"); //Co bys rád?

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

//		AI_Output		(self, hero, "MIL_100_TRADE_MEAL_00_01"); //Silber gegen Ware, so gefällt mir das!
		AI_Output		(self, hero, "MIL_100_TRADE_MEAL_00_01"); //Za zaboží stříbro, tak se mi to líbí!

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

//	description	 = 	"Dein Fleischeintopf schmeckt sehr gut!";
	description	 = 	"Tvůj vývar z masa je dost chutný!";
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
//	AI_Output			(hero, self, "MIL_100_STEWGOOD_15_01"); //Dein Fleischeintopf schmeckt sehr gut!
	AI_Output			(hero, self, "MIL_100_STEWGOOD_15_01"); //Tvůj vývar z masa je dost chutný!
//	AI_Output			(self, hero, "MIL_100_STEWGOOD_00_02"); //HA... Das kannst du laut sagen.
	AI_Output			(self, hero, "MIL_100_STEWGOOD_00_02"); //HA... To můžeš říct klidně nahlas.
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

//	description	 = 	"Deine Auswahl ist ja nicht gerade berauschend!";
	description	 = 	"Tvoje nabídka teda není dvakrát lákavá!";
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
//	AI_Output			(hero, self, "MIL_100_FEWCHOICES_15_01"); //Deine Auswahl ist ja nicht gerade berauschend!
	AI_Output			(hero, self, "MIL_100_FEWCHOICES_15_01"); //Tvoje nabídka teda není dvakrát lákavá!
//	AI_Output			(self, hero, "MIL_100_FEWCHOICES_00_02"); //Wenn es dir nicht passt, kannst du ja den Schweinefrass von diesem Versager Snaf essen!
	AI_Output			(self, hero, "MIL_100_FEWCHOICES_00_02"); //Pokud ti to nesedí, můžeš si jíst šlichtu od toho nemehla Snafa!
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

//	description	 = 	"Den Leuten schmeckt es hier wohl besser als bei Snaf, was?";
	description	 = 	"Lidem to tu chutná o dost lépe než u Snafa, že?";
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
//	AI_Output			(hero, self, "MIL_100_SNAF_15_01"); //Den Leuten schmeckt es hier wohl besser als bei Snaf, was?
	AI_Output			(hero, self, "MIL_100_SNAF_15_01"); //Lidem to tu chutná o dost lépe než u Snafa, že?
//	AI_Output			(self, hero, "MIL_100_SNAF_00_02"); //Snaf's jämmerliche Suppe wäre nicht mal was für den Schweinetrog meines Vetters in Khorinis.
	AI_Output			(self, hero, "MIL_100_SNAF_00_02"); //Ty Snafova děsná polévka by nežrala ani prasata mého bratrance v Khorinidu.
//	AI_Output			(self, hero, "MIL_100_SNAF_00_03"); //HA... dieser armseelige Nichtsnutz sollte sich mal so langsam was überlegen, wenn er im Geschäft bleiben will.
	AI_Output			(self, hero, "MIL_100_SNAF_00_03"); //HA... ten ubohý ničema by se měl nad sebou pomalu zamyslet, jestli se chce udržet v obchodu.
//	AI_Output			(self, hero, "MIL_100_SNAF_00_04"); //Meine neues Rezept kommt sehr gut an. Die Leute können garnicht genug davon bekommen.
	AI_Output			(self, hero, "MIL_100_SNAF_00_04"); //Mému novému receptu se velmi daří. Lidé se toho nemůžou nabažit.

//	B_LogEntry			(CH1_LearnCooking, "Halvor scheint offensichtlich ein neues Rezept zu verwenden, dass bei den Lagerbewohnern sehr gut anzukommen scheint.");
	B_LogEntry			(CH1_LearnCooking, "Zdá se, že Halvor začal vařit podle nového receptu, a ten byl patrně obyvateli tábora výborně přijat.");
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

//	description	 = 	"Das Rezept für den Fleisch-Eintopf?";
	description	 = 	"Recept na masný vývar?";
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
//	AI_Output			(hero, self, "MIL_100_RECIPE_15_01"); //Das Rezept für den Fleisch-Eintopf?
	AI_Output			(hero, self, "MIL_100_RECIPE_15_01"); //Recept na masný vývar?
//	AI_Output			(self, hero, "MIL_100_RECIPE_00_02"); //Richtig. Ich glaube fast, das mein Kochbuch das wertvollste Stück Papier in diesem Lager hier ist! (lacht laut)
	AI_Output			(self, hero, "MIL_100_RECIPE_00_02"); //Přesně tak. To si pamatuj, že moje kuchařka je tím nejcennějším kusem papíru v tomhle táboře! (nahlas se směje)
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

//	description	 = 	"Verkaufst du mir das Rezept?";
	description	 = 	"Prodáš mi ten recept?";
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
//	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_01"); //Verkaufst du mir das Rezept?
	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_01"); //Prodáš mi ten recept?
//	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_02"); //HA... HA... du musst mich ja für völlig verblödet halten.
	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_02"); //HA... HA... ty mě asi máš za naprostýho blázna.
//	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_03"); //Das Rezept bleibt schön da wo es ist. In meiner gut verschlossenen Truhe.
	AI_Output			(self, hero, "MIL_100_WANTRECIPE_00_03"); //Recept zůstane hezky tam, kde je. V mojí dobře uzamčené truhle.
//	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_04"); //Verstehe!
	AI_Output			(hero, self, "MIL_100_WANTRECIPE_15_04"); //Rozumím!

//	B_LogEntry			(CH1_LearnCooking, "Halvor bewahrt sein neues Rezept in seiner gut verschlossenen Truhe auf.");
	B_LogEntry			(CH1_LearnCooking, "Halvor schovává svůj nový recept ve své dobře zamčené truhle.");
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

//	description	 = 	"Snaf hat mich beauftragt herauszufinden, warum seine Kunden...";
	description	 = 	"Snaf mě pověřil tím, abych zjistil, proč jeho zákazníci...";
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
//	AI_Output			(hero, self, "MIL_100_FROMSNAF_15_01"); //Snaf hat mich beauftrag herauszufinden, warum seine Kunden zu dir überlaufen!
	AI_Output			(hero, self, "MIL_100_FROMSNAF_15_01"); //Snaf mě pověřil tím, abych zjistil, proč jeho zákazníci utekli k tobě!
//	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_02"); //HA..., dann solltest du Snaf zurückgehen und ihm sagen, das liegt daran, dass er ein mieserabler Koch ist.
	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_02"); //HA..., tak to bys měl jít zpátky za Snafem a říct mu, že je to tím, že je to mizernej kuchař.
//	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_03"); //Ausserdem hab ich nichts übrig für Spione von Snaf, also mach, dass du dich hier nicht mehr sehen lässt!
	AI_Output			(self, hero, "MIL_100_FROMSNAF_00_03"); //A kromě toho už nemám nic pro Snafovy špehy, takže si hlídej, aby tě tu už nikdo ani neviděl!
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
//	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_01"); //Mach das du hier verschwindest.
	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_01"); //Koukej odtud zmizet.
//	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_02"); //Spione von Snaf sind hier nicht willkommen!
	AI_Output			(self, hero, "MIL_100_SNAFSPY_00_02"); //Snafovi špehové tu nejsou vítáni!
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
//	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_01"); //Hey, was ist das?
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_01"); //Hej, co to je?
//	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_02"); //Das ist doch MEIN Rezeptbuch!!!
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_02"); //Vždyť to je MOJE kuchařka!!!
//	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_03"); //Na warte, das gibt Prügel!
	AI_Output			(self, hero, "MIL_100_STOLERECIPE_00_03"); //No jen počkej! To bude nakládačka!
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
//	AI_Output			(self, hero, "MIL_100_LIAR_00_01"); //Hab gehört, du verbreitest Lügen über meinen Fleischeintopf!
	AI_Output			(self, hero, "MIL_100_LIAR_00_01"); //Slyšel jsem, že roznášíš lži o mém vývaru!
//	AI_Output			(self, hero, "MIL_100_LIAR_00_02"); //Behauptest da wäre Menschenfleisch drin und so!
	AI_Output			(self, hero, "MIL_100_LIAR_00_02"); //Že tvrdíš, že je v něm lidské maso a tak!
//	AI_Output			(self, hero, "MIL_100_LIAR_00_03"); //Muss dir wohl ein paar Manieren beibringen, Junge!
	AI_Output			(self, hero, "MIL_100_LIAR_00_03"); //Bude tě muset naučit slušnému chování, chlapče!
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
//	AI_Output			(self, hero, "MIL_100_LIAR2_00_01"); //Mach das du hier verschwindest.
	AI_Output			(self, hero, "MIL_100_LIAR2_00_01"); //Koukej odsud zmizet.
//	AI_Output			(self, hero, "MIL_100_LIAR2_00_02"); //Ich kann miese Lügner wie dich nicht ausstehen!
	AI_Output			(self, hero, "MIL_100_LIAR2_00_02"); //Sprosté lháře jako tebe já nemůžu vystát!
	AI_StopProcessInfos	(self);
};



































