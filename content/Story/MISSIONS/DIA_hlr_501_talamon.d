
instance HLR_501_TALAMON_EXIT(C_Info)
{
	npc = hlr_501_talamon;
	nr = 999;
	condition = hlr_501_talamon_exit_condition;
	information = hlr_501_talamon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int hlr_501_talamon_exit_condition()
{
	return TRUE;
};

func void hlr_501_talamon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance HLR_501_TALAMON_HI(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_hi_condition;
	information = hlr_501_talamon_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bist du einer der Heiler?";
};


func int hlr_501_talamon_hi_condition()
{
	return TRUE;
};

func void hlr_501_talamon_hi_info()
{
	AI_Output(hero,self,"HLR_501_HI_15_01");	//Bist du einer der Heiler?
	AI_Output(self,hero,"HLR_501_HI_08_02");	//Ja. Zusammen mit Palgur und Isgar helfe ich den Kranken hier im Viertel.
	AI_Output(hero,self,"HLR_501_HI_15_03");	//Was ist das für eine Krankheit?
	AI_Output(self,hero,"HLR_501_HI_08_04");	//Die Kranken essen kaum noch und reden wirres Zeug. Schau sie dir an, ein wirklich elender Anblick!
	AI_Output(self,hero,"HLR_501_HI_08_05");	//Wir kennen die Ursache noch nicht. Aber wir forschen unermüdlich um mehr über die Krankheit zu erfahren.
};


instance HLR_501_TALAMON_WANTTOLEARN(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_wanttolearn_condition;
	information = hlr_501_talamon_wanttolearn_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir zeigen, wie man magische Tränke braut?";
};


func int hlr_501_talamon_wanttolearn_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_hi))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_wanttolearn_info()
{
	AI_Output(hero,self,"HLR_501_WANTTOLEARN_15_01");	//Kannst du mir zeigen, wie man magische Tränke braut?
	AI_Output(self,hero,"HLR_501_WANTTOLEARN_08_02");	//Ich bin zu beschäftigt, um dich in der Alchemie zu unterweisen.
	Log_CreateTopic(CH1_LEARNALCHEMY,LOG_MISSION);
	Log_SetTopicStatus(CH1_LEARNALCHEMY,LOG_RUNNING);
	B_LogEntry(CH1_LEARNALCHEMY,"Talamon, einer der Heiler im Krankenviertel scheint sich mit magischen Tränken zu beschäftigen. Er will sich allerdings nicht die Zeit nehmen, um mir seine Kunst zu vermitteln.");
};


instance HLR_501_TALAMON_WHATDOYODO(C_Info)
{
	npc = hlr_501_talamon;
	nr = 2;
	condition = hlr_501_talamon_whatdoyodo_condition;
	information = hlr_501_talamon_whatdoyodo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist es, was dich so sehr beschäftigt?";
};


func int hlr_501_talamon_whatdoyodo_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_wanttolearn))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_whatdoyodo_info()
{
	AI_Output(hero,self,"HLR_501_WHATDOYODO_15_01");	//Was ist es, was dich so sehr beschäftigt?
	AI_Output(self,hero,"HLR_501_WHATDOYODO_08_02");	//Wir suchen nach einem Mittel, das den Verstand der Kranken aufklärt. So könnten wir die Armen Teufel befragen und mehr über diese Krankheit erfahren.
	AI_Output(self,hero,"HLR_501_WHATDOYODO_08_03");	//Vor langer Zeit haben sich die Feuermagier mit einer solchen Rezeptur beschäftigt.
	AI_Output(hero,self,"HLR_501_WHATDOYODO_15_04");	//Gibt es denn Feuermagier hier im Alten Lager?
	AI_Output(self,hero,"HLR_501_WHATDOYODO_08_05");	//Nein, schon lange nicht mehr. Wir haben ihr Magierhaus in der Burg durchsucht, aber keine Hinweise auf die Rezeptur gefunden.
	AI_Output(self,hero,"HLR_501_WHATDOYODO_08_06");	//Wenn sie wirklich existiert... wenn wir sie finden würden... wenn sie tatsächlich wirksam wäre...
	AI_Output(hero,self,"HLR_501_WHATDOYODO_15_07");	//...schon klar! Hab verstanden!
};


instance HLR_501_TALAMON_RECIPEFORMONEY(C_Info)
{
	npc = hlr_501_talamon;
	nr = 1;
	condition = hlr_501_talamon_recipeformoney_condition;
	information = hlr_501_talamon_recipeformoney_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann hilfst du mir, wenn ich die Rezeptur finde?";
};


func int hlr_501_talamon_recipeformoney_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_whatdoyodo))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_recipeformoney_info()
{
	AI_Output(hero,self,"HLR_501_RECIPEFORMONEY_15_01");	//Dann hilfst du mir, wenn ich die Rezeptur finde?
	AI_Output(self,hero,"HLR_501_RECIPEFORMONEY_08_02");	//So sei es!
	AI_Output(hero,self,"HLR_501_RECIPEFORMONEY_15_03");	//Gut, ich werde die Rezeptur suchen.
	AI_Output(self,hero,"HLR_501_RECIPEFORMONEY_08_04");	//Wir haben Gordian ebenfalls mit der Suche beauftragt. Er besitzt noch alte Schriften aus der Zeit der Barriere.
	AI_Output(self,hero,"HLR_501_RECIPEFORMONEY_08_05");	//Aber er hat die Rezeptur immer noch nicht gefunden.
	AI_Output(self,hero,"HLR_501_RECIPEFORMONEY_08_06");	//Ich hoffe, daß du erfolgreicher bist!
	B_LogEntry(CH1_LEARNALCHEMY,"Ich habe Talamon zugesagt, die Rezeptur für ein Mittel zu suchen, dass den Verstand der Kranken für kurze Zeit aufklärt. Er versprach mir, danach hilfsbereit zu sein!");
};


instance HLR_501_TALAMON_WHEREISGORDIAN(C_Info)
{
	npc = hlr_501_talamon;
	nr = 6;
	condition = hlr_501_talamon_whereisgordian_condition;
	information = hlr_501_talamon_whereisgordian_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo finde ich diesen Gordian?";
};


func int hlr_501_talamon_whereisgordian_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_recipeformoney))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_whereisgordian_info()
{
	AI_Output(hero,self,"HLR_501_WHEREISGORDIAN_15_01");	//Wo finde ich diesen Gordian?
	AI_Output(self,hero,"HLR_501_WHEREISGORDIAN_08_02");	//Er hat eine Hütte am Marktplatz.
	B_LogEntry(CH1_LEARNALCHEMY,"Gordian könnte etwas über diese Rezeptur wissen. Er hat eine Hütte am Marktplatz.");
	AI_StopProcessInfos(self);
};


instance HLR_501_TALAMON_RECIPERUNNING(C_Info)
{
	npc = hlr_501_talamon;
	nr = 12;
	condition = hlr_501_talamon_reciperunning_condition;
	information = hlr_501_talamon_reciperunning_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe die Rezeptur noch nicht!";
};


func int hlr_501_talamon_reciperunning_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_whereisgordian) && (Npc_HasItems(hero,itar_scrollhealpossessed) < 1) && !Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_reciperunning_info()
{
	AI_Output(hero,self,"HLR_501_RECIPERUNNING_15_01");	//Ich habe die Rezeptur noch nicht!
	AI_Output(self,hero,"HLR_501_RECIPERUNNING_08_02");	//Komm wieder, wenn Du sie gefunden hast. Dann werde ich dir bei deinen Anliegen behilflich sein.
};


instance HLR_501_TALAMON_AGON(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_agon_condition;
	information = hlr_501_talamon_agon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich weiss, wo die Rezeptur ist!";
};


func int hlr_501_talamon_agon_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_whereisgordian) && Npc_KnowsInfo(hero,wrk_225_agon_haverecipe) && !Npc_HasItems(hero,itar_scrollhealpossessed) && !AGON_BOUGHTFORMULA)
	{
		return TRUE;
	};
};

func void hlr_501_talamon_agon_info()
{
	AI_Output(hero,self,"HLR_501_AGON_15_01");	//Ich weiss, wo die Rezeptur ist!
	AI_Output(self,hero,"HLR_501_AGON_08_02");	//Wirklich?
	AI_Output(hero,self,"HLR_501_AGON_15_03");	//Agon der Händler hat sie. Aber er will 500 Silber dafür haben.
	AI_Output(self,hero,"HLR_501_AGON_08_04");	//Das ist typisch Agon. Er ist ein richtiger Raffzahn.
	AI_Output(self,hero,"HLR_501_AGON_08_05");	//Ein harter Brocken, aber er hat eine Schwäche. Seine panische Angst vor der Krankheit.
};


instance HLR_501_TALAMON_ANTIDOTE(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_antidote_condition;
	information = hlr_501_talamon_antidote_info;
	important = FALSE;
	permanent = FALSE;
	description = "Mir kommt da eine Idee...";
};


func int hlr_501_talamon_antidote_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_recipeformoney) && Npc_KnowsInfo(hero,hlr_501_talamon_agon) && !Npc_HasItems(hero,itar_scrollhealpossessed) && !AGON_BOUGHTFORMULA)
	{
		return TRUE;
	};
};

func void hlr_501_talamon_antidote_info()
{
	AI_Output(hero,self,"HLR_501_ANTIDOTE_15_01");	//Mir kommt da eine Idee...
	AI_Output(hero,self,"HLR_501_ANTIDOTE_15_02");	//Hast du einen Trank, der wie ein Heilmittel gegen die Krankheit aussehen könnte?
	AI_Output(self,hero,"HLR_501_ANTIDOTE_08_03");	//Vielleicht erinnerst du dich, dass wir nach einem solchen Mittel suchen...
	AI_Output(hero,self,"HLR_501_ANTIDOTE_15_04");	//Er muss nur _AUSSEHEN_ als ob er heilt!
	AI_Output(self,hero,"HLR_501_ANTIDOTE_08_05");	//Hmmm... vielleicht tut es diese Tinktur hier, die bei einem missglückten Experiment herausgekommen ist.
	B_GiveInvItems(self,hero,itfo_placebo,1);
	AI_Output(hero,self,"HLR_501_ANTIDOTE_15_06");	//Wir werden sehen.
};


instance HLR_501_TALAMON_HASRECIPE(C_Info)
{
	npc = hlr_501_talamon;
	nr = 4;
	condition = hlr_501_talamon_hasrecipe_condition;
	information = hlr_501_talamon_hasrecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die Rezeptur!";
};


func int hlr_501_talamon_hasrecipe_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_recipeformoney) && Npc_HasItems(other,itar_scrollhealpossessed))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_hasrecipe_info()
{
	AI_Output(hero,self,"HLR_501_HASRECIPE_15_01");	//Ich habe die Rezeptur!
	AI_Output(self,hero,"HLR_501_HASRECIPE_08_02");	//Endlich! Zeig her!
	B_GiveInvItems(hero,self,itar_scrollhealpossessed,1);
	B_UseFakeScroll();
	AI_Output(self,hero,"HLR_501_HASRECIPE_08_03");	//Das ist sie. Du hast uns einen grossen Dienst erwiesen, ich danke dir.
	B_LogEntry(CH1_LEARNALCHEMY,"Talamon war sehr erfreut, daß ich die Rezeptur gefunden habe. Er wird sich jetzt Zeit für mich nehmen, so wie er es versprochen hatte.");
	B_GiveXP(XP_TALAMON_BRINGFORMULA);
	Wld_InsertItem(itwr_phoenix1,"FP_SPAWN_PHOENIX_1");
};


instance HLR_501_TALAMON_LEARNALCHEMY(C_Info)
{
	npc = hlr_501_talamon;
	nr = 11;
	condition = hlr_501_talamon_learnalchemy_condition;
	information = hlr_501_talamon_learnalchemy_info;
	important = FALSE;
	permanent = FALSE;
	description = "Zeige mir nun, wie man Tränke braut.";
};


func int hlr_501_talamon_learnalchemy_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_learnalchemy_info()
{
	AI_Output(hero,self,"HLR_501_LEARNALCHEMY_15_01");	//Zeige mir nun, wie man Tränke braut.
	AI_Output(self,hero,"HLR_501_LEARNALCHEMY_08_02");	//Du hast uns geholfen, also werden ich es dir zeigen.
	AI_Output(self,hero,"HLR_501_LEARNALCHEMY_08_03");	//Jeder alchemistische Trank erfordert als Grundlage reinsten Alkohol. Er extrahiert die Wirkstoffe aus den anderen Reagenzien und bringt sie zur Wirkung.
	AI_Output(self,hero,"HLR_501_LEARNALCHEMY_08_04");	//Für einen einfachen Heiltrank brauchst dazu noch Bergmoos und Orkblatt, zwei Pflanzen.
	AI_Output(self,hero,"HLR_501_LEARNALCHEMY_08_05");	//Ich leihe dir mein Rezeptbuch für Heiltränke und Gordian wird eine Abschrift anfertigen
	B_GiveInvItems(self,hero,itwr_book_healingpotions,1);
	AI_Output(hero,self,"HLR_501_LEARNALCHEMY_15_06");	//Gut.
	B_LogEntry(CH1_LEARNALCHEMY,"Ich benötige zuerst eine Abschrift von Talamons Alchemiebuch. Gordian, der Schreiber im Händlerviertel kann diese anfertigen.");
};


instance HLR_501_TALAMON_WHEREHEALREGS(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_wherehealregs_condition;
	information = hlr_501_talamon_wherehealregs_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo kann ich diese Reagenzien finden?";
};


func int hlr_501_talamon_wherehealregs_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemy))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_wherehealregs_info()
{
	AI_Output(hero,self,"HLR_501_WHEREHEALREGS_15_01");	//Wo kann ich diese Reagenzien finden?
	AI_Output(self,hero,"HLR_501_WHEREHEALREGS_08_02");	//Bergmoos wächst auf hohen Bergen und Felsen. Meistens muss man diese Orte mühsam erklettern.
	AI_Output(self,hero,"HLR_501_WHEREHEALREGS_08_03");	//Orkblatt findest du ebenfalls in bergiger Gegend, aber oft wächst diese Pflanze schon am Fuss von Felsen.
	AI_Output(self,hero,"HLR_501_WHEREHEALREGS_08_04");	//Reiner Alkohol kann nur von Alchemisten hergestellt werden. Isgar, mein Heiler-Kamerad im Händlerviertel verkauft diese grundlegende Reagenz.
	AI_Output(self,hero,"HLR_501_WHEREHEALREGS_08_05");	//Er hat auch viele pflanzlichen Reagenzien auf Lager, so dass du dir die anstrengenden Klettertouren wahrscheinich ersparen kannst.
	B_LogEntry(CH1_LEARNALCHEMY,"Die nötigen Reagenzien für den einfachen Heiltrank sind reiner Alkohol, Bergmoos und Orkblatt. All das kann ich beim Heiler Isgar im Händlerviertel erwerben.");
	b_learnmountainmoss();
	b_learnorcleaf();
};


instance HLR_501_TALAMON_LEARNALCHEMYHASBASICS(C_Info)
{
	npc = hlr_501_talamon;
	nr = 12;
	condition = hlr_501_talamon_learnalchemyhasbasics_condition;
	information = hlr_501_talamon_learnalchemyhasbasics_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe alle Reagenzien und die Abschrift des Buchs.";
};


func int hlr_501_talamon_learnalchemyhasbasics_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemy) && (Npc_HasItems(hero,itmi_alcohol) >= 1) && (Npc_HasItems(hero,itpl_mountainmoss) >= 1) && (Npc_HasItems(hero,itpl_orcleaf) >= 1) && (Npc_HasItems(hero,itwr_book_healingpotions) >= 2))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_learnalchemyhasbasics_info()
{
	AI_Output(hero,self,"HLR_501_LEARNALCHEMYHASBASICS_15_01");	//Ich habe alle Reagenzien und die Abschrift des Buchs.
	AI_Output(self,hero,"HLR_501_LEARNALCHEMYHASBASICS_08_02");	//Gut, aber ich brauche mein Orginal-Buch zurück, dann kann es losgehen.
	AI_Output(hero,self,"HLR_501_LEARNALCHEMYHASBASICS_15_03");	//Hier ist es.
	B_GiveInvItems(other,self,itwr_book_healingpotions,1);
	b_usefakebook(self);
	AI_Output(self,hero,"HLR_501_LEARNALCHEMYHASBASICS_08_04");	//Gut!
};


instance HLR_501_TALAMON_LEARNALCHEMIERUNNING(C_Info)
{
	npc = hlr_501_talamon;
	nr = 12;
	condition = hlr_501_talamon_learnalchemierunning_condition;
	information = hlr_501_talamon_learnalchemierunning_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst Du mir jetzt zeigen wie man Tränke braut?";
};


func int hlr_501_talamon_learnalchemierunning_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemy) && !Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemyhasbasics) && !hlr_501_talamon_learnalchemyhasbasics_condition())
	{
		return TRUE;
	};
};

func void hlr_501_talamon_learnalchemierunning_info()
{
	AI_Output(hero,self,"HLR_501_LEARNALCHEMIERUNNING_15_01");	//Kannst Du mir jetzt zeigen wie man Tränke braut?
	if(Npc_HasItems(hero,itwr_book_healingpotions) < 2)
	{
		AI_Output(self,hero,"HLR_501_LEARNALCHEMIERUNNING_08_02");	//Du brauchst die Abschrift des Buches von Gordian. Komm wieder, wenn du sie erhalten hast.
	};
	if((Npc_HasItems(hero,itmi_alcohol) < 1) || (Npc_HasItems(hero,itpl_mountainmoss) < 1) || (Npc_HasItems(hero,itpl_orcleaf) < 1))
	{
		AI_Output(self,hero,"HLR_501_LEARNALCHEMIERUNNING_08_03");	//Ohne Reagenzien kann man den Trank nicht brauen. Komm wieder, wenn Du Alkohol, Bergmoos und Orkblatt hast.
	};
};


instance HLR_501_TALAMON_LEARNALCHEMY1(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_learnalchemy1_condition;
	information = hlr_501_talamon_learnalchemy1_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LEARNALCHEMY_1,LPCOST_TALENT_ALCHEMY_1,0);
};


func int hlr_501_talamon_learnalchemy1_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemyhasbasics) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == 0))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_learnalchemy1_info()
{
	if(B_GiveSkill(hero,NPC_TALENT_ALCHEMY,1,LPCOST_TALENT_ALCHEMY_1))
	{
		AI_Output(self,hero,"HLR_501_LEARNALCHEMY1_08_01");	//Tränke werden am Alchemietisch hergestellt.
		AI_Output(self,hero,"HLR_501_LEARNALCHEMY1_08_02");	//Gebe die benötigten Reagenzien in den grossen Trog und koche sie.
		AI_Output(self,hero,"HLR_501_LEARNALCHEMY1_08_03");	//Fülle das Gemisch dann um in den kleinen Glaskolben und achte darauf, dass der Raffinierprozess genügend Zeit hat die wertvollen Bestandteile aus dem Gemisch zu extrahieren.
		AI_Output(self,hero,"HLR_501_LEARNALCHEMY1_08_04");	//Nach kurzer Zeit tropft das Resultat in die leere Glasphiole.
		b_learnrecipehealingpotions();
		B_LogEntry(CH1_LEARNALCHEMY,"Ich weiss nun, wie man einfache Heiltränken herstellt!");
	};
};


instance HLR_501_TALAMON_CANIBREWALLPOTIONS(C_Info)
{
	npc = hlr_501_talamon;
	nr = 16;
	condition = hlr_501_talamon_canibrewallpotions_condition;
	information = hlr_501_talamon_canibrewallpotions_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich möchte stärkere Tränke herstellen.";
};


func int hlr_501_talamon_canibrewallpotions_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == 1)
	{
		return TRUE;
	};
};

func void hlr_501_talamon_canibrewallpotions_info()
{
	AI_Output(hero,self,"HLR_501_CANIBREWALLPOTIONS_15_01");	//Ich möchte stärkere Tränke herstellen.
	AI_Output(self,hero,"HLR_501_CANIBREWALLPOTIONS_08_02");	//Ich habe dir gezeigt, wie wir unsere einfache Heiltränke herstellen.
	AI_Output(self,hero,"HLR_501_CANIBREWALLPOTIONS_08_03");	//Es gibt stärkere Heiltränke, aber uns Heilern ist nicht bekannt, wie sie hergestellt werden.
	AI_Output(self,hero,"HLR_501_CANIBREWALLPOTIONS_08_04");	//Vielleicht findest du irgendwann einen Alchemie-Meister, der dies beibringen kann.
	B_LogEntry(CH1_LEARNALCHEMY,"Talamon kann mir nichts mehr beibringen, ich muss mir einen anderen Lehrer suchen!");
	Log_SetTopicStatus(CH1_LEARNALCHEMY,LOG_SUCCESS);
};


instance HLR_501_TALAMON_ISTHEREMORETOLEARN(C_Info)
{
	npc = hlr_501_talamon;
	nr = 18;
	condition = hlr_501_talamon_istheremoretolearn_condition;
	information = hlr_501_talamon_istheremoretolearn_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst du mir das Brauen anderer Tränke beibringen?";
};


func int hlr_501_talamon_istheremoretolearn_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_learnalchemyhasbasics) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == 1))
	{
		return TRUE;
	};
};

func void hlr_501_talamon_istheremoretolearn_info()
{
	AI_Output(hero,self,"HLR_501_ISTHEREMORETOLEARN_15_01");	//Kannst du mir das Brauen anderer Tränke beibringen?
	AI_Output(self,hero,"HLR_501_ISTHEREMORETOLEARN_08_02");	//Dafür benötigst du ein Alchemiebuch, doch dise sind selten und wertvoll.
};


instance HLR_501_TALAMON_STINKINGSALT(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_stinkingsalt_condition;
	information = hlr_501_talamon_stinkingsalt_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe gehört, du verkaufst Müffelsalz?";
};


func int hlr_501_talamon_stinkingsalt_condition()
{
	if(TALAMON_KNOWSTINKINGSALT)
	{
		return TRUE;
	};
};

func void hlr_501_talamon_stinkingsalt_info()
{
	AI_Output(hero,self,"HLR_501_STINKINGSALT_15_01");	//Ich habe gehört, du verkaufst Müffelsalz?
	AI_Output(self,hero,"HLR_501_STINKINGSALT_08_02");	//Das stimmt, wofür brauchst du es?
	Info_ClearChoices(hlr_501_talamon_stinkingsalt);
	Info_AddChoice(hlr_501_talamon_stinkingsalt,"Um die Fleischwanzen aus meiner Hütte zu vertreiben",hlr_501_talamon_stinkingsalt_meatbugs);
	Info_AddChoice(hlr_501_talamon_stinkingsalt,"Um Halvor die Suppe zu versalzen",hlr_501_talamon_stinkingsalt_halvor);
};

func void hlr_501_talamon_stinkingsalt_halvor()
{
	Info_ClearChoices(hlr_501_talamon_stinkingsalt);
	AI_Output(hero,self,"HLR_501_STINKINGSALT_HALVOR_15_01");	//Um Halvor die Suppe zu versalzen.
	AI_Output(self,hero,"HLR_501_STINKINGSALT_HALVOR_08_02");	//Solcher Schabernack ist eines Alchimisten unwürdig!
	AI_StopProcessInfos(self);
};

func void hlr_501_talamon_stinkingsalt_meatbugs()
{
	Info_ClearChoices(hlr_501_talamon_stinkingsalt);
	AI_Output(hero,self,"HLR_501_STINKINGSALT_MEATBUGS_15_01");	//Um die Fleischwanzen aus meiner Hütte zu vertreiben.
	AI_Output(self,hero,"HLR_501_STINKINGSALT_MEATBUGS_08_02");	//Oh, ja dafür ist das Salz ganz hervorragend geeignet!
	TALAMON_BUYSTINKINGSALT = TRUE;
};


instance HLR_501_TALAMON_BUYSALT(C_Info)
{
	npc = hlr_501_talamon;
	condition = hlr_501_talamon_buysalt_condition;
	information = hlr_501_talamon_buysalt_info;
	important = FALSE;
	permanent = TRUE;
	description = b_buildbuystring(NAME_STINKINGSALT,VALUE_STINKINGSALT);
};


func int hlr_501_talamon_buysalt_condition()
{
	if(TALAMON_BUYSTINKINGSALT)
	{
		return TRUE;
	};
};

func void hlr_501_talamon_buysalt_info()
{
	if(Npc_HasItems(hero,itmi_silver) >= VALUE_STINKINGSALT)
	{
		B_GiveInvItems(hero,self,itmi_silver,VALUE_STINKINGSALT);
		AI_Output(self,hero,"HLR_501_BUYSALT_08_01");	//Hier ist das Salz. Nimm nicht zuviel, sonst wirst du es in deiner Hütte selbst nicht mehr aushalten.
		B_GiveInvItems(self,hero,itmi_stinkingsalt,1);
		AI_Output(hero,self,"HLR_501_BUYSALT_15_02");	//(grins) Ich werde darauf achten.
		hlr_501_talamon_buysalt.permanent = FALSE;
	}
	else
	{
		B_Say(self,hero,"$NotEnoughSilver");
	};
};

