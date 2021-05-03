
instance WRK_225_AGON_EXIT(C_Info)
{
	npc = wrk_225_agon;
	nr = 999;
	condition = wrk_225_agon_exit_condition;
	information = wrk_225_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_225_agon_exit_condition()
{
	return TRUE;
};

func void wrk_225_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_225_AGON_WELCOME(C_Info)
{
	npc = wrk_225_agon;
	nr = 56;
	condition = wrk_225_agon_welcome_condition;
	information = wrk_225_agon_welcome_info;
	important = TRUE;
};


func int wrk_225_agon_welcome_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func int wrk_225_agon_welcome_info()
{
	AI_Output(self,hero,"WRK_225_WELCOME_00_01");	//Willkommen. Ich bin Agon. DER Agon. Was auch immer du suchst, ich kann es dir besorgen.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Agon prahlt damit, ALLES besorgen zu können, was man sucht. Er hat einen Stand im Händlerviertel.");
};


instance WRK_225_AGON_TRADE(C_Info)
{
	npc = wrk_225_agon;
	nr = 12;
	condition = wrk_225_agon_trade_condition;
	information = wrk_225_agon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Zeig mir deine Ware";
};


func int wrk_225_agon_trade_condition()
{
	return TRUE;
};

func int wrk_225_agon_trade_info()
{
	AI_Output(hero,self,"WRK_225_TRADE_15_01");	//Zeig mir deine Ware.
};


instance WRK_225_AGON_STOLEN(C_Info)
{
	npc = wrk_225_agon;
	nr = 10;
	condition = wrk_225_agon_stolen_condition;
	information = wrk_225_agon_stolen_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du wurdest bestohlen?";
};


func int wrk_225_agon_stolen_condition()
{
	if(CASSIAN_BEATHUDRYCH == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void wrk_225_agon_stolen_info()
{
	AI_Output(hero,self,"WRK_225_STOLEN_15_01");	//Du wurdest bestohlen?
	AI_Output(self,hero,"WRK_225_STOLEN_00_02");	//Ja das richtig. Aber was hast du damit zu tun?
	AI_Output(hero,self,"WRK_225_STOLEN_15_03");	//Cassian schickt mich. Ich bin der, der deine Sachen zurückholt
	AI_Output(self,hero,"WRK_225_STOLEN_00_04");	//Das wurde ja auch Zeit, das sich endlich mal jemand der Sache annimmt.
	AI_Output(self,hero,"WRK_225_STOLEN_00_05");	//Es war Huldrych! Er hat mich bestohlen! Mich! Ich habe ihn gesehen! Mit meinen eigenen Augen!
};


instance WRK_225_AGON_WAREZ(C_Info)
{
	npc = wrk_225_agon;
	condition = wrk_225_agon_warez_condition;
	information = wrk_225_agon_warez_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist dir gestohlen worden?";
};


func int wrk_225_agon_warez_condition()
{
	if(Npc_KnowsInfo(hero,wrk_225_agon_stolen))
	{
		return TRUE;
	};
};

func void wrk_225_agon_warez_info()
{
	AI_Output(hero,self,"WRK_225_WAREZ_15_01");	//Was ist dir gestohlen worden?
	AI_Output(self,hero,"WRK_225_WAREZ_00_02");	//Mein Silber! Mein gesamtes Silber hat er gestohlen!
	AI_Output(hero,self,"WRK_225_WAREZ_15_03");	//Und wieviel Silber war das so?
	AI_Output(self,hero,"WRK_225_WAREZ_00_04");	//100 Silberstücke! Jeden Taler habe ich mir mühsam zusammengespart! Dieser dreckige Langfinger muss bestraft werden!
	AI_Output(self,hero,"WRK_225_WAREZ_00_05");	//Diese Herumtreiber machen was sie wollen. Und wir, die EHRLICHEN Händler, die SCHUFTEN und ARBEITEN, wir sind die Opfer.
	AI_Output(hero,self,"WRK_225_WAREZ_15_06");	//Jaja, schon gut. 100 Silberstücke. Alles klar. Ich nehme mir diesen Huldrych mal vor.
	B_LogEntry(CH1_TRAIN1H,"Huldrych hat Agon 100 Silberstücke gestohlen.");
};


instance WRK_225_AGON_AGAINSILVER(C_Info)
{
	npc = wrk_225_agon;
	nr = 15;
	condition = wrk_225_agon_againsilver_condition;
	information = wrk_225_agon_againsilver_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wieviel Silber hat er dir gestohlen?";
};


func int wrk_225_agon_againsilver_condition()
{
	if(Npc_KnowsInfo(hero,wrk_225_agon_warez) && !Npc_KnowsInfo(hero,wrk_225_agon_100) && (CASSIAN_BEATHUDRYCH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void wrk_225_agon_againsilver_info()
{
	AI_Output(hero,self,"WRK_225_AGAINSILVER_15_01");	//Wieviel Silber hat er dir gestohlen?
	AI_Output(self,hero,"WRK_225_AGAINSILVER_00_02");	//1 0 0.  Einhundert! Kannst du dir nicht mal eine einfache Zahl merken?
	AI_Output(self,hero,"WRK_225_AGAINSILVER_00_03");	//Oh Mann! Da haben wir es. Keiner nimmt uns Händler ernst! Sie schicken mir den letzten Deppen!
	AI_Output(self,hero,"WRK_225_AGAINSILVER_00_04");	//Huldrych war sein Name. Hattest du das etwa auch vergessen ??
	Info_ClearChoices(wrk_225_agon_againsilver);
	Info_AddChoice(wrk_225_agon_againsilver,"Bleib ruhig, oder du kannst dir dein Silber selber holen!",wrk_225_agon_againsilver_silver);
	Info_AddChoice(wrk_225_agon_againsilver,"Schon gut. Reg dich nicht auf!",wrk_225_agon_againsilver_calmdown);
	Info_AddChoice(wrk_225_agon_againsilver,"Ich geh mal zu Huldrych",wrk_225_agon_againsilver_huldrych);
	Info_AddChoice(wrk_225_agon_againsilver,"Tatsächlich, sein Name war mir entfallen",wrk_225_agon_againsilver_name);
};

func void wrk_225_agon_againsilver_name()
{
	AI_Output(hero,self,"WRK_225_AGAINSILVER_NAME_15_01");	//Tatsächlich, sein Name war mir entfallen.
	AI_Output(self,hero,"WRK_225_AGAINSILVER_NAME_00_02");	//Unglaublich! Warum hat Cassian mir nicht direkt einen von den Kranken geschickt?
	AI_Output(self,hero,"WRK_225_AGAINSILVER_NAME_00_03");	//Jeder Scavenger hat mehr Verstand im Kopf als du!
	Info_ClearChoices(wrk_225_agon_againsilver);
	Info_AddChoice(wrk_225_agon_againsilver,"Bleib ruhig, oder du kannst dir dein Silber selber holen!",wrk_225_agon_againsilver_silver);
	Info_AddChoice(wrk_225_agon_againsilver,"Schon gut. Reg dich nicht auf!",wrk_225_agon_againsilver_calmdown);
	Info_AddChoice(wrk_225_agon_againsilver,"Ich geh mal zu Huldrych",wrk_225_agon_againsilver_huldrych);
};

func void wrk_225_agon_againsilver_silver()
{
	AI_Output(hero,self,"WRK_225_AGAINSILVER_SILVER_15_01");	//Bleib ruhig, oder du kannst dir dein Silber selber holen!
	AI_Output(self,hero,"WRK_225_AGAINSILVER_SILVER_00_02");	//Das wird ja immer besser! Jetzt willst du mir drohen? Das ist ja wohl das letzte!
	AI_Output(self,hero,"WRK_225_AGAINSILVER_SILVER_00_03");	//Ich glaube ich rede mal ein paar Takte mit Cassian!
	Info_ClearChoices(wrk_225_agon_againsilver);
	Info_AddChoice(wrk_225_agon_againsilver,"Schon gut. Reg dich nicht auf!",wrk_225_agon_againsilver_calmdown);
	Info_AddChoice(wrk_225_agon_againsilver,"Ich geh mal zu Huldrych",wrk_225_agon_againsilver_huldrych);
};

func void wrk_225_agon_againsilver_huldrych()
{
	AI_Output(hero,self,"WRK_225_AGAINSILVER_HULDRYCH_15_01");	//Ich geh mal zu Huldrych
	AI_Output(self,hero,"WRK_225_AGAINSILVER_HULDRYCH_00_02");	//Ja mach das. Bevor du das auch wieder vergisst! HAHAHA
	AI_StopProcessInfos(self);
};

func void wrk_225_agon_againsilver_calmdown()
{
	AI_Output(hero,self,"WRK_225_AGAINSILVER_CALMDOWN_15_01");	//Schon gut. Reg dich nicht auf!
	AI_Output(self,hero,"WRK_225_AGAINSILVER_CALMDOWN_00_02");	//Beschwichtige mich nicht, als wäre ich ein altes Waschweib!
	AI_Output(self,hero,"WRK_225_AGAINSILVER_CALMDOWN_00_03");	//Sieh lieber zu das ich mein Silber wiederbekomme! Was stehst du hier noch rum? Hast du vergessen wie man geht?
	Info_ClearChoices(wrk_225_agon_againsilver);
	Info_AddChoice(wrk_225_agon_againsilver,"Bleib ruhig, oder du kannst dir dein Silber selber holen!",wrk_225_agon_againsilver_silver);
	Info_AddChoice(wrk_225_agon_againsilver,"Ich geh mal zu Huldrych",wrk_225_agon_againsilver_huldrych);
};


instance WRK_225_AGON_WHERE(C_Info)
{
	npc = wrk_225_agon;
	nr = 20;
	condition = wrk_225_agon_where_condition;
	information = wrk_225_agon_where_info;
	important = FALSE;
	permanent = TRUE;
	description = "Weißt du, wo ich Huldrych finden kann?";
};


func int wrk_225_agon_where_condition()
{
	if(Npc_KnowsInfo(hero,wrk_225_agon_stolen) && !Npc_KnowsInfo(hero,wrk_225_agon_100) && (CASSIAN_BEATHUDRYCH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void wrk_225_agon_where_info()
{
	AI_Output(hero,self,"WRK_225_WHERE_15_01");	//Weißt du, wo ich Huldrych finden kann?
	AI_Output(self,hero,"WRK_225_WHERE_00_02");	//Ich glaube, er treibt sich irgendwo am hinteren Tor rum!
};


instance WRK_225_AGON_100(C_Info)
{
	npc = wrk_225_agon;
	nr = 10;
	condition = wrk_225_agon_100_condition;
	information = wrk_225_agon_100_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hier sind deine 100 Silberstücke";
};


func int wrk_225_agon_100_condition()
{
	if((Npc_HasItems(hero,itmi_silver) >= 100) && Npc_KnowsInfo(hero,wrk_225_agon_warez) && (CASSIAN_BEATHUDRYCH != LOG_FAILED) && (CASSIAN_BEATHUDRYCH != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void wrk_225_agon_100_info()
{
	AI_Output(hero,self,"WRK_225_100_15_01");	//Hier sind deine 100 Silberstücke.
	B_GiveInvItems(hero,self,itmi_silver,100);
	AI_Output(self,hero,"WRK_225_100_00_02");	//Ausgezeichnet. Vielen Dank. Ich hoffe das Huldrych das bekommen hat, was er verdient. Na, ist nicht wichtig, Hauptsache ich habe mein Geld wieder!
	B_GiveXP(XP_AGONSILVERSELF);
	if(Npc_KnowsInfo(hero,wrk_225_agon_againsilver))
	{
		AI_Output(self,hero,"WRK_225_100_00_03");	//Ach und übrigens, entschuldige meine Aufgebrachtheit vorhin, aber ich war etwas in Rage.
	};
	AI_Output(self,hero,"WRK_225_100_00_04");	//Wenn du mal wieder irgendwas brauchst, dann komme zu mir. Ich habe die günstigsten Angebote und die besten Waren!
	B_LogEntry(CH1_TRAIN1H,"Agon hat seine 100 Silberstücke wieder. Aber ausser seinem Dank hat der Geizkragen keine Belohnung herausgerückt. Damit habe ich einen Teil von Cassians Auftrag erfüllt.");
};


instance WRK_225_AGON_HAVERECIPE(C_Info)
{
	npc = wrk_225_agon;
	condition = wrk_225_agon_haverecipe_condition;
	information = wrk_225_agon_haverecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe gehört, du bist im Besitz einer bestimmten Rezeptur!";
};


func int wrk_225_agon_haverecipe_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_searchrecipe))
	{
		return TRUE;
	};
};

func void wrk_225_agon_haverecipe_info()
{
	AI_Output(hero,self,"WRK_225_HAVERECIPE_15_01");	//Ich habe gehört, du bist im Besitz einer bestimmten Rezeptur!
	AI_Output(self,hero,"WRK_225_HAVERECIPE_09_02");	//Ich habe vieles, nach was für einer Rezeptur suchst du?
	AI_Output(hero,self,"WRK_225_HAVERECIPE_15_03");	//Lester verkaufte dir vor einiger Zeit eine Rezeptur für ein Mittel gegen Wahnsinn.
	AI_Output(self,hero,"WRK_225_HAVERECIPE_09_04");	//Ahhh... du willst diese Rezeptur wohl haben was? Das wird dich eine Kleinigkeit kosten.
	AI_Output(self,hero,"WRK_225_HAVERECIPE_09_05");	//Sagen wir 500 Silber!
	Info_ClearChoices(wrk_225_agon_haverecipe);
	Info_AddChoice(wrk_225_agon_haverecipe,"Wer trägt schon soviel Silber mit sich herum?",wrk_225_agon_haverecipe_notnow);
	Info_AddChoice(wrk_225_agon_haverecipe,"Hier ist das Silber.",wrk_225_agon_haverecipe_give);
	Info_AddChoice(wrk_225_agon_haverecipe,"Das ist Wucher. Diese Rezeptur ist niemals soviel Wert!",wrk_225_agon_haverecipe_profiteering);
	CreateInvItem(self,itar_scrollhealpossessed);
};

func void wrk_225_agon_haverecipe_profiteering()
{
	Info_ClearChoices(wrk_225_agon_haverecipe);
	AI_Output(hero,self,"WRK_225_HAVERECIPE_PROFITEERING_15_01");	//Das ist Wucher. Diese Rezeptur ist niemals soviel Wert!
	AI_Output(self,hero,"WRK_225_HAVERECIPE_PROFITEERING_09_02");	//Oh... das liegt immer im Auge des Betrachters. Es scheint mir, als ob du diesen Preis zahlen würdest.
	AI_Output(hero,self,"WRK_225_HAVERECIPE_PROFITEERING_15_03");	//(wütend) Wir sehen uns wieder!
	B_LogEntry(CH1_LEARNALCHEMY,"Agon hat mir die Rezeptur für 500 Silber zum Kauf angeboten. Das ist Wucher. Ich sollte Talamon davon berichten.");
	AI_StopProcessInfos(self);
};

func void wrk_225_agon_haverecipe_give()
{
	Info_ClearChoices(wrk_225_agon_haverecipe);
	AI_Output(hero,self,"WRK_225_HAVERECIPE_GIVE_15_01");	//Hier ist das Silber.
	if(Npc_HasItems(hero,itmi_silver) < AGON_FORMULA_PRICE)
	{
		B_Say(self,hero,"$NotEnoughSilver");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems(hero,self,itmi_silver,AGON_FORMULA_PRICE);
		AI_Output(self,hero,"WRK_225_HAVERECIPE_GIVE_09_02");	//Ahh... Geschäfte mit dir sind sehr... lukrativ!
		B_GiveInvItems(self,hero,itar_scrollhealpossessed,1);
		AGON_BOUGHTFORMULA = TRUE;
		B_LogEntry(CH1_LEARNALCHEMY,"Ich konnte die Rezeptur dem Händler Agon für sehr viel Silber abkaufen. Ich hoffe sie ist es wert.");
		AI_StopProcessInfos(self);
	};
};

func void wrk_225_agon_haverecipe_notnow()
{
	Info_ClearChoices(wrk_225_agon_haverecipe);
	AI_Output(hero,self,"WRK_225_HAVERECIPE_NOTNOW_15_01");	//Wer trägt schon soviel Silber mit sich herum?
	AI_Output(self,hero,"WRK_225_HAVERECIPE_NOTNOW_09_02");	//Du hast das Silber nicht dabei? Kein Problem, du kannst jederzeit wiederkommen!
	B_LogEntry(CH1_LEARNALCHEMY,"Agon verlangt einen sehr hohen Preis für die Rezeptur. Ich habe ihn vertröstet und sollte am besten nochmal mit Talamon sprechen.");
	AI_StopProcessInfos(self);
};


instance WRK_225_AGON_GIVESILVER(C_Info)
{
	npc = wrk_225_agon;
	condition = wrk_225_agon_givesilver_condition;
	information = wrk_225_agon_givesilver_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildbuystring("Rezeptur für Talamon kaufen",AGON_FORMULA_PRICE);
};


func int wrk_225_agon_givesilver_condition()
{
	if(Npc_KnowsInfo(hero,wrk_225_agon_haverecipe) && !AGON_BOUGHTFORMULA && !Npc_HasItems(hero,itar_scrollhealpossessed) && !Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void wrk_225_agon_givesilver_info()
{
	if(Npc_HasItems(hero,itmi_silver) < AGON_FORMULA_PRICE)
	{
		B_Say(self,hero,"$NotEnoughSilver");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems(hero,self,itmi_silver,AGON_FORMULA_PRICE);
		if(AGON_BLACKMAILED)
		{
			AI_Output(self,hero,"WRK_225_GIVESILVER_09_01");	//(verärgert) Gib das Silber schon her, du Erpresser!
		}
		else
		{
			AI_Output(self,hero,"WRK_225_GIVESILVER_09_02");	//Mit dir Geschäfte zu machen ist ein wahres Vergnügen.
		};
		B_GiveInvItems(self,hero,itar_scrollhealpossessed,1);
		AGON_BOUGHTFORMULA = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance WRK_225_AGON_ANTIDOTE(C_Info)
{
	npc = wrk_225_agon;
	condition = wrk_225_agon_antidote_condition;
	information = wrk_225_agon_antidote_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe da etwas, dass dich interessieren könnte...";
};


func int wrk_225_agon_antidote_condition()
{
	if(Npc_HasItems(hero,itfo_placebo) && !Npc_HasItems(hero,itar_scrollhealpossessed) && !Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void wrk_225_agon_antidote_info()
{
	AI_Output(hero,self,"WRK_225_ANTIDOTE_15_01");	//Ich habe da etwas, dass dich interessieren könnte...
	AI_Output(hero,self,"WRK_225_ANTIDOTE_15_02");	//Ich habe es eben von Talamon erworben. Es ist ein Trank, der vor der Krankheit schützt...
	AI_Output(self,hero,"WRK_225_ANTIDOTE_09_03");	//(erwartungsvoll) Ein Heilmittel???
	AI_Output(hero,self,"WRK_225_ANTIDOTE_15_04");	//Nein! Es kann nicht heilen, aber es verhindert die Ansteckung. Die Heiler wenden es auf sich selbst an.
	AI_Output(self,hero,"WRK_225_ANTIDOTE_09_05");	//(gierig) Was willst du dafür haben, schnell sag!
	AI_Output(hero,self,"WRK_225_ANTIDOTE_15_06");	//Nun, das wird dich eine Kleinigkeit kosten...
	Info_AddChoice(wrk_225_agon_antidote,"Ich will 1000 Silber sehen!",wrk_225_agon_antidote_expensive);
	Info_AddChoice(wrk_225_agon_antidote,"Wie wäre es mit 600 Silber?",wrk_225_agon_antidote_moderate);
	Info_AddChoice(wrk_225_agon_antidote,"Ich schlage einen Tausch vor: Rezeptur gegen Trank",wrk_225_agon_antidote_trade);
	Info_AddChoice(wrk_225_agon_antidote,"Sagen wir 400 Silber",wrk_225_agon_antidote_cheap);
};

func void wrk_225_agon_antidote_cheap()
{
	Info_ClearChoices(wrk_225_agon_antidote);
	AI_Output(hero,self,"WRK_225_ANTIDOTE_CHEAP_15_01");	//Sagen wir 400 Silber
	AI_Output(self,hero,"WRK_225_ANTIDOTE_CHEAP_09_02");	//(übereifrig) Das Geschäft gilt, hier ist das Silber. Nun gib mir schon endlich den Trank.
	B_GiveInvItems(hero,self,itfo_placebo,1);
	Npc_RemoveInvItem(self,itfo_placebo);
	B_GiveInvItems(self,hero,itmi_silver,400);
};

func void wrk_225_agon_antidote_moderate()
{
	Info_ClearChoices(wrk_225_agon_antidote);
	AI_Output(hero,self,"WRK_225_ANTIDOTE_MODERATE_15_01");	//Wie wäre es mit 600 Silber?
	B_GiveInvItems(hero,self,itfo_placebo,1);
	Npc_RemoveInvItem(self,itfo_placebo);
	B_GiveInvItems(self,hero,itmi_silver,600);
	AI_Output(self,hero,"WRK_225_ANTIDOTE_MODERATE_09_02");	//Du bist ein wirklicher Erpresser..
	AI_Output(hero,self,"WRK_225_ANTIDOTE_MODERATE_15_03");	//Oh... das liegt immer im Auge des Betrachters. Es schien mir, als ob du diesen Preis bezahlen würdest.
	AI_Output(self,hero,"WRK_225_ANTIDOTE_MODERATE_09_04");	//(bedrohlich) Das werde ich nicht so schnell vergessen.
	AGON_BLACKMAILED = TRUE;
};

func void wrk_225_agon_antidote_expensive()
{
	AI_Output(hero,self,"WRK_225_ANTIDOTE_EXPENSIVE_15_01");	//Ich will 1000 Silber sehen!
	AI_Output(self,hero,"WRK_225_ANTIDOTE_EXPENSIVE_09_02");	//Halte mich nicht zum Narren. Ich werde diesen Trank nicht zu jedem Preis kaufen!
};

func void wrk_225_agon_antidote_trade()
{
	Info_ClearChoices(wrk_225_agon_antidote);
	AI_Output(hero,self,"WRK_225_ANTIDOTE_TRADE_15_01");	//Ich schlage einen Tausch vor: Rezeptur gegen Trank.
	AI_Output(self,hero,"WRK_225_ANTIDOTE_TRADE_09_02");	//Warum nicht. Scheint mir ein faires Angebot zu sein.
	B_GiveInvItems(hero,self,itfo_placebo,1);
	Npc_RemoveInvItem(self,itfo_placebo);
	B_GiveInvItems(self,hero,itar_scrollhealpossessed,1);
	AGON_BOUGHTFORMULA = TRUE;
};

