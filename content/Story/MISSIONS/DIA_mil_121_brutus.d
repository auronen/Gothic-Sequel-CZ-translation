///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_EXIT (C_INFO)
{
	npc			=  MIL_121_Brutus;
	nr			=  999;
	condition	=  MIL_121_Brutus_EXIT_Condition;
	information	=  MIL_121_Brutus_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description =  DIALOG_ENDE;
};

func int	MIL_121_Brutus_EXIT_Condition()
{
	return TRUE;
};

func void	MIL_121_Brutus_EXIT_Info()
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
instance MIL_121_Brutus_MYWEAPON		(C_INFO)
{
	npc			= MIL_121_Brutus;
	nr			= 1;
	condition	= MIL_121_Brutus_MYWEAPON_Condition;
	information	= MIL_121_Brutus_MYWEAPON_Info;
	important	= TRUE;
	permanent	= TRUE;
};

func int MIL_121_Brutus_MYWEAPON_Condition ()
{
	if	Npc_HasItems(hero, ItMw_Brutus_Longsword)
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

func int MIL_121_Brutus_MYWEAPON_Info ()
{
	AI_SetWalkmode			(self, NPC_RUN);
	AI_GotoNpc				(self, hero);
//	AI_Output				(self, hero, "MIL_121_MYWEAPON_Info_06_01"); //Rück mein Schwert raus, oder ich mach dich platt!
	AI_Output				(self, hero, "MIL_121_MYWEAPON_Info_06_01"); //Vrať mi můj meč, nebo tě srovnám!

	Info_ClearChoices		(MIL_121_Brutus_MYWEAPON);
//	Info_AddChoice			(MIL_121_Brutus_MYWEAPON, "Das Schwert gefällt mir. Ich behalte es!",	MIL_121_Brutus_MYWEAPON_TAKEN );
	Info_AddChoice			(MIL_121_Brutus_MYWEAPON, "Ten meč se mi líbí. Nechám si ho!",	MIL_121_Brutus_MYWEAPON_TAKEN );
//	Info_AddChoice			(MIL_121_Brutus_MYWEAPON, "Bleib locker, hier ist dein Schwert.",		MIL_121_Brutus_MYWEAPON_GIVEBACK );
	Info_AddChoice			(MIL_121_Brutus_MYWEAPON, "Buď v klidu, tady je tvůj meč.",		MIL_121_Brutus_MYWEAPON_GIVEBACK );
};

func void MIL_121_Brutus_MYWEAPON_GIVEBACK ()
{
	Info_ClearChoices		(MIL_121_Brutus_MYWEAPON);
//	AI_Output				(hero, self, "MIL_121_MYWEAPON_GIVEBACK_15_01"); //Bleib locker, hier ist dein Schwert.
	AI_Output				(hero, self, "MIL_121_MYWEAPON_GIVEBACK_15_01"); //Buď v klidu, tady je tvůj meč.
	B_GiveInvItems			(hero, self, ItMw_Brutus_Longsword, 1);
//	AI_Output				(self, hero, "MIL_121_MYWEAPON_GIVEBACK_06_02"); //(bedrohlich) dann lass mal sehen, wieviel Durchhaltevermögen du hast..
	AI_Output				(self, hero, "MIL_121_MYWEAPON_GIVEBACK_06_02"); //(výhružně) Tak se podíváme, kolik toho vydržíš...
	AI_StopProcessInfos		(self);

};

func void MIL_121_Brutus_MYWEAPON_TAKEN ()
{
	Info_ClearChoices		(MIL_121_Brutus_MYWEAPON);
//	AI_Output				(hero, self, "MIL_121_MYWEAPON_TAKEN_15_01"); //Das Schwert gefällt mir. Ich behalte es!
	AI_Output				(hero, self, "MIL_121_MYWEAPON_TAKEN_15_01"); //Ten meč se mi líbí. Nechám si ho!
//	AI_Output				(self, hero, "MIL_121_MYWEAPON_TAKEN_06_02"); //Regel Nummer 3, du Trottel! Jetzt habe ich den Kampf gewonnen, Har Har Har!
	AI_Output				(self, hero, "MIL_121_MYWEAPON_TAKEN_06_02"); //Pravidlo číslo 3, ty trotle! Takže jsem v souboji zvítězil, Har Har Har!
	AI_StopProcessInfos		(self);

	B_Arena_AbortFight		(AF_PLAYERSTOLEWEAPON);
};

///////////////////////////////////////////////////////////////////////
//	Info CHALLENGED
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_CHALLENGED (C_INFO)
{
	npc				= MIL_121_Brutus;
	nr				= 2;
	condition		= MIL_121_Brutus_CHALLENGED_Condition;
	information		= MIL_121_Brutus_CHALLENGED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	MIL_121_Brutus_CHALLENGED_Condition()
{
	if	Brutus_Challenged
	&&	Arena_PlayerFight
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	MIL_121_Brutus_CHALLENGED_Info()
{
	if	Wld_IsTime(0,0,	ARENABEGIN_H, ARENABEGIN_M)
	{
		if	(Npc_GetDistToWP	(self, ARENA_WP_RIGHT_CHAMBER) > ARENA_DIST_PRECHAMBER)
		{
//			AI_Output			(self, hero,"MIL_121_CHALLENGED_06_01"); //Wir sehen uns in der Arena, Kleiner! Heute Abend!
			AI_Output			(self, hero,"MIL_121_CHALLENGED_06_01"); //Uvidíme se v aréně, maličký. Dnes večer!
		}
		else
		{
//			AI_Output			(self, hero,"MIL_121_CHALLENGED_06_02"); //Verschwinde in deine eigene Kammer!
			AI_Output			(self, hero,"MIL_121_CHALLENGED_06_02"); //Vodprejskni do svojí vlastní komory!
		};

		AI_StopProcessInfos		(self);
		return;
	};

	if	Npc_IsInRoutine(self, ZS_ArenaFight)
	{
//		AI_Output				(self, hero,"MIL_121_CHALLENGED_06_03"); //(bedrohlich) Ich mach dich platt!!!
		AI_Output				(self, hero,"MIL_121_CHALLENGED_06_03"); //(výhružně) Teď tě srovnám!!!
		AI_StopProcessInfos		(self);
		return;
	}
	else
	{
//		AI_Output				(self, hero,"MIL_121_CHALLENGED_06_04"); //Wir sehen uns in der Arena, Kleiner! Morgen Abend!
		AI_Output				(self, hero,"MIL_121_CHALLENGED_06_04"); //Uvidíme se v aréně, maličký! Zítra večer!
		AI_StopProcessInfos		(self);
		return;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PRENPC
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_PRENPC (C_INFO)
{
	npc				= MIL_121_Brutus;
	condition		= MIL_121_Brutus_PRENPC_Condition;
	information		= MIL_121_Brutus_PRENPC_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	MIL_121_Brutus_PRENPC_Condition()
{
	if	Arena_NpcFight
	&&	((Arena_NpcCombo == AC_GOLIATH_BRUTUS) || (Arena_NpcCombo == AC_BRUTUS_MALGAR))
	&&	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	&&	C_NpcIsInvincible(self)
	{
		return TRUE;
	};
};

func void	MIL_121_Brutus_PRENPC_Info()
{
//	AI_Output			(self, hero,"MIL_121_PRENPC_06_01"); //Verschwinde! Dieser Raum ist nur für Gladiatoren vor dem Kampf!
	AI_Output			(self, hero,"MIL_121_PRENPC_06_01"); //Zmizni! Tohle je místnost jen pro gladiátory před soubojem!
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_GLADIATOR		(C_INFO)
{
	npc		 	= 	MIL_121_Brutus;
	nr		 	= 	1;
	condition	= 	MIL_121_Brutus_GLADIATOR_Condition;
	information	= 	MIL_121_Brutus_GLADIATOR_Info;
	important	=	FALSE;
	permanent	=	FALSE;

//	description	=	"Du bist bestimmt einer der Gladiatoren!";
	description	=	"Ty budeš určitě jeden z gladiátorů!";
};

func int MIL_121_Brutus_GLADIATOR_Condition ()
{
	return TRUE;
};

func int MIL_121_Brutus_GLADIATOR_Info ()
{
//	AI_Output			(hero, self, "MIL_121_GLADIATOR_15_01"); //Du bist bestimmt einer der Gladiatoren!
	AI_Output			(hero, self, "MIL_121_GLADIATOR_15_01"); //Ty budeš určitě jeden z gladiátorů!
//	AI_Output			(self, hero, "MIL_121_GLADIATOR_06_02"); //Woher willst du das wissen, Kleiner?
	AI_Output			(self, hero, "MIL_121_GLADIATOR_06_02"); //Odkudpak to víš, maličký?

	Info_ClearChoices	(MIL_121_Brutus_GLADIATOR);
//	Info_AddChoice	(MIL_121_Brutus_GLADIATOR, "Ich habe geraten.", MIL_121_Brutus_GLADIATOR_NOONE );
	Info_AddChoice	(MIL_121_Brutus_GLADIATOR, "Jen jsem to zkusil.", MIL_121_Brutus_GLADIATOR_NOONE );
//	Info_AddChoice	(MIL_121_Brutus_GLADIATOR, "Was ist dein Problem?", MIL_121_Brutus_GLADIATOR_PROVOKE );
	Info_AddChoice	(MIL_121_Brutus_GLADIATOR, "Máš nějaký problém?", MIL_121_Brutus_GLADIATOR_PROVOKE );

};


func void MIL_121_Brutus_GLADIATOR_PROVOKE ()
{
	Info_ClearChoices	(MIL_121_Brutus_GLADIATOR);

//	AI_Output			(hero, self, "MIL_121_GLADIATOR_PROVOKE_15_01"); //Was ist dein Problem?
	AI_Output			(hero, self, "MIL_121_GLADIATOR_PROVOKE_15_01"); //Máš nějaký problém?
	if	Npc_HasItems	(self, ItMw_Brutus_Longsword)
	{
		AI_ReadyMeleeWeapon(self);
	};
//	AI_Output			(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_02"); //Wenn du nicht deine Fresse hältst, hast DU ein Problem, Kleiner!
	AI_Output			(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_02"); //Pokud nebudeš držet tlamu, budeš mít problém TY, bráško!
//	AI_Output			(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_03"); //Vorlaute Spinner wie dich mach ich besonders gerne platt!
	AI_Output			(self, hero, "MIL_121_GLADIATOR_PROVOKE_06_03"); //Takový drzý parchanty, jako jseš ty, vždycky rád srovnám!

	if	Npc_HasItems	(self, ItMw_Brutus_Longsword)
	{
		AI_RemoveWeapon	(self);
	};
};

func void MIL_121_Brutus_GLADIATOR_NOONE ()
{
	Info_ClearChoices	(MIL_121_Brutus_GLADIATOR);

//	AI_Output			(hero, self, "MIL_121_GLADIATOR_NOONE_15_01"); //Ich habe geraten.
	AI_Output			(hero, self, "MIL_121_GLADIATOR_NOONE_15_01"); //Jen jsem to zkusil.
//	AI_Output			(self, hero, "MIL_121_GLADIATOR_NOONE_06_02"); //Und ich rate dir mich nicht zu nerven, sonst mach ich dich platt!
	AI_Output			(self, hero, "MIL_121_GLADIATOR_NOONE_06_02"); //A taky už dál nezkoušej mě vytáčet, jinak tě srovnám!
};

///////////////////////////////////////////////////////////////////////
//	Info YOUMILITIA
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_YOUMILITIA		(C_INFO)
{
	npc		 = 	MIL_121_Brutus;
	condition	 = 	MIL_121_Brutus_YOUMILITIA_Condition;
	information	 = 	MIL_121_Brutus_YOUMILITIA_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Du siehst aber eher aus wie ein Milizsoldat!";
	description	 = 	"Ale vypadáš spíš jako voják z domobrany!";
};

func int MIL_121_Brutus_YOUMILITIA_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_121_Brutus_GLADIATOR)
	&&	!self.aivar[AIV_FINDABLE]
	{ 
		return TRUE;
	};
};

func void MIL_121_Brutus_YOUMILITIA_Info ()
{
//	AI_Output			(hero, self, "MIL_121_YOUMILITIA_15_01"); //Du siehst aber eher aus wie ein Milizsoldat!
	AI_Output			(hero, self, "MIL_121_YOUMILITIA_15_01"); //Ale vypadáš spíš jako voják z domobrany!
//	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_02"); //Hör zu Kleiner, falls du es noch nicht gemerkt hast...
	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_02"); //Poslouchej, maličký, jestli sis toho doteď nevšiml...
//	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_03"); //Du sprichst mit LEUTNANT Brutus, dem zweiten Mann in der Miliz gleich nach diesem verbitterten Arsch von Berengar.
	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_03"); //Mluvíš s PORUČÍKEM Brutem, druhým mužem v domobraně hned po tom pitomým hajzlovi z Berengaru.
//	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_04"); //Also zeig gefälligst ein bischen mehr Respekt oder ich mach dich platt!
	AI_Output			(self, hero, "MIL_121_YOUMILITIA_06_04"); //Takže se koukej chovat trochu víc s úctou, jinak tě srovnám!
};

///////////////////////////////////////////////////////////////////////
//	Info YOULIEUTENANT
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_YOULIEUTENANT		(C_INFO)
{
	npc		 = 	MIL_121_Brutus;
	condition	 = 	MIL_121_Brutus_YOULIEUTENANT_Condition;
	information	 = 	MIL_121_Brutus_YOULIEUTENANT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Bist du nicht einer dieser beiden Leutnants der Miliz?";
	description	 = 	"Nejsi ty jeden z těch dvou poručíků domobrany?";
};

func int MIL_121_Brutus_YOULIEUTENANT_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_121_Brutus_GLADIATOR)
	&&	self.aivar[AIV_FINDABLE]
	{ 
		return TRUE;
	};
};

func void MIL_121_Brutus_YOULIEUTENANT_Info ()
{
//	AI_Output			(hero, self, "MIL_121_YOULIEUTENANT_15_01"); //Bist du nicht einer dieser beiden Leutnants der Miliz?
	AI_Output			(hero, self, "MIL_121_YOULIEUTENANT_15_01"); //Nejsi ty jeden z těch dvou poručíků domobrany?
//	AI_Output			(self, hero, "MIL_121_YOULIEUTENANT_06_02"); //Das bin ich, Kleiner. Und deshalb solltest du gut aufpassen, wie du mir mir redest!
	AI_Output			(self, hero, "MIL_121_YOULIEUTENANT_06_02"); //To jsem, maličký. A proto by sis měl dobře hlídat, jak se mnou budeš mluvit!
};

///////////////////////////////////////////////////////////////////////
//	Info CASSIAN
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_CASSIAN		(C_INFO)
{
	npc		 = 	MIL_121_Brutus;
	condition	 = 	MIL_121_Brutus_CASSIAN_Condition;
	information	 = 	MIL_121_Brutus_CASSIAN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!";
	description	 = 	"Slyšel jsem, že Cassian je taktéž poručíkem domobrany!";
};

func int MIL_121_Brutus_CASSIAN_Condition ()
{
	var c_npc cassian;
	cassian = Hlp_GetNpc(MIL_119_Cassian);

	if	(Npc_KnowsInfo(hero,MIL_121_Brutus_YOUMILITIA) || Npc_KnowsInfo(hero,MIL_121_Brutus_YOULIEUTENANT))
	&&	(Npc_KnowsInfo(hero,	Mil_119_Cassian_HI) || cassian.aivar[AIV_FINDABLE])
	{ 
		return TRUE;
	};
};

func void MIL_121_Brutus_CASSIAN_Info ()
{
//	AI_Output			(hero, self, "MIL_121_CASSIAN_15_01"); //Ich habe gehört, Cassian ist ebenfalls Miliz-Leutnant!
	AI_Output			(hero, self, "MIL_121_CASSIAN_15_01"); //Slyšel jsem, že Cassian je taktéž poručíkem domobrany!
//	AI_Output			(self, hero, "MIL_121_CASSIAN_06_02"); //(aggressiv)Cassian, ist ein Weichling! Eine Memme.
	AI_Output			(self, hero, "MIL_121_CASSIAN_06_02"); //(agresivně) Cassian, to je slaboch! Zbabělec.
//	AI_Output			(self, hero, "MIL_121_CASSIAN_06_03"); //Der weiss schon garnicht mehr, wie sich ein Schwert überhaupt anfühlt.
	AI_Output			(self, hero, "MIL_121_CASSIAN_06_03"); //Vždyť už ani neví, jaký to je držet v rukou meč.
//	AI_Output			(self, hero, "MIL_121_CASSIAN_06_04"); //Steht den ganzen Tag im Burghof, und gibt besserwisserische Kommentare an die Rekruten.
	AI_Output			(self, hero, "MIL_121_CASSIAN_06_04"); //Celej den stojí na nádvoří a poučuje tam rekruty svými přemudřelými komentáři.
//	AI_Output			(self, hero, "MIL_121_CASSIAN_06_05"); //Der sollte sich liebermal hier in die Arena herunterwagen, dann werde ich ihm schon zeigen, wie man kämfpt.
	AI_Output			(self, hero, "MIL_121_CASSIAN_06_05"); //Měl by spíš zajít sem dolů do arény, to bych mu hnedka ukázal, jak se bojuje.
//	AI_Output			(hero, self, "MIL_121_CASSIAN_15_06"); //(grins) Wenn ich ihn sehe, werde ich es ihm ausrichten.
	AI_Output			(hero, self, "MIL_121_CASSIAN_15_06"); //(šklebí se) Až ho uvidím, tak mu to vzkážu.
};



///////////////////////////////////////////////////////////////////////
//	Info CHALLENGE
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_CHALLENGE (C_INFO)
{
	npc				= MIL_121_Brutus;
	condition		= MIL_121_Brutus_CHALLENGE_Condition;
	information		= MIL_121_Brutus_CHALLENGE_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Laß uns in der Arena klären, wer hier wen plattmacht!";
	description		= "Pojďme si do arény ujasnit, kdo koho srovná!";

};

func int	MIL_121_Brutus_CHALLENGE_Condition()
{
	if	Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
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

func void	MIL_121_Brutus_CHALLENGE_Info()
{
//	AI_Output			(hero, self, "MIL_121_CHALLENGE_15_01"); //Laß uns in der Arena klären, wer hier wen plattmacht!
	AI_Output			(hero, self, "MIL_121_CHALLENGE_15_01"); //Pojďme si do arény ujasnit, kdo koho srovná!

	if	!Npc_HasItems(self, ItMw_Brutus_Longsword)
	{
//		AI_Output		(self, hero,"MIL_121_CHALLENGE_06_02"); //Irgend so ein Witzbold hat sich mein Schwert unter den Nagel gerissen. Wenn ich den erwische, mach ich ihn platt...
		AI_Output		(self, hero,"MIL_121_CHALLENGE_06_02"); //Nějakej vtipálek mi někam schoval můj meč. Jen co ho dostanu, tak ho srovnám...

		if	Npc_HasItems(hero, ItMw_Brutus_Longsword)
		{
			Info_ClearChoices	(MIL_121_Brutus_CHALLENGE);
//			Info_AddChoice		(MIL_121_Brutus_CHALLENGE, "Ich habe deine Waffe... ähem... gefunden! Hier!",MIL_121_Brutus_CHALLENGE_FOUND);
			Info_AddChoice		(MIL_121_Brutus_CHALLENGE, "Já jsem tvoji zbraň... ehm... našel! Tady!",MIL_121_Brutus_CHALLENGE_FOUND);
		};
		return;
	};

	if	Arena_PlayerBanned
	{
//		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_03"); //Sehr gerne!
		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_03"); //Velice rád!
//		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_04"); //Aber der Arenameister wird dich nicht kämpfen lassen, weil du Scheisse gebaut hast
		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_04"); //Ale mistr arény tě nenechá bojovat, protože jsi zatím udělal velký hovno.
	}
	else
	{
		if	(B_Arena_GetGladiatorRanking(PC_Hero) > (B_Arena_GetGladiatorRanking(MIL_121_Brutus)+1))
		{

//			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_05"); //(verächtlich) PAHHHH!!! Ich mach meine Klinge doch nicht an Würstchen wie dir stumpf!
			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_05"); //(pohrdavě) PCHÁÁÁ!!! O takový buřtíky, jako jseš ty, si nebudu tupit čepel!
//			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_06"); //Komm wieder wenn du Grim und Goliath ein paar Mal die Fresse poliert hast!
			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_06"); //Vrať se, až Grimovi a Goliathovi uštědříš pár ran přes klapačku.

			return;
		};

		if	(B_Arena_GetGladiatorRanking(PC_Hero) <= (B_Arena_GetGladiatorRanking(MIL_121_Brutus)-2))
		{
//			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_07"); //Such dir jemand anderen!
			AI_Output	(self, hero, "MIL_121_CHALLENGE_06_07"); //Najdi si někoho jiného!
//			AI_Output	(hero, self, "MIL_121_CHALLENGE_15_08"); //Was ein Held du doch bist... Ein MAUL...held!
			AI_Output	(hero, self, "MIL_121_CHALLENGE_15_08"); //Jakej jseš to hrdina... hrdina... ŽVANIL!

			return;
		};

		//else
//		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_09"); //Mit dem grössten Vergnügen, Kleiner!
		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_09"); //Bude mi potěšením, maličký!
//		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_10"); //Wenn du dich damit zum Arenameister traust, kann es heute abend losgehen.
		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_10"); //Pokud s tím zajdeš za mistrem arény, může to být ještě dneska večer.
//		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_11"); //Har, har, har!
		AI_Output		(self, hero, "MIL_121_CHALLENGE_06_11"); //Har, har, har!

		Brutus_Challenged = TRUE;
	};
};

func void MIL_121_Brutus_CHALLENGE_FOUND ()
{
	Info_ClearChoices	(MIL_121_Brutus_CHALLENGE);
//	AI_Output			(hero, self,"MIL_121_Brutus_CHALLENGE_FOUND_15_01"); //Ich habe deine Waffe... ähem... gefunden! Hier!
	AI_Output			(hero, self,"MIL_121_Brutus_CHALLENGE_FOUND_15_01"); //Já jsem tvoji zbraň... ehm... našel! Tady!
	B_GiveInvItems		(hero, self, ItMw_Brutus_Longsword, 1);
//	AI_Output			(self, hero,"MIL_121_Brutus_CHALLENGE_FOUND_06_02"); //Kann nur für dich hoffen, dass du es wirklich GEFUNDEN hast.
	AI_Output			(self, hero,"MIL_121_Brutus_CHALLENGE_FOUND_06_02"); //Pro tvoje vlastní dobro doufám, že jsi ji doopravdy NAŠEL.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_WEAPON (C_INFO)
{
	npc				= MIL_121_Brutus;
	condition		= MIL_121_Brutus_WEAPON_Condition;
	information		= MIL_121_Brutus_WEAPON_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Ist das da deine Waffe?";
	description		= "Je tohleto tvoje zbraň?";
};

func int	MIL_121_Brutus_WEAPON_Condition()
{
	if	Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
	{
		return TRUE;
	};
};

func void	MIL_121_Brutus_WEAPON_Info()
{
//	AI_Output			(hero, self,"MIL_121_WEAPON_15_01"); //Ist das da deine Waffe?
	AI_Output			(hero, self,"MIL_121_WEAPON_15_01"); //Je tohleto tvoje zbraň?

	if	Npc_HasItems	(self, ItMw_Brutus_Longsword)
	{
		AI_ReadyMeleeWeapon(self);
	};
//	AI_Output			(self, hero,"MIL_121_WEAPON_06_02"); //Das ist das schärfste Schwert im ganzen Lager!
	AI_Output			(self, hero,"MIL_121_WEAPON_06_02"); //Je to ten nejostřejší meč v celém táboře!
//	AI_Output			(self, hero,"MIL_121_WEAPON_06_03"); //Ich schleife es täglich... extra für Spinner wie dich!
	AI_Output			(self, hero,"MIL_121_WEAPON_06_03"); //Každý den ho brousím... hlavně na trdla jako jseš ty!
	if	Npc_HasItems	(self, ItMw_Brutus_Longsword)
	{
		AI_RemoveWeapon	(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info VICTORIES
///////////////////////////////////////////////////////////////////////
instance	MIL_121_Brutus_VICTORIES (C_INFO)
{
	npc				= MIL_121_Brutus;
	condition		= MIL_121_Brutus_VICTORIES_Condition;
	information		= MIL_121_Brutus_VICTORIES_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Du hast bestimmt schon oft gewonnen, oder?";
	description		= "Ty jsi určitě už hodněkrát vyhrál, že jo?";
};

func int	MIL_121_Brutus_VICTORIES_Condition()
{
	if	Npc_KnowsInfo(hero, MIL_121_Brutus_GLADIATOR)
	{
		return TRUE;
	};
};

func void	MIL_121_Brutus_VICTORIES_Info()
{
//	AI_Output			(hero, self, "MIL_121_VICTORIES_15_01"); //Du hast bestimmt schon oft gewonnen, oder?
	AI_Output			(hero, self, "MIL_121_VICTORIES_15_01"); //Ty jsi určitě už hodněkrát vyhrál, že jo?
//	AI_Output			(self, hero, "MIL_121_VICTORIES_06_02"); //Ich bin einer der besten Gladiatoren hier!
	AI_Output			(self, hero, "MIL_121_VICTORIES_06_02"); //Jsem tu jeden z nejlepších gladiátorů!
//	AI_Output			(self, hero, "MIL_121_VICTORIES_06_03"); //Und jetzt verzieh dich.
	AI_Output			(self, hero, "MIL_121_VICTORIES_06_03"); //A teď se ztrať.
	AI_TurnAway			(hero, self);
//	AI_Output			(hero, self, "MIL_121_VICTORIES_15_04"); //(zu sich selbst) Was ein Arsch!
	AI_Output			(hero, self, "MIL_121_VICTORIES_15_04"); //(sám k sobě) To je sráč!
//	AI_Output			(self, hero, "MIL_121_VICTORIES_06_05"); //Das hab ich gehört, Kleiner!
	AI_Output			(self, hero, "MIL_121_VICTORIES_06_05"); //Já to slyšel, prcku!

	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info HOWDY
///////////////////////////////////////////////////////////////////////
instance MIL_121_Brutus_HOWDY		(C_INFO)
{
	npc		 = 	MIL_121_Brutus;
	condition	 = 	MIL_121_Brutus_HOWDY_Condition;
	information	 = 	MIL_121_Brutus_HOWDY_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Na, ist deine Klinge noch schön scharf?";
	description	 = 	"Nu, je tvoje čepel pořád hezky ostrá?";
};

func int MIL_121_Brutus_HOWDY_Condition ()
{
	if	Npc_KnowsInfo(hero,MIL_121_Brutus_WEAPON)
	&&	Npc_KnowsInfo(hero,MIL_121_Brutus_VICTORIES)
	&&	!MIL_121_Brutus_CHALLENGE_Condition()
	{
		return TRUE;
	};
};

func void MIL_121_Brutus_HOWDY_Info ()
{
//	AI_Output			(hero, self, "MIL_121_HOWDY_15_01"); //Na, ist deine Klinge noch schön scharf?
	AI_Output			(hero, self, "MIL_121_HOWDY_15_01"); //Nu, je tvoje čepel pořád hezky ostrá?
//	AI_Output			(self, hero, "MIL_121_HOWDY_06_02"); //...wenn du nicht aufhörst mir dumm zu kommen, dann...
	AI_Output			(self, hero, "MIL_121_HOWDY_06_02"); //...jestli ze mě nepřestaneš dělat blba, tak...
//	AI_Output			(hero, self, "MIL_121_HOWDY_15_03"); //(spöttisch)...machst du mich platt? Wir werden sehen!
	AI_Output			(hero, self, "MIL_121_HOWDY_15_03"); //(posměšně)...mě srovnáš? Uvidíme!
	AI_StopProcessInfos	(self);
};







































































