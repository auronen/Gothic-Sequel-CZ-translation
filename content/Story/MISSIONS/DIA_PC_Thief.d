
instance PC_THIEF_EXIT(C_Info)
{
	npc = PC_Thief;
	nr = 999;
	condition = pc_thief_exit_condition;
	information = pc_thief_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_thief_exit_condition()
{
	return TRUE;
};

func void pc_thief_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PC_THIEF_WELCOME(C_Info)
{
	npc = PC_Thief;
	nr = 1;
	condition = pc_thief_welcome_condition;
	information = pc_thief_welcome_info;
	important = TRUE;
	permanent = FALSE;
};


func int pc_thief_welcome_condition()
{
	if(chapter == 1)
	{
		return TRUE;
	};
};

func void pc_thief_welcome_info()
{
	AI_Output(self,hero,"PC_Thief_WELCOME_11_01");	//Hey, bist du es wirklich!? Ich dachte du wärst tot!
	AI_Output(hero,self,"PC_Thief_WELCOME_15_02");	//Ja, wäre ich auch beinahe gewesen. Als der Tempel einstürzte, wurde ich unter den Steinen begraben.
	AI_Output(hero,self,"PC_Thief_WELCOME_15_03");	//Aber Xardas hat mich rausgeholt.
	AI_Output(self,hero,"PC_Thief_WELCOME_11_04");	//Der Dämonenbeschwörer also. Immerhin war er es auch, der dich in die Sache reingezogen hat.
	b_setattitude(self,ATT_FRIENDLY);
	SUBCHAPTER = CH1_BEFORE_DIEGO;
};


instance PC_THIEF_FLEE(C_Info)
{
	npc = PC_Thief;
	nr = 3;
	condition = pc_thief_flee_condition;
	information = pc_thief_flee_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum bist du nicht geflohen nachdem die Barriere gefallen ist?";
};


func int pc_thief_flee_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_welcome) && (chapter == 1))
	{
		return TRUE;
	};
};

func void pc_thief_flee_info()
{
	AI_Output(hero,self,"PC_Thief_FLEE_15_01");	//Warum bist du nicht geflohen nachdem die Barriere gefallen ist?
	AI_Output(self,hero,"PC_Thief_FLEE_11_02");	//Weil ich nachgedacht habe.
	AI_Output(self,hero,"PC_Thief_FLEE_11_03");	//Ohne das magische Erz bekommt der König keine Waffen mehr. Und ohne Waffen ...
	AI_Output(hero,self,"PC_Thief_FLEE_15_04");	//...kann er den Krieg gegen die Orcs nicht gewinnen.
	AI_Output(self,hero,"PC_Thief_FLEE_11_05");	//Du sagst es. Die Orks ziehen seitdem plündernd durchs Königreich.
	AI_Output(self,hero,"PC_Thief_FLEE_11_06");	//Die Minenkolonie haben sie komplett umstellt.
};


instance PC_THIEF_QUESTION(C_Info)
{
	npc = PC_Thief;
	nr = 20;
	condition = pc_thief_question_condition;
	information = pc_thief_question_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe einige Fragen...";
};


func int pc_thief_question_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_welcome) && (Npc_GetDistToWP(self,DIEGO_WP_THRONE) < 500) && (chapter == 1))
	{
		return TRUE;
	};
};

func void pc_thief_question_info()
{
	AI_Output(hero,self,"PC_Thief_QUESTION_15_01");	//Ich habe einige Fragen...
	AI_Output(self,hero,"PC_Thief_QUESTION_11_02");	//Lass hören.
	Info_ClearChoices(pc_thief_question);
	Info_AddChoice(pc_thief_question,DIALOG_BACK,pc_thief_question_back);
	Info_AddChoice(pc_thief_question,"Was gibt's Neues?",pc_thief_question_news);
	Info_AddChoice(pc_thief_question,"Wie sieht's im Lager aus?",pc_thief_question_camp);
	if(DIEGO_ANSWER)
	{
		Info_AddChoice(pc_thief_question,"Ich brauche einen Überblick über das Lager.",pc_thief_question_lookaround);
		Info_AddChoice(pc_thief_question,"Was sind die Regeln?",pc_thief_question_rules);
	};
};

func void pc_thief_question_back()
{
	Info_ClearChoices(pc_thief_question);
};

func void pc_thief_question_camp()
{
	Info_ClearChoices(pc_thief_question);
	AI_Output(hero,self,"PC_Thief_QUESTION_CAMP_15_01");	//Wie sieht's im Lager aus?
	AI_Output(self,hero,"PC_Thief_QUESTION_CAMP_11_02");	//Ein paar Gefangene sind hiergeblieben, so wie ich. Und es sind auch jede Menge neue Leute angekommen.
	AI_Output(self,hero,"PC_Thief_QUESTION_CAMP_11_03");	//Flüchtlinge vor den Orcs, Arbeiter, Herumtreiber, Händler...
	AI_Output(self,hero,"PC_Thief_QUESTION_CAMP_11_04");	//Seitdem bin ich so'ne Art Führungskraft.
	AI_Output(self,hero,"PC_Thief_QUESTION_CAMP_11_05");	//Ich habe eine Miliz auf die Beine gestellt. Die kümmert sich darum, daß die Regeln eingehalten werden.
	DIEGO_ANSWER = TRUE;
	Info_AddChoice(pc_thief_question,DIALOG_BACK,pc_thief_question_back);
	Info_AddChoice(pc_thief_question,"Was gibt's Neues?",pc_thief_question_news);
	Info_AddChoice(pc_thief_question,"Wie sieht's im Lager aus?",pc_thief_question_camp);
	if(DIEGO_ANSWER)
	{
		Info_AddChoice(pc_thief_question,"Ich brauche einen Überblick über das Lager.",pc_thief_question_lookaround);
		Info_AddChoice(pc_thief_question,"Was sind die Regeln hier im Lager?",pc_thief_question_rules);
	};
};

func void pc_thief_question_news()
{
	Info_ClearChoices(pc_thief_question);
	AI_Output(hero,self,"PC_Thief_QUESTION_NEWS_15_01");	//Was gibt's Neues?
	AI_Output(self,hero,"PC_Thief_QUESTION_NEWS_11_02");	//Nach dem Zusammenbruch der Barriere, bevor die Orcs alles abgeriegelt hatten, ist der König ins Tal gekommen.
	AI_Output(self,hero,"PC_Thief_QUESTION_NEWS_11_03");	//Zusammen mit seinen Paladinen und Magiern hat er sich in der Felsenfestung eingenistet.
	AI_Output(hero,self,"PC_Thief_QUESTION_NEWS_15_04");	//Was will Er hier?
	AI_Output(self,hero,"PC_Thief_QUESTION_NEWS_11_05");	//Keine Ahnung was er vorhat. Aber dieses Lager will er nicht. In seinen Augen sind wir hier Futter für die Orks.
	Info_AddChoice(pc_thief_question,DIALOG_BACK,pc_thief_question_back);
	Info_AddChoice(pc_thief_question,"Was gibt's Neues?",pc_thief_question_news);
	Info_AddChoice(pc_thief_question,"Wie sieht's im Lager aus?",pc_thief_question_camp);
	if(DIEGO_ANSWER)
	{
		Info_AddChoice(pc_thief_question,"Ich brauche einen Überblick über das Lager.",pc_thief_question_lookaround);
		Info_AddChoice(pc_thief_question,"Was sind die Regeln hier im Lager?",pc_thief_question_rules);
	};
};

func void pc_thief_question_lookaround()
{
	Info_ClearChoices(pc_thief_question);
	AI_Output(hero,self,"PC_Thief_QUESTION_LOOKAROUND_15_01");	//Ich brauche einen Überblick über das Lager.
	AI_Output(self,hero,"PC_Thief_QUESTION_LOOKAROUND_11_02");	//Igaraz kann dir alles zeigen. Der hat sowieso den ganzen Tag nichts zu tun.
	AI_Output(self,hero,"PC_Thief_QUESTION_LOOKAROUND_11_03");	//Meistens treibt er sich am Eingang des Lagers herum.
	KNOWS_IGARAZ = TRUE;
	Info_AddChoice(pc_thief_question,DIALOG_BACK,pc_thief_question_back);
	Info_AddChoice(pc_thief_question,"Was gibt's Neues?",pc_thief_question_news);
	Info_AddChoice(pc_thief_question,"Wie sieht's im Lager aus?",pc_thief_question_camp);
	if(DIEGO_ANSWER)
	{
		Info_AddChoice(pc_thief_question,"Ich brauche einen Überblick über das Lager.",pc_thief_question_lookaround);
		Info_AddChoice(pc_thief_question,"Was sind die Regeln hier im Lager?",pc_thief_question_rules);
	};
};

func void pc_thief_question_rules()
{
	Info_ClearChoices(pc_thief_question);
	AI_Output(hero,self,"PC_Thief_QUESTION_RULES_15_01");	//Was sind die Regeln hier im Lager?
	AI_Output(self,hero,"PC_Thief_QUESTION_RULES_11_02");	//Die Miliz achtet darauf, daß hier alles ruhig bleibt. Keine Kämpfe, kein Faustrecht! Wir brauchen jeden Mann!
	AI_Output(self,hero,"PC_Thief_QUESTION_RULES_11_03");	//Wird jemand beim Klauen oder Morden erwischt, wird er bestraft.
	AI_Output(self,hero,"PC_Thief_QUESTION_RULES_11_04");	//Die Zeiten, als ich mir selbst noch die Taschen gefüllt habe, sind vorbei! Jetzt geht es um andere Dinge!
	Info_AddChoice(pc_thief_question,DIALOG_BACK,pc_thief_question_back);
	Info_AddChoice(pc_thief_question,"Was gibt's Neues?",pc_thief_question_news);
	Info_AddChoice(pc_thief_question,"Wie sieht's im Lager aus?",pc_thief_question_camp);
	if(DIEGO_ANSWER)
	{
		Info_AddChoice(pc_thief_question,"Ich brauche einen Überblick über das Lager.",pc_thief_question_lookaround);
		Info_AddChoice(pc_thief_question,"Was sind die Regeln hier im Lager?",pc_thief_question_rules);
	};
};


instance PC_THIEF_ROOM(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_room_condition;
	information = pc_thief_room_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kann ich hier irgendwo pennen?";
};


func int pc_thief_room_condition()
{
	if(DIEGO_ANSWER && (chapter == 1))
	{
		return TRUE;
	};
};

func void pc_thief_room_info()
{
	AI_Output(hero,self,"PC_Thief_ROOM_15_01");	//Kann ich hier irgendwo pennen?
	AI_Output(self,hero,"PC_Thief_ROOM_11_02");	//Im Erzbaronhaus ist genug Platz, auch ich wohne jetzt da.
	AI_Output(self,hero,"PC_Thief_ROOM_11_03");	//Wie klingt das?
	AI_Output(hero,self,"PC_Thief_ROOM_15_04");	//Klingt verdammt gut.
	AI_Output(self,hero,"PC_Thief_ROOM_11_05");	//Die Miliz beansprucht auch ein paar Räume.
	AI_Output(self,hero,"PC_Thief_ROOM_11_06");	//Du wirst schon rausfinden, wo du pennen kannst.
};


instance PC_THIEF_NEEDTRAINING(C_Info)
{
	npc = PC_Thief;
	nr = 5;
	condition = pc_thief_needtraining_condition;
	information = pc_thief_needtraining_info;
	description = "Ich muss meine Fähigkeiten trainieren";
};


func int pc_thief_needtraining_condition()
{
	return TRUE;
};

func void pc_thief_needtraining_info()
{
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	AI_Output(other,self,"PC_Thief_NEEDTRAINING_Info_15_01");	//Ich muss meine Fähigkeiten trainieren.
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_02");	//Ich kann dir helfen, was Geschicklichkeit und Bogenschiessen angeht.
	B_LogEntry(GE_TeacherOC,"Diego wird mir helfen, meine GESCHICKLICHKEIT und BOGENTALENTE zu trainieren. Ich kann ihn im Erzbaronhaus finden.");
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_03");	//Magie ist Lesters Spezialität. Er experimentiert im alten Magierhaus in der Burg herum.
	B_LogEntry(GE_TeacherOC,"Lester wird mir helfen, meine MANA zu verbessern und neue ZAUBERSPRÜCHE zu erlernen. Er ist im alten Magierhaus in der Burg zu finden.");
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_04");	//Und dann ist da noch Cassian, der Leutnant der Miliz. Er wird dir mit Freuden alle Kampftechniken einprügeln.
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_05");	//Tagsüber trainiert er im Burginnenhof die Soldaten der Miliz.
	B_LogEntry(GE_TeacherOC,"Cassian wird mir helfen, meine STÄRKE sowie das Kampftalent EINHÄNDER zu trainieren. Er trainiert tagsüber Soldaten im Burginnenhof.");
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_06");	//Wie ich sehe, brauchst du auch eine neue Ausrüstung.
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_07");	//Nimm erstmal dieses Schwert. Bessere Waffen wirst du schon alleine auftreiben.
	B_GiveInvItems(self,hero,itmw_rustysword,1);
	AI_EquipBestMeleeWeapon(hero);
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_08");	//Ich geb dir auch etwas Silber. Das ist die neue Währung hier, seit die Barriere weg ist.
	B_GiveInvItems(self,hero,itmi_silver,30);
	AI_Output(self,other,"PC_Thief_NEEDTRAINING_Info_11_09");	//Es gibt hier viele Möglichkeiten etwas zu verdienen.
};


instance PC_THIEF_WHYBOW(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_whybow_condition;
	information = pc_thief_whybow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wofür brauche ich Bogentalent?";
};


func int pc_thief_whybow_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_needtraining))
	{
		return TRUE;
	};
};

func void pc_thief_whybow_info()
{
	AI_Output(hero,self,"PC_Thief_WHYBOW_15_01");	//Wofür brauche ich Bogentalent?
	AI_Output(self,hero,"PC_Thief_WHYBOW_11_02");	//Je mehr Talent du im Umgang mit dieser Waffe erlernst, desto schneller kannst du Pfeile abfeuern.
	AI_Output(self,hero,"PC_Thief_WHYBOW_11_03");	//Ausserdem kann nur ein talentierter Bogenschütze ungeschütze Stellen treffen und so manchmal tiefere Wunden verursachen.
};


instance PC_THIEF_WHYDEX(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_whydex_condition;
	information = pc_thief_whydex_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wofür brauche ich Geschicklichkeit?";
};


func int pc_thief_whydex_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_needtraining))
	{
		return TRUE;
	};
};

func void pc_thief_whydex_info()
{
	AI_Output(hero,self,"PC_Thief_WHYDEX_15_01");	//Wofür brauche ich Geschicklichkeit?
	AI_Output(self,hero,"PC_Thief_WHYDEX_11_02");	//Je geschickter du bist, desto häufiger triffst du ein Ziel mit dem Bogen.
	AI_Output(self,hero,"PC_Thief_WHYDEX_11_03");	//Besonders ungeschickte Bogenschützen geben manchmal ein halbes Dutzend Schüsse ab, ohne ihr Ziel auch nur ein einziges Mal zu treffen.
	AI_Output(self,hero,"PC_Thief_WHYDEX_11_04");	//Die besseren Bögen sind darüberhinaus so schwer zu handhaben, dass nur sehr geschickte Schützen überhaupt damit umgehen können.
};


instance PC_THIEF_STARTRAINING(C_Info)
{
	npc = PC_Thief;
	nr = 4;
	condition = pc_thief_startraining_condition;
	information = pc_thief_startraining_info;
	important = 0;
	permanent = 1;
	description = "Ich will trainieren";
};


func int pc_thief_startraining_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_needtraining))
	{
		return TRUE;
	};
};

func void pc_thief_startraining_info()
{
	AI_Output(other,self,"PC_Thief_STARTRAINING_Info_15_01");	//Ich will trainieren.
	Info_ClearChoices(pc_thief_startraining);
	Info_AddChoice(pc_thief_startraining,DIALOG_BACK,pc_thief_startraining_back);
	Info_AddChoice(pc_thief_startraining,"Ich will geschickter werden",pc_thief_startraining_dex);
	if(Npc_GetTalentSkill(other,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,0),pc_thief_startraining_bow1);
	};
	if((LEARNBOW_1 == LOG_SUCCESS) && (Npc_GetTalentSkill(other,NPC_TALENT_BOW) == 1))
	{
		Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,0),pc_thief_startraining_bow2);
	};
};

func void pc_thief_startraining_back()
{
	Info_ClearChoices(pc_thief_startraining);
};

func void pc_thief_startraining_dex()
{
	AI_Output(hero,self,"PC_Thief_STARTRAINING_DEX_15_01");	//Ich will geschickter werden.
	Info_ClearChoices(pc_thief_startraining);
	Info_AddChoice(pc_thief_startraining,DIALOG_BACK,pc_thief_startraining_dex_back);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_5);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_1);
};

func void pc_thief_startraining_dex_back()
{
	Info_ClearChoices(pc_thief_startraining);
};

func void pc_thief_startraining_dex_dex_1()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(pc_thief_startraining);
	Info_AddChoice(pc_thief_startraining,DIALOG_BACK,pc_thief_startraining_dex_back);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_5);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_1);
};

func void pc_thief_startraining_dex_dex_5()
{
	B_BuyAttributePoints(hero,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(pc_thief_startraining);
	Info_AddChoice(pc_thief_startraining,DIALOG_BACK,pc_thief_startraining_dex_back);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_5);
	Info_AddChoice(pc_thief_startraining,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),pc_thief_startraining_dex_dex_1);
};

func void pc_thief_startraining_bow1()
{
	if(B_GiveSkill(other,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
	{
		AI_Output(other,self,"PC_Thief_STARTRAINING_BOW1_15_01");	//Zeig mir den Umgang mit dem Bogen.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_02");	//Zunächst die Haltung. Es ist wichtig dass du sicheren Stand hast, wenn du ruhig schiessen willst.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_03");	//Visiere dein Ziel über den gestreckten Arm an.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_04");	//Dann spanne den Bogen mit ganzer Kraft. Lass das Ziel dabei nicht aus den Augen.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_05");	//Du wirst nicht mit jedem Schuss treffen. Aber je talentierter du bist, desto öfter triffst du.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_06");	//Soviel zur Theorie. Mal sehen, wie gut du mit dem Bogen umgehst.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_07");	//Draussen im Burghof ist die Mauer gebrochen. Auf dem Wehrgang und auf dem Vordach der Schmiede haben sich FLEISCHWANZEN eingenistet.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW1_11_08");	//Die Mistviecher machen die Mauern kaputt. Suche dir eine gute Position und erledige mindestens 5 Stück.
		Wld_InsertNpc(acid_meatbug_1,"FP_MEATBUG_SPAWN_05");
		Wld_InsertNpc(acid_meatbug_2,"FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc(acid_meatbug_3,"FP_MEATBUG_SPAWN_06");
		Wld_InsertNpc(acid_meatbug_4,"FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc(acid_meatbug_5,"FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc(acid_meatbug_6,"FP_MEATBUG_SPAWN_15");
		Wld_InsertNpc(acid_meatbug_7,"FP_MEATBUG_SPAWN_13");
		Wld_InsertNpc(acid_meatbug_8,"FP_MEATBUG_SPAWN_14");
		Wld_InsertNpc(acid_meatbug_9,"FP_MEATBUG_SPAWN_15");
		LEARNBOW_1 = LOG_RUNNING;
		Log_CreateTopic(CH1_TRAINBOW_1,LOG_MISSION);
		Log_SetTopicStatus(CH1_TRAINBOW_1,LOG_RUNNING);
		B_LogEntry(CH1_TRAINBOW_1,"Auf dem unzugänglichen Stück Wehrgang an der Burgschmiede und auf dem Vordach sind ein paar Fleischwanzen. Davon soll ich mindestens fünf erledigen.");
	};
};


instance PC_THIEF_BOW1RUNNING(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_bow1running_condition;
	information = pc_thief_bow1running_info;
	description = "Ich habe noch keinen Bogen";
	permanent = FALSE;
};


func int pc_thief_bow1running_condition()
{
	if(LEARNBOW_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void pc_thief_bow1running_info()
{
	AI_Output(other,self,"PC_Thief_BOW1RUNNING_Info_15_01");	//Ich habe noch keinen Bogen. Womit soll ich sie erledigen?
	AI_Output(self,other,"PC_Thief_BOW1RUNNING_Info_11_02");	//Geh zu Helvegor am Marktplatz. Er kann dir bestimmt einen Bogen verkaufen.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Helvegor, der Bogenmacher verkauft seine Waren am Marktplatz");
};


instance PC_THIEF_BOW1SUCCESS(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_bow1success_condition;
	information = pc_thief_bow1success_info;
	important = FALSE;
	permanent = TRUE;
	description = "Die Fleischwanzen knabbern nichts mehr an.";
};


func int pc_thief_bow1success_condition()
{
	var C_Npc meatbug_1;
	var C_Npc meatbug_2;
	var C_Npc meatbug_3;
	var C_Npc meatbug_4;
	var C_Npc meatbug_5;
	var C_Npc meatbug_6;
	var C_Npc meatbug_7;
	var C_Npc meatbug_8;
	var C_Npc meatbug_9;
	var int int_deadcounter;
	meatbug_1 = Hlp_GetNpc(acid_meatbug_1);
	meatbug_2 = Hlp_GetNpc(acid_meatbug_2);
	meatbug_3 = Hlp_GetNpc(acid_meatbug_3);
	meatbug_4 = Hlp_GetNpc(acid_meatbug_4);
	meatbug_5 = Hlp_GetNpc(acid_meatbug_5);
	meatbug_6 = Hlp_GetNpc(acid_meatbug_6);
	meatbug_7 = Hlp_GetNpc(acid_meatbug_7);
	meatbug_8 = Hlp_GetNpc(acid_meatbug_8);
	meatbug_9 = Hlp_GetNpc(acid_meatbug_9);
	int_deadcounter = 0;
	if(Npc_IsDead(meatbug_1))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_2))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_3))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_4))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_5))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_6))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_7))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_8))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_9))
	{
		int_deadcounter += 1;
	};
	if((LEARNBOW_1 == LOG_RUNNING) && (int_deadcounter >= 5))
	{
		return TRUE;
	};
};

func void pc_thief_bow1success_info()
{
	Info_ClearChoices(pc_thief_bow1success);
	AI_Output(other,self,"PC_Thief_BOW1SUCCESS_Info_Ready_15_01");	//Die Fleischwanzen knabbern nichts mehr an.
	AI_Output(self,other,"PC_Thief_BOW1SUCCESS_Info_Ready_11_02");	//Ausgezeichnet.
	LEARNBOW_1 = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINBOW_1,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINBOW_1,"Die Fleischwanzen sind erledigt.");
	B_GiveXP(XP_BOW1);
};


instance PC_THIEF_BOW1RUNNINGMEATBUG(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_bow1runningmeatbug_condition;
	information = pc_thief_bow1runningmeatbug_info;
	important = 0;
	permanent = 1;
	description = "Wo treiben sich die Meatbugs nochmal rum?";
};


func int pc_thief_bow1runningmeatbug_condition()
{
	var C_Npc meatbug_1;
	var C_Npc meatbug_2;
	var C_Npc meatbug_3;
	var C_Npc meatbug_4;
	var C_Npc meatbug_5;
	var C_Npc meatbug_6;
	var C_Npc meatbug_7;
	var C_Npc meatbug_8;
	var C_Npc meatbug_9;
	var int int_deadcounter;
	meatbug_1 = Hlp_GetNpc(acid_meatbug_1);
	meatbug_2 = Hlp_GetNpc(acid_meatbug_2);
	meatbug_3 = Hlp_GetNpc(acid_meatbug_3);
	meatbug_4 = Hlp_GetNpc(acid_meatbug_4);
	meatbug_5 = Hlp_GetNpc(acid_meatbug_5);
	meatbug_6 = Hlp_GetNpc(acid_meatbug_6);
	meatbug_7 = Hlp_GetNpc(acid_meatbug_7);
	meatbug_8 = Hlp_GetNpc(acid_meatbug_8);
	meatbug_9 = Hlp_GetNpc(acid_meatbug_9);
	int_deadcounter = 0;
	if(Npc_IsDead(meatbug_1))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_2))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_3))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_4))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_5))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_6))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_7))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_8))
	{
		int_deadcounter += 1;
	};
	if(Npc_IsDead(meatbug_9))
	{
		int_deadcounter += 1;
	};
	if((LEARNBOW_1 == LOG_RUNNING) && (int_deadcounter < 5))
	{
		return TRUE;
	};
};

func void pc_thief_bow1runningmeatbug_info()
{
	AI_Output(other,self,"PC_Thief_BOW1SUCCESS_Info_Running_15_01");	//Wo treiben sich die Meatbugs nochmal rum?
	AI_Output(self,other,"PC_Thief_BOW1SUCCESS_Info_Running_11_02");	//Hörst Du mir überhaupt zu? Auf dem Vordach der Schmiede und dem Wehrgang.
	AI_StopProcessInfos(self);
};

func void pc_thief_startraining_bow2()
{
	AI_Output(other,self,"PC_Thief_STARTRAINING_BOW2_15_01");	//Ich will Meister des Bogenschiessens werden.
	if(B_GiveSkill(other,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
	{
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_02");	//Sehr gut! Die Grundlagen kennst du ja schon. Kommen wir als zu den Feinheiten.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_03");	//Den ersten Schuss solltest du aus großer Entfernung abgeben, damit Du mehrere Treffer landen kannst, bevor der Gegner dich erreicht.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_04");	//Um auch weiter entfernte Ziele zu treffen, musst du höher zielen. Bewegt sich das Ziel seitlich, musst Du ausserdem vorhalten, damit es in deinen Schuss reinläuft.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_05");	//Wenn du das beachtest, wirst du ab jetzt viel öfter treffen.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_06");	//Ich hab auch eine Idee, wie du das Ganze üben kannst.
		AI_Output(self,other,"PC_Thief_STARTRAINING_BOW2_11_07");	//Vor dem Lager, in der Nähe der Brücke, treiben sich oft Molerats herum. Versuche 5 zu erlegen und bring mir das Fleisch.
		AI_Output(other,self,"PC_Thief_STARTRAINING_BOW2_15_08");	//Dann werd ich mich mal um die Biester kümmern.
		LEARNBOW_2 = LOG_RUNNING;
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Wld_InsertNpc(Molerat,"OW_PATH_193");
		Log_CreateTopic(CH1_TRAINBOW_2,LOG_MISSION);
		Log_SetTopicStatus(CH1_TRAINBOW_2,LOG_RUNNING);
		B_LogEntry(CH1_TRAINBOW_2,"Ich soll Diego das Fleisch von 5 Molerats bringen");
	};
};


instance PC_THIEF_BOW2RUNNING(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_bow2running_condition;
	information = pc_thief_bow2running_info;
	important = FALSE;
	permanent = TRUE;
	description = "Gibt es noch etwas, daß ich über die Molerats wissen muß?";
};


func int pc_thief_bow2running_condition()
{
	if((LEARNBOW_2 == LOG_RUNNING) && (Npc_HasItems(other,itfo_muttonraw) < 10))
	{
		return TRUE;
	};
	return FALSE;
};

func void pc_thief_bow2running_info()
{
	AI_Output(hero,self,"PC_Thief_BOW2RUNNING_15_01");	//Gibt es noch etwas, daß ich über die Molerats wissen muß?
	AI_Output(self,hero,"PC_Thief_BOW2RUNNING_11_02");	//Sie sind langsam und können nicht klettern. Sollte nicht so schwer werden, ein paar zu erlegen, wenn Du vorsichtig bist.
};


instance PC_THIEF_BOW2SUCCESS(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_bow2success_condition;
	information = pc_thief_bow2success_info;
	important = 0;
	permanent = 0;
	description = "Ich hab das Fleisch der Molerats";
};


func int pc_thief_bow2success_condition()
{
	if((LEARNBOW_2 == LOG_RUNNING) && (Npc_HasItems(other,itfo_muttonraw) >= 10))
	{
		return TRUE;
	};
};

func void pc_thief_bow2success_info()
{
	AI_Output(other,self,"PC_Thief_BOW2SUCCESS_Info_15_01");	//Ich hab das Fleisch der Molerats
	AI_Output(self,other,"PC_Thief_BOW2SUCCESS_Info_11_02");	//Gute Arbeit. Du bist schon wieder besser in Form!
	AI_Output(other,self,"PC_Thief_BOW2SUCCESS_Info_15_03");	//Wenn ich mit meinem Trainig fertig bin, kann ich überall als Kammerjäger anheuern.
	B_GiveInvItems(other,self,itfo_muttonraw,10);
	LEARNBOW_2 = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINBOW_2,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINBOW_2,"Diego hat das Fleisch der Molerats. Damit habe ich alles über den Umgang mit dem Bogen gelernt.");
	B_GiveXP(XP_BOW2);
};


instance PC_THIEF_STARTRAINING_THIEF(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_startraining_thief_condition;
	information = pc_thief_startraining_thief_info;
	important = 0;
	permanent = 0;
	description = "Ich möchte Diebes-Talente lernen.";
};


func int pc_thief_startraining_thief_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_needtraining))
	{
		return TRUE;
	};
};

func void pc_thief_startraining_thief_info()
{
	AI_Output(other,self,"PC_Thief_STARTRAINING_THIEF_Info_15_01");	//Ich möchte Diebes-Talente lernen.
	AI_Output(self,other,"PC_Thief_STARTRAINING_THIEF_Info_11_02");	//Schleichen, Schlösser knacken, Taschendiebstahl? Aus der Nummer bin ich raus. Muß dafür sorgen, daß hier im Lager ein paar Regeln eingehalten werden.
	AI_Output(self,other,"PC_Thief_STARTRAINING_THIEF_Info_11_03");	//Es gibt aber jemanden, der dir weiterhelfen könnte. Gerion. Du findest ihn irgendwo in der Gegend des hinteren Tores.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Gerion kann mir die Talente SCHLEICHEN, SCHLÖSSER KNACKEN und TASCHENDIEBSTAHL beibringen. Er hält sich irgendwo am hinteren Tor auf.");
};


instance PC_THIEF_GERIONTHIEF(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_gerionthief_condition;
	information = pc_thief_gerionthief_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und wenn Gerion mir nicht helfen will?";
};


func int pc_thief_gerionthief_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_startraining_thief))
	{
		return TRUE;
	};
};

func void pc_thief_gerionthief_info()
{
	var C_Npc berengar;
	berengar = Hlp_GetNpc(mil_103_berengar);
	AI_Output(hero,self,"PC_Thief_GERIONTHIEF_15_01");	//Und wenn Gerion mir nicht helfen will?
	AI_Output(self,hero,"PC_Thief_GERIONTHIEF_11_02");	//Sag ihm, daß du mir von seinen kleinen Raubzügen erzählen könntest, wenn er dir nicht hilft.
	AI_Output(hero,self,"PC_Thief_GERIONTHIEF_15_03");	//Du weißt, daß er ein Dieb ist?
	AI_Output(self,hero,"PC_Thief_GERIONTHIEF_11_04");	//Natürlich! Aber er weiß nicht, daß ich es weiß!
	AI_Output(self,hero,"PC_Thief_GERIONTHIEF_11_05");	//Manchmal ist es eben besser nichts zu unternehmen.
	AI_Output(hero,self,"PC_Thief_GERIONTHIEF_15_06");	//Stimmt, mir hast du damit geholfen!
	AI_Output(self,hero,"PC_Thief_GERIONTHIEF_11_07");	//Das ist aber kein Freibrief die Regeln zu brechen! Wenn du krumme Dinger machst, laß dich wenigstens nicht erwischen!
};


instance PC_THIEF_XARDASLETTER(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_xardasletter_condition;
	information = pc_thief_xardasletter_info;
	important = FALSE;
	permanent = FALSE;
	description = "Xardas gab mir eine Botschaft für dich mit!";
};


func int pc_thief_xardasletter_condition()
{
	if((Npc_HasItems(hero,itwr_xardas_letter_sealed) || Npc_HasItems(hero,itwr_xardas_letter)) && (chapter == 1))
	{
		return TRUE;
	};
};

func void pc_thief_xardasletter_info()
{
	AI_Output(hero,self,"PC_Thief_XARDASLETTER_15_01");	//Xardas gab mir eine Botschaft für dich mit!
	AI_Output(self,hero,"PC_Thief_XARDASLETTER_11_02");	//Xardas...? Eine Botschaft...? Für mich...?
	AI_Output(hero,self,"PC_Thief_XARDASLETTER_15_03");	//Ja hier ist sie!
	if(Npc_HasItems(hero,itwr_xardas_letter_sealed))
	{
		B_GiveInvItems(hero,self,itwr_xardas_letter_sealed,1);
		B_UseFakeScroll();
		AI_Output(self,hero,"PC_Thief_XARDASLETTER_11_04");	//Hmmm....
		AI_Output(self,hero,"PC_Thief_XARDASLETTER_11_05");	//Sieht verdammt übel aus. Hier, lies selbst!
		B_GiveInvItems(self,hero,itwr_xardas_letter,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GiveInvItems(hero,self,itwr_xardas_letter,1);
		B_UseFakeScroll();
		AI_Output(self,hero,"PC_Thief_XARDASLETTER_11_06");	//Offenbar hast du die Nachricht schon gelesen! Dann weisst du ja Bescheid.
		B_GiveInvItems(self,hero,itwr_xardas_letter,1);
	};
};


instance PC_THIEF_WHATNOW(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_whatnow_condition;
	information = pc_thief_whatnow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was meint Xardas mit ...wenn ich bereit bin... ?";
};


func int pc_thief_whatnow_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_xardasletter) && DIEGO_LETTERREAD && (chapter == 1))
	{
		return TRUE;
	};
};

func void pc_thief_whatnow_info()
{
	AI_Output(hero,self,"PC_Thief_WHATNOW_15_01");	//Was meint Xardas mit ...wenn ich bereit bin... ?
	if(hero.level < HERO_LEVEL_CH2)
	{
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_02");	//Du musst erst mal wieder in Form kommen, sonst bist du Futter da draussen!
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_03");	//Ich werde dich schon bald brauchen. Es gibt einfach zu wenig gute Leute hier!
		AI_Output(hero,self,"PC_Thief_WHATNOW_15_04");	//Und ich dachte, dieser ganze Mist sei endgültig vorbei!
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_05");	//Wohl kaum! Erst die Orks und nun kommen auch noch Dämonen dazu! Schöne Scheisse!
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_06");	//Wenn das durchsickert ist hier im Lager die Hölle los. Die Leute machen sich ja schon wegen der Orks in die Hose...
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_07");	//Also schau zu, dass du wieder fit wirst und trainiere soviel du nur kannst.
		B_LogEntry(CH1_DEMONTHREAT,"Diego hält mich noch nicht wieder für überlebensfähig. Ich muss im Lager meine Fähigkeiten trainiere und wieder fit werden.");
	}
	else
	{
		AI_Output(self,hero,"PC_Thief_WHATNOW_11_08");	//Wie ich sehe, bist du gut in Form für jemanden der so lange tot und begraben war. Ich glaube du hast da draussen jetzt wieder eine Chance.
	};
};


instance PC_THIEF_ITSOK(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_itsok_condition;
	information = pc_thief_itsok_info;
	important = FALSE;
	permanent = TRUE;
	description = "Bereit oder nicht! Ich kann dir helfen...";
};


func int pc_thief_itsok_condition()
{
	if((Npc_KnowsInfo(hero,pc_thief_whatnow) || (chapter == 2)) && (hero.level < HERO_LEVEL_CH2))
	{
		return TRUE;
	};
};

func void pc_thief_itsok_info()
{
	AI_Output(hero,self,"PC_Thief_ITSOK_15_01");	//Bereit oder nicht! Ich kann dir helfen...
	AI_Output(self,hero,"PC_Thief_ITSOK_11_02");	//Sie dich doch an. Du wirst ja nicht mal mehr mit einem Rudel Snapper fertig und wir werden es bald mit Dämonen zu tun bekommen.
	AI_Output(self,hero,"PC_Thief_ITSOK_11_03");	//Lerne und trainiere so viel wie möglich hier im Lager, sonst bist du nicht mehr als Futter für die Wölfe.
	AI_Output(self,hero,"PC_Thief_ITSOK_11_04");	//Wenn du erfahren genug bist, komm zu mir zurück.
	b_printleveltoolow(HERO_LEVEL_CH2);
	AI_StopProcessInfos(self);
};


instance PC_THIEF_IAMREADY(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_iamready_condition;
	information = pc_thief_iamready_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich bin wieder in Form. Es kann losgehen!";
};


func int pc_thief_iamready_condition()
{
	if((Npc_KnowsInfo(hero,pc_thief_whatnow) || (chapter == 2)) && (hero.level >= HERO_LEVEL_CH2))
	{
		return TRUE;
	};
};

func void pc_thief_iamready_info()
{
	AI_Output(hero,self,"PC_Thief_IAMREADY_15_01");	//Ich bin wieder in Form. Es kann losgehen!
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_02");	//Gut, denn ich brauche dich jetzt!
	AI_Output(hero,self,"PC_Thief_IAMREADY_15_03");	//Worum geht es?
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_05");	//Milten, unser alter Freund, ist bei den Feuermagiern in der Bergfestung.
	AI_Output(hero,self,"PC_Thief_IAMREADY_15_06");	//Milten ist hier?
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_07");	//Ja! Wenn es stimmt, was Xardas schreibt, brauchen wir hier im Lager sehr bald seine Hilfe.
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_04");	//Ich habe keine Ahnung von Dämonen und ausserdem kann ich auch nicht von hier weg.
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_08");	//Geh in die Bergfestung und sprich mit Milten über Xardas' Warnung. Er wird dir zuhören.
	AI_Output(self,hero,"PC_Thief_IAMREADY_11_09");	//Du musst einen Weg finden, diese dämonische Brut aufzuhalten.
	Log_CreateTopic(CH1_DEMONTHREAT,LOG_MISSION);
	Log_SetTopicStatus(CH1_DEMONTHREAT,LOG_RUNNING);
	B_LogEntry(CH1_DEMONTHREAT,"Nach ausreichend Training werde ich nun zu Milten, meinem Weggefährten von früher, aufbrechen. Er ist einer der Feuermagier in der Bergfestung. Diego braucht seine Hilfe gegen die dämonische Bedrohung.");
};


instance PC_THIEF_PROBLEM(C_Info)
{
	npc = PC_Thief;
	condition = pc_thief_problem_condition;
	information = pc_thief_problem_info;
	important = FALSE;
	permanent = FALSE;
	description = "Sieht aus, als ob ich meine alte Arbeit zurück habe!";
};


func int pc_thief_problem_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_iamready))
	{
		return TRUE;
	};
};

func void pc_thief_problem_info()
{
	AI_Output(hero,self,"PC_Thief_PROBLEM_15_01");	//(sarkastisch) Sieht aus, als ob ich meine alte Arbeit zurück habe!
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_02");	//(grinst) Das Leben ist hart und ungerecht...
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_03");	//(wieder ernst) Allerdings gibt es da noch ein Problem!
	AI_Output(hero,self,"PC_Thief_PROBLEM_15_04");	//(ironisch) Wiese wundert mich das nicht?
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_05");	//Rhobars' Paladine haben die Bergfestung völlig abgeschottet.
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_06");	//Nicht mal eine Fleischwanze würde es schaffen, auch nur einen Fuss in das Gemäuer zu setzen.
	AI_Output(hero,self,"PC_Thief_PROBLEM_15_07");	//Wie komme ich dann hinein?
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_08");	//Thora ist eine Kundschafterin der Paladine.
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_09");	//Wenn dich jemand in die Festung bringen kann, dann ist sie es.
	AI_Output(hero,self,"PC_Thief_PROBLEM_15_10");	//Ich werde mit ihr sprechen. Wir sehen uns wieder!
	AI_Output(self,hero,"PC_Thief_PROBLEM_11_11");	//Viel Erfolg, mein Freund!
	B_LogEntry(CH1_DEMONTHREAT,"Die Bergfestung wird von den Paladinen des Königs abgeschottet. Thora arbeitet als Kundschafterin für die Paladine. Sie ist der einzige Weg für mich, in die Festung zu gelangen.");
	B_Kapitelwechsel(2);
};
