
instance PC_MAGE_EXIT(C_Info)
{
	npc = PC_Mage;
	nr = 999;
	condition = pc_mage_exit_condition;
	information = pc_mage_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_mage_exit_condition()
{
	return TRUE;
};

func void pc_mage_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PC_MAGE_WELCOME(C_Info)
{
	npc = PC_Mage;
	nr = 1;
	condition = pc_mage_welcome_condition;
	information = pc_mage_welcome_info;
	important = TRUE;
	permanent = FALSE;
};


func int pc_mage_welcome_condition()
{
	return TRUE;
};

func void pc_mage_welcome_info()
{
	AI_Output(self,hero,"PC_Mage_WELCOME_15_01");	//
	AI_Output(hero,self,"PC_Mage_WELCOME_15_02");	//
	AI_Output(self,hero,"PC_Mage_WELCOME_02_03");	//
	AI_Output(hero,self,"PC_Mage_WELCOME_15_04");	//
	AI_Output(hero,self,"PC_Mage_WELCOME_15_05");	//
	AI_Output(self,hero,"PC_Mage_WELCOME_02_06");	//
	AI_Output(hero,self,"PC_Mage_WELCOME_15_07");	//
	AI_Output(self,hero,"PC_Mage_WELCOME_02_08");	//
};


instance PC_MAGE_DEMONS(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = pc_mage_demons_condition;
	information = pc_mage_demons_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was weißt du über die Dämonen? ";
};


func int pc_mage_demons_condition()
{
	if(Npc_KnowsInfo(hero,pc_mage_welcome))
	{
		return TRUE;
	};
};

func void pc_mage_demons_info()
{
	AI_Output(hero,self,"PC_Mage_DEMONS_15_01");	//
	AI_Output(self,hero,"PC_Mage_DEMONS_02_02");	//
	AI_Output(hero,self,"PC_Mage_DEMONS_15_03");	//
	AI_Output(self,hero,"PC_Mage_DEMONS_02_04");	//
	AI_Output(hero,self,"PC_Mage_DEMONS_15_05");	//
	AI_Output(self,hero,"PC_Mage_DEMONS_02_06");	//
	AI_Output(hero,self,"PC_Mage_DEMONS_15_07");	//
};


instance PC_MAGE_KDF(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = pc_mage_kdf_condition;
	information = pc_mage_kdf_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich muss mit den Feuermagiern sprechen";
};


func int pc_mage_kdf_condition()
{
	if(Npc_KnowsInfo(hero,pc_mage_welcome))
	{
		return TRUE;
	};
};

func void pc_mage_kdf_info()
{
	AI_Output(hero,self,"PC_Mage_KDF_15_01");	//
	AI_Output(self,hero,"PC_Mage_KDF_02_02");	//
	AI_Output(hero,self,"PC_Mage_KDF_15_03");	//
	AI_Output(self,hero,"PC_Mage_KDF_02_04");	//
	AI_Output(hero,self,"PC_Mage_KDF_15_05");	//
	AI_Output(self,hero,"PC_Mage_KDF_02_06");	//
	AI_Output(self,hero,"PC_Mage_KDF_02_07");	//
};


instance PC_MAGE_TODO(C_Info)
{
	npc = PC_Mage;
	nr = 3;
	condition = pc_mage_todo_condition;
	information = pc_mage_todo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann werde ich mir dieses Recht verschaffen";
};


func int pc_mage_todo_condition()
{
	if(Npc_KnowsInfo(hero,pc_mage_kdf))
	{
		return TRUE;
	};
};

func void pc_mage_todo_info()
{
	AI_Output(hero,self,"PC_Mage_TODO_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_02_02");	//
	AI_Output(self,hero,"PC_Mage_TODO_02_03");	//
	AI_Output(self,hero,"PC_Mage_TODO_02_04");	//
	AI_Output(self,hero,"PC_Mage_TODO_02_05");	//
	Info_ClearChoices(pc_mage_todo);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(pc_mage_todo,"Erster Kreis der Magie",pc_mage_todo_mage_1);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(pc_mage_todo,"Zweiter Kreis der Magie",pc_mage_todo_mage_2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1)
	{
		Info_AddChoice(pc_mage_todo,"Alchimie",pc_mage_todo_alchemy);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) >= 1)
	{
		Info_AddChoice(pc_mage_todo,"Runen herstellen",pc_mage_todo_thaumaturgy);
	};
	if(!(Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) >= 1) && !(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1) && !(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		Info_AddChoice(pc_mage_todo,"Kein magisches Talent",pc_mage_todo_nothing);
	};
};

func void pc_mage_todo_mage_1()
{
	AI_Output(hero,self,"PC_Mage_TODO_Mage_1_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_Mage_1_02_02");	//
	MAGE_TRUST = MAGE_TRUST + 1;
};

func void pc_mage_todo_mage_2()
{
	AI_Output(hero,self,"PC_Mage_TODO_Mage_2_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_Mage_2_02_02");	//
	MAGE_TRUST = MAGE_TRUST + 2;
};

func void pc_mage_todo_alchemy()
{
	AI_Output(hero,self,"PC_Mage_TODO_Alchemy_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_Alchemy_02_02");	//
	MAGE_TRUST = MAGE_TRUST + 1;
};

func void pc_mage_todo_thaumaturgy()
{
	AI_Output(hero,self,"PC_Mage_TODO_THAUMATURGY_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_THAUMATURGY_02_02");	//
	MAGE_TRUST = MAGE_TRUST + 1;
};

func void pc_mage_todo_nothing()
{
	AI_Output(hero,self,"PC_Mage_TODO_Nothing_15_01");	//
	AI_Output(self,hero,"PC_Mage_TODO_Nothing_02_02");	//
};


instance PC_MAGE_ABOUT(C_Info)
{
	npc = PC_Mage;
	nr = 2;
	condition = pc_mage_about_condition;
	information = pc_mage_about_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und, wie geht's jetzt weiter? (WORKINPROGRESS)";
};


func int pc_mage_about_condition()
{
	if(Npc_KnowsInfo(hero,pc_mage_todo))
	{
		return TRUE;
	};
};

func void pc_mage_about_info()
{
	AI_Output(hero,self,"PC_Mage_ABOUT_15_01");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_02_02");	//
	Info_ClearChoices(pc_mage_about);
	Info_AddChoice(pc_mage_about,"Morogh (Alchimist)",pc_mage_about_morogh);
	Info_AddChoice(pc_mage_about,"Nereus (Magietheoretiker)",pc_mage_about_nereus);
	Info_AddChoice(pc_mage_about,"Feoras (Runen Hersteller)",pc_mage_about_feoras);
	Info_AddChoice(pc_mage_about,DIALOG_BACK,pc_mage_about_back);
};

func void pc_mage_about_back()
{
	Info_ClearChoices(pc_mage_about);
};

func void pc_mage_about_morogh()
{
	AI_Output(hero,self,"PC_Mage_ABOUT_Morogh_15_01");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Morogh_02_02");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Morogh_02_03");	//
};

func void pc_mage_about_nereus()
{
	AI_Output(hero,self,"PC_Mage_ABOUT_Nerues_15_01");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Nerues_02_02");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Nerues_02_03");	//
};

func void pc_mage_about_feoras()
{
	AI_Output(hero,self,"PC_Mage_ABOUT_Feoras_15_01");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Feoras_02_02");	//
	AI_Output(self,hero,"PC_Mage_ABOUT_Feoras_02_03");	//
};

