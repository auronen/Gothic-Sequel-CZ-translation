
instance WRK_227_SNAF_EXIT(C_Info)
{
	npc = wrk_227_snaf;
	nr = 999;
	condition = wrk_227_snaf_exit_condition;
	information = wrk_227_snaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_227_snaf_exit_condition()
{
	return TRUE;
};

func void wrk_227_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_MEETAGAIN(C_Info)
{
	npc = wrk_227_snaf;
	nr = 1;
	condition = wrk_227_snaf_meetagain_condition;
	information = wrk_227_snaf_meetagain_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_227_snaf_meetagain_condition()
{
	return TRUE;
};

func void wrk_227_snaf_meetagain_info()
{
	AI_Output(self,hero,"WRK_227_MEETAGAIN_09_01");	//Ja ist das denn möglich!?
	AI_Output(self,hero,"WRK_227_MEETAGAIN_09_02");	//Ich kenn dich doch!
	Info_AddChoice(wrk_227_snaf_meetagain,"Du kennst mich? Ich wüsste nicht woher!",wrk_227_snaf_meetagain_dontknow);
	Info_AddChoice(wrk_227_snaf_meetagain,"Snaf...? Snaf, der Koch!",wrk_227_snaf_meetagain_snaf);
};

func void wrk_227_snaf_meetagain_snaf()
{
	Info_ClearChoices(wrk_227_snaf_meetagain);
	AI_Output(hero,self,"WRK_227_MEETAGAIN_SNAF_15_01");	//Snaf...? Snaf, der Koch!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_SNAF_09_02");	//Ja Mann! Wo hast du dich die letzten Monate rumgetrieben?
	AI_Output(hero,self,"WRK_227_MEETAGAIN_SNAF_15_03");	//Ich war... unpässlich!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_SNAF_09_04");	//Konntest wohl mein Fleischwanzenragout nicht mehr ertragen, was? (lacht)
	Info_AddChoice(wrk_227_snaf_meetagain,"Dein Ragout war wirklich eklig, aber daran lag's nicht!",wrk_227_snaf_meetagain_snaf_bad);
	Info_AddChoice(wrk_227_snaf_meetagain,"Hey, ich steh auf dein Fleischwanzenragout, ehrlich!",wrk_227_snaf_meetagain_snaf_good);
};

func void wrk_227_snaf_meetagain_snaf_good()
{
	Info_ClearChoices(wrk_227_snaf_meetagain);
	AI_Output(hero,self,"WRK_227_MEETAGAIN_SNAF_GOOD_15_01");	//Hey, ich steh auf dein Fleischwanzenragout, ehrlich!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_SNAF_GOOD_09_02");	//Dann schmeckt dir bestimmt auch mein neues Rezept. Fleischwanzensuppe!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_SNAF_GOOD_09_03");	//Für meine Freunde hab ich immer etwas davon übrig!
	SNAF_DAILYRAGOUT = TRUE;
};

func void wrk_227_snaf_meetagain_snaf_bad()
{
	Info_ClearChoices(wrk_227_snaf_meetagain);
	AI_Output(hero,self,"WRK_227_MEETAGAIN_SNAF_BAD_15_01");	//Dein Ragout ist wirklich eklig, aber danan lag's nicht!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_SNAF_BAD_09_02");	//Eklig? Du findest es eklig?? Pah!
};

func void wrk_227_snaf_meetagain_dontknow()
{
	Info_ClearChoices(wrk_227_snaf_meetagain);
	AI_Output(hero,self,"WRK_227_MEETAGAIN_DONTKNOW_15_01");	//Du kennst mich? Ich wüsste nicht woher!
	AI_Output(self,hero,"WRK_227_MEETAGAIN_DONTKNOW_09_02");	//Oh, dann hab ich dich wohl verwechselt!
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_DAILYRAGOUT(C_Info)
{
	npc = wrk_227_snaf;
	nr = 10;
	condition = wrk_227_snaf_dailyragout_condition;
	information = wrk_227_snaf_dailyragout_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hast du etwas von der Fleischwanzensuppe für mich?";
};


func int wrk_227_snaf_dailyragout_condition()
{
	if(SNAF_DAILYRAGOUT)
	{
		return TRUE;
	};
};

func void wrk_227_snaf_dailyragout_info()
{
	AI_Output(hero,self,"WRK_227_DAILYRAGOUT_15_01");	//Hast du etwas Fleischwanzensuppe für mich?
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= 1) && KNOWS_RECIPEMEATBUG)
	{
		AI_Output(self,hero,"WRK_227_DAILYRAGOUT_09_02");	//Du weisst doch jetzt selbst wie man sie zubereitet!
		if(Npc_KnowsInfo(hero,wrk_227_snaf_haverecipe))
		{
			AI_Output(self,hero,"WRK_227_DAILYRAGOUT_09_03");	//Ausserdem werde ich ab sofort das neue Rezept Fleischeintopf zubereiten.
			Snaf_RagoutDay = b_getday() - 1;
		};
		wrk_227_snaf_dailyragout.permanent = FALSE;
		AI_StopProcessInfos(self);
		return;
	};
	if(Snaf_RagoutDay < b_getday())
	{
		AI_Output(self,hero,"WRK_227_DAILYRAGOUT_09_04");	//Hier nimm 3 Portionen und lass es dir schmecken!
		B_GiveInvItems(self,hero,itfo_meatbugsoup,3);
		Snaf_RagoutDay = b_getday();
	}
	else
	{
		AI_Output(self,hero,"OUMULTI_NOMORE_09_00");	//Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
	};
};


instance WRK_227_SNAF_SMELLSGOOD(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_smellsgood_condition;
	information = wrk_227_snaf_smellsgood_info;
	important = FALSE;
	permanent = FALSE;
	description = "Das riecht lecker!";
};


func int wrk_227_snaf_smellsgood_condition()
{
	return TRUE;
};

func void wrk_227_snaf_smellsgood_info()
{
	AI_Output(hero,self,"WRK_227_SMELLSGOOD_15_01");	//Das riecht lecker!
	AI_Output(self,hero,"WRK_227_SMELLSGOOD_09_02");	//Ahhh... Du weisst offensichtlich rustikale Küche zu schätzen.
	AI_Output(self,hero,"WRK_227_SMELLSGOOD_09_03");	//Ich mache Fleischwanzensuppe!
	AI_Output(self,hero,"WRK_227_SMELLSGOOD_09_04");	//Die ist sehr nahrhaft und hat sogar heilsame Wirkung!
	AI_Output(self,hero,"WRK_227_SMELLSGOOD_09_05");	//Ist bei den Arenakämpfern sehr beliebt. Die Jungs müssen ständig Schnitte und Beulen auskurieren.
};


instance WRK_227_SNAF_WANTLEARN(C_Info)
{
	npc = wrk_227_snaf;
	nr = 1;
	condition = wrk_227_snaf_wantlearn_condition;
	information = wrk_227_snaf_wantlearn_info;
	important = FALSE;
	permanent = FALSE;
	description = "Zeig mir, wie man Fleischwanzensuppe macht.";
};


func int wrk_227_snaf_wantlearn_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_smellsgood))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_wantlearn_info()
{
	AI_Output(hero,self,"WRK_227_WANTLEARN_15_01");	//Zeig mir, wie man Fleischwanzensuppe macht.
	AI_Output(self,hero,"WRK_227_WANTLEARN_09_02");	//(Tiefes, langes Lachen)
	AI_Output(self,hero,"WRK_227_WANTLEARN_09_03");	//Ich lebe davon, dass die Leute bei mir Schlange stehen.
	AI_Output(self,hero,"WRK_227_WANTLEARN_09_04");	//Warum sollte ich meine besten Rezepte weitergeben?
};


instance WRK_227_SNAF_WANTFAVOR(C_Info)
{
	npc = wrk_227_snaf;
	nr = 1;
	condition = wrk_227_snaf_wantfavor_condition;
	information = wrk_227_snaf_wantfavor_info;
	important = FALSE;
	permanent = FALSE;
	description = "Naja, ich sehe hier niemanden Schlange stehen.";
};


func int wrk_227_snaf_wantfavor_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_wantlearn))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_wantfavor_info()
{
	AI_Output(hero,self,"WRK_227_WANTFAVOR_15_01");	//Naja...
	AI_PlayAni(hero,"T_SEARCH");
	AI_Output(hero,self,"WRK_227_WANTFAVOR_15_02");	//...ich sehe hier niemanden Schlange stehen.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_09_03");	//(zerknirscht) Hast ja recht, in letzter Zeit läuft es nicht so gut bei mir.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_09_04");	//Aber mir kommt da gerade eine Idee!
	AI_Output(hero,self,"WRK_227_WANTFAVOR_15_05");	//Erzähl.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_09_06");	//Kennst Du Halvor?
	Info_AddChoice(wrk_227_snaf_wantfavor,"Halvor? Nie gehört.",wrk_227_snaf_wantfavor_no);
	Info_AddChoice(wrk_227_snaf_wantfavor,"Ja, den kenne ich.",wrk_227_snaf_wantfavor_yes);
};

func void wrk_227_snaf_wantfavor_yes()
{
	Info_ClearChoices(wrk_227_snaf_wantfavor);
	AI_Output(hero,self,"WRK_227_WANTFAVOR_YES_15_01");	//Ja, den kenne ich.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_YES_09_02");	//Wir sind gewissermassen... Konkurrenten.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_YES_09_03");	//Irgendwie scheint er es zu schaffen, mir meine Kundschaft abspenstig zu machen!
};

func void wrk_227_snaf_wantfavor_no()
{
	Info_ClearChoices(wrk_227_snaf_wantfavor);
	AI_Output(hero,self,"WRK_227_WANTFAVOR_NO_15_01");	//Halvor? Nie gehört.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_NO_09_02");	//Er ist der Koch in der Burgküche.
	AI_Output(self,hero,"WRK_227_WANTFAVOR_NO_09_03");	//Sogar einige meiner Stammgäste kaufen sich jetzt ihr Essen bei ihm!
};


instance WRK_227_SNAF_WHYNOTYOU(C_Info)
{
	npc = wrk_227_snaf;
	nr = 1;
	condition = wrk_227_snaf_whynotyou_condition;
	information = wrk_227_snaf_whynotyou_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum gehst du der Sache nicht auf den Grund?";
};


func int wrk_227_snaf_whynotyou_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_wantfavor))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_whynotyou_info()
{
	AI_Output(hero,self,"WRK_227_WHYNOTYOU_15_01");	//Warum gehst du der Sache nicht auf den Grund?
	AI_Output(self,hero,"WRK_227_WHYNOTYOU_09_02");	//Der Mistkerl lässt mich nichtmal in die Nähe seiner Küche!
	AI_Output(self,hero,"WRK_227_WHYNOTYOU_09_03");	//Aber wenn du mein Problem löst, zeig ich dir, wie man Fleischwanzensuppe zubereitet!
	AI_Output(hero,self,"WRK_227_WHYNOTYOU_15_04");	//Verstehe!
};


instance WRK_227_SNAF_IGO(C_Info)
{
	npc = wrk_227_snaf;
	nr = 1;
	condition = wrk_227_snaf_igo_condition;
	information = wrk_227_snaf_igo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich werde mich um dein Problem kümmern!";
};


func int wrk_227_snaf_igo_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_whynotyou))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_igo_info()
{
	AI_Output(hero,self,"WRK_227_IGO_15_01");	//Ich kümmere mich darum!
	AI_Output(self,hero,"WRK_227_IGO_09_02");	//Dann haben wir eine Absprache?
	AI_Output(hero,self,"WRK_227_IGO_15_03");	//Haben wir!
	Log_CreateTopic(CH1_LEARNCOOKING,LOG_MISSION);
	Log_SetTopicStatus(CH1_LEARNCOOKING,LOG_RUNNING);
	B_LogEntry(CH1_LEARNCOOKING,"Snaf, der Koch im Aussenring des Alten Lagers hat eingewilligt, mir das Zubereiten von heilsamen Nahrungsmitteln beizubringen, wenn ich ihm bei seinem Problem helfe: In letzter Zeit sind viele seiner Stammkunden zu Halvor, dem Koch in der Burgküche übergelaufen.");
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_FOUNDOUT(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_foundout_condition;
	information = wrk_227_snaf_foundout_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich weiss jetzt, warum alle bei Halvor essen gehen.";
};


func int wrk_227_snaf_foundout_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_igo) && Npc_KnowsInfo(hero,mil_100_halvor_snaf) && ((SNAF_MILITIABRIBED + SNAF_MILITIAFRIGHTENED) < SNAF_NEW_CUSTOMERS))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_foundout_info()
{
	AI_Output(hero,self,"WRK_227_FOUNDOUT_15_01");	//Ich weiss jetzt, warum alle bei Halvor essen gehen.
	AI_Output(self,hero,"WRK_227_FOUNDOUT_09_02");	//Sag es mir! ich muss es wissen!
	AI_Output(hero,self,"WRK_227_FOUNDOUT_15_03");	//Er bereitet seinen Fleischeintopf nach einem neuen Rezept zu.
	AI_Output(hero,self,"WRK_227_FOUNDOUT_15_04");	//Sieht so aus, als ob es bei Halvor einfach besser schmeckt, als bei dir!
	AI_Output(self,hero,"WRK_227_FOUNDOUT_09_05");	//Verdammt! Wie kriege ich meine Kundschaft wieder?
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_NOTHINGNEW(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_nothingnew_condition;
	information = wrk_227_snaf_nothingnew_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_227_snaf_nothingnew_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_foundout) && ((SNAF_MILITIABRIBED + SNAF_MILITIAFRIGHTENED) < SNAF_NEW_CUSTOMERS) && !Npc_HasItems(hero,itwr_halvorrecipe) && !SNAF_CUSTOMERQUESTSOLVED && c_npcisinvincible(self) && !c_npcisdead(7675))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_nothingnew_info()
{
	AI_Output(self,hero,"WRK_227_NOTHINGNEW_09_01");	//Bitte, du musst dich um mein Problem kümmern!
	AI_Output(self,hero,"WRK_227_NOTHINGNEW_09_02");	//Frag doch mal bei den Milizsoldaten vor Halvor's Küche herum!
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_HALVORDEAD(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_halvordead_condition;
	information = wrk_227_snaf_halvordead_info;
	important = FALSE;
	permanent = FALSE;
	description = "Halvor ist tot. Dein Problem ist gelöst!";
};


func int wrk_227_snaf_halvordead_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_foundout) && c_npcisdead(7675))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_halvordead_info()
{
	AI_Output(hero,self,"WRK_227_HALVORDEAD_15_01");	//Halvor ist tot. Dein Problem ist gelöst!
	AI_Output(self,hero,"WRK_227_HALVORDEAD_09_02");	//Bist du von allen guten Geistern verlassen. Du solltest meine Kunden zurückholen und keinen Kreig im Lager anfangen.
	AI_Output(self,hero,"WRK_227_HALVORDEAD_09_03");	//Als ob die Orks da draussen nicht schon genug Probleme wären.
	AI_Output(self,hero,"WRK_227_HALVORDEAD_09_04");	//Ich will nichts mehr mit dir zu tun haben.
	b_setattitude(self,ATT_ANGRY);
	B_LogEntry(CH1_LEARNCOOKING,"Snaf ist stinksauer, weil ich Halvor getötet habe. Aus ihm werde ich nicht mehr herausbekommen. Meine Lösung seines Problems war wohl doch etwas zu extrem.");
	Log_SetTopicStatus(CH1_LEARNCOOKING,LOG_FAILED);
};


instance WRK_227_SNAF_DEADAGAIN(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_deadagain_condition;
	information = wrk_227_snaf_deadagain_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_227_snaf_deadagain_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_halvordead) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_deadagain_info()
{
	AI_Output(self,hero,"WRK_227_DEADAGAIN_09_01");	//Ich will nichts mehr mit dir zu tun haben, du Mörder!
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_HAVERECIPE(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_haverecipe_condition;
	information = wrk_227_snaf_haverecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe Halvor's Kochbuch  ...ähm... organisiert!";
};


func int wrk_227_snaf_haverecipe_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_foundout) && Npc_HasItems(hero,itwr_halvorrecipe))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_haverecipe_info()
{
	AI_Output(hero,self,"WRK_227_HAVERECIPE_15_01");	//Ich habe Halvor's Kochbuch ...ähm... organisiert!
	B_GiveInvItems(hero,self,itwr_halvorrecipe,1);
	AI_Output(self,hero,"WRK_227_HAVERECIPE_09_02");	//Mann, das ist klasse! Will garnicht wissen, wie du das geschafft hast!
	AI_Output(self,hero,"WRK_227_HAVERECIPE_09_03");	//Wenn ich auch Fleisch-Eintopf anbiete, werden bald wieder alle bei MIR schlange stehen!
	B_GiveXP(XP_SNAF_GAVERECIPE);
	b_snaf_newrecipe();
	SNAF_CUSTOMERQUESTSOLVED = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
};


instance WRK_227_SNAF_NEWCUSTOMERS(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_newcustomers_condition;
	information = wrk_227_snaf_newcustomers_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_227_snaf_newcustomers_condition()
{
	if(((SNAF_MILITIABRIBED + SNAF_MILITIAFRIGHTENED) >= SNAF_NEW_CUSTOMERS) || HALVOR_STEWSALTED)
	{
		return TRUE;
	};
};

func void wrk_227_snaf_newcustomers_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"WRK_227_NEWCUSTOMERS_09_01");	//Hey, da bist du ja wieder!
	AI_Output(self,hero,"WRK_227_NEWCUSTOMERS_09_02");	//Ich weiss nicht WAS du gemacht hast, aber viele der Milizsoldaten essen wieder bei mir, statt bei Halvor!
	AI_Output(self,hero,"WRK_227_NEWCUSTOMERS_09_03");	//Sie stehen sogar wieder Schlange!
	B_LogEntry(CH1_LEARNCOOKING,"Snaf war ausser sich vor Freude über die zurückgewonnene Kundschaft. Besser er erfährt nie, wie ich das angestellt habe!");
	SNAF_CUSTOMERQUESTSOLVED = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
};


instance WRK_227_SNAF_TEACHCOOK(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_teachcook_condition;
	information = wrk_227_snaf_teachcook_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LEARNCOOK_1,LPCOST_TALENT_COOK_1,0);
};


func int wrk_227_snaf_teachcook_condition()
{
	if(SNAF_CUSTOMERQUESTSOLVED && (Npc_GetTalentSkill(hero,NPC_TALENT_COOK) < 1))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_teachcook_info()
{
	if(B_GiveSkill(hero,NPC_TALENT_COOK,1,LPCOST_TALENT_COOK_1))
	{
		AI_Output(hero,self,"WRK_227_TEACHCOOK_15_01");	//Zeigst du mir jetzt wie man Fleischwanzensuppe zubereitet?
		AI_Output(self,hero,"WRK_227_TEACHCOOK_09_02");	//Gerne! Zuerst ein paar grundsätzliche Dinge:
		AI_Output(self,hero,"WRK_227_TEACHCOOK_09_03");	//Achte auf das Feuer. Die Suppe muß immer leicht köcheln.
		AI_Output(self,hero,"WRK_227_TEACHCOOK_09_04");	//Und du musst regelmässig mit dem Kochlöffel umrühren, damit sich der Geschmack richtig entfalten kann.
	};
};


instance WRK_227_SNAF_SCOOP(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_scoop_condition;
	information = wrk_227_snaf_scoop_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kochlöffel? Hab ich nicht!";
};


func int wrk_227_snaf_scoop_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= 1) && !Npc_HasItems(hero,itmi_scoop))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_scoop_info()
{
	AI_Output(hero,self,"WRK_227_SCOOP_15_01");	//Kochlöffel? Hab ich nicht!
	AI_Output(self,hero,"WRK_227_SCOOP_09_02");	//Nimm den hier, ich habe mehr als genug davon!
	B_GiveInvItems(self,hero,itmi_scoop,1);
};


instance WRK_227_SNAF_MEATBUGRECIPE(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_meatbugrecipe_condition;
	information = wrk_227_snaf_meatbugrecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "...und wie macht man nun die Suppe?";
};


func int wrk_227_snaf_meatbugrecipe_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= 1) && !KNOWS_RECIPEMEATBUG)
	{
		return TRUE;
	};
};

func void wrk_227_snaf_meatbugrecipe_info()
{
	AI_Output(hero,self,"WRK_227_MEATBUGRECIPE_15_01");	//...und wie macht man nun die Suppe?
	AI_Output(self,hero,"WRK_227_MEATBUGRECIPE_09_02");	//Ah ja... richtig! Im Grunde ist es garnicht so schwierig.
	AI_Output(self,hero,"WRK_227_MEATBUGRECIPE_09_03");	//Schäle eine Fleischwanze vorsichtig aus ihrem Panzer, schneide das Fleisch klein und gib es nach und nach in das heisse Wasser.
	AI_Output(self,hero,"WRK_227_MEATBUGRECIPE_09_04");	//Gebe noch etwas Brot hinein, um die Suppe etwas anzudicken. Nun noch gut umrühren, und mit einer Prise Salz abschmecken und fertig ist die Suppe.
	b_learnrecipemeatbug();
	B_LogEntry(CH1_LEARNCOOKING,"Ich weiss nun, wie ich aus Fleischwanzen eine Suppe herstellen kann. Um allerdings Eintöpfe und Ragouts zuzubereiten, brauche ich einen besseren Lehrer!");
	Log_SetTopicStatus(CH1_LEARNCOOKING,LOG_SUCCESS);
};


instance WRK_227_SNAF_WHEREBUGS(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_wherebugs_condition;
	information = wrk_227_snaf_wherebugs_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo finde ich solche Fleischwanzen?";
};


func int wrk_227_snaf_wherebugs_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_meatbugrecipe))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_wherebugs_info()
{
	AI_Output(hero,self,"WRK_227_WHEREBUGS_15_01");	//Wo finde ich solche Fleischwanzen?
	AI_Output(self,hero,"WRK_227_WHEREBUGS_09_02");	//Dieses kleine Krabbelgetier liebt Müll. Einfach unglaublich, dass sie so hervorragend schmecken!
	AI_Output(self,hero,"WRK_227_WHEREBUGS_09_03");	//Es gibt hier im Lager zwei Müllberge, dort findest du eigentlich immer ein paar von den Biestern!
};


instance WRK_227_SNAF_WHERESALTNLOAF(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_wheresaltnloaf_condition;
	information = wrk_227_snaf_wheresaltnloaf_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo bekomme ich Brot und Salz her?";
};


func int wrk_227_snaf_wheresaltnloaf_condition()
{
	if(Npc_KnowsInfo(hero,wrk_227_snaf_meatbugrecipe))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_wheresaltnloaf_info()
{
	AI_Output(hero,self,"WRK_227_WHERESALTNLOAF_15_01");	//Wo bekomme ich Brot und Salz her?
	AI_Output(self,hero,"WRK_227_WHERESALTNLOAF_09_02");	//Ich hole mir die Zutaten immer von Agon im Händlerviertel.
	AI_Output(self,hero,"WRK_227_WHERESALTNLOAF_09_03");	//Er ist zwar eigentlich ein Gauner, aber seine Vorräte sind immer gut gefüllt.
};


instance WRK_227_SNAF_HOWDY(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_howdy_condition;
	information = wrk_227_snaf_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie steht es um deine Kundschaft?";
};


func int wrk_227_snaf_howdy_condition()
{
	if(!wrk_227_snaf_dailyragout.permanent)
	{
		return TRUE;
	};
};

func void wrk_227_snaf_howdy_info()
{
	AI_Output(hero,self,"WRK_227_HOWDY_15_01");	//Wie steht es um deine Kundschaft?
	if(Npc_KnowsInfo(hero,wrk_227_snaf_haverecipe))
	{
		AI_Output(self,hero,"WRK_227_HOWDY_09_02");	//Das neue Rezept ist ein voller Erfolg. Für den Fleisch-Eintopf stehen sie sogar wieder Schlange.
		AI_Output(self,hero,"WRK_227_HOWDY_09_03");	//Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du an Halvor's Kochbuch gekommen bist!
	}
	else
	{
		AI_Output(self,hero,"WRK_227_HOWDY_09_04");	//Ausgezeichnet. Sie stehen wieder jeden Tag Schlange und wollen etwas von meiner Fleischwanzensuppe haben!!
		AI_Output(self,hero,"WRK_227_HOWDY_09_05");	//Danke nochmal für deine Hilfe, obwohl du mir bis heute nicht erzählt hast, WIE du das angestellt hast!
	};
	AI_Output(hero,self,"WRK_227_HOWDY_15_06");	//(verschmitzt) Das willst du nicht wissen.
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_WANTMEATSTEW(C_Info)
{
	npc = wrk_227_snaf;
	condition = wrk_227_snaf_wantmeatstew_condition;
	information = wrk_227_snaf_wantmeatstew_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hast du etwas Fleischeintopf für mich?";
};


func int wrk_227_snaf_wantmeatstew_condition()
{
	if(!wrk_227_snaf_dailyragout.permanent && Npc_KnowsInfo(hero,wrk_227_snaf_haverecipe))
	{
		return TRUE;
	};
};

func void wrk_227_snaf_wantmeatstew_info()
{
	AI_Output(hero,self,"WRK_227_WANTMEATSTEW_15_01");	//Hast du etwas Fleischeintopf für mich?
	if(Snaf_RagoutDay < b_getday())
	{
		AI_Output(self,hero,"WRK_227_WANTMEATSTEW_09_02");	//Hier nimm 3 Portionen. Schliesslich habe ich das neue Rezept dir zu verdanken.
		B_GiveInvItems(self,hero,itfo_meatstew,3);
		Snaf_RagoutDay = b_getday();
	}
	else
	{
		AI_Output(self,hero,"OUMULTI_NOMORE_09_00");	//Heute kann ich nicht mehr abgeben. Muss ja schliesslich auch noch was verkaufen.
	};
};


instance WRK_227_SNAF_RUGASMEAL(C_Info)
{
	npc = wrk_227_snaf;
	nr = 6;
	condition = wrk_227_snaf_rugasmeal_condition;
	information = wrk_227_snaf_rugasmeal_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst Du mir zwei Meatbugsuppen verkaufen?";
};


func int wrk_227_snaf_rugasmeal_condition()
{
	if(INT_RUGAWANTSMEAL && !INT_PLAYERHASRUGASMEAL)
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_227_snaf_rugasmeal_info()
{
	AI_Output(hero,self,"WRK_227_RUGASMEAL_15_01");	//Kannst Du mir zwei Meatbugsuppen verkaufen?
	AI_Output(self,hero,"WRK_227_RUGASMEAL_09_02");	//Zwei Suppen kosten für Dich heute nur 15.
};


instance WRK_227_SNAF_RUGASMEALNOMONEY(C_Info)
{
	npc = wrk_227_snaf;
	nr = 8;
	condition = wrk_227_snaf_rugasmealnomoney_condition;
	information = wrk_227_snaf_rugasmealnomoney_info;
	important = FALSE;
	permanent = TRUE;
	description = "(nicht genug Geld für Meatbugsuppe)";
};


func int wrk_227_snaf_rugasmealnomoney_condition()
{
	if(INT_RUGAWANTSMEAL && !INT_PLAYERHASRUGASMEAL && (Npc_HasItems(hero,itmi_silver) < 15) && Npc_KnowsInfo(hero,wrk_227_snaf_rugasmeal))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_227_snaf_rugasmealnomoney_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_227_SNAF_RUGASMEALMONEY(C_Info)
{
	npc = wrk_227_snaf;
	nr = 5;
	condition = wrk_227_snaf_rugasmealmoney_condition;
	information = wrk_227_snaf_rugasmealmoney_info;
	important = FALSE;
	permanent = TRUE;
	description = "Dann gib mir mal zwei Meatbugsuppen";
};


func int wrk_227_snaf_rugasmealmoney_condition()
{
	if(INT_RUGAWANTSMEAL && !INT_PLAYERHASRUGASMEAL && (Npc_HasItems(hero,itmi_silver) >= 15) && Npc_KnowsInfo(hero,wrk_227_snaf_rugasmeal))
	{
		return TRUE;
	};
	return FALSE;
};

func void wrk_227_snaf_rugasmealmoney_info()
{
	B_GiveInvItems(hero,self,itmi_silver,15);
	AI_Output(hero,self,"WRK_227_RUGASMEALMONEY_15_01");	//Dann gib mir mal zwei Meatbugsuppen
	B_GiveInvItems(self,hero,itfo_meatbugsoup,2);
	AI_Output(self,hero,"WRK_227_RUGASMEALMONEY_09_02");	//Aber denk dran, ist ein Sonderpreis, nur für Dich.
	INT_PLAYERHASRUGASMEAL = TRUE;
	AI_StopProcessInfos(self);
};

