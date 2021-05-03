
instance INFO_GRIM_EXIT(C_Info)
{
	npc = min_306_grim;
	nr = 999;
	condition = info_grim_exit_condition;
	information = info_grim_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_grim_exit_condition()
{
	return TRUE;
};

func void info_grim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIN_306_GRIM_MYWEAPON(C_Info)
{
	npc = min_306_grim;
	nr = 1;
	condition = min_306_grim_myweapon_condition;
	information = min_306_grim_myweapon_info;
	important = TRUE;
	permanent = TRUE;
};


func int min_306_grim_myweapon_condition()
{
	if(Npc_HasItems(hero,itmw_grim_pickaxe))
	{
		if(ARENA_FIGHTRUNNING && ARENA_PLAYERFIGHT && GRIM_CHALLENGED && !ARENA_PLAYERSTOLEWEAPON)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void min_306_grim_myweapon_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"MIN_306_Grim_MYWEAPON_Info_10_01");	//Hey, du hast dir meine Spitzhacke gekrallt!
	Info_ClearChoices(min_306_grim_myweapon);
	Info_AddChoice(min_306_grim_myweapon,"Du hast sie fallen gelassen, jetzt gehört sie mir!",min_306_grim_myweapon_taken);
	Info_AddChoice(min_306_grim_myweapon,"Hier hast du sie zurück.",min_306_grim_myweapon_giveback);
};

func void min_306_grim_myweapon_giveback()
{
	Info_ClearChoices(min_306_grim_myweapon);
	AI_Output(hero,self,"MIN_306_Grim_MYWEAPON_GIVEBACK_15_01");	//Hier hast du sie zurück.
	B_GiveInvItems(hero,self,itmw_grim_pickaxe,1);
	AI_Output(self,hero,"MIN_306_Grim_MYWEAPON_GIVEBACK_10_02");	//(säuerlich) Dann kann es ja weitergehen!
	AI_StopProcessInfos(self);
};

func void min_306_grim_myweapon_taken()
{
	Info_ClearChoices(min_306_grim_myweapon);
	AI_Output(hero,self,"MIN_306_Grim_MYWEAPON_TAKEN_15_01");	//Du hast sie fallen gelassen, jetzt gehört sie mir!
	AI_Output(self,hero,"MIN_306_Grim_MYWEAPON_TAKEN_10_02");	//Du kennst wohl Regel Nummer 3 nicht!
	AI_StopProcessInfos(self);
	b_arena_abortfight(AF_PLAYERSTOLEWEAPON);
};


instance INFO_GRIM_CHALLENGED(C_Info)
{
	npc = min_306_grim;
	nr = 2;
	condition = info_grim_challenged_condition;
	information = info_grim_challenged_info;
	important = TRUE;
	permanent = TRUE;
};


func int info_grim_challenged_condition()
{
	if(GRIM_CHALLENGED && ARENA_PLAYERFIGHT && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void info_grim_challenged_info()
{
	if(Wld_IsTime(0,0,ARENABEGIN_H,ARENABEGIN_M))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGED_10_01");	//Wir sehen uns heute abend in der Arena!
		}
		else
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGED_10_02");	//Ich versuche mich auf den Kampf zu konzentrieren! Geh rüber in deinen Raum!
		};
		AI_StopProcessInfos(self);
		return;
	};
	if(Npc_IsInRoutine(self,zs_arenafight))
	{
		AI_Output(self,hero,"Info_Grim_CHALLENGED_10_03");	//Jetzt ist nicht die Zeit zum Reden!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self,hero,"Info_Grim_CHALLENGED_10_04");	//Wir sehen uns morgen Abend in der Arena!
		AI_StopProcessInfos(self);
		return;
	};
};


instance INFO_GRIM_PRENPC(C_Info)
{
	npc = min_306_grim;
	nr = 3;
	condition = info_grim_prenpc_condition;
	information = info_grim_prenpc_info;
	important = TRUE;
	permanent = TRUE;
};


func int info_grim_prenpc_condition()
{
	if(ARENA_NPCFIGHT && (ARENA_NPCCOMBO == AC_GRIM_GOLIATH) && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void info_grim_prenpc_info()
{
	AI_Output(self,hero,"Info_Grim_PRENPC_10_01");	//Stör mich jetzt nicht, ich muß mich auf den Kampf vorbereiten!
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_KNOWYOU(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_knowyou_condition;
	information = info_grim_knowyou_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dein Name kommt mir bekannt vor!";
};


func int info_grim_knowyou_condition()
{
	return TRUE;
};

func void info_grim_knowyou_info()
{
	AI_Output(hero,self,"Info_Grim_KNOWYOU_15_01");	//Dein Name kommt mir bekannt vor!
	AI_Output(self,hero,"Info_Grim_KNOWYOU_10_02");	//Na und? Ist ja auch kein seltener Name!
};


instance INFO_GRIM_ARENA(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_arena_condition;
	information = info_grim_arena_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kämpfst du in der Arena?";
};


func int info_grim_arena_condition()
{
	return TRUE;
};

func void info_grim_arena_info()
{
	AI_Output(hero,self,"Info_Grim_ARENA_15_01");	//Kämpfst du in der Arena?
	AI_Output(self,hero,"Info_Grim_ARENA_10_02");	//Du bist neu hier, richtig?
	Info_ClearChoices(info_grim_arena);
	Info_AddChoice(info_grim_arena,"Nicht wirklich!",info_grim_arena_no);
	Info_AddChoice(info_grim_arena,"Sozusagen! Bin erst vor kurzem angekommen.",info_grim_arena_yes);
};

func void info_grim_arena_yes()
{
	Info_ClearChoices(info_grim_arena);
	AI_Output(hero,self,"Info_Grim_ARENA_YES_15_01");	//Sozusagen! Bin erst vor kurzem angekommen.
	AI_Output(self,hero,"OUMULTI_Training_10_00");	//Du bist nicht gerade gut in Form. Könntest ein bischen Training gebrauchen!
	AI_Output(self,hero,"OUMULTI_Freundschaftskampf_10_00");	//Wie wär's mit einem Freundschaftskämpfchen in der Arena!?
};

func void info_grim_arena_no()
{
	Info_ClearChoices(info_grim_arena);
	AI_Output(hero,self,"Info_Grim_ARENA_NO_15_01");	//Nicht wirklich!
	AI_Output(self,hero,"Info_Grim_ARENA_NO_10_02");	//(misstrauisch) Hab dich noch nie hier gesehen!
	AI_Output(self,hero,"OUMULTI_Training_10_00");	//Du bist nicht gerade gut in Form. Könntest ein bischen Training gebrauchen!
	AI_Output(self,hero,"OUMULTI_Freundschaftskampf_10_00");	//Wie wär's mit einem Freundschaftskämpfchen in der Arena!?
};


instance MIN_306_GRIM_FRIENDFIGHT(C_Info)
{
	npc = min_306_grim;
	condition = min_306_grim_friendfight_condition;
	information = min_306_grim_friendfight_info;
	important = FALSE;
	permanent = FALSE;
	description = "Na dann zeig mal was du drauf hast!";
};


func int min_306_grim_friendfight_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena))
	{
		return TRUE;
	};
};

func void min_306_grim_friendfight_info()
{
	AI_Output(hero,self,"MIN_306_FRIENDFIGHT_15_01");	//Na dann zeig mal was du drauf hast!
	AI_Output(self,hero,"MIN_306_FRIENDFIGHT_10_02");	//Moment, nicht so schnell!
	AI_Output(self,hero,"MIN_306_FRIENDFIGHT_10_03");	//Hol dir erst vom Arenameister die Erlaubnis für einen Kampf. Du findest ihn oben am Arenaplatz.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_CHALLENGE(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_challenge_condition;
	information = info_grim_challenge_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich will in der Arena gegen dich kämpfen!";
};


func int info_grim_challenge_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena) && !GRIM_CHALLENGED && !GOLIATH_CHALLENGED && !BRUTUS_CHALLENGED && !MALGAR_CHALLENGED && !THORA_CHALLENGED && ARENAMASTER_ACCEPTED && Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		return TRUE;
	};
};

func void info_grim_challenge_info()
{
	AI_Output(hero,self,"Info_Grim_CHALLENGE_15_01");	//Ich will in der Arena gegen dich kämpfen!
	if(!Npc_HasItems(self,itmw_grim_pickaxe))
	{
		AI_Output(self,hero,"Info_Grim_CHALLENGE_10_02");	//Ohne meine Spitzhacke trete ich nicht an.
		if(Npc_HasItems(hero,itmw_grim_pickaxe))
		{
			Info_ClearChoices(info_grim_challenge);
			Info_AddChoice(info_grim_challenge,"Ich habe deine Waffe... ähem... gefunden! Hier!",info_grim_challenge_found);
		};
		return;
	};
	if(ARENA_PLAYERBANNED)
	{
		AI_Output(self,hero,"Info_Grim_CHALLENGE_10_03");	//Der Arenameister ist stinksauer auf dich! Du musst ihn erst wieder besänftigen!
	}
	else
	{
		if(hero.aivar[40] <= self.aivar[40])
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_04");	//Seeehr gut!
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_05");	//Am besten gehst du gleich zum Arenameister und gibst dein Preisgeld ab.
			GRIM_HEROKNOWSPRIZEMONEY = TRUE;
			GRIM_CHALLENGED = TRUE;
			return;
		};
		if(hero.aivar[40] == (self.aivar[40] + 1))
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_06");	//Ich weiss nicht... also gut, einmal versuche ich es noch gegen dich!
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_07");	//Vergiss nicht dein Preisgeld beim Arenameister abzugeben.
			GRIM_CHALLENGED = TRUE;
			return;
		};
		if(GOTMAR_GOLIATHRETURNED)
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_08");	//Du bist zu stark für mich! Ich warte lieber, bis Goliath wieder zurückkommt.
			AI_Output(hero,self,"Info_Grim_CHALLENGE_15_09");	//Da kannst du lange warten (grins)
		}
		else
		{
			AI_Output(self,hero,"Info_Grim_CHALLENGE_10_10");	//Vergiss es! Ich kämpfe lieber gegen Goliath, da hab ich bessere Chancen.
		};
	};
};

func void info_grim_challenge_found()
{
	Info_ClearChoices(info_grim_challenge);
	AI_Output(hero,self,"Info_Grim_CHALLENGE_FOUND_15_01");	//Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero,self,itmw_grim_pickaxe,1);
	AI_Output(self,hero,"Info_Grim_CHALLENGE_FOUND_10_02");	//Da ist sie ja, meine geliebte Waffe. Gib her.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_PRIZE(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_prize_condition;
	information = info_grim_prize_info;
	important = FALSE;
	permanent = FALSE;
	description = "Preisgeld? Was für ein Preisgeld?";
};


func int info_grim_prize_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena) && GRIM_HEROKNOWSPRIZEMONEY)
	{
		return TRUE;
	};
};

func void info_grim_prize_info()
{
	AI_Output(hero,self,"Info_Grim_PRIZE_15_01");	//Preisgeld? Was für ein Preisgeld?
	AI_Output(self,hero,"Info_Grim_PRIZE_10_02");	//Wir Gladiatoren kämpfen natürlich um Geld. Sonst macht das Ganze doch gar keinen Spaß.
};


instance INFO_GRIM_WEAPON(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_weapon_condition;
	information = info_grim_weapon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welche Waffe bevorzugst du?";
};


func int info_grim_weapon_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena))
	{
		return TRUE;
	};
};

func void info_grim_weapon_info()
{
	AI_Output(hero,self,"Info_Grim_WEAPON_15_01");	//Welche Waffe bevorzugst du?
	if(Npc_HasItems(self,itmw_grim_pickaxe))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,hero,"Info_Grim_WEAPON_10_02");	//Mit dieser Spitzhacke habe ich jahrelang Erz geschürft, die ist quasi mit meinem Körper verwachsen.
	if(Npc_HasItems(self,itmw_grim_pickaxe))
	{
		AI_RemoveWeapon(self);
	};
};


instance INFO_GRIM_VICTORIES(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_victories_condition;
	information = info_grim_victories_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wieviele Kämpfe hast du gewonnen?";
};


func int info_grim_victories_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena))
	{
		return TRUE;
	};
};

func void info_grim_victories_info()
{
	AI_Output(hero,self,"Info_Grim_VICTORIES_15_01");	//Wieviele Kämpfe hast du gewonnen?
	AI_Output(self,hero,"Info_Grim_VICTORIES_10_02");	//Also... puhhh.... wieviel waren es doch gleich...
	AI_Output(self,hero,"Info_Grim_VICTORIES_10_03");	//Wenn du mich so direkt fragst... ja da waren auf jeden Fall schon mal Siege.... bestimmt...
	AI_Output(hero,self,"Info_Grim_VICTORIES_15_04");	//OK, OK, ich denke ich bin im Bilde!
};


instance INFO_GRIM_WHY(C_Info)
{
	npc = min_306_grim;
	condition = info_grim_why_condition;
	information = info_grim_why_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum kämpfst du in der Arena?";
};


func int info_grim_why_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena))
	{
		return TRUE;
	};
};

func void info_grim_why_info()
{
	AI_Output(hero,self,"Info_Grim_WHY_15_01");	//Warum kämpfst du in der Arena?
	AI_Output(self,hero,"Info_Grim_WHY_10_02");	//Hab keine Lust mehr auf Erzhacken! Jetzt will ich mir hier etwas Silber zu verdienen.
};


instance MIN_306_GRIM_HOWDY(C_Info)
{
	npc = min_306_grim;
	condition = min_306_grim_howdy_condition;
	information = min_306_grim_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Na, wie laufen die Kämpfe?";
};


func int min_306_grim_howdy_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_arena) && Npc_KnowsInfo(hero,info_grim_weapon) && !info_grim_challenge_condition())
	{
		return TRUE;
	};
};

func void min_306_grim_howdy_info()
{
	AI_Output(hero,self,"MIN_306_HOWDY_15_01");	//Na, wie laufen die Kämpfe?
	AI_Output(self,hero,"MIN_306_HOWDY_10_02");	//Schlecht Mann! Ich habe bald kein Preisgeld mehr, das ich setzen könnte!
	AI_StopProcessInfos(self);
};

