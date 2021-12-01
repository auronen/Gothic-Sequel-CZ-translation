///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_219_Botholo_EXIT   (C_INFO)
{
	npc         = WRK_219_Botholo;
	nr          = 999;
	condition   = WRK_219_Botholo_EXIT_Condition;
	information = WRK_219_Botholo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_219_Botholo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_219_Botholo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HATE
///////////////////////////////////////////////////////////////////////
instance WRK_219_Botholo_HATE		(C_INFO)
{
	npc		 = 	WRK_219_Botholo;
	nr		 = 	12;
	condition	 = 	WRK_219_Botholo_HATE_Condition;
	information	 = 	WRK_219_Botholo_HATE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was gibt'S Neues?";
	description	 = 	"Co je nového?";
};

func int WRK_219_Botholo_HATE_Condition ()
{
	return TRUE;
};

func void WRK_219_Botholo_HATE_Info ()
{
//	AI_Output			(hero, self, "WRK_219_HATE_15_01"); //Was gibt's Neues?
	AI_Output			(hero, self, "WRK_219_HATE_15_01"); //Co je nového?
//	AI_Output			(self, hero, "WRK_219_HATE_09_02"); //Oh Mann, ich hasse dieses Lager! Ich wollte nicht herkommen. Aber die Orks haben mein Dorf überfallen und wir mussten fliehen. 
	AI_Output			(self, hero, "WRK_219_HATE_09_02"); //Ou chlape, já tenhle tábor nesnáším! Nechtěl jsem sem přijít. Ale skřeti napadli mou vesnici a museli jsme uprchnout.
//	AI_Output			(self, hero, "WRK_219_HATE_09_03"); //Ich habe es allen gesagt, kommt, hab ich gesagt, wir verlassen das Königreich . Aber keiner hat auf mich gehört. 
	AI_Output			(self, hero, "WRK_219_HATE_09_03"); //Všem jsem to říkal, 'pojďte', říkal jsem jim, opustíme království. Ale nikdo mě neposlouchal.
//	AI_Output			(self, hero, "WRK_219_HATE_09_04"); //Wir gehen ins Tal von Khorinis, haben sie gesagt. Der König zieht auch dorthin. Dort ist es sicher. 
	AI_Output			(self, hero, "WRK_219_HATE_09_04"); //'Půjdeme do údolí Khorinisu', říkali jsme jim. Král se tam také zdržuje.
//	AI_Output			(self, hero, "WRK_219_HATE_09_05"); //Und jetzt? Jetzt sitzen wir hier fest und der König schert sich einen Dreck um uns. Und ich klopfe den ganzen Tag Steine. 
	AI_Output			(self, hero, "WRK_219_HATE_09_05"); //A teď? Teď tady sedíme na zadku a král se o nás vůbec nezajímá. A já tu celý den lámu kamení.
//	AI_Output			(self, hero, "WRK_219_HATE_09_06"); //Glaub mir, niemand hasst dieses Lager mehr als ich. 
	AI_Output			(self, hero, "WRK_219_HATE_09_06"); //Věř mi, není tu nikdo jiný, kdo by nenáviděl tenhle tábor víc než já.
};





