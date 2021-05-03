
instance THF_403_GERION_EXIT(C_Info)
{
	npc = thf_403_gerion;
	nr = 999;
	condition = thf_403_gerion_exit_condition;
	information = thf_403_gerion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int thf_403_gerion_exit_condition()
{
	return TRUE;
};

func void thf_403_gerion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_403_GERION_23(C_Info)
{
	npc = thf_403_gerion;
	nr = 45;
	condition = thf_403_gerion_23_condition;
	information = thf_403_gerion_23_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int thf_403_gerion_23_condition()
{
	return TRUE;
};

func void thf_403_gerion_23_info()
{
	AI_Output(hero,self,"THF_403_23_15_01");	//Was machst du hier?
	AI_Output(self,hero,"THF_403_23_11_02");	//Ich bin Gerion aus Khorinis. Vor einigen Wochen habe ich die Stadt verlassen.
	AI_Output(self,hero,"THF_403_23_11_03");	//Was eine gute Entscheidung war, denn kurz darauf kamen die Orks.
	AI_Output(self,hero,"THF_403_23_11_04");	//Jetzt bin ich hier. Aber ich weiß nicht, ob das auch ne gute Entscheidung war, denn hier haben die Orks alles abgeriegelt.
};


instance THF_403_GERION_DIEGO(C_Info)
{
	npc = thf_403_gerion;
	nr = 13;
	condition = thf_403_gerion_diego_condition;
	information = thf_403_gerion_diego_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich will die Kunst der Diebe lernen.";
};


func int thf_403_gerion_diego_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_startraining_thief))
	{
		return TRUE;
	};
};

func void thf_403_gerion_diego_info()
{
	AI_Output(hero,self,"THF_403_DIEGO_15_01");	//Ich will die Kunst der Diebe lernen.
	AI_Output(self,hero,"THF_403_DIEGO_11_02");	//Warum schreist du nicht noch lauter, damit es auch wirklich JEDER mitkriegt!?
	AI_Output(self,hero,"THF_403_DIEGO_11_03");	//Ausserdem weiß ich gar nicht wovon du redest.
};


instance THF_403_GERION_TELLDIEGO(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_telldiego_condition;
	information = thf_403_gerion_telldiego_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann kann ich also Diego von deinen Raubzügen erzählen?";
};


func int thf_403_gerion_telldiego_condition()
{
	if(Npc_KnowsInfo(hero,thf_403_gerion_diego) && Npc_KnowsInfo(hero,pc_thief_gerionthief) && !Npc_IsInRoutine(self,ZS_Sleep) && !Npc_KnowsInfo(hero,thf_403_gerion_telldiego2))
	{
		return TRUE;
	};
};

func void thf_403_gerion_telldiego_info()
{
	AI_Output(hero,self,"THF_403_Gerion_TELLDIEGO_15_01");	//Dann kann ich also Diego von deinen kleinen Raubzügen erzählen?
	AI_Output(self,hero,"THF_403_Gerion_TELLDIEGO_11_02");	//Hey, nicht so laut! Laß uns woanders hingehen. Komm mit!
	GUIDEPC_DESTINATION = GERION_WP;
	Npc_ExchangeRoutine(self,"GOTOHUT");
	AI_StopProcessInfos(self);
};


instance THF_403_GERION_TELLDIEGO2(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_telldiego2_condition;
	information = thf_403_gerion_telldiego2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich könnte Diego von deinen Raubzügen erzählen!";
};


func int thf_403_gerion_telldiego2_condition()
{
	if(Npc_KnowsInfo(hero,thf_403_gerion_diego) && Npc_KnowsInfo(hero,pc_thief_gerionthief) && Npc_IsInRoutine(self,ZS_Sleep) && !Npc_KnowsInfo(hero,thf_403_gerion_telldiego))
	{
		return TRUE;
	};
};

func void thf_403_gerion_telldiego2_info()
{
	AI_Output(hero,self,"THF_403_Gerion_TELLDIEGO2_15_01");	//Ich könnte Diego von deinen kleinen Raubzügen erzählen!
	AI_Output(self,hero,"THF_403_Gerion_TELLDIEGO2_11_02");	//Ich schlag dir ein Geschäft vor!
	AI_Output(self,hero,"THF_403_Gerion_TELLDIEGO2_11_03");	//Du behältst das für dich und dafür zeige ich dir die Talente der Diebe.
	AI_Output(hero,self,"THF_403_Gerion_TELLDIEGO2_15_04");	//Ich wußte, das wir uns verstehen würden.
	AI_Output(self,hero,"THF_403_Gerion_TELLDIEGO2_11_05");	//Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output(self,hero,"THF_403_Gerion_TELLDIEGO2_11_06");	//Sag mir Bescheid, wenn du bereit bist.
};


instance THF_403_GERION_INSIDER(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_insider_condition;
	information = thf_403_gerion_insider_info;
	important = TRUE;
	permanent = FALSE;
};


func int thf_403_gerion_insider_condition()
{
	if(Npc_IsInRoutine(self,ZS_GuidePC) && (Npc_GetDistToWP(self,"OCR_HUT_79") <= 200) && Npc_KnowsInfo(hero,thf_403_gerion_telldiego))
	{
		return TRUE;
	};
};

func void thf_403_gerion_insider_info()
{
	AI_Output(self,hero,"THF_403_INSIDER_11_01");	//Ich schlage dir ein Geschäft vor.
	AI_Output(hero,self,"THF_403_INSIDER_15_02");	//Nämlich?
	AI_Output(self,hero,"THF_403_INSIDER_11_03");	//Du verpfeifst mich nicht und dafür zeige ich dir die Talente der Diebe.
	AI_Output(hero,self,"THF_403_INSIDER_15_04");	//Ich wußte das wir uns verstehen würden.
	AI_Output(self,hero,"THF_403_INSIDER_11_05");	//Als erstes musst Du lernen, dich lautlos zu bewegen.
	AI_Output(self,hero,"THF_403_INSIDER_11_06");	//Sag mir Bescheid, wenn du bereit bist.
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance THF_403_GERION_LEARNSNEAK(C_Info)
{
	npc = thf_403_gerion;
	nr = 23;
	condition = thf_403_gerion_learnsneak_condition;
	information = thf_403_gerion_learnsneak_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0);
};


func int thf_403_gerion_learnsneak_condition()
{
	if((Npc_KnowsInfo(hero,thf_403_gerion_insider) || Npc_KnowsInfo(hero,thf_403_gerion_telldiego2)) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void thf_403_gerion_learnsneak_info()
{
	if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
	{
		AI_Output(hero,self,"THF_403_LEARNSNEAK_15_01");	//Zeig mir, wie ich mich lautlos bewegen kann.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_02");	//Das wichtigste ist, sein Körpergewicht optimal zu verteilen.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_03");	//Dann hast du den Boden besser im Blick und deinen Körper besser unter Kontrolle.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_04");	//Wenn du schleichst hört dich zwar niemand, aber du bist nicht unsichtbar. Paß auf, daß dich keiner beobachtet.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_05");	//Wenn jemand dich herumschleichen sieht, wird er dich im Auge behalten!
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_06");	//Ich hab 'ne kleine Aufgabe für dich.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_07");	//Im Haus der Erzbarone, im Obergeschoß gibt es einen Schlafraum. Dort liegt irgendwo ein Schlüssel. Den brauche ich.
		AI_Output(hero,self,"THF_403_LEARNSNEAK_15_08");	//Klingt einfach.
		AI_Output(self,hero,"THF_403_LEARNSNEAK_11_09");	//Ist es auch! Osbert bewacht zwar den Raum, aber du weisst ja jetzt, wie du unbemerkt an ihm vorbeikommst.
		Log_CreateTopic(CH1_TRAINSNEAK,LOG_MISSION);
		Log_SetTopicStatus(CH1_TRAINSNEAK,LOG_RUNNING);
		B_LogEntry(CH1_TRAINSNEAK,"Gerion will einen Schlüssel aus dem Obergeschoß des Erzbaronhauses haben. Ich muß mich an Osbert vorbeischleichen, der den Raum bewacht.");
		thf_403_gerion_learnsneak.permanent = FALSE;
		LEARNSNEAK = LOG_RUNNING;
		Mob_CreateItems("OCC_GOMEZROOM_THRONE_01",itke_jail,1);
		Mob_CreateItems("OCC_GOMEZROOM_THRONE_01",itmi_silver,10);
		AI_StopProcessInfos(self);
	};
};


instance THF_403_GERION_KEYRUNNING(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_keyrunning_condition;
	information = thf_403_gerion_keyrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int thf_403_gerion_keyrunning_condition()
{
	if((Npc_HasItems(hero,itke_jail) == 0) && (LEARNSNEAK == LOG_RUNNING) && !Npc_KnowsInfo(hero,mil_123_osbert_thief) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void thf_403_gerion_keyrunning_info()
{
	AI_Output(self,hero,"THF_403_KEYRUNNING_11_01");	//Hast du den Schlüssel schon?
	AI_Output(self,hero,"THF_403_KEYRUNNING_11_02");	//Wenn du an Osbert vorbeischleichst, sollte das kein Problem sein.
};


instance THF_403_GERION_GOTKEY(C_Info)
{
	npc = thf_403_gerion;
	nr = 24;
	condition = thf_403_gerion_gotkey_condition;
	information = thf_403_gerion_gotkey_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Schlüssel";
};


func int thf_403_gerion_gotkey_condition()
{
	if((Npc_HasItems(hero,itke_jail) >= 1) && (LEARNSNEAK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_403_gerion_gotkey_info()
{
	AI_Output(hero,self,"THF_403_GOTKEY_15_01");	//Ich habe den Schlüssel.
	B_GiveInvItems(hero,self,itke_jail,1);
	AI_Output(self,hero,"THF_403_GOTKEY_11_02");	//Gute Arbeit! Vielleicht wird aus dir noch ein richtig guter Dieb.
	AI_Output(self,hero,"THF_403_GOTKEY_11_03");	//Ich kann dir noch etwas über TASCHENDIEBSTAHL und SCHLÖSSER KNACKEN beibringen.
	LEARNSNEAK = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINSNEAK,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINSNEAK,"Ich habe Gerion den Schlüssel besorgt. Jetzt ist er bereit mir Grundkenntnisse in TASCHENDIEBSTAHL und SCHLÖSSER KNACKEN beizubringen.");
};


instance THF_403_GERION_SNEAKFAILED(C_Info)
{
	npc = thf_403_gerion;
	nr = 45;
	condition = thf_403_gerion_sneakfailed_condition;
	information = thf_403_gerion_sneakfailed_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wegen dem Schlüssel...";
};


func int thf_403_gerion_sneakfailed_condition()
{
	if((LEARNSNEAK == LOG_RUNNING) && Npc_KnowsInfo(hero,mil_123_osbert_thief) && !Npc_HasItems(hero,itke_jail))
	{
		return TRUE;
	};
};

func void thf_403_gerion_sneakfailed_info()
{
	AI_Output(hero,self,"THF_403_SNEAKFAILED_15_01");	//Wegen dem Schlüssel...
	AI_Output(self,hero,"THF_403_SNEAKFAILED_11_02");	//Hast du ihn?
	AI_Output(hero,self,"THF_403_SNEAKFAILED_15_03");	//Osbert hat ihn mir abgenommen.
	AI_Output(self,hero,"THF_403_SNEAKFAILED_11_04");	//Dann sehe ich jetzt drei Möglichkeiten.
	AI_Output(hero,self,"THF_403_SNEAKFAILED_15_05");	//Und welche?
	AI_Output(self,hero,"THF_403_SNEAKFAILED_11_06");	//Wir könnten die ganze Sache einfach vergessen und Du schminkst dir ab, weitere Diebestalente zu lernen.
	AI_Output(self,hero,"THF_403_SNEAKFAILED_11_07");	//Du könntest Osbert auch niederschlagen und ihm den Schlüssel abnehmen. Das dürfte aber sehr schwierig werden!
	AI_Output(hero,self,"THF_403_SNEAKFAILED_15_08");	//...oder?
	AI_Output(self,hero,"THF_403_SNEAKFAILED_11_09");	//Oder ich zeige dir den TASCHENDIEBSTAHL und du nimmst ihm den Schlüssel heimlich ab!
	Info_AddChoice(thf_403_gerion_sneakfailed,"Zeige mir den Taschendiebstahl",thf_403_gerion_sneakfailed_pickpock);
	Info_AddChoice(thf_403_gerion_sneakfailed,"Ich werde Osbert niederschlagen",thf_403_gerion_sneakfailed_fight);
	Info_AddChoice(thf_403_gerion_sneakfailed,"Gut, vergessen wir die Sache",thf_403_gerion_sneakfailed_neverthf);
};

func void thf_403_gerion_sneakfailed_neverthf()
{
	AI_Output(hero,self,"THF_403_SNEAKFAILED_NEVERTHF_15_01");	//Gut, vergessen wir die Sache.
	AI_Output(self,hero,"THF_403_SNEAKFAILED_NEVERTHF_11_02");	//Als Dieb taugst du wirklich nicht viel! Besser du lernst etwas anderes.
	LEARNSNEAK = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
	Log_SetTopicStatus(CH1_TRAINSNEAK,LOG_OBSOLETE);
	B_LogEntry(CH1_TRAINSNEAK,"Nachdem ich schon bei meiner ersten Aufgabe als Dieb gescheitert bin, ist es wohl besser, keine weitere Zeit und Mühe in die Diebeskunst zu investieren.");
};

func void thf_403_gerion_sneakfailed_fight()
{
	AI_Output(hero,self,"THF_403_SNEAKFAILED_FIGHT_15_01");	//Ich werde Osbert niederschlagen
	AI_Output(self,hero,"THF_403_SNEAKFAILED_FIGHT_11_02");	//Oder er Dich! Viel Glück! Wenn du es dir anders überlegst, sag mir Bescheid.
	LEARNSNEAK = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void thf_403_gerion_sneakfailed_pickpock()
{
	AI_Output(hero,self,"THF_403_SNEAKFAILED_PICKPOCK_15_01");	//Zeig mir den Taschendiebstahl.
	AI_Output(self,hero,"THF_403_SNEAKFAILED_PICKPOCK_11_02");	//Das ist die Antwort eines Diebes! Wir können sofort anfangen, wenn du bereit bist.
	Info_ClearChoices(thf_403_gerion_sneakfailed);
	LEARNSNEAK = LOG_FAILED;
};

func void thf_403_buyswarez()
{
	if(!GERION_DEALER)
	{
		AI_Output(self,hero,"THF_403_BUYSWAREZ_1_11_01");	//Ach... und nochwas!
		AI_Output(hero,self,"THF_403_BUYSWAREZ_1_15_02");	//Was?
		AI_Output(self,hero,"THF_403_BUYSWAREZ_1_11_03");	//Wenn du jemanden suchst, der dir organisierte Waren abnimmt... sprich mich an!
		AI_Output(hero,self,"THF_403_BUYSWAREZ_1_15_04");	//Werde es im Hinterkopf behalten.
		GERION_DEALER = TRUE;
		b_give_gerion_chapteritems(chapter);
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Gerion kauft HEHLERWARE aller Art ab. Er treibt sich am hinteren Tor herum.");
	};
};


instance THF_403_GERION_PICKPOCKET_1(C_Info)
{
	npc = thf_403_gerion;
	nr = 33;
	condition = thf_403_gerion_pickpocket_1_condition;
	information = thf_403_gerion_pickpocket_1_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0);
};


func int thf_403_gerion_pickpocket_1_condition()
{
	if(((LEARNSNEAK == LOG_FAILED) || (LEARNSNEAK == LOG_SUCCESS)) && (Npc_GetTalentSkill(self,NPC_TALENT_PICKPOCKET) == 0))
	{
		return TRUE;
	};
};

func void thf_403_gerion_pickpocket_1_info()
{
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
	{
		AI_Output(hero,self,"THF_403_PICKPOCKET_1_15_01");	//Zeig mir den Taschendiebstahl.
		AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_02");	//Die hohe Kunst der Diebe! Es ist viel riskanter einen Menschen zu bestehlen, als eine Truhe zu knacken.
		AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_03");	//Du musst dich anschleichen, damit dein Opfer dich nicht bemerkt.
		AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_04");	//Und paß auf, daß dich niemand beobachtet! Such dir jemanden aus, der alleine ist oder schläft.
		thf_403_gerion_pickpocket_1.permanent = FALSE;
		if(Npc_KnowsInfo(hero,thf_403_gerion_sneakfailed) && (LEARNSNEAK == LOG_FAILED) && !Npc_HasItems(hero,itke_jail))
		{
			AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_05");	//jetzt kannst du ja versuchen, Osbert den Schlüssel aus der Tasche zu nehmen.
			AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_06");	//Es wäre schlau es bei dem Schlüssel zu belassen. Je mehr du ihm wegnimmst, desto größer ist die Wahrscheinlichkeit, daß er dich erwischt!
			B_LogEntry(CH1_TRAINSNEAK,"Gerion hat mir das Talent des Taschendiebstahls gezeigt. Jetzt kann ich Osbert den Schlüssel unbemerkt abnehmen");
		};
		if(LEARNSNEAK == LOG_SUCCESS)
		{
			AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_07");	//Wenn du dir noch was verdienen willst, hätte ich noch was zu tun für dich.
			AI_Output(hero,self,"THF_403_PICKPOCKET_1_15_08");	//Lass hören.
			AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_09");	//Wylfern, ein Rekrut der Miliz, besitzt einen Ring. Der ist mir 250 Silberstücke wert.
			AI_Output(self,hero,"THF_403_PICKPOCKET_1_11_10");	//Du solltest es versuchen, wenn Wylfern alleine ist!
			LEARNPICKPOCKET_1 = LOG_RUNNING;
			Log_CreateTopic(CH1_TRAINPICKPOCKET_1,LOG_MISSION);
			Log_SetTopicStatus(CH1_TRAINPICKPOCKET_1,LOG_RUNNING);
			B_LogEntry(CH1_TRAINPICKPOCKET_1,"Wylfern, Rekrut der Miliz, besitzt einen Ring. Gerion würde mir 250 Silberstücke daür geben.");
		};
		thf_403_buyswarez();
	};
};


instance THF_403_GERION_SECONDCHANCE(C_Info)
{
	npc = thf_403_gerion;
	nr = 45;
	condition = thf_403_gerion_secondchance_condition;
	information = thf_403_gerion_secondchance_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Schlüssel!";
};


func int thf_403_gerion_secondchance_condition()
{
	if((Npc_GetTalentSkill(self,NPC_TALENT_PICKPOCKET) == 1) && (LEARNSNEAK == LOG_FAILED) && Npc_HasItems(hero,itke_jail))
	{
		return TRUE;
	};
};

func void thf_403_gerion_secondchance_info()
{
	AI_Output(hero,self,"THF_403_SECONDCHANCE_15_01");	//Ich habe den Schlüssel!
	B_GiveInvItems(hero,self,itke_jail,1);
	AI_Output(self,hero,"THF_403_SECONDCHANCE_11_02");	//Na also. Du bist ja doch zu gebrauchen. Wenn du noch SCHLÖSSER KNACKEN lernen willst, bin ich dein Mann.
	LEARNSNEAK = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINSNEAK,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINSNEAK,"Ich habe Osbert den Schlüssel unbemerkt abgenommen. Gerion ist nun auch bereit mir Grundkenntnisse über SCHLÖSSER KNACKEN beizubringen");
};


instance THF_403_GERION_OSBERTDOWN(C_Info)
{
	npc = thf_403_gerion;
	nr = 13;
	condition = thf_403_gerion_osbertdown_condition;
	information = thf_403_gerion_osbertdown_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe Osbert niedergeschlagen. Hier ist der Schlüssel.";
};


func int thf_403_gerion_osbertdown_condition()
{
	var C_Npc osbert;
	osbert = Hlp_GetNpc(mil_123_osbert);
	if(osbert.aivar[12])
	{
		return TRUE;
	};
};

func void thf_403_gerion_osbertdown_info()
{
	AI_Output(hero,self,"THF_403_OSBERTDOWN_15_01");	//Ich habe Osbert niedergeschlagen.
	B_GiveInvItems(hero,self,itke_jail,1);
	AI_Output(self,hero,"THF_403_OSBERTDOWN_11_02");	//Tatsächlich? Dir scheint ja der direkte Weg besser zu liegen als der elegante.
	AI_Output(self,hero,"THF_403_OSBERTDOWN_11_03");	//Ich löse Probleme auf andere Art. Mit dem Kopf, nicht mit der Waffe.
	AI_Output(self,hero,"THF_403_OSBERTDOWN_11_04");	//Zu einem guten Dieb gehört mehr, als nur das Aneignen von Besitz.
	LEARNSNEAK = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINSNEAK,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINSNEAK,"Ich habe Osbert niedergeschlagen und Gerion den Schlüssel gebracht. Das war zwar nicht ganz im Sinn der Aufgabe, aber er wird mich weiterhin unterrichten");
};


instance THF_403_GERION_LOCKPICK_1(C_Info)
{
	npc = thf_403_gerion;
	nr = 7;
	condition = thf_403_gerion_lockpick_1_condition;
	information = thf_403_gerion_lockpick_1_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0);
};


func int thf_403_gerion_lockpick_1_condition()
{
	if((LEARNSNEAK == LOG_SUCCESS) && (Npc_GetTalentSkill(self,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void thf_403_gerion_lockpick_1_info()
{
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(hero,self,"THF_403_LOCKPICK_1_15_01");	//Zeige mir, wie ich Schlösser öffnen kann.
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_02");	//Du brauchst auf jeden Fall Dietriche dazu.
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_03");	//Wenn du vorsichtig bist, wirst du weniger davon verbrauchen.
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_04");	//Bewege den Dietrich nach links oder rechts bis das Schloß aufgeht.
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_05");	//Bevor ich dir mehr beibringe, habe ich eine Aufgabe für dich.
		AI_Output(hero,self,"THF_403_LOCKPICK_1_15_06");	//Wer hätte das gedacht?
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_07");	//Ich brauche 20 Stengel Sumpfkraut. Einer der Bettler, Lakarus, handelt damit. Er hat einen Vorrat in seiner Hütte.
		AI_Output(self,other,"THF_403_LOCKPICK_1_11_08");	//Warte auf einen günstigen Augenblick und besorge dir das Kraut.
		Log_CreateTopic(CH1_TRAINLOCKPICK_1,LOG_MISSION);
		Log_SetTopicStatus(CH1_TRAINLOCKPICK_1,LOG_RUNNING);
		B_LogEntry(CH1_TRAINLOCKPICK_1,"Lakarus der Bettler verwahrt seinen Sumpfkrautvorrat in seiner Hütte. Gerion braucht 20 Stengel.");
		LEARNPICKLOCK_1 = LOG_RUNNING;
		thf_403_gerion_lockpick_1.permanent = FALSE;
	};
};


instance THF_403_GERION_WHEREHUT(C_Info)
{
	npc = thf_403_gerion;
	nr = 44;
	condition = thf_403_gerion_wherehut_condition;
	information = thf_403_gerion_wherehut_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo hat Lakarus seine Hütte?";
};


func int thf_403_gerion_wherehut_condition()
{
	if(Npc_KnowsInfo(hero,thf_403_gerion_lockpick_1))
	{
		return TRUE;
	};
};

func void thf_403_gerion_wherehut_info()
{
	AI_Output(hero,self,"THF_403_WHEREHUT_15_01");	//Wo hat Lakarus seine Hütte?
	AI_Output(self,hero,"THF_403_WHEREHUT_11_02");	//Oberhalb der Arena. Er sitzt die meiste Zeit davor...
	B_LogEntry(CH1_TRAINLOCKPICK_1,"Die Hütte von Lakarus steht oberhalb der Arena.");
};


instance THF_403_GERION_HERB(C_Info)
{
	npc = thf_403_gerion;
	nr = 13;
	condition = thf_403_gerion_herb_condition;
	information = thf_403_gerion_herb_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was willst du mit dem Sumpfkraut?";
};


func int thf_403_gerion_herb_condition()
{
	if(LEARNPICKLOCK_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void thf_403_gerion_herb_info()
{
	AI_Output(hero,self,"THF_403_HERB_15_01");	//Was willst du mit dem Sumpfkraut?
	AI_Output(self,hero,"THF_403_HERB_11_02");	//Das sage ich dir, wenn du mir das Kraut gebracht hast.
};


instance THF_403_GERION_LOCKPICKER(C_Info)
{
	npc = thf_403_gerion;
	nr = 14;
	condition = thf_403_gerion_lockpicker_condition;
	information = thf_403_gerion_lockpicker_info;
	important = FALSE;
	permanent = FALSE;
	description = "Woher bekomme ich Dietriche?";
};


func int thf_403_gerion_lockpicker_condition()
{
	if(LEARNPICKLOCK_1 == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void thf_403_gerion_lockpicker_info()
{
	AI_Output(hero,self,"THF_403_LOCKPICKER_15_01");	//Woher bekomme ich Dietriche?
	AI_Output(self,hero,"THF_403_LOCKPICKER_11_02");	//Die sind sehr schwer zu kriegen.
	AI_Output(self,hero,"THF_403_LOCKPICKER_11_03");	//Ich gebe dir zwei Stück. Alle weiteren musst du dir selber besorgen.
	B_GiveInvItems(self,hero,itke_lockpick,2);
	AI_Output(self,hero,"THF_403_LOCKPICKER_11_04");	//Ich kann dir natürlich auch noch weitere Dietriche geben, aber das kostet dich dann eine Kleinigkeit.
	AI_Output(hero,self,"THF_403_LOCKPICKER_15_05");	//Verstehe!
	thf_403_buyswarez();
};


instance THF_403_GERION_GOTHERB(C_Info)
{
	npc = thf_403_gerion;
	nr = 3;
	condition = thf_403_gerion_gotherb_condition;
	information = thf_403_gerion_gotherb_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe das Sumpfkraut!";
};


func int thf_403_gerion_gotherb_condition()
{
	if((Npc_HasItems(hero,itpl_swampweed) >= 20) && (LEARNPICKLOCK_1 == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_403_gerion_gotherb_info()
{
	AI_Output(hero,self,"THF_403_GOTHERB_15_01");	//Ich habe das Sumpfkraut!
	AI_Output(self,hero,"THF_403_GOTHERB_11_02");	//Gut gemacht! Bring es zu Isgar, dem Heiler.
	AI_Output(self,hero,"THF_403_GOTHERB_11_03");	//Sag ihm du willst den Wein abholen. Diesen Wein bringst du mir. Verstanden?
	AI_Output(hero,self,"THF_403_GOTHERB_15_04");	//Klar. Was ist das besondere an dem Wein?
	AI_Output(self,hero,"THF_403_GOTHERB_11_05");	//Es ist eine spezielle Mischung mit einer...einschläfernden Wirkung...
	B_LogEntry(CH1_TRAINLOCKPICK_1,"Gerion will das ich das Sumpfkraut bei dem Heiler Isgar gegen einen 'Schlafwein' tausche.");
};


instance THF_403_GERION_SLEEPWINE(C_Info)
{
	npc = thf_403_gerion;
	nr = 12;
	condition = thf_403_gerion_sleepwine_condition;
	information = thf_403_gerion_sleepwine_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Wein";
};


func int thf_403_gerion_sleepwine_condition()
{
	if((Npc_HasItems(hero,itfo_sleepwine) == 1) && (LEARNPICKLOCK_1 == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_403_gerion_sleepwine_info()
{
	AI_Output(hero,self,"THF_403_SLEEPWINE_15_01");	//Ich habe den Wein.
	AI_Output(self,hero,"THF_403_SLEEPWINE_11_02");	//Ausgezeichnet. Der wird uns später noch nützlich sein.
	LEARNPICKLOCK_1 = LOG_SUCCESS;
	B_GiveXP(XP_LEARNPICKLOCK);
	Log_SetTopicStatus(CH1_TRAINLOCKPICK_1,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINLOCKPICK_1,"Gerion hat den 'Schlafwein' bekommen.");
};


instance THF_403_GERION_GOTRING(C_Info)
{
	npc = thf_403_gerion;
	nr = 3;
	condition = thf_403_gerion_gotring_condition;
	information = thf_403_gerion_gotring_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Ring";
};


func int thf_403_gerion_gotring_condition()
{
	if((Npc_HasItems(hero,itpl_swampweed) == 1) && (LEARNPICKPOCKET_1 == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_403_gerion_gotring_info()
{
	AI_Output(hero,self,"THF_403_GOTRING_15_01");	//Ich habe den Ring.
	B_GiveInvItems(hero,self,itri_fire_01,1);
	AI_Output(self,hero,"THF_403_GOTRING_11_02");	//Und ich habe hier 250 Silberstücke für dich!
	B_GiveInvItems(self,hero,itmi_silver,250);
	LEARNPICKPOCKET_1 = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_TRAINPICKPOCKET_1,LOG_SUCCESS);
	B_LogEntry(CH1_TRAINPICKPOCKET_1,"Gerion hat den Ring und ich bin um einige Silberstücke reicher");
};


instance THF_403_GERION_ALLIKNOW(C_Info)
{
	npc = thf_403_gerion;
	nr = 22;
	condition = thf_403_gerion_alliknow_condition;
	information = thf_403_gerion_alliknow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich möchte meine Diebeskünste verbessern!";
};


func int thf_403_gerion_alliknow_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) >= 1) && (LEARNPICKPOCKET_1 != LOG_RUNNING) && (LEARNPICKLOCK_1 != LOG_RUNNING) && (LEARNSNEAK != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void thf_403_gerion_alliknow_info()
{
	AI_Output(hero,self,"THF_403_ALLIKNOW_15_01");	//Ich möchte meine Diebeskünste verbessern!
	AI_Output(self,hero,"THF_403_ALLIKNOW_11_02");	//Ich habe dir alles beigebracht, was sich weiß.
	AI_Output(self,hero,"THF_403_ALLIKNOW_11_03");	//Wenn du mehr lernen willst, musst du dir einen anderen Lehrer suchen.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Gerion hat kann mir alles beigebracht, was er über die Diebeskünste weiss. Wenn ich noch mehr lernen will, muss ich mir einen anderen Lehrer suchen.");
};


instance THF_403_GERION_TRADE(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_trade_condition;
	information = thf_403_gerion_trade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich hab' da ein paar Dinge...";
};


func int thf_403_gerion_trade_condition()
{
	if(GERION_DEALER && (Npc_GetDistToWP(self,GERION_WP) > 300))
	{
		return TRUE;
	};
};

func void thf_403_gerion_trade_info()
{
	AI_Output(hero,self,"THF_403_TRADE_15_01");	//Ich hab' da ein paar Dinge...
	AI_Output(self,hero,"THF_403_TRADE_11_02");	//OK, aber nicht hier.
	AI_Output(self,hero,"THF_403_TRADE_11_03");	//Komm mit.
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,30,GERION_WP);
	TA_EndOverlay(self);
};


instance THF_403_GERION_TRADENOW(C_Info)
{
	npc = thf_403_gerion;
	condition = thf_403_gerion_tradenow_condition;
	information = thf_403_gerion_tradenow_info;
	important = FALSE;
	permanent = TRUE;
	trade = TRUE;
	description = "Nun lass uns zum Geschäft kommen!";
};


func int thf_403_gerion_tradenow_condition()
{
	if(GERION_DEALER && (Npc_GetDistToWP(self,GERION_WP) <= 300))
	{
		return TRUE;
	};
};

func void thf_403_gerion_tradenow_info()
{
	AI_Output(hero,self,"THF_403_TRADENOW_15_01");	//Nun lass uns zum Geschäft kommen!
	AI_Output(self,hero,"THF_403_TRADENOW_11_02");	//Nichts lieber als das (hehe)
};

