// 			EXIT

instance  KDF_1103_Nereus_Exit (C_INFO)
{
	npc			=  KDF_1103_Nereus;
	nr			=  999;
	condition	=  KDF_1103_Nereus_Exit_Condition;
	information	=  KDF_1103_Nereus_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  KDF_1103_Nereus_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_1103_Nereus_Exit_Info()
{
	AI_StopProcessInfos		(self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
//Die Sphärischen Strömungen müssen neu kalibriert werden. 
//Die Dichte der magischen Konverter muss konfiguriert werden.
//Ich muss noch die Symbolik in der Runenmatrix justieren.  
instance KDF_1103_Nereus_WELCOME		(C_INFO)
{
	npc		 	 = 	KDF_1103_Nereus;
	nr		 	 = 	1;
	condition	 = 	KDF_1103_Nereus_WELCOME_Condition;
	information	 = 	KDF_1103_Nereus_WELCOME_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
	
};

func int KDF_1103_Nereus_WELCOME_Condition ()
{	
	if C_NPCisinvincible (self)
	{
		return TRUE;
	};
};
func void KDF_1103_Nereus_WELCOME_Info ()
{
//	AI_Output			(self, hero, "KDF_1103_Nereus_WELCOME_00_01"); //Störe mich nicht bei meinen Untersuchungen. 
	AI_Output			(self, hero, "KDF_1103_Nereus_WELCOME_00_01"); //Neruš mě při mém výzkumu!

};

	