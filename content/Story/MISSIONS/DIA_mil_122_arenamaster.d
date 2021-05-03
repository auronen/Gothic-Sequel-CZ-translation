
instance INFO_ARENAMASTER_EXIT(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 999;
	condition = info_arenamaster_exit_condition;
	information = info_arenamaster_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_arenamaster_exit_condition()
{
	return TRUE;
};

func void info_arenamaster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ARENAMASTER_NICEFIGHT(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 2;
	condition = info_arenamaster_nicefight_condition;
	information = info_arenamaster_nicefight_info;
	important = TRUE;
	permanent = FALSE;
};


func int info_arenamaster_nicefight_condition()
{
	if(ARENAMASTER_TEASED && Npc_IsInRoutine(self,zs_arenamasternpc) && (Npc_GetDistToWP(self,ARENA_WP_THRONE) < 300) && (Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG))
	{
		return TRUE;
	};
};

func void info_arenamaster_nicefight_info()
{
	if(Npc_KnowsInfo(hero,info_arenamaster_soundsgood))
	{
		AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_12_01");	//Ahh,	da bist	du ja!
	}
	else
	{
		ARENAMASTER_FIRSTDAY = b_getday();
		Log_CreateTopic(CH1_ARENA,LOG_MISSION);
		Log_SetTopicStatus(CH1_ARENA,LOG_RUNNING);
	};
	AI_Output(hero,self,"Info_Arenamaster_NICEFIGHT_15_02");	//Netter Kampf!
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_12_03");	//Allerdings! Die Arenakämpfe sind	der	Höhepunkt in diesem	flohzerfressenen Lager.
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_12_04");	//Wenn	du hier	etwas werden willst, bleibt	dir	im Grunde garnichts	anderes	übrig, als Gladiator zu	werden.
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_12_05");	//Würdest du dich trauen, dich	selbst einmal in die Arena zu stellen und in die Augen eines anderen Gladiatoren zu	blicken?
	Info_ClearChoices(info_arenamaster_nicefight);
	Info_AddChoice(info_arenamaster_nicefight,"Ich kämpfe	nicht zur Belustigung anderer!",info_arenamaster_nicefight_no);
	Info_AddChoice(info_arenamaster_nicefight,"Was springt für mich dabei	raus?",info_arenamaster_nicefight_what);
	Info_AddChoice(info_arenamaster_nicefight,"Warum nicht! Was die können, kann ich auch!",info_arenamaster_nicefight_yes);
};

func void info_arenamaster_nicefight_yes()
{
	Info_ClearChoices(info_arenamaster_nicefight);
	AI_Output(hero,self,"Info_Arenamaster_NICEFIGHT_YES_15_01");	//Warum nicht!	Was	die	können,	kann ich auch!
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_YES_12_02");	//Sehr	gut! Am	besten du forderst gleich einen	der	anderen	Gladiatoren	heraus.
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_YES_12_03");	//Komm	dann zurück	zu mir und wir regeln alles	weitere.
	ARENAMASTER_ACCEPTED = TRUE;
	B_LogEntry(CH1_ARENA,"Wenn ich als Gladiator	kämpfen	will, muß ich einen	der	anderen	Kämpfer	herausfordern und dann zum Arenameister	zurückkehren!");
	AI_StopProcessInfos(self);
};

func void info_arenamaster_nicefight_what()
{
	Info_ClearChoices(info_arenamaster_nicefight);
	AI_Output(hero,self,"Info_Arenamaster_NICEFIGHT_WHAT_15_01");	//Was	springt	für	mich dabei raus?
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_02");	//Ahhh...	ein	Kaufmann...! Nunja,	wenn du	dich in	der	Arena geschickt	anstellst, kannst du dir eine goldene Nase verdienen.
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_03");	//Fordere	einen der anderen Arenakämpfer heraus und komme	dann zu	mir	zurück.
	ARENAMASTER_ACCEPTED = TRUE;
	B_LogEntry(CH1_ARENA,"Wenn ich als Gladiator	etwas Silber verdienen will, soll ich einen	der	anderen	Kämpfer	herausfordern und dann wieder mit dem Arenameister sprechen!");
	AI_StopProcessInfos(self);
};

func void info_arenamaster_nicefight_no()
{
	Info_ClearChoices(info_arenamaster_nicefight);
	AI_Output(hero,self,"Info_Arenamaster_NICEFIGHT_NO_15_01");	//Ich kämpfe nicht zur Belustigung anderer!
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_NO_12_02");	//Schade. Einen	Mann wie dich würde	ich	gerne in der Arena sehen!
	AI_Output(self,hero,"Info_Arenamaster_NICEFIGHT_NO_12_03");	//Naja,	komm wieder	wenn du	deine Meinung geändert hast!
	B_LogEntry(CH1_ARENA,"Ich habe das Angebot des Arenameisters, Gladiator zu werden, abgelehnt! Er	bot	mir	an,	es mir nochmal zu überlegen.");
	ARENAMASTER_FAILED = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_ARENAMASTER_NEWBIE(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 1;
	condition = info_arenamaster_newbie_condition;
	information = info_arenamaster_newbie_info;
	important = TRUE;
	permanent = FALSE;
};


func int info_arenamaster_newbie_condition()
{
	if(Wld_IsTime(ARENASTAND_H,ARENASTAND_M,ARENAEND_H,ARENAEND_M) && (Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG))
	{
		return TRUE;
	};
};

func void info_arenamaster_newbie_info()
{
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_12_01");	//HEY	DU!
	AI_Output(hero,self,"Info_Arenamaster_NEWBIE_15_02");	//Wer	ich?
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_12_03");	//Du siehst kräftig aus. Bist	du an Ruhm und Ehre	interessiert?
	Info_ClearChoices(info_arenamaster_newbie);
	Info_AddChoice(info_arenamaster_newbie,"Such dir einen	anderen	Trottel",info_arenamaster_newbie_fool);
	Info_AddChoice(info_arenamaster_newbie,"Silber	wäre mir lieber!",info_arenamaster_newbie_silver);
	Info_AddChoice(info_arenamaster_newbie,"Ruhm und Ehre?	Warum nicht!",info_arenamaster_newbie_yes);
	ARENAMASTER_FIRSTDAY = b_getday();
};

func void info_arenamaster_newbie_yes()
{
	Info_ClearChoices(info_arenamaster_newbie);
	AI_Output(hero,self,"Info_Arenamaster_NEWBIE_YES_15_01");	//Ruhm und Ehre? Warum nicht!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_YES_12_02");	//Dann solltest du dich für die Arenakämpfe anmelden!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_YES_12_03");	//In der Arena wirst du große	Proben für deinen Mut und deine	Stärke finden!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_YES_12_04");	//Die	Menge wird dir zujubeln	und	dich anfeuern!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_YES_12_05");	//Als	siegreicher	Gladiator warten Ruhm und Ehre auf dich!
	ARENAMASTER_TEASED = TRUE;
	if(info_arenamaster_nicefight_condition())
	{
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_newbie_silver()
{
	Info_ClearChoices(info_arenamaster_newbie);
	AI_Output(hero,self,"Info_Arenamaster_NEWBIE_SILVER_15_01");	//Silber wäre mir lieber!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_SILVER_12_02");	//Dann	bist du	hier genau richtig,	denn Silber	kannst du hier zuhauf verdienen.
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_SILVER_12_03");	//Melde dich für die Arenakämpfe und der Reichtum eines siegreichen Gladiators	kann schon bald	dein sein!
	ARENAMASTER_TEASED = TRUE;
	if(info_arenamaster_nicefight_condition())
	{
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_newbie_fool()
{
	Info_ClearChoices(info_arenamaster_newbie);
	AI_Output(hero,self,"Info_Arenamaster_NEWBIE_FOOL_15_01");	//Such dir einen	anderen	Trottel!
	AI_Output(self,hero,"Info_Arenamaster_NEWBIE_FOOL_12_02");	//Kein Grund	unfreundlich zu	werden,	ich	wollte dir nur ein Angebot unterbreiten!
	Log_CreateTopic(CH1_ARENA,LOG_MISSION);
	Log_SetTopicStatus(CH1_ARENA,LOG_RUNNING);
	B_LogEntry(CH1_ARENA,"Der Arenameister wollte irgendeine	Bauernfängerei mit mir abziehen. Ich habe ihm eine Abfuhr erteilt!");
	ARENAMASTER_FAILED = TRUE;
	AI_StopProcessInfos(self);
};


instance INFO_ARENAMASTER_SOUNDSGOOD(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_soundsgood_condition;
	information = info_arenamaster_soundsgood_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hört	sich gut an. Was muss ich tun?";
};


func int info_arenamaster_soundsgood_condition()
{
	var int nicefight;
	nicefight = info_arenamaster_nicefight_condition();
	if(((ARENAMASTER_TEASED && !nicefight) || Npc_KnowsInfo(hero,mil_122_arenamaster_askagain)) && !ARENAMASTER_ACCEPTED)
	{
		return TRUE;
	};
};

func void info_arenamaster_soundsgood_info()
{
	AI_Output(hero,self,"Info_Arenamaster_SOUNDSGOOD_15_01");	//Hört sich gut an. Was muss ich tun?
	AI_Output(self,hero,"Info_Arenamaster_SOUNDSGOOD_12_02");	//Besuche	mich einfach mal beim Arenakampf. Dann unterhalten wir uns weiter!
	AI_StopProcessInfos(self);
	ARENAMASTER_FIRSTDAY = b_getday();
	Log_CreateTopic(CH1_ARENA,LOG_MISSION);
	Log_SetTopicStatus(CH1_ARENA,LOG_RUNNING);
	B_LogEntry(CH1_ARENA,"Wenn ich selbst als Gladiator kämpfen will, muß ich abends	während	eines Arenakampfes mit dem Arenameister	reden.");
};


instance MIL_122_ARENAMASTER_ASKAGAIN(C_Info)
{
	npc = mil_122_arenamaster;
	condition = mil_122_arenamaster_askagain_condition;
	information = mil_122_arenamaster_askagain_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wegen deinem Angebot...";
};


func int mil_122_arenamaster_askagain_condition()
{
	if(ARENAMASTER_FAILED && !ARENAMASTER_TEASED)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_askagain_info()
{
	AI_Output(hero,self,"MIL_122_ASKAGAIN_15_01");	//Wegen	deinem Angebot...
	AI_Output(self,hero,"MIL_122_ASKAGAIN_12_02");	//Hast es dir wohl anders überlegt was?
	AI_Output(self,hero,"MIL_122_ASKAGAIN_12_03");	//Na, ich will mal nicht so	sein. Wenn du jetzt	interessiert bist, dann	gilt mein Angebot noch.
	ARENAMASTER_TEASED = TRUE;
	ARENAMASTER_FAILED = FALSE;
	if(Npc_KnowsInfo(hero,info_arenamaster_nicefight))
	{
		AI_Output(self,hero,"MIL_122_ASKAGAIN_12_04");	//Fordere einen der anderen Arenakämpfer heraus und komme dann zu mir zurück.
		ARENAMASTER_ACCEPTED = TRUE;
		B_LogEntry(CH1_ARENA,"Der Arenameister hat mich nun doch noch als Gladiator angenommen. Ich soll einen der anderen Kämpfer herausfordern und dann wieder mit ihm sprechen!");
		AI_StopProcessInfos(self);
	};
};


instance INFO_ARENAMASTER_BANNED(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 20;
	condition = info_arenamaster_banned_condition;
	information = info_arenamaster_banned_info;
	important = TRUE;
	permanent = TRUE;
};


func int info_arenamaster_banned_condition()
{
	if(ARENA_PLAYERBANNED && c_npcisinvincible(hero))
	{
		return TRUE;
	};
};

func void info_arenamaster_banned_info()
{
	if(ARENA_PLAYERKILLED)
	{
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_01");	//DU	hast in	der	Arena getötet!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_02");	//NIEMAND tötet in der Arena, das ist Regel Nummer 1!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_03");	//Selbst	Typen wie Brutus kapieren das!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_04");	//Und jetzt verschwinde!
	};
	if(ARENA_PLAYERUSEDBOW)
	{
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_05");	//Du	kanntest die Regeln. Keine Fernkampfwaffen in der Arena!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_06");	//Du	bist kein Gladiator	mehr! Geh jetzt!
	};
	if(ARENA_PLAYERUSEDMAGIC)
	{
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_07");	//Du	kanntest die Regeln! Keine Magie in	der	Arena!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_08");	//Ich werde dich	für	keinen Kampf mehr aufstellen.
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_09");	//Du	hast deine Chance vertan!
	};
	if(ARENA_PLAYERSTOLEWEAPON)
	{
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_10");	//Du	hast Regel Nummer 3	verletzt: Finger weg von der Waffe des anderen!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_11");	//Ich will dich hier	nicht mehr sehen!
	};
	if(ARENA_PLAYERSHIRKED)
	{
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_12");	//(laut) Du hast dich	wie	eine feige Ratte vor deinem	letzen Kampf gedrückt!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_13");	//(lauter) Du	hast mich vor dem gesamten Lager blamiert!!!
		AI_Output(self,hero,"Info_Arenamaster_BANNED_12_14");	//(brüllt) GEH MIR AUS DEN AUGEN !!!!
	};
	Info_AddChoice(info_arenamaster_banned,"Mir doch egal!",info_arenamaster_banned_no);
	if(Npc_HasItems(hero,itmi_silver) >= ARENAMASTER_CALM_SILVER)
	{
		Info_AddChoice(info_arenamaster_banned,"Tut mir leid, das wird nicht wiedervorkommen (500 Silber anbieten).",info_arenamaster_banned_sorry);
	};
};

func void info_arenamaster_banned_sorry()
{
	Info_ClearChoices(info_arenamaster_banned);
	AI_Output(hero,self,"Info_Arenamaster_BANNED_SORRY_15_01");	//Tut mir leid, das wird nicht wiedervorkommen.
	B_GiveInvItems(hero,self,itmi_silver,ARENAMASTER_CALM_SILVER);
	AI_Output(self,hero,"Info_Arenamaster_BANNED_SORRY_12_02");	//Das will ich hoffen. Solche Fehltritte gefährden den Ruf der ganzen Arena!
	AI_Output(self,hero,"Info_Arenamaster_BANNED_SORRY_12_03");	//Also denk beim nächsten Mal besser VORHER nach.
	ARENA_PLAYERBANNED = FALSE;
	b_setattitude(self,ARENAMASTER_OLDATTITUDE);
	AI_StopProcessInfos(self);
};

func void info_arenamaster_banned_no()
{
	Info_ClearChoices(info_arenamaster_banned);
	AI_Output(hero,self,"Info_Arenamaster_BANNED_NO_15_01");	//Mir doch egal!
	AI_StopProcessInfos(self);
};


instance INFO_ARENAMASTER_NEXTFIGHT(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 20;
	condition = info_arenamaster_nextfight_condition;
	information = info_arenamaster_nextfight_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wann	ist	der	nächste	Arenakampf?";
};


func int info_arenamaster_nextfight_condition()
{
	if(!(Npc_IsInRoutine(self,zs_arenamasternpc) && (Npc_GetDistToWP(self,ARENA_WP_THRONE) < 300)) || Npc_KnowsInfo(hero,info_arenamaster_nicefight))
	{
		return TRUE;
	};
};

func void info_arenamaster_nextfight_info()
{
	AI_Output(hero,self,"Info_Arenamaster_NEXTFIGHT_15_01");	//Wann	ist	der	nächste	Arenakampf?
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_02");	//(erbost)	Jetzt nicht, du	Idiot!!! Und in	meiner Hütte schon gleich garnicht!!!
		AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_03");	//(etwas ruhiger) Komm	morgen zu meinem Stand!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_04");	//Heute abend.	Du hast	noch reichlich Zeit.
		if(ARENA_PLAYERFIGHT)
		{
			AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_05");	//...und vergiss nicht: Du	kämpfst	heute abend	SELBST!!!
		};
	}
	else if(Npc_IsInRoutine(self,zs_arenamasternpcsend) || Npc_IsInRoutine(self,zs_arenamasternpc))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_THRONE) > 300)
		{
			if(ARENA_PLAYERFIGHT)
			{
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_06");	//Du solltst längst in	deiner Arenakammer sitzen und dich auf den Kampf vorbereiten!
				AI_StopProcessInfos(self);
			}
			else if(Npc_IsInRoutine(self,zs_arenamasternpcsend))
			{
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_07");	//Das	Vorprogramm	läuft schon	und	die	Gladiatoren	haben sich bereits in ihre Kammern zurückgezogen. Der Kampf	beginnt	bald.
			}
			else
			{
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_08");	//Sie zu, dass	du einen guten Platz auf der Tribüne bekommst.
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_09");	//Der Kampf fängt gleich an!
			};
		}
		else
		{
			if(ARENA_PLAYERFIGHT)
			{
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_10");	//Was tust	du hier	oben! Dein Platz ist unten in der Arena! Die Leute warten darauf das es	losgehen kann!!!
			}
			else
			{
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_11");	//Schau mal in	die	Arena runter! Was siehst du	da...?
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_12");	//(belehrend)...einen Kampf!
				AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_13");	//Und jetzt nerv mich nicht länger!
			};
			AI_StopProcessInfos(self);
		};
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,23,59))
	{
		AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_14");	//Du kommst zu	spät, der Kampf	ist	bereits	vorrüber.
		AI_Output(self,hero,"Info_Arenamaster_NEXTFIGHT_12_15");	//Komm	morgen wieder!
	};
};


instance INFO_ARENAMASTER_AGAIN(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_again_condition;
	information = info_arenamaster_again_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe	mir	den	gestrigen Arenakampf angesehen!";
};


func int info_arenamaster_again_condition()
{
	if((ARENAMASTER_FIRSTDAY < b_getday()) && !ARENAMASTER_FAILED && !Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENAEND_H,ARENAEND_M) && !ARENA_PLAYERHASCOME && !ARENA_PLAYERFIGHT && !ARENA_FIGHTSELECTED)
	{
		return TRUE;
	};
};

func void info_arenamaster_again_info()
{
	AI_Output(hero,self,"Info_Arenamaster_AGAIN_15_01");	//Ich habe	mir	den	gestrigen Arenakampf angesehen!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	};
	ARENAMASTER_FIRSTDAY = b_getday();
	if(ARENA_NPCCOMBOLAST == AC_GRIM_GOLIATH)
	{
		AI_Output(self,hero,"Info_Arenamaster_AGAIN_12_03");	//Grim	und	Goliath	sind noch sehr unerfahren. Aber	vielleicht machen sie sich ja noch.
	}
	else if(ARENA_NPCCOMBOLAST == AC_GOLIATH_BRUTUS)
	{
		AI_Output(self,hero,"Info_Arenamaster_AGAIN_12_04");	//Brutus ist Gewalt pur! Goliath ist zwar stark wie ein Bär, hat aber trotzdem	oft	das	Nachsehen.
	}
	else if(ARENA_NPCCOMBOLAST == AC_BRUTUS_MALGAR)
	{
		AI_Output(self,hero,"Info_Arenamaster_AGAIN_12_05");	//Brutus gegen	Malgar!	Immer spannend!	Stumpfe	Gewalt gegen tödliche Finesse! Dass	die	Finesse	meistens siegt bringt mich immer wieder	zum	Jubeln!
	}
	else if(ARENA_NPCCOMBOLAST == AC_MALGAR_THORA)
	{
		AI_Output(self,hero,"Info_Arenamaster_AGAIN_12_06");	//Dann	hast du	das	echte Finale erlebt. Thora und Malgar sind die besten Kämpfer in der Arena.
	};
};


instance MIL_122_ARENAMASTER_RANKING(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 30;
	condition = mil_122_arenamaster_ranking_condition;
	information = mil_122_arenamaster_ranking_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie sieht die Rangliste aus?";
};


func int mil_122_arenamaster_ranking_condition()
{
	if(Npc_IsInRoutine(self,zs_arenamasterbooth) && ARENAMASTER_ACCEPTED)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_ranking_info()
{
	AI_Output(hero,self,"MIL_122_RANKING_15_01");	//Wie sieht die Rangliste aus?
	b_arena_printrankinglist();
};


instance MIL_122_ARENAMASTER_GLADIATOR(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 30;
	condition = mil_122_arenamaster_gladiator_condition;
	information = mil_122_arenamaster_gladiator_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie bewertest du...";
};


func int mil_122_arenamaster_gladiator_condition()
{
	if(Npc_IsInRoutine(self,zs_arenamasterbooth) && ARENAMASTER_ACCEPTED)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_gladiator_info()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Thora?",mil_122_arenamaster_gladiator_thora);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Malgar?",mil_122_arenamaster_gladiator_malgar);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Brutus?",mil_122_arenamaster_gladiator_brutus);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Goliath?",mil_122_arenamaster_gladiator_goliath);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Grim?",mil_122_arenamaster_gladiator_grim);
	Info_AddChoice(mil_122_arenamaster_gladiator,"...Mich?",mil_122_arenamaster_gladiator_me);
};

func void mil_122_arenamaster_gladiator_me()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_ME_15_01");	//Wie bewertest du mich?
	if(b_arena_getgladiatorranking(7898) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_02");	//Du liegst	auf	dem	letzten	Platz, bist	aber auch erst kürzlich	dazugestossen.
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_03");	//Du wirst dich	schon noch hochkämpfen,	da bin ich mir sicher.
	};
	if(b_arena_getgladiatorranking(7898) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_04");	//Du hast dich auf den fünften Platz hochgearbeitet. Nicht schlecht!
	};
	if(b_arena_getgladiatorranking(7898) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_05");	//Du belegst jetzt schon den vierten Platz.	Mach weiter	so und du wirst	noch ganz an die Spitze	kommen.
	};
	if(b_arena_getgladiatorranking(7898) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_06");	//Du liegst	heute schon	auf	dem	dritten	Platz. Nur noch	zwei Gladiatoren trennen dich vom Titel	des	Champions.
	};
	if(b_arena_getgladiatorranking(7898) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_07");	//Du hast es geschafft,	dich auf den zweiten Platz hochzuarbeiten.
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_08");	//Noch nie habe	ich	einen Gladiator	gesehen, der sich so schnell nach oben gearbeitet hat. Der Titel des Champion ist nun zum Greifen nahe.
	};
	if(b_arena_getgladiatorranking(7898) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_09");	//Du hast es geschafft!	Du bist	der	neue Arena-Champion!
		AI_Output(self,hero,"MIL_122_GLADIATOR_ME_12_10");	//Niemand der anderen Gladiatoren kann deinen Waffenkünsten	paroli bieten. Ich verneige	mich vor dir.
	};
};

func void mil_122_arenamaster_gladiator_grim()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_GRIM_15_01");	//Wie bewertest du Grim?
	if(b_arena_getgladiatorranking(7790) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_02");	//Grim war noch nie gut. Jetzt ist er	sogar auf den letzten Platz	abgerutscht. Ein hoffnungsloser	Fall.
	};
	if(b_arena_getgladiatorranking(7790) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_03");	//Grim behauptet sich	auf	seinem fünften Platz. Er war noch nie gut, aber	zumindest wird er auch nicht schlechter.
	};
	if(b_arena_getgladiatorranking(7790) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_04");	//Grim hat entgegen aller	Erwartungen	auf	den	4 Platz	verbessert.	Es stecken doch	noch Überraschungen	in ihm.
	};
	if(b_arena_getgladiatorranking(7790) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_05");	//Grim überrascht	mich immer mehr. Einst das Schlußlicht,	liegt er heute auf dem dritten Platz.
	};
	if(b_arena_getgladiatorranking(7790) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_06");	//Grim überrascht	das	ganze Lager. Niemand versteht, wie dieser unbegabte	Kämpfer	sich auf Platz 2 hocharbeiten konnte.
	};
	if(b_arena_getgladiatorranking(7790) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GRIM_12_07");	//Grim's sonderbare Wendung ist schon	fast verdächtig. Dieser	nichtsnutzige Gladiator	der	früher keinen Kampf	gewonnen hat ist heute Champion. Wenn ich herausfinde, wer da nachgeholfen hat,	dann gibt es saures!
	};
};

func void mil_122_arenamaster_gladiator_goliath()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_GOLIATH_15_01");	//Wie bewertest du Goliath?
	if(b_arena_getgladiatorranking(7978) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_02");	//Goliath hat nachgelassen. Früher	war	er besser als Grim.	Heute ist er das Schlußlicht.
	};
	if(b_arena_getgladiatorranking(7978) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_03");	//Goliath liegt auf dem fünften Platz.	Früher war er besser, aber am Ende ist er halt doch	nur	ein	einfacher Schmiedegehilfe
	};
	if(b_arena_getgladiatorranking(7978) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_04");	//Goliath hat seinen vierten Platz	gehalten. Ich glaube allerdings	auch nicht,	dass er	sich verbessern	kann.
	};
	if(b_arena_getgladiatorranking(7978) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_05");	//Goliath hat sich	doch tatsächlich auf den dritten Platz vorgeschoben. Das hätte wirklich	niemand	gedacht.
	};
	if(b_arena_getgladiatorranking(7978) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_06");	//Goliath stellt Rätsel auf. Einst	ein	Schmiedegehilfe	auf	dem	vorletzten Platz, heute	schon der Vizechampion.
	};
	if(b_arena_getgladiatorranking(7978) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_GOLIATH_12_07");	//Goliath hat das unmögliche wahrgemacht. Allein mit seinem Schmiedehammer	hat	er sich	selbst zum Championtitel verholfen.
	};
};

func void mil_122_arenamaster_gladiator_brutus()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_BRUTUS_15_01");	//Wie bewertest du Brutus?
	if(b_arena_getgladiatorranking(7717) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_02");	//Brutus war immer ein recht guter Kämpfer.
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_03");	//Das er heute auf dem letzten Platz liegt,	versteht keiner.
	};
	if(b_arena_getgladiatorranking(7717) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_04");	//Brutus hat nachgelassen. Früher drittbester ist er heute auf Platz 5.
	};
	if(b_arena_getgladiatorranking(7717) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_05");	//Brutus liegt heute nur noch auf Platz	4. Offensichtlich ist rohe Gewalt doch nicht alles!
	};
	if(b_arena_getgladiatorranking(7717) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_06");	//Brutus ist und bleibt	die	Nummer drei. Wer in	die	Spitzengruppe aufsteigen will, muß an ihm vorbei.
	};
	if(b_arena_getgladiatorranking(7717) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_07");	//Brutus hat sich doch tatsächlich auf den zweiten Platz hocharbeiten können. Vielleicht steckt	in ihm doch	mehr als rohe Gewalt.
	};
	if(b_arena_getgladiatorranking(7717) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_BRUTUS_12_08");	//Brutus rohe Kampfgewalt hat es geschafft,	selbst so elegante Kämpfer wie Thora und Malgar	in den Schatten	zu stellen.	Eine neue Ära im Arenakampf	bricht an.
	};
};

func void mil_122_arenamaster_gladiator_malgar()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_MALGAR_15_01");	//Wie bewertest du Malgar?
	if(b_arena_getgladiatorranking(7648) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_02");	//Malgar ist am	Ende. Einst	der	zweitbeste,	heute ein Wrack	auf	dem	letzten	Platz der Rangliste.
	};
	if(b_arena_getgladiatorranking(7648) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_03");	//Malgar ist stark nachgelassen. Er	ist	heute auf Platz	5.
	};
	if(b_arena_getgladiatorranking(7648) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_04");	//Malgar hat ganz schön	an Boden verloren. Früher zweitbester, heute nur noch auf Platz	4.
	};
	if(b_arena_getgladiatorranking(7648) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_05");	//Malgar hat an	Boden verloren.	Er muss	sich heute mit den dritten Platz zufrieden geben.
	};
	if(b_arena_getgladiatorranking(7648) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_06");	//Malgar hält souverän den zweiten Platz. Niemand kämpft gegen den Champion, ohne ihn zu besiegen.
	};
	if(b_arena_getgladiatorranking(7648) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_MALGAR_12_07");	//Malgar war schon immer ein fantastischer Kämfper,	heute liegt	er sogar auf Platz 1 und ist damit der neue	Champion.
	};
};

func void mil_122_arenamaster_gladiator_thora()
{
	Info_ClearChoices(mil_122_arenamaster_gladiator);
	AI_Output(hero,self,"MIL_122_GLADIATOR_THORA_15_01");	//Wie bewertest du Thora?
	if(b_arena_getgladiatorranking(7618) == 6)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_02");	//Thora ist hoffnungslos	abgesackt. Einst der Champion, ist sie heute kein Silberstück mehr wert.
	};
	if(b_arena_getgladiatorranking(7618) == 5)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_03");	//Thora ist am Ende.	Wie	konnte der einstige	Champion auf den vorletzten	Platz sinken?
	};
	if(b_arena_getgladiatorranking(7618) == 4)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_04");	//Thora ist gewaltig	abgesackt. Einst der Champion, heute nur noch Mittelmass auf Platz 4.
	};
	if(b_arena_getgladiatorranking(7618) == 3)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_05");	//Thora ist schon lange nicht mehr der Champion.	Heute liegt	sie	nur	noch auf Platz 3.
	};
	if(b_arena_getgladiatorranking(7618) == 2)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_06");	//Thora ist nicht mehr der Champion.	Wahrscheinlich sind	ihre grössten Tage als Gladiator gezählt.
	};
	if(b_arena_getgladiatorranking(7618) == 1)
	{
		AI_Output(self,hero,"MIL_122_GLADIATOR_THORA_12_07");	//Thora ist und bleibt der Champion.	Ihre exotischen	Waffenkünste mit dem Kampfstab suchen ihresgleichen.
	};
};


instance MIL_122_ARENAMASTER_RULES(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 20;
	condition = mil_122_arenamaster_rules_condition;
	information = mil_122_arenamaster_rules_info;
	permanent = FALSE;
	description = "Welche	Regeln gibt	es in der Arena?";
};


func int mil_122_arenamaster_rules_condition()
{
	if(Npc_IsInRoutine(self,zs_arenamasterbooth) && ARENAMASTER_ACCEPTED)
	{
		return TRUE;
	};
};

func int mil_122_arenamaster_rules_info()
{
	AI_Output(hero,self,"MIL_122_RULES_Info_15_01");	//Welche Regeln gibt es in der Arena?
	AI_Output(self,hero,"MIL_122_RULES_Info_12_02");	//Regel Nummer 1 ...
	AI_Output(self,hero,"MIL_122_RULES_Info_12_03");	//KEIN Töten in der Arena!
	AI_Output(self,hero,"MIL_122_RULES_Info_12_04");	//Umhauen	ja,	Töten nein!
	AI_Output(self,hero,"MIL_122_RULES_Info_12_05");	//Regel Nummer 2 ...
	AI_Output(self,hero,"MIL_122_RULES_Info_12_06");	//Weder Bögen, noch Armbrüste	noch Magie in der Arena!
	AI_Output(self,hero,"MIL_122_RULES_Info_12_07");	//Es wird	nur	mit	Nahkampfwaffen gekämpft!
	AI_Output(self,hero,"MIL_122_RULES_Info_12_08");	//Regel Nummer 3 ...
	AI_Output(self,hero,"MIL_122_RULES_Info_12_09");	//Jeder behält seine eigenen Waffen! Solltest	du deinen Gegner umhauen, ist seine	Waffe tabu für dich, ist das klar!
	AI_Output(hero,self,"MIL_122_RULES_Info_15_10");	//Was	passiert, wenn es die Gladiatoren mit den Regeln nicht so genau	nehmen?
	AI_Output(self,hero,"MIL_122_RULES_Info_12_11");	//Regel Nummer 4 : Wer die Regeln	verletzt, verliert den Kampf und das Preisgeld!
	B_LogEntry(CH1_ARENA,"Es	gibt strenge Regeln	für	den	Arenakampf.	Regel 1: Kein Töten	in der Arena,	Regel 2: Weder Bögen, noch Armbrüste in	der	Arena,	 Regel 3: Finger weg von der Waffe des anderen Gladiators,	 Regel 4: Wer die Regeln verletzt verliert den Kampf und das Preisgeld!");
};


instance MIL_122_ARENAMASTER_FLOWCHART(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 30;
	condition = mil_122_arenamaster_flowchart_condition;
	information = mil_122_arenamaster_flowchart_info;
	permanent = FALSE;
	description = "Wie läuft so	ein	Kampf ab?";
};


func int mil_122_arenamaster_flowchart_condition()
{
	if(Npc_IsInRoutine(self,zs_arenamasterbooth) && ARENAMASTER_ACCEPTED)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_flowchart_info()
{
	AI_Output(hero,self,"MIL_122_FLOWCHART_Info_15_01");	//Wie	läuft so ein Kampf ab?
	AI_Output(self,hero,"MIL_122_FLOWCHART_Info_12_02");	//Es wird	solange	gekämpft, bis einer	zu Boden geht!
	AI_Output(self,hero,"MIL_122_FLOWCHART_Info_12_03");	//Wer	den	anderen	umhaut,	gewinnt	einen Punkt.
	AI_Output(self,hero,"MIL_122_FLOWCHART_Info_12_04");	//Es wird	mindestens gekämpft, bis einer 5 Punkte hat, manchmal aber	auch länger.
	AI_Output(hero,self,"MIL_122_FLOWCHART_Info_15_05");	//Wovon hängt	das	ab?
	AI_Output(self,hero,"MIL_122_FLOWCHART_Info_12_06");	//Davon, ob der Kampf	mir	gefällt	oder nicht.
	AI_Output(hero,self,"MIL_122_FLOWCHART_Info_15_07");	//Verstehe!
	AI_Output(self,hero,"MIL_122_FLOWCHART_Info_12_08");	//Werden bis zum Ende	der	Kampfzeit keine	5 Punkte erreicht,	verlieren beide	und	ich	behalte	alle Preisgelder.
	B_LogEntry(CH1_ARENA,"Ein Kampf läuft folgendermassen ab: Es	wird solange gekämpft, bis einer der Gladiatoren zu	Boden geht und damit einen Punkt macht.	Wer	zuerst 5 Punkte hat, hat gewonnen.	Erreicht niemand 5 Punkte,	behält der Arenameister	beide Preisgelder und der Kampf	ist	unentschieden!");
};


instance MIL_122_ARENAMASTER_PLAYERCHEATED(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 1;
	condition = mil_122_arenamaster_playercheated_condition;
	information = mil_122_arenamaster_playercheated_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_122_arenamaster_playercheated_condition()
{
	if((ARENA_PLAYERSTOLEWEAPON || ARENA_PLAYERUSEDMAGIC || ARENA_PLAYERUSEDBOW || ARENA_PLAYERKILLED) && ARENA_FIGHTRUNNING && !ARENA_PLAYERBANNED)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_playercheated_info()
{
	AI_Standup(self);
	if(ARENA_PLAYERSTOLEWEAPON)
	{
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_09");	//DU HAST	REGEL NUMMER 3 VERLETZT.
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_10");	//Finger weg,	von	den	Waffen der anderen Gladiatoren!
	};
	if(ARENA_PLAYERUSEDMAGIC || ARENA_PLAYERUSEDBOW)
	{
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_11");	//DU HAST	REGEL NUMMER 2 VERLETZT.
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_12");	//Weder Fernkampfwaffen noch Magie in	der	Arena!
	};
	if(ARENA_PLAYERKILLED)
	{
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_13");	//DU HAST	REGEL NUMMER 1 VERLETZT.
		AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_14");	//Kein Töten in der Arena!
	};
	AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_15");	//HIERMIT	ERKLÄRE	ICH	DICH ZUM VERLIERER UND VERBANNE	DICH AUS DEN REIHEN	DER	GLADIATOREN.
	AI_Output(hero,self,"MIL_122_PLAYERCHEATED_Info_15_16");	//Aber...
	AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_17");	//Nichts aber! Wer bescheisst	verliert.
	AI_Output(self,hero,"MIL_122_PLAYERCHEATED_Info_12_18");	//REGEL NUMMER 4 !!!
	AI_StopProcessInfos(self);
	ARENAMASTER_OLDATTITUDE = Npc_GetPermAttitude(self,hero);
	b_setattitude(self,ATT_ANGRY);
	ARENA_PLAYERBANNED = TRUE;
};


instance MIL_122_ARENAMASTER_GETPRIZE(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 1;
	condition = mil_122_arenamaster_getprize_condition;
	information = mil_122_arenamaster_getprize_info;
	permanent = TRUE;
	description = "Ich will mein Preisgeld abzuholen!";
};


func int mil_122_arenamaster_getprize_condition()
{
	if(ARENA_PLAYERHASWONTODAY && ARENA_PLAYERPRIZE)
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_getprize_info()
{
	AI_Output(hero,self,"MIL_122_GETPRIZE_Info_15_01");	//Ich will	mein Preisgeld abzuholen
	AI_Output(self,hero,"MIL_122_GETPRIZE_Info_12_02");	//Du hast gut gekämpft!
	AI_Output(self,hero,"MIL_122_GETPRIZE_Info_12_03");	//Hier	ist	dein Preisgeld.	Die	anderthalbfache	Summe, die du gesetzt hast.
	B_GiveInvItems(self,hero,itmi_silver,(ARENA_PLAYERPRIZE * 3) / 2);
	if(!ARENA_PRIZEBEFORE)
	{
		AI_Output(hero,self,"MIL_122_GETPRIZE_Info_15_04");	//Du bekommst doch	von	beiden Kämpfern	die	gleiche	Summe!
		AI_Output(self,hero,"MIL_122_GETPRIZE_Info_12_05");	//Richtig!
		AI_Output(hero,self,"MIL_122_GETPRIZE_Info_15_06");	//Warum bekomme ich dann nicht	den	doppelten Einsatz zurück?
		AI_Output(self,hero,"MIL_122_GETPRIZE_Info_12_07");	//Was glaubst du eigentlich, warum	ich	mir	hier den ganzen	Tag	die	Füsse in den Bauch stehe?
		AI_Output(self,hero,"MIL_122_GETPRIZE_Info_12_08");	//Die Hälfte der Preisgelder wandert in meine Tasche. Davon muss ich auch noch	den	ganzen Arenabetrieb	hier organisieren!
		ARENA_PRIZEBEFORE = TRUE;
	};
	ARENA_PLAYERHASWONTODAY = FALSE;
	ARENA_PLAYERPRIZE = 0;
	if(!ARENA_FIRSTVICTORY)
	{
		B_LogEntry(CH1_ARENA,"Heute habe	ich	den	ersten Sieg	in einem Arenakampf	errungen. Um in	der	Rangliste weiter aufzusteigen brauche ich allerdings noch mehr Siege.");
		ARENA_FIRSTVICTORY = TRUE;
	};
	if((b_arena_getgladiatorranking(7898) == 4) && !ARENA_FIRSTRANK4)
	{
		B_LogEntry(CH1_ARENA,"Mein heutiger Sieg	brachte	mich auf Platz 4 der Rangliste.	Bisher ist mir der Erfolg treu geblieben, hoffentlich ist das auch weiterhin der Fall.");
		ARENA_FIRSTRANK4 = TRUE;
	};
	if((b_arena_getgladiatorranking(7898) == 3) && !ARENA_FIRSTRANK3)
	{
		B_LogEntry(CH1_ARENA,"Der letzte	Kampf hat mich auf den dritten Platz der Rangliste vorgeschoben. Es	geht voran!");
		ARENA_FIRSTRANK3 = TRUE;
	};
	if((b_arena_getgladiatorranking(7898) == 2) && !ARENA_FIRSTRANK2)
	{
		B_LogEntry(CH1_ARENA,"Ab	heute bin ich die Nummer 2 unter den Gladiatoren. Nur noch wenige Siege	trennen	mich vom Titel des Champions!");
		ARENA_FIRSTRANK2 = TRUE;
	};
};


instance MIL_122_ARENAMASTER_STARTFIGHT(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 20;
	condition = mil_122_arenamaster_startfight_condition;
	information = mil_122_arenamaster_startfight_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_122_arenamaster_startfight_condition()
{
	if(ARENAMASTER_STARTFIGHT && ARENA_GATESCLOSED && Npc_IsOnFP(self,"MASTER") && Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_startfight_info()
{
	AI_Wait(self,1);
	b_arena_proclaimstart(self);
	AI_Wait(self,1);
	ARENAMASTER_STARTFIGHT = FALSE;
	AI_StopProcessInfos(self);
};


instance INFO_ARENAMASTER_CHALLENGEDGRIM(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_challengedgrim_condition;
	information = info_arenamaster_challengedgrim_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe Grim herausgefordert!";
};


func int info_arenamaster_challengedgrim_condition()
{
	if(ARENAMASTER_ACCEPTED && GRIM_CHALLENGED && !ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && !ARENA_NPCFIGHT)
	{
		return TRUE;
	};
};

func void info_arenamaster_challengedgrim_info()
{
	AI_Output(hero,self,"Info_Arenamaster_CHALLENGEDGRIM_15_01");	//Ich	habe Grim herausgefordert!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGRIM_12_03");	//OK,	wieviel	Preisgeld möchtest du setzen?
		Info_ClearChoices(info_arenamaster_challengedgrim);
		Info_AddChoice(info_arenamaster_challengedgrim,b_buildprizestring(GRIM_PRIZE_3),info_arenamaster_challengedgrim_prize3);
		Info_AddChoice(info_arenamaster_challengedgrim,b_buildprizestring(GRIM_PRIZE_2),info_arenamaster_challengedgrim_prize2);
		Info_AddChoice(info_arenamaster_challengedgrim,b_buildprizestring(GRIM_PRIZE_1),info_arenamaster_challengedgrim_prize1);
	}
	else if(Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTSELECTED_12_00");	//Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}
	else if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTRUNNING_12_00");	//Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,0,0))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTOVER_12_00");	//Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_challengedgrim_prize(var int prize)
{
	Info_ClearChoices(info_arenamaster_challengedgrim);
	if(Npc_HasItems(hero,itmi_silver) >= prize)
	{
		B_GiveInvItems(hero,self,itmi_silver,prize);
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_01");	//Gut, du trittst also heute abend gegen Grim an!
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_02");	//Finde	dich bei Beginn	des	Vorprogramms in	der	linken Arenakammer ein.
		ARENA_PLAYERPRIZE = prize;
		ARENA_PLAYERFIGHT = TRUE;
		ARENA_PLAYERHASCOME = FALSE;
		if(!ARENA_FIRSTCHALLENGE)
		{
			B_LogEntry(CH1_ARENA,"Ich habe einen	der	Gladiatoren	zu meinem ersten Arenakampf	herausgefordert. Heute abend wird sich zeigen, wie gut ich wirklich	bin!");
			ARENA_FIRSTCHALLENGE = TRUE;
		};
	}
	else
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_03");	//Besorge dir erst	mal	ausreichend	Silber.	Ohne Preisgeld gibt	es keinen Kampf!
	};
};

func void info_arenamaster_challengedgrim_prize1()
{
	info_arenamaster_challengedgrim_prize(GRIM_PRIZE_1);
};

func void info_arenamaster_challengedgrim_prize2()
{
	info_arenamaster_challengedgrim_prize(GRIM_PRIZE_2);
};

func void info_arenamaster_challengedgrim_prize3()
{
	info_arenamaster_challengedgrim_prize(GRIM_PRIZE_3);
};


instance INFO_ARENAMASTER_CHALLENGEDGOLIATH(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_challengedgoliath_condition;
	information = info_arenamaster_challengedgoliath_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe	Goliath	herausgefordert!";
};


func int info_arenamaster_challengedgoliath_condition()
{
	if(ARENAMASTER_ACCEPTED && GOLIATH_CHALLENGED && !ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && !ARENA_NPCFIGHT)
	{
		return TRUE;
	};
};

func void info_arenamaster_challengedgoliath_info()
{
	AI_Output(hero,self,"Info_Arenamaster_CHALLENGEDGOLIATH_15_01");	//Ich habe	Goliath	herausgefordert!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGOLIATH_12_03");	//Wieviel Silber möchtest du als Preisgeld	setzen?
		Info_ClearChoices(info_arenamaster_challengedgoliath);
		Info_AddChoice(info_arenamaster_challengedgoliath,b_buildprizestring(GOLIATH_PRIZE_3),info_arenamaster_challengedgoliath_prize3);
		Info_AddChoice(info_arenamaster_challengedgoliath,b_buildprizestring(GOLIATH_PRIZE_2),info_arenamaster_challengedgoliath_prize2);
		Info_AddChoice(info_arenamaster_challengedgoliath,b_buildprizestring(GOLIATH_PRIZE_1),info_arenamaster_challengedgoliath_prize1);
	}
	else if(Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTSELECTED_12_00");	//Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}
	else if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTRUNNING_12_00");	//Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,0,0))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTOVER_12_00");	//Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_challengedgoliath_prize(var int prize)
{
	Info_ClearChoices(info_arenamaster_challengedgoliath);
	if(Npc_HasItems(hero,itmi_silver) >= prize)
	{
		B_GiveInvItems(hero,self,itmi_silver,prize);
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_01");	//Schön,	schön. Du und Goliath also!
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_02");	//Gehe bei Beginn des Vorprogramms in die rechte	Arenakammer	und	sei	bereit wenn	der	Kampf beginnt.
		ARENA_PLAYERPRIZE = prize;
		ARENA_PLAYERFIGHT = TRUE;
		ARENA_PLAYERHASCOME = FALSE;
	}
	else
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_03");	//Kein Silber, kein	Kampf! Komm	wieder,	wenn du	genug davon	hast.
	};
};

func void info_arenamaster_challengedgoliath_prize1()
{
	info_arenamaster_challengedgoliath_prize(GOLIATH_PRIZE_1);
};

func void info_arenamaster_challengedgoliath_prize2()
{
	info_arenamaster_challengedgoliath_prize(GOLIATH_PRIZE_2);
};

func void info_arenamaster_challengedgoliath_prize3()
{
	info_arenamaster_challengedgoliath_prize(GOLIATH_PRIZE_3);
};


instance INFO_ARENAMASTER_CHALLENGEDBRUTUS(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_challengedbrutus_condition;
	information = info_arenamaster_challengedbrutus_info;
	important = FALSE;
	permanent = TRUE;
	description = "Brutus wird gegen mich antreten!";
};


func int info_arenamaster_challengedbrutus_condition()
{
	if(ARENAMASTER_ACCEPTED && BRUTUS_CHALLENGED && !ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && !ARENA_NPCFIGHT)
	{
		return TRUE;
	};
};

func void info_arenamaster_challengedbrutus_info()
{
	AI_Output(hero,self,"Info_Arenamaster_CHALLENGEDBRUTUS_15_01");	//Brutus wird gegen	mich antreten!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		if(!BRUTUS_CHALLENGEDBEFORE)
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_12_03");	//Du bist in kurzer Zeit sehr gut geworden!
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_12_04");	//Brutus ist normalerweise	sehr wählerisch, wenn es um	neue Gladiatoren geht!
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_12_05");	//Aber	sei	vorsichtig.	Du bist	bisher noch	nicht gegen	einen Gegner dieser	Brutalität angetreten.
			BRUTUS_CHALLENGEDBEFORE = TRUE;
		};
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_12_06");	//Wie hoch	ist	dein Preisgeld gegen Brutus?
		Info_ClearChoices(info_arenamaster_challengedbrutus);
		Info_AddChoice(info_arenamaster_challengedbrutus,b_buildprizestring(BRUTUS_PRIZE_3),info_arenamaster_challengedbrutus_prize3);
		Info_AddChoice(info_arenamaster_challengedbrutus,b_buildprizestring(BRUTUS_PRIZE_2),info_arenamaster_challengedbrutus_prize2);
		Info_AddChoice(info_arenamaster_challengedbrutus,b_buildprizestring(BRUTUS_PRIZE_1),info_arenamaster_challengedbrutus_prize1);
	}
	else if(Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTSELECTED_12_00");	//Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}
	else if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTRUNNING_12_00");	//Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,0,0))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTOVER_12_00");	//Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_challengedbrutus_prize(var int prize)
{
	Info_ClearChoices(info_arenamaster_challengedbrutus);
	if(Npc_HasItems(hero,itmi_silver) >= prize)
	{
		B_GiveInvItems(hero,self,itmi_silver,prize);
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_01");	//Dann wirst du heute	abend also gegen Brutus	kämpfen!
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_02");	//Ich	wünsch dir viel	Glück, du wirst	es brauchen!
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_03");	//Benutze	die	linke Arenavorkammer für deine Kampfvorbereitung!
		ARENA_PLAYERPRIZE = prize;
		ARENA_PLAYERFIGHT = TRUE;
		ARENA_PLAYERHASCOME = FALSE;
	}
	else
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_04");	//Ich kann dich nur kämpfen lassen, wenn	du genug Silber	für	das	Preisgeld hast!
	};
};

func void info_arenamaster_challengedbrutus_prize1()
{
	info_arenamaster_challengedbrutus_prize(BRUTUS_PRIZE_1);
};

func void info_arenamaster_challengedbrutus_prize2()
{
	info_arenamaster_challengedbrutus_prize(BRUTUS_PRIZE_2);
};

func void info_arenamaster_challengedbrutus_prize3()
{
	info_arenamaster_challengedbrutus_prize(BRUTUS_PRIZE_3);
};


instance INFO_ARENAMASTER_CHALLENGEDMALGAR(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_challengedmalgar_condition;
	information = info_arenamaster_challengedmalgar_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich werde gegen Malgar kämpfen!";
};


func int info_arenamaster_challengedmalgar_condition()
{
	if(ARENAMASTER_ACCEPTED && MALGAR_CHALLENGED && !ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && !ARENA_NPCFIGHT)
	{
		return TRUE;
	};
};

func void info_arenamaster_challengedmalgar_info()
{
	AI_Output(hero,self,"Info_Arenamaster_CHALLENGEDMALGAR_15_01");	//Ich werde	gegen Malgar kämpfen!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		if(!MALGAR_CHALLENGEDBEFORE)
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_12_03");	//Oho.... Ich hoffe du	weist, worauf du dich da einlässt.
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_12_04");	//Malgar ist einer	der	gefährlichsten Männer die ich kenne.
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_12_05");	//Er redet	zwar nicht viel, aber er ist blitzschnell und tödlich.
			MALGAR_CHALLENGEDBEFORE = TRUE;
		};
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_12_06");	//Nun gut,	wieviel	Preisgeld möchtest du setzen?
		Info_ClearChoices(info_arenamaster_challengedmalgar);
		Info_AddChoice(info_arenamaster_challengedmalgar,b_buildprizestring(MALGAR_PRIZE_3),info_arenamaster_challengedmalgar_prize3);
		Info_AddChoice(info_arenamaster_challengedmalgar,b_buildprizestring(MALGAR_PRIZE_2),info_arenamaster_challengedmalgar_prize2);
		Info_AddChoice(info_arenamaster_challengedmalgar,b_buildprizestring(MALGAR_PRIZE_1),info_arenamaster_challengedmalgar_prize1);
	}
	else if(Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTSELECTED_12_00");	//Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}
	else if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTRUNNING_12_00");	//Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,0,0))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTOVER_12_00");	//Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_challengedmalgar_prize(var int prize)
{
	Info_ClearChoices(info_arenamaster_challengedmalgar);
	if(Npc_HasItems(hero,itmi_silver) >= prize)
	{
		B_GiveInvItems(hero,self,itmi_silver,prize);
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_01");	//Wie	du willst. Dann	findet der heutige Kampf zwischen dir und Malgar statt
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_02");	//Diesmal	ist	die	rechte Arenavorkammer deine.
		ARENA_PLAYERPRIZE = prize;
		ARENA_PLAYERFIGHT = TRUE;
		ARENA_PLAYERHASCOME = FALSE;
	}
	else
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_03");	//Hör zu, du	musst das Silber für das Preisgeld schon dabeihaben, sonst kann	ich	dich für heute abend nicht aufstellen!
	};
};

func void info_arenamaster_challengedmalgar_prize1()
{
	info_arenamaster_challengedmalgar_prize(MALGAR_PRIZE_1);
};

func void info_arenamaster_challengedmalgar_prize2()
{
	info_arenamaster_challengedmalgar_prize(MALGAR_PRIZE_2);
};

func void info_arenamaster_challengedmalgar_prize3()
{
	info_arenamaster_challengedmalgar_prize(MALGAR_PRIZE_3);
};


instance INFO_ARENAMASTER_CHALLENGEDTHORA(C_Info)
{
	npc = mil_122_arenamaster;
	condition = info_arenamaster_challengedthora_condition;
	information = info_arenamaster_challengedthora_info;
	important = FALSE;
	permanent = TRUE;
	description = "Thora hat meine Herausforderung angenommen!";
};


func int info_arenamaster_challengedthora_condition()
{
	if(ARENAMASTER_ACCEPTED && THORA_CHALLENGED && !ARENA_PLAYERFIGHT && !ARENA_PLAYERHASWONTODAY && !ARENA_NPCFIGHT)
	{
		return TRUE;
	};
};

func void info_arenamaster_challengedthora_info()
{
	AI_Output(hero,self,"Info_Arenamaster_CHALLENGEDTHORA_15_01");	//Thora hat meine Herausforderung angenommen!
	if(Npc_IsInRoutine(self,zs_arenamastersleep))
	{
		AI_Output(self,hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		if(!THORA_CHALLENGEDBEFORE)
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_12_03");	//Lass dich	von	ihr	nicht täuschen.
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_12_04");	//In der Arena kennt sie kein Erbarmen und sie ist viel	stärker, als sie aussieht.
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_12_05");	//Dann spürst du nur noch die harten Enden ihres Kampfstabes überall auf deinem	Körper.
		};
		if(!THORA_PLAYERWONBEFORE)
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_12_06");	//Denk daran: Thora	ist	der	ungeschlagene Champion.	Nimm den Kampf nicht auf die leichte Schulter!
		};
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_12_07");	//Wie hoch soll	dein Einsatz sein?
		Info_ClearChoices(info_arenamaster_challengedthora);
		Info_AddChoice(info_arenamaster_challengedthora,b_buildprizestring(THORA_PRIZE_3),info_arenamaster_challengedthora_prize3);
		Info_AddChoice(info_arenamaster_challengedthora,b_buildprizestring(THORA_PRIZE_2),info_arenamaster_challengedthora_prize2);
		Info_AddChoice(info_arenamaster_challengedthora,b_buildprizestring(THORA_PRIZE_1),info_arenamaster_challengedthora_prize1);
	}
	else if(Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTSELECTED_12_00");	//Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
	}
	else if(Wld_IsTime(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTRUNNING_12_00");	//Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(ARENAEND_H,ARENAEND_M,0,0))
	{
		AI_Output(self,hero,"OUMULTI_FIGHTOVER_12_00");	//Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_StopProcessInfos(self);
	};
};

func void info_arenamaster_challengedthora_prize(var int prize)
{
	Info_ClearChoices(info_arenamaster_challengedthora);
	if(Npc_HasItems(hero,itmi_silver) >= prize)
	{
		B_GiveInvItems(hero,self,itmi_silver,prize);
		if(b_arena_getgladiatorranking(7618) == 1)
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_01");	//Du hast dich	entschieden! Heute abend trittst du	gegen den Champion an!
		}
		else
		{
			AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_02");	//hast	dich entschieden! Heute	abend kämpfst du gegen Thora!
		};
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_03");	//Nimm	die	linke Arenavorkammer, und lass Thora in	der	Vorbereitungszeit in Ruhe.
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_04");	//Auf Störungen in	dieser Zeit	reagiert sie äusserst ungehalten.
		ARENA_PLAYERPRIZE = prize;
		ARENA_PLAYERFIGHT = TRUE;
		ARENA_PLAYERHASCOME = FALSE;
	}
	else
	{
		AI_Output(self,hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_05");	//Zu wenig Silber! Ohne Preisgeld	werde ich dich nicht aufstellen. Champion-Kampf	hin	oder her!
	};
};

func void info_arenamaster_challengedthora_prize1()
{
	info_arenamaster_challengedthora_prize(THORA_PRIZE_1);
};

func void info_arenamaster_challengedthora_prize2()
{
	info_arenamaster_challengedthora_prize(THORA_PRIZE_2);
};

func void info_arenamaster_challengedthora_prize3()
{
	info_arenamaster_challengedthora_prize(THORA_PRIZE_3);
};


instance MIL_122_ARENAMASTER_GREETCHAMPION(C_Info)
{
	npc = mil_122_arenamaster;
	nr = 10;
	condition = mil_122_arenamaster_greetchampion_condition;
	information = mil_122_arenamaster_greetchampion_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_122_arenamaster_greetchampion_condition()
{
	if(c_npcisinvincible(hero) && (b_arena_getgladiatorranking(7898) == 1))
	{
		return TRUE;
	};
};

func void mil_122_arenamaster_greetchampion_info()
{
	AI_Output(self,hero,"MIL_122_GREETCHAMPION_12_01");	//CHAMPION, ich grüsse dich!
};

