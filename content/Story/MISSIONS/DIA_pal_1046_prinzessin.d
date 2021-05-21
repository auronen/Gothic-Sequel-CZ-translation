///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE PAL_1046_Prinzessin_EXIT   (C_INFO)
{
	npc         = PAL_1046_Prinzessin;
	nr          = 999;
	condition   = PAL_1046_Prinzessin_EXIT_Condition;
	information = PAL_1046_Prinzessin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT PAL_1046_Prinzessin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID PAL_1046_Prinzessin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_HI		(C_INFO)
{
	npc		 = 	PAL_1046_Prinzessin;
	nr		 = 	1;
	condition	 = 	PAL_1046_Prinzessin_HI_Condition;
	information	 = 	PAL_1046_Prinzessin_HI_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int PAL_1046_Prinzessin_HI_Condition ()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_HI_Info ()
{
//	AI_Output			(self, hero, "PAL_1046_HI_16_01"); //Ich bin eine Prinzessin!
	AI_Output			(self, hero, "PAL_1046_HI_16_01"); //Já jsem princezna!
//	AI_Output			(self, hero, "PAL_1046_HI_16_02"); //Tatsächlich?
	AI_Output			(hero, self, "PAL_1046_HI_16_02"); //Opravdu?
//	AI_Output			(self, hero, "PAL_1046_HI_16_03"); //Oh ein junger stürmischer Krieger -TRIEF- // Nevím jak přeložit to TRIEF.
	AI_Output			(self, hero, "PAL_1046_HI_16_03"); //Och, mladý bouřlivý válečník -???- 
//	AI_Output			(hero, self, "PAL_1046_HI_15_04"); //Noch so abgetakelte mitt-40erin die keinen mehr abgekriegt hat // Tohle jsem hodně střelil, ale myslím, že ten význam asi má být takový.
	AI_Output			(hero, self, "PAL_1046_HI_15_04"); //Leda tak vyřízený čtyřicátník, který už toho moc nenaválčí
//	AI_Output			(self, hero, "PAL_1046_HI_16_05"); //Kann ich was für dich tun - KLIMPER- KLIMPER- // To klimper klimper by asi mohlo být něco jako mrk mrk.
	AI_Output			(self, hero, "PAL_1046_HI_16_05"); //Co pro tebe můžu udělat? (mrk mrk) 

};
///////////////////////////////////////////////////////////////////////
//	Info BATH
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_BATH		(C_INFO)
{
	npc		 = 	PAL_1046_Prinzessin;
	nr		 = 	2;
	condition	 = 	PAL_1046_Prinzessin_BATH_Condition;
	information	 = 	PAL_1046_Prinzessin_BATH_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Geh baden!";
	description	 = 	"Vykoupej se!";
};

func int PAL_1046_Prinzessin_BATH_Condition ()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_BATH_Info ()
{
//	AI_Output			(hero, self, "PAL_1046_BATH_15_01"); //Geh baden!
	AI_Output			(hero, self, "PAL_1046_BATH_15_01"); //Vykoupej se!
//	AI_Output			(self, hero, "PAL_1046_BATH_16_02"); //Oh Jaaa, ich bin so schmutzig! Willst du mir nicht beim Baden zusehen??
	AI_Output			(self, hero, "PAL_1046_BATH_16_02"); //Och anooo, jsem tak špinavá! Nechceš se na mě při koupeli dívat??
//	AI_Output			(self, hero, "PAL_1046_BATH_16_03"); //BITTE (Winsel)
	AI_Output			(self, hero, "PAL_1046_BATH_16_03"); //PROSÍÍÍM. (Kňučí)
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"BATH");
	
};

///////////////////////////////////////////////////////////////////////
//	Info LOVE
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_LOVE		(C_INFO)
{
	npc		 = 	PAL_1046_Prinzessin;
	nr		 = 	1;
	condition	 = 	PAL_1046_Prinzessin_LOVE_Condition;
	information	 = 	PAL_1046_Prinzessin_LOVE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Zieh dich aus und leg dich hin!";
	description	 = 	"Vysvleč se a lehni si!";
};

func int PAL_1046_Prinzessin_LOVE_Condition ()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_LOVE_Info ()
{
//	AI_Output			(hero, self, "PAL_1046_LOVE_15_01"); //Zieh dich aus und leg dich hin!
	AI_Output			(hero, self, "PAL_1046_LOVE_15_01"); //Vysvleč se a lehni si!
//	AI_Output			(self, hero, "PAL_1046_LOVE_16_02"); //Nichts würde ich lieber, du Starker, aber das Bett ist nicht gemacht...
	AI_Output			(self, hero, "PAL_1046_LOVE_16_02"); //Nic bych neudělala radši, ty jeden siláku, ale postel není ustlaná...
//	AI_Output			(hero, self, "PAL_1046_LOVE_15_03"); //Scheisse!
	AI_Output			(hero, self, "PAL_1046_LOVE_15_03"); //A sakra!
};

///////////////////////////////////////////////////////////////////////
//	Info SUICIDE
///////////////////////////////////////////////////////////////////////
instance PAL_1046_Prinzessin_SUICIDE		(C_INFO)
{
	npc		 = 	PAL_1046_Prinzessin;
	nr		 = 	3;
	condition	 = 	PAL_1046_Prinzessin_SUICIDE_Condition;
	information	 = 	PAL_1046_Prinzessin_SUICIDE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Du bist über, Bitch! ";
	description	 = 	"Skončilas, děvko!";
};

func int PAL_1046_Prinzessin_SUICIDE_Condition ()
{
	return TRUE;
};

func void PAL_1046_Prinzessin_SUICIDE_Info ()
{
//	AI_Output			(hero, self, "PAL_1046_SUICIDE_15_01"); //Du bist über, Bitch!
	AI_Output			(hero, self, "PAL_1046_SUICIDE_15_01"); //Skončilas, děvko!
//	AI_Output			(self, hero, "PAL_1046_SUICIDE_16_02"); //Oh - nein, du liebst mich nicht (dramatisch)
	AI_Output			(self, hero, "PAL_1046_SUICIDE_16_02"); //Ach ne, ty mě nemiluješ (dramaticky)
//	AI_Output			(self, hero, "PAL_1046_SUICIDE_16_03"); //Dann stürze ich mich jetzt zu Tode!!
	AI_Output			(self, hero, "PAL_1046_SUICIDE_16_03"); //Pak tedy musím zhynout!!
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"SUICIDE");
};









