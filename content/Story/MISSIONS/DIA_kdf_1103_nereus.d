
instance KDF_1103_NEREUS_EXIT(C_Info)
{
	npc = kdf_1103_nereus;
	nr = 999;
	condition = kdf_1103_nereus_exit_condition;
	information = kdf_1103_nereus_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_1103_nereus_exit_condition()
{
	return TRUE;
};

func void kdf_1103_nereus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance KDF_1103_NEREUS_WELCOME(C_Info)
{
	npc = kdf_1103_nereus;
	nr = 1;
	condition = kdf_1103_nereus_welcome_condition;
	information = kdf_1103_nereus_welcome_info;
	important = TRUE;
	permanent = TRUE;
};


func int kdf_1103_nereus_welcome_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void kdf_1103_nereus_welcome_info()
{
	AI_Output(self,hero,"KDF_1103_Nereus_WELCOME_00_01");	//Ich habe keine Zeit für dich. Ich muss mich um wichtige Dinge kümmern!
};

