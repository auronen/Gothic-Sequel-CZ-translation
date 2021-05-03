
instance INFO_BARTOK_EXIT(C_Info)
{
	npc = pos_605_bartok;
	nr = 999;
	condition = info_bartok_exit_condition;
	information = info_bartok_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_bartok_exit_condition()
{
	return TRUE;
};

func void info_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_605_BARTOK_CRAZY(C_Info)
{
	npc = pos_605_bartok;
	nr = 1;
	condition = pos_605_bartok_crazy_condition;
	information = pos_605_bartok_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_605_bartok_crazy_condition()
{
	if(c_npcisinvincible(self) && (!Npc_KnowsInfo(hero,info_julius_chest) || Npc_KnowsInfo(hero,info_odo_dontbother)))
	{
		return TRUE;
	};
};

func void pos_605_bartok_crazy_info()
{
	if(BARTOK_CRAZY == 0)
	{
		AI_Output(self,hero,"POS_605_CRAZY_02_01");	//Glühende Funkengischt erhellt die Nacht, die Funken tanzen in den Himmel,
		AI_Output(self,hero,"POS_605_CRAZY_02_02");	//stählerner Stab zu tödlichen Instrument geformt im Feuer des Lebens.
		BARTOK_CRAZY = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if(BARTOK_CRAZY == 1)
	{
		AI_Output(self,hero,"POS_605_CRAZY_02_03");	//Blitzende Klinge schlitzt Bäuche, trennt Köpfe, zerteilt Leiber. Im Namen eines Grafen, eines Hauptmanns, eines Rates.
		AI_Output(self,hero,"POS_605_CRAZY_02_04");	//Im Namen eines Gottes...
		BARTOK_CRAZY = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if(BARTOK_CRAZY == 2)
	{
		AI_Output(self,hero,"POS_605_CRAZY_02_05");	//Faulender Körper tausendfach Gestank. Würmer kriechen durch knochige Höhlen,
		AI_Output(self,hero,"POS_605_CRAZY_02_06");	//wo Geier die leckeren Augen stibizt haben, mit ihren krummen Schnäbeln.
		BARTOK_CRAZY = 3;
		AI_StopProcessInfos(self);
		return;
	};
	if(BARTOK_CRAZY == 3)
	{
		AI_Output(self,hero,"POS_605_CRAZY_02_07");	//Siegesfeier ohne Freude. Gelächter hohl und leer. Der Wein schmeckt nach geronnenem Blut.
		AI_Output(self,hero,"POS_605_CRAZY_02_08");	//Wenn der Hass triumphiert, ertrinkt die Liebe in ihren eigenen Tränen.
		BARTOK_CRAZY = 0;
		AI_StopProcessInfos(self);
		return;
	};
};


instance INFO_BARTOK_HOWDY(C_Info)
{
	npc = pos_605_bartok;
	nr = 20;
	condition = info_bartok_howdy_condition;
	information = info_bartok_howdy_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie geht es dir, Schmied?";
};


func int info_bartok_howdy_condition()
{
	if(Npc_KnowsInfo(hero,info_julius_chest))
	{
		return TRUE;
	};
};

func void info_bartok_howdy_info()
{
	AI_Output(hero,self,"Info_Bartok_HOWDY_15_01");	//Wie geht es dir, Schmied?
	AI_Output(self,hero,"Info_Bartok_HOWDY_02_02");	//(verrückt) SIE werden uns alle holen.. aieehhhhh
	AI_Output(hero,self,"Info_Bartok_HOWDY_15_03");	//Ähh... ja, natürlich!
	AI_Output(self,hero,"Info_Bartok_HOWDY_02_04");	//(verrückt) SIE werden uns mit ihrer Unreitheit überziehen... ouhhlll
	AI_Output(hero,self,"Info_Bartok_HOWDY_15_05");	//Völlig...ahem... logisch!
};


instance INFO_BARTOK_WHO(C_Info)
{
	npc = pos_605_bartok;
	nr = 20;
	condition = info_bartok_who_condition;
	information = info_bartok_who_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wen meinst du mit SIE?";
};


func int info_bartok_who_condition()
{
	if(Npc_KnowsInfo(hero,info_bartok_howdy))
	{
		return TRUE;
	};
};

func void info_bartok_who_info()
{
	AI_Output(hero,self,"Info_Bartok_WHO_15_01");	//Wen meinst du mit SIE?
	AI_Output(self,hero,"Info_Bartok_WHO_02_02");	//(verrückt) SIE jagen mich in meinen Träumen... arghhhh
	AI_Output(hero,self,"Info_Bartok_WHO_15_03");	//WER, verdammt nochmal? WER???
	AI_Output(self,hero,"Info_Bartok_WHO_02_04");	//(verrückt) Bald werden SIE überall sein.... (sabbel)
};


instance INFO_BARTOK_KEY(C_Info)
{
	npc = pos_605_bartok;
	nr = 20;
	condition = info_bartok_key_condition;
	information = info_bartok_key_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du hast einen Schlüssel, den ich gerne haben würde!";
};


func int info_bartok_key_condition()
{
	if(Npc_KnowsInfo(hero,info_bartok_howdy))
	{
		return TRUE;
	};
};

func void info_bartok_key_info()
{
	AI_Output(hero,self,"Info_Bartok_KEY_15_01");	//Du hast einen Schlüssel, den ich gerne haben würde!
	AI_Output(self,hero,"Info_Bartok_KEY_02_02");	//(verrückt) SIE kommen... dlblgldl... hörst du SIE auch, hörst du SIE kommen?
	AI_Output(hero,self,"Info_Bartok_KEY_15_03");	//Nochmal zurück zum Schlüssel...
	AI_Output(self,hero,"Info_Bartok_KEY_02_04");	//(nachdenklich) Schlüssel ?
	AI_Output(hero,self,"Info_Bartok_KEY_15_05");	//(hoffnungsvoll) JA... Genau... der Schlüssel!!!
	AI_Output(self,hero,"Info_Bartok_KEY_02_06");	//(verrückt) SIE werden uns in ein tiefes Verlies sperren und den Schlüssel wegwerfen... ich weiss es, ich weiss es...
	AI_Output(hero,self,"Info_Bartok_KEY_15_07");	//(zu sich selbst) Ich geb's auf, der ist ja völlig durchgeknallt.
	B_LogEntry(CH1_BARTOK,"Ich habe Bartok im Krankenviertel getroffen. Er ist völlig durchgeknallt. Es ist unmöglich aus ihm etwas vernünftiges herauszubekommen. Vielleicht weiss einer der Pfleger etwas von dem Schlüssel.");
	AI_StopProcessInfos(self);
};

