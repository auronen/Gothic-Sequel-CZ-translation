// This variable is a workaround for a bug -> function Npc_KnowsInfo() doesn't work on permanent = TRUE dialogues
// BF_ prefix is used on all newly introduced variables
const int BF_Arenamaster_Askagain = FALSE; 

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_EXIT (C_INFO)
{
	npc			=  MIL_122_Arenamaster;
	nr			=  999;
	condition	=  Info_Arenamaster_EXIT_Condition;
	information	=  Info_Arenamaster_EXIT_Info;
	important	=  FALSE;
	permanent	=  TRUE;
	description	=  DIALOG_ENDE;
};

func int	Info_Arenamaster_EXIT_Condition()
{
	return TRUE;
};

func void	Info_Arenamaster_EXIT_Info()
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
//	Info NICEFIGHT
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_NICEFIGHT (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	nr				= 2;
	condition		= Info_Arenamaster_NICEFIGHT_Condition;
	information		= Info_Arenamaster_NICEFIGHT_Info;
	important		= TRUE;
	permanent		= FALSE;
};

func int	Info_Arenamaster_NICEFIGHT_Condition()
{
	if	Arenamaster_Teased
	&&	Npc_IsInRoutine	(self, ZS_ArenaMasterNpc)
	&&	(Npc_GetDistToWP(self,ARENA_WP_THRONE) <	300)
	&&	(Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG)
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_NICEFIGHT_Info()
{
	if	Npc_KnowsInfo(hero,Info_Arenamaster_SOUNDSGOOD)
	{
//		AI_Output		(self, hero,"Info_Arenamaster_NICEFIGHT_12_01"); //Ahh,	da bist	du ja!
		AI_Output		(self, hero,"Info_Arenamaster_NICEFIGHT_12_01"); //Ahh, tady jsi!
	}
	else
	{
		Arenamaster_FirstDay = B_GetDay();
		Log_CreateTopic		(CH1_Arena,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_Arena,	LOG_RUNNING);
	};

//	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_15_02"); //Netter Kampf!
	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_15_02"); //Pěkný souboj!
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_03"); //Allerdings! Die Arenakämpfe sind	der	Höhepunkt in diesem	flohzerfressenen Lager.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_03"); //Vskutku! Souboje v aréně jsou vrchol v tomto blechami prolezlém táboře.
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_04"); //Wenn	du hier	etwas werden willst, bleibt	dir	im Grunde garnichts	anderes	übrig, als Gladiator zu	werden.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_04"); //Pokud se tady chceš něčím stát, nemáš v podstatě jinou možnost, než být gladiátorem.
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_05"); //Würdest du dich trauen, dich	selbst einmal in die Arena zu stellen und in die Augen eines anderen Gladiatoren zu	blicken?
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_12_05"); //Troufl by sis vstoupit do arény a podívat se jinému gladiátorovi do očí?

	Info_ClearChoices	(Info_Arenamaster_NICEFIGHT);
//	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Ich kämpfe	nicht zur Belustigung anderer!",	Info_Arenamaster_NICEFIGHT_NO);
	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Nebojuji pro pobavení ostatních!",				Info_Arenamaster_NICEFIGHT_NO);
//	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Was springt für mich dabei	raus?",				Info_Arenamaster_NICEFIGHT_WHAT);
	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Co z toho budu mít já?",						Info_Arenamaster_NICEFIGHT_WHAT);
//	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Warum nicht! Was die können, kann ich auch!",	Info_Arenamaster_NICEFIGHT_YES);
	Info_AddChoice		(Info_Arenamaster_NICEFIGHT,	"Proč ne! Co dokážou oni, svedu taky!",			Info_Arenamaster_NICEFIGHT_YES);
};

func void Info_Arenamaster_NICEFIGHT_YES ()
{
	Info_ClearChoices	(Info_Arenamaster_NICEFIGHT);
//	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_YES_15_01"); //Warum nicht!	Was	die	können,	kann ich auch!
	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_YES_15_01"); //Proč ne! Co dokážou oni, svedu taky!
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_YES_12_02"); //Sehr	gut! Am	besten du forderst gleich einen	der	anderen	Gladiatoren	heraus.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_YES_12_02"); //Velmi dobře! Nejlepší bude, když vyzveš nějakého gladiátora k souboji.
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_YES_12_03"); //Komm	dann zurück	zu mir und wir regeln alles	weitere.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_YES_12_03"); //Pak se ke mně vrať a domluvíme všechno ostatní.

	Arenamaster_Accepted = TRUE;
//	B_LogEntry			(CH1_Arena,	"Wenn ich als Gladiator	kämpfen	will, muß ich einen	der	anderen	Kämpfer	herausfordern und dann zum Arenameister	zurückkehren!");
	B_LogEntry			(CH1_Arena,	"Pokud chci bojovat jako gladiátor, musím jednoho z ostatních gladiátorů vyzvat k souboji a vrátit se k mistrovi arény!");

	AI_StopProcessInfos	(self);
};

func void Info_Arenamaster_NICEFIGHT_WHAT ()
{
	Info_ClearChoices	(Info_Arenamaster_NICEFIGHT);
//	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_WHAT_15_01"); //Was	springt	für	mich dabei raus?
	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_WHAT_15_01"); //Co z toho budu mít já?
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_02"); //Ahhh...	ein	Kaufmann...! Nunja,	wenn du	dich in	der	Arena geschickt	anstellst, kannst du dir eine goldene Nase verdienen.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_02"); //Ahhh...	pán je obchodník! No tedy, pokud se ti bude v aréně dařit, můžeš si vydělat celé jmění.
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_03"); //Fordere	einen der anderen Arenakämpfer heraus und komme	dann zu	mir	zurück.
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_WHAT_12_03"); //Vyzvi jednoho z bojovníků a přijď zpátky za mnou.

	Arenamaster_Accepted = TRUE;
//	B_LogEntry			(CH1_Arena,	"Wenn ich als Gladiator	etwas Silber verdienen will, soll ich einen	der	anderen	Kämpfer	herausfordern und dann wieder mit dem Arenameister sprechen!");
	B_LogEntry			(CH1_Arena,	"Pokud si chci vydělat nějaké stříbro jako gladiátor, měl bych vyzvat jednoho z dalších bojovníků a pak si znovu promluvit s mistrem arény.");

	AI_StopProcessInfos	(self);
};

func void Info_Arenamaster_NICEFIGHT_NO	()
{
	Info_ClearChoices	(Info_Arenamaster_NICEFIGHT);
//	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_NO_15_01");	//Ich kämpfe nicht zur Belustigung anderer!
	AI_Output			(hero, self,"Info_Arenamaster_NICEFIGHT_NO_15_01");	//Nebojuji pro pobavení ostatních!
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_NO_12_02");	//Schade. Einen	Mann wie dich würde	ich	gerne in der Arena sehen!
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_NO_12_02");	//Škoda. Rád bych v aréně viděl chlapa jako jsi ty!
//	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_NO_12_03");	//Naja,	komm wieder	wenn du	deine Meinung geändert hast!
	AI_Output			(self, hero,"Info_Arenamaster_NICEFIGHT_NO_12_03");	//Nojo... Pokud si to rozmyslíš, vrať se!

//	B_LogEntry			(CH1_Arena,	"Ich habe das Angebot des Arenameisters, Gladiator zu werden, abgelehnt! Er	bot	mir	an,	es mir nochmal zu überlegen.");
	B_LogEntry			(CH1_Arena,	"Nabídku, stát se gladiátorem, jsem mistrovi arény odmítl! Nabídl mi své rozhodnutí přehodnotit.");

	Arenamaster_Failed	= TRUE;

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NEWBIE
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_NEWBIE	(C_INFO)
{
	npc				= MIL_122_Arenamaster;
	nr				= 1;
	condition		= Info_Arenamaster_NEWBIE_Condition;
	information		= Info_Arenamaster_NEWBIE_Info;
	important		= TRUE;
	permanent		= FALSE;
};

func int	Info_Arenamaster_NEWBIE_Condition()
{
	if	Wld_IsTime (ARENASTAND_H,ARENASTAND_M, ARENAEND_H, ARENAEND_M)
	&&	(Npc_GetDistToNpc(self,hero) < PERC_DIST_DIALOG)
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_NEWBIE_Info()
{
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_12_01"); //HEY	DU!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_12_01"); //HEJ TY!
//	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_15_02"); //Wer	ich?
	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_15_02"); //Kdo, já?
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_12_03"); //Du siehst kräftig aus. Bist	du an Ruhm und Ehre	interessiert?
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_12_03"); //Vypadáš dost silně. Zajímá tě sláva a uznání?

	Info_ClearChoices	(Info_Arenamaster_NEWBIE);
//	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Such dir einen	anderen	Trottel",		Info_Arenamaster_NEWBIE_FOOL);
	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Najdi si nějakého jiného trotla.",		Info_Arenamaster_NEWBIE_FOOL);
//	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Silber	wäre mir lieber!",				Info_Arenamaster_NEWBIE_SILVER);
	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Stříbro mám raději!",					Info_Arenamaster_NEWBIE_SILVER);
//	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Ruhm und Ehre?	Warum nicht!",			Info_Arenamaster_NEWBIE_YES);
	Info_AddChoice		(Info_Arenamaster_NEWBIE,	"Sláva a uznání? Proč ne!",				Info_Arenamaster_NEWBIE_YES);

	Arenamaster_FirstDay = B_GetDay();
};

func void	Info_Arenamaster_NEWBIE_YES	()
{
	Info_ClearChoices	(Info_Arenamaster_NEWBIE);

//	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_YES_15_01"); //Ruhm und Ehre? Warum nicht!
	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_YES_15_01"); //Sláva a uznání? Proč ne!
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_02"); //Dann solltest du dich für die Arenakämpfe anmelden!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_02"); //Tak to ti mohu nabídnout tento souboj v aréně!
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_03"); //In der Arena wirst du große	Proben für deinen Mut und deine	Stärke finden!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_03"); //V aréně si ověříš svou odvahu a sílu!
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_04"); //Die	Menge wird dir zujubeln	und	dich anfeuern!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_04"); //Dav tě bude povzbuzovat a pobízet!
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_05"); //Als	siegreicher	Gladiator warten Ruhm und Ehre auf dich!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_YES_12_05"); //Pokud vyhraješ, čeká na tebe sláva a čest!

	Arenamaster_Teased = TRUE;

	if	Info_Arenamaster_NICEFIGHT_Condition()
	{
		AI_StopProcessInfos	(self);
	};
};

func void	Info_Arenamaster_NEWBIE_SILVER ()
{
	Info_ClearChoices	(Info_Arenamaster_NEWBIE);

//	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_SILVER_15_01"); //Silber wäre mir lieber!
	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_SILVER_15_01"); //Stříbro mám raději!
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_SILVER_12_02"); //Dann	bist du	hier genau richtig,	denn Silber	kannst du hier zuhauf verdienen.
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_SILVER_12_02"); //Pak jsi na správném místě, protože tady si můžeš vydělat hromady stříbra.
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_SILVER_12_03"); //Melde dich für die Arenakämpfe und der Reichtum eines siegreichen Gladiators	kann schon bald	dein sein!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_SILVER_12_03"); //Zapiš se do bojů v aréně a bohatství, které doprovází vítězství v aréně, může být tvé!

	Arenamaster_Teased = TRUE;

	if	Info_Arenamaster_NICEFIGHT_Condition()
	{
		AI_StopProcessInfos	(self);
	};
};

func void	Info_Arenamaster_NEWBIE_FOOL ()
{
	Info_ClearChoices	(Info_Arenamaster_NEWBIE);

//	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_FOOL_15_01"); //Such dir einen	anderen	Trottel!
	AI_Output			(hero, self,"Info_Arenamaster_NEWBIE_FOOL_15_01"); //Najdi si nějakého jiného trotla.
//	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_FOOL_12_02"); //Kein Grund	unfreundlich zu	werden,	ich	wollte dir nur ein Angebot unterbreiten!
	AI_Output			(self, hero,"Info_Arenamaster_NEWBIE_FOOL_12_02"); //Není třeba být tak hrubý! Pouze jsem ti chtěl něco nabídnout!

	Log_CreateTopic		(CH1_Arena,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_Arena,	LOG_RUNNING);
//	B_LogEntry			(CH1_Arena,	"Der Arenameister wollte irgendeine	Bauernfängerei mit mir abziehen. Ich habe ihm eine Abfuhr erteilt!");
	B_LogEntry			(CH1_Arena,	"Mistr arény se mnou chtěl sehrát nějakou taškařici. Odmítl jsem ho!");

	Arenamaster_Failed	= TRUE;

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SOUNDSGOOD
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_SOUNDSGOOD	(C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_SOUNDSGOOD_Condition;
	information		= Info_Arenamaster_SOUNDSGOOD_Info;
	important		= FALSE;
	permanent		= FALSE;
//	description		= "Hört	sich gut an. Was muss ich tun?";
	description		= "To zní dobře, co mám dělat?";
};

func int	Info_Arenamaster_SOUNDSGOOD_Condition()
{
	var int	niceFight;
	niceFight = Info_Arenamaster_NICEFIGHT_Condition();

	if	(	(Arenamaster_Teased && !niceFight)
//			||	Npc_KnowsInfo(hero,MIL_122_Arenamaster_ASKAGAIN)				)
			||	BF_Arenamaster_Askagain	)
	&&	!Arenamaster_Accepted
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_SOUNDSGOOD_Info()
{
//	AI_Output			(hero, self,"Info_Arenamaster_SOUNDSGOOD_15_01"); //Hört sich gut an. Was muss ich tun?
	AI_Output			(hero, self,"Info_Arenamaster_SOUNDSGOOD_15_01"); //To zní dobře, co mám dělat?
//	AI_Output			(self, hero,"Info_Arenamaster_SOUNDSGOOD_12_02"); //Besuche	mich einfach mal beim Arenakampf. Dann unterhalten wir uns weiter!
	AI_Output			(self, hero,"Info_Arenamaster_SOUNDSGOOD_12_02"); //Stačí, když mě navštívíš před soubojem v aréně. Potom si povíme víc!
	AI_StopProcessInfos	(self);

	Arenamaster_FirstDay = B_GetDay();
	Log_CreateTopic		(CH1_Arena,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_Arena,	LOG_RUNNING);
//	B_LogEntry			(CH1_Arena,	"Wenn ich selbst als Gladiator kämpfen will, muß ich abends	während	eines Arenakampfes mit dem Arenameister	reden.");
	B_LogEntry			(CH1_Arena,	"Pokud se chci sám stát gladiátorem, musím si večer promluvit s mistrem arény během nějakého souboje.");
};

///////////////////////////////////////////////////////////////////////
//	Info ASKAGAIN
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_ASKAGAIN		(C_INFO)
{
	npc		 	 =	MIL_122_Arenamaster;
	condition	 =	MIL_122_Arenamaster_ASKAGAIN_Condition;
	information	 =	MIL_122_Arenamaster_ASKAGAIN_Info;
	important	 =	FALSE;
	permanent	 =	TRUE;

//	description	 =	"Wegen deinem Angebot...";
	description	 =	"O té nabídce...";
};

func int MIL_122_Arenamaster_ASKAGAIN_Condition	()
{
	if	Arenamaster_Failed
	&&	!Arenamaster_Teased
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_ASKAGAIN_Info	()
{
//	AI_Output			(hero, self, "MIL_122_ASKAGAIN_15_01");	//Wegen	deinem Angebot...
	AI_Output			(hero, self, "MIL_122_ASKAGAIN_15_01");	//O té nabídce...
//	AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_02");	//Hast es dir wohl anders überlegt was?
	AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_02");	//Už sis to rozmyslel?
//	AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_03");	//Na, ich will mal nicht so	sein. Wenn du jetzt	interessiert bist, dann	gilt mein Angebot noch.
	AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_03");	//No, nechci být takový. Pokud má zájem, má nabídka stále platí.

	Arenamaster_Teased = TRUE;
	Arenamaster_Failed = FALSE;

	if	Npc_KnowsInfo(hero, Info_Arenamaster_NICEFIGHT)
	{
//		AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_04"); //Fordere einen der anderen Arenakämpfer heraus und komme dann zu mir zurück.
		AI_Output			(self, hero, "MIL_122_ASKAGAIN_12_04"); //Vyzvi jednoho z ostatních bojovníků a potom se ke mně vrať.
		Arenamaster_Accepted = TRUE;
//		B_LogEntry			(CH1_Arena,	"Der Arenameister hat mich nun doch noch als Gladiator angenommen. Ich soll einen der anderen Kämpfer herausfordern und dann wieder mit ihm sprechen!");
		B_LogEntry			(CH1_Arena,	"Mistr arény mě přijal jako gladiátora. Mám vyzvat jednoho bojovníka k souboji a pak si s mistrem znovu promluvit.");

		AI_StopProcessInfos	(self);
	};
	
	BF_Arenamaster_Askagain = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info BANNED
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_BANNED	(C_INFO)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= Info_Arenamaster_BANNED_Condition;
	information		= Info_Arenamaster_BANNED_Info;
	important		= TRUE;
	permanent		= TRUE;
};

func int	Info_Arenamaster_BANNED_Condition()
{
	if	Arena_PlayerBanned
	&&	C_NpcIsInvincible(hero)
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_BANNED_Info()
{
	if	Arena_PlayerKilled
	{
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_01"); //DU	hast in	der	Arena getötet!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_01"); //TY jsi v aréně vraždil!
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_02"); //NIEMAND tötet in der Arena, das ist Regel Nummer 1!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_02"); //NIKDO nesmí v aréně zabít, to je proti pravidlu číslo 1!
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_03"); //Selbst	Typen wie Brutus kapieren das!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_03"); //Dokonce i chlapi jako Brutus to chápou'
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_04"); //Und jetzt verschwinde!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_04"); //A teď vypadni!
	};

	if	Arena_PlayerUsedBow
	{
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_05"); //Du	kanntest die Regeln. Keine Fernkampfwaffen in der Arena!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_05"); //Znal jsi pravidla. Žádné zbraně na dálku!
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_06"); //Du	bist kein Gladiator	mehr! Geh jetzt!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_06"); //Už nejsi gladiátor! Jdi už!
	};

	if	Arena_PlayerUsedMagic
	{
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_07"); //Du	kanntest die Regeln! Keine Magie in	der	Arena!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_07"); //Pravidla jsi znal! Žádná kouzla v aréně!
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_08"); //Ich werde dich	für	keinen Kampf mehr aufstellen.
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_08"); //Už tě do žádného souboje nenasadím.
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_09"); //Du	hast deine Chance vertan!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_09"); //Promarnil jsi svojí šanci!
	};

	if	Arena_PlayerStoleWeapon
	{
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_10"); //Du	hast Regel Nummer 3	verletzt: Finger weg von der Waffe des anderen!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_10"); //Porušil jsi pravidlo číslo 3: Prsty pryč od protivníkovy zbraně!
//		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_11"); //Ich will dich hier	nicht mehr sehen!
		AI_Output			(self, hero, "Info_Arenamaster_BANNED_12_11"); //Už tě tu nechci vidět!
	};

	if	Arena_PlayerShirked
	{
//		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_12"); //(laut) Du hast dich	wie	eine feige Ratte vor deinem	letzen Kampf gedrückt!
		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_12"); //(nahlas) Schoval ses před posledním soubojem jako zbabělá krysa!
//		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_13"); //(lauter) Du	hast mich vor dem gesamten Lager blamiert!!!
		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_13"); //(hlasitěji) Ztrapnil jsi mě před celým táborem!
//		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_14"); //(brüllt) GEH MIR AUS DEN AUGEN !!!!
		AI_Output			(self, hero,"Info_Arenamaster_BANNED_12_14"); //(řve) JDI MI Z OČÍ!
	};

//	Info_AddChoice		(Info_Arenamaster_BANNED, "Mir doch egal!", Info_Arenamaster_BANNED_NO );
	Info_AddChoice		(Info_Arenamaster_BANNED, "Je mi to jedno!", Info_Arenamaster_BANNED_NO );

	if	(Npc_HasItems(hero, ItMi_Silver) >= ARENAMASTER_CALM_SILVER)
	{
//		Info_AddChoice	(Info_Arenamaster_BANNED, "Tut mir leid, das wird nicht wiedervorkommen (500 Silber anbieten).", Info_Arenamaster_BANNED_SORRY );
		Info_AddChoice	(Info_Arenamaster_BANNED, "Mrzí mě to, už se to nikdy nestane. (nabídnout 500 stříbrných)", Info_Arenamaster_BANNED_SORRY );
	};
};
func void Info_Arenamaster_BANNED_SORRY ()
{
	Info_ClearChoices	(Info_Arenamaster_BANNED);
//	AI_Output			(hero, self, "Info_Arenamaster_BANNED_SORRY_15_01"); //Tut mir leid, das wird nicht wiedervorkommen.
	AI_Output			(hero, self, "Info_Arenamaster_BANNED_SORRY_15_01"); //Mrzí mě to, už se to nikdy nestane.
	B_GiveInvItems		(hero, self, ItMi_Silver, ARENAMASTER_CALM_SILVER);
//	AI_Output			(self, hero, "Info_Arenamaster_BANNED_SORRY_12_02"); //Das will ich hoffen. Solche Fehltritte gefährden den Ruf der ganzen Arena!
	AI_Output			(self, hero, "Info_Arenamaster_BANNED_SORRY_12_02"); //To doufám! Takové přešlapy ohrožují pověst celé arény!
//	AI_Output			(self, hero, "Info_Arenamaster_BANNED_SORRY_12_03"); //Also denk beim nächsten Mal besser VORHER nach.
	AI_Output			(self, hero, "Info_Arenamaster_BANNED_SORRY_12_03"); //Dobře si to tedy rozmysli PŘED tím, než zase uděláš nějakou koninu!
	Arena_PlayerBanned	= FALSE;
	B_SetAttitude		(self, Arenamaster_OldAttitude);
	AI_StopProcessInfos	(self);
};

func void Info_Arenamaster_BANNED_NO ()
{
	Info_ClearChoices	(Info_Arenamaster_BANNED);
//	AI_Output			(hero, self, "Info_Arenamaster_BANNED_NO_15_01"); //Mir doch egal!
	AI_Output			(hero, self, "Info_Arenamaster_BANNED_NO_15_01"); //Je mi to jedno!
	AI_StopProcessInfos	(self);
};




///////////////////////////////////////////////////////////////////////
//	Info NEXTFIGHT
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_NEXTFIGHT (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	nr				= 20;
	condition		= Info_Arenamaster_NEXTFIGHT_Condition;
	information		= Info_Arenamaster_NEXTFIGHT_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Wann	ist	der	nächste	Arenakampf?";
	description		= "Kdy se koná další souboj v aréně?";
};

func int	Info_Arenamaster_NEXTFIGHT_Condition()
{
	if	(!(Npc_IsInRoutine (self, ZS_ArenaMasterNpc)	&&	(Npc_GetDistToWP(self,ARENA_WP_THRONE) <	300)))
	||	Npc_KnowsInfo(hero,	Info_Arenamaster_NICEFIGHT)
	{
		return	TRUE;
	};
};

func void	Info_Arenamaster_NEXTFIGHT_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_NEXTFIGHT_15_01"); //Wann	ist	der	nächste	Arenakampf?
	AI_Output				(hero, self,"Info_Arenamaster_NEXTFIGHT_15_01"); //Kdy se koná další souboj v aréně?

	if		Npc_IsInRoutine(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_02"); //(erbost)	Jetzt nicht, du	Idiot!!! Und in	meiner Hütte schon gleich garnicht!!!
		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_02"); //(rozzlobeně) Rozhodně ne teď ty blbe! A rozhodně ne v mojí chatrči!
//		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_03"); //(etwas ruhiger) Komm	morgen zu meinem Stand!
		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_03"); //(poněkud tišeji) Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_04"); //Heute abend.	Du hast	noch reichlich Zeit.
		AI_Output			(self, hero,"Info_Arenamaster_NEXTFIGHT_12_04"); //Dnes večer. Stále máš spoustu času.

		if	Arena_PlayerFight
		{
//			AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_05"); //...und vergiss nicht: Du	kämpfst	heute abend	SELBST!!!
			AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_05"); //...a nezapomeň: SÁM dnes bojuješ v aréně!
		};
	}

	else if	Npc_IsInRoutine(self,ZS_ArenaMasterNpcSend)
	||		Npc_IsInRoutine(self,ZS_ArenaMasterNpc)
	{
		if	(Npc_GetDistToWP(self,ARENA_WP_THRONE) >	300)
		{
			if	Arena_PlayerFight
			{
//				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_06"); //Du solltst längst in	deiner Arenakammer sitzen und dich auf den Kampf vorbereiten!
				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_06"); //Už bys měl sedět ve své komoře a připravovat se na boj!
				AI_StopProcessInfos(self);
			}
			else
			{
				if	Npc_IsInRoutine	(self,ZS_ArenaMasterNpcSend)
				{
//					AI_Output	(self, hero, "Info_Arenamaster_NEXTFIGHT_12_07"); //Das	Vorprogramm	läuft schon	und	die	Gladiatoren	haben sich bereits in ihre Kammern zurückgezogen. Der Kampf	beginnt	bald.
					AI_Output	(self, hero, "Info_Arenamaster_NEXTFIGHT_12_07"); //Předprogram už probíhá, gladiátoři se připravují ve svých komorách. Souboj brzy začne.

				}
				else
				{
//					AI_Output	(self, hero,"Info_Arenamaster_NEXTFIGHT_12_08"); //Sie zu, dass	du einen guten Platz auf der Tribüne bekommst.
					AI_Output	(self, hero,"Info_Arenamaster_NEXTFIGHT_12_08"); //Zajisti si dobré místo na tribuně.
//					AI_Output	(self, hero,"Info_Arenamaster_NEXTFIGHT_12_09"); //Der Kampf fängt gleich an!
					AI_Output	(self, hero,"Info_Arenamaster_NEXTFIGHT_12_09"); //Souboj zrovna začíná!
				};
			};
		}
		else
		{
			if	Arena_PlayerFight
			{
//				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_10"); //Was tust	du hier	oben! Dein Platz ist unten in der Arena! Die Leute warten darauf das es	losgehen kann!!!
				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_10"); //Co tady nahoře děláš! Tvoje místo je dole v aréně! Lidé čekají na začátek souboje!
			}
			else
			{
//				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_11"); //Schau mal in	die	Arena runter! Was siehst du	da...?
				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_11"); //Podívej se dolů do arény! Co tam vidíš..?
//				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_12"); //(belehrend)...einen Kampf!
				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_12"); //(poučně)...boj!
//				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_13"); //Und jetzt nerv mich nicht länger!
				AI_Output		(self, hero,"Info_Arenamaster_NEXTFIGHT_12_13"); //No tak mě neruš!
			};
			AI_StopProcessInfos	(self);
		};
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M, 23, 59)
	{
//		AI_Output				(self, hero,"Info_Arenamaster_NEXTFIGHT_12_14"); //Du kommst zu	spät, der Kampf	ist	bereits	vorrüber.
		AI_Output				(self, hero,"Info_Arenamaster_NEXTFIGHT_12_14"); //Jdeš pozdě, je po souboji.
//		AI_Output				(self, hero,"Info_Arenamaster_NEXTFIGHT_12_15"); //Komm	morgen wieder!
		AI_Output				(self, hero,"Info_Arenamaster_NEXTFIGHT_12_15"); //Přijď zase zítra!
	};
};


///////////////////////////////////////////////////////////////////////
//	Info AGAIN
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_AGAIN (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_AGAIN_Condition;
	information		= Info_Arenamaster_AGAIN_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich habe	mir	den	gestrigen Arenakampf angesehen!";
	description		= "Včera jsem sledoval souboj v aréně!";
};

func int	Info_Arenamaster_AGAIN_Condition()
{
	if	(Arenamaster_FirstDay <	B_GetDay())
	&&	!Arenamaster_Failed
	&&	!Wld_IsTime(ARENAPRE_H,	ARENAPRE_M,	ARENAEND_H,	ARENAEND_M)
	&&	!Arena_PlayerHasCome
	&&	!Arena_PlayerFight
	&&	!Arena_FightSelected
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_AGAIN_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_AGAIN_15_01"); //Ich habe	mir	den	gestrigen Arenakampf angesehen!
	AI_Output				(hero, self,"Info_Arenamaster_AGAIN_15_01"); //Včera jsem sledoval souboj v aréně!

	if	Npc_IsInRoutine(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst	du mir mitten in der Nacht sagen? Komm morgen an meinem	Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	};

	Arenamaster_FirstDay = B_GetDay();

	if		(Arena_NpcComboLast	== AC_GRIM_GOLIATH)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_03"); //Grim	und	Goliath	sind noch sehr unerfahren. Aber	vielleicht machen sie sich ja noch.
		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_03"); //Grim a Goliáš jsou stále velmi nezkušení. Ale možná se ještě vypracují.
	}
	else if	(Arena_NpcComboLast	== AC_GOLIATH_BRUTUS)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_04"); //Brutus ist Gewalt pur! Goliath ist zwar stark wie ein Bär, hat aber trotzdem	oft	das	Nachsehen.
		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_04"); //Brutus je čisté násilí! Goliáš je silný jako medvěd, ale přesto toho moc nepředvedl.
	}
	else if	(Arena_NpcComboLast	== AC_BRUTUS_MALGAR)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_05"); //Brutus gegen	Malgar!	Immer spannend!	Stumpfe	Gewalt gegen tödliche Finesse! Dass	die	Finesse	meistens siegt bringt mich immer wieder	zum	Jubeln!
		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_05"); //Brutus proti Malgarovi! To je vždy vzrušující souboj! Tupá agrese proti mistrovství meče! To, že umění s mečem často vyhrává je skutečně fascinující!
	}
	else if	(Arena_NpcComboLast	== AC_MALGAR_THORA)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_06"); //Dann	hast du	das	echte Finale erlebt. Thora und Malgar sind die besten Kämpfer in der Arena.
		AI_Output			(self, hero,"Info_Arenamaster_AGAIN_12_06"); //Pak jsi zažil skutečné finále. Thora a Malgar jsou nejlepší bojovníci zdejší arény.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RANKING
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_RANKING		(C_INFO)
{
	npc		 =	MIL_122_Arenamaster;
	nr				= 30;
	condition	 =	MIL_122_Arenamaster_RANKING_Condition;
	information	 =	MIL_122_Arenamaster_RANKING_Info;
	important	 =	FALSE;
	permanent	 =	TRUE;

//	description	 =	"Wie sieht die Rangliste aus?";
	description	 =	"Jak vypadá žebříček?";
};

func int MIL_122_Arenamaster_RANKING_Condition ()
{
	if	Npc_IsInRoutine	(self, ZS_ArenaMasterBooth)
	&&	Arenamaster_Accepted
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_RANKING_Info ()
{
//	AI_Output			(hero, self, "MIL_122_RANKING_15_01"); //Wie sieht die Rangliste aus?
	AI_Output			(hero, self, "MIL_122_RANKING_15_01"); //Jak vypadá žebříček?

	B_Arena_PrintRankingList();
};



///////////////////////////////////////////////////////////////////////
//	Info GLADIATOR
///////////////////////////////////////////////////////////////////////
instance	MIL_122_Arenamaster_GLADIATOR (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	nr				= 30;
	condition		= MIL_122_Arenamaster_GLADIATOR_Condition;
	information		= MIL_122_Arenamaster_GLADIATOR_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Wie bewertest du...";
	description		= "Jak hodnotíš...";
};

func int	MIL_122_Arenamaster_GLADIATOR_Condition()
{
	if	Npc_IsInRoutine	(self, ZS_ArenaMasterBooth)
	&&	Arenamaster_Accepted
	{
		return TRUE;
	};
};

func void	MIL_122_Arenamaster_GLADIATOR_Info()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Thora?",	MIL_122_Arenamaster_GLADIATOR_THORA	);
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Thoru?",	MIL_122_Arenamaster_GLADIATOR_THORA	);
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Malgar?",	MIL_122_Arenamaster_GLADIATOR_MALGAR );
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Malgara?",	MIL_122_Arenamaster_GLADIATOR_MALGAR );
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Brutus?",	MIL_122_Arenamaster_GLADIATOR_BRUTUS );
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Bruta?",	MIL_122_Arenamaster_GLADIATOR_BRUTUS );
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Goliath?",	MIL_122_Arenamaster_GLADIATOR_GOLIATH );
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Goliáše?",	MIL_122_Arenamaster_GLADIATOR_GOLIATH );
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Grim?",		MIL_122_Arenamaster_GLADIATOR_GRIM );
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Grima?",	MIL_122_Arenamaster_GLADIATOR_GRIM );
//	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...Mich?",		MIL_122_Arenamaster_GLADIATOR_ME );
	Info_AddChoice		(MIL_122_Arenamaster_GLADIATOR,	"...mě?",		MIL_122_Arenamaster_GLADIATOR_ME );
};

func void MIL_122_Arenamaster_GLADIATOR_ME ()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_ME_15_01"); //Wie bewertest du mich?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_ME_15_01"); //Jak mě hodnotíš?

	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_02");	//Du liegst	auf	dem	letzten	Platz, bist	aber auch erst kürzlich	dazugestossen.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_02");	//Jsi na posledním místě, ale začal jsi teprve nedávno.
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_03");	//Du wirst dich	schon noch hochkämpfen,	da bin ich mir sicher.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_03");	//Jsem si jistý, že se probiješ výš!
	};
	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_04");	//Du hast dich auf den fünften Platz hochgearbeitet. Nicht schlecht!
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_04");	//Jsi na pátém místě. To není vůbec špatné!
	};
	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_05");	//Du belegst jetzt schon den vierten Platz.	Mach weiter	so und du wirst	noch ganz an die Spitze	kommen.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_05");	//Jsi na čtvrtém místě. Pokračuj stejným způsobem a za chvilku budeš na samém vrcholu.
	};
	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_06");	//Du liegst	heute schon	auf	dem	dritten	Platz. Nur noch	zwei Gladiatoren trennen dich vom Titel	des	Champions.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_06");	//Už jsi na třetím místě v žebříčku! V cestě k titulu šampiona ti stojí už jen dva gladiátoři!
	};
	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_07");	//Du hast es geschafft,	dich auf den zweiten Platz hochzuarbeiten.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_07");	//Dokázal ses vypracovat na druhé místo!
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_08");	//Noch nie habe	ich	einen Gladiator	gesehen, der sich so schnell nach oben gearbeitet hat. Der Titel des Champion ist nun zum Greifen nahe.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_08");	//Nikdy jsem neviděl, že by se gladiátor vypracoval takhle rychle nahoru! Titul šampiona arény máš už na dosah.
	};
	if	(B_Arena_GetGladiatorRanking(PC_Hero		) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_09");	//Du hast es geschafft!	Du bist	der	neue Arena-Champion!
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_09");	//Dokázal jsi to! Jsi šampionem arény!
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_10");	//Niemand der anderen Gladiatoren kann deinen Waffenkünsten	paroli bieten. Ich verneige	mich vor dir.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_ME_12_10");	//Žádný z gladiátorů se nemůže měřit s tvým šermířským uměním! Klaním se ti.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_GRIM ()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_GRIM_15_01"); //Wie bewertest du Grim?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_GRIM_15_01"); //Jak hodnotíš Grima?

	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_02"); //Grim war noch nie gut. Jetzt ist er	sogar auf den letzten Platz	abgerutscht. Ein hoffnungsloser	Fall.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_02"); //Grim nebyl nikdy dobrý. Nyní dokonce sklouzl na poslední místo. Beznadějný případ.
	};
	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_03"); //Grim behauptet sich	auf	seinem fünften Platz. Er war noch nie gut, aber	zumindest wird er auch nicht schlechter.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_03"); //Grim si drží páté místo. Nikdy nebyl dobrý, ale alespoň se nezhoršuje.
	};
	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_04"); //Grim hat entgegen aller	Erwartungen	auf	den	4 Platz	verbessert.	Es stecken doch	noch Überraschungen	in ihm.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_04"); //I přes všechna 'očekávání' se Grim vypracoval na čtvrté místo. Jsem velice překvapen.
	};
	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_05"); //Grim überrascht	mich immer mehr. Einst das Schlußlicht,	liegt er heute auf dem dritten Platz.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_05"); //Grim mě nepřestává překvapovat. Dříve byl úplně dole a nyní je na třetím místě!
	};
	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_06"); //Grim überrascht	das	ganze Lager. Niemand versteht, wie dieser unbegabte	Kämpfer	sich auf Platz 2 hocharbeiten konnte.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_06"); //Grim překvapil celý tábor. Nikdo nechápe, jak se tento netalentovaný bojovník dokázal probít až na druhé místo.
	};
	if	(B_Arena_GetGladiatorRanking(MIN_306_Grim	) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_07"); //Grim's sonderbare Wendung ist schon	fast verdächtig. Dieser	nichtsnutzige Gladiator	der	früher keinen Kampf	gewonnen hat ist heute Champion. Wenn ich herausfinde, wer da nachgeholfen hat,	dann gibt es saures!
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GRIM_12_07"); //Grimův postup je docela podezřelý. Tenhle neschopný gladiátor, který v minulosti nedokázal vyhrát jediný souboj je nyní šampionem arény. Až zjistím, kdo mu pomohl, bude ve velkým průšvihu!
	};
};

func void MIL_122_Arenamaster_GLADIATOR_GOLIATH	()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_GOLIATH_15_01"); //Wie bewertest du Goliath?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_GOLIATH_15_01"); //Jak hodnotíš Goliáše?

	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_02"); //Goliath hat nachgelassen. Früher	war	er besser als Grim.	Heute ist er das Schlußlicht.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_02"); //Goliáš nějak polevil. Dříve byl lepší než Grim, dnes je na posledním příčce.
	};
	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_03"); //Goliath liegt auf dem fünften Platz.	Früher war er besser, aber am Ende ist er halt doch	nur	ein	einfacher Schmiedegehilfe
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_03"); //Goliáš je na pátém místě. Býval lepší, ale je koneckonců pouze kovářský pomocník.
	};
	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_04"); //Goliath hat seinen vierten Platz	gehalten. Ich glaube allerdings	auch nicht,	dass er	sich verbessern	kann.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_04"); //Goliáš si udržel své čtvrté místo. Nemyslím si však, že se může víc zlepšit.
	};
	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_05"); //Goliath hat sich	doch tatsächlich auf den dritten Platz vorgeschoben. Das hätte wirklich	niemand	gedacht.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_05"); //Goliášovi se skutečně podařilo dostat se na třetí místo! To bych si nikdy nepomyslel.
	};
	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_06"); //Goliath stellt Rätsel auf. Einst	ein	Schmiedegehilfe	auf	dem	vorletzten Platz, heute	schon der Vizechampion.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_06"); //Goliášův postup je záhadný. Jednou kovářův pomocník na předposledním místě a dnes je to gladiátor na druhém místě.
	};
	if	(B_Arena_GetGladiatorRanking(WRK_216_Goliath) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_07"); //Goliath hat das unmögliche wahrgemacht. Allein mit seinem Schmiedehammer	hat	er sich	selbst zum Championtitel verholfen.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_GOLIATH_12_07"); //Goliášovi se podařilo nemožné. Pomohl si k titulu šampiona arény kovářským kladivem.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_BRUTUS ()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_BRUTUS_15_01"); //Wie bewertest du Brutus?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_BRUTUS_15_01"); //Jak hodnotíš Bruta?

	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_02");	//Brutus war immer ein recht guter Kämpfer.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_02");	//Brutus byl vždycky výborný bojovník.
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_03");	//Das er heute auf dem letzten Platz liegt,	versteht keiner.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_03");	//Nikdo nechápe, že je dnes na posledním místě.
	};
	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_04");	//Brutus hat nachgelassen. Früher drittbester ist er heute auf Platz 5.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_04");	//Brutus nějak polevil. Dříve to byl třetí nejlepší bojovník a dnes je na pátém místě.
	};
	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_05");	//Brutus liegt heute nur noch auf Platz	4. Offensichtlich ist rohe Gewalt doch nicht alles!
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_05");	//Brutus je na čtvrtém místě. Je zřejmé, že hrubá síla není všechno!
	};
	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_06");	//Brutus ist und bleibt	die	Nummer drei. Wer in	die	Spitzengruppe aufsteigen will, muß an ihm vorbei.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_06");	//Brutus je na třetím místě a tam také zůstane. Kdo se chce dostat do nejlepší skupiny bojovníků, musí Bruta porazit.
	};
	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_07");	//Brutus hat sich doch tatsächlich auf den zweiten Platz hocharbeiten können. Vielleicht steckt	in ihm doch	mehr als rohe Gewalt.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_07");	//Brutus se skutečno dokázal vypracovat na druhé místo. Možná je v něm něco víc, než hrubá síla.
	};
	if	(B_Arena_GetGladiatorRanking(MIL_121_Brutus	) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_08");	//Brutus rohe Kampfgewalt hat es geschafft,	selbst so elegante Kämpfer wie Thora und Malgar	in den Schatten	zu stellen.	Eine neue Ära im Arenakampf	bricht an.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_BRUTUS_12_08");	//Brutus to se svou hrubou silou dokázal! Dokázal porazit i takové elegantní bojovníky jako je Thora a Malgar. Začíná nová éra soubojů v aréně.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_MALGAR ()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_MALGAR_15_01"); //Wie bewertest du Malgar?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_MALGAR_15_01"); //Jak hodnotíš Malgara?

	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_02");	//Malgar ist am	Ende. Einst	der	zweitbeste,	heute ein Wrack	auf	dem	letzten	Platz der Rangliste.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_02");	//Malgar je úplně na konci. Dříve býval druhým nejlepším bojovníkem, dnes je to troska ve spodu žebříčku.
	};
	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_03");	//Malgar ist stark nachgelassen. Er	ist	heute auf Platz	5.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_03");	//Malgar se silně zhoršil. Je na pátém místě.
	};
	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_04");	//Malgar hat ganz schön	an Boden verloren. Früher zweitbester, heute nur noch auf Platz	4.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_04");	//Malgar ztratil půdu pod nohama. V minulosti druhý nejlepší bojovník, dnes je na čtvrtém místě.
	};
	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_05");	//Malgar hat an	Boden verloren.	Er muss	sich heute mit den dritten Platz zufrieden geben.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_05");	//Malgar ztratil půdu pod nohama. Dnes se musí spokojit se třetím místem.
	};
	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_06");	//Malgar hält souverän den zweiten Platz. Niemand kämpft gegen den Champion, ohne ihn zu besiegen.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_06");	//Malgar sebevědomě drží druhé místo. Nikdo nebojuje se šampionem, bez toho, aniž by ho porazil.
	};
	if	(B_Arena_GetGladiatorRanking(DMH_1302_Malgar) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_07");	//Malgar war schon immer ein fantastischer Kämfper,	heute liegt	er sogar auf Platz 1 und ist damit der neue	Champion.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_MALGAR_12_07");	//Malgar byl vždy skvělý bojovník, dnes je dokonce na prvním místě a je tedy novým šampionem.
	};
};

func void MIL_122_Arenamaster_GLADIATOR_THORA ()
{
	Info_ClearChoices	(MIL_122_Arenamaster_GLADIATOR);
//	AI_Output			(hero, self, "MIL_122_GLADIATOR_THORA_15_01"); //Wie bewertest du Thora?
	AI_Output			(hero, self, "MIL_122_GLADIATOR_THORA_15_01"); //Jak hodnotíš Thoru?

	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 6)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_02"); //Thora ist hoffnungslos	abgesackt. Einst der Champion, ist sie heute kein Silberstück mehr wert.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_02"); //Thora se beznadějně propadla. Dříve byla šampionem arény, dnes si na ní nikdo nevsadí ani půlku stříbrného.
	};
	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 5)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_03"); //Thora ist am Ende.	Wie	konnte der einstige	Champion auf den vorletzten	Platz sinken?
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_03"); //Thora je v koncích. Jak se vůbec může šampion arény propadnout na předposlední místo?
	};
	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 4)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_04"); //Thora ist gewaltig	abgesackt. Einst der Champion, heute nur noch Mittelmass auf Platz 4.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_04"); //Thora se v žebříčku propadla. Jednou šampionem arény, dnes je pouze průměrným bojovníkem na čtvrtém místě.
	};
	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 3)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_05"); //Thora ist schon lange nicht mehr der Champion.	Heute liegt	sie	nur	noch auf Platz 3.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_05"); //Thora už není dlouho šampionem arény. Dnes stojí na třetím místě.
	};
	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 2)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_06"); //Thora ist nicht mehr der Champion.	Wahrscheinlich sind	ihre grössten Tage als Gladiator gezählt.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_06"); //hora už není šampionem arény. Její dny, jako gladiátor, jsou sečteny.
	};
	if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora	) == 1)
	{
//		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_07"); //Thora ist und bleibt der Champion.	Ihre exotischen	Waffenkünste mit dem Kampfstab suchen ihresgleichen.
		AI_Output		(self, hero, "MIL_122_GLADIATOR_THORA_12_07"); //Thora je a zůstává šampionem arény. Její dovednost s exotickými zbraněmi nemají u nás v aréně obdoby.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info RULES
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_RULES		(C_INFO)
{
	npc			 =	MIL_122_Arenamaster;
	nr			 =	20;
	condition	 =	MIL_122_Arenamaster_RULES_Condition;
	information	 =	MIL_122_Arenamaster_RULES_Info;
	permanent	 =	 FALSE;

//	description	 =	"Welche	Regeln gibt	es in der Arena?";
	description	 =	"Jaká jsou pravidla arény?";
};

func int MIL_122_Arenamaster_RULES_Condition ()
{
	if	Npc_IsInRoutine	(self, ZS_ArenaMasterBooth)
	&&	Arenamaster_Accepted
	{
		return TRUE;
	};
};

func int MIL_122_Arenamaster_RULES_Info	()
{
//	AI_Output	(hero, self, "MIL_122_RULES_Info_15_01"); //Welche Regeln gibt es in der Arena?
	AI_Output	(hero, self, "MIL_122_RULES_Info_15_01"); //Jaká jsou pravidla arény?
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_02"); //Regel Nummer 1 ...
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_02"); //Pravidlo číslo jedna...
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_03"); //KEIN Töten in der Arena!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_03"); //V aréně se nesmí zabíjet!
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_04"); //Umhauen	ja,	Töten nein!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_04"); //Srazit na zem ano, zabít ne!
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_05"); //Regel Nummer 2 ...
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_05"); //Pravidlo číslo dvě...
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_06"); //Weder Bögen, noch Armbrüste	noch Magie in der Arena!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_06"); //Luky, kuše a magie do arény nepatří!
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_07"); //Es wird	nur	mit	Nahkampfwaffen gekämpft!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_07"); //Soupeří se pouze se zbraněmi na blízko!
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_08"); //Regel Nummer 3 ...
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_08"); //Pravidlo číslo tři...
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_09"); //Jeder behält seine eigenen Waffen! Solltest	du deinen Gegner umhauen, ist seine	Waffe tabu für dich, ist das klar!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_09"); //Každý se drží své vlastní zbraně! Pokud protivníka srazíš k zemi, je jeho zbraň tabu, jasný?
//	AI_Output	(hero, self, "MIL_122_RULES_Info_15_10"); //Was	passiert, wenn es die Gladiatoren mit den Regeln nicht so genau	nehmen?
	AI_Output	(hero, self, "MIL_122_RULES_Info_15_10"); //Co se stane, když nebudou gladiátoři dodržovat pravidla?
//	AI_Output	(self, hero, "MIL_122_RULES_Info_12_11"); //Regel Nummer 4 : Wer die Regeln	verletzt, verliert den Kampf und das Preisgeld!
	AI_Output	(self, hero, "MIL_122_RULES_Info_12_11"); //Pravidlo číslo 4... Pokud porušíš pravidla arény, prohraješ souboj a nedostaneš peníze.

//	B_LogEntry	(CH1_Arena,	"Es	gibt strenge Regeln	für	den	Arenakampf.	Regel 1: Kein Töten	in der Arena,	Regel 2: Weder Bögen, noch Armbrüste in	der	Arena,	 Regel 3: Finger weg von der Waffe des anderen Gladiators,	 Regel 4: Wer die Regeln verletzt verliert den Kampf und das Preisgeld!");
	B_LogEntry	(CH1_Arena,	"Aréna má přísná pravidla.\nPravidlo 1:\nV aréně se nesmí zabíjet.\nPravidlo 2:\nLuky, kuše a magie jsou zakázané.\nPravidlo 3:\nDrž se dál od zbraně tvého protivníka.\nPravidlo 4:\nKdokoliv poruší pravidla prohraje souboj a nedostane zaplaceno!");
};
///////////////////////////////////////////////////////////////////////
//	Info FLOWCHART
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_FLOWCHART		(C_INFO)
{
	npc			= MIL_122_Arenamaster;
	nr			= 30;
	condition	= MIL_122_Arenamaster_FLOWCHART_Condition;
	information	= MIL_122_Arenamaster_FLOWCHART_Info;
	permanent	= FALSE;
//	description	= "Wie läuft so	ein	Kampf ab?";
	description	= "Jak takový souboj probíhá?";
};

func int MIL_122_Arenamaster_FLOWCHART_Condition ()
{
	if	Npc_IsInRoutine	(self, ZS_ArenaMasterBooth)
	&&	Arenamaster_Accepted
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_FLOWCHART_Info ()
{
//	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_01"); //Wie	läuft so ein Kampf ab?
	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_01"); //Jak takový souboj probíhá?
//	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_02"); //Es wird	solange	gekämpft, bis einer	zu Boden geht!
	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_02"); //Boj probíhá do té doby, než jeden z bojovníků neleží na zemi!
//	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_03"); //Wer	den	anderen	umhaut,	gewinnt	einen Punkt.
	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_03"); //Ten, kdo protivníka srazí, získá jeden bod.
//	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_04"); //Es wird	mindestens gekämpft, bis einer 5 Punkte hat, manchmal aber	auch länger.
	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_04"); //Bojuje se do té doby, než někdo nasbírá 5 bodů, ale někdy i déle.
//	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_05"); //Wovon hängt	das	ab?
	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_05"); //Na čem to záleží?
//	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_06"); //Davon, ob der Kampf	mir	gefällt	oder nicht.
	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_06"); //Na tom, jestli se mi ten souboj líbí.
//	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_07"); //Verstehe!
	AI_Output	(hero, self, "MIL_122_FLOWCHART_Info_15_07"); //Rozumím!
//	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_08"); //Werden bis zum Ende	der	Kampfzeit keine	5 Punkte erreicht,	verlieren beide	und	ich	behalte	alle Preisgelder.
	AI_Output	(self, hero, "MIL_122_FLOWCHART_Info_12_08"); //Pokud do konce souboje nedosáhne ani jeden pěti bodů, oba gladiátoři prohrávají a peníze si nechám já.

//	B_LogEntry	(CH1_Arena,	"Ein Kampf läuft folgendermassen ab: Es	wird solange gekämpft, bis einer der Gladiatoren zu	Boden geht und damit einen Punkt macht.	Wer	zuerst 5 Punkte hat, hat gewonnen.	Erreicht niemand 5 Punkte,	behält der Arenameister	beide Preisgelder und der Kampf	ist	unentschieden!");
	B_LogEntry	(CH1_Arena,	"Boj probíhá následovně:\nBojuje se do té doby, než jeden bojovník nespadne na zem a nezíská tak bod. Kdo získá první pět bodů, vyhrává. Pokud nikdo nedosáhne pěti bodů, mistr arény si nechá peníze a oba dva bojovníci prohráli.");
};

instance MIL_122_Arenamaster_PLAYERCHEATED		  (C_INFO)
{
	npc			=	MIL_122_Arenamaster;
	nr			=	1;
	condition	=	MIL_122_Arenamaster_PLAYERCHEATED_Condition;
	information	=	MIL_122_Arenamaster_PLAYERCHEATED_Info;
	important	=	TRUE;
	permanent	=	TRUE;
};

func int MIL_122_Arenamaster_PLAYERCHEATED_Condition ()
{
	if	(Arena_PlayerStoleWeapon || Arena_PlayerUsedMagic || Arena_PlayerUsedBow || Arena_PlayerKilled)
	&&	Arena_FightRunning
	&&	!Arena_PlayerBanned
	{
		return TRUE;
	};
};

func	void MIL_122_Arenamaster_PLAYERCHEATED_Info	()
{
	AI_StandUp			 (self);

	if	Arena_PlayerStoleWeapon
	{
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_09"); //DU HAST	REGEL NUMMER 3 VERLETZT.
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_09"); //PORUŠIL JSI PRAVIDLO ČÍSLO TŘI.
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_10"); //Finger weg,	von	den	Waffen der anderen Gladiatoren!
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_10"); //Od protivníkovy zbraně ruce pryč!
	};
	if	(Arena_PlayerUsedMagic || Arena_PlayerUsedBow)
	{
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_11"); //DU HAST	REGEL NUMMER 2 VERLETZT.
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_11"); //PORUŠIL JSI PRAVIDLO ČÍSLO DVA.
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_12"); //Weder Fernkampfwaffen noch Magie in	der	Arena!
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_12"); //Kromě zbraní na blízko se nesmí nic jiného používat!
	};
	if	Arena_PlayerKilled
	{
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_13"); //DU HAST	REGEL NUMMER 1 VERLETZT.
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_13"); //PORUŠIL JSI PRAVIDLO ČÍSLO JEDNA.
//		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_14"); //Kein Töten in der Arena!
		AI_Output		(self, hero, "MIL_122_PLAYERCHEATED_Info_12_14"); //Žádné zabíjení v aréně!
	};

//	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_15"); //HIERMIT	ERKLÄRE	ICH	DICH ZUM VERLIERER UND VERBANNE	DICH AUS DEN REIHEN	DER	GLADIATOREN.
	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_15"); //TÍMTO PROHLAŠUJI, ŽE JSI PROHRÁL A ZAKAZUJI TI SE ÚČASTNIT DALŠÍCH SOUBOJŮ. JSI VYHOŠTĚN Z ŘAD GLADIÁTORŮ.
//	AI_Output			(hero, self, "MIL_122_PLAYERCHEATED_Info_15_16"); //Aber...
	AI_Output			(hero, self, "MIL_122_PLAYERCHEATED_Info_15_16"); //Ale...
//	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_17"); //Nichts aber! Wer bescheisst	verliert.
	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_17"); //Žádné ale! Kdo to pokazí, prohrává!
//	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_18"); //REGEL NUMMER 4 !!!
	AI_Output			(self, hero, "MIL_122_PLAYERCHEATED_Info_12_18"); //PRAVIDLO ČÍSLO ČTYŘI!
	AI_StopProcessInfos	(self);

	Arenamaster_OldAttitude = Npc_GetPermAttitude(self, hero);
	B_SetAttitude		(self, ATT_ANGRY);

	Arena_PlayerBanned	= TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info GETPRIZE
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_GETPRIZE (C_INFO)
{
	npc			=	MIL_122_Arenamaster;
	nr			=	1;
	condition	=	MIL_122_Arenamaster_GETPRIZE_Condition;
	information	=	MIL_122_Arenamaster_GETPRIZE_Info;
	permanent	=	TRUE;

//	description	=	"Ich will mein Preisgeld abzuholen!";
	description	=	"Přišel jsem si vyzvednout svou výhru!";
};

func int MIL_122_Arenamaster_GETPRIZE_Condition	()
{
	if	Arena_PlayerHasWonToday
	&&	Arena_PlayerPrize
	//&&	Npc_IsInRoutine(self, ZS_ArenaMasterBooth)
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_GETPRIZE_Info	()
{
//	AI_Output		(hero, self, "MIL_122_GETPRIZE_Info_15_01"); //Ich will	mein Preisgeld abzuholen
	AI_Output		(hero, self, "MIL_122_GETPRIZE_Info_15_01"); //Přišel jsem si vyzvednout svou výhru!
//	AI_Output		(self, hero, "MIL_122_GETPRIZE_Info_12_02"); //Du hast gut gekämpft!
	AI_Output		(self, hero, "MIL_122_GETPRIZE_Info_12_02"); //Bojoval jsi dobře!
//	AI_Output		(self, hero, "MIL_122_GETPRIZE_Info_12_03"); //Hier	ist	dein Preisgeld.	Die	anderthalbfache	Summe, die du gesetzt hast.
	AI_Output		(self, hero, "MIL_122_GETPRIZE_Info_12_03"); //Tady je tvá cena. Jeden a půlkrát toho, co jsi před soubojem složil.

	B_GiveInvItems	(self, hero, ItMi_Silver,	((Arena_PlayerPrize*3)/2));

	if	!Arena_PrizeBefore
	{
//		AI_Output	(hero, self, "MIL_122_GETPRIZE_Info_15_04"); //Du bekommst doch	von	beiden Kämpfern	die	gleiche	Summe!
		AI_Output	(hero, self, "MIL_122_GETPRIZE_Info_15_04"); //Ty ale vybereš od obou bojovníků stejnou sumu ne?!
//		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_05"); //Richtig!
		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_05"); //Správně!
//		AI_Output	(hero, self, "MIL_122_GETPRIZE_Info_15_06"); //Warum bekomme ich dann nicht	den	doppelten Einsatz zurück?
		AI_Output	(hero, self, "MIL_122_GETPRIZE_Info_15_06"); //Jak to, že nevyhraju dvojnásobek toho, co jsem složil na začátku?
//		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_07"); //Was glaubst du eigentlich, warum	ich	mir	hier den ganzen	Tag	die	Füsse in den Bauch stehe?
		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_07"); //Co si myslíš, proč tu celý den stojím?
//		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_08"); //Die Hälfte der Preisgelder wandert in meine Tasche. Davon muss ich auch noch	den	ganzen Arenabetrieb	hier organisieren!
		AI_Output	(self, hero, "MIL_122_GETPRIZE_Info_12_08"); //Polovina vkladu gladiátora, který prohraje, je pro mě. Organizace soubojů také něco stojí!

		Arena_PrizeBefore =	TRUE;
	};

	Arena_PlayerHasWonToday	= FALSE;
	Arena_PlayerPrize =	0;

	if	!Arena_FirstVictory
	{
//		B_LogEntry		(CH1_Arena,	"Heute habe	ich	den	ersten Sieg	in einem Arenakampf	errungen. Um in	der	Rangliste weiter aufzusteigen brauche ich allerdings noch mehr Siege.");
		B_LogEntry		(CH1_Arena,	"Dnes jsem poprvé zvítězil v aréně. Musím více vyhrávat, abych se na žebříčku posunul výš.");
		Arena_FirstVictory = TRUE;
	};

	if	(B_Arena_GetGladiatorRanking(PC_Hero) == 4)
	&&	!Arena_FirstRank4
	{
//		B_LogEntry		(CH1_Arena,	"Mein heutiger Sieg	brachte	mich auf Platz 4 der Rangliste.	Bisher ist mir der Erfolg treu geblieben, hoffentlich ist das auch weiterhin der Fall.");
		B_LogEntry		(CH1_Arena,	"Mé dnešní vítězství mě dostalo na čtvrté místo v žebříčku. Dosud se mě drželo štěstí, doufejme, že to tak zůstane.");
		Arena_FirstRank4 = TRUE;
	};

	if	(B_Arena_GetGladiatorRanking(PC_Hero) == 3)
	&&	!Arena_FirstRank3
	{
//		B_LogEntry		(CH1_Arena,	"Der letzte	Kampf hat mich auf den dritten Platz der Rangliste vorgeschoben. Es	geht voran!");
		B_LogEntry		(CH1_Arena,	"Poslední souboj mě posunul na třetí místo v žebříčku. Hezky postupuji!");
		Arena_FirstRank3 = TRUE;
	};

	if	(B_Arena_GetGladiatorRanking(PC_Hero) == 2)
	&&	!Arena_FirstRank2
	{
//		B_LogEntry		(CH1_Arena,	"Ab	heute bin ich die Nummer 2 unter den Gladiatoren. Nur noch wenige Siege	trennen	mich vom Titel des Champions!");
		B_LogEntry		(CH1_Arena,	"Ode dneška jsem mezi gladiátory dvojka. Od titulu šampiona mě dělí jen několik vítězství.");
		Arena_FirstRank2 = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info STARTFIGHT
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_STARTFIGHT		(C_INFO)
{
	npc			=	MIL_122_Arenamaster;
	nr			=	20;
	condition	=	MIL_122_Arenamaster_STARTFIGHT_Condition;
	information	=	MIL_122_Arenamaster_STARTFIGHT_Info;
	important	=	TRUE;
	permanent	=	TRUE;
};

func int MIL_122_Arenamaster_STARTFIGHT_Condition ()
{
	if	Arenamaster_StartFight
	&&	Arena_GatesClosed
	&&	Npc_IsOnFP(self,"MASTER")
	&&	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_STARTFIGHT_Info ()
{
	AI_Wait					(self, 1);
	B_Arena_ProclaimStart	(self);
	AI_Wait					(self, 1);

	Arenamaster_StartFight = FALSE;

	AI_StopProcessInfos		(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FINISHFIGHT
///////////////////////////////////////////////////////////////////////
/*
instance MIL_122_Arenamaster_FINISHFIGHT		(C_INFO)
{
	npc			=	MIL_122_Arenamaster;
	nr			=	2;
	condition	=	MIL_122_Arenamaster_FINISHFIGHT_Condition;
	information	=	MIL_122_Arenamaster_FINISHFIGHT_Info;
	important	=	TRUE;
	permanent	=	TRUE;
};

func int MIL_122_Arenamaster_FINISHFIGHT_Condition ()
{
	if	Arenamaster_FinishFight
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_FINISHFIGHT_Info ()
{
	AI_Wait					(self, 1);
	B_Arena_ProclaimFinish	(self);
	AI_Wait					(self, 1);

	Arena_LastPCRanking		= Arena_PCRanking;
	Arena_PCRanking			= B_Arena_GetGladiatorRanking(PC_Hero);

	Arenamaster_FinishFight	= FALSE;

	AI_StopProcessInfos		(self);
};
*/


///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDGRIM
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_CHALLENGEDGRIM	(C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_CHALLENGEDGRIM_Condition;
	information		= Info_Arenamaster_CHALLENGEDGRIM_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich habe Grim herausgefordert!";
	description		= "Vyzval jsem Grima na souboj!";
};

func int	Info_Arenamaster_CHALLENGEDGRIM_Condition()
{
	if	Arenamaster_Accepted
	&&	Grim_Challenged
	&&	!Arena_PlayerFight
	&&	!Arena_PlayerHasWonToday
	&&	!Arena_NpcFight			//noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_CHALLENGEDGRIM_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDGRIM_15_01"); //Ich	habe Grim herausgefordert!
	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDGRIM_15_01"); //Vyzval jsem Grima na souboj!

	if		Npc_IsInRoutine(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	}
	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_12_03"); //OK,	wieviel	Preisgeld möchtest du setzen?
		AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_12_03"); //OK,	jako částku chceš vsadit?

		Info_ClearChoices	(Info_Arenamaster_CHALLENGEDGRIM);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGRIM,	B_BuildPrizeString(GRIM_PRIZE_3),	Info_Arenamaster_CHALLENGEDGRIM_PRIZE3);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGRIM,	B_BuildPrizeString(GRIM_PRIZE_2),	Info_Arenamaster_CHALLENGEDGRIM_PRIZE2);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGRIM,	B_BuildPrizeString(GRIM_PRIZE_1),	Info_Arenamaster_CHALLENGEDGRIM_PRIZE1);
	}

	else if	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Jdeš pozdě. Dnešní zápas už je domluven. Pokud chceš bojovat, přihlas se zítra ve správný čas.
	}

	else if	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Pokud sis toho nevšiml, souboj už probíhá! Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M,		0,0)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Dnešní souboj už skončil, přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	};
};


func void	Info_Arenamaster_CHALLENGEDGRIM_PRIZE (var int prize)
{
	Info_ClearChoices		(Info_Arenamaster_CHALLENGEDGRIM);

	if	(Npc_HasItems(hero,	ItMi_Silver) >=	prize)
	{
		B_GiveInvItems			(hero, self, ItMi_Silver, prize);

//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_01");	//Gut, du trittst also heute abend gegen Grim an!
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_01");	//Dobře, dnes večer se střetneš s Grimem!
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_02");	//Finde	dich bei Beginn	des	Vorprogramms in	der	linken Arenakammer ein.
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_02");	//Během předprogramu se dostav do levé komory v aréně.

		Arena_PlayerPrize		= prize;
		Arena_PlayerFight		= TRUE;
		Arena_PlayerHasCome		= FALSE;

		if	!Arena_FirstChallenge
		{
//			B_LogEntry		(CH1_Arena,	"Ich habe einen	der	Gladiatoren	zu meinem ersten Arenakampf	herausgefordert. Heute abend wird sich zeigen, wie gut ich wirklich	bin!");
			B_LogEntry		(CH1_Arena,	"Vyzval jsem jednoho gladiátora ke svému prvnímu souboji v aréně. Dnes se ukáže, jak dobrý vlastně jsem!");
			Arena_FirstChallenge = TRUE;
		};
	}
	else
	{
//		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_03"); //Besorge dir erst	mal	ausreichend	Silber.	Ohne Preisgeld gibt	es keinen Kampf!
		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDGRIM_PRIZE_12_03"); //Obstarej si nejprve potřebné stříbro. Bez vkladu se nebude souboj konat!
	};

};

func void	Info_Arenamaster_CHALLENGEDGRIM_PRIZE1 ()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_1);
};

func void	Info_Arenamaster_CHALLENGEDGRIM_PRIZE2 ()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_2);
};

func void	Info_Arenamaster_CHALLENGEDGRIM_PRIZE3 ()
{
	Info_Arenamaster_CHALLENGEDGRIM_PRIZE(GRIM_PRIZE_3);
};



///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDGOLIATH
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_CHALLENGEDGOLIATH (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_CHALLENGEDGOLIATH_Condition;
	information		= Info_Arenamaster_CHALLENGEDGOLIATH_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich habe	Goliath	herausgefordert!";
	description		= "Vyzval jsem k souboji Goliáše!";
};

func int	Info_Arenamaster_CHALLENGEDGOLIATH_Condition()
{
	if	Arenamaster_Accepted
	&&	Goliath_Challenged
	&&	!Arena_PlayerFight
	&&	!Arena_PlayerHasWonToday
	&&	!Arena_NpcFight			//noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_CHALLENGEDGOLIATH_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDGOLIATH_15_01"); //Ich habe	Goliath	herausgefordert!
	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDGOLIATH_15_01"); //Vyzval jsem k souboji Goliáše!

	if		Npc_IsInRoutine	(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	}
	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
//		AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_12_03"); //Wieviel Silber möchtest du als Preisgeld	setzen?
		AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_12_03"); //Kolik si chceš vsadit stříbra?

		Info_ClearChoices	(Info_Arenamaster_CHALLENGEDGOLIATH);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGOLIATH,	B_BuildPrizeString(GOLIATH_PRIZE_3),	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE3);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGOLIATH,	B_BuildPrizeString(GOLIATH_PRIZE_2),	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE2);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDGOLIATH,	B_BuildPrizeString(GOLIATH_PRIZE_1),	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE1);
	}

	else if	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Jdeš pozdě. Dnešní zápas už je domluven. Pokud chceš bojovat, přihlas se zítra ve správný čas.
	}

	else if	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Pokud sis toho nevšiml, souboj už probíhá! Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M,		0,0)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Dnešní souboj už skončil, přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	};
};


func void	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE (var int prize)
{
	Info_ClearChoices		(Info_Arenamaster_CHALLENGEDGOLIATH);

	if	(Npc_HasItems(hero,	ItMi_Silver) >=	prize)
	{
		B_GiveInvItems			(hero, self, ItMi_Silver, prize);

//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_01"); //Schön,	schön. Du und Goliath also!
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_01"); //Pěkné, pěkné. Takže ty a Goliáš!
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_02"); //Gehe bei Beginn des Vorprogramms in die rechte	Arenakammer	und	sei	bereit wenn	der	Kampf beginnt.
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_02"); //Během předprogramu se dostav do pravé komory v aréně.

		Arena_PlayerPrize		= prize;
		Arena_PlayerFight		= TRUE;
		Arena_PlayerHasCome		= FALSE;
	}
	else
	{
//		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_03");	//Kein Silber, kein	Kampf! Komm	wieder,	wenn du	genug davon	hast.
		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE_12_03");	//Žádné stříbro, žádný souboj! Přijď, až budeš mít dostatek peněz.
	};

};

func void	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE1 ()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_1);
};

func void	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE2 ()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_2);
};

func void	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE3 ()
{
	Info_Arenamaster_CHALLENGEDGOLIATH_PRIZE(GOLIATH_PRIZE_3);
};



///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDBRUTUS
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_CHALLENGEDBRUTUS (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_CHALLENGEDBRUTUS_Condition;
	information		= Info_Arenamaster_CHALLENGEDBRUTUS_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Brutus wird gegen mich antreten!";
	description		= "Brutus proti mně nastoupí!";
};

func int	Info_Arenamaster_CHALLENGEDBRUTUS_Condition()
{
	if	Arenamaster_Accepted
	&&	Brutus_Challenged
	&&	!Arena_PlayerFight
	&&	!Arena_PlayerHasWonToday
	&&	!Arena_NpcFight			//noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_CHALLENGEDBRUTUS_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDBRUTUS_15_01");	//Brutus wird gegen	mich antreten!
	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDBRUTUS_15_01");	//Brutus proti mně nastoupí!

	if		Npc_IsInRoutine	(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	}
	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
		if	!Brutus_ChallengedBefore
		{
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_03"); //Du bist in kurzer Zeit sehr gut geworden!
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_03"); //Neuvěřitelně jsi se zlepšil za tak krátký čas!
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_04"); //Brutus ist normalerweise	sehr wählerisch, wenn es um	neue Gladiatoren geht!
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_04"); //Brutus si většinou pečlivě vybírá s kým bude soupeřit.
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_05"); //Aber	sei	vorsichtig.	Du bist	bisher noch	nicht gegen	einen Gegner dieser	Brutalität angetreten.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_05"); //Ale buď opatrný. Proti takovéhle síle jsi se ještě nestál.
			Brutus_ChallengedBefore	= TRUE;
		};

//		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_06"); //Wie hoch	ist	dein Preisgeld gegen Brutus?
		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_12_06"); //Jak velkou sázku chceš složit proti Brutovi?

		Info_ClearChoices	(Info_Arenamaster_CHALLENGEDBRUTUS);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDBRUTUS,	B_BuildPrizeString(BRUTUS_PRIZE_3),	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE3);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDBRUTUS,	B_BuildPrizeString(BRUTUS_PRIZE_2),	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE2);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDBRUTUS,	B_BuildPrizeString(BRUTUS_PRIZE_1),	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE1);
	}

	else if	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Jdeš pozdě. Dnešní zápas už je domluven. Pokud chceš bojovat, přihlas se zítra ve správný čas.
	}

	else if	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Pokud sis toho nevšiml, souboj už probíhá! Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M,		0,0)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Dnešní souboj už skončil, přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	};
};


func void	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE	(var int prize)
{
	Info_ClearChoices		(Info_Arenamaster_CHALLENGEDBRUTUS);

	if	(Npc_HasItems(hero,	ItMi_Silver) >=	prize)
	{
		B_GiveInvItems			(hero, self, ItMi_Silver, prize);

//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_01"); //Dann wirst du heute	abend also gegen Brutus	kämpfen!
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_01"); //Takže, dnes večer bojuješ proti Brutovi.
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_02"); //Ich	wünsch dir viel	Glück, du wirst	es brauchen!
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_02"); //P5eji ti hodně štěstí, budeš ho potřebovat!
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_03"); //Benutze	die	linke Arenavorkammer für deine Kampfvorbereitung!
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_03"); //Na přípravu před bojem použij levou komoru v aréně!

		Arena_PlayerPrize		= prize;
		Arena_PlayerFight		= TRUE;
		Arena_PlayerHasCome		= FALSE;
	}
	else
	{
//		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_04"); //Ich kann dich nur kämpfen lassen, wenn	du genug Silber	für	das	Preisgeld hast!
		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE_12_04"); //Nemohu tě nechat bojovat, pokud nesložíš dostatek stříbra!
	};

};

func void	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE1 ()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_1);
};

func void	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE2 ()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_2);
};

func void	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE3 ()
{
	Info_Arenamaster_CHALLENGEDBRUTUS_PRIZE(BRUTUS_PRIZE_3);
};








///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDMALGAR
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_CHALLENGEDMALGAR (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_CHALLENGEDMALGAR_Condition;
	information		= Info_Arenamaster_CHALLENGEDMALGAR_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Ich werde gegen Malgar kämpfen!";
	description		= "Budu bojovat proti Malgarovi!";
};

func int	Info_Arenamaster_CHALLENGEDMALGAR_Condition()
{
	if	Arenamaster_Accepted
	&&	Malgar_Challenged
	&&	!Arena_PlayerFight
	&&	!Arena_PlayerHasWonToday
	&&	!Arena_NpcFight			//noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_CHALLENGEDMALGAR_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDMALGAR_15_01");	//Ich werde	gegen Malgar kämpfen!
	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDMALGAR_15_01");	//Budu bojovat proti Malgarovi!

	if		Npc_IsInRoutine	(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	}
	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
		if	!Malgar_ChallengedBefore
		{
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_03"); //Oho.... Ich hoffe du	weist, worauf du dich da einlässt.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_03"); //Ohó.... Doufám, že víš, do čeho se pouštíš!
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_04"); //Malgar ist einer	der	gefährlichsten Männer die ich kenne.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_04"); //Malgar je jedním z nejnebezpečnějších mužů, které znám.
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_05"); //Er redet	zwar nicht viel, aber er ist blitzschnell und tödlich.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_05"); //Moc nemluví, ale je rychlý jako blesk a také tak smrtící!
			Malgar_ChallengedBefore	= TRUE;
		};
//		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_06"); //Nun gut,	wieviel	Preisgeld möchtest du setzen?
		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_12_06"); //No dobrá, kolik stříbra chceš vsadit?

		Info_ClearChoices	(Info_Arenamaster_CHALLENGEDMALGAR);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDMALGAR,	B_BuildPrizeString(MALGAR_PRIZE_3),	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE3);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDMALGAR,	B_BuildPrizeString(MALGAR_PRIZE_2),	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE2);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDMALGAR,	B_BuildPrizeString(MALGAR_PRIZE_1),	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE1);
	}

	else if	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Jdeš pozdě. Dnešní zápas už je domluven. Pokud chceš bojovat, přihlas se zítra ve správný čas.
	}

	else if	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Pokud sis toho nevšiml, souboj už probíhá! Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M,		0,0)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Dnešní souboj už skončil, přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	};
};


func void	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE	(var int prize)
{
	Info_ClearChoices		(Info_Arenamaster_CHALLENGEDMALGAR);

	if	(Npc_HasItems(hero,	ItMi_Silver) >=	prize)
	{
		B_GiveInvItems			(hero, self, ItMi_Silver, prize);

//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_01"); //Wie	du willst. Dann	findet der heutige Kampf zwischen dir und Malgar statt
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_01"); //Jak si přeješ. Dnešní souboj tedy proběhne mezi tebou a Malgarem.
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_02"); //Diesmal	ist	die	rechte Arenavorkammer deine.
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_02"); //Tentokrát je tvoje pravá komora v aréně.

		Arena_PlayerPrize		= prize;
		Arena_PlayerFight		= TRUE;
		Arena_PlayerHasCome		= FALSE;
	}
	else
	{
//		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_03"); //Hör zu, du	musst das Silber für das Preisgeld schon dabeihaben, sonst kann	ich	dich für heute abend nicht aufstellen!
		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDMALGAR_PRIZE_12_03"); //Poslouchej, musíš u sebe mít dostatek stříbra na vklad před soubojem, jinak tě dnes nebudu moci zařadit do souboje!
	};

};

func void	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE1 ()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_1);
};

func void	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE2 ()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_2);
};

func void	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE3 ()
{
	Info_Arenamaster_CHALLENGEDMALGAR_PRIZE(MALGAR_PRIZE_3);
};






///////////////////////////////////////////////////////////////////////
//	Info CHALLENGEDTHORA
///////////////////////////////////////////////////////////////////////
instance	Info_Arenamaster_CHALLENGEDTHORA (C_INFO)
{
	npc				= MIL_122_Arenamaster;
	condition		= Info_Arenamaster_CHALLENGEDTHORA_Condition;
	information		= Info_Arenamaster_CHALLENGEDTHORA_Info;
	important		= FALSE;
	permanent		= TRUE;
//	description		= "Thora hat meine Herausforderung angenommen!";
	description		= "Thora přijala mojí výzvu!";
};

func int	Info_Arenamaster_CHALLENGEDTHORA_Condition()
{
	if	Arenamaster_Accepted
	&&	Thora_Challenged
	&&	!Arena_PlayerFight
	&&	!Arena_PlayerHasWonToday
	&&	!Arena_NpcFight			//noch kein	NSC-Kampf angesetzt
	{
		return TRUE;
	};
};

func void	Info_Arenamaster_CHALLENGEDTHORA_Info()
{
//	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDTHORA_15_01"); //Thora hat meine Herausforderung angenommen!
	AI_Output				(hero, self,"Info_Arenamaster_CHALLENGEDTHORA_15_01"); //Thora přijala mojí výzvu!

	if		Npc_IsInRoutine	(self, ZS_ArenaMasterSleep)
	{
//		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//Und das musst du mir mitten in der Nacht sagen? Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero,"OUMULTI_NOTWHILESLEEP_12_00");	//A to jsi mi musel říct uprostřed noci? Přijď zítra do mého stánku před chatrčí!
		AI_StopProcessInfos	(self);
	}
	else if	Wld_IsTime(0, 0, ARENAPRE_H, ARENAPRE_M)
	{
		if	!Thora_ChallengedBefore
		{
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_03");	//Lass dich	von	ihr	nicht täuschen.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_03");	//Nenech se jí oklamat.
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_04");	//In der Arena kennt sie kein Erbarmen und sie ist viel	stärker, als sie aussieht.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_04");	//V aréně nemá slitováno a je mnohem silnější, než vypadá.
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_05");	//Dann spürst du nur noch die harten Enden ihres Kampfstabes überall auf deinem	Körper.
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_05");	//Potom pocítíš po celém těle už jen tvrdé konce její bojové hole.
		};
		if	!Thora_PlayerWonBefore
		{
//			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_06");	//Denk daran: Thora	ist	der	ungeschlagene Champion.	Nimm den Kampf nicht auf die leichte Schulter!
			AI_Output		(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_06");	//Pamatuj: Thora je zatím neporažený šampion arény. Neber ten boj na lehkou váhu!
		};

//		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_07");	//Wie hoch soll	dein Einsatz sein?
		AI_Output			(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_12_07");	//Jak vysokou sázku chceš zaplatit?

		Info_ClearChoices	(Info_Arenamaster_CHALLENGEDTHORA);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDTHORA,	B_BuildPrizeString(THORA_PRIZE_3),	Info_Arenamaster_CHALLENGEDTHORA_PRIZE3);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDTHORA,	B_BuildPrizeString(THORA_PRIZE_2),	Info_Arenamaster_CHALLENGEDTHORA_PRIZE2);
		Info_AddChoice		(Info_Arenamaster_CHALLENGEDTHORA,	B_BuildPrizeString(THORA_PRIZE_1),	Info_Arenamaster_CHALLENGEDTHORA_PRIZE1);
	}

	else if	Wld_IsTime(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Du kommst zu spät. Der heutige Kampf wurde bereits angesetzt. Melde dich morgen rechtzeitig, wenn du kämpfen willst.
		AI_Output			(self, hero, "OUMULTI_FIGHTSELECTED_12_00"); //Jdeš pozdě. Dnešní zápas už je domluven. Pokud chceš bojovat, přihlas se zítra ve správný čas.
	}

	else if	Wld_IsTime(ARENABEGIN_H, ARENABEGIN_M, ARENAEND_H, ARENAEND_M)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Falls es dir noch nicht aufgefallen ist, es läuft gerade ein Kampf! Komm morgen an meinem Stand vorbei!
		AI_Output			(self, hero, "OUMULTI_FIGHTRUNNING_12_00"); //Pokud sis toho nevšiml, souboj už probíhá! Přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	}

	else if	Wld_IsTime(ARENAEND_H, ARENAEND_M,		0,0)
	{
//		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Der heutige Kampf ist bereits gelaufen, komm morgen zu	meinem Stand!
		AI_Output			(self, hero, "OUMULTI_FIGHTOVER_12_00"); //Dnešní souboj už skončil, přijď zítra k mému stánku!
		AI_StopProcessInfos	(self);
	};
};


func void	Info_Arenamaster_CHALLENGEDTHORA_PRIZE (var	int	prize)
{
	Info_ClearChoices		(Info_Arenamaster_CHALLENGEDTHORA);

	if	(Npc_HasItems(hero,	ItMi_Silver) >=	prize)
	{
		B_GiveInvItems			(hero, self, ItMi_Silver, prize);

		if	(B_Arena_GetGladiatorRanking(AMZ_900_Thora)	== 1)
		{
//			AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_01"); //Du hast dich	entschieden! Heute abend trittst du	gegen den Champion an!
			AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_01"); //Rozhodl ses! Dnes večer nastoupíš proti šampionovi arény!
		}
		else
		{
//			AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_02"); //hast	dich entschieden! Heute	abend kämpfst du gegen Thora!
			AI_Output			(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_02"); //Rozhodl ses! Dnes večer bojuješ proti Thoře!
		};

//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_03"); //Nimm	die	linke Arenavorkammer, und lass Thora in	der	Vorbereitungszeit in Ruhe.
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_03"); //Zaber si levou komoru před arénou a nech Thoru se v klidu připravit!
//		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_04"); //Auf Störungen in	dieser Zeit	reagiert sie äusserst ungehalten.
		AI_Output				(self, hero,"Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_04"); //Během přípravy umí výt velice nepříjemná!

		Arena_PlayerPrize		= prize;
		Arena_PlayerFight		= TRUE;
		Arena_PlayerHasCome		= FALSE;
	}
	else
	{
//		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_05"); //Zu wenig Silber! Ohne Preisgeld	werde ich dich nicht aufstellen. Champion-Kampf	hin	oder her!
		AI_Output				(self, hero, "Info_Arenamaster_CHALLENGEDTHORA_PRIZE_12_05"); //Máš málo stříbra! Bez vstupního poplatku tě do arény nenasadím.
	};

};

func void	Info_Arenamaster_CHALLENGEDTHORA_PRIZE1	()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_1);
};

func void	Info_Arenamaster_CHALLENGEDTHORA_PRIZE2	()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_2);
};

func void	Info_Arenamaster_CHALLENGEDTHORA_PRIZE3	()
{
	Info_Arenamaster_CHALLENGEDTHORA_PRIZE(THORA_PRIZE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info GREETCHAMPION
///////////////////////////////////////////////////////////////////////
instance MIL_122_Arenamaster_GREETCHAMPION		(C_INFO)
{
	npc			=	MIL_122_Arenamaster;
	nr			=	10;
	condition	=	MIL_122_Arenamaster_GREETCHAMPION_Condition;
	information	=	MIL_122_Arenamaster_GREETCHAMPION_Info;
	important	=	TRUE;
	permanent	=	TRUE;
};

func int MIL_122_Arenamaster_GREETCHAMPION_Condition ()
{
	if	C_NpcIsInvincible(hero)
	&&	(B_Arena_GetGladiatorRanking(PC_Hero) == 1)
	{
		return TRUE;
	};
};

func void MIL_122_Arenamaster_GREETCHAMPION_Info ()
{
//	AI_Output (self, hero, "MIL_122_GREETCHAMPION_12_01"); //CHAMPION, ich grüsse dich!
	AI_Output (self, hero, "MIL_122_GREETCHAMPION_12_01"); //ŠAMPIONE, zdravím tě!
};
