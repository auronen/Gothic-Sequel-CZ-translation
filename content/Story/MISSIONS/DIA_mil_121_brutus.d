
instance MIL_121_BRUTUS_EXIT(C_Info)
{
	npc = mil_121_brutus;
	nr = 999;
	condition = mil_121_brutus_exit_condition;
	information = mil_121_brutus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mil_121_brutus_exit_condition()
{
	return TRUE;
};

func void mil_121_brutus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_121_BRUTUS_MYWEAPON(C_Info)
{
	npc = mil_121_brutus;
	nr = 1;
	condition = mil_121_brutus_myweapon_condition;
	information = mil_121_brutus_myweapon_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_121_brutus_myweapon_condition()
{
	if(Npc_HasItems(hero,itmw_brutus_longsword))
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

func int mil_121_brutus_myweapon_info()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"MIL_121_MYWEAPON_Info_06_01");	//Rück mein Schwert raus, oder ich mach dich platt!
	Info_ClearChoices(mil_121_brutus_myweapon);
	Info_AddChoice(mil_121_brutus_myweapon,"Das Schwert gefällt mir. Ich behalte es!",mil_121_brutus_myweapon_taken);
	Info_AddChoice(mil_121_brutus_myweapon,"Bleib locker, hier ist dein Schwert.",mil_121_brutus_myweapon_giveback);
};

func void mil_121_brutus_myweapon_giveback()
{
	Info_ClearChoices(mil_121_brutus_myweapon);
	AI_Output(hero,self,"MIL_121_MYWEAPON_GIVEBACK_15_01");	//Bleib locker, hier ist dein Schwert.
	B_GiveInvItems(hero,self,itmw_brutus_longsword,1);
	AI_Output(self,hero,"MIL_121_MYWEAPON_GIVEBACK_06_02");	//(bedrohlich) dann lass mal sehen, wieviel Durchhaltevermögen du hast..
	AI_StopProcessInfos(self);
};

func void mil_121_brutus_myweapon_taken()
{
	Info_ClearChoices(mil_121_brutus_myweapon);
	AI_Output(hero,self,"MIL_121_MYWEAPON_TAKEN_15_01");	//Das Schwert gefällt mir. Ich behalte es!
	AI_Output(self,hero,"MIL_121_MYWEAPON_TAKEN_06_02");	//Regel Nummer 3, du Trottel! Jetzt habe ich den Kampf gewonnen, Har Har Har!
	AI_StopProcessInfos(self);
	b_arena_abortfight(AF_PLAYERSTOLEWEAPON);
};


instance MIL_121_BRUTUS_CHALLENGED(C_Info)
{
	npc = mil_121_brutus;
	nr = 2;
	condition = mil_121_brutus_challenged_condition;
	information = mil_121_brutus_challenged_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_121_brutus_challenged_condition()
{
	if(BRUTUS_CHALLENGED && ARENA_PLAYERFIGHT && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void mil_121_brutus_challenged_info()
{
	if(Wld_IsTime(0,0,ARENABEGIN_H,ARENABEGIN_M))
	{
		if(Npc_GetDistToWP(self,ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
			AI_Output(self,hero,"MIL_121_CHALLENGED_06_01");	//Wir sehen uns in der Arena, Kleiner! Heute Abend!
		}
		else
		{
			AI_Output(self,hero,"MIL_121_CHALLENGED_06_02");	//Verschwinde in deine eigene Kammer!
		};
		AI_StopProcessInfos(self);
		return;
	};
	if(Npc_IsInRoutine(self,zs_arenafight))
	{
		AI_Output(self,hero,"MIL_121_CHALLENGED_06_03");	//(bedrohlich) Ich mach dich platt!!!
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		AI_Output(self,hero,"MIL_121_CHALLENGED_06_04");	//Wir sehen uns in der Arena, Kleiner! Morgen Abend!
		AI_StopProcessInfos(self);
		return;
	};
};


instance MIL_121_BRUTUS_PRENPC(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_prenpc_condition;
	information = mil_121_brutus_prenpc_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_121_brutus_prenpc_condition()
{
	if(ARENA_NPCFIGHT && ((ARENA_NPCCOMBO == AC_GOLIATH_BRUTUS) || (ARENA_NPCCOMBO == AC_BRUTUS_MALGAR)) && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void mil_121_brutus_prenpc_info()
{
	AI_Output(self,hero,"MIL_121_PRENPC_06_01");	//Verschwinde! Dieser Raum ist nur für Gladiatoren vor dem Kampf!
	AI_StopProcessInfos(self);
};


instance MIL_121_BRUTUS_GLADIATOR(C_Info)
{
	npc = mil_121_brutus;
	nr = 1;
	condition = mil_121_brutus_gladiator_condition;
	information = mil_121_brutus_gladiator_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du bist bestimmt einer der Gladiatoren!";
};


func int mil_121_brutus_gladiator_condition()
{
	return TRUE;
};

func int mil_121_brutus_gladiator_info()
{
	AI_Output(hero,self,"MIL_121_GLADIATOR_15_01");	//Du bist bestimmt einer der Gladiatoren!
	AI_Output(self,hero,"MIL_121_GLADIATOR_06_02");	//Woher willst du das wissen, Kleiner?
	Info_ClearChoices(mil_121_brutus_gladiator);
	Info_AddChoice(mil_121_brutus_gladiator,"Ich habe geraten.",mil_121_brutus_gladiator_noone);
	Info_AddChoice(mil_121_brutus_gladiator,"Was ist dein Problem?",mil_121_brutus_gladiator_provoke);
};

func void mil_121_brutus_gladiator_provoke()
{
	Info_ClearChoices(mil_121_brutus_gladiator);
	AI_Output(hero,self,"MIL_121_GLADIATOR_PROVOKE_15_01");	//Was ist dein Problem?
	if(Npc_HasItems(self,itmw_brutus_longsword))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,hero,"MIL_121_GLADIATOR_PROVOKE_06_02");	//Wenn du nicht deine Fresse hältst, hast DU ein Problem, Kleiner!
	AI_Output(self,hero,"MIL_121_GLADIATOR_PROVOKE_06_03");	//Vorlaute Spinner wie dich mach ich besonders gerne platt!
	if(Npc_HasItems(self,itmw_brutus_longsword))
	{
		AI_RemoveWeapon(self);
	};
};

func void mil_121_brutus_gladiator_noone()
{
	Info_ClearChoices(mil_121_brutus_gladiator);
	AI_Output(hero,self,"MIL_121_GLADIATOR_NOONE_15_01");	//Ich habe geraten.
	AI_Output(self,hero,"MIL_121_GLADIATOR_NOONE_06_02");	//Und ich rate dir mich nicht zu nerven, sonst mach ich dich platt!
};


instance MIL_121_BRUTUS_YOUMILITIA(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_youmilitia_condition;
	information = mil_121_brutus_youmilitia_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du siehst aber eher aus wie ein Milizsoldat!";
};


func int mil_121_brutus_youmilitia_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_gladiator) && !self.aivar[3])
	{
		return TRUE;
	};
};

func void mil_121_brutus_youmilitia_info()
{
	AI_Output(hero,self,"MIL_121_YOUMILITIA_15_01");	//Du siehst aber eher aus wie ein Milizsoldat!
	AI_Output(self,hero,"MIL_121_YOUMILITIA_06_02");	//Hör zu Kleiner, falls du es noch nicht gemerkt hast...
	AI_Output(self,hero,"MIL_121_YOUMILITIA_06_03");	//Du sprichst mit LEUTNANT Brutus, dem zweiten Mann in der Miliz gleich nach diesem verbitterten Arsch von Berengar.
	AI_Output(self,hero,"MIL_121_YOUMILITIA_06_04");	//Also zeig gefälligst ein bischen mehr Respekt oder ich mach dich platt!
};


instance MIL_121_BRUTUS_YOULIEUTENANT(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_youlieutenant_condition;
	information = mil_121_brutus_youlieutenant_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bist du nicht einer dieser beiden Leutnants der Miliz?";
};


func int mil_121_brutus_youlieutenant_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_gladiator) && self.aivar[3])
	{
		return TRUE;
	};
};

func void mil_121_brutus_youlieutenant_info()
{
	AI_Output(hero,self,"MIL_121_YOULIEUTENANT_15_01");	//Bist du nicht einer dieser beiden Leutnants der Miliz?
	AI_Output(self,hero,"MIL_121_YOULIEUTENANT_06_02");	//Das bin ich, Kleiner. Und deshalb solltest du gut aufpassen, wie du mir mir redest!
};


instance MIL_121_BRUTUS_CASSIAN(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_cassian_condition;
	information = mil_121_brutus_cassian_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!";
};


func int mil_121_brutus_cassian_condition()
{
	var C_Npc cassian;
	cassian = Hlp_GetNpc(mil_119_cassian);
	if((Npc_KnowsInfo(hero,mil_121_brutus_youmilitia) || Npc_KnowsInfo(hero,mil_121_brutus_youlieutenant)) && (Npc_KnowsInfo(hero,mil_119_cassian_hi) || cassian.aivar[3]))
	{
		return TRUE;
	};
};

func void mil_121_brutus_cassian_info()
{
	AI_Output(hero,self,"MIL_121_CASSIAN_15_01");	//Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!
	AI_Output(self,hero,"MIL_121_CASSIAN_06_02");	//(aggressiv)Cassian, ist ein Weichling! Eine Memme.
	AI_Output(self,hero,"MIL_121_CASSIAN_06_03");	//Der weiss schon garnicht mehr, wie sich ein Schwert überhaupt anfühlt.
	AI_Output(self,hero,"MIL_121_CASSIAN_06_04");	//Steht den ganzen Tag im Burghof, und gibt besserwisserische Kommentare an die Rekruten.
	AI_Output(self,hero,"MIL_121_CASSIAN_06_05");	//Der sollte sich liebermal hier in die Arena herunterwagen, dann werde ich ihm schon zeigen, wie man kämfpt.
	AI_Output(hero,self,"MIL_121_CASSIAN_15_06");	//(grins) Wenn ich ihn sehe, werde ich es ihm ausrichten.
};


instance MIL_121_BRUTUS_CHALLENGE(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_challenge_condition;
	information = mil_121_brutus_challenge_info;
	important = FALSE;
	permanent = TRUE;
	description = "Laß uns in der Arena klären, wer hier wen plattmacht!";
};


func int mil_121_brutus_challenge_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_gladiator) && !GRIM_CHALLENGED && !GOLIATH_CHALLENGED && !BRUTUS_CHALLENGED && !MALGAR_CHALLENGED && !THORA_CHALLENGED && ARENAMASTER_ACCEPTED && Wld_IsTime(0,0,ARENAPRE_H,ARENAPRE_M))
	{
		return TRUE;
	};
};

func void mil_121_brutus_challenge_info()
{
	AI_Output(hero,self,"MIL_121_CHALLENGE_15_01");	//Laß uns in der Arena klären, wer hier wen plattmacht!
	if(!Npc_HasItems(self,itmw_brutus_longsword))
	{
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_02");	//Irgend so ein Witzbold hat sich mein Schwert unter den Nagel gerissen. Wenn ich den erwische, mach ich ihn platt...
		if(Npc_HasItems(hero,itmw_brutus_longsword))
		{
			Info_ClearChoices(mil_121_brutus_challenge);
			Info_AddChoice(mil_121_brutus_challenge,"Ich habe deine Waffe... ähem... gefunden! Hier!",mil_121_brutus_challenge_found);
		};
		return;
	};
	if(ARENA_PLAYERBANNED)
	{
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_03");	//Sehr gerne!
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_04");	//Aber der Arenameister wird dich nicht kämpfen lassen, weil du Scheisse gebaut hast
	}
	else
	{
		if(b_arena_getgladiatorranking(7898) > (b_arena_getgladiatorranking(7717) + 1))
		{
			AI_Output(self,hero,"MIL_121_CHALLENGE_06_05");	//(verächtlich) PAHHHH!!! Ich mach meine Klinge doch nicht an Würstchen wie dir stumpf!
			AI_Output(self,hero,"MIL_121_CHALLENGE_06_06");	//Komm wieder wenn du Grim und Goliath ein paar Mal die Fresse poliert hast!
			return;
		};
		if(b_arena_getgladiatorranking(7898) <= (b_arena_getgladiatorranking(7717) - 2))
		{
			AI_Output(self,hero,"MIL_121_CHALLENGE_06_07");	//Such dir jemand anderen!
			AI_Output(hero,self,"MIL_121_CHALLENGE_15_08");	//Was ein Held du doch bist... Ein MAUL...held!
			return;
		};
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_09");	//Mit dem grössten Vergnügen, Kleiner!
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_10");	//Wenn du dich damit zum Arenameister traust, kann es heute abend losgehen.
		AI_Output(self,hero,"MIL_121_CHALLENGE_06_11");	//Har, har, har!
		BRUTUS_CHALLENGED = TRUE;
	};
};

func void mil_121_brutus_challenge_found()
{
	Info_ClearChoices(mil_121_brutus_challenge);
	AI_Output(hero,self,"MIL_121_Brutus_CHALLENGE_FOUND_15_01");	//Ich habe deine Waffe... ähem... gefunden! Hier!
	B_GiveInvItems(hero,self,itmw_brutus_longsword,1);
	AI_Output(self,hero,"MIL_121_Brutus_CHALLENGE_FOUND_06_02");	//Kann nur für dich hoffen, dass du es wirklich GEFUNDEN hast.
	AI_StopProcessInfos(self);
};


instance MIL_121_BRUTUS_WEAPON(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_weapon_condition;
	information = mil_121_brutus_weapon_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ist das da deine Waffe?";
};


func int mil_121_brutus_weapon_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_gladiator))
	{
		return TRUE;
	};
};

func void mil_121_brutus_weapon_info()
{
	AI_Output(hero,self,"MIL_121_WEAPON_15_01");	//Ist das da deine Waffe?
	if(Npc_HasItems(self,itmw_brutus_longsword))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,hero,"MIL_121_WEAPON_06_02");	//Das ist das schärfste Schwert im ganzen Lager!
	AI_Output(self,hero,"MIL_121_WEAPON_06_03");	//Ich schleife es täglich... extra für Spinner wie dich!
	if(Npc_HasItems(self,itmw_brutus_longsword))
	{
		AI_RemoveWeapon(self);
	};
};


instance MIL_121_BRUTUS_VICTORIES(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_victories_condition;
	information = mil_121_brutus_victories_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du hast bestimmt schon oft gewonnen, oder?";
};


func int mil_121_brutus_victories_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_gladiator))
	{
		return TRUE;
	};
};

func void mil_121_brutus_victories_info()
{
	AI_Output(hero,self,"MIL_121_VICTORIES_15_01");	//Du hast bestimmt schon oft gewonnen, oder?
	AI_Output(self,hero,"MIL_121_VICTORIES_06_02");	//Ich bin einer der besten Gladiatoren hier!
	AI_Output(self,hero,"MIL_121_VICTORIES_06_03");	//Und jetzt verzieh dich.
	AI_TurnAway(hero,self);
	AI_Output(hero,self,"MIL_121_VICTORIES_15_04");	//(zu sich selbst) Was ein Arsch!
	AI_Output(self,hero,"MIL_121_VICTORIES_06_05");	//Das hab ich gehört, Kleiner!
	AI_StopProcessInfos(self);
};


instance MIL_121_BRUTUS_HOWDY(C_Info)
{
	npc = mil_121_brutus;
	condition = mil_121_brutus_howdy_condition;
	information = mil_121_brutus_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Na, ist deine Klinge noch schön scharf?";
};


func int mil_121_brutus_howdy_condition()
{
	if(Npc_KnowsInfo(hero,mil_121_brutus_weapon) && Npc_KnowsInfo(hero,mil_121_brutus_victories) && !mil_121_brutus_challenge_condition())
	{
		return TRUE;
	};
};

func void mil_121_brutus_howdy_info()
{
	AI_Output(hero,self,"MIL_121_HOWDY_15_01");	//Na, ist deine Klinge noch schön scharf?
	AI_Output(self,hero,"MIL_121_HOWDY_06_02");	//...wenn du nicht aufhörst mir dumm zu kommen, dann...
	AI_Output(hero,self,"MIL_121_HOWDY_15_03");	//(spöttisch)...machst du mich platt? Wir werden sehen!
	AI_StopProcessInfos(self);
};

