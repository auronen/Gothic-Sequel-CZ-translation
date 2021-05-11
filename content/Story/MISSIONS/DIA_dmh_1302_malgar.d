///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_EXIT (C_INFO)
{
	npc			=  DMH_1302_Malgar;
	nr			=  999;
	condition	=  DMH_1302_Malgar_EXIT_Condition;
	information	=  DMH_1302_Malgar_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	DMH_1302_Malgar_EXIT_Condition()
{
	return TRUE;
};

func void	DMH_1302_Malgar_EXIT_Info()
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
instance DMH_1302_Malgar_MYWEAPON		(C_INFO)
{
	npc			= DMH_1302_Malgar;
	nr			= 1;
	condition	= DMH_1302_Malgar_MYWEAPON_Condition;
	information	= DMH_1302_Malgar_MYWEAPON_Info;
	important	= TRUE;
	permanent	= TRUE;
};

func int DMH_1302_Malgar_MYWEAPON_Condition ()
{
	if	Npc_HasItems(hero, ItMw_Malgar_Broadsword)
	{
		if	Arena_FightRunning
		&&	Arena_PlayerFight
		&&	Malgar_Challenged
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

func int DMH_1302_Malgar_MYWEAPON_Info ()
{
	AI_SetWalkmode			(self, NPC_RUN);
	AI_GotoNpc				(self, hero);
//	AI_Output				(self, hero, "DMH_1302_MYWEAPON_Info_11_01"); //(eiskalt) Gib mir meine Waffe! JETZT!
	AI_Output				(self, hero, "DMH_1302_MYWEAPON_Info_11_01"); //(ledově) Vrať mi moji zbraň! HNED!

	Info_ClearChoices		(DMH_1302_Malgar_MYWEAPON);
// 	Info_AddChoice			(DMH_1302_Malgar_MYWEAPON, "Nein, ich behalte sie!",						DMH_1302_Malgar_MYWEAPON_TAKEN );
	Info_AddChoice			(DMH_1302_Malgar_MYWEAPON, "Ne, nechám si ji!",						DMH_1302_Malgar_MYWEAPON_TAKEN );
//	Info_AddChoice			(DMH_1302_Malgar_MYWEAPON, "Hier hast du sie zurück!",		DMH_1302_Malgar_MYWEAPON_GIVEBACK );
	Info_AddChoice			(DMH_1302_Malgar_MYWEAPON, "Tady ji máš zpátky!",		DMH_1302_Malgar_MYWEAPON_GIVEBACK );
};

func void DMH_1302_Malgar_MYWEAPON_GIVEBACK ()
{
	Info_ClearChoices		(DMH_1302_Malgar_MYWEAPON);
//	AI_Output				(hero, self, "DMH_1302_MYWEAPON_GIVEBACK_15_01"); //Hier hast du sie zurück!
	AI_Output				(hero, self, "DMH_1302_MYWEAPON_GIVEBACK_15_01"); //Tady ji máš zpátky!
	B_GiveInvItems			(hero, self, ItMw_Malgar_Broadsword, 1);
//	AI_Output				(self, hero, "DMH_1302_MYWEAPON_GIVEBACK_11_02"); //(souverän) Gut!
	AI_Output				(self, hero, "DMH_1302_MYWEAPON_GIVEBACK_11_02"); //(suverénně) Dobře!
	AI_StopProcessInfos		(self);

};

func void DMH_1302_Malgar_MYWEAPON_TAKEN ()
{
	Info_ClearChoices		(DMH_1302_Malgar_MYWEAPON);
//	AI_Output				(hero, self, "DMH_1302_MYWEAPON_TAKEN_15_01"); //Nein, ich behalte sie!
	AI_Output				(hero, self, "DMH_1302_MYWEAPON_TAKEN_15_01"); //Ne, nechám si ji!
//	AI_Output				(self, hero, "DMH_1302_MYWEAPON_TAKEN_11_02"); //(verständnislos) Ts ts ts, Regel Nummer 3...
	AI_Output				(self, hero, "DMH_1302_MYWEAPON_TAKEN_11_02"); //(nechápavě) Ts ts ts, pravidlo číslo tři...
	AI_StopProcessInfos		(self);

	B_Arena_AbortFight		(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_CHALLENGED (C_INFO)
{
	npc				= DMH_1302_Malgar;
	nr		= 2;
	condition		= DMH_1302_Malgar_CHALLENGED_Condition;
	information		= DMH_1302_Malgar_CHALLENGED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	DMH_1302_Malgar_CHALLENGED_Condition()
{
	if	Malgar_Challenged
	&&	Arena_PlayerFight
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	DMH_1302_Malgar_CHALLENGED_Info()
{
	if	Wld_IsTime(0,0,	ARENABEGIN_H, ARENABEGIN_M)
	{
		if	(Npc_GetDistToWP	(self, ARENA_WP_LEFT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
//			AI_Output			(self, hero,"DMH_1302_CHALLENGED_11_01"); //(grüssend) Heute abend, Gladiator... // Neznám kontext, tak nevím přesně jak to přeložit.
			AI_Output			(self, hero,"DMH_1302_CHALLENGED_11_01"); //(pozdrav) Dnes večer, gladiátor... 
		}
		else
		{
//			AI_Output			(self, hero,"DMH_1302_CHALLENGED_11_02"); //Geh rüber!
			AI_Output			(self, hero,"DMH_1302_CHALLENGED_11_02"); //???! //Tady nevím a neznám kontext.
		};

		AI_StopProcessInfos		(self);
		return;
	};

	if	Npc_IsInRoutine(self, ZS_ArenaFight)
	{
//		AI_Output				(self, hero,"DMH_1302_CHALLENGED_11_03"); //Kämpfe Gladiator! // Neznám kontext, tak nevím přesně jak to přeložit.
		AI_Output				(self, hero,"DMH_1302_CHALLENGED_11_03"); //Bojovat s gladiátorem!
		AI_StopProcessInfos		(self);
		return;
	}
	else
	{
//		AI_Output				(self, hero,"DMH_1302_CHALLENGED_11_04"); //(grüssend) Morgen abend, Gladiator... // Neznám kontext, tak nevím přesně jak to přeložit.
			AI_Output				(self, hero,"DMH_1302_CHALLENGED_11_04"); //(pozdrav) Zítra večer, gladiátor...
		AI_StopProcessInfos		(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_PRENPC (C_INFO)
{
	npc				= DMH_1302_Malgar;
	condition		= DMH_1302_Malgar_PRENPC_Condition;
	information		= DMH_1302_Malgar_PRENPC_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	DMH_1302_Malgar_PRENPC_Condition()
{
	if	Arena_NpcFight
	&&	((Arena_NpcCombo == AC_BRUTUS_MALGAR) || (Arena_NpcCombo == AC_MALGAR_THORA))
	&&	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	DMH_1302_Malgar_PRENPC_Info()
{
//	AI_Output			(self, hero,"DMH_1302_PRENPC_11_01"); //Raus hier! // Neznám kontext, tak nevím přesně jak to přeložit.
	AI_Output			(self, hero,"DMH_1302_PRENPC_11_01"); //Jít pryč!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_GLADIATOR		(C_INFO)
{
	npc		 	= 	DMH_1302_Malgar;
	nr		 	= 	1;
	condition	= 	DMH_1302_Malgar_GLADIATOR_Condition;
	information	= 	DMH_1302_Malgar_GLADIATOR_Info;
	important	=	FALSE;
	permanent	=	FALSE;

//	description	=	"Du bist Gladiator, oder?";
	description	=	"Ty jsi gladiátor, nebo...?";
};

func int DMH_1302_Malgar_GLADIATOR_Condition ()
{
	return TRUE;
};

func int DMH_1302_Malgar_GLADIATOR_Info ()
{
//	AI_Output			(hero, self, "DMH_1302_GLADIATOR_15_01"); //Du bist Gladiator, oder?
	AI_Output			(hero, self, "DMH_1302_GLADIATOR_15_01"); //Ty jsi gladiátor, nebo...?
//	AI_Output			(self, hero, "DMH_1302_GLADIATOR_11_02"); //Ja.
	AI_Output			(self, hero, "DMH_1302_GLADIATOR_11_02"); //Jo.
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_WEAPON (C_INFO)
{
	npc				= DMH_1302_Malgar;
	condition		= DMH_1302_Malgar_WEAPON_Condition;
	information		= DMH_1302_Malgar_WEAPON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Kämpfst wohl mit dem Schwert.";
	description		= "Asi bojuješ s mečem.";
};

func int	DMH_1302_Malgar_WEAPON_Condition()
{
	if	Npc_KnowsInfo(hero, DMH_1302_Malgar_GLADIATOR)
	{
		return TRUE;
	};
};

func void	DMH_1302_Malgar_WEAPON_Info()
{
//	AI_Output			(hero, self,"DMH_1302_WEAPON_15_01"); //Kämpfst wohl mit dem Schwert.
	AI_Output			(hero, self,"DMH_1302_WEAPON_15_01"); //Asi bojuješ s mečem.
//	AI_Output			(self, hero,"DMH_1302_WEAPON_11_02"); //Ja!
	AI_Output			(self, hero,"DMH_1302_WEAPON_11_02"); //Jo!
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_VICTORIES (C_INFO)
{
	npc				= DMH_1302_Malgar;
	condition		= DMH_1302_Malgar_VICTORIES_Condition;
	information		= DMH_1302_Malgar_VICTORIES_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wieviele Arenakämpfe hast du schon gewonnen?";
	description		= "Kolik soubojů v aréně už jsi vyhrál?";
};

func int	DMH_1302_Malgar_VICTORIES_Condition()
{
	if	Npc_KnowsInfo(hero, DMH_1302_Malgar_GLADIATOR)
	{
		return TRUE;
	};
};

func void	DMH_1302_Malgar_VICTORIES_Info()
{
//	AI_Output			(hero, self, "DMH_1302_VICTORIES_15_01"); //Wieviele Arenakämpfe hast du schon gewonnen?
	AI_Output			(hero, self, "DMH_1302_VICTORIES_15_01"); //Kolik soubojů v aréně už jsi vyhrál?
//	AI_Output			(self, hero, "DMH_1302_VICTORIES_11_02"); //Genug!
	AI_Output			(self, hero, "DMH_1302_VICTORIES_11_02"); //Dost!
};

///////////////////////////////////////////////////////////////////////
//	Info QUIET
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_QUIET		(C_INFO)
{
	npc		 = 	DMH_1302_Malgar;
	nr		 = 	1;
	condition	 = 	DMH_1302_Malgar_QUIET_Condition;
	information	 = 	DMH_1302_Malgar_QUIET_Info;

//	description	 = 	"Du sprichst wohl nicht sehr viel, was?";
	description	 = 	"Ty toho moc nenamluvíš, co?";
};

func int DMH_1302_Malgar_QUIET_Condition ()
{
	if	Npc_KnowsInfo(hero, DMH_1302_Malgar_WEAPON)
	&&	Npc_KnowsInfo(hero, DMH_1302_Malgar_VICTORIES)
	{
		return TRUE;
	};
};

func int DMH_1302_Malgar_QUIET_Info ()
{
//	AI_Output			(hero, self, "DMH_1302_QUIET_15_01"); //Du sprichst wohl nicht sehr viel, was?
	AI_Output			(hero, self, "DMH_1302_QUIET_15_01"); //Ty toho moc nenamluvíš, co?
	AI_Output			(self, hero, "DMH_1302_QUIET_11_02"); //hmmmm
//	AI_Output			(hero, self, "DMH_1302_QUIET_15_03"); //Na dann...
	AI_Output			(hero, self, "DMH_1302_QUIET_15_03"); //No dobře...
};




///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance	DMH_1302_Malgar_CHALLENGE (C_INFO)
{
	npc				= DMH_1302_Malgar;
	condition		= DMH_1302_Malgar_CHALLENGE_Condition;
	information		= DMH_1302_Malgar_CHALLENGE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Kämpfe gegen mich in der Arena!";
	description		= "Bojuj se mnou v aréně!";
};

func int	DMH_1302_Malgar_CHALLENGE_Condition()
{
	if	Npc_KnowsInfo(hero, DMH_1302_Malgar_QUIET)
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

func void	DMH_1302_Malgar_CHALLENGE_Info()
{
//	AI_Output			(hero, self, "DMH_1302_CHALLENGE_15_01"); //Kämpfe gegen mich in der Arena!
	AI_Output			(hero, self, "DMH_1302_CHALLENGE_15_01"); //Bojuj se mnou v aréně!
//	AI_Output			(hero, self, "DMH_1302_CHALLENGE_15_02"); //Das geht auch ganz ohne sprechen!
	AI_Output			(hero, self, "DMH_1302_CHALLENGE_15_02"); //To jde i bez mluvení!

	if	!Npc_HasItems(self, ItMw_Malgar_Broadsword)
	{
//		AI_Output		(self, hero,"DMH_1302_CHALLENGE_11_03"); //Geht nicht. Mein Schwert ist weg.
		AI_Output		(self, hero,"DMH_1302_CHALLENGE_11_03"); //To nejde. Nemám svůj meč.

		if	Npc_HasItems(hero, ItMw_Malgar_Broadsword)
		{
			Info_ClearChoices	(DMH_1302_Malgar_CHALLENGE);
//			Info_AddChoice		(DMH_1302_Malgar_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!",DMH_1302_Malgar_CHALLENGE_FOUND);
			Info_AddChoice		(DMH_1302_Malgar_CHALLENGE, "Ehm...našel...jsem tvoji zbraň! Tady!",DMH_1302_Malgar_CHALLENGE_FOUND);
		};
		return;
	};

	if	Arena_PlayerBanned
	{
//		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_04"); //Nein, du bist verbannt!
		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_04"); //Ne, byl jsi vykázán!
	}
	else
	{
		if	!Brutus_PlayerWonBefore
		{

//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_05"); //Wenn du Brutus besiegst, kämpfe ich gegen dich!
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_05"); //Budu s tebou bojovat až porazíš Bruta!
//			AI_Output	(hero, self, "DMH_1302_CHALLENGE_15_06"); //Das waren ja mehr als drei Silben in einem Satz!
			AI_Output	(hero, self, "DMH_1302_CHALLENGE_15_06"); //To byly víc než tři slabiky v jedné větě!
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_07"); //(Brummel)
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_07"); //(bručí)

			return;
		};

		if	(B_Arena_GetGladiatorVictoryRanking(PC_Hero) == B_Arena_GetGladiatorVictoryRanking(AMZ_900_Thora))
		{
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_08"); //Dir fehlt nur ein Sieg zum Titel!
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_08"); //Chybí ti už jen jedno vítězství k titulu!
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_09"); //Du musst gegen den Champion kämpfen.
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_09"); //Musíš bojovat s šampionem.
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_10"); //Wenn du Thora besiegst, bist DU der neue Champion!
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_10"); //Když porazíš Thoru, budeš novým šampionem TY!

			return;
		};

		if	(B_Arena_GetGladiatorRanking(PC_Hero) == 1)
		&&	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) >= 3)
		{
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_11"); //Du bist der Champion, ich bin nicht mal zweiter. // Nejsem si jistý překladem.
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_11"); //Ty jsi šampion, já nejsem ani druhý.
//			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_12"); //Kämpfe gegen den zweiten!
			AI_Output	(self, hero, "DMH_1302_CHALLENGE_11_12"); //Bojuj proti druhému!

			return;
		};

		//else
//		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_13"); //Gut!
		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_13"); //Dobře!
//		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_14"); //Geh zum Arenameister!
		AI_Output		(self, hero, "DMH_1302_CHALLENGE_11_14"); //Bež za mistrem arény!

		Malgar_Challenged = TRUE;
	};
};

func void DMH_1302_Malgar_CHALLENGE_FOUND ()
{
	Info_ClearChoices	(DMH_1302_Malgar_CHALLENGE);
//	AI_Output			(hero, self,"DMH_1302_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	AI_Output			(hero, self,"DMH_1302_CHALLENGE_FOUND_15_01"); //Ehm...našel...jsem tvoji zbraň! Tady!
	B_GiveInvItems		(hero, self, ItMw_Malgar_Broadsword, 1);
//	AI_Output			(self, hero,"DMH_1302_CHALLENGE_FOUND_11_02"); //Kann nur für dich hoffen, dass du sie wirklich GEFUNDEN hast.
	AI_Output			(self, hero,"DMH_1302_CHALLENGE_FOUND_11_02"); //Pro tvé vlastní dobro doufám, žes ji opravdu NAŠEL.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance DMH_1302_Malgar_HOWDY		(C_INFO)
{
	npc		 = 	DMH_1302_Malgar;
	condition	 = 	DMH_1302_Malgar_HOWDY_Condition;
	information	 = 	DMH_1302_Malgar_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Möchtest du dich unterhalten?";
	description	 = 	"Chceš si promluvit?";
};

func int DMH_1302_Malgar_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero,DMH_1302_Malgar_QUIET)
	&&	!DMH_1302_Malgar_CHALLENGE_Condition()
	{
		return TRUE;
	};
};

func void DMH_1302_Malgar_HOWDY_Info ()
{
//	AI_Output			(hero, self, "DMH_1302_HOWDY_15_01"); //(leicht spöttisch) Möchtest du dich unterhalten?
	AI_Output			(hero, self, "DMH_1302_HOWDY_15_01"); //(s náznakem posměchu) Chceš si promluvit?
//	AI_Output			(self, hero, "DMH_1302_HOWDY_11_02"); //Nein!
	AI_Output			(self, hero, "DMH_1302_HOWDY_11_02"); //Ne!
//	AI_Output			(hero, self, "DMH_1302_HOWDY_15_03"); //Das... dachte ich mir!
	AI_Output			(hero, self, "DMH_1302_HOWDY_15_03"); //...myslel jsem si to!
	AI_StopProcessInfos	(self);
};












































































