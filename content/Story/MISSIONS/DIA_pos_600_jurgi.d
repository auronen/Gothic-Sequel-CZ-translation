instance  POS_600_Jurgi_Exit (C_INFO)
{
	npc			=  POS_600_Jurgi;
	nr			=  999;
	condition	=  POS_600_Jurgi_Exit_Condition;
	information	=  POS_600_Jurgi_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  POS_600_Jurgi_Exit_Condition()
{
	return 1;
};
FUNC VOID  POS_600_Jurgi_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info CRAZY
///////////////////////////////////////////////////////////////////////
instance POS_600_Jurgi_CRAZY		(C_INFO)
{
	npc		 = 	POS_600_Jurgi;
	nr		 = 	1;
	condition	 = 	POS_600_Jurgi_CRAZY_Condition;
	information	 = 	POS_600_Jurgi_CRAZY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int POS_600_Jurgi_CRAZY_Condition ()
{
	if C_NPCisinvincible(self)
	{
		return TRUE;
	};
};
func void POS_600_Jurgi_CRAZY_Info ()
{
	if (Jurgi_Crazy == 0)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_01"); //Wohl denen die da gehen und sehen, denn sie sind es...äh..sie sind es...die sehen!
		AI_Output			(self, hero, "POS_600_CRAZY_00_01"); //Dobré pro ty, kteří chodí a vidí, ti jsou... ah.. oni jsou... oni vidí!
		Jurgi_Crazy = 1;
		AI_StopProcessInfos	( self );
		return;
	};
	if (Jurgi_Crazy == 1)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_02"); //Wahrlich ich sage dir ein Mann der ein Haus baut  ist ein Mann der...äh...Dinge hat,
		AI_Output			(self, hero, "POS_600_CRAZY_00_02"); //Opravdu ti říkám, muž, který staví důl je muž který... ah... má věci,
//		AI_Output			(self, hero, "POS_600_CRAZY_00_03"); //die er braucht, er braucht diese Dinge, denn ohne diese Dinge äh...hat er sie nicht.
		AI_Output			(self, hero, "POS_600_CRAZY_00_03"); //které potřebuje, on ty věci potřebuje, potom bez těch věcí... ah.. je nemá.
		Jurgi_Crazy = 2;
		AI_StopProcessInfos	( self );
		return;
	};
	if (Jurgi_Crazy == 2)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_04"); //Denn der Himmel öffnete sich und das Wasser ergoss sich über die Häupter von...
		AI_Output			(self, hero, "POS_600_CRAZY_00_04"); //Pak se otevřelo nebe a voda se vylila na hlavu...
//		AI_Output			(self, hero, "POS_600_CRAZY_00_05"); //äh...allen die gesehen hatten...äh,...wie sie gingen und woher sie kamen.
		AI_Output			(self, hero, "POS_600_CRAZY_00_05"); //ah... každý, kdo viděl... ah... jak šli a kam jdou.
		Jurgi_Crazy = 3;
		AI_StopProcessInfos	( self );
		return;
	};
	if (Jurgi_Crazy == 3)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_06"); //Und sie hatten kleine Truhen mit noch kleineren Schachteln, in denen die winzigkleinen ...
		AI_Output			(self, hero, "POS_600_CRAZY_00_06"); //A měli malé truhly s ještě menšími krabičkami, ve kterých byly malé...
//		AI_Output			(self, hero, "POS_600_CRAZY_00_07"); //wirklich wirklich winzigkleinen Dinge lagen, mit denen eigentlich niemand so recht wußte...
		AI_Output			(self, hero, "POS_600_CRAZY_00_07"); //opravdu opravdu maličkaté věcičky, o kterých opravdu nikdo nevěděl...
//		AI_Output			(self, hero, "POS_600_CRAZY_00_08"); //was er sagen wollte...äh...sie waren sehr klein - Winzig.
		AI_Output			(self, hero, "POS_600_CRAZY_00_08"); //co chtěl říct... ah... byly opravdu malé - titěrné!
		Jurgi_Crazy = 4;
		AI_StopProcessInfos	( self );
		return;
	};
	if (Jurgi_Crazy == 4)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_09"); //Und der Himmel wird sich blutrot färben und die Herrscharen werden kommen auf Rössern die schwarz wie die Nacht sind!
		AI_Output			(self, hero, "POS_600_CRAZY_00_09"); //A obloha bude krvavě rudá a vládci přijedou na koních černých jako noc!
//		AI_Output			(self, hero, "POS_600_CRAZY_00_10"); //Und es wird eine große Not unter denen geben die nicht ...äh... diese kleinen Truhen haben.
		AI_Output			(self, hero, "POS_600_CRAZY_00_10"); //A bude tu velká bída pod kterou nebudou... ah... tyto malé truhly.
		Jurgi_Crazy = 5;
		AI_StopProcessInfos	( self );
		return;
	};
	if (Jurgi_Crazy == 5)
	{
//		AI_Output			(self, hero, "POS_600_CRAZY_00_11"); //Wahrlich ich frage dich : Was nützt ein Brunnen ohne Wasser? Was ist ein Vogel der nicht fliegt?
		AI_Output			(self, hero, "POS_600_CRAZY_00_11"); //Opravdu se tě ptám: K čemu je studna bez vody? Co je pták, který nelítá?
//		AI_Output			(self, hero, "POS_600_CRAZY_00_12"); //Aha! Also frage dich selber warum und vor allem  WAS in diesen kleinen Truhen ist...äh....
		AI_Output			(self, hero, "POS_600_CRAZY_00_12"); //Aha! Takže se zeptej sám sebe, proč a především CO je v těch malých truhlách... ah...
		Jurgi_Crazy = 0;
		AI_StopProcessInfos	( self );
		return;
	};


};





/*
instance  POS_600_Jurgi_KEY (C_INFO)
{
	npc				= POS_600_Jurgi;
	condition		= POS_600_Jurgi_NORMAL_Condition;
	information		= POS_600_Jurgi_NORMAL_Info;
	description		= "Sag mir wo Lesters Schlüssel ist";
};

FUNC int  POS_600_Jurgi_NORMAL_Condition()
{
	if (Circle_1 == LOG_RUNNING)
		&& (Npc_GetTempAttitude (self,other)== ATT_FRIENDLY)
	{
		return 1;
	};

};
FUNC void  POS_600_Jurgi_NORMAL_Info()
{
	AI_Output (other, self,"POS_600_Jurgi_NORMAL_Info_15_01"); //Sag mir wo Lesters Schlüssel ist!
	AI_Output (self, other,"POS_600_Jurgi_NORMAL_Info_00_02"); //Wer....wer bist du?
	AI_Output (other, self,"POS_600_Jurgi_NORMAL_Info_15_03"); //Ich bin hier um dir zu helfen. Wir haben nicht viel Zeit, also bitte ich dich. Denk nach. Wo ist der Schlüssel von Lester?
	AI_Output (self, other,"POS_600_Jurgi_NORMAL_Info_00_04"); //Der Schlüssel....Lester....
	AI_Output (other, self,"POS_600_Jurgi_NORMAL_Info_15_05"); //Bei allen Göttern, wo ist der Schlüssel?
	AI_Output (self, other,"POS_600_Jurgi_NORMAL_Info_00_06"); //Der Schlüssel...er liegt im Magierhaus... daundda.
	AI_Output (other, self,"POS_600_Jurgi_NORMAL_Info_15_07"); //Danke. Du hast mir geholfen.
	AI_Output (self, other,"POS_600_Jurgi_NORMAL_Info_00_08"); //Jetzt hilf du mir! Töte mich, bitte ich kann die Schmerzen nicht länger ertragen.
};

instance POS_600_Jurgi_IMPORTANT (C_INFO)
{
	npc				= POS_600_Jurgi;
	condition		= POS_600_Jurgi_IMPORTANT_Condition;
	information		= POS_600_Jurgi_IMPORTANT_Info;
	important		= 1;

};

FUNC int  POS_600_Jurgi_IMPORTANT_Condition()
{
	if (Circle_1 == LOG_RUNNING)
		&& (Npc_KnowsInfo (hero,POS_600_Jurgi_KEY))
	{
		return 1;
	};
};
func void  POS_600_Jurgi_IMPORTANT_Info()
{
	AI_Output (self, other,"POS_600_Jurgi_IMPORTANT_Info_15_01"); //!!!!TÖTE MICH !!!!
	AI_StopProcessInfos	(self);
	B_SetAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};
*/


