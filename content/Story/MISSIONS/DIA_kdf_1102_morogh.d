
instance KDF_1102_MOROGH_EXIT(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 999;
	condition = kdf_1102_morogh_exit_condition;
	information = kdf_1102_morogh_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int kdf_1102_morogh_exit_condition()
{
	return TRUE;
};

func void kdf_1102_morogh_exit_info()
{
	AI_StopProcessInfos(self);
};


instance KDF_1102_MOROGH_WELCOME(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 1;
	condition = kdf_1102_morogh_welcome_condition;
	information = kdf_1102_morogh_welcome_info;
	important = TRUE;
	permanent = TRUE;
};


func int kdf_1102_morogh_welcome_condition()
{
	if(c_npcisinvincible(self) && !Npc_KnowsInfo(hero,pc_mage_todo))
	{
		return TRUE;
	};
};

func void kdf_1102_morogh_welcome_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 1)
	{
		AI_Output(self,hero,"KDF_1102_Morogh_WELCOME_00_01");	//Was hast du hier zu suchen? Mach dich irgendwo nützlich! - Woanders !
		AI_StopProcessInfos(self);
	};
	if(randomizer == 2)
	{
		AI_Output(self,hero,"KDF_1102_Morogh_WELCOME_00_02");	//Hast du nichts anderes zu tun, als mich zu belästigen?
		AI_StopProcessInfos(self);
	};
	if(randomizer == 3)
	{
		AI_Output(self,hero,"KDF_1102_Morogh_WELCOME_00_03");	//Du stiehlst meine Zeit! Verschwinde!
		AI_StopProcessInfos(self);
	};
};


instance KDF_1102_MOROGH_MISSION(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 4;
	condition = kdf_1102_morogh_mission_condition;
	information = kdf_1102_morogh_mission_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich hörte du verbesserst die Konzentration magischer Tränke ?!";
};


func int kdf_1102_morogh_mission_condition()
{
	if(Npc_KnowsInfo(hero,pc_mage_todo))
	{
		return TRUE;
	};
};

func void kdf_1102_morogh_mission_info()
{
	AI_Output(hero,self,"KDF_1102_MISSION_15_01");	//
	AI_Output(self,hero,"KDF_1102_MISSION_14_02");	//
	Info_ClearChoices(kdf_1102_morogh_mission);
	Info_AddChoice(kdf_1102_morogh_mission,"Ich hab schon mal ein paar Tränke gebraut.",kdf_1102_morogh_mission_cool);
	Info_AddChoice(kdf_1102_morogh_mission,"Wir sind Kollegen",kdf_1102_morogh_mission_partner);
	Info_AddChoice(kdf_1102_morogh_mission,"Vielleicht kann ich dir helfen",kdf_1102_morogh_mission_suggest);
};

func void kdf_1102_morogh_mission_cool()
{
	AI_Output(hero,self,"KDF_1102_MISSION_COOL_15_01");	//
	AI_Output(self,hero,"KDF_1102_MISSION_COOL_14_02");	//
	AI_Output(self,hero,"KDF_1102_MISSION_COOL_14_03");	//
	AI_Output(self,hero,"KDF_1102_MISSION_COOL_14_04");	//
	AI_Output(self,hero,"KDF_1102_MISSION_COOL_14_05");	//
	Info_ClearChoices(kdf_1102_morogh_mission);
};

func void kdf_1102_morogh_mission_partner()
{
	AI_Output(hero,self,"KDF_1102_MISSION_PARTNER_15_01");	//
	AI_Output(self,hero,"KDF_1102_MISSION_PARTNER_14_02");	//
	AI_Output(self,hero,"KDF_1102_MISSION_PARTNER_14_03");	//
	AI_Output(self,hero,"KDF_1102_MISSION_PARTNER_14_04");	//
	AI_Output(self,hero,"KDF_1102_MISSION_PARTNER_14_05");	//
	Info_ClearChoices(kdf_1102_morogh_mission);
};

func void kdf_1102_morogh_mission_suggest()
{
	AI_Output(hero,self,"KDF_1102_MISSION_SUGGEST_15_01");	//
	AI_Output(self,hero,"KDF_1102_MISSION_SUGGEST_14_02");	//
	AI_Output(self,hero,"KDF_1102_MISSION_SUGGEST_14_03");	//
	AI_Output(self,hero,"KDF_1102_MISSION_SUGGEST_14_04");	//
	AI_Output(self,hero,"KDF_1102_MISSION_SUGGEST_14_05");	//
	Info_ClearChoices(kdf_1102_morogh_mission);
};


instance KDF_1102_MOROGH_INGREDENCIA(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 2;
	condition = kdf_1102_morogh_ingredencia_condition;
	information = kdf_1102_morogh_ingredencia_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welche Zutaten brauchst du?";
};


func int kdf_1102_morogh_ingredencia_condition()
{
	if(Npc_KnowsInfo(hero,kdf_1102_morogh_mission))
	{
		return TRUE;
	};
};

func void kdf_1102_morogh_ingredencia_info()
{
	AI_Output(hero,self,"KDF_1102_INGREDENCIA_15_01");	//
	AI_Output(self,hero,"KDF_1102_INGREDENCIA_14_02");	//
	B_GiveInvItems(self,hero,itwr_morogh_list,1);
	AI_Output(self,hero,"KDF_1102_INGREDENCIA_14_02");	//
	AI_StopProcessInfos(self);
	MOROGH_TRUST = LOG_RUNNING;
};


instance KDF_1102_MOROGH_RYAN(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 4;
	condition = kdf_1102_morogh_ryan_condition;
	information = kdf_1102_morogh_ryan_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wer ist dein Lieferant?";
};


func int kdf_1102_morogh_ryan_condition()
{
	if(Npc_KnowsInfo(hero,kdf_1102_morogh_mission))
	{
		return TRUE;
	};
};

func void kdf_1102_morogh_ryan_info()
{
	AI_Output(hero,self,"KDF_1102_RYAN_15_01");	//
	AI_Output(self,hero,"KDF_1102_RYAN_14_02");	//
	AI_Output(self,hero,"KDF_1102_RYAN_14_03");	//
};


instance KDF_1102_MOROGH_SUCCESS(C_Info)
{
	npc = kdf_1102_morogh;
	nr = 3;
	condition = kdf_1102_morogh_success_condition;
	information = kdf_1102_morogh_success_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die benötigten Zutaten";
};


func int kdf_1102_morogh_success_condition()
{
	if((MOROGH_TRUST == LOG_RUNNING) && (Npc_HasItems(hero,itmi_alcohol) >= 9) && (Npc_HasItems(hero,itpl_stoneroot) >= 8) && (Npc_HasItems(hero,itpl_nightshade) >= 7))
	{
		return TRUE;
	};
};

func void kdf_1102_morogh_success_info()
{
	AI_Output(hero,self,"KDF_1102_SUCCESS_15_01");	//
	B_GiveInvItems(hero,self,itmi_alcohol,9);
	B_GiveInvItems(hero,self,itpl_stoneroot,8);
	B_GiveInvItems(hero,self,itpl_nightshade,7);
	AI_Output(self,hero,"KDF_1102_SUCCESS_14_02");	//
	AI_Output(self,hero,"KDF_1102_SUCCESS_14_03");	//
	MOROGH_TRUST = LOG_SUCCESS;
};

