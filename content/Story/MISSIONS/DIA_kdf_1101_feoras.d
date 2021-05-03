
instance KDF_1101_FEORAS_EXIT(C_Info)
{
	npc = kdf_1101_feoras;
	nr = 999;
	condition = kdf_1101_feoras_exit_condition;
	information = kdf_1101_feoras_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_1101_feoras_exit_condition()
{
	return TRUE;
};

func void kdf_1101_feoras_exit_info()
{
	AI_StopProcessInfos(self);
};


instance KDF_1101_FEORAS_WELCOME(C_Info)
{
	npc = kdf_1101_feoras;
	nr = 1;
	condition = kdf_1101_feoras_welcome_condition;
	information = kdf_1101_feoras_welcome_info;
	important = TRUE;
	permanent = TRUE;
};


func int kdf_1101_feoras_welcome_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void kdf_1101_feoras_welcome_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,hero,"KDF_1101_Feoras_WELCOME_00_01");	//Stör mich jetzt nicht!
		AI_StopProcessInfos(self);
	};
	if(randomizer == 1)
	{
		AI_Output(self,hero,"KDF_1101_Feoras_WELCOME_00_02");	//Ich habe keine Zeit für dich!
		AI_StopProcessInfos(self);
	};
	if(randomizer == 2)
	{
		AI_Output(self,hero,"KDF_1101_Feoras_WELCOME_00_03");	//Steh hier nicht im Weg rum!
		AI_StopProcessInfos(self);
	};
};

