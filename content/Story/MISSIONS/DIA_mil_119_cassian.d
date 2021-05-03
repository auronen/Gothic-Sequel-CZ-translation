
instance MIL_119_CASSIAN_EXIT(C_Info)
{
	npc = mil_119_cassian;
	nr = 999;
	condition = mil_119_cassian_exit_condition;
	information = mil_119_cassian_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int mil_119_cassian_exit_condition()
{
	return TRUE;
};

func void mil_119_cassian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_119_CASSIAN_HI(C_Info)
{
	npc = mil_119_cassian;
	nr = 12;
	condition = mil_119_cassian_hi_condition;
	information = mil_119_cassian_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was machst du hier?";
};


func int mil_119_cassian_hi_condition()
{
	return TRUE;
};

func void mil_119_cassian_hi_info()
{
	AI_Output(hero,self,"Mil_119_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"Mil_119_HI_08_02");	//Ich bin Cassian, erster Leutnant der Miliz.
	AI_Output(self,hero,"Mil_119_HI_08_03");	//Ich sorge dafür, das niemand die Reglen des Lagers bricht.
	AI_Output(self,hero,"Mil_119_HI_08_04");	//Und ich sorge dafür das die, die es doch tun, es nie wieder tun werden.
};


instance MIL_119_CASSIAN_BEGINTRAIN(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_begintrain_condition;
	information = mil_119_cassian_begintrain_info;
	important = FALSE;
	permanent = FALSE;
	description = "Diego sagte mir, du trainierst Kämpfer?";
};


func int mil_119_cassian_begintrain_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_needtraining) && Npc_KnowsInfo(hero,mil_119_cassian_hi))
	{
		return TRUE;
	};
};

func void mil_119_cassian_begintrain_info()
{
	if(Npc_KnowsInfo(hero,mil_103_berengar_about))
	{
		AI_Output(hero,self,"Mil_119_BEGINTRAIN_15_01");	//Hauptmann Berengar sagte mir, du trainierst Kämpfer?
	}
	else
	{
		AI_Output(hero,self,"Mil_119_BEGINTRAIN_15_02");	//Diego sagte mir, du trainierst Kämpfer?
	};
	AI_Output(self,hero,"Mil_119_BEGINTRAIN_08_03");	//Das ist richtig. Ich sorge dafür, dass die Milizsoldaten kräftig genug sind, wenn die Orks kommen.
	AI_Output(self,hero,"Mil_119_BEGINTRAIN_08_04");	//Und sie werden kommen...
	AI_Output(self,hero,"Mil_119_BEGINTRAIN_08_05");	//Ich kann auch dir zeigen wie du deine Stärke und dein Talent im Umgang mit dem Einhänder verbesserst.
	AI_Output(self,hero,"Mil_119_BEGINTRAIN_08_06");	//Aber im Gegenzug wirst du einige Aufgaben für mich erledigen. Wenn du einverstanden bist, können wir gleich loslegen.
};


instance MIL_119_CASSIAN_WHYSTR(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_whystr_condition;
	information = mil_119_cassian_whystr_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wofür benötige ich Stärke?";
};


func int mil_119_cassian_whystr_condition()
{
	if(Npc_KnowsInfo(hero,mil_119_cassian_begintrain))
	{
		return TRUE;
	};
};

func void mil_119_cassian_whystr_info()
{
	AI_Output(hero,self,"Mil_119_WHYSTR_15_01");	//Wofür benötige ich Stärke?
	AI_Output(self,hero,"Mil_119_WHYSTR_08_02");	//Je stärker du bist, desto tiefere Wunden verursachst du mit Nahkampfwaffen.
	AI_Output(self,hero,"Mil_119_WHYSTR_08_03");	//Wenn dir erst einmal ein gut gerüsteter Ork gegenübersteht, dann wirst du ihn nur mit grosser Stärke verwunden können.
	AI_Output(self,hero,"Mil_119_WHYSTR_08_04");	//Dazu kommt, dass vor allem die grösseren Nahkampfwaffen so schwer sind, dass du sie nur mit hoher Stärke schwingen kannst.
};


instance MIL_119_CASSIAN_WHY1HAND(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_why1hand_condition;
	information = mil_119_cassian_why1hand_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was nützt mir Talent im Umgang mit Einhändern?";
};


func int mil_119_cassian_why1hand_condition()
{
	if(Npc_KnowsInfo(hero,mil_119_cassian_begintrain))
	{
		return TRUE;
	};
};

func void mil_119_cassian_why1hand_info()
{
	AI_Output(hero,self,"Mil_119_WHY1HAND_15_01");	//Was nützt mir Talent im Umgang mit Einhändern?
	AI_Output(self,hero,"Mil_119_WHY1HAND_08_02");	//Je mehr Talent du erlernt hast, desto schneller kannst du mit solchen Waffen zuschlagen.
	AI_Output(self,hero,"Mil_119_WHY1HAND_08_03");	//Talentierte Kämfper können ihre Gegner mit blitzschnellen Schlagkombinationen derart bedrängen, dass diese nicht mehr mal zum Parrieren geschweige denn zum Angreifen kommen.
	AI_Output(self,hero,"Mil_119_WHY1HAND_08_04");	//Ausserdem wissen nur talentierte Kämpfer, wie sie ungeschütze stellen des Gegners treffen, und so manchmal viel tiefere Wunden reissen als sonst.
};


instance MIL_119_CASSIAN_TEACH(C_Info)
{
	npc = mil_119_cassian;
	nr = 10;
	condition = mil_119_cassian_teach_condition;
	information = mil_119_cassian_teach_info;
	permanent = 1;
	description = "Ich will stärker werden";
};


func int mil_119_cassian_teach_condition()
{
	if(Npc_KnowsInfo(other,mil_119_cassian_begintrain))
	{
		return TRUE;
	};
};

func void mil_119_cassian_teach_info()
{
	AI_Output(other,self,"Mil_119_Cassian_Teach_15_01");	//Ich will stärker werden.
	Info_ClearChoices(mil_119_cassian_teach);
	Info_AddChoice(mil_119_cassian_teach,DIALOG_BACK,mil_119_cassian_teach_back);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_5);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_1);
};

func void mil_119_cassian_teach_back()
{
	Info_ClearChoices(mil_119_cassian_teach);
};

func void mil_119_cassian_teach_str_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(mil_119_cassian_teach);
	Info_AddChoice(mil_119_cassian_teach,DIALOG_BACK,mil_119_cassian_teach_back);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_5);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_1);
};

func void mil_119_cassian_teach_str_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(mil_119_cassian_teach);
	Info_AddChoice(mil_119_cassian_teach,DIALOG_BACK,mil_119_cassian_teach_back);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_5);
	Info_AddChoice(mil_119_cassian_teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),mil_119_cassian_teach_str_1);
};


instance MIL_119_CASSIAN_TRAIN(C_Info)
{
	npc = mil_119_cassian;
	nr = 10;
	condition = mil_119_cassian_train_condition;
	information = mil_119_cassian_train_info;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0);
};


func int mil_119_cassian_train_condition()
{
	if(Npc_KnowsInfo(hero,mil_119_cassian_begintrain) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0))
	{
		return TRUE;
	};
};

func void mil_119_cassian_train_info()
{
	var C_Npc huldrych;
	AI_Output(other,self,"Mil_119_Cassian_TRAIN_15_01");	//Zeig mir den Kampf mit einhändigen Waffen.
	if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_02");	//Zunächst halte die Waffe mit einer Hand. Dadurch kannst du schneller zuschlagen.
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_03");	//Mit weiten Seitenhieben kannst du dir gefährliche Gegner vom Hals halten.
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_04");	//Und mit einer Kombination von Schlägen kannst du gezielte Attacken durchführen.
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_05");	//Das wichtigste ist, das du Kampferfahrung sammelst. Da habe ich auch direkt die erste Gelegenheit für dich.
		AI_Output(other,self,"Mil_119_Cassian_TRAIN_15_06");	//Lass hören.
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_07");	//Du mußt wissen, das es hier im Lager einige Herumtreiber gibt. Faule Hunde, die sich einen Dreck um die Gemeinschaft des Lagers scheren.
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_08");	//Huldrych ist einer von ihnen. Er wurde beobachtet, wie er sich an den Vorräten des Händlers Agon bedient hat.
		AI_Output(other,self,"Mil_119_Cassian_TRAIN_15_09");	//Und meine Aufgabe ist ...
		AI_Output(self,other,"Mil_119_Cassian_TRAIN_08_10");	//Deine Aufgabe ist es, Huldrych das gestohlene Zeug wieder abzunehmen. Verpass ihm eine Lektion. Aber LASS IHM AM LEBEN!
		Log_CreateTopic(CH1_TRAIN1H,LOG_MISSION);
		Log_SetTopicStatus(CH1_TRAIN1H,LOG_RUNNING);
		B_LogEntry(CH1_TRAIN1H,"Huldrych hat den Händler Agon bestohlen. Cassian hat mich nun beauftragt, zum einen Huldrych eine Lektion zu erteilen und zum anderen Agon sein Eigentum wiederzubringen. Dabei wäre es unklug, Huldrych zu töten!");
		CASSIAN_BEATHUDRYCH = LOG_RUNNING;
		huldrych = Hlp_GetNpc(thf_401_huldrych);
		CreateInvItems(huldrych,itmi_silver,100);
		huldrych.guild = GIL_None;
		AI_StopProcessInfos(self);
	};
};


instance MIL_119_CASSIAN_WHILEHULDRYCH(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_whilehuldrych_condition;
	information = mil_119_cassian_whilehuldrych_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_119_cassian_whilehuldrych_condition()
{
	if((CASSIAN_BEATHUDRYCH == LOG_RUNNING) && c_npcisinvincible(hero) && !Npc_KnowsInfo(hero,wrk_225_agon_stolen))
	{
		return TRUE;
	};
};

func void mil_119_cassian_whilehuldrych_info()
{
	AI_Output(self,hero,"Mil_119_Cassian_WHILEHULDRYCH_08_01");	//Vielleicht solltest du zuerst mit Agon sprechen, bevor du zu Huldrych gehst.
	B_LogEntry(CH1_TRAIN1H,"Vielleicht ist es besser, erst mit Agon zu reden, bevor ich zu Huldrych gehe, um einen besseren Überblick der Situation zu bekommen.");
	Info_ClearChoices(mil_119_cassian_whilehuldrych);
};


instance MIL_119_CASSIAN_FIRSTMISSION(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_firstmission_condition;
	information = mil_119_cassian_firstmission_info;
	important = 0;
	permanent = 0;
	description = "Huldrych hat seine Lektion erhalten";
};


func int mil_119_cassian_firstmission_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if((huldrych.aivar[12] == TRUE) && (CASSIAN_BEATHUDRYCH == LOG_RUNNING) && !Npc_IsDead(huldrych))
	{
		return TRUE;
	};
};

func void mil_119_cassian_firstmission_info()
{
	var C_Npc huldrych;
	AI_Output(other,self,"Mil_119_Cassian_FIRSTMISSION_Info_15_01");	//Huldrych hat seine Lektion erhalten
	AI_Output(self,other,"Mil_119_Cassian_FIRSTMISSION_Info_08_02");	//Saubere Arbeit. Hoffentlich lernt er daraus.
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	CASSIAN_BEATHUDRYCH = LOG_SUCCESS;
	huldrych.guild = GIL_THIEF;
	B_GiveXP(XP_HULDRYCHLEKTION);
	Log_SetTopicStatus(CH1_TRAIN1H,LOG_SUCCESS);
	B_LogEntry(CH1_TRAIN1H,"Ich habe die Aufgabe zu Cassian's Zufriedenheit erledigt. Huldrych hat seine Lektion erhalten.");
};


instance MIL_119_CASSIAN_HULDRYCHDEAD(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_huldrychdead_condition;
	information = mil_119_cassian_huldrychdead_info;
	important = 0;
	permanent = 0;
	description = "Huldrych hat...äh seine Lektion endgültig verstanden";
};


func int mil_119_cassian_huldrychdead_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if(Npc_IsDead(huldrych) && (CASSIAN_BEATHUDRYCH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void mil_119_cassian_huldrychdead_info()
{
	AI_Output(other,self,"Mil_119_Cassian_HULDRYCHDEAD_Info_15_01");	//Huldrych hat...äh seine Lektion endgültig verstanden.
	AI_Output(self,other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_02");	//Du hast ihn umgebracht. Hatte ich dir nicht gesagt, du sollst ihn nicht umbringen?
	AI_Output(self,other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_03");	//Das oberste Gesetz hier im Lager lautete: KEIN MORD! Ein Mord ist ein Grund jemanden aus dem Lager zu verweisen!
	AI_Output(self,other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_04");	//Wenn du noch einmal jemanden tötest, dann kann dir keiner helfen. Nicht mal Diego, Lester oder ich. Bei aller Freundschaft nicht.
	CASSIAN_BEATHUDRYCH = LOG_FAILED;
	Log_SetTopicStatus(CH1_TRAIN1H,LOG_FAILED);
	B_LogEntry(CH1_TRAIN1H,"Es wäre besser gewesen, ich hätte Huldrych nicht umgebracht. In Zukunft sollte ich vorsichtig sein, Mord wird von allen sehr ernst genommen");
};


instance MIL_119_CASSIAN_AGONSSILVER(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_agonssilver_condition;
	information = mil_119_cassian_agonssilver_info;
	important = 0;
	permanent = 0;
	description = "Agon hat sein Silber wieder";
};


func int mil_119_cassian_agonssilver_condition()
{
	if(Npc_KnowsInfo(hero,wrk_225_agon_100))
	{
		return TRUE;
	};
};

func void mil_119_cassian_agonssilver_info()
{
	AI_Output(other,self,"Mil_119_Cassian_AGONSSILVER_Info_15_01");	//Agon hat sein Silber wieder.
	AI_Output(self,other,"Mil_119_Cassian_AGONSSILVER_Info_08_02");	//Gut gemacht. Da wird der knausrige Kerl sich aber freuen.
	B_GiveXP(XP_AGONSILVER);
};


instance MIL_119_CASSIAN_HULDRYCHDEAL(C_Info)
{
	npc = mil_119_cassian;
	nr = 15;
	condition = mil_119_cassian_huldrychdeal_condition;
	information = mil_119_cassian_huldrychdeal_info;
	important = FALSE;
	permanent = FALSE;
	description = "Huldrych hat bekommen, was er verdient!";
};


func int mil_119_cassian_huldrychdeal_condition()
{
	var C_Npc huldrych;
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	if(!huldrych.aivar[12] && (CASSIAN_BEATHUDRYCH == LOG_RUNNING) && !Npc_IsDead(huldrych) && HULDRYCH_AWAY)
	{
		return TRUE;
	};
};

func void mil_119_cassian_huldrychdeal_info()
{
	var C_Npc huldrych;
	AI_Output(hero,self,"Mil_119_Cassian_HULDRYCHDEAL_15_01");	//Huldrych hat bekommen, was er verdient!
	AI_Output(self,hero,"Mil_119_Cassian_HULDRYCHDEAL_08_02");	//Ich hoffe du hast ihn nicht zu hart rangenommen.
	AI_Output(hero,self,"Mil_119_Cassian_HULDRYCHDEAL_15_03");	//Er hat es verstanden.
	AI_Output(self,hero,"Mil_119_Cassian_HULDRYCHDEAL_08_04");	//Und du weißt jetzt auch, wie die Dinge hier laufen.
	huldrych = Hlp_GetNpc(thf_401_huldrych);
	CASSIAN_BEATHUDRYCH = LOG_SUCCESS;
	huldrych.guild = GIL_THIEF;
	B_GiveXP(XP_HULDRYCHDEAL);
	Log_SetTopicStatus(CH1_TRAIN1H,LOG_SUCCESS);
	B_LogEntry(CH1_TRAIN1H,"Ich habe ein gutes Geschäft mit Huldrych gemacht. Und niemand hat etwas davon bemerkt. Vielleicht wird mir das noch einmal nützlich sein.");
};


instance MIL_119_CASSIAN_LEARN1HST2(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_learn1hst2_condition;
	information = mil_119_cassian_learn1hst2_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0);
};


func int mil_119_cassian_learn1hst2_condition()
{
	if(((CASSIAN_BEATHUDRYCH == LOG_SUCCESS) || (CASSIAN_BEATHUDRYCH == LOG_FAILED)) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		return TRUE;
	};
};

func void mil_119_cassian_learn1hst2_info()
{
	AI_Output(hero,self,"Mil_119_Cassian_LEARN1HST2_15_01");	//Zeig mir mehr über den Kampf mit einhändigen Waffen.
	if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_02");	//Durch die Meisterschaft des einhändigen Kampfes schlägst du schneller und härter zu.
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_03");	//Deine Angriffskombinationen werden geschikter und präziser.
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_04");	//Und die Chance einen kritischen Treffer zu landen wird größer.
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_05");	//Aber es ist der Verstand, der einen guten von einem schlechten Kämpder unterscheidet.
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_06");	//Erkenne die Situation, bewahre einen kühlen Kopf und handel umsichtig.
		AI_Output(self,hero,"Mil_119_Cassian_LEARN1HST2_08_07");	//Denn nur wer die Situation versteht, kann sie lenken und kontrollieren.
		mil_119_cassian_learn1hst2.permanent = FALSE;
		CASSIAN_INFO = TRUE;
	};
};


instance MIL_119_CASSIAN_JOB(C_Info)
{
	npc = mil_119_cassian;
	nr = 33;
	condition = mil_119_cassian_job_condition;
	information = mil_119_cassian_job_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du noch eine Aufgabe für mich?";
};


func int mil_119_cassian_job_condition()
{
	if(CASSIAN_INFO)
	{
		return TRUE;
	};
};

func void mil_119_cassian_job_info()
{
	AI_Output(hero,self,"Mil_119_JOB_15_01");	//Hast du noch eine Aufgabe für mich?
	AI_Output(self,hero,"Mil_119_JOB_08_02");	//Ich nicht, aber Agon hat braucht einen Kämpfer, der ihn beschützt.
	AI_Output(self,hero,"Mil_119_JOB_08_03");	//Wir versuchen das Gebiet um das Lager herum besetzt zu halten, aber es gibt immer wieder Monster die verdammt nah ans Lager heran kommen.
	AI_Output(self,hero,"Mil_119_JOB_08_04");	//
};


instance MIL_119_CASSIAN_BRUTUS(C_Info)
{
	npc = mil_119_cassian;
	condition = mil_119_cassian_brutus_condition;
	information = mil_119_cassian_brutus_info;
	important = FALSE;
	permanent = FALSE;
	description = "Brutus lässt dir was ausrichten...";
};


func int mil_119_cassian_brutus_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_cassian))
	{
		return TRUE;
	};
};

func void mil_119_cassian_brutus_info()
{
	AI_Output(hero,self,"Mil_119_BRUTUS_15_01");	//Brutus lässt dir was ausrichten. Er fordert dich auf, gegen ihn in der Arena zu kämpfen.
	AI_Output(self,hero,"Mil_119_BRUTUS_08_02");	//Brutus sollte sich mehr um seine Pflichten als Leutnant der Miliz kümmern.
	AI_Output(self,hero,"Mil_119_BRUTUS_08_03");	//Er hängt den ganzen Tag nur vor der Arena herum und reisst grosse Sprüche.
	AI_Output(self,hero,"Mil_119_BRUTUS_08_04");	//Er sollte seine Kraft lieber für die Orks aufheben, oder sich um die Milizsoldaten kümmern.
	AI_Output(self,hero,"Mil_119_BRUTUS_08_05");	//Wenn er so weiter macht, wird ihn Berengar über kurz oder lang rausschmeissen.
};

