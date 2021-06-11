///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
INSTANCE BEG_702_Nabor_EXIT   (C_INFO)
{
	npc         = BEG_702_Nabor;
	nr          = 999;
	condition   = BEG_702_Nabor_EXIT_Condition;
	information = BEG_702_Nabor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT BEG_702_Nabor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID BEG_702_Nabor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info TIP
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_TIP		(C_INFO)
{
	npc		 = 	BEG_702_Nabor;
	nr		 = 	1;
	condition	 = 	BEG_702_Nabor_TIP_Condition;
	information	 = 	BEG_702_Nabor_TIP_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tady děláš?";
};

func int BEG_702_Nabor_TIP_Condition ()
{
	return TRUE;
};

func int BEG_702_Nabor_TIP_Info ()
{
//	AI_Output			(hero, self, "BEG_702_TIP_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "BEG_702_TIP_15_01"); //Co tady děláš?
//	AI_Output			(self, hero, "BEG_702_TIP_00_02"); //Ich sitze hier und frage mich, ob du der Richtige bist.
	AI_Output			(self, hero, "BEG_702_TIP_00_02"); //Sedím tu a ptám se sám sebe, jestli nejsi ten pravý.
//	AI_Output			(hero, self, "BEG_702_TIP_15_03"); //Der Richtige? Wofür?
	AI_Output			(hero, self, "BEG_702_TIP_15_03"); //Ten pravý? A na co?
//	AI_Output			(self, hero, "BEG_702_TIP_00_04"); //Der richtige Mann, der eine wertvolle Information für wenig Silber kaufen will. Aber ich glaube, du bist es nicht. Oder doch?
	AI_Output			(self, hero, "BEG_702_TIP_00_04"); //Ten pravý muž, který by chtěl za trochu stříbra koupit cennou informaci. Ale nevěřím, že bys to byl ty. Nebo snad ano?

//	Info_AddChoice	(BEG_702_Nabor_TIP, "Ich bin der Richtige. Her mit der Information.", BEG_702_Nabor_TIP_RIGHTMAN );
	Info_AddChoice	(BEG_702_Nabor_TIP, "Já jsem ten pravý. Sem s tou informací.", BEG_702_Nabor_TIP_RIGHTMAN );
//	Info_AddChoice	(BEG_702_Nabor_TIP, "Wie teuer ist deine Information?", BEG_702_Nabor_TIP_HOWMUCH );
	Info_AddChoice	(BEG_702_Nabor_TIP, "Kolik stojí ta tvoje informace?", BEG_702_Nabor_TIP_HOWMUCH );
//	Info_AddChoice	(BEG_702_Nabor_TIP, "Ich glaube du willst nur schnell ein bisschen Silber abstauben. ", BEG_702_Nabor_TIP_TRICK );
	Info_AddChoice	(BEG_702_Nabor_TIP, "Řekl bych, že jen chceš trochu toho stříbra štípnout.", BEG_702_Nabor_TIP_TRICK );


};
func void BEG_702_Nabor_TIP_TRICK ()
{
//	AI_Output			(hero, self, "BEG_702_TIP_TRICK_15_01"); //Ich glaube du willst nur schnell ein bisschen Silber abstauben.
	AI_Output			(hero, self, "BEG_702_TIP_TRICK_15_01"); //Řekl bych, že jen chceš trochu toho stříbra štípnout.
//	AI_Output			(self, hero, "BEG_702_TIP_TRICK_00_02"); //Ich wußte doch das du nicht der Richtige bist.
	AI_Output			(self, hero, "BEG_702_TIP_TRICK_00_02"); //Však jsem věděl, že ty nejsi ten pravý.
	AI_StopProcessInfos (self);


};
func void BEG_702_Nabor_TIP_HOWMUCH ()
{
//	AI_Output			(hero, self, "BEG_702_TIP_HOWMUCH_15_01"); //Wie teuer ist deine Information?
	AI_Output			(hero, self, "BEG_702_TIP_HOWMUCH_15_01"); //Kolik stojí ta tvoje informace?
//	AI_Output			(self, hero, "BEG_702_TIP_HOWMUCH_00_02"); //Für dich nur 10 Silberstücke. Wenn du die hast, kommen wir ins Geschäft.
	AI_Output			(self, hero, "BEG_702_TIP_HOWMUCH_00_02"); //Pro tebe jen 10 stříbrných. Pokud je máš, můžeme obchodovat.
	Nabor_10 = TRUE;
	Info_ClearChoices (BEG_702_Nabor_TIP);

};

func void BEG_702_Nabor_TIP_RIGHTMAN ()
{
//	AI_Output			(hero, self, "BEG_702_TIP_RIGHTMAN_15_01"); //Ich bin der Richtige. Her mit der Information.
	AI_Output			(hero, self, "BEG_702_TIP_RIGHTMAN_15_01"); //Já jsem ten pravý. Sem s tou informací.
//	AI_Output			(self, hero, "BEG_702_TIP_RIGHTMAN_00_02"); //Die kostet allerdings 20 Silberstücke. Kein Verhandeln. Kein Feilschen. Sprich mich an, wenn du das Geld hast.
	AI_Output			(self, hero, "BEG_702_TIP_RIGHTMAN_00_02"); //Ta ale stojí 20 stříbrných. Žádné dohadování. Žádné smlouvání. Řekni mi, až budeš mít ty peníze.
	Nabor_20 = TRUE;
	Info_ClearChoices (BEG_702_Nabor_TIP);

};
///////////////////////////////////////////////////////////////////////
//	Info BUYINFO
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_BUYINFO		(C_INFO)
{
	npc		 = 	BEG_702_Nabor;
	nr		 = 	1;
	condition	 = 	BEG_702_Nabor_BUYINFO_Condition;
	information	 = 	BEG_702_Nabor_BUYINFO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Okay, hier ist dein Silber";
	description	 = 	"Dobrá, tady je tvoje stříbro.";
};

func int BEG_702_Nabor_BUYINFO_Condition ()
{
	if	((Npc_HasItems (hero,ItMi_Silver) >= 20) && Nabor_20)
	||	((Npc_HasItems (hero,ItMi_Silver) >= 10) && Nabor_10)
	{
		return TRUE;
	};
};
func int BEG_702_Nabor_BUYINFO_Info ()
{
	if	Nabor_20
	{
//		AI_Output		(hero, self, "BEG_702_BUYINFO_15_01"); //Okay, hier sind die 20 Silberstücke.
		AI_Output		(hero, self, "BEG_702_BUYINFO_15_01"); //Dobrá, tady máš svých dvacet stříbrných.
		B_GiveInvItems	(hero, self, itMi_Silver,20);
	};
	if	Nabor_10
	{
//		AI_Output		(hero, self, "BEG_702_BUYINFO_15_02"); //Okay, hier sind die 10 Silberstücke.
		AI_Output		(hero, self, "BEG_702_BUYINFO_15_02"); //Dobrá, tady je tvých deset stříbrných.
		B_GiveInvItems	(hero, self, itMi_Silver,10);
	};
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_03"); //Okay, hier ist die Information. Also hör gut zu: Viele halten uns nur für Bettler. Und das ist gut so.
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_03"); //Dobře a tady tvoje informace. Takže dobře poslouchej: mnozí nás mají jen za žebráky. A je to tak dobře.
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_04"); //Aber wir sind die Augen und die Ohren dieses Lagers. Alles was hier passiert, jedes krumme Ding das gedreht wird...
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_04"); //Ale my jsme ušima a očima tohoto tábora. Všechno, co se tu stane, jakákoli nekalá záležitost, co se tu namane...
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_05"); //Wir wissen es.
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_05"); //My o ní víme.
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_06"); //Und wir verwahren dieses Wissen. Und du bist der Mann, der davon profitieren kann.
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_06"); //A my si toto vědění uchováváme. A ty jsi ten muž, který z toho může těžit.
//	AI_Output			(hero, self, "BEG_702_BUYINFO_15_07"); //Was meinst du damit?
	AI_Output			(hero, self, "BEG_702_BUYINFO_15_07"); //Co tím myslíš?
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_08"); //Zeige dich den Bettlern dreimal großzügig. Dann suche Jesper. Er hat dir bestimmt interessante Dinge zu erzählen.
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_08"); //Předveď se před žebráky třikrát jako velkorysý. Pak vyhledej Jespera. Ten má jistě co zajímavého vyprávět.
//	AI_Output			(hero, self, "BEG_702_BUYINFO_15_09"); //Warum erzählst du das gerade mir?
	AI_Output			(hero, self, "BEG_702_BUYINFO_15_09"); //Proč o tom říkáš právě mně?
//	AI_Output			(self, hero, "BEG_702_BUYINFO_00_10"); //Weil du der richtige bist. Und weil wir ja auch davon profitieren , dir unser Wissen zu Verfügung zu stellen. Gegen ein kleines Entgelt...
	AI_Output			(self, hero, "BEG_702_BUYINFO_00_10"); //Protože ty jsi ten pravý. A protože i my z toho něco máme, když ti naše vědění dáváme k použití. Za malinkou odměnu...
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance BEG_702_Nabor_WHERE		(C_INFO)
{
	npc		 = 	BEG_702_Nabor;
	nr		 = 	1;
	condition	 = 	BEG_702_Nabor_WHERE_Condition;
	information	 = 	BEG_702_Nabor_WHERE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wo finde ich Jesper?";
	description	 = 	"Kde najdu Jespera?";
};

func int BEG_702_Nabor_WHERE_Condition ()
{
	if Npc_KnowsInfo (hero,BEG_702_Nabor_BUYINFO)
	{
		return TRUE;
	};
};
func void BEG_702_Nabor_WHERE_Info ()
{
//	AI_Output			(hero, self, "BEG_702_WHERE_15_01"); //Wo finde ich Jesper?
	AI_Output			(hero, self, "BEG_702_WHERE_15_01"); //Kde najdu Jespera?
//	AI_Output			(self, hero, "BEG_702_WHERE_00_02"); //Du musst ihn schon alleine finden. Ich nehme an, das wird keine Herausforderung für dich sein.
	AI_Output			(self, hero, "BEG_702_WHERE_00_02"); //Toho už musíš najít sám. Předpokládám, že pro tebe to žádná výzva nebude.
};




















