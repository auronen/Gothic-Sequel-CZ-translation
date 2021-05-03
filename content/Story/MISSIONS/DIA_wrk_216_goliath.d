
instance WRK_216_GOLIATH_EXIT(C_Info)
{
	npc = wrk_216_goliath;
	nr = 999;
	condition = wrk_216_goliath_exit_condition;
	information = wrk_216_goliath_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_216_goliath_exit_condition()
{
	return TRUE;
};

func void wrk_216_goliath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_216_GOLIATH_MYWEAPON(C_Info)
{
	npc = wrk_216_goliath;
	nr = 1;
	condition = wrk_216_goliath_myweapon_condition;
	information = wrk_216_goliath_myweapon_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_216_goliath_myweapon_condition()
{
	if(Npc_HasItems(hero,itmw_goliath_sledgehammer))
	{
		if(ARENA_FIGHTRUNNING && ARENA_PLAYERFIGHT && GOLIATH_CHALLENGED && !ARENA_PLAYERSTOLEWEAPON && !GOTMAR_GOLIATHRETURNED)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func int wrk_216_goliath_myweapon_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"WRK_216_Goliath_MYWEAPON_Info_09_01");	//Gib mir meinen Hammer zurück!
	Info_ClearChoices(wrk_216_goliath_myweapon);
	Info_AddChoice(wrk_216_goliath_myweapon,"Ich behalte ihn!",wrk_216_goliath_myweapon_taken);
	Info_AddChoice(wrk_216_goliath_myweapon,"Hier hast du ihn zurück.",wrk_216_goliath_myweapon_giveback);
};

func void wrk_216_goliath_myweapon_giveback()
{
	Info_ClearChoices(wrk_216_goliath_myweapon);
	AI_Output(hero,self,"WRK_216_Goliath_MYWEAPON_GIVEBACK_15_01");	//Hier hast du ihn zurück.
	B_GiveInvItems(hero,self,itmw_goliath_sledgehammer,1);
	AI_Output(self,hero,"WRK_216_Goliath_MYWEAPON_GIVEBACK_09_02");	//Dann kann es ja weitergehen!
	AI_StopProcessInfos(self);
};

func void wrk_216_goliath_myweapon_taken()
{
	Info_ClearChoices(wrk_216_goliath_myweapon);
	AI_Output(hero,self,"WRK_216_Goliath_MYWEAPON_TAKEN_15_01");	//Ich behalte ihn!
	AI_Output(self,hero,"WRK_216_Goliath_MYWEAPON_TAKEN_09_02");	//Hey, das ist gegen Regel 3 !!!
	AI_StopProcessInfos(self);
	b_arena_abortfight(AF_PLAYERSTOLEWEAPON);
};


instance WRK_216_GOLIATH_CHALLENGED(C_Info)
{
	npc = wrk_216_goliath;
	nr = 2;
	condition = wrk_216_goliath_challenged_condition;
	information = wrk_216_goliath_challenged_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_216_goliath_challenged_condition()
{
	if(GOLIATH_CHALLENGED && ARENA_PLAYERFIGHT && c_npcisinvincible(self) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_216_goliath_challenged_info()
{
	if(Wld_IsTime(0,0,ARENABEGIN_H,ARENABEGIN_M))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_LEFT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGED_09_01");	//Vergiss nicht. Wir kämpfen heute abend in der Arena!
		}
		else
		{
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGED_09_02");	//Geh in deinen eigenen Vorbereitungsraum!
		};
		AI_StopProcessInfos(self);
		return;
	};
	if(Npc_IsInRoutine(self,zs_arenafight))
	{
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGED_09_03");	//Die wollen uns kämpfen sehen und nicht reden!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGED_09_04");	//Vergiss nicht. Wir kämpfen morgen abend in der Arena!
		AI_StopProcessInfos(self);
		return;
	};
};


instance WRK_216_GOLIATH_PRENPC(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_prenpc_condition;
	information = wrk_216_goliath_prenpc_info;
	important = TRUE;
	permanent = TRUE;
};


func int wrk_216_goliath_prenpc_condition()
{
	if(ARENA_NPCFIGHT && ((ARENA_NPCCOMBO == AC_GRIM_GOLIATH) || (ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS)) && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M) && c_npcisinvincible(self) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_216_goliath_prenpc_info()
{
	AI_Output(self,hero,"WRK_216_Goliath_PRENPC_09_01");	//Raus hier! Ich brauche meine Ruhe vor dem Arenakampf!
	AI_StopProcessInfos(self);
};


instance WRK_216_GOLIATH_GLADIATOR(C_Info)
{
	npc = wrk_216_goliath;
	nr = 1;
	condition = wrk_216_goliath_gladiator_condition;
	information = wrk_216_goliath_gladiator_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bist du einer der Gladiatoren?";
};


func int wrk_216_goliath_gladiator_condition()
{
	if(!GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func int wrk_216_goliath_gladiator_info()
{
	AI_Output(hero,self,"WRK_216_GLADIATOR_15_01");	//Bist du einer der Gladiatoren?
	AI_Output(self,hero,"WRK_216_GLADIATOR_09_02");	//Hast du mich kämpfen sehen?
	Info_ClearChoices(wrk_216_goliath_gladiator);
	Info_AddChoice(wrk_216_goliath_gladiator,"Nein, noch nicht.",wrk_216_goliath_gladiator_no);
	Info_AddChoice(wrk_216_goliath_gladiator,"Das habe ich.",wrk_216_goliath_gladiator_yes);
};

func void wrk_216_goliath_gladiator_yes()
{
	AI_Output(hero,self,"WRK_216_GLADIATOR_YES_15_01");	//Das habe ich.
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_09_02");	//Gegen wen habe ich gekämpft?
	Info_ClearChoices(wrk_216_goliath_gladiator);
	Info_AddChoice(wrk_216_goliath_gladiator,"Grim",wrk_216_goliath_gladiator_yes_grim);
	Info_AddChoice(wrk_216_goliath_gladiator,"Brutus",wrk_216_goliath_gladiator_yes_brutus);
	Info_AddChoice(wrk_216_goliath_gladiator,"Malgar",wrk_216_goliath_gladiator_yes_malgar);
	Info_AddChoice(wrk_216_goliath_gladiator,"Thora",wrk_216_goliath_gladiator_yes_thora);
};

func void wrk_216_goliath_gladiator_yes_thora()
{
	Info_ClearChoices(wrk_216_goliath_gladiator);
	AI_Output(hero,self,"WRK_216_GLADIATOR_YES_THORA_15_01");	//Thora
	AI_Output(self,hero,"OUMULTI_Liar_09_00");	//Das kann nicht sein! Du bist ein Lügner!
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_THORA_09_03");	//Sie kämpft viel zu gut für mich.
	GOLIATH_PLAYERLIED = TRUE;
	AI_StopProcessInfos(self);
};

func void wrk_216_goliath_gladiator_yes_malgar()
{
	Info_ClearChoices(wrk_216_goliath_gladiator);
	AI_Output(hero,self,"WRK_216_GLADIATOR_YES_MALGAR_15_01");	//Malgar
	AI_Output(self,hero,"OUMULTI_Liar_09_00");	//Das kann nicht sein! Du bist ein Lügner!
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_MALGAR_09_03");	//Ich habe ihn noch nie herausgefordert!
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_MALGAR_09_04");	//Lüg mich nicht an, wenn du mit mir reden willst!
	GOLIATH_PLAYERLIED = TRUE;
	AI_StopProcessInfos(self);
};

func void wrk_216_goliath_gladiator_yes_brutus()
{
	Info_ClearChoices(wrk_216_goliath_gladiator);
	AI_Output(hero,self,"WRK_216_GLADIATOR_YES_BRUTUS_15_01");	//Brutus
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_BRUTUS_09_02");	//Ahh... Brutus ist ein wirklich harter Brocken.
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_BRUTUS_09_03");	//Wenn er nicht so verdammt schnell wäre!
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_BRUTUS_09_04");	//...aber irgendwann werde ich ihn auch mal besiegen!
};

func void wrk_216_goliath_gladiator_yes_grim()
{
	Info_ClearChoices(wrk_216_goliath_gladiator);
	AI_Output(hero,self,"WRK_216_GLADIATOR_YES_GRIM_15_01");	//Grim
	AI_Output(self,hero,"WRK_216_GLADIATOR_YES_GRIM_09_02");	//Gegen Grim trete ich gerne an!
};

func void wrk_216_goliath_gladiator_no()
{
	Info_ClearChoices(wrk_216_goliath_gladiator);
	AI_Output(hero,self,"WRK_216_GLADIATOR_NO_15_01");	//Nein, noch nicht.
	AI_Output(self,hero,"WRK_216_GLADIATOR_NO_09_02");	//Du hast aber Recht, ich bin einer der Gladiatoren.
};


instance WRK_216_GOLIATH_CHALLENGE(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_challenge_condition;
	information = wrk_216_goliath_challenge_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich fordere dich heraus!";
};


func int wrk_216_goliath_challenge_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_gladiator) && !GRIM_CHALLENGED && !GOLIATH_CHALLENGED && !BRUTUS_CHALLENGED && !MALGAR_CHALLENGED && !THORA_CHALLENGED && ARENAMASTER_ACCEPTED && !GOTMAR_GOLIATHRETURNED && Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		return TRUE;
	};
};

func void wrk_216_goliath_challenge_info()
{
	AI_Output(hero,self,"WRK_216_Goliath_CHALLENGE_15_01");	//Ich fordere dich heraus!
	if(!Npc_HasItems(self,itmw_goliath_sledgehammer))
	{
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_02");	//Mein Schmiedehammer ist mir abhanden gekommen. Ohne ihn, werde ich nicht kämpfen.
		if(Npc_HasItems(hero,itmw_goliath_sledgehammer))
		{
			Info_ClearChoices(wrk_216_goliath_challenge);
			Info_AddChoice(wrk_216_goliath_challenge,"Ich habe deine Waffe... ähem... gefunden! Hier!",wrk_216_goliath_challenge_found);
		};
		return;
	};
	if(ARENA_PLAYERBANNED)
	{
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_03");	//Du hast neulich in der Arena die Regeln verletzt!
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_04");	//Frag den Arenameister, ob er dich wieder kämpfen lässt!
	}
	else
	{
		if(hero.aivar[40] < 1)
		{
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_05");	//Du brauchst etwas Erfahrung in der Arena. Es wäre unfair von mir, jetzt schon gegen dich zu kämpfen.
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_06");	//Wenn du Grim besiegst, nehme ich deine Herausforderung an.
			return;
		};
		if(b_arena_getgladiatorranking(7898) <= (b_arena_getgladiatorranking(7978) - 2))
		{
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_07");	//Du bist ziemlich gut geworden!
			AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_08");	//Fordere lieber mal erfahrenere Gladiatoren heraus!
			return;
		};
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_09");	//Na gut. Ich trete gegen dich an!
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_10");	//Wir sehen uns heute Abend.
		AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_09_11");	//Denk dran dein Preisgeld beim Arenameister abzugeben!
		GOLIATH_CHALLENGED = TRUE;
	};
};

func void wrk_216_goliath_challenge_found()
{
	Info_ClearChoices(wrk_216_goliath_challenge);
	AI_Output(hero,self,"WRK_216_Goliath_CHALLENGE_FOUND_15_01");	//Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero,self,itmw_goliath_sledgehammer,1);
	AI_Output(self,hero,"WRK_216_Goliath_CHALLENGE_FOUND_09_02");	//Danke, nun kann ich auch wieder Herausforderungen annehmen.
	AI_StopProcessInfos(self);
};


instance WRK_216_GOLIATH_WEAPON(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_weapon_condition;
	information = wrk_216_goliath_weapon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Mit welcher Waffe kämpfst du?";
};


func int wrk_216_goliath_weapon_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_gladiator) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_216_goliath_weapon_info()
{
	AI_Output(hero,self,"WRK_216_Goliath_WEAPON_15_01");	//Mit welcher Waffe kämpfst du?
	if(Npc_HasItems(self,itmw_goliath_sledgehammer))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,hero,"WRK_216_Goliath_WEAPON_09_02");	//Mit dem Schmiedehammer hier kann ich am besten umgehen!
	AI_Output(self,hero,"WRK_216_Goliath_WEAPON_09_03");	//Das kommt noch aus meiner Zeit als Schmiedegehilfe.
	if(Npc_HasItems(self,itmw_goliath_sledgehammer))
	{
		AI_RemoveWeapon(self);
	};
};


instance WRK_216_GOLIATH_SMITHHELPER(C_Info)
{
	npc = wrk_216_goliath;
	nr = 1;
	condition = wrk_216_goliath_smithhelper_condition;
	information = wrk_216_goliath_smithhelper_info;
	description = "Du warst Schmiedegehilfe?";
};


func int wrk_216_goliath_smithhelper_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_weapon) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func int wrk_216_goliath_smithhelper_info()
{
	AI_Output(hero,self,"WRK_216_SMITHHELPER_15_01");	//Du warst Schmiedegehilfe?
	AI_Output(self,hero,"WRK_216_SMITHHELPER_09_02");	//Ich habe für Gotmar im Arbeiterviertel gearbeitet. Da habe ich gelernt mit dem Schmiedehammer umzugehen.
	AI_Output(self,hero,"WRK_216_SMITHHELPER_09_03");	//Aber mir fehlte die Anerkennung! Deshalb kämpfe ich jetzt in der Arena!
};


instance WRK_216_GOLIATH_VICTORIES(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_victories_condition;
	information = wrk_216_goliath_victories_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie oft hast Du schon gewonnen?";
};


func int wrk_216_goliath_victories_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_gladiator) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_216_goliath_victories_info()
{
	AI_Output(hero,self,"WRK_216_Goliath_VICTORIES_15_01");	//Wie oft hast Du schon gewonnen?
	AI_Output(self,hero,"WRK_216_Goliath_VICTORIES_09_02");	//Es geht etwas schleppend voran.
	AI_Output(self,hero,"WRK_216_Goliath_VICTORIES_09_03");	//Aber gegen Grim habe ich meistens gewonnen!
};


instance WRK_216_GOLIATH_TIP(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_tip_condition;
	information = wrk_216_goliath_tip_info;
	important = TRUE;
	permanent = FALSE;
};


func int wrk_216_goliath_tip_condition()
{
	if(GRIM_CHALLENGED && (Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG))
	{
		return TRUE;
	};
};

func void wrk_216_goliath_tip_info()
{
	AI_Output(self,hero,"WRK_216_TIP_09_01");	//Dein erster Arenakampf, was?
	AI_Output(hero,self,"WRK_216_TIP_15_02");	//Ja, und?
	AI_Output(self,hero,"WRK_216_TIP_09_03");	//Während eines Arenakampfes musst du dich oft heilen. Nimm reichlich Nahrung oder Heiltränke mit!
	AI_Output(hero,self,"WRK_216_TIP_15_04");	//Danke für den Tip!
	AI_StopProcessInfos(self);
};


instance WRK_216_GOLIATH_HOWDY(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_howdy_condition;
	information = wrk_216_goliath_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was macht deine Suche nach Ruhm und Anerkennung!";
};


func int wrk_216_goliath_howdy_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_smithhelper) && !GOTMAR_GOLIATHRETURNED && !wrk_216_goliath_challenge_condition())
	{
		return TRUE;
	};
};

func void wrk_216_goliath_howdy_info()
{
	AI_Output(hero,self,"WRK_216_HOWDY_15_01");	//Was macht deine Suche nach Ruhm und Anerkennung!
	AI_Output(self,hero,"WRK_216_HOWDY_09_02");	//Es könnte besser laufen.
	AI_Output(self,hero,"WRK_216_HOWDY_09_03");	//Ich hoffe, dass ich wenigstens meinen Platz in der Rangliste halten kann!
};


instance WRK_216_GOLIATH_HOWDY2(C_Info)
{
	npc = wrk_216_goliath;
	condition = wrk_216_goliath_howdy2_condition;
	information = wrk_216_goliath_howdy2_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie gefällt es dir in deinem alten Beruf?";
};


func int wrk_216_goliath_howdy2_condition()
{
	if(GOTMAR_GOLIATHRETURNED && (Npc_GetDistToWP(self,"OCR_HUT_77") < 1000))
	{
		return TRUE;
	};
};

func void wrk_216_goliath_howdy2_info()
{
	AI_Output(hero,self,"WRK_216_HOWDY2_15_01");	//Wie gefällt es dir in deinem alten Beruf?
	AI_Output(self,hero,"WRK_216_HOWDY2_09_02");	//Eigentlich garnicht so schlecht. Die ehrliche Arbeit macht mir wieder richtig Freude!
	AI_Output(self,hero,"WRK_216_HOWDY2_09_03");	//Als Schmiedegehilfe, kann ich etwas zur Verteidigung des Lagers beitragen. Und Gotmar will mir später sogar mal die Schmiede überlassen.
	AI_Output(self,hero,"WRK_216_HOWDY2_09_04");	//Gut dass du mir die Augen geöffnet hast!
	AI_StopProcessInfos(self);
};


instance WRK_216_GOLIATH_GOTMAR(C_Info)
{
	npc = wrk_216_goliath;
	nr = 1;
	condition = wrk_216_goliath_gotmar_condition;
	information = wrk_216_goliath_gotmar_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe mit Gotmar dem Schmied gesprochen!";
};


func int wrk_216_goliath_gotmar_condition()
{
	if(Npc_KnowsInfo(hero,wrk_200_gotmar_ifetchgoliath))
	{
		return TRUE;
	};
};

func void wrk_216_goliath_gotmar_info()
{
	AI_Output(hero,self,"WRK_216_GOTMAR_15_01");	//Ich habe mit Gotmar dem Schmied gesprochen!
	AI_Output(hero,self,"WRK_216_GOTMAR_15_02");	//Er schafft die ganze Arbeit nicht ohne dich.
	if(b_arena_getgladiatorranking(7898) >= b_arena_getgladiatorranking(7978))
	{
		AI_Output(self,hero,"WRK_216_GOTMAR_09_03");	//Ich habe hier in der Arena eine neue Aufgabe.
		AI_Output(self,hero,"WRK_216_GOTMAR_09_04");	//Solange ich als Gladiator Erfolg habe, werde ich den Blasebalg nicht mehr treten!
		B_LogEntry(CH1_LEARNSMITH,"Goliath lässt sich nicht von seinem neuen Lebensweg abbringen. Zumindest nicht, solange er als Gladiator erfolgreich ist... .");
	}
	else
	{
		AI_Output(self,hero,"WRK_216_GOTMAR_09_05");	//Ich weiss ja nicht...
	};
};


instance WRK_216_GOLIATH_GOBACK(C_Info)
{
	npc = wrk_216_goliath;
	nr = 1;
	condition = wrk_216_goliath_goback_condition;
	information = wrk_216_goliath_goback_info;
	important = FALSE;
	permanent = TRUE;
	description = "Willst du dir das mit Gotmar nicht nochmal überlegen!";
};


func int wrk_216_goliath_goback_condition()
{
	if(Npc_KnowsInfo(hero,wrk_216_goliath_gotmar) && Wld_IsTime(ARENAEND_H,ARENAEND_M,ARENAPRE_H,ARENAPRE_M) && !GOTMAR_GOLIATHRETURNED)
	{
		return TRUE;
	};
};

func void wrk_216_goliath_goback_info()
{
	var int pc_rank;
	var int goliath_rank;
	AI_Output(hero,self,"WRK_216_GOBACK_15_01");	//Willst du dir das mit Gotmar nicht nochmal überlegen!
	pc_rank = b_arena_getgladiatorranking(7898);
	goliath_rank = b_arena_getgladiatorranking(7978);
	if(pc_rank >= goliath_rank)
	{
		AI_Output(self,hero,"WRK_216_GOBACK_09_02");	//Nein! Das Leben als Gladiator gefällt mir viel besser!
	}
	else
	{
		AI_Output(self,hero,"WRK_216_GOBACK_09_03");	//Es läuft in der Arena nicht so gut, wie ich gehofft hatte. Ich bin wohl doch kein so guter Gladiator.
		AI_Output(self,hero,"WRK_216_GOBACK_09_04");	//Auch du hast dich in der Rangliste schon an mir vorbeigeschoben, und das obwohl du wirklich noch nicht lange dabei bist.
		AI_Output(hero,self,"WRK_216_GOBACK_15_05");	//Warum gehst du dann nicht zu Gotmar zurück?
		AI_Output(self,hero,"WRK_216_GOBACK_09_06");	//Ich glaube es ist wirklich das beste, wenn ich genau das tue!
		GOTMAR_GOLIATHRETURNED = TRUE;
		Npc_ExchangeRoutine(self,"smith");
		B_LogEntry(CH1_LEARNSMITH,"Ich konnte Goliath doch tatsächlich davon überzeugen, dass seine Zukunft nicht in der Arena liegt. Ich bin gespannt, was Gotmar dazu sagen wird.");
		B_GiveXP(XP_GOLIATH_PERSUADE);
	};
};

