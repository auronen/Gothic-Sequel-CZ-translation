// 			EXIT

instance  KDF_1101_Feoras_Exit (C_INFO)
{
	npc			=  KDF_1101_Feoras;
	nr			=  999;
	condition	=  KDF_1101_Feoras_Exit_Condition;
	information	=  KDF_1101_Feoras_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  KDF_1101_Feoras_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_1101_Feoras_Exit_Info()
{
	AI_StopProcessInfos		(self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance KDF_1101_Feoras_WELCOME		(C_INFO)
{
	npc		 = 	KDF_1101_Feoras;
	nr		 = 	1;
	condition	 = 	KDF_1101_Feoras_WELCOME_Condition;
	information	 = 	KDF_1101_Feoras_WELCOME_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
	
};

func int KDF_1101_Feoras_WELCOME_Condition ()
{	
	if C_NPCisinvincible (self)
	{
		return TRUE;
	};
};
func void KDF_1101_Feoras_WELCOME_Info ()
{
	var int randomizer;
	randomizer	= Hlp_Random(3); 
	
	if (randomizer == 0)
	{
//		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_01"); //Stör mich jetzt nicht!
		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_01"); //Teď mě neruš!
	
		AI_StopProcessInfos		(self);
	};
	if (randomizer == 1)
	{
//		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_02"); //Ich habe keine Zeit für dich!
		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_02"); //Nemám na tebe čas! 
	
		AI_StopProcessInfos		(self);
	};
	if (randomizer == 2)
	{
//		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_03"); //Steh hier nicht im Weg rum!
		AI_Output			(self, hero, "KDF_1101_Feoras_WELCOME_00_03"); //Nestůj tu v cestě! 
	
		AI_StopProcessInfos		(self);
	};

};
