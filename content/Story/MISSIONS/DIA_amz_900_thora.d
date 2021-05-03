
instance AMZ_900_THORA_EXIT(C_Info)
{
	npc = amz_900_thora;
	nr = 999;
	condition = amz_900_thora_exit_condition;
	information = amz_900_thora_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int amz_900_thora_exit_condition()
{
	return TRUE;
};

func void amz_900_thora_exit_info()
{
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_GREETING(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_greeting_condition;
	information = amz_900_thora_greeting_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_greeting_condition()
{
	if(SUBCHAPTER < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void amz_900_thora_greeting_info()
{
	AI_Output(self,hero,"AMZ_900_GREETING_16_01");	//Verdammt, woher kommst du so plötzlich? Wer bist du?
	AI_Output(self,hero,"AMZ_900_GREETING_16_02");	//Beinahe hätte ich Dich niedergeschlagen!
	Npc_ExchangeRoutine(self,"ArenaWait");
};


instance AMZ_900_THORA_WHO(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_who_condition;
	information = amz_900_thora_who_info;
	important = FALSE;
	permanent = FALSE;
	description = "Immer langsam! Sag mir doch erstmal wer du bist.";
};


func int amz_900_thora_who_condition()
{
	if(!Npc_KnowsInfo(hero,amz_900_thora_training) && (SUBCHAPTER < CH1_ARRIVED_AT_OC))
	{
		return TRUE;
	};
};

func void amz_900_thora_who_info()
{
	AI_Output(hero,self,"AMZ_900_Thora_WHO_Info_15_01");	//Immer langsam! Sag mir doch erstmal wer du bist.
	AI_Output(self,hero,"AMZ_900_Thora_WHO_Info_16_02");	//Ich bin Thora. Und ich frage mich, wo du so plötzlich herkommst!
	Info_AddChoice(amz_900_thora_who,"Ich bin vom Himmel gefallen!",amz_900_thora_who_sky);
	Info_AddChoice(amz_900_thora_who,"Das kann ich dir leider nicht sagen.",amz_900_thora_who_cantsay);
};

func void amz_900_thora_who_sky()
{
	AI_Output(hero,self,"AMZ_900_Thora_WHO_SKY_Info_15_01");	//Ich bin vom Himmel gefallen!
	AI_Output(self,hero,"AMZ_900_Thora_WHO_SKY_Info_16_02");	//Wirklich wahr? Dann sieh mal zu, daß du wieder heil nach oben kommst, mein Vögelchen!
	AI_Output(self,hero,"AMZ_900_Thora_WHO_SKY_Info_16_03");	//Und falls du mal wieder landest, solltest du etwas freundlicher sein!
	Info_ClearChoices(amz_900_thora_who);
	AI_StopProcessInfos(self);
};

func void amz_900_thora_who_cantsay()
{
	AI_Output(hero,self,"AMZ_900_Thora_WHO_CANTSAY_Info_15_01");	//Das kann ich dir leider nicht sagen.
	AI_Output(self,hero,"AMZ_900_Thora_WHO_CANTSAY_Info_16_02");	//Das war doch ein Teleport-Zauber, aber wie ein Magier siehst du nicht gerade aus.
	Info_ClearChoices(amz_900_thora_who);
	Info_AddChoice(amz_900_thora_who,"Beurteilst du jeden nach dem Äusseren?",amz_900_thora_who_judge);
};

func void amz_900_thora_who_judge()
{
	AI_Output(other,self,"AMZ_900_Thora_WHO_JUDGE_Info_15_01");	//Beurteilst du jeden nach dem Äusseren?
	AI_Output(self,other,"AMZ_900_Thora_WHO_JUDGE_Info_16_02");	//Nicht jeden. Nur die, die nichts zu sagen haben!
	AI_Output(self,other,"AMZ_900_Thora_WHO_JUDGE_Info_16_03");	//Was hast du denn hier vor?
	Info_AddChoice(amz_900_thora_who,"Sagst du mir auch, was Du hier machst?",amz_900_thora_who_what);
	Info_AddChoice(amz_900_thora_who,"Was ich hier vorhabe, kann ich dir nicht erzählen.",amz_900_thora_who_secret);
	Info_AddChoice(amz_900_thora_who,"Ich will ins Lager.",amz_900_thora_who_whatelse);
};

func void amz_900_thora_who_what()
{
	AI_Output(other,self,"AMZ_900_Thora_WHO_WHAT_Info_15_01");	//Sagst du mir auch, was Du hier machst?
	AI_Output(self,other,"AMZ_900_Thora_WHO_WHAT_Info_16_02");	//...also gerade versuche ich etwas über dich zu erfahren.
	AI_Output(other,self,"AMZ_900_Thora_WHO_WHAT_Info_15_03");	//und sonst?
	AI_Output(self,other,"AMZ_900_Thora_WHO_WHAT_Info_16_04");	//Ich bin Kämpferin.
	Info_AddChoice(amz_900_thora_who,"Eine Frau als Kämpferin?",amz_900_thora_who_fighter);
};

func void amz_900_thora_who_secret()
{
	AI_Output(hero,self,"AMZ_900_Thora_WHO_SECRET_Info_15_01");	//Was ich hier vorhabe, kann ich dir nicht erzählen.
	AI_Output(self,hero,"AMZ_900_Thora_WHO_SECRET_Info_16_02");	//Na dann!
	Info_ClearChoices(amz_900_thora_who);
	AI_StopProcessInfos(self);
};

func void amz_900_thora_who_whatelse()
{
	AI_Output(other,self,"AMZ_900_Thora_WHO_WHATELSE_Info_15_01");	//Ich will ins Lager.
	AI_Output(self,other,"AMZ_900_Thora_WHO_WHATELSE_Info_16_02");	//Das hast du schon fast geschafft. Da hinten ist es.
	Info_ClearChoices(amz_900_thora_who);
};

func void amz_900_thora_who_fighter()
{
	AI_Output(other,self,"AMZ_900_Thora_WHO_FIGHTER_Info_15_01");	//Eine Frau als Kämpferin?
	AI_Output(self,other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_02");	//Auch Du solltest nicht nach dem Äusseren urteilen.
	AI_Output(self,other,"AMZ_900_Thora_WHO_FIGHTER_Info_16_03");	//Einige hier mussten das erst schmerzvoll lernen!
};


instance AMZ_900_THORA_TRAINING(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_training_condition;
	information = amz_900_thora_training_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich bin hier um zu trainieren und zu lernen.";
};


func int amz_900_thora_training_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_who) && (Npc_GetDistToWP(self,THORA_WP_OUT) < 300) && !Wld_IsTime(THORA_OUT_H,THORA_OUT_M + 30,THORA_IN_H,THORA_IN_M))
	{
		return TRUE;
	};
};

func void amz_900_thora_training_info()
{
	AI_Output(other,self,"AMZ_900_Thora_TRAINING_Info_15_01");	//Ich bin hier um zu trainieren und zu lernen.
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_Info_16_02");	//Sieht so aus, als ob du das auch nötig hast!
	Info_ClearChoices(amz_900_thora_training);
	Info_AddChoice(amz_900_thora_training,"Mit dir werde ich auch ohne Training fertig!",amz_900_thora_training_hostile);
	Info_AddChoice(amz_900_thora_training,"Wer hat dich denn um deine Meinung gefragt?",amz_900_thora_training_angry);
	Info_AddChoice(amz_900_thora_training,"Ich war wirklich schon mal besser in Form.",amz_900_thora_training_friendly);
};

func void amz_900_thora_training_friendly()
{
	AI_Output(other,self,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_15_01");	//Ich war wirklich schon mal besser in Form.
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_02");	//Im Lager gibt es viel zu lernen. Du kannst dich sicher irgendwo nützlich machen!
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_FRIENDLY_Info_16_03");	//Ich muß los, wir sehen uns bestimmt später noch.
	AI_StopProcessInfos(self);
};

func void amz_900_thora_training_angry()
{
	AI_Output(other,self,"AMZ_900_Thora_TRAINING_ANGRY_Info_15_01");	//Wer hat dich denn um deine Meinung gefragt?
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_02");	//Du scheinst einen schlechten Tag zu haben.
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_ANGRY_Info_16_03");	//Wenn du mal Hilfe brauchst, solltest du etwas freundlicher sein!
	AI_StopProcessInfos(self);
};

func void amz_900_thora_training_hostile()
{
	AI_Output(other,self,"AMZ_900_Thora_TRAINING_HOSTILE_Info_15_01");	//Mit dir werde ich auch ohne Training fertig!
	AI_Output(self,other,"AMZ_900_Thora_TRAINING_HOSTILE_Info_16_02");	//Tatsächlich? Dann zeig doch mal, was du kannst!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance AMZ_900_THORA_NOTENOUGH(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_notenough_condition;
	information = amz_900_thora_notenough_info;
	important = TRUE;
	permanent = TRUE;
};


func int amz_900_thora_notenough_condition()
{
	if(self.aivar[13] && (Npc_GetDistToWP(self,"OCR_ARENABATTLE_BENCH") >= 500) && !Npc_KnowsInfo(hero,amz_900_thora_gladiator) && c_npcisinvincible(hero) && (SUBCHAPTER < CH1_ARRIVED_AT_OC))
	{
		return TRUE;
	};
};

func void amz_900_thora_notenough_info()
{
	AI_Output(self,hero,"AMZ_900_NOTENOUGH_16_01");	//(fröhlich) Na, ich kämpfe nicht so schlecht, oder?
	Info_AddChoice(amz_900_thora_notenough,"Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!",amz_900_thora_notenough_yes);
	Info_AddChoice(amz_900_thora_notenough,"Stimmt. Wirklich nicht so schlecht!",amz_900_thora_notenough_no);
};

func void amz_900_thora_notenough_no()
{
	AI_Output(hero,self,"AMZ_900_NOTENOUGH_NO_15_01");	//Stimmt. Wirklich nicht so schlecht!
	AI_Output(self,hero,"AMZ_900_NOTENOUGH_NO_16_02");	//(freundlich) Na dann, bis später!
	Info_ClearChoices(amz_900_thora_notenough);
	amz_900_thora_notenough.permanent = FALSE;
	AI_StopProcessInfos(self);
};

func void amz_900_thora_notenough_yes()
{
	AI_Output(hero,self,"AMZ_900_NOTENOUGH_YES_15_01");	//Ich hab dich gewinnen lassen. Hab garnicht richtig zugeschlagen!
	AI_Output(self,hero,"AMZ_900_NOTENOUGH_YES_16_02");	//Na wenn das so ist... tu das besser jetzt, sonst schluckst du nochmal Staub!
	Info_ClearChoices(amz_900_thora_notenough);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};


instance AMZ_900_THORA_SEEYA(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_seeya_condition;
	information = amz_900_thora_seeya_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wohin gehst du?";
};


func int amz_900_thora_seeya_condition()
{
	if(Npc_IsInRoutine(self,ZS_SitAround) && (Npc_GetDistToWP(self,"OCR_ARENABATTLE_BENCH") >= 500) && (Npc_GetDistToWP(self,THORA_WP_OUT) >= 500) && !Npc_KnowsInfo(hero,amz_900_thora_gladiator) && Npc_KnowsInfo(hero,amz_900_thora_who))
	{
		return TRUE;
	};
};

func void amz_900_thora_seeya_info()
{
	AI_Output(hero,self,"AMZ_900_SEEYA_15_01");	//Wohin gehst du?
	AI_Output(self,hero,"AMZ_900_SEEYA_16_02");	//Zur Arena. Ich kämpfe dort. Tagsüber bin ich meistens da.
};


instance AMZ_900_THORA_WHERENIGHT(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_wherenight_condition;
	information = amz_900_thora_wherenight_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und wo bist du... nachts?";
};


func int amz_900_thora_wherenight_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_seeya))
	{
		return TRUE;
	};
};

func void amz_900_thora_wherenight_info()
{
	AI_Output(hero,self,"AMZ_900_WHERENIGHT_15_01");	//Und wo bist du... nachts?
	AI_Output(self,hero,"AMZ_900_WHERENIGHT_16_02");	//(Lacht) Du bist zwar schlecht in Form, aber dafür ganz schön dreist!
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_HEYWAIT(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_heywait_condition;
	information = amz_900_thora_heywait_info;
	important = FALSE;
	permanent = TRUE;
	description = "Warte mal!";
};


func int amz_900_thora_heywait_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_wherenight) && (Npc_GetDistToWP(self,"OCR_ARENABATTLE_BENCH") >= 500) && (Npc_GetDistToWP(self,THORA_WP_OUT) >= 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_heywait_info()
{
	AI_Output(hero,self,"AMZ_900_HEYWAIT_15_01");	//Warte mal!
	AI_Output(self,hero,"AMZ_900_HEYWAIT_16_02");	//(fröhlich) Wir sehen uns später!
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_NIGHT(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_night_condition;
	information = amz_900_thora_night_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was tust du hier draussen?";
};


func int amz_900_thora_night_condition()
{
	if(Wld_IsTime(THORA_OUT_H,THORA_OUT_M + 30,THORA_IN_H,THORA_IN_M) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func void amz_900_thora_night_info()
{
	AI_Output(hero,self,"AMZ_900_NIGHT_15_01");	//Was tust du hier draussen?
	AI_Output(self,hero,"AMZ_900_NIGHT_16_02");	//Ich betrachte die Sterne. Sie sind erfüllt von der Macht des Feuers.
	AI_Output(self,hero,"AMZ_900_NIGHT_16_03");	//Das Feuer bestimmt mein Schicksal, so wie es das der Sterne bestimmt.
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_NIGHTAGAIN(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_nightagain_condition;
	information = amz_900_thora_nightagain_info;
	important = FALSE;
	permanent = TRUE;
	description = "Betrachtest du immer noch die Sterne?";
};


func int amz_900_thora_nightagain_condition()
{
	if(amz_900_thora_night_condition() && Npc_KnowsInfo(hero,amz_900_thora_night) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func void amz_900_thora_nightagain_info()
{
	AI_Output(hero,self,"AMZ_900_NIGHTAGAIN_15_01");	//Betrachtest du immer noch die Sterne?
	AI_Output(self,hero,"AMZ_900_NIGHTAGAIN_16_02");	//Die Sterne reflektieren das Feuer in mir. Ich liebe die Sterne.
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_MYWEAPON(C_Info)
{
	npc = amz_900_thora;
	nr = 1;
	condition = amz_900_thora_myweapon_condition;
	information = amz_900_thora_myweapon_info;
	important = TRUE;
	permanent = TRUE;
};


func int amz_900_thora_myweapon_condition()
{
	if(Npc_HasItems(hero,itmw_thora_battlestaff))
	{
		if(ARENA_FIGHTRUNNING && ARENA_PLAYERFIGHT && THORA_CHALLENGED && !ARENA_PLAYERSTOLEWEAPON)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func int amz_900_thora_myweapon_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"AMZ_900_MYWEAPON_Info_16_01");	//(wütend) Gib mir den Kampfstab!
	Info_ClearChoices(amz_900_thora_myweapon);
	Info_AddChoice(amz_900_thora_myweapon,"Ich glaube, ich behalte ihn lieber.",amz_900_thora_myweapon_taken);
	Info_AddChoice(amz_900_thora_myweapon,"Hier hast du das Ding zurück!",amz_900_thora_myweapon_giveback);
};

func void amz_900_thora_myweapon_giveback()
{
	Info_ClearChoices(amz_900_thora_myweapon);
	AI_Output(hero,self,"AMZ_900_MYWEAPON_GIVEBACK_15_01");	//Hier hast du das Ding zurück!
	B_GiveInvItems(hero,self,itmw_thora_battlestaff,1);
	AI_Output(self,hero,"AMZ_900_MYWEAPON_GIVEBACK_16_02");	//Dann zeig mal, ob du noch was anderes drauf hast, ausser Waffenstehlen.
	AI_StopProcessInfos(self);
};

func void amz_900_thora_myweapon_taken()
{
	Info_ClearChoices(amz_900_thora_myweapon);
	AI_Output(hero,self,"AMZ_900_MYWEAPON_TAKEN_15_01");	//Ich glaube, ich behalte ihn lieber.
	AI_Output(self,hero,"AMZ_900_MYWEAPON_TAKEN_16_02");	//(wütender) Du kannst dich nicht mal in der Arena an die Regeln halten!
	AI_StopProcessInfos(self);
	b_arena_abortfight(AF_PLAYERSTOLEWEAPON);
};


instance AMZ_900_THORA_CHALLENGED(C_Info)
{
	npc = amz_900_thora;
	nr = 2;
	condition = amz_900_thora_challenged_condition;
	information = amz_900_thora_challenged_info;
	important = TRUE;
	permanent = TRUE;
};


func int amz_900_thora_challenged_condition()
{
	if(THORA_CHALLENGED && ARENA_PLAYERFIGHT && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void amz_900_thora_challenged_info()
{
	if(Wld_IsTime(0,0,ARENABEGIN_H,ARENABEGIN_M))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self,hero,"AMZ_900_CHALLENGED_16_01");	//Bin gespannt, was du draufhast.
			AI_Output(self,hero,"AMZ_900_CHALLENGED_16_02");	//Wir sehen uns heute Abend in der Arena!
		}
		else
		{
			AI_Output(self,hero,"AMZ_900_CHALLENGED_16_03");	//Das ist MEINE Vorbereitungskammer.
			b_attackproper(self,hero);
		};
		AI_StopProcessInfos(self);
		return;
	};
	if(Npc_IsInRoutine(self,zs_arenafight))
	{
		AI_Output(self,hero,"AMZ_900_CHALLENGED_16_04");	//Bist du nervös, oder warum redest du soviel?
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self,hero,"MIL_121_CHALLENGED_16_05");	//Wir sehen uns in der Arena. Morgen Abend!
		AI_StopProcessInfos(self);
		return;
	};
};


instance AMZ_900_THORA_PRENPC(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_prenpc_condition;
	information = amz_900_thora_prenpc_info;
	important = TRUE;
	permanent = TRUE;
};


func int amz_900_thora_prenpc_condition()
{
	if(ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_MALGAR_THORA) && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void amz_900_thora_prenpc_info()
{
	AI_Output(self,hero,"AMZ_900_PRENPC_16_01");	//Du hast in meiner Vorbereitungskammer nichts zu suchen. Verschwinde!
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_GLADIATOR(C_Info)
{
	npc = amz_900_thora;
	nr = 5;
	condition = amz_900_thora_gladiator_condition;
	information = amz_900_thora_gladiator_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du kämpfst in der Arena?";
};


func int amz_900_thora_gladiator_condition()
{
	if((Npc_GetDistToWP(self,"OCR_ARENABATTLE_BENCH") < 500) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func int amz_900_thora_gladiator_info()
{
	AI_Output(hero,self,"AMZ_900_GLADIATOR_15_01");	//(ungläubig) Du kämpfst in der Arena?
	if(self.aivar[13])
	{
		AI_Output(self,hero,"AMZ_900_GLADIATOR_16_02");	//(spöttisch)Du solltest wissen, daß ich mit Waffen umgehen kann.
		AI_Output(hero,self,"AMZ_900_GLADIATOR_15_03");	//ja... ich erinnere mich!
	}
	else
	{
		AI_Output(self,hero,"AMZ_900_GLADIATOR_16_04");	//Du glaubst wohl immer noch, daß nur Männer mit Waffen umgehen können!
	};
};


instance AMZ_900_THORA_WEAPON(C_Info)
{
	npc = amz_900_thora;
	nr = 5;
	condition = amz_900_thora_weapon_condition;
	information = amz_900_thora_weapon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was hast du da für eine seltsame Waffe?";
};


func int amz_900_thora_weapon_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_gladiator) && Npc_HasItems(self,itmw_thora_battlestaff))
	{
		return TRUE;
	};
};

func void amz_900_thora_weapon_info()
{
	AI_Output(hero,self,"AMZ_900_WEAPON_15_01");	//Was hast du da für eine seltsame Waffe?
	AI_ReadyMeleeWeapon(self);
	AI_TurnToNPC(self,hero);
	AI_Wait(self,0.5);
	AI_Output(self,hero,"AMZ_900_WEAPON_16_02");	//Einen thyrianischer Kampfstab.
	AI_Output(self,hero,"AMZ_900_WEAPON_16_03");	//Ist schnell wie ein Pfeil und hat eine grosse Reichweite.
	AI_Output(self,hero,"AMZ_900_WEAPON_16_04");	//Diese Waffe zu meistern ist sehr schwierig.
	AI_RemoveWeapon(self);
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_VICTORIES(C_Info)
{
	npc = amz_900_thora;
	nr = 5;
	condition = amz_900_thora_victories_condition;
	information = amz_900_thora_victories_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wieviele Arenakämpfe hast du gewonnen?";
};


func int amz_900_thora_victories_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_gladiator) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func void amz_900_thora_victories_info()
{
	AI_Output(hero,self,"AMZ_900_VICTORIES_15_01");	//Wieviele Arenakämpfe hast du gewonnen?
	AI_Output(self,hero,"AMZ_900_VICTORIES_16_02");	//Also bis jetzt... Alle.
	AI_Output(self,hero,"AMZ_900_VICTORIES_16_03");	//(gelangweilt) Die Kämpfer hier sind wirklich keine Gegner für mich!
};


instance AMZ_900_THORA_CHALLENGE(C_Info)
{
	npc = amz_900_thora;
	nr = 5;
	condition = amz_900_thora_challenge_condition;
	information = amz_900_thora_challenge_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich fordere dich zu einem Arenakampf heraus!";
};


func int amz_900_thora_challenge_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_victories) && !GRIM_CHALLENGED && !GOLIATH_CHALLENGED && !BRUTUS_CHALLENGED && !MALGAR_CHALLENGED && !THORA_CHALLENGED && ARENAMASTER_ACCEPTED && Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func void amz_900_thora_challenge_info()
{
	AI_Output(hero,self,"AMZ_900_CHALLENGE_15_01");	//Ich fordere dich zu einem Arenakampf heraus!
	if(!Npc_HasItems(self,itmw_thora_battlestaff))
	{
		AI_Output(self,hero,"AMZ_900_CHALLENGE_16_02");	//Sobald ich meinen Kampfstab wiederhabe, werde ich gegen dich antreten.
		if(Npc_HasItems(hero,itmw_thora_battlestaff))
		{
			Info_ClearChoices(amz_900_thora_challenge);
			Info_AddChoice(amz_900_thora_challenge,"Ich habe deine Waffe... ähem... gefunden! Hier!",amz_900_thora_challenge_found);
		};
		return;
	};
	if(!THORA_PLAYERWONBEFORE)
	{
		AI_Output(hero,self,"AMZ_900_CHALLENGE_15_03");	//Wird doch Zeit, daß du mal einen Kampf verlierst!
	};
	if(ARENA_PLAYERBANNED)
	{
		AI_Output(self,hero,"AMZ_900_CHALLENGE_16_04");	//Du hast Mist gebaut, in der Arena.
		AI_Output(self,hero,"AMZ_900_CHALLENGE_16_05");	//Klär das mit dem Arenameister, sonst kann ich nicht gegen dich kämpfen!
		AI_StopProcessInfos(self);
	}
	else
	{
		if(!MALGAR_PLAYERWONBEFORE)
		{
			AI_Output(self,hero,"AMZ_900_CHALLENGE_16_06");	//Solange du nicht mal Malgar besiegt hast, kämpfe ich nicht gegen dich!
			AI_Output(self,hero,"AMZ_900_CHALLENGE_16_07");	//Er ist nach mir der zweitbeste Kämpfer hier.
			return;
		};
		AI_Output(self,hero,"AMZ_900_CHALLENGE_16_08");	//Es wird mir eine Freude sein, gegen dich zu kämpfen.
		AI_Output(self,hero,"AMZ_900_CHALLENGE_16_09");	//Gib dein Preisgeld beim Arenameister ab, dann können wir heute abend zusammen... (neckisch) TANZEN!!!
		THORA_CHALLENGED = TRUE;
	};
};

func void amz_900_thora_challenge_found()
{
	Info_ClearChoices(amz_900_thora_challenge);
	AI_Output(hero,self,"AMZ_900_CHALLENGE_FOUND_15_01");	//Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero,self,itmw_thora_battlestaff,1);
	AI_Output(self,hero,"AMZ_900_CHALLENGE_FOUND_16_02");	//Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_TEACHME(C_Info)
{
	npc = amz_900_thora;
	nr = 1;
	condition = amz_900_thora_teachme_condition;
	information = amz_900_thora_teachme_info;
	description = "Kannst du mir den Umgang mit dem Kampfstab beibringen?";
};


func int amz_900_thora_teachme_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_weapon))
	{
		return TRUE;
	};
};

func int amz_900_thora_teachme_info()
{
	AI_Output(hero,self,"AMZ_900_TEACHME_15_01");	//Kannst du mir den Umgang mit dem Kampfstab beibringen?
	AI_Output(self,hero,"AMZ_900_TEACHME_16_02");	//Ich könnte schon. Aber die Waffe ist schwer zu führen, nichts für Anfänger!
	AI_Output(self,hero,"AMZ_900_TEACHME_16_03");	//Solange Du kein gleichwertiger Gegner für mich bist, wäre das reine Zeitverschwendung!
};


instance AMZ_900_THORA_TEACHWHAT(C_Info)
{
	npc = amz_900_thora;
	nr = 1;
	condition = amz_900_thora_teachwhat_condition;
	information = amz_900_thora_teachwhat_info;
	permanent = TRUE;
	description = "Was muss ich tun, damit du mich am Kampfstab unterrichtest?";
};


func int amz_900_thora_teachwhat_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_teachme))
	{
		return TRUE;
	};
};

func int amz_900_thora_teachwhat_info()
{
	AI_Output(hero,self,"AMZ_900_TEACHWHAT_15_01");	//Was muss ich tun, damit du mich am Kampfstab unterrichtest?
	AI_Output(self,hero,"AMZ_900_TEACHWHAT_16_02");	//Du musst dir meinen Respekt verdienen! Bisher hat das noch keiner der Gladiatoren hier geschafft.
};


instance AMZ_900_THORA_TEACHNOW(C_Info)
{
	npc = amz_900_thora;
	nr = 1;
	condition = amz_900_thora_teachnow_condition;
	information = amz_900_thora_teachnow_info;
	description = "Zeigst du mir jetzt den Umgang mit dem Kampfstab?";
};


func int amz_900_thora_teachnow_condition()
{
	if(THORA_PLAYERWONBEFORE)
	{
		return TRUE;
	};
};

func int amz_900_thora_teachnow_info()
{
	AI_Output(hero,self,"AMZ_900_TEACHNOW_15_01");	//Zeigst du mir jetzt den Umgang mit dem Kampfstab?
	if(b_arena_getgladiatorranking(7898) == 1)
	{
		AI_Output(self,hero,"AMZ_900_TEACHNOW_16_02");	//Du hast mich in der Arena besiegt, aber vielleicht hast du nur Glück gehabt.
		AI_Output(self,hero,"AMZ_900_TEACHNOW_16_03");	//Wenn du es schaffst, mich als Champion abzulösen, werde dich in die Kunst des Kampfstabes einführen.
	}
	else
	{
		AI_Output(self,hero,"AMZ_900_TEACHNOW_16_04");	//Du hast es geschafft. Du bist Champion dieser Arena.
		AI_Output(self,hero,"AMZ_900_TEACHNOW_16_05");	//Wie versprochen werde ich dich nun im Stabkampf unterrichten. Sag mir, wenn du bereit dafür bist.
	};
};


instance AMZ_900_THORA_NEEDTOFORTRESS(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_needtofortress_condition;
	information = amz_900_thora_needtofortress_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich muss mit den Feuermagiern in der Bergfestung sprechen!";
};


func int amz_900_thora_needtofortress_condition()
{
	if(Npc_KnowsInfo(hero,pc_thief_problem) && (SUBCHAPTER < CH2_THORA_CONVINCED))
	{
		return TRUE;
	};
};

func void amz_900_thora_needtofortress_info()
{
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_15_01");	//Ich muss mit den Feuermagiern in der Bergfestung sprechen!
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_16_02");	//Du bist ja ein Spassvogel, warum erzählst du mir das?
	Info_AddChoice(amz_900_thora_needtofortress,"Ich hörte, du bist eine Kundschafterin der Paladine!",amz_900_thora_needtofortress_near);
	Info_AddChoice(amz_900_thora_needtofortress,"Kein Wort mehr Weib! Du wirst mich dorthinbringen.",amz_900_thora_needtofortress_insult);
	Info_AddChoice(amz_900_thora_needtofortress,"Diego schickt mich! Du sollst mich dorthinbringen.",amz_900_thora_needtofortress_diego);
};

func void amz_900_thora_needtofortress_near()
{
	Info_ClearChoices(amz_900_thora_needtofortress);
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_NEAR_15_01");	//Ich hörte, du bist eine Kundschafterin der Paladine!
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_NEAR_16_02");	//Scheint sich ja mittlerweile herumgesprochen zu haben.
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_NEAR_16_03");	//Aber warum sollte ich dich zur Bergfestung bringen?
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_NEAR_15_04");	//Es ist von grösster Wichtigkeit. Ich habe Informationen über die dämonische Bedrohung nach der die Feuermagier forschen.
	AI_Standup(self);
	AI_TurnToNPC(self,hero);
	AI_TurnToNPC(hero,self);
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_NEAR_16_05");	//(überrascht) Was weist DU über die Dämonen?
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_NEAR_15_06");	//Bringe mich zur Festung, es ist wichtig.
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_NEAR_16_07");	//Nun gut, ich werde dich an den Wachen vorbeibringen, aber ich kann dir nicht alle Türen öffnen. Du wirst allerhand Überzeugungsarbeit leisten müssen.
	B_LogEntry(CH1_DEMONTHREAT,"Ich konnte Thora dazu bringen, mich zur Bergfestung zu führen. Allerdings wird sie mich nur an den ersten Wachen vorbeibringen. Danach bin ich auf mich allein gestellt.");
	SUBCHAPTER = CH2_THORA_CONVINCED;
};

func void amz_900_thora_needtofortress_diego()
{
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_DIEGO_15_01");	//Diego schickt mich! Du sollst mich dorthinbringen.
	AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_DIEGO_16_02");	//Ja und?? Diego hat mir garnichts zu sagen!
};

func void amz_900_thora_needtofortress_insult()
{
	Info_ClearChoices(amz_900_thora_needtofortress);
	AI_Output(hero,self,"AMZ_900_NEEDTOFORTRESS_INSULT_15_01");	//Kein Wort mehr Weib! Du wirst mich dorthinbringen.
	if(self.aivar[13])
	{
		AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_INSULT_16_02");	//(seufzt) Sind die blauen Flecken, die ich dir verpasst habe etwa schon wieder verheilt?
		AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_INSULT_16_03");	//Kein Problem, ich kann dir gerne ein paar neue verabreichen.
	}
	else
	{
		AI_Output(self,hero,"AMZ_900_NEEDTOFORTRESS_INSULT_16_04");	//(seufzt) Ich glaube du brauchst eine Lektion in guten Manieren.
	};
	AI_StopProcessInfos(self);
	b_attackproper(self,hero);
};


instance AMZ_900_THORA_LETSGO(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_letsgo_condition;
	information = amz_900_thora_letsgo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann lass uns zur Bergfestung aufbrechen.";
};


func int amz_900_thora_letsgo_condition()
{
	if(SUBCHAPTER >= CH2_THORA_CONVINCED)
	{
		return TRUE;
	};
};

func void amz_900_thora_letsgo_info()
{
	AI_Output(hero,self,"AMZ_900_LETSGO_15_01");	//Dann lass uns zur Bergfestung aufbrechen.
	AI_Output(self,hero,"AMZ_900_LETSGO_16_02");	//Ich bin bereit. Etwas Abwechslung ist mir ohnehin willkommen.
	AI_Output(self,hero,"AMZ_900_LETSGO_16_03");	//Sollten wir uns unterwegs verlieren, treffen wir uns wieder an der Arena, klar?
	AI_Output(hero,self,"AMZ_900_LETSGO_15_04");	//An der Arena! Klar!
	AI_Output(self,hero,"AMZ_900_LETSGO_16_05");	//Dann folge mir, wenn du es schaffst an mir dranzubleiben.
	B_LogEntry(CH1_DEMONTHREAT,"Sollte wir auf dem Weg in die Bergfestung getrennt werden, treffen wir uns an der Arena im Alten Lager wieder.");
	AI_StopProcessInfos(self);
	b_setattitude(self,ATT_FRIENDLY);
	b_guidepc(self,"GuideToBF",TOBF_SCAV);
	Wld_InsertNpc(Scavenger,"FP_ROAM_OW_WARAN_OC_PSI1");
	Wld_InsertNpc(Scavenger,"FP_ROAM_OW_WARAN_OC_PSI3");
	Wld_InsertNpc(Scavenger,"FP_ROAM_OW_WARAN_OC_PSI5");
};


instance AMZ_900_THORA_ONWAYTOBF(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_onwaytobf_condition;
	information = amz_900_thora_onwaytobf_info;
	important = FALSE;
	permanent = TRUE;
	description = "Von mir aus kanns weiter gehen!";
};


func int amz_900_thora_onwaytobf_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_letsgo) && !Npc_KnowsInfo(hero,amz_900_thora_square))
	{
		return TRUE;
	};
};

func void amz_900_thora_onwaytobf_info()
{
	AI_Output(hero,self,"AMZ_900_ONWAYTOBF_15_01");	//Von mir aus kanns weiter gehen!
	AI_Output(self,hero,"AMZ_900_ONWAYTOBF_16_02");	//Gut! Wir sind bald da!
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_KILLEDSCAV(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_killedscav_condition;
	information = amz_900_thora_killedscav_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_killedscav_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_letsgo) && (Npc_GetDistToWP(self,TOBF_SCAV) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_killedscav_info()
{
	AI_Output(self,hero,"AMZ_900_KILLEDSCAV_16_01");	//Diese Scavanger sind wirklich lästig.
	AI_Output(self,hero,"AMZ_900_KILLEDSCAV_16_02");	//Die vermehren sich schneller, als man sie zu Essbarem verarbeiten kann.
	AI_StopProcessInfos(self);
	b_guidepc(self,"GuideToBF",TOBF_DEMONSCAV);
	Wld_InsertNpc(scavengerdemon,"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc(scavengerdemon,"SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
};


instance AMZ_900_THORA_KILLEDDEMONSCAV(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_killeddemonscav_condition;
	information = amz_900_thora_killeddemonscav_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_killeddemonscav_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_killedscav) && (Npc_GetDistToWP(self,TOBF_DEMONSCAV) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_killeddemonscav_info()
{
	AI_Output(self,hero,"AMZ_900_KILLEDDEMONSCAV_16_01");	//Verdammte dämonische Brut!
	AI_Output(hero,self,"AMZ_900_KILLEDDEMONSCAV_15_02");	//Was waren das für monströse Scavenger?
	AI_Output(self,hero,"AMZ_900_KILLEDDEMONSCAV_16_03");	//Die Magier sagen, dies seien von Dämonen besessene Tiere.
	AI_Output(self,hero,"AMZ_900_KILLEDDEMONSCAV_16_04");	//Viel stärker und widerstandsfähiger als normale Exemplare ihrer Art.
	AI_Output(self,hero,"AMZ_900_KILLEDDEMONSCAV_16_05");	//Sie sollten bald was dagegen unternehmen, sonst werden sie uns noch überrollen.
	b_guidepc(self,"GuideToBF",TOBF_RECCETOWER);
};


instance AMZ_900_THORA_WHATBRIDGE(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_whatbridge_condition;
	information = amz_900_thora_whatbridge_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist auf der anderen Seite der Brücke dort hinten.";
};


func int amz_900_thora_whatbridge_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_killeddemonscav) && (Npc_GetDistToWP(self,TOBF_DEMONSCAV) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_whatbridge_info()
{
	AI_Output(hero,self,"AMZ_900_WHATBRIDGE_15_01");	//Was ist auf der anderen Seite der Brücke dort hinten.
	AI_Output(self,hero,"AMZ_900_WHATBRIDGE_16_02");	//Ein kleines Höhlensystem. Dort soll früher eine ganze Horde schwarzer Goblins gehaust haben.
	AI_Output(self,hero,"AMZ_900_WHATBRIDGE_16_03");	//Aber hüte dich vor der Höhle.
	AI_Output(hero,self,"AMZ_900_WHATBRIDGE_15_04");	//Warum?
	AI_Output(self,hero,"AMZ_900_WHATBRIDGE_16_05");	//Die untoten Gebeine dieser heimtückischen Geschöpfe streifen noch immer durch die Höhlenstollen.
	AI_Output(self,hero,"AMZ_900_WHATBRIDGE_16_06");	//Nun aber weiter.
	AI_StopProcessInfos(self);
};


instance AMZ_900_THORA_RECCETOWER(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_reccetower_condition;
	information = amz_900_thora_reccetower_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_reccetower_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_killeddemonscav) && (Npc_GetDistToWP(self,TOBF_RECCETOWER) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_reccetower_info()
{
	AI_Output(self,hero,"AMZ_900_RECCETOWER_16_01");	//Hier ist einer unserer Aussenposten.
	AI_Output(self,hero,"AMZ_900_RECCETOWER_16_02");	//Die Kundschafter halten nach Orks Ausschau und melden regelmässig alle Aktivitäten an die Paladine in der Bergfestung.
	AI_Output(hero,self,"AMZ_900_RECCETOWER_15_03");	//Euch scheint nichts zu entgehen!
	AI_Output(self,hero,"AMZ_900_RECCETOWER_16_04");	//Garwog hat noch mehr Kundschafter hier im Tal, auch ich bin einer von ihnen.
	AI_Output(hero,self,"AMZ_900_RECCETOWER_15_05");	//Wer ist Garwog?
	AI_Output(self,hero,"AMZ_900_RECCETOWER_16_06");	//Er ist der Paladin, der für die Kundschafter und Aussenposten verantwortlich ist.
	AI_Output(self,hero,"AMZ_900_RECCETOWER_16_07");	//Mein Auftraggeber, wenn du so willst.
	AI_StopProcessInfos(self);
	b_guidepc(self,"GuideToBF",TOBF_OUTERGATE);
};


instance AMZ_900_THORA_OUTERGATE(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_outergate_condition;
	information = amz_900_thora_outergate_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_outergate_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_reccetower) && (Npc_GetDistToWP(self,TOBF_OUTERGATE) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_outergate_info()
{
	AI_Output(self,hero,"AMZ_900_OUTERGATE_16_01");	//Ab hier beginnt das abgeriegelte Gebiet der Felsenfestung. Nur Gefolgsleute des Königs dürfen es betreten.
	AI_Output(hero,self,"AMZ_900_OUTERGATE_15_02");	//Diese Torwachen dort... sind Soldaten des Königs ???
	AI_Output(self,hero,"AMZ_900_OUTERGATE_16_03");	//(zögerlich) Nicht wirklich... genau genommen sind es nur Hilfstruppen.
	AI_Output(self,hero,"AMZ_900_OUTERGATE_16_04");	//Billig angeworben und hastig ausgebildet, um den ersten Ansturm der Orks zu bremsen.
	AI_Output(self,hero,"AMZ_900_OUTERGATE_16_05");	//Sie wissen das selbst aber sie hören es nicht gerne. Also sprich sie nicht darauf an, wenn du Ärger vermeiden willst.
	AI_Output(hero,self,"AMZ_900_OUTERGATE_15_06");	//(zu sich selbst, sarkastisch) Das wird ein richtiger Spass werden.
	AI_StopProcessInfos(self);
	b_guidepc(self,"GuideToBF",TOBF_SQUARE);
};


instance AMZ_900_THORA_SQUARE(C_Info)
{
	npc = amz_900_thora;
	condition = amz_900_thora_square_condition;
	information = amz_900_thora_square_info;
	important = TRUE;
	permanent = FALSE;
};


func int amz_900_thora_square_condition()
{
	if(Npc_KnowsInfo(hero,amz_900_thora_outergate) && (Npc_GetDistToWP(self,TOBF_SQUARE) < 500))
	{
		return TRUE;
	};
};

func void amz_900_thora_square_info()
{
	AI_Output(self,hero,"AMZ_900_SQUARE_16_01");	//Hier sind wir. Weiter kann ich dich nicht bringen, ab jetzt bist du auf dich allein gestellt.
	AI_Output(self,hero,"AMZ_900_SQUARE_16_02");	//Ich bin unten bei Garwog, meinen Bericht erstatten. du kannst mich dort finden, wenn du mich brauchst.
	b_leavepc(self,"ReportToGarwog");
	B_ExchangeRoutine(pal_1003_garwog,"ReportFromThora");
};

