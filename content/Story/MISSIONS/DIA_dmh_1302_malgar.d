
instance DMH_1302_MALGAR_EXIT(C_Info)
{
	npc = dmh_1302_malgar;
	nr = 999;
	condition = dmh_1302_malgar_exit_condition;
	information = dmh_1302_malgar_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dmh_1302_malgar_exit_condition()
{
	return TRUE;
};

func void dmh_1302_malgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMH_1302_MALGAR_MYWEAPON(C_Info)
{
	npc = dmh_1302_malgar;
	nr = 1;
	condition = dmh_1302_malgar_myweapon_condition;
	information = dmh_1302_malgar_myweapon_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmh_1302_malgar_myweapon_condition()
{
	if(Npc_HasItems(hero,itmw_malgar_broadsword))
	{
		if(ARENA_FIGHTRUNNING && ARENA_PLAYERFIGHT && MALGAR_CHALLENGED && !ARENA_PLAYERSTOLEWEAPON)
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func int dmh_1302_malgar_myweapon_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"DMH_1302_MYWEAPON_Info_11_01");	//(eiskalt) Gib mir meine Waffe! JETZT!
	Info_ClearChoices(dmh_1302_malgar_myweapon);
	Info_AddChoice(dmh_1302_malgar_myweapon,"Nein, ich behalte sie!",dmh_1302_malgar_myweapon_taken);
	Info_AddChoice(dmh_1302_malgar_myweapon,"Hier hast du sie zurück!",dmh_1302_malgar_myweapon_giveback);
};

func void dmh_1302_malgar_myweapon_giveback()
{
	Info_ClearChoices(dmh_1302_malgar_myweapon);
	AI_Output(hero,self,"DMH_1302_MYWEAPON_GIVEBACK_15_01");	//Hier hast du sie zurück!
	B_GiveInvItems(hero,self,itmw_malgar_broadsword,1);
	AI_Output(self,hero,"DMH_1302_MYWEAPON_GIVEBACK_11_02");	//(souverän) Gut!
	AI_StopProcessInfos(self);
};

func void dmh_1302_malgar_myweapon_taken()
{
	Info_ClearChoices(dmh_1302_malgar_myweapon);
	AI_Output(hero,self,"DMH_1302_MYWEAPON_TAKEN_15_01");	//Nein, ich behalte sie!
	AI_Output(self,hero,"DMH_1302_MYWEAPON_TAKEN_11_02");	//(verständnislos) Ts ts ts, Regel Nummer 3...
	AI_StopProcessInfos(self);
	b_arena_abortfight(AF_PLAYERSTOLEWEAPON);
};


instance DMH_1302_MALGAR_CHALLENGED(C_Info)
{
	npc = dmh_1302_malgar;
	nr = 2;
	condition = dmh_1302_malgar_challenged_condition;
	information = dmh_1302_malgar_challenged_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmh_1302_malgar_challenged_condition()
{
	if(MALGAR_CHALLENGED && ARENA_PLAYERFIGHT && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_challenged_info()
{
	if(Wld_IsTime(0,0,ARENABEGIN_H,ARENABEGIN_M))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_LEFT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self,hero,"DMH_1302_CHALLENGED_11_01");	//(grüssend) Heute abend, Gladiator...
		}
		else
		{
			AI_Output(self,hero,"DMH_1302_CHALLENGED_11_02");	//Geh rüber!
		};
		AI_StopProcessInfos(self);
		return;
	};
	if(Npc_IsInRoutine(self,zs_arenafight))
	{
		AI_Output(self,hero,"DMH_1302_CHALLENGED_11_03");	//Kämpfe Gladiator!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self,hero,"DMH_1302_CHALLENGED_11_04");	//(grüssend) Morgen abend, Gladiator...
		AI_StopProcessInfos(self);
		return;
	};
};


instance DMH_1302_MALGAR_PRENPC(C_Info)
{
	npc = dmh_1302_malgar;
	condition = dmh_1302_malgar_prenpc_condition;
	information = dmh_1302_malgar_prenpc_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmh_1302_malgar_prenpc_condition()
{
	if(ARENA_NPCFIGHT && ((ARENA_NPCCOMBO == AC_BRUTUS_MALGAR) || (ARENA_NPCCOMBO == AC_MALGAR_THORA)) && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_prenpc_info()
{
	AI_Output(self,hero,"DMH_1302_PRENPC_11_01");	//Raus hier!
	AI_StopProcessInfos(self);
};


instance DMH_1302_MALGAR_GLADIATOR(C_Info)
{
	npc = dmh_1302_malgar;
	nr = 1;
	condition = dmh_1302_malgar_gladiator_condition;
	information = dmh_1302_malgar_gladiator_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du bist Gladiator, oder?";
};


func int dmh_1302_malgar_gladiator_condition()
{
	return TRUE;
};

func int dmh_1302_malgar_gladiator_info()
{
	AI_Output(hero,self,"DMH_1302_GLADIATOR_15_01");	//Du bist Gladiator, oder?
	AI_Output(self,hero,"DMH_1302_GLADIATOR_11_02");	//Ja.
};


instance DMH_1302_MALGAR_WEAPON(C_Info)
{
	npc = dmh_1302_malgar;
	condition = dmh_1302_malgar_weapon_condition;
	information = dmh_1302_malgar_weapon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kämpfst wohl mit dem Schwert.";
};


func int dmh_1302_malgar_weapon_condition()
{
	if(Npc_KnowsInfo(hero,dmh_1302_malgar_gladiator))
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_weapon_info()
{
	AI_Output(hero,self,"DMH_1302_WEAPON_15_01");	//Kämpfst wohl mit dem Schwert.
	AI_Output(self,hero,"DMH_1302_WEAPON_11_02");	//Ja!
};


instance DMH_1302_MALGAR_VICTORIES(C_Info)
{
	npc = dmh_1302_malgar;
	condition = dmh_1302_malgar_victories_condition;
	information = dmh_1302_malgar_victories_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wieviele Arenakämpfe hast du schon gewonnen?";
};


func int dmh_1302_malgar_victories_condition()
{
	if(Npc_KnowsInfo(hero,dmh_1302_malgar_gladiator))
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_victories_info()
{
	AI_Output(hero,self,"DMH_1302_VICTORIES_15_01");	//Wieviele Arenakämpfe hast du schon gewonnen?
	AI_Output(self,hero,"DMH_1302_VICTORIES_11_02");	//Genug!
};


instance DMH_1302_MALGAR_QUIET(C_Info)
{
	npc = dmh_1302_malgar;
	nr = 1;
	condition = dmh_1302_malgar_quiet_condition;
	information = dmh_1302_malgar_quiet_info;
	description = "Du sprichst wohl nicht sehr viel, was?";
};


func int dmh_1302_malgar_quiet_condition()
{
	if(Npc_KnowsInfo(hero,dmh_1302_malgar_weapon) && Npc_KnowsInfo(hero,dmh_1302_malgar_victories))
	{
		return TRUE;
	};
};

func int dmh_1302_malgar_quiet_info()
{
	AI_Output(hero,self,"DMH_1302_QUIET_15_01");	//Du sprichst wohl nicht sehr viel, was?
	AI_Output(self,hero,"DMH_1302_QUIET_11_02");	//hmmmm
	AI_Output(hero,self,"DMH_1302_QUIET_15_03");	//Na dann...
};


instance DMH_1302_MALGAR_CHALLENGE(C_Info)
{
	npc = dmh_1302_malgar;
	condition = dmh_1302_malgar_challenge_condition;
	information = dmh_1302_malgar_challenge_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kämpfe gegen mich in der Arena!";
};


func int dmh_1302_malgar_challenge_condition()
{
	if(Npc_KnowsInfo(hero,dmh_1302_malgar_quiet) && !GRIM_CHALLENGED && !GOLIATH_CHALLENGED && !BRUTUS_CHALLENGED && !MALGAR_CHALLENGED && !THORA_CHALLENGED && ARENAMASTER_ACCEPTED && Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_challenge_info()
{
	AI_Output(hero,self,"DMH_1302_CHALLENGE_15_01");	//Kämpfe gegen mich in der Arena!
	AI_Output(hero,self,"DMH_1302_CHALLENGE_15_02");	//Das geht auch ganz ohne sprechen!
	if(!Npc_HasItems(self,itmw_malgar_broadsword))
	{
		AI_Output(self,hero,"DMH_1302_CHALLENGE_11_03");	//Geht nicht. Mein Schwert ist weg.
		if(Npc_HasItems(hero,itmw_malgar_broadsword))
		{
			Info_ClearChoices(dmh_1302_malgar_challenge);
			Info_AddChoice(dmh_1302_malgar_challenge,"Ich habe deine Waffe... ähem... gefunden! Hier!",dmh_1302_malgar_challenge_found);
		};
		return;
	};
	if(ARENA_PLAYERBANNED)
	{
		AI_Output(self,hero,"DMH_1302_CHALLENGE_11_04");	//Nein, du bist verbannt!
	}
	else
	{
		if(!BRUTUS_PLAYERWONBEFORE)
		{
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_05");	//Wenn du Brutus besiegst, kämpfe ich gegen dich!
			AI_Output(hero,self,"DMH_1302_CHALLENGE_15_06");	//Das waren ja mehr als drei Silben in einem Satz!
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_07");	//(Brummel)
			return;
		};
		if(b_arena_getgladiatorvictoryranking(7898) == b_arena_getgladiatorvictoryranking(7618))
		{
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_08");	//Dir fehlt nur ein Sieg zum Titel!
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_09");	//Du musst gegen den Champion kämpfen.
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_10");	//Wenn du Thora besiegst, bist DU der neue Champion!
			return;
		};
		if((b_arena_getgladiatorranking(7898) == 1) && (b_arena_getgladiatorranking(7648) >= 3))
		{
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_11");	//Du bist der Champion, ich bin nicht mal zweiter.
			AI_Output(self,hero,"DMH_1302_CHALLENGE_11_12");	//Kämpfe gegen den zweiten!
			return;
		};
		AI_Output(self,hero,"DMH_1302_CHALLENGE_11_13");	//Gut!
		AI_Output(self,hero,"DMH_1302_CHALLENGE_11_14");	//Geh zum Arenameister!
		MALGAR_CHALLENGED = TRUE;
	};
};

func void dmh_1302_malgar_challenge_found()
{
	Info_ClearChoices(dmh_1302_malgar_challenge);
	AI_Output(hero,self,"DMH_1302_CHALLENGE_FOUND_15_01");	//Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero,self,itmw_malgar_broadsword,1);
	AI_Output(self,hero,"DMH_1302_CHALLENGE_FOUND_11_02");	//Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};


instance DMH_1302_MALGAR_HOWDY(C_Info)
{
	npc = dmh_1302_malgar;
	condition = dmh_1302_malgar_howdy_condition;
	information = dmh_1302_malgar_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Möchtest du dich unterhalten?";
};


func int dmh_1302_malgar_howdy_condition()
{
	if(Npc_KnowsInfo(hero,dmh_1302_malgar_quiet) && !dmh_1302_malgar_challenge_condition())
	{
		return TRUE;
	};
};

func void dmh_1302_malgar_howdy_info()
{
	AI_Output(hero,self,"DMH_1302_HOWDY_15_01");	//(leicht spöttisch) Möchtest du dich unterhalten?
	AI_Output(self,hero,"DMH_1302_HOWDY_11_02");	//Nein!
	AI_Output(hero,self,"DMH_1302_HOWDY_15_03");	//Das... dachte ich mir!
	AI_StopProcessInfos(self);
};

