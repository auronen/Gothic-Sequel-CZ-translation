///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_EXIT (C_INFO)
{
	npc			=  MIN_306_Grim;
	nr			=  999;
	condition	=  Info_Grim_EXIT_Condition;
	information	=  Info_Grim_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	Info_Grim_EXIT_Condition()
{
	return TRUE;
};

func void	Info_Grim_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};









//#####################################################################
//##
//##
//##						ARENA-KAMPF
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info MYWEAPON
///////////////////////////////////////////////////////////////////////
instance MIN_306_Grim_MYWEAPON		(C_INFO)
{
	npc			= MIN_306_Grim;
	nr			= 1;
	condition	= MIN_306_Grim_MYWEAPON_Condition;
	information	= MIN_306_Grim_MYWEAPON_Info;
	important	= TRUE;
	permanent	= TRUE;
};

func int MIN_306_Grim_MYWEAPON_Condition ()
{
	if	Npc_HasItems(hero, ItMw_Grim_Pickaxe)
	{
		if	Arena_FightRunning
		&&	Arena_PlayerFight
		&&	Grim_Challenged
		&&	!Arena_PlayerStoleWeapon
		{
			return			TRUE;
		}
		else
		{
			//self.aivar		[AIV_PLAYERHASMYWEAPON]	=	TRUE;
			return 			FALSE;
		};
	};
};

func void MIN_306_Grim_MYWEAPON_Info ()
{
	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoNpc			(self, hero);
//	AI_Output			(self, hero, "MIN_306_Grim_MYWEAPON_Info_10_01"); //Hey, du hast dir meine Spitzhacke gekrallt!
	AI_Output			(self, hero, "MIN_306_Grim_MYWEAPON_Info_10_01"); //Hej, ty jsi mi ukradl můj krumpáč!

	Info_ClearChoices	(MIN_306_Grim_MYWEAPON);
//	Info_AddChoice		(MIN_306_Grim_MYWEAPON, "Du hast sie fallen gelassen, jetzt gehört sie mir!",	MIN_306_Grim_MYWEAPON_TAKEN );
	Info_AddChoice		(MIN_306_Grim_MYWEAPON, "Upustil jsi ho a teď je můj!",					MIN_306_Grim_MYWEAPON_TAKEN );
//	Info_AddChoice		(MIN_306_Grim_MYWEAPON, "Hier hast du sie zurück.",						MIN_306_Grim_MYWEAPON_GIVEBACK );
	Info_AddChoice		(MIN_306_Grim_MYWEAPON, "Tady ho máš zpátky.",							MIN_306_Grim_MYWEAPON_GIVEBACK );
};

func void MIN_306_Grim_MYWEAPON_GIVEBACK ()
{
	Info_ClearChoices		(MIN_306_Grim_MYWEAPON);
//	AI_Output				(hero, self, "MIN_306_Grim_MYWEAPON_GIVEBACK_15_01"); //Hier hast du sie zurück.
	AI_Output				(hero, self, "MIN_306_Grim_MYWEAPON_GIVEBACK_15_01"); //Tady ho máš zpátky.
	B_GiveInvItems			(hero, self, ItMw_Grim_Pickaxe, 1);
//	AI_Output				(self, hero, "MIN_306_Grim_MYWEAPON_GIVEBACK_10_02"); //(säuerlich) Dann kann es ja weitergehen!
	AI_Output				(self, hero, "MIN_306_Grim_MYWEAPON_GIVEBACK_10_02"); //(kysele) Tak to tedy můžeme pokračovat!

	AI_StopProcessInfos		(self);

};

func void MIN_306_Grim_MYWEAPON_TAKEN ()
{
	Info_ClearChoices		(MIN_306_Grim_MYWEAPON);
//	AI_Output				(hero, self, "MIN_306_Grim_MYWEAPON_TAKEN_15_01"); //Du hast sie fallen gelassen, jetzt gehört sie mir!
	AI_Output				(hero, self, "MIN_306_Grim_MYWEAPON_TAKEN_15_01"); //Upustil jsi ho a teď je můj!
//	AI_Output				(self, hero, "MIN_306_Grim_MYWEAPON_TAKEN_10_02"); //Du kennst wohl Regel Nummer 3 nicht!
	AI_Output				(self, hero, "MIN_306_Grim_MYWEAPON_TAKEN_10_02"); //Ty neznáš pravidlo číslo 3!
	AI_StopProcessInfos		(self);

	B_Arena_AbortFight		(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_CHALLENGED (C_INFO)
{
	npc				= MIN_306_Grim;
	nr				= 2;
	condition		= Info_Grim_CHALLENGED_Condition;
	information		= Info_Grim_CHALLENGED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	Info_Grim_CHALLENGED_Condition()
{
	if	Grim_Challenged
	&&	Arena_PlayerFight
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	Info_Grim_CHALLENGED_Info()
{
	if	Wld_IsTime(0,0,	ARENABEGIN_H, ARENABEGIN_M)
	{
		if	(Npc_GetDistToWP	(self, ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
//			AI_Output			(self, hero,"Info_Grim_CHALLENGED_10_01"); //Wir sehen uns heute abend in der Arena!
			AI_Output			(self, hero,"Info_Grim_CHALLENGED_10_01"); //Uvidíme se dnes večer v aréně!
		}
		else
		{
//			AI_Output			(self, hero,"Info_Grim_CHALLENGED_10_02"); //Ich versuche mich auf den Kampf zu konzentrieren! Geh rüber in deinen Raum!
			AI_Output			(self, hero,"Info_Grim_CHALLENGED_10_02"); //Snažím se soustředit na boj! Jdi do své vlastní komory!
		};

		AI_StopProcessInfos		(self);
		return;
	};

	if	Npc_IsInRoutine(self, ZS_ArenaFight)
	{
//		AI_Output				(self, hero,"Info_Grim_CHALLENGED_10_03"); //Jetzt ist nicht die Zeit zum Reden!
		AI_Output				(self, hero,"Info_Grim_CHALLENGED_10_03"); //Teď není čas se bavit!
		AI_StopProcessInfos		(self);
		return;
	}
	else
	{
//		AI_Output				(self, hero,"Info_Grim_CHALLENGED_10_04"); //Wir sehen uns morgen Abend in der Arena!
		AI_Output				(self, hero,"Info_Grim_CHALLENGED_10_04"); //Uvidíme se zítra večer v aréně!
		AI_StopProcessInfos		(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_PRENPC (C_INFO)
{
	npc				= MIN_306_Grim;
	nr				= 3;
	condition		= Info_Grim_PRENPC_Condition;
	information		= Info_Grim_PRENPC_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	Info_Grim_PRENPC_Condition()
{
	if	Arena_NpcFight
	&&	(Arena_NpcCombo == AC_GRIM_GOLIATH)
	&&	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	Info_Grim_PRENPC_Info()
{
//	AI_Output			(self, hero,"Info_Grim_PRENPC_10_01"); //Stör mich jetzt nicht, ich muß mich auf den Kampf vorbereiten!
	AI_Output			(self, hero,"Info_Grim_PRENPC_10_01"); //Teď mě neruš, musím se připravit na souboj!
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info KNOWYOU
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_KNOWYOU (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_KNOWYOU_Condition;
	information		= Info_Grim_KNOWYOU_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Dein Name kommt mir bekannt vor!";
	description		= "Tvé jméno je mi nějaké povědomé!";
};

func int	Info_Grim_KNOWYOU_Condition()
{
	return TRUE;
};

func void	Info_Grim_KNOWYOU_Info()
{
//	AI_Output			(hero, self,"Info_Grim_KNOWYOU_15_01"); //Dein Name kommt mir bekannt vor!
	AI_Output			(hero, self,"Info_Grim_KNOWYOU_15_01"); //Tvé jméno je mi nějaké povědomé!
//	AI_Output			(self, hero,"Info_Grim_KNOWYOU_10_02"); //Na und? Ist ja auch kein seltener Name!
	AI_Output			(self, hero,"Info_Grim_KNOWYOU_10_02"); //No a? Není to vzácné jméno.
};

///////////////////////////////////////////////////////////////////////
//	Info ARENA
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_ARENA (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_ARENA_Condition;
	information		= Info_Grim_ARENA_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Kämpfst du in der Arena?";
	description		= "Bojuješ v aréně?";
};

func int	Info_Grim_ARENA_Condition()
{
	return TRUE;
};

func void	Info_Grim_ARENA_Info()
{
//	AI_Output			(hero, self,"Info_Grim_ARENA_15_01"); //Kämpfst du in der Arena?
	AI_Output			(hero, self,"Info_Grim_ARENA_15_01"); //Bojuješ v aréně?
//	AI_Output			(self, hero,"Info_Grim_ARENA_10_02"); //Du bist neu hier, richtig?
	AI_Output			(self, hero,"Info_Grim_ARENA_10_02"); //Ty jsi tady nový, mám pavdu?

	Info_ClearChoices	(Info_Grim_ARENA);
//	Info_AddChoice		(Info_Grim_ARENA,	"Nicht wirklich!",									Info_Grim_ARENA_NO);
	Info_AddChoice		(Info_Grim_ARENA,	"Nemáš!",											Info_Grim_ARENA_NO);
//	Info_AddChoice		(Info_Grim_ARENA,	"Sozusagen! Bin erst vor kurzem angekommen.",		Info_Grim_ARENA_YES);
	Info_AddChoice		(Info_Grim_ARENA,	"Dá se to tak říct! Přišel jsem před nedávnem.",	Info_Grim_ARENA_YES);
};

func void	Info_Grim_ARENA_YES ()
{
	Info_ClearChoices	(Info_Grim_ARENA);

//	AI_Output			(hero, self,"Info_Grim_ARENA_YES_15_01"); //Sozusagen! Bin erst vor kurzem angekommen.
	AI_Output			(hero, self,"Info_Grim_ARENA_YES_15_01"); //Dá se to tak říct! Přišel jsem před nedávnem.
//	AI_Output			(self, hero,"OUMULTI_Training_10_00"); //Du bist nicht gerade gut in Form. Könntest ein bischen Training gebrauchen!
	AI_Output			(self, hero,"OUMULTI_Training_10_00"); //Nejsi v dobré kondici. Potřeboval bys nějaký trénink!
//	AI_Output			(self, hero,"OUMULTI_Freundschaftskampf_10_00"); //Wie wär's mit einem Freundschaftskämpfchen in der Arena!?
	AI_Output			(self, hero,"OUMULTI_Freundschaftskampf_10_00"); //Co bys řekl takovému přátelskému souboji v aréně!?
};

func void	Info_Grim_ARENA_NO ()
{
	Info_ClearChoices	(Info_Grim_ARENA);

//	AI_Output			(hero, self,"Info_Grim_ARENA_NO_15_01"); //Nicht wirklich!
	AI_Output			(hero, self,"Info_Grim_ARENA_NO_15_01"); //Nemáš!
//	AI_Output			(self, hero,"Info_Grim_ARENA_NO_10_02"); //(misstrauisch) Hab dich noch nie hier gesehen!
	AI_Output			(self, hero,"Info_Grim_ARENA_NO_10_02"); //(nedůvěřivě) Nikdy jsem tě tu neviděl!
//	AI_Output			(self, hero,"OUMULTI_Training_10_00"); //Du bist nicht gerade gut in Form. Könntest ein bischen Training gebrauchen!
	AI_Output			(self, hero,"OUMULTI_Training_10_00"); //Nejsi v dobré kondici. Potřeboval bys nějaký trénink!
//	AI_Output			(self, hero,"OUMULTI_Freundschaftskampf_10_00"); //Wie wär's mit einem Freundschaftskämpfchen in der Arena!?
	AI_Output			(self, hero,"OUMULTI_Freundschaftskampf_10_00"); //Co bys řekl takovému přátelskému souboji v aréně!?
};

///////////////////////////////////////////////////////////////////////
//	Info FRIENDFIGHT
///////////////////////////////////////////////////////////////////////
instance MIN_306_Grim_FRIENDFIGHT		(C_INFO)
{
	npc		 = 	MIN_306_Grim;
	condition	 = 	MIN_306_Grim_FRIENDFIGHT_Condition;
	information	 = 	MIN_306_Grim_FRIENDFIGHT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Na dann zeig mal was du drauf hast!";
	description	 = 	"No tak ukaž co umíš!";
};

func int MIN_306_Grim_FRIENDFIGHT_Condition ()
{
	if	Npc_KnowsInfo(hero,Info_Grim_ARENA)
	{
		return TRUE;
	};
};

func void MIN_306_Grim_FRIENDFIGHT_Info ()
{
//	AI_Output			(hero, self, "MIN_306_FRIENDFIGHT_15_01"); //Na dann zeig mal was du drauf hast!
	AI_Output			(hero, self, "MIN_306_FRIENDFIGHT_15_01"); //No tak ukaž co umíš!
//	AI_Output			(self, hero, "MIN_306_FRIENDFIGHT_10_02"); //Moment, nicht so schnell!
	AI_Output			(self, hero, "MIN_306_FRIENDFIGHT_10_02"); //Moment, ne tak rychle!
//	AI_Output			(self, hero, "MIN_306_FRIENDFIGHT_10_03"); //Hol dir erst vom Arenameister die Erlaubnis für einen Kampf. Du findest ihn oben am Arenaplatz.
	AI_Output			(self, hero, "MIN_306_FRIENDFIGHT_10_03"); //Nejprve získej povolení k boji od mistra arény. Najdeš ho nad arénou.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_CHALLENGE (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_CHALLENGE_Condition;
	information		= Info_Grim_CHALLENGE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich will in der Arena gegen dich kämpfen!";
	description		= "Chtěl bych se proti tobě utkat v aréně!";
};

func int	Info_Grim_CHALLENGE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	&&	!Grim_Challenged
	&&	!Goliath_Challenged
	&&	!Brutus_Challenged
	&&	!Malgar_Challenged
	&&	!Thora_Challenged
	&&	Arenamaster_Accepted
	&&	Wld_IsTime(0,0, ARENAPRE_H,ARENAPRE_M)
	{
		return TRUE;
	};
};

func void	Info_Grim_CHALLENGE_Info()
{
//	AI_Output			(hero, self,"Info_Grim_CHALLENGE_15_01"); //Ich will in der Arena gegen dich kämpfen!
	AI_Output			(hero, self,"Info_Grim_CHALLENGE_15_01"); //Chtěl bych se proti tobě utkat v aréně!

	if	!Npc_HasItems(self, ItMw_Grim_Pickaxe)
	{
//		AI_Output		(self, hero,"Info_Grim_CHALLENGE_10_02"); //Ohne meine Spitzhacke trete ich nicht an.
		AI_Output		(self, hero,"Info_Grim_CHALLENGE_10_02"); //Bez mého krumpáče s tebou bojovat nebudu.

		if	Npc_HasItems(hero, ItMw_Grim_Pickaxe)
		{
			Info_ClearChoices	(Info_Grim_CHALLENGE);
//			Info_AddChoice		(Info_Grim_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!",Info_Grim_CHALLENGE_FOUND);
			Info_AddChoice		(Info_Grim_CHALLENGE, "Mám tvou zbraň... ehm... našel jsem ji! Tady!",Info_Grim_CHALLENGE_FOUND);
		};
		return;
	};

	if	Arena_PlayerBanned
	{
//		AI_Output		(self, hero,"Info_Grim_CHALLENGE_10_03"); //Der Arenameister ist stinksauer auf dich! Du musst ihn erst wieder besänftigen!
		AI_Output		(self, hero,"Info_Grim_CHALLENGE_10_03"); //Mistr arény je na tebe naštvaný! Nejprve si ho musíš udobřit!
	}
	else
	{
		if	(hero.aivar[AIV_ARENA_VICTORIES] <= self.aivar[AIV_ARENA_VICTORIES])
		{

//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_04"); //Seeehr gut!
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_04"); //Velice dobře!
//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_05"); //Am besten gehst du gleich zum Arenameister und gibst dein Preisgeld ab.
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_05"); //Raději běž k mistrovi arény a zaplať mu.

			Grim_HeroKnowsPrizeMoney = TRUE;
			Grim_Challenged	= TRUE;

			return;
		};

		if	(hero.aivar[AIV_ARENA_VICTORIES] == (self.aivar[AIV_ARENA_VICTORIES]+1))
		{
//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_06"); //Ich weiss nicht... also gut, einmal versuche ich es noch gegen dich!
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_06"); //Nevím... ale dobře, jednou to proti tobě zkusím!
//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_07"); //Vergiss nicht dein Preisgeld beim Arenameister abzugeben.
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_07"); //Nezapomeň zaplatit mistrovi arény poplatek!

			Grim_Challenged	= TRUE;

			return;
		};

		//else
		if	Gotmar_GoliathReturned
		{
//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_08"); //Du bist zu stark für mich! Ich warte lieber, bis Goliath wieder zurückkommt.
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_08"); //Jsi na mě moc silný! Raději počkám, až se vrátí Goliáš.
//			AI_Output	(hero, self,"Info_Grim_CHALLENGE_15_09"); //Da kannst du lange warten (grins)
			AI_Output	(hero, self,"Info_Grim_CHALLENGE_15_09"); //No to budeš čekat dlouho. (zubí se)
		}
		else
		{		
//			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_10"); //Vergiss es! Ich kämpfe lieber gegen Goliath, da hab ich bessere Chancen.
			AI_Output	(self, hero,"Info_Grim_CHALLENGE_10_10"); //Na to zapomeň! Raději budu bojovat proti Goliášovi, tam mám vyšší šanci.
		};
	};
};

func void Info_Grim_CHALLENGE_FOUND ()
{
	Info_ClearChoices	(Info_Grim_CHALLENGE);
//	AI_Output			(hero, self,"Info_Grim_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	AI_Output			(hero, self,"Info_Grim_CHALLENGE_FOUND_15_01"); //Mám tvou zbraň... ehm... našel jsem ji! Tady!
	B_GiveInvItems		(hero, self, ItMw_Grim_Pickaxe, 1);
//	AI_Output			(self, hero,"Info_Grim_CHALLENGE_FOUND_10_02"); //Da ist sie ja, meine geliebte Waffe. Gib her.
	AI_Output			(self, hero,"Info_Grim_CHALLENGE_FOUND_10_02"); //Tak tady je! Moje milovaná zbraň. Dej ji sem.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PRIZE
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_PRIZE (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_PRIZE_Condition;
	information		= Info_Grim_PRIZE_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Preisgeld? Was für ein Preisgeld?";
	description		= "Poplatek? Jaký poplatek?";
};

func int	Info_Grim_PRIZE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	&&	Grim_HeroKnowsPrizeMoney
	{
		return TRUE;
	};
};

func void	Info_Grim_PRIZE_Info()
{
//	AI_Output			(hero, self,"Info_Grim_PRIZE_15_01"); //Preisgeld? Was für ein Preisgeld?
	AI_Output			(hero, self,"Info_Grim_PRIZE_15_01"); //Poplatek? Jaký poplatek?
//	AI_Output			(self, hero,"Info_Grim_PRIZE_10_02"); //Wir Gladiatoren kämpfen natürlich um Geld. Sonst macht das Ganze doch gar keinen Spaß.
	AI_Output			(self, hero,"Info_Grim_PRIZE_10_02"); //My gladiátoři samozřejmě bojujeme za peníze. Jinak by to vůbec nebyla zábava!
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_WEAPON (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_WEAPON_Condition;
	information		= Info_Grim_WEAPON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Welche Waffe bevorzugst du?";
	description		= "Jakou používáš zbraň?";
};

func int	Info_Grim_WEAPON_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	{
		return TRUE;
	};
};

func void	Info_Grim_WEAPON_Info()
{
//	AI_Output			(hero, self,"Info_Grim_WEAPON_15_01"); //Welche Waffe bevorzugst du?
	AI_Output			(hero, self,"Info_Grim_WEAPON_15_01"); //Jakou používáš zbraň?

	if	Npc_HasItems	(self, ItMw_Grim_Pickaxe)
	{
		AI_ReadyMeleeWeapon(self);
	};
//	AI_Output			(self, hero,"Info_Grim_WEAPON_10_02"); //Mit dieser Spitzhacke habe ich jahrelang Erz geschürft, die ist quasi mit meinem Körper verwachsen.
	AI_Output			(self, hero,"Info_Grim_WEAPON_10_02"); //Tímto krumpáčem jsem roku kutal rudu, téměř jsem s ním srostl!
	if	Npc_HasItems	(self, ItMw_Grim_Pickaxe)
	{
		AI_RemoveWeapon	(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_VICTORIES (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_VICTORIES_Condition;
	information		= Info_Grim_VICTORIES_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wieviele Kämpfe hast du gewonnen?";
	description		= "Kolik soubojů jsi vyhrál?";
};

func int	Info_Grim_VICTORIES_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	{
		return TRUE;
	};
};

func void	Info_Grim_VICTORIES_Info()
{
//	AI_Output			(hero, self,"Info_Grim_VICTORIES_15_01"); //Wieviele Kämpfe hast du gewonnen?
	AI_Output			(hero, self,"Info_Grim_VICTORIES_15_01"); //Kolik soubojů jsi vyhrál?
//	AI_Output			(self, hero,"Info_Grim_VICTORIES_10_02"); //Also... puhhh.... wieviel waren es doch gleich...
	AI_Output			(self, hero,"Info_Grim_VICTORIES_10_02"); //Noo... pfff.... kolik jich vlastně bylo...
//	AI_Output			(self, hero,"Info_Grim_VICTORIES_10_03"); //Wenn du mich so direkt fragst... ja da waren auf jeden Fall schon mal Siege.... bestimmt...
	AI_Output			(self, hero,"Info_Grim_VICTORIES_10_03"); //Když se mě takhle přímo ptáš... ano, byla tam i nějaká ta vítězství.... určitě...
//	AI_Output			(hero, self,"Info_Grim_VICTORIES_15_04"); //OK, OK, ich denke ich bin im Bilde!
	AI_Output			(hero, self,"Info_Grim_VICTORIES_15_04"); //OK, OK, myslím, že jsem v obraze!
};

///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance	Info_Grim_WHY (C_INFO)
{
	npc				= MIN_306_Grim;
	condition		= Info_Grim_WHY_Condition;
	information		= Info_Grim_WHY_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Warum kämpfst du in der Arena?";
	description		= "Proč bojuješ v aréně?";
};

func int	Info_Grim_WHY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	{
		return TRUE;
	};
};

func void	Info_Grim_WHY_Info()
{
//	AI_Output			(hero, self,"Info_Grim_WHY_15_01"); //Warum kämpfst du in der Arena?
	AI_Output			(hero, self,"Info_Grim_WHY_15_01"); //Proč bojuješ v aréně?
//	AI_Output			(self, hero,"Info_Grim_WHY_10_02"); //Hab keine Lust mehr auf Erzhacken! Jetzt will ich mir hier etwas Silber zu verdienen.
	AI_Output			(self, hero,"Info_Grim_WHY_10_02"); //Už nemám chuť kutat rudu! Teď si chci trošku stříbra vydělat tady.
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance MIN_306_Grim_HOWDY		(C_INFO)
{
	npc		 = 	MIN_306_Grim;
	condition	 = 	MIN_306_Grim_HOWDY_Condition;
	information	 = 	MIN_306_Grim_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Na, wie laufen die Kämpfe?";
	description	 = 	"No, jak ti jdou zápasy?";
};

func int MIN_306_Grim_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero, Info_Grim_ARENA)
	&&	Npc_KnowsInfo(hero, Info_Grim_WEAPON)
	&&	!Info_Grim_CHALLENGE_Condition()
	{
		return TRUE;
	};
};

func void MIN_306_Grim_HOWDY_Info ()
{
//	AI_Output			(hero, self, "MIN_306_HOWDY_15_01"); //Na, wie laufen die Kämpfe?
	AI_Output			(hero, self, "MIN_306_HOWDY_15_01"); //No, jak ti jdou zápasy?
//	AI_Output			(self, hero, "MIN_306_HOWDY_10_02"); //Schlecht Mann! Ich habe bald kein Preisgeld mehr, das ich setzen könnte!
	AI_Output			(self, hero, "MIN_306_HOWDY_10_02"); //Špatně chlape! Už nemám žádné peníze, které bych mohl před zápasem složit!
	AI_StopProcessInfos	(self);
};































