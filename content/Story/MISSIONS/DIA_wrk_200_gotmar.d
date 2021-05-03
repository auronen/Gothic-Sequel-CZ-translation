
instance INFO_GOTMAR_EXIT(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 999;
	condition = info_gotmar_exit_condition;
	information = info_gotmar_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_gotmar_exit_condition()
{
	return TRUE;
};

func void info_gotmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GOTMAR_GREETINGS(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_greetings_condition;
	information = info_gotmar_greetings_info;
	important = TRUE;
	permanent = FALSE;
};


func int info_gotmar_greetings_condition()
{
	if(((Npc_GetDistToNpc(self,hero) < 300) || c_npcisinvincible(hero)) && (Npc_IsInRoutine(self,ZS_Smith_Fire) || Npc_IsInRoutine(self,ZS_Smith_Anvil) || Npc_IsInRoutine(self,ZS_Smith_Cool) || Npc_IsInRoutine(self,ZS_Smith_Sharp)))
	{
		return TRUE;
	};
};

func void info_gotmar_greetings_info()
{
	AI_Output(self,hero,"Info_Gotmar_GREETINGS_04_01");	//Steh nicht im Weg rum, Mann! Hier wird gearbeitet!
	AI_StopProcessInfos(self);
};


instance INFO_GOTMAR_TIRESOME(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_tiresome_condition;
	information = info_gotmar_tiresome_info;
	important = FALSE;
	permanent = FALSE;
	description = "Sieht sehr anstrengend aus, deine Arbeit!";
};


func int info_gotmar_tiresome_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_greetings))
	{
		return TRUE;
	};
};

func void info_gotmar_tiresome_info()
{
	AI_Output(hero,self,"Info_Gotmar_TIRESOME_15_01");	//Sieht anstrengend aus, deine Arbeit!
	AI_Output(self,hero,"Info_Gotmar_TIRESOME_04_02");	//Und es ist ehrliche Arbeit! Das kann nicht jeder hier von seinem Beruf behaupten.
	AI_Output(hero,self,"Info_Gotmar_TIRESOME_15_03");	//Wie meinst du das?
	AI_Output(self,hero,"Info_Gotmar_TIRESOME_04_04");	//Schau dich mal um. Schmarotzer, Bettler, Diebe... Nicht jeder hier verdient sich sein Brot auf ehrliche Weise!
	AI_Output(self,hero,"Info_Gotmar_TIRESOME_04_05");	//Wenn wir Handwerker nicht wären, wäre das Lager noch ein riesiger Schutthaufen!
};


instance INFO_GOTMAR_DEBRIS(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_debris_condition;
	information = info_gotmar_debris_info;
	important = FALSE;
	permanent = FALSE;
	description = "Das Lager war zerstört?";
};


func int info_gotmar_debris_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_tiresome))
	{
		return TRUE;
	};
};

func void info_gotmar_debris_info()
{
	AI_Output(hero,self,"Info_Gotmar_DEBRIS_15_01");	//Das Lager war zerstört?
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_04_02");	//Ja Mann! Bei der Zerstörung der Barriere ist hier einiges zu Bruch gegangen!
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_04_03");	//Vorher soll es hier anders ausgesehen haben, sagt Diego.
	Info_ClearChoices(info_gotmar_debris);
	Info_AddChoice(info_gotmar_debris,"Kann schon sein!",info_gotmar_debris_maybe);
	Info_AddChoice(info_gotmar_debris,"Es sah... ANDERS aus!",info_gotmar_debris_indeed);
};

func void info_gotmar_debris_maybe()
{
	AI_Output(hero,self,"Info_Gotmar_DEBRIS_MAYBE_15_01");	//Kann schon sein!
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_MAYBE_04_02");	//Naja, genau wissen das nur ehemalige Gefangene, wie Diego.
	Info_ClearChoices(info_gotmar_debris);
};

func void info_gotmar_debris_indeed()
{
	AI_Output(hero,self,"Info_Gotmar_DEBRIS_INDEED_15_01");	//Es sah...
	AI_PlayAni(hero,"T_SEARCH");
	AI_Output(hero,self,"Info_Gotmar_DEBRIS_INDEED_15_02");	//...ANDERS aus!
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_INDEED_04_03");	//Woher willst DU das denn wissen?
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_INDEED_04_04");	//Vor der Zerstörung war dieses Gebiet ein riesiges Gefängnis!
	AI_Output(hero,self,"Info_Gotmar_DEBRIS_INDEED_15_05");	//Ich war einer der Gefangenen und kenne Diego noch aus dieser Zeit!
	AI_Output(self,hero,"Info_Gotmar_DEBRIS_INDEED_04_06");	//(misstrauisch) Was du nicht sagst...
	Info_ClearChoices(info_gotmar_debris);
};


instance INFO_GOTMAR_SELL(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_sell_condition;
	information = info_gotmar_sell_info;
	important = FALSE;
	permanent = FALSE;
	description = "Verkaufst du Waffen?";
};


func int info_gotmar_sell_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_tiresome))
	{
		return TRUE;
	};
};

func void info_gotmar_sell_info()
{
	AI_Output(hero,self,"Info_Gotmar_SELL_15_01");	//Verkaufst du Waffen?
	AI_Output(self,hero,"Info_Gotmar_SELL_04_02");	//Nicht an dich. Ich liefere ausschliesslich an die Miliz.
	AI_Output(self,hero,"Info_Gotmar_SELL_04_03");	//Wenn du Waffen haben willst, mußt du lernen sie selbst zu schmieden.
	AI_Output(self,hero,"Info_Gotmar_SELL_04_04");	//Wenn der Preis stimmt, dann kannst du ein paar Dinge von mir haben, die man fürs Schmieden braucht.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Gotmar der Schmied verkauft allerlei SCHMIEDEZUBEHÖR. Er hat seine Schmiede direkt neben dem Haupttor.");
};


instance INFO_GOTMAR_TRADE(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 10;
	condition = info_gotmar_trade_condition;
	information = info_gotmar_trade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Zeig mir deine Waren";
	trade = TRUE;
};


func int info_gotmar_trade_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_sell))
	{
		return TRUE;
	};
};

func void info_gotmar_trade_info()
{
	AI_Output(hero,self,"Info_Gotmar_TRADE_15_01");	//Zeig mir deine Waren!
	AI_Output(self,hero,"Info_Gotmar_TRADE_04_02");	//Was soll's denn sein?
};


instance INFO_GOTMAR_LEARNSMITH(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_learnsmith_condition;
	information = info_gotmar_learnsmith_info;
	important = FALSE;
	permanent = FALSE;
	description = "Zeig mir, wie man Waffen schmiedet.";
};


func int info_gotmar_learnsmith_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_sell))
	{
		return TRUE;
	};
};

func void info_gotmar_learnsmith_info()
{
	AI_Output(hero,self,"Info_Gotmar_LEARNSMITH_15_01");	//Zeig mir, wie man Waffen schmiedet.
	AI_Output(self,hero,"Info_Gotmar_LEARNSMITH_04_02");	//Mann, ich muß hier auch noch meine Arbeit machen!
	AI_Output(self,hero,"Info_Gotmar_LEARNSMITH_04_03");	//Aber wenn Du mir einen Gefallen tust, werde ich mir die Zeit nehmen!
};


instance INFO_GOTMAR_DOFAVOR(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_dofavor_condition;
	information = info_gotmar_dofavor_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was für ein Gefallen?";
};


func int info_gotmar_dofavor_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_learnsmith))
	{
		return TRUE;
	};
};

func void info_gotmar_dofavor_info()
{
	AI_Output(hero,self,"Info_Gotmar_DOFAVOR_15_01");	//Was für ein Gefallen?
	AI_Output(self,hero,"Info_Gotmar_DOFAVOR_04_02");	//Ich muß noch einige Waffen schmieden, aber mein Erz ist knapp geworden.
	AI_Output(self,hero,"Info_Gotmar_DOFAVOR_04_03");	//Wenn du mir 40 Brocken Erz besorgst, zeige ich dir wie man Waffen schmiedet.
	Log_CreateTopic(CH1_LEARNSMITH,LOG_MISSION);
	Log_SetTopicStatus(CH1_LEARNSMITH,LOG_RUNNING);
	B_LogEntry(CH1_LEARNSMITH,"Gotmar, ist bereit mir das Waffenschmieden beizubringen, falls ich ihm 40 Brocken Erz besorge.");
};


instance INFO_GOTMAR_WHEREORE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_whereore_condition;
	information = info_gotmar_whereore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Woher bekomme ich Erz?";
};


func int info_gotmar_whereore_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_dofavor) || Npc_KnowsInfo(hero,info_gotmar_afterbellow))
	{
		return TRUE;
	};
};

func void info_gotmar_whereore_info()
{
	AI_Output(hero,self,"Info_Gotmar_WHEREORE_15_01");	//Woher bekomme ich Erz?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE_04_02");	//Du kannst das Erz zurückholen, das mir abhanden gekommen ist.
	AI_Output(hero,self,"Info_Gotmar_WHEREORE_15_03");	//Wie meinst du das?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE_04_04");	//Habe ich schon erwähnt, dass wir von Dieben und Schmarotzer umgeben sind? Wahrscheinlich hat dieser Gauner Edo sich an meinem Erz bedient.
	AI_Output(hero,self,"Info_Gotmar_WHEREORE_15_05");	//Wo finde ich diesen Edo?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE_04_06");	//Er hängt meistens am Marktplatz herum.
	B_LogEntry(CH1_LEARNSMITH,"Ein Mann namens Edo soll seine Kisten mit geklautem Erz gefüllt haben. Er ist am Marktplatz zu finden.");
};


instance INFO_GOTMAR_WHEREORE2(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_whereore2_condition;
	information = info_gotmar_whereore2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie kann ich sonst noch an Erz kommen?";
};


func int info_gotmar_whereore2_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_whereore))
	{
		return TRUE;
	};
};

func void info_gotmar_whereore2_info()
{
	AI_Output(hero,self,"Info_Gotmar_WHEREORE2_15_01");	//Wie kann ich sonst noch an Erz kommen?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE2_04_02");	//Normalerweise in der Mine.
	AI_Output(hero,self,"Info_Gotmar_WHEREORE2_15_03");	//Mine? Welche Mine?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE2_04_04");	//Diego sagt, dass diese Mine zur Zeit der magischen Barriere verlassen und gesperrt war.
	AI_Output(self,hero,"Info_Gotmar_WHEREORE2_04_05");	//Dort wurden neue Erzadern gefunden. Aber seit ein paar Tagen treiben sich Orks dort herum und die Bergleute haben sich in der Mine verschanzt.
	AI_Output(self,hero,"Info_Gotmar_WHEREORE2_04_06");	//Die werden zur Zeit niemand in die Mine lassen!
};


instance INFO_GOTMAR_WHEREORE3(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_whereore3_condition;
	information = info_gotmar_whereore3_info;
	important = FALSE;
	permanent = FALSE;
	description = "Gibt's sonst keine Möglichkeit an Erz zu kommen?";
};


func int info_gotmar_whereore3_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_whereore2))
	{
		return TRUE;
	};
};

func void info_gotmar_whereore3_info()
{
	AI_Output(hero,self,"Info_Gotmar_WHEREORE3_15_01");	//Gibt's sonst keine Möglichkeit an Erz zu kommen?
	AI_Output(self,hero,"Info_Gotmar_WHEREORE3_04_02");	//Da wäre noch eine....
	AI_Output(hero,self,"Info_Gotmar_WHEREORE3_15_03");	//WELCHE??
	AI_Output(self,hero,"Info_Gotmar_WHEREORE3_04_04");	//Kleinere Erzadern findet man auch in manchen Höhlen. In der Nähe des Haupttores gibt es eine.
	AI_Output(self,hero,"Info_Gotmar_WHEREORE3_04_05");	//Es ist leider ne Molerat-Höhle, sonst hätte ich mir das Erz schon selbst geholt.
	AI_Output(self,hero,"Info_Gotmar_WHEREORE3_04_06");	//Aber vielleicht kannst du die Viecher ja vertreiben.
	B_LogEntry(CH1_LEARNSMITH,"Es soll eine kleine Erzader in einer Molerat-Höhle in der Nähe des Lager-Haupttores geben.");
};


instance INFO_GOTMAR_PICK(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_pick_condition;
	information = info_gotmar_pick_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich werde mir diese Höhle mal anschauen!";
};


func int info_gotmar_pick_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_whereore3))
	{
		return TRUE;
	};
};

func void info_gotmar_pick_info()
{
	AI_Output(hero,self,"Info_Gotmar_PICK_15_01");	//Ich werde mir die Höhle mal anschauen!
	AI_Output(self,hero,"Info_Gotmar_PICK_04_02");	//Mann, das ist gut! Vergiss nicht, eine Spitzhacke mitzunehmen.
};


instance INFO_GOTMAR_PICK2(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_pick2_condition;
	information = info_gotmar_pick2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir ne Spitzhacke geben?";
};


func int info_gotmar_pick2_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_pick))
	{
		return TRUE;
	};
};

func void info_gotmar_pick2_info()
{
	AI_Output(hero,self,"Info_Gotmar_PICK2_15_01");	//Kannst du mir ne Spitzhacke geben?
	AI_Output(self,hero,"Info_Gotmar_PICK2_04_02");	//Ich bin Schmied und kein Erzschürfer.
	AI_Output(self,hero,"Info_Gotmar_PICK2_04_03");	//Frag die Schürfer am Arenaplatz.
	AI_Output(self,hero,"Info_Gotmar_PICK2_04_04");	//Ich könnte mir vorstellen, daß Sylvester seine Hacke verkauft.
	B_LogEntry(CH1_LEARNSMITH,"Für's Erzhacken brauche ich eine Spitzhacke. Der Schürfer Sylvester am Arenaplatz soll eine verkaufen.");
};


instance INFO_GOTMAR_TOOFEWORE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_toofewore_condition;
	information = info_gotmar_toofewore_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe hier etwas Erz.";
};


func int info_gotmar_toofewore_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_dofavor) && !Npc_KnowsInfo(hero,info_gotmar_enoughore) && (Npc_HasItems(hero,itmi_orenugget) >= 1) && (Npc_HasItems(hero,itmi_orenugget) < GOTMAR_FAVOR_ORE))
	{
		return TRUE;
	};
};

func void info_gotmar_toofewore_info()
{
	AI_Output(hero,self,"Info_Gotmar_TOOFEWORE_15_01");	//Ich habe hier etwas Erz.
	AI_Output(self,hero,"Info_Gotmar_TOOFEWORE_04_02");	//Das ist zu wenig, Mann! Komm wieder wenn du 40 Brocken hast!
};


instance INFO_GOTMAR_ENOUGHORE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_enoughore_condition;
	information = info_gotmar_enoughore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe deine 40 Brocken Erz, hier nimm!";
};


func int info_gotmar_enoughore_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_dofavor) && (Npc_HasItems(hero,itmi_orenugget) >= GOTMAR_FAVOR_ORE))
	{
		return TRUE;
	};
};

func void info_gotmar_enoughore_info()
{
	AI_Output(hero,self,"Info_Gotmar_ENOUGHORE_15_01");	//Ich habe deine 40 Brocken Erz, hier nimm!
	B_GiveInvItems(hero,self,itmi_orenugget,GOTMAR_FAVOR_ORE);
	AI_Output(self,hero,"Info_Gotmar_ENOUGHORE_04_02");	//Verdammt gut, Mann!
	AI_Output(self,hero,"Info_Gotmar_ENOUGHORE_04_03");	//Du hast mir einiges an Arbeit erspart.
	B_GiveXP(XP_BROUGHTFIRSTORE);
};


instance INFO_GOTMAR_EDO(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 30;
	condition = info_gotmar_edo_condition;
	information = info_gotmar_edo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.";
};


func int info_gotmar_edo_condition()
{
	if(GOTMAR_SCBETRAYED)
	{
		return TRUE;
	};
};

func void info_gotmar_edo_info()
{
	AI_Output(hero,self,"Info_Gotmar_EDO_15_01");	//Edo sagt, du sollst vorsichtiger mit deinen Äußerungen sein.
	AI_Output(self,hero,"Info_Gotmar_EDO_04_02");	//Du Trottel hast ihm gesagt, daß ich ihn für einen Dieb halte?!
	AI_Output(self,hero,"Info_Gotmar_EDO_04_03");	//Kannst wohl garnichts für dich behalten, was? Wir sind geschiedene Leute, Mann!
	GOTMAR_OLDATTITUDE = Npc_GetPermAttitude(self,hero);
	b_setattitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};


instance INFO_GOTMAR_BETRAYED(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_betrayed_condition;
	information = info_gotmar_betrayed_info;
	important = TRUE;
	permanent = TRUE;
};


func int info_gotmar_betrayed_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_edo) && GOTMAR_SCBETRAYED && c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void info_gotmar_betrayed_info()
{
	AI_Output(self,hero,"Info_Gotmar_BETRAYED_04_01");	//Ich will nichts mehr mit dir zu tun haben!
	Info_AddChoice(info_gotmar_betrayed,"Dann eben nicht!",info_gotmar_betrayed_no);
	if(Npc_HasItems(hero,itmi_silver) >= 50)
	{
		Info_AddChoice(info_gotmar_betrayed,"Hey, das mit Edo war wirklich keine Absicht (50 Silber anbieten)",info_gotmar_betrayed_sorry);
	};
};

func void info_gotmar_betrayed_sorry()
{
	Info_ClearChoices(info_gotmar_betrayed);
	AI_Output(hero,self,"Info_Gotmar_BETRAYED_SORRY_15_01");	//Hey, das mit Edo war wirklich keine Absicht
	B_GiveInvItems(hero,self,itmi_silver,50);
	AI_Output(self,hero,"Info_Gotmar_BETRAYED_SORRY_04_02");	//Mann, pass in Zukunft besser auf, was du anderen Leuten über mich erzählst!
	GOTMAR_SCBETRAYED = FALSE;
	b_setattitude(self,GOTMAR_OLDATTITUDE);
	AI_StopProcessInfos(self);
};

func void info_gotmar_betrayed_no()
{
	Info_ClearChoices(info_gotmar_betrayed);
	AI_Output(hero,self,"Info_Gotmar_BETRAYED_NO_15_01");	//Dann eben nicht!
	AI_StopProcessInfos(self);
};


instance INFO_GOTMAR_TEACHBELLOW(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_teachbellow_condition;
	information = info_gotmar_teachbellow_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LEARNSMITH_1,LPCOST_TALENT_SMITH_1,0);
};


func int info_gotmar_teachbellow_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_enoughore) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) < 1))
	{
		return TRUE;
	};
};

func void info_gotmar_teachbellow_info()
{
	if(B_GiveSkill(hero,NPC_TALENT_SMITH,1,LPCOST_TALENT_SMITH_1))
	{
		AI_Output(self,hero,"Info_Gotmar_TEACHBELLOW_04_01");	//Also gut, ich werde dir zeigen wie man schmiedet.
		AI_Output(self,hero,"Info_Gotmar_TEACHBELLOW_04_02");	//Aber zuerst brauchst du einige Werkzeuge. Eine Zange und einen Schmiedehammer.
		AI_Output(hero,self,"Info_Gotmar_TEACHBELLOW_15_03");	//Wo bekomme ich die her?
		AI_Output(self,hero,"Info_Gotmar_TEACHBELLOW_04_04");	//Ich kann die Werkzeuge verkaufen, aber das ist nicht billig.
		GOTMAR_TEACHSMITH = TRUE;
	};
};


instance INFO_GOTMAR_HAMMER(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_hammer_condition;
	information = info_gotmar_hammer_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir die Werkzeuge nicht ausleihen?";
};


func int info_gotmar_hammer_condition()
{
	if(GOTMAR_TEACHSMITH && (!Npc_HasItems(hero,itmi_pliers) || !Npc_HasItems(hero,itmw_sledgehammer)))
	{
		return TRUE;
	};
};

func void info_gotmar_hammer_info()
{
	AI_Output(hero,self,"Info_Gotmar_HAMMER_15_01");	//Kannst du mir die Werkzeuge nicht ausleihen?
	AI_Output(self,hero,"Info_Gotmar_HAMMER_04_02");	//Mann, du bist gut. In einem Lager voller Diebe und Betrüger verleihe ich mit Sicherheit nichts.
	AI_Output(self,hero,"Info_Gotmar_HAMMER_04_03");	//Probier es doch mal bei Bartok in der Burgschmiede.
	AI_Output(self,hero,"Info_Gotmar_HAMMER_04_04");	//Er ist der zweite Schmied hier im Lager... oder besser gesagt, er WAR der zweite Schmied.
};


instance INFO_GOTMAR_OTHERSMITH(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_othersmith_condition;
	information = info_gotmar_othersmith_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist mit ihm passiert?";
};


func int info_gotmar_othersmith_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_hammer))
	{
		return TRUE;
	};
};

func void info_gotmar_othersmith_info()
{
	GOTMAR_TEACHSMITH = TRUE;
	AI_Output(hero,self,"Info_Gotmar_OTHERSMITH_15_01");	//Was ist mit ihm passiert?
	AI_Output(self,hero,"Info_Gotmar_OTHERSMITH_04_02");	//Die Krankheit hat ihn erwischt. Jetzt ist er bei den Heilern im Viertel der Kranken.
	AI_Output(self,hero,"Info_Gotmar_OTHERSMITH_04_03");	//Ich kann mir nicht vorstellen, daß er seine Werkzeuge dorthin mitgenommen hat.
	B_LogEntry(CH1_LEARNSMITH,"In der Schmiede im Burghof könnten noch Werkzeuge des letzten Schmiedes herumliegen.");
};


instance INFO_GOTMAR_PLAGUE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_plague_condition;
	information = info_gotmar_plague_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist das für eine Krankheit?";
};


func int info_gotmar_plague_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_othersmith))
	{
		return TRUE;
	};
};

func void info_gotmar_plague_info()
{
	AI_Output(hero,self,"Info_Gotmar_PLAGUE_15_01");	//Was ist das für eine Krankheit?
	AI_Output(self,hero,"Info_Gotmar_PLAGUE_04_02");	//Die armen Kerle magern total ab und reden wirres Zeug.
	AI_Output(self,hero,"Info_Gotmar_PLAGUE_04_03");	//Zwischen dem Arbeiterviertel hier und dem Händlerviertel, sind ein paar Hütten für sie aufgestellt worden.
	AI_Output(self,hero,"Info_Gotmar_PLAGUE_04_04");	//Dort gibt es ein paar Heiler, die die Krankheit erforschen.
	AI_Output(self,hero,"Info_Gotmar_PLAGUE_04_05");	//Aber halte dich besser fern von ihnen. Ein vernünftiger Mann hat dort nichts zu schaffen!
};


instance INFO_GOTMAR_AFTERBELLOW(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_afterbellow_condition;
	information = info_gotmar_afterbellow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?";
};


func int info_gotmar_afterbellow_condition()
{
	if(GOTMAR_TEACHSMITH && Npc_HasItems(hero,itmi_pliers) && Npc_HasItems(hero,itmw_sledgehammer))
	{
		return TRUE;
	};
};

func void info_gotmar_afterbellow_info()
{
	AI_Output(hero,self,"Info_Gotmar_AFTERBELLOW_15_01");	//Ich habe nun die Schmiedewerkzeuge. Wie geht es weiter?
	AI_Output(self,hero,"Info_Gotmar_AFTERBELLOW_04_02");	//Geh rüber zum Schmelzofen. Halte dort genügend Erzbrocken mit der Zange hinein.
	AI_Output(self,hero,"Info_Gotmar_AFTERBELLOW_04_03");	//So stellst du Roheisen her, den du dann weiterverarbeiten kannst.
	B_LogEntry(CH1_LEARNSMITH,"Zum Schmieden braucht man ein Roheisen. Das wird am Schmelzofen gemacht. Man braucht dazu Erzbrocken und eine Zange.");
};


instance INFO_GOTMAR_RAWIRON(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_rawiron_condition;
	information = info_gotmar_rawiron_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe das Roheisen!";
};


func int info_gotmar_rawiron_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_afterbellow) && Npc_HasItems(hero,itmi_rawiron))
	{
		return TRUE;
	};
};

func void info_gotmar_rawiron_info()
{
	GOTMAR_TEACHSMITH = TRUE;
	AI_Output(hero,self,"Info_Gotmar_RAWIRON_15_01");	//Ich habe das Roheisen!
	AI_Output(self,hero,"Info_Gotmar_RAWIRON_04_02");	//Zeig mal her.
	ai_createiteminslot(self,"ZS_RIGHTHAND",4473);
	AI_PlayAni(self,"T_1HSINSPECT");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_Output(self,hero,"Info_Gotmar_RAWIRON_04_03");	//Sehr gut! Damit können wir weitermachen!
	AI_Output(self,hero,"Info_Gotmar_RAWIRON_04_04");	//Wenn du später zweihändige Waffen schmiedest, musst du mehr Erz verwenden und ein langes Roheisen herstellen.
	AI_Output(self,hero,"Info_Gotmar_RAWIRON_04_05");	//Aber nun zurück zu deinem Roheisen.
	B_GiveXP(XP_FIRSTRAWIRON);
};


instance INFO_GOTMAR_FIRE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_fire_condition;
	information = info_gotmar_fire_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was mache ich jetzt mit dem Roheisen?";
};


func int info_gotmar_fire_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_rawiron))
	{
		return TRUE;
	};
};

func void info_gotmar_fire_info()
{
	GOTMAR_TEACHSMITH = TRUE;
	AI_Output(hero,self,"Info_Gotmar_FIRE_15_01");	//Was mache ich jetzt mit dem Roheisen?
	AI_Output(self,hero,"Info_Gotmar_FIRE_04_02");	//Bevor du das Eisen schmieden kannst, muss es zum Glühen gebracht werden.
	AI_Output(self,hero,"Info_Gotmar_FIRE_04_03");	//Geh rüber zum Schmiedefeuer und fache es mit dem Blasebalg an.
	AI_Output(self,hero,"Info_Gotmar_FIRE_04_04");	//Dann kannst du das Roheisen zum Glühen bringen.
	B_LogEntry(CH1_LEARNSMITH,"Nun muss das Roheisen in ein Schmiedefeuer gehalten und zum Glühen gebracht werden.");
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,30,GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};


instance INFO_GOTMAR_HOTIRON(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_hotiron_condition;
	information = info_gotmar_hotiron_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe das Roheisen erhitzt, was jetzt?";
};


func int info_gotmar_hotiron_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_afterbellow) && !Npc_KnowsInfo(hero,info_gotmar_swordblade) && !Npc_KnowsInfo(hero,info_gotmar_sharp) && !Npc_KnowsInfo(hero,info_gotmar_shortsword) && Npc_HasItems(hero,itmi_hotiron))
	{
		return TRUE;
	};
};

func void info_gotmar_hotiron_info()
{
	GOTMAR_TEACHSMITH = TRUE;
	AI_Output(hero,self,"Info_Gotmar_HOTIRON_15_01");	//Ich habe das Roheisen erhitzt, was jetzt?
	AI_Output(self,hero,"Info_Gotmar_HOTIRON_04_02");	//Sehr gut, nun kommt der schwierige Teil.
	AI_Output(self,hero,"Info_Gotmar_HOTIRON_04_03");	//Lege das glühende Roheisen auf den Amboss da drüben, besorg dir einen Schmiedehammer und hämmere es zu einer flachen, zweischneidigen Klinge.
	B_GiveXP(XP_FIRSTHOTRAWIRON);
	B_LogEntry(CH1_LEARNSMITH,"Das glühende Roheisen muss nun auf dem Amboss zu einer Schwertklinge geschmiedet werden. Allerdings brauche ich dazu einen Schmiedehammer.");
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,30,GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};


instance INFO_GOTMAR_SWORDBLADE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_swordblade_condition;
	information = info_gotmar_swordblade_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe eine Schwertklinge geschmiedet!";
};


func int info_gotmar_swordblade_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_afterbellow) && !Npc_KnowsInfo(hero,info_gotmar_sharp) && !Npc_KnowsInfo(hero,info_gotmar_shortsword) && Npc_HasItems(hero,itmi_hotswordblade))
	{
		return TRUE;
	};
};

func void info_gotmar_swordblade_info()
{
	AI_Output(hero,self,"Info_Gotmar_SWORDBLADE_15_01");	//Ich habe eine Schwertklinge geschmiedet!
	AI_Output(self,hero,"Info_Gotmar_SWORDBLADE_04_02");	//Ahhhh...
	AI_Output(self,hero,"Info_Gotmar_SWORDBLADE_04_03");	//Das sieht doch schon fast wie eine richtige Waffe aus.
	AI_Output(self,hero,"Info_Gotmar_SWORDBLADE_04_04");	//Aber das Eisen ist noch zu weich. Du musst es härten.
	AI_Output(self,hero,"Info_Gotmar_SWORDBLADE_04_05");	//Steck die glühende Schwertklinge in den Wassereimer dort drüben.
	AI_Output(self,hero,"Info_Gotmar_SWORDBLADE_04_06");	//Das kühlt die Waffe ab, und gibt ihr die nötige Härte!
	B_GiveXP(XP_FIRSTHOTSWORDBLADE);
	B_LogEntry(CH1_LEARNSMITH,"Die glühende Schwertklinge muss in einem Wassereimer abgekühlt und gehärtet werden. Wenigstens brauche ich dafür nicht wieder ein neues Werkzeug.");
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,30,GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};


instance INFO_GOTMAR_SHARP(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_sharp_condition;
	information = info_gotmar_sharp_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die Schwertklinge abgekühlt!";
};


func int info_gotmar_sharp_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_afterbellow) && !Npc_KnowsInfo(hero,info_gotmar_shortsword) && Npc_HasItems(hero,itmi_swordblade))
	{
		return TRUE;
	};
};

func void info_gotmar_sharp_info()
{
	AI_Output(hero,self,"Info_Gotmar_SHARP_15_01");	//Ich habe die Schwertklinge abgekühlt!
	AI_Output(self,hero,"Info_Gotmar_SHARP_04_02");	//Sieht gut aus!
	AI_Output(self,hero,"Info_Gotmar_SHARP_04_03");	//Der letzte Arbeitsschritt findet am Schleifstein statt.
	AI_Output(self,hero,"Info_Gotmar_SHARP_04_04");	//Hier wird die Klinge geschärft. Sei vorsichtig damit, sonst versaust du den ganzen Rohling.
	B_GiveXP(XP_FIRSTSWORDBLADE);
	B_LogEntry(CH1_LEARNSMITH,"Zuletzt muss die abgekühlte Klinge am Schleifstein geschliffen werden.");
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,30,GOTMAR_WP_WAIT);
	TA_EndOverlay(self);
};


instance INFO_GOTMAR_SHORTSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_shortsword_condition;
	information = info_gotmar_shortsword_info;
	important = FALSE;
	permanent = FALSE;
	description = "FERTIG! Hier ist mein erstes Schwert.";
};


func int info_gotmar_shortsword_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_afterbellow) && Npc_HasItems(hero,itmw_shortsword))
	{
		return TRUE;
	};
};

func void info_gotmar_shortsword_info()
{
	var int xp;
	AI_Output(hero,self,"Info_Gotmar_SHORTSWORD_15_01");	//FERTIG! Hier ist mein erstes Schwert.
	AI_Output(self,hero,"Info_Gotmar_SHORTSWORD_04_02");	//Laß mich mal sehen...
	ai_createiteminslot(self,"ZS_RIGHTHAND",4394);
	AI_PlayAni(self,"T_1HSINSPECT");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_Output(self,hero,"Info_Gotmar_SHORTSWORD_04_03");	//Ganz passabel!
	if(!Npc_KnowsInfo(hero,info_gotmar_rawiron))
	{
		xp = xp + XP_FIRSTRAWIRON;
	};
	if(!Npc_KnowsInfo(hero,info_gotmar_hotiron))
	{
		xp = xp + XP_FIRSTHOTRAWIRON;
	};
	if(!Npc_KnowsInfo(hero,info_gotmar_swordblade))
	{
		xp = xp + XP_FIRSTHOTSWORDBLADE;
	};
	if(!Npc_KnowsInfo(hero,info_gotmar_sharp))
	{
		xp = xp + XP_FIRSTSWORDBLADE;
	};
	B_GiveXP(xp + XP_FIRSTSHORTSWORD);
	B_LogEntry(CH1_LEARNSMITH,"Unglaublich, ich habe meine erste Waffe geschmiedet!");
	AI_Output(self,hero,"Info_Gotmar_SHORTSWORD_04_04");	//Nun weisst du, wie man Kurzschwerter herstellt.
	AI_Output(self,hero,"Info_Gotmar_SHORTSWORD_04_05");	//Man kann aus einem Waffenrohling natürlich auch andere Schwerter, Äxte oder Stumpfwaffen herstellen.
	AI_Output(self,hero,"Info_Gotmar_SHORTSWORD_04_06");	//Das Prinzip bleibt immer das gleiche.
	GOTMAR_LEARNDAY = b_getday();
};


instance INFO_GOTMAR_WANTLONGSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_wantlongsword_condition;
	information = info_gotmar_wantlongsword_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie schmiedet man andere Waffen?";
};


func int info_gotmar_wantlongsword_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_shortsword) && !GOTMAR_LEARNLONGSWORD)
	{
		return TRUE;
	};
};

func void info_gotmar_wantlongsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_WANTLONGSWORD_15_01");	//Wie schmiedet man andere Waffen?
	if(b_getday() < (GOTMAR_LEARNDAY + GOTMAR_WAIT_LONGSWORD))
	{
		AI_Output(self,hero,"Info_Gotmar_WANTLONGSWORD_04_02");	//Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		if(!GOTMAR_ASKEDFORLONGSWORD)
		{
			B_LogEntry(CH1_LEARNSMITH,"Gotmar hat heute keine Zeit, mir die Herstellung eines besseren Schwertes beizubringen. Ich sollte ihn an einem anderen Tag nochmal aufsuchen.!");
			GOTMAR_ASKEDFORLONGSWORD = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"Info_Gotmar_WANTLONGSWORD_04_03");	//Heute sieht es gut aus. Aber wenn du wissen willst, wie man ein Langschwert schmiedet, musst du mir erst bei meiner Arbeit helfen.
		AI_Output(self,hero,"Info_Gotmar_WANTLONGSWORD_04_04");	//Mein Gehilfe ist mir vor einiger Zeit weggelaufen.
		GOTMAR_LEARNLONGSWORD = TRUE;
	};
};


instance INFO_GOTMAR_WORKFORLONGSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_workforlongsword_condition;
	information = info_gotmar_workforlongsword_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie kann ich dir helfen?";
};


func int info_gotmar_workforlongsword_condition()
{
	if(GOTMAR_LEARNLONGSWORD && !KNOWS_LONGSWORD)
	{
		return TRUE;
	};
};

func void info_gotmar_workforlongsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_WORKFORLONGSWORD_15_01");	//Wie kann ich dir helfen?
	AI_Output(self,hero,"Info_Gotmar_WORKFORLONGSWORD_04_02");	//Hier hast du etwas Erz! Mein Bestand an Kurzschwertern ist sehr klein geworden.
	B_GiveInvItems(self,hero,itmi_orenugget,GOTMAR_ORE_LONGSWORD);
	AI_Output(self,hero,"Info_Gotmar_WORKFORLONGSWORD_04_03");	//Mach mir fünf dieser Waffen, dann zeige ich dir, wie man ein Langschwert herstellt.
	AI_Output(self,hero,"Info_Gotmar_WORKFORLONGSWORD_04_04");	//Ach nochwas!
	AI_Output(hero,self,"Info_Gotmar_WORKFORLONGSWORD_15_05");	//Was?
	AI_Output(self,hero,"Info_Gotmar_WORKFORLONGSWORD_04_06");	//Das Erz wird nicht ganz reichen. Den Rest musst zu irgendwo auftreiben.
	B_LogEntry(CH1_LEARNSMITH,"Gotmar will mir die Herstellung von Langschwertern zeigen, wenn ich ihm etwas zur Hand gehe. Er will 5 Kurzschwerter von mir haben.");
	AI_StopProcessInfos(self);
};


instance WRK_200_GOTMAR_SMITHHELPER(C_Info)
{
	npc = wrk_200_gotmar;
	condition = wrk_200_gotmar_smithhelper_condition;
	information = wrk_200_gotmar_smithhelper_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du hattest einen Gehilfen?";
};


func int wrk_200_gotmar_smithhelper_condition()
{
	if(GOTMAR_LEARNLONGSWORD)
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_smithhelper_info()
{
	AI_Output(hero,self,"WRK_200_SMITHHELPER_15_01");	//Du hattest einen Gehilfen?
	AI_Output(self,hero,"WRK_200_SMITHHELPER_04_02");	//Ja, eigentlich ein ordentlicher Kerl, mit dem Herz auf dem rechten Fleck.
	AI_Output(self,hero,"WRK_200_SMITHHELPER_04_03");	//Er will nicht bis zum Ende seines Lebens den Blasebalg treten, hat er mir gesagt.
	AI_Output(self,hero,"WRK_200_SMITHHELPER_04_04");	//Wollte lieber Gladiator werden und in der Arena kämpfen. Nutzlose Zeitverschwendung!
	AI_Output(self,hero,"WRK_200_SMITHHELPER_04_05");	//Wirklich schade, er war eine grosse Hilfe für mich!
};


instance INFO_GOTMAR_READYLONGSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_readylongsword_condition;
	information = info_gotmar_readylongsword_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die fünf Kurzschwerter fertig!";
};


func int info_gotmar_readylongsword_condition()
{
	if(GOTMAR_LEARNLONGSWORD && (Npc_HasItems(hero,itmw_shortsword) >= 5))
	{
		return TRUE;
	};
};

func void info_gotmar_readylongsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_READYLONGSWORD_15_01");	//Ich habe die fünf Kurzschwerter fertig!
	B_GiveInvItems(hero,self,itmw_shortsword,5);
	AI_Output(self,hero,"Info_Gotmar_READYLONGSWORD_04_02");	//Gut, zeig mir mal eines...
	ai_createiteminslot(self,"ZS_RIGHTHAND",4394);
	AI_PlayAni(self,"T_1HSINSPECT");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_Output(self,hero,"Info_Gotmar_READYLONGSWORD_04_03");	//Das ist passable Arbeit. Keine Meisterstück, aber wie gesagt: passabel!
	B_GiveXP(XP_MADESHORTSWORDS);
};


instance INFO_GOTMAR_LONGSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_longsword_condition;
	information = info_gotmar_longsword_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LONGSWORD,LPCOST_KNOWLEDGE_LONGSWORD,0);
};


func int info_gotmar_longsword_condition()
{
	if(GOTMAR_LEARNLONGSWORD && !KNOWS_LONGSWORD && Npc_KnowsInfo(hero,info_gotmar_readylongsword))
	{
		return TRUE;
	};
};

func void info_gotmar_longsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_LONGSWORD_15_01");	//Zeige mir, wie man ein Langschwert herstellt!
	if(hero.lp >= LPCOST_KNOWLEDGE_LONGSWORD)
	{
		AI_Output(self,hero,"Info_Gotmar_LONGSWORD_04_02");	//Die Klinge muß etwa 1 Fuß länger sein, als beim Kurzschwert und etwa 2 fingerbreit schmaler.
		AI_Output(self,hero,"Info_Gotmar_LONGSWORD_04_03");	//Die Klinge muß in der Länge weniger und in der Breite mehr geschliffen werden.
		AI_Output(self,hero,"OUMULTI_Training_04_00");	//Versuch es mal! Übung macht den Meister.
		AI_Output(self,hero,"OUMULTI_BackToWork_04_00");	//Ich muß zurück an die Arbeit.
		b_learnlongsword();
		hero.lp -= LPCOST_KNOWLEDGE_LONGSWORD;
		GOTMAR_LEARNDAY = b_getday();
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,hero,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};


instance INFO_GOTMAR_WANTBROADSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_wantbroadsword_condition;
	information = info_gotmar_wantbroadsword_info;
	important = FALSE;
	permanent = TRUE;
	description = "Zeig mir, wie man ein besseres Schwert schmiedet!";
};


func int info_gotmar_wantbroadsword_condition()
{
	if(KNOWS_LONGSWORD)
	{
		return TRUE;
	};
};

func void info_gotmar_wantbroadsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_WANTBROADSWORD_15_01");	//Zeig mir, wie man ein besseres Schwert schmiedet!
	if(b_getday() < (GOTMAR_LEARNDAY + GOTMAR_WAIT_BROADSWORD))
	{
		AI_Output(self,hero,"Info_Gotmar_WANTBROADSWORD_04_02");	//Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		if(!GOTMAR_ASKEDFORBROADSWORD)
		{
			B_LogEntry(CH1_LEARNSMITH,"Gerne würde ich das Schmieden von noch besseren Schwertern lernen, aber Gotmar hat heute zu viel zu tun. Ich sollte ihn an einem späteren Tag nochmal aufsuchen!");
			GOTMAR_ASKEDFORBROADSWORD = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"Info_Gotmar_WANTBROADSWORD_04_03");	//Heute zeige ich dir wie man ein Breitschwert schmiedet.
		AI_Output(self,hero,"Info_Gotmar_WANTBROADSWORD_04_04");	//Aber dafür musst du mir einen Gefallen tun.
		info_gotmar_wantbroadsword.permanent = FALSE;
		GOTMAR_LEARNBROADSWORD = TRUE;
	};
};


instance WRK_200_GOTMAR_WHATFAVOUR(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 1;
	condition = wrk_200_gotmar_whatfavour_condition;
	information = wrk_200_gotmar_whatfavour_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welchen Gefallen?";
};


func int wrk_200_gotmar_whatfavour_condition()
{
	if(GOTMAR_LEARNBROADSWORD)
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_whatfavour_info()
{
	AI_Output(hero,self,"WRK_200_WHATFAVOUR_15_01");	//Welchen Gefallen?
	AI_Output(self,hero,"WRK_200_WHATFAVOUR_04_02");	//Ich habe dir doch von meinem Schmiedegehilfen erzählt...
	AI_Output(hero,self,"WRK_200_WHATFAVOUR_15_03");	//...der sich jetzt als Gladiator versucht?
	AI_Output(self,hero,"WRK_200_WHATFAVOUR_04_04");	//Genau, Mann! Goliath ist sein Name.
	AI_Output(self,hero,"WRK_200_WHATFAVOUR_04_05");	//Die Arbeit hier wächst mir über den Kopf. Ich brauche Goliath dringend wieder zurück.
};


instance WRK_200_GOTMAR_SMITHHELPER2(C_Info)
{
	npc = wrk_200_gotmar;
	condition = wrk_200_gotmar_smithhelper2_condition;
	information = wrk_200_gotmar_smithhelper2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum holst du ihn nicht selbst zurück?";
};


func int wrk_200_gotmar_smithhelper2_condition()
{
	if(Npc_KnowsInfo(hero,wrk_200_gotmar_smithhelper) && Npc_KnowsInfo(hero,wrk_200_gotmar_whatfavour))
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_smithhelper2_info()
{
	AI_Output(hero,self,"WRK_200_SMITHHELPER2_15_01");	//Warum holst du ihn nicht selbst zurück?
	AI_Output(self,hero,"WRK_200_SMITHHELPER2_04_02");	//Hab ich versucht, Mann!
	AI_Output(self,hero,"WRK_200_SMITHHELPER2_04_03");	//Aber er will Ruhm und Anerkennung!
	AI_Output(self,hero,"WRK_200_SMITHHELPER2_04_04");	//Als ob es nicht genug Anerkennung währe im Schweisse seines Angesichtes Stahl zu schmieden.
	AI_Output(self,hero,"WRK_200_SMITHHELPER2_04_05");	//Vielleicht kannst du ihm klarmachen, dass das Leben als Gladiator nicht das richtige für ihn ist.
};


instance WRK_200_GOTMAR_IFETCHGOLIATH(C_Info)
{
	npc = wrk_200_gotmar;
	condition = wrk_200_gotmar_ifetchgoliath_condition;
	information = wrk_200_gotmar_ifetchgoliath_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich werde mit Goliath sprechen!";
};


func int wrk_200_gotmar_ifetchgoliath_condition()
{
	if(Npc_KnowsInfo(hero,wrk_200_gotmar_smithhelper2))
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_ifetchgoliath_info()
{
	AI_Output(hero,self,"WRK_200_IFETCHGOLIATH_15_01");	//Ich werde mit Goliath sprechen!
	B_LogEntry(CH1_LEARNSMITH,"Gotmar hat eingewilligt, mir zu zeigen, wie man Breitschwerter herstellt. Allerdings soll ich ihm einen Gefallen tun und seinen ehemaligen Schmiedegehilfen Goliath dazu überreden, die Arbeit in der Schmiede wieder aufzunehmen!");
};


instance WRK_200_GOTMAR_GOLIATHSBACK(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 1;
	condition = wrk_200_gotmar_goliathsback_condition;
	information = wrk_200_gotmar_goliathsback_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_200_gotmar_goliathsback_condition()
{
	if(GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_goliathsback_info()
{
	AI_Output(self,hero,"WRK_200_GOLIATHSBACK_04_01");	//(freudig-aufgeregt) Goliath arbeitet wieder bei mir!
	AI_Output(self,hero,"WRK_200_GOLIATHSBACK_04_02");	//Ich hab dir viel zu verdanken, Mann!
	AI_Output(self,hero,"WRK_200_GOLIATHSBACK_04_03");	//Wenn du willst, zeige ich dir jetzt, wie man ein Breitschwert schmiedet.
	B_GiveXP(XP_GOTMAR_GOLIATHRETURNED);
	B_LogEntry(CH1_LEARNSMITH,"Der Schmied war sehr erfreut darüber, dass sein Gehilfe Goliath die Arbeit wieder aufgenommen hat. Er will mir jetzt das Schmieden eines noch besseren Schwertes zeigen.");
	b_setattitude(self,ATT_FRIENDLY);
};


instance INFO_GOTMAR_BROADSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_broadsword_condition;
	information = info_gotmar_broadsword_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_BROADSWORD,LPCOST_KNOWLEDGE_BROADSWORD,0);
};


func int info_gotmar_broadsword_condition()
{
	if(GOTMAR_LEARNBROADSWORD && !KNOWS_BROADSWORD && Npc_KnowsInfo(hero,wrk_200_gotmar_goliathsback))
	{
		return TRUE;
	};
};

func void info_gotmar_broadsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_BROADSWORD_15_01");	//Zeige mir, wie man ein Breitschwert schmiedet!
	if(hero.lp >= LPCOST_KNOWLEDGE_BROADSWORD)
	{
		AI_Output(self,hero,"Info_Gotmar_BROADSWORD_04_02");	//Breitschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output(self,hero,"Info_Gotmar_BROADSWORD_04_03");	//Deshalb darfst du die Klinge weder an Länge, noch an Breite kürzen.
		AI_Output(self,hero,"OUMULTI_Training_04_00");	//Versuch es mal! Übung macht den Meister.
		AI_Output(self,hero,"OUMULTI_BackToWork_04_00");	//Ich muß zurück an die Arbeit.
		b_learnbroadsword();
		hero.lp -= LPCOST_KNOWLEDGE_BROADSWORD;
		GOTMAR_LEARNDAY = b_getday();
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,hero,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};


instance INFO_GOTMAR_WANTBASTARDSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_wantbastardsword_condition;
	information = info_gotmar_wantbastardsword_info;
	important = FALSE;
	permanent = TRUE;
	description = "Zeig mir, wie man ein noch besseres Schwert schmiedet!";
};


func int info_gotmar_wantbastardsword_condition()
{
	if(KNOWS_BROADSWORD && !GOTMAR_LEARNBASTARDSWORD)
	{
		return TRUE;
	};
};

func void info_gotmar_wantbastardsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_WANTBASTARDSWORD_15_01");	//Zeig mir, wie man ein noch besseres Schwert schmiedet!
	if(b_getday() < (GOTMAR_LEARNDAY + GOTMAR_WAIT_BASTARDSWORD))
	{
		AI_Output(self,hero,"Info_Gotmar_WANTBASTARDSWORD_04_02");	//Ich habe heute noch viel zu tun. Komm an einem anderen Tag nochmal vorbei!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"Info_Gotmar_WANTBASTARDSWORD_04_03");	//Heute passt mir gut. Ich zeige dir gerne wie man ein Bastardschwert schmiedet.
		GOTMAR_LEARNBASTARDSWORD = TRUE;
	};
};


instance INFO_GOTMAR_BASTARDSWORD(C_Info)
{
	npc = wrk_200_gotmar;
	condition = info_gotmar_bastardsword_condition;
	information = info_gotmar_bastardsword_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_BASTARDSWORD,LPCOST_KNOWLEDGE_BASTARDSWORD,0);
};


func int info_gotmar_bastardsword_condition()
{
	if(GOTMAR_LEARNBASTARDSWORD && !KNOWS_BASTARDSWORD)
	{
		return TRUE;
	};
};

func void info_gotmar_bastardsword_info()
{
	AI_Output(hero,self,"Info_Gotmar_BASTARDSWORD_15_01");	//Zeige mir, wie man ein Bastardschwert schmiedet!
	if(hero.lp >= LPCOST_KNOWLEDGE_BASTARDSWORD)
	{
		AI_Output(self,hero,"Info_Gotmar_BASTARDSWORD_04_02");	//In Grunde sind es die selben Arbeitsschritte wie beim Kurz- und Langschwert.
		AI_Output(self,hero,"Info_Gotmar_BASTARDSWORD_04_03");	//Allerdings darfst du nun am Schleifstein weder an Länge, noch an Breite kürzen.
		AI_Output(self,hero,"Info_Gotmar_BASTARDSWORD_04_04");	//Bastardschwerter verursachen ihren Schaden durch die enorm wuchtige Klinge.
		AI_Output(self,hero,"Info_Gotmar_BASTARDSWORD_04_05");	//Am besten du versuchst mal eine solche Waffe herzustellen. Übung macht den Meister.
		AI_Output(self,hero,"Info_Gotmar_BASTARDSWORD_04_06");	//So, ich muß wieder zurück an die Arbeit.
		b_learnbroadsword();
		hero.lp -= LPCOST_KNOWLEDGE_BASTARDSWORD;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self,hero,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
};


instance WRK_200_GOTMAR_WANTMORE(C_Info)
{
	npc = wrk_200_gotmar;
	condition = wrk_200_gotmar_wantmore_condition;
	information = wrk_200_gotmar_wantmore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?";
};


func int wrk_200_gotmar_wantmore_condition()
{
	if(KNOWS_BASTARDSWORD)
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_wantmore_info()
{
	AI_Output(hero,self,"WRK_200_WANTMORE_15_01");	//Kannst du mir zeigen, wie man noch bessere Waffen schmiedet?
	AI_Output(self,hero,"WRK_200_WANTMORE_04_02");	//Ich hab dir alles beigebracht, was ich weiss.
	AI_Output(self,hero,"WRK_200_WANTMORE_04_03");	//In der Felsenfestung, im Gefolge des Königs, gibt es bestimmt auch einen Waffenschmied.
	AI_Output(self,hero,"WRK_200_WANTMORE_04_04");	//Aber der König hat bisher nichts für unser Lager getan. Ich glaube nicht, daß er etwas für dich tut!
	B_LogEntry(CH1_LEARNSMITH,"Ich habe alles gelernt, was Gotmar mir beibringen kann. Um bessere Waffen herzustellen, muß ich den Schmied in der Felsenfestung aufsuchen.");
	Log_SetTopicStatus(CH1_LEARNSMITH,LOG_SUCCESS);
};


instance WRK_200_GOTMAR_ROCKFORTRESS(C_Info)
{
	npc = wrk_200_gotmar;
	condition = wrk_200_gotmar_rockfortress_condition;
	information = wrk_200_gotmar_rockfortress_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo kann ich diese Felsenfestung finden?";
};


func int wrk_200_gotmar_rockfortress_condition()
{
	if(Npc_KnowsInfo(hero,wrk_200_gotmar_wantmore))
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_rockfortress_info()
{
	AI_Output(hero,self,"WRK_200_ROCKFORTRESS_15_01");	//Wo kann ich die Felsenfestung finden?
	AI_Output(self,hero,"WRK_200_ROCKFORTRESS_04_02");	//Keine Ahnung, Mann.
	AI_Output(self,hero,"WRK_200_ROCKFORTRESS_04_03");	//Bin noch nie aus diesem gottverfluchten Lager herausgekommen, seit ich hier bin!
};


instance WRK_200_GOTMAR_NEEDBLOODORE(C_Info)
{
	npc = wrk_200_gotmar;
	nr = 12;
	condition = wrk_200_gotmar_needbloodore_condition;
	information = wrk_200_gotmar_needbloodore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich brauche Bluterz";
};


func int wrk_200_gotmar_needbloodore_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_findbloodore) && (Npc_HasItems(self,itmi_bloodorenugget) >= 1))
	{
		return TRUE;
	};
};

func void wrk_200_gotmar_needbloodore_info()
{
	AI_Output(hero,self,"WRK_200_NEEDBLOODORE_15_01");	//Ich brauche Bluterz.
	AI_Output(self,hero,"WRK_200_NEEDBLOODORE_04_02");	//Bluterz ist 'ne seltene Sache. Ich selber besitze nur ein paar Brocken. Die kannst du kaufen.
	AI_Output(self,hero,"WRK_200_NEEDBLOODORE_04_03");	//Wenn du mehr brauchst, dann solltest du vielleicht mal mit Wylfern reden. Er war bis vor kurzem noch in der Mine.
	AI_Output(hero,self,"WRK_200_NEEDBLOODORE_15_04");	//Wo finde ich diesen Wylfern?
	AI_Output(self,hero,"WRK_200_NEEDBLOODORE_04_05");	//Er ist ein Rekrut der Miliz und treibt sich normalerweise irgendwo im Innenhof der Burg herum.
	B_LogEntry(CH1_BLOODORE,"Auch Wylfern, ein Rekrut der Miliz könnte über etwas Bluterz verfügen. Er hält sich im Innenhof der Burg auf.");
};

