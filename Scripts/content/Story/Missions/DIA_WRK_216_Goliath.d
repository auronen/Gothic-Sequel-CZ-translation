///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_EXIT (C_INFO)
{
	npc			=  WRK_216_Goliath;
	nr			=  999;
	condition	=  WRK_216_Goliath_EXIT_Condition;
	information	=  WRK_216_Goliath_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	WRK_216_Goliath_EXIT_Condition()
{
	return TRUE;
};

func void	WRK_216_Goliath_EXIT_Info()
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
instance WRK_216_Goliath_MYWEAPON		(C_INFO)
{
	npc			= WRK_216_Goliath;
	nr			= 1;
	condition	= WRK_216_Goliath_MYWEAPON_Condition;
	information	= WRK_216_Goliath_MYWEAPON_Info;
	important	= TRUE;
	permanent	= TRUE;
};

func int WRK_216_Goliath_MYWEAPON_Condition ()
{
	if	Npc_HasItems(hero, ItMw_Goliath_Sledgehammer)
	{
		if	Arena_FightRunning
		&&	Arena_PlayerFight
		&&	Goliath_Challenged
		&&	!Arena_PlayerStoleWeapon
		&&	!Gotmar_GoliathReturned
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

func int WRK_216_Goliath_MYWEAPON_Info ()
{
	AI_SetWalkmode			(self, NPC_RUN);
	AI_GotoNpc				(self, hero);
//	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_Info_09_01"); //Gib mir meinen Hammer zurück!
	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_Info_09_01"); //Vrať mi moje kladivo!

	Info_ClearChoices		(WRK_216_Goliath_MYWEAPON);
//	Info_AddChoice			(WRK_216_Goliath_MYWEAPON, "Ich behalte ihn!",						WRK_216_Goliath_MYWEAPON_TAKEN );
	Info_AddChoice			(WRK_216_Goliath_MYWEAPON, "Nechám si ho!",							WRK_216_Goliath_MYWEAPON_TAKEN );
//	Info_AddChoice			(WRK_216_Goliath_MYWEAPON, "Hier hast du ihn zurück.",	WRK_216_Goliath_MYWEAPON_GIVEBACK );
	Info_AddChoice			(WRK_216_Goliath_MYWEAPON, "Tady ho máš.",				WRK_216_Goliath_MYWEAPON_GIVEBACK );
};

func void WRK_216_Goliath_MYWEAPON_GIVEBACK ()
{
	Info_ClearChoices		(WRK_216_Goliath_MYWEAPON);
//	AI_Output				(hero, self, "WRK_216_Goliath_MYWEAPON_GIVEBACK_15_01"); //Hier hast du ihn zurück.
	AI_Output				(hero, self, "WRK_216_Goliath_MYWEAPON_GIVEBACK_15_01"); //Tady ho máš.
	B_GiveInvItems			(hero, self, ItMw_Goliath_Sledgehammer, 1);
//	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_GIVEBACK_09_02"); //Dann kann es ja weitergehen!
	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_GIVEBACK_09_02"); //Tak, můžeme pokračovat!
	AI_StopProcessInfos		(self);
};

func void WRK_216_Goliath_MYWEAPON_TAKEN ()
{
	Info_ClearChoices		(WRK_216_Goliath_MYWEAPON);
//	AI_Output				(hero, self, "WRK_216_Goliath_MYWEAPON_TAKEN_15_01"); //Ich behalte ihn!
	AI_Output				(hero, self, "WRK_216_Goliath_MYWEAPON_TAKEN_15_01"); //Nechám si ho!
//	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_TAKEN_09_02"); //Hey, das ist gegen Regel 3 !!!
	AI_Output				(self, hero, "WRK_216_Goliath_MYWEAPON_TAKEN_09_02"); //Hej, to je proti pravidlu číslo 3!
	AI_StopProcessInfos		(self);

	B_Arena_AbortFight		(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_CHALLENGED (C_INFO)
{
	npc				= WRK_216_Goliath;
	nr				= 2;
	condition		= WRK_216_Goliath_CHALLENGED_Condition;
	information		= WRK_216_Goliath_CHALLENGED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	WRK_216_Goliath_CHALLENGED_Condition()
{
	if	Goliath_Challenged
	&&	Arena_PlayerFight
	&&	C_NpcIsInvincible(self)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void	WRK_216_Goliath_CHALLENGED_Info()
{
	if	Wld_IsTime(0,0,	ARENABEGIN_H, ARENABEGIN_M)
	{
		if	(Npc_GetDistToWP	(self, ARENA_WP_LEFT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
//			AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGED_09_01"); //Vergiss nicht. Wir kämpfen heute abend in der Arena!
			AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGED_09_01"); //Nezapomeň. Dnes večer se utkáme v aréně!
		}
		else
		{
//			AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGED_09_02"); //Geh in deinen eigenen Vorbereitungsraum!
			AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGED_09_02"); //Jdi do své vlastní místnosti na přípravu!
		};

		AI_StopProcessInfos		(self);
		return;
	};

	if	Npc_IsInRoutine(self, ZS_ArenaFight)
	{
//		AI_Output				(self, hero,"WRK_216_Goliath_CHALLENGED_09_03"); //Die wollen uns kämpfen sehen und nicht reden!
		AI_Output				(self, hero,"WRK_216_Goliath_CHALLENGED_09_03"); //Chtějí, abychom bojovali a abychom se tu vybavovali!
		AI_StopProcessInfos		(self);
		return;
	}
	else
	{
//		AI_Output				(self, hero,"WRK_216_Goliath_CHALLENGED_09_04"); //Vergiss nicht. Wir kämpfen morgen abend in der Arena!
		AI_Output				(self, hero,"WRK_216_Goliath_CHALLENGED_09_04"); //Nezapomeň. Zítra se utkáme v aréně!
		AI_StopProcessInfos		(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_PRENPC (C_INFO)
{
	npc				= WRK_216_Goliath;
	condition		= WRK_216_Goliath_PRENPC_Condition;
	information		= WRK_216_Goliath_PRENPC_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	WRK_216_Goliath_PRENPC_Condition()
{
	if	Arena_NpcFight
	&&	((Arena_NpcCombo == AC_GRIM_GOLIATH) || (Arena_NpcCombo == AC_GOLIATH_BRUTUS))
	&&	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&&	C_NpcIsInvincible(self)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void	WRK_216_Goliath_PRENPC_Info()
{
//	AI_Output			(self, hero,"WRK_216_Goliath_PRENPC_09_01"); //Raus hier! Ich brauche meine Ruhe vor dem Arenakampf!
	AI_Output			(self, hero,"WRK_216_Goliath_PRENPC_09_01"); //Vypadni! Před soubojem potřebuji svůj klid!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_GLADIATOR		(C_INFO)
{
	npc		 	= 	WRK_216_Goliath;
	nr		 	= 	1;
	condition	= 	WRK_216_Goliath_GLADIATOR_Condition;
	information	= 	WRK_216_Goliath_GLADIATOR_Info;
	important	=	FALSE;
	permanent	=	FALSE;

//	description	=	"Bist du einer der Gladiatoren?";
	description	=	"Ty jsi jedním z gladiátorů?";
};

func int WRK_216_Goliath_GLADIATOR_Condition ()
{
	if	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func int WRK_216_Goliath_GLADIATOR_Info ()
{
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_15_01"); //Bist du einer der Gladiatoren?
	AI_Output			(hero, self, "WRK_216_GLADIATOR_15_01"); //Ty jsi jedním z gladiátorů?
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_09_02"); //Hast du mich kämpfen sehen?
	AI_Output			(self, hero, "WRK_216_GLADIATOR_09_02"); //Viděl jsi mě bojovat?

	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Nein, noch nicht."	, WRK_216_Goliath_GLADIATOR_NO );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Ne, ještě ne."		, WRK_216_Goliath_GLADIATOR_NO );
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Das habe ich."		, WRK_216_Goliath_GLADIATOR_YES );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Ano, viděl."		, WRK_216_Goliath_GLADIATOR_YES );


};
func void WRK_216_Goliath_GLADIATOR_YES ()
{
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_15_01"); //Das habe ich.
	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_15_01"); //Ani, viděl.
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_09_02"); //Gegen wen habe ich gekämpft?
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_09_02"); //Proti komu jsem bojoval?

	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Grim", 	WRK_216_Goliath_GLADIATOR_YES_GRIM );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Proti Grimovi"		, 	WRK_216_Goliath_GLADIATOR_YES_GRIM );
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Brutus", 	WRK_216_Goliath_GLADIATOR_YES_BRUTUS );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Proti Brutovi"		, 	WRK_216_Goliath_GLADIATOR_YES_BRUTUS );
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Malgar", 	WRK_216_Goliath_GLADIATOR_YES_MALGAR );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Proti Malgarovi"	, 	WRK_216_Goliath_GLADIATOR_YES_MALGAR );
//	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Thora", 	WRK_216_Goliath_GLADIATOR_YES_THORA );
	Info_AddChoice		(WRK_216_Goliath_GLADIATOR, "Proti Thoře"		, 	WRK_216_Goliath_GLADIATOR_YES_THORA );


};
func void WRK_216_Goliath_GLADIATOR_YES_THORA ()
{
	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_THORA_15_01"); //Thora
	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_THORA_15_01"); //Proti Thoře
//	AI_Output			(self, hero,"OUMULTI_Liar_09_00"); //Das kann nicht sein! Du bist ein Lügner!
	AI_Output			(self, hero,"OUMULTI_Liar_09_00"); //To není pravda! Ty jsi lhář!
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_THORA_09_03"); //Sie kämpft viel zu gut für mich.
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_THORA_09_03"); //Bojuje příliš dobře.
	Goliath_PlayerLied = TRUE;
	AI_StopProcessInfos	(self);
};

func void WRK_216_Goliath_GLADIATOR_YES_MALGAR ()
{
	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_MALGAR_15_01"); //Malgar
	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_MALGAR_15_01"); //Proti Malgarovi
//	AI_Output			(self, hero,"OUMULTI_Liar_09_00"); //Das kann nicht sein! Du bist ein Lügner!
	AI_Output			(self, hero,"OUMULTI_Liar_09_00"); //To není pravda! Ty jsi lhář!
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_MALGAR_09_03"); //Ich habe ihn noch nie herausgefordert!
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_MALGAR_09_03"); //Nikdy jsem ho nevyzval!
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_MALGAR_09_04"); //Lüg mich nicht an, wenn du mit mir reden willst!
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_MALGAR_09_04"); //Pokud se se mnou chceš bavit už mi nikdy nelži!
	Goliath_PlayerLied = TRUE;
	AI_StopProcessInfos	(self);
};

func void WRK_216_Goliath_GLADIATOR_YES_BRUTUS ()
{
	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_BRUTUS_15_01"); //Brutus
	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_BRUTUS_15_01"); //Proti Brutovi
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_02"); //Ahh... Brutus ist ein wirklich harter Brocken.
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_02"); //Ahh... Brutus je opravdu těžký protivník.
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_03"); //Wenn er nicht so verdammt schnell wäre!
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_03"); //Kdyby nebyl tak zatracené rychlý!
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_04"); //...aber irgendwann werde ich ihn auch mal besiegen!
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_BRUTUS_09_04"); //...ale jednoho dne ho určitě porazím!
};

func void WRK_216_Goliath_GLADIATOR_YES_GRIM ()
{
	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_GRIM_15_01"); //Grim
	AI_Output			(hero, self, "WRK_216_GLADIATOR_YES_GRIM_15_01"); //Proti Grimovi
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_GRIM_09_02"); //Gegen Grim trete ich gerne an!
	AI_Output			(self, hero, "WRK_216_GLADIATOR_YES_GRIM_09_02"); //Proti Grimovi bojuji rád!
};


func void WRK_216_Goliath_GLADIATOR_NO ()
{
	Info_ClearChoices	(WRK_216_Goliath_GLADIATOR);
//	AI_Output			(hero, self, "WRK_216_GLADIATOR_NO_15_01"); //Nein, noch nicht.
	AI_Output			(hero, self, "WRK_216_GLADIATOR_NO_15_01"); //Ne, ještě ne.
//	AI_Output			(self, hero, "WRK_216_GLADIATOR_NO_09_02"); //Du hast aber Recht, ich bin einer der Gladiatoren.
	AI_Output			(self, hero, "WRK_216_GLADIATOR_NO_09_02"); //Máš pravdu, jsem jeden z gladiátorů.
};


///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_CHALLENGE (C_INFO)
{
	npc				= WRK_216_Goliath;
	condition		= WRK_216_Goliath_CHALLENGE_Condition;
	information		= WRK_216_Goliath_CHALLENGE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich fordere dich heraus!";
	description		= "Vyzývám tě k souboji!";
};

func int	WRK_216_Goliath_CHALLENGE_Condition()
{
	if	Npc_KnowsInfo(hero, WRK_216_Goliath_GLADIATOR)
	&&	!Grim_Challenged
	&&	!Goliath_Challenged
	&&	!Brutus_Challenged
	&&	!Malgar_Challenged
	&&	!Thora_Challenged
	&&	Arenamaster_Accepted
	&&	!Gotmar_GoliathReturned			// storybezogene Sonderbedingung
	&&	Wld_IsTime(0,0, ARENAPRE_H,ARENAPRE_M)
	{
		return TRUE;
	};
};

func void	WRK_216_Goliath_CHALLENGE_Info()
{
//	AI_Output			(hero, self,"WRK_216_Goliath_CHALLENGE_15_01"); //Ich fordere dich heraus!
	AI_Output			(hero, self,"WRK_216_Goliath_CHALLENGE_15_01"); //Vyzývám tě k souboji!

	if	!Npc_HasItems(self, ItMw_Goliath_Sledgehammer)
	{
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_02"); //Mein Schmiedehammer ist mir abhanden gekommen. Ohne ihn, werde ich nicht kämpfen.
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_02"); //Ztratil jsem své kovářské kladivo. Bez něj nebudu bojovat.

		if	Npc_HasItems(hero, ItMw_Goliath_Sledgehammer)
		{
			Info_ClearChoices	(WRK_216_Goliath_CHALLENGE);
//			Info_AddChoice		(WRK_216_Goliath_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!",WRK_216_Goliath_CHALLENGE_FOUND);
			Info_AddChoice		(WRK_216_Goliath_CHALLENGE, "Mám tu tvojí zbraň... ehm... našel jsem ji! Tady!",WRK_216_Goliath_CHALLENGE_FOUND);
		};
		return;
	};

	if	Arena_PlayerBanned
	{
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_03"); //Du hast neulich in der Arena die Regeln verletzt!
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_03"); //Porušil jsi pravidla arény!
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_04"); //Frag den Arenameister, ob er dich wieder kämpfen lässt!
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_04"); //Zeptej se mistra arény, zda tě nechá zápasit!
	}
	else
	{
		if	(hero.aivar[AIV_ARENA_VICTORIES] < 1)
		{

//			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_05"); //Du brauchst etwas Erfahrung in der Arena. Es wäre unfair von mir, jetzt schon gegen dich zu kämpfen.
			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_05"); //Potřebuješ nějaké zkušenosti v aréně. Bylo by ode mě nefér proti tobě právě teď bojovat.
//			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_06"); //Wenn du Grim besiegst, nehme ich deine Herausforderung an.
			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_06"); //Až porazíš Grima, přijmou tvou výzvu.

			return;
		};

		if	(B_Arena_GetGladiatorRanking(PC_Hero) <= (B_Arena_GetGladiatorRanking(WRK_216_Goliath)-2))
		{
//			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_07"); //Du bist ziemlich gut geworden!
			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_07"); //Docela jsi se zlepšil!
//			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_08"); //Fordere lieber mal erfahrenere Gladiatoren heraus!
			AI_Output	(self, hero,"WRK_216_Goliath_CHALLENGE_09_08"); //Vyzvi raději zkušenější gladiátory!

			return;
		};

		//else
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_09"); //Na gut. Ich trete gegen dich an!
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_09"); //No dobrá. Střetnu se s tebou v aréně!
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_10"); //Wir sehen uns heute Abend.
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_10"); //Uvidíme se dnes večer.
//		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_11"); //Denk dran dein Preisgeld beim Arenameister abzugeben!
		AI_Output		(self, hero,"WRK_216_Goliath_CHALLENGE_09_11"); //Nezapomeň si vsadit u mistra arény!

		Goliath_Challenged = TRUE;
	};
};

func void WRK_216_Goliath_CHALLENGE_FOUND ()
{
	Info_ClearChoices	(WRK_216_Goliath_CHALLENGE);
//	AI_Output			(hero, self,"WRK_216_Goliath_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	AI_Output			(hero, self,"WRK_216_Goliath_CHALLENGE_FOUND_15_01"); //Mám tu tvojí zbraň... ehm... našel jsem ji! Tady!
	B_GiveInvItems		(hero, self, ItMw_Goliath_Sledgehammer, 1);
//	AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGE_FOUND_09_02"); //Danke, nun kann ich auch wieder Herausforderungen annehmen.
	AI_Output			(self, hero,"WRK_216_Goliath_CHALLENGE_FOUND_09_02"); //Děkuji, teď mohu znovu bojovat v aréně.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_WEAPON (C_INFO)
{
	npc				= WRK_216_Goliath;
	condition		= WRK_216_Goliath_WEAPON_Condition;
	information		= WRK_216_Goliath_WEAPON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Mit welcher Waffe kämpfst du?";
	description		= "S jakými zbraněmi bojuješ?";
};

func int	WRK_216_Goliath_WEAPON_Condition()
{
	if	Npc_KnowsInfo(hero, WRK_216_Goliath_GLADIATOR)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void	WRK_216_Goliath_WEAPON_Info()
{
//	AI_Output			(hero, self,"WRK_216_Goliath_WEAPON_15_01"); //Mit welcher Waffe kämpfst du?
	AI_Output			(hero, self,"WRK_216_Goliath_WEAPON_15_01"); //S jakými zbraněmi bojuješ?

	if	Npc_HasItems	(self, ItMw_Goliath_Sledgehammer)
	{
		AI_ReadyMeleeWeapon(self);
	};
//	AI_Output			(self, hero,"WRK_216_Goliath_WEAPON_09_02"); //Mit dem Schmiedehammer hier kann ich am besten umgehen!
	AI_Output			(self, hero,"WRK_216_Goliath_WEAPON_09_02"); //Tady s tím kovářským kladivem umím zacházet nejlépe!
//	AI_Output			(self, hero,"WRK_216_Goliath_WEAPON_09_03"); //Das kommt noch aus meiner Zeit als Schmiedegehilfe.
	AI_Output			(self, hero,"WRK_216_Goliath_WEAPON_09_03"); //To od té doby, co jsem byl kovářským pomocníkem.
	if	Npc_HasItems	(self, ItMw_Goliath_Sledgehammer)
	{
		AI_RemoveWeapon	(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SMITHHELPER
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_SMITHHELPER		(C_INFO)
{
	npc		 	= 	WRK_216_Goliath;
	nr		 	= 	1;
	condition	 = 	WRK_216_Goliath_SMITHHELPER_Condition;
	information	 = 	WRK_216_Goliath_SMITHHELPER_Info;

//	description	 = 	"Du warst Schmiedegehilfe?";
	description	 = 	"Ty jsi byl kovářským pomocníkem?";
};

func int WRK_216_Goliath_SMITHHELPER_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_216_Goliath_WEAPON)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func int WRK_216_Goliath_SMITHHELPER_Info ()
{
//	AI_Output			(hero, self, "WRK_216_SMITHHELPER_15_01"); //Du warst Schmiedegehilfe?
	AI_Output			(hero, self, "WRK_216_SMITHHELPER_15_01"); //Ty jsi byl kovářským pomocníkem?
//	AI_Output			(self, hero, "WRK_216_SMITHHELPER_09_02"); //Ich habe für Gotmar im Arbeiterviertel gearbeitet. Da habe ich gelernt mit dem Schmiedehammer umzugehen.
	AI_Output			(self, hero, "WRK_216_SMITHHELPER_09_02"); //Pracoval jsem pro Gotmara v dělnické čtvrti. Tam jsem se neučil ovládat kovářské kladivo.
//	AI_Output			(self, hero, "WRK_216_SMITHHELPER_09_03"); //Aber mir fehlte die Anerkennung! Deshalb kämpfe ich jetzt in der Arena!
	AI_Output			(self, hero, "WRK_216_SMITHHELPER_09_03"); //Ale chybělo mi uznání! Proto teď zápasím v aréně!
};


///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance	WRK_216_Goliath_VICTORIES (C_INFO)
{
	npc				= WRK_216_Goliath;
	condition		= WRK_216_Goliath_VICTORIES_Condition;
	information		= WRK_216_Goliath_VICTORIES_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Wie oft hast Du schon gewonnen?";
	description		= "Kolikrát jsi už vyhrál?";
};

func int	WRK_216_Goliath_VICTORIES_Condition()
{
	if	Npc_KnowsInfo(hero, WRK_216_Goliath_GLADIATOR)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void	WRK_216_Goliath_VICTORIES_Info()
{
//	AI_Output			(hero, self, "WRK_216_Goliath_VICTORIES_15_01"); //Wie oft hast Du schon gewonnen?
	AI_Output			(hero, self, "WRK_216_Goliath_VICTORIES_15_01"); //Kolikrát jsi už vyhrál?
//	AI_Output			(self, hero, "WRK_216_Goliath_VICTORIES_09_02"); //Es geht etwas schleppend voran.
	AI_Output			(self, hero, "WRK_216_Goliath_VICTORIES_09_02"); //Věci jsou trošku pomalu.
//	AI_Output			(self, hero, "WRK_216_Goliath_VICTORIES_09_03"); //Aber gegen Grim habe ich meistens gewonnen!
	AI_Output			(self, hero, "WRK_216_Goliath_VICTORIES_09_03"); //Ale proti Grimovi jsem párkrát vyhrál!
};

///////////////////////////////////////////////////////////////////////
//	Info TIP
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_TIP		(C_INFO)
{
	npc		 	 = 	WRK_216_Goliath;
	condition	 = 	WRK_216_Goliath_TIP_Condition;
	information	 = 	WRK_216_Goliath_TIP_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int WRK_216_Goliath_TIP_Condition ()
{
	if	Grim_Challenged
	&&	(Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG)
	{
		return TRUE;
	};
};

func void WRK_216_Goliath_TIP_Info ()
{
//	AI_Output			(self, hero, "WRK_216_TIP_09_01"); //Dein erster Arenakampf, was?
	AI_Output			(self, hero, "WRK_216_TIP_09_01"); //Tvůj první souboj v aréně, že?
//	AI_Output			(hero, self, "WRK_216_TIP_15_02"); //Ja, und?
	AI_Output			(hero, self, "WRK_216_TIP_15_02"); //Ano, a?
//	AI_Output			(self, hero, "WRK_216_TIP_09_03"); //Während eines Arenakampfes musst du dich oft heilen. Nimm reichlich Nahrung oder Heiltränke mit!
	AI_Output			(self, hero, "WRK_216_TIP_09_03"); //Během boje v aréně se budeš muset často léčit. Vezmi si s sebou hodně jídla a léčivých lektvarů!
//	AI_Output			(hero, self, "WRK_216_TIP_15_04"); //Danke für den Tip!
	AI_Output			(hero, self, "WRK_216_TIP_15_04"); //Díky za tip!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_HOWDY		(C_INFO)
{
	npc		 	 = 	WRK_216_Goliath;
	condition	 = 	WRK_216_Goliath_HOWDY_Condition;
	information	 = 	WRK_216_Goliath_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was macht deine Suche nach Ruhm und Anerkennung!";
	description	 = 	"Jak se ti daří hledat slávu a uznání!";
};

func int WRK_216_Goliath_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero, WRK_216_Goliath_SMITHHELPER)
	&&	!Gotmar_GoliathReturned
	&&	!WRK_216_Goliath_CHALLENGE_Condition()
	{
		return TRUE;
	};
};

func void WRK_216_Goliath_HOWDY_Info ()
{
//	AI_Output			(hero, self, "WRK_216_HOWDY_15_01"); //Was macht deine Suche nach Ruhm und Anerkennung!
	AI_Output			(hero, self, "WRK_216_HOWDY_15_01"); //Jak se ti daří hledat slávu a uznání!
//	AI_Output			(self, hero, "WRK_216_HOWDY_09_02"); //Es könnte besser laufen.
	AI_Output			(self, hero, "WRK_216_HOWDY_09_02"); //Mohlo by to být lepší.
//	AI_Output			(self, hero, "WRK_216_HOWDY_09_03"); //Ich hoffe, dass ich wenigstens meinen Platz in der Rangliste halten kann!
	AI_Output			(self, hero, "WRK_216_HOWDY_09_03"); //Doufám, že si alespoň udržím své místo v žebříčku!
};

///////////////////////////////////////////////////////////////////////
//	Info HOWDY2
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_HOWDY2		(C_INFO)
{
	npc		 	 = 	WRK_216_Goliath;
	condition	 = 	WRK_216_Goliath_HOWDY2_Condition;
	information	 = 	WRK_216_Goliath_HOWDY2_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Wie gefällt es dir in deinem alten Beruf?";
	description	 = 	"Jak se ti líbí ve tvé staré práci?";
};

func int WRK_216_Goliath_HOWDY2_Condition ()
{
	if	Gotmar_GoliathReturned
	&&	(Npc_GetDistToWP(self, "OCR_HUT_77") < 1000)
	{
		return TRUE;
	};
};

func void WRK_216_Goliath_HOWDY2_Info ()
{
//	AI_Output			(hero, self, "WRK_216_HOWDY2_15_01"); //Wie gefällt es dir in deinem alten Beruf?
	AI_Output			(hero, self, "WRK_216_HOWDY2_15_01"); //Jak se ti líbí ve tvé staré práci?
//	AI_Output			(self, hero, "WRK_216_HOWDY2_09_02"); //Eigentlich garnicht so schlecht. Die ehrliche Arbeit macht mir wieder richtig Freude!
	AI_Output			(self, hero, "WRK_216_HOWDY2_09_02"); //Vlastně to není tak špatné. Opravdu si teď poctivou práci užívám!
//	AI_Output			(self, hero, "WRK_216_HOWDY2_09_03"); //Als Schmiedegehilfe, kann ich etwas zur Verteidigung des Lagers beitragen. Und Gotmar will mir später sogar mal die Schmiede überlassen.
	AI_Output			(self, hero, "WRK_216_HOWDY2_09_03"); //Jako kovářův pomocník mohu pomoci bránit tábor. A Gotmar mi chce dokonce kovárnu přenechat.
//	AI_Output			(self, hero, "WRK_216_HOWDY2_09_04"); //Gut dass du mir die Augen geöffnet hast!
	AI_Output			(self, hero, "WRK_216_HOWDY2_09_04"); //Je dobře, že jsi mi otevřel oči!
	AI_StopProcessInfos	(self);
};











//#####################################################################
//##
//##
//##						Der Schmiedegehilfe
//##
//##
//#####################################################################
///////////////////////////////////////////////////////////////////////
//	Info GOTMAR
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_GOTMAR		(C_INFO)
{
	npc		 	 = 	WRK_216_Goliath;
	nr		 	 = 	1;
	condition	 = 	WRK_216_Goliath_GOTMAR_Condition;
	information	 = 	WRK_216_Goliath_GOTMAR_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe mit Gotmar dem Schmied gesprochen!";
	description	 = 	"Mluvil jsem s kovářem Gotmarem!";
};

func int WRK_216_Goliath_GOTMAR_Condition ()
{
	if	Npc_KnowsInfo(hero,WRK_200_Gotmar_IFETCHGOLIATH)
	{
		return TRUE;
	};
};

func void WRK_216_Goliath_GOTMAR_Info ()
{
//	AI_Output			(hero, self, "WRK_216_GOTMAR_15_01"); //Ich habe mit Gotmar dem Schmied gesprochen!
	AI_Output			(hero, self, "WRK_216_GOTMAR_15_01"); //Mluvil jsem s kovářem Gotmarem!
//	AI_Output			(hero, self, "WRK_216_GOTMAR_15_02"); //Er schafft die ganze Arbeit nicht ohne dich.
	AI_Output			(hero, self, "WRK_216_GOTMAR_15_02"); //Bez tebe nedokáže dělat všechnu práci.

	if	(B_Arena_GetGladiatorRanking(PC_Hero) >= B_Arena_GetGladiatorRanking(WRK_216_Goliath))
	{
//		AI_Output		(self, hero, "WRK_216_GOTMAR_09_03"); //Ich habe hier in der Arena eine neue Aufgabe.
		AI_Output		(self, hero, "WRK_216_GOTMAR_09_03"); //Moje nová práce je tady v aréně.
//		AI_Output		(self, hero, "WRK_216_GOTMAR_09_04"); //Solange ich als Gladiator Erfolg habe, werde ich den Blasebalg nicht mehr treten!
		AI_Output		(self, hero, "WRK_216_GOTMAR_09_04"); //Dokud budu úspěšný gladiátor, ani se měchu nedotknu!

//		B_LogEntry		(CH1_LearnSmith,	"Goliath lässt sich nicht von seinem neuen Lebensweg abbringen. Zumindest nicht, solange er als Gladiator erfolgreich ist... .");
		B_LogEntry		(CH1_LearnSmith,	"Goliáš se nenechá od svého nového způsobu odradit. Alespoň ne do té doby, dokud se mu bude v aréně dařit...");
	}
	else
	{
//		AI_Output		(self, hero, "WRK_216_GOTMAR_09_05"); //Ich weiss ja nicht...
		AI_Output		(self, hero, "WRK_216_GOTMAR_09_05"); //Nevím...
	};
};


///////////////////////////////////////////////////////////////////////
//	Info GOBACK
///////////////////////////////////////////////////////////////////////
instance WRK_216_Goliath_GOBACK		(C_INFO)
{
	npc		 	 = 	WRK_216_Goliath;
	nr		 	 = 	1;
	condition	 = 	WRK_216_Goliath_GOBACK_Condition;
	information	 = 	WRK_216_Goliath_GOBACK_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Willst du dir das mit Gotmar nicht nochmal überlegen!";
	description	 = 	"Nechceš si tu věc s Gotmarem znovu rozmyslet?";
};

func int WRK_216_Goliath_GOBACK_Condition ()
{
	if	Npc_KnowsInfo	(hero,WRK_216_Goliath_GOTMAR)
	&&	Wld_IsTime		(ARENAEND_H, ARENAEND_M, ARENAPRE_H, ARENAPRE_M)
	&&	!Gotmar_GoliathReturned
	{
		return TRUE;
	};
};

func void WRK_216_Goliath_GOBACK_Info ()
{
//	AI_Output			(hero, self, "WRK_216_GOBACK_15_01"); //Willst du dir das mit Gotmar nicht nochmal überlegen!
	AI_Output			(hero, self, "WRK_216_GOBACK_15_01"); //Nechceš si tu věc s Gotmarem znovu rozmyslet?

	var int PC_rank;		pc_rank = B_Arena_GetGladiatorRanking(PC_Hero);
	var int Goliath_Rank;	Goliath_Rank = B_Arena_GetGladiatorRanking(WRK_216_Goliath);

	if	(PC_rank >= Goliath_Rank)

	{
//		AI_Output		(self, hero, "WRK_216_GOBACK_09_02"); //Nein! Das Leben als Gladiator gefällt mir viel besser!
		AI_Output		(self, hero, "WRK_216_GOBACK_09_02"); //Ne! Život gladiátora se mi zamlouvá mnohem víc!
	}
	else
	{
//		AI_Output		(self, hero, "WRK_216_GOBACK_09_03"); //Es läuft in der Arena nicht so gut, wie ich gehofft hatte. Ich bin wohl doch kein so guter Gladiator.
		AI_Output		(self, hero, "WRK_216_GOBACK_09_03"); //V aréně to nejde tak dobře, jak jsem doufal. Myslím, že nejsem tak dobrý gladiátor.
//		AI_Output		(self, hero, "WRK_216_GOBACK_09_04"); //Auch du hast dich in der Rangliste schon an mir vorbeigeschoben, und das obwohl du wirklich noch nicht lange dabei bist.
		AI_Output		(self, hero, "WRK_216_GOBACK_09_04"); //I ty ses dostal v žebříčku výš a to tu jsi jen krátce.
//		AI_Output		(hero, self, "WRK_216_GOBACK_15_05"); //Warum gehst du dann nicht zu Gotmar zurück?
		AI_Output		(hero, self, "WRK_216_GOBACK_15_05"); //Proč nejdeš spátky za Gotmarem?
//		AI_Output		(self, hero, "WRK_216_GOBACK_09_06"); //Ich glaube es ist wirklich das beste, wenn ich genau das tue!
		AI_Output		(self, hero, "WRK_216_GOBACK_09_06"); //Myslím, že bude opravdu nejlepší, když to udělám!

		Gotmar_GoliathReturned = TRUE;
		Npc_ExchangeRoutine	(self, "smith");

//		B_LogEntry		(CH1_LearnSmith,	"Ich konnte Goliath doch tatsächlich davon überzeugen, dass seine Zukunft nicht in der Arena liegt. Ich bin gespannt, was Gotmar dazu sagen wird.");
		B_LogEntry		(CH1_LearnSmith,	"Nakonec se mi povedlo Goliáše přesvědčit, že ho skvělá gladiátorská budoucnost nečeká. Jsem zvědavý, co na to řekne Gotmar.");
		B_GiveXP		(XP_Goliath_Persuade);
	};
};



























































