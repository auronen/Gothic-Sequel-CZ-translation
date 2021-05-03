
instance BEG_706_BEGGAR_EXIT(C_Info)
{
	npc = beg_706_beggar;
	nr = 999;
	condition = beg_706_beggar_exit_condition;
	information = beg_706_beggar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int beg_706_beggar_exit_condition()
{
	return TRUE;
};

func void beg_706_beggar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_706_BEGGAR_BEG(C_Info)
{
	npc = beg_706_beggar;
	nr = 1;
	condition = beg_706_beggar_beg_condition;
	information = beg_706_beggar_beg_info;
	important = TRUE;
	permanent = FALSE;
};


func int beg_706_beggar_beg_condition()
{
	if(Npc_GetDistToNpc(self,hero) <= 600)
	{
		return TRUE;
	};
};

func void beg_706_beggar_beg_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"BEG_706_BEG_00_01");	//Silber für einen Armen, Silber für einen Armen!
	Info_ClearChoices(beg_706_beggar_beg);
	Info_AddChoice(beg_706_beggar_beg,"Nein, verpiss dich!",beg_706_beggar_beg_no);
	if(Npc_HasItems(hero,itmi_silver) >= 1)
	{
		Info_AddChoice(beg_706_beggar_beg,"(1 Silbersück geben)",beg_706_beggar_beg_one);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 5)
	{
		Info_AddChoice(beg_706_beggar_beg,"(5 Silberstücke geben)",beg_706_beggar_beg_five);
	};
	Info_AddChoice(beg_706_beggar_beg,"Ich habe gerade leider kein Silber dabei",beg_706_beggar_beg_sorry);
};

func void beg_706_beggar_beg_no()
{
	AI_Output(hero,self,"BEG_706_BEG_NO_15_01");	//Nein, verpiss dich!
	BEGGARS_SECRETS = BEGGARS_SECRETS - 1;
	AI_StopProcessInfos(self);
};

func void beg_706_beggar_beg_five()
{
	AI_Output(hero,self,"BEG_706_BEG_FIVE_15_01");	//Vielleicht bringen dich diese 5 Silberstücke weiter.
	B_GiveInvItems(hero,self,itmi_silver,5);
	AI_Output(self,hero,"BEG_706_BEG_FIVE_00_02");	//Überaus großzügig, vielen Dank. Vielleicht bringt dich diese Gabe auch weiter...
	BEGGARS_SECRETS = BEGGARS_SECRETS + 1;
	Info_ClearChoices(beg_706_beggar_beg);
	AI_StopProcessInfos(self);
};

func void beg_706_beggar_beg_sorry()
{
	AI_Output(hero,self,"BEG_706_BEG_SORRY_15_01");	//Ich habe gerade leider kein Silber dabei.
	AI_StopProcessInfos(self);
};

func void beg_706_beggar_beg_one()
{
	AI_Output(hero,self,"BEG_706_BEG_ONE_15_01");	//Hier, nimm dieses Silberstück.
	B_GiveInvItems(hero,self,itmi_silver,1);
	AI_Output(self,hero,"BEG_706_BEG_ONE_00_02");	//Danke. Vielleicht bekomme ich dafür sogar etwas zu Essen...
	Info_ClearChoices(beg_706_beggar_beg);
	AI_StopProcessInfos(self);
};


instance BEG_706_BEGGAR_BEG2(C_Info)
{
	npc = beg_706_beggar;
	nr = 1;
	condition = beg_706_beggar_beg2_condition;
	information = beg_706_beggar_beg2_info;
	important = TRUE;
	permanent = TRUE;
};


func int beg_706_beggar_beg2_condition()
{
	if(c_npcisinvincible(hero) && Npc_KnowsInfo(hero,beg_706_beggar_beg))
	{
		return TRUE;
	};
};

func int beg_706_beggar_beg2_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"BEG_706_BEG_00_01");	//Silber für einen Armen, Silber für einen Armen!
	Info_ClearChoices(beg_706_beggar_beg);
	Info_AddChoice(beg_706_beggar_beg2,"Nein, verpiss dich!",beg_706_beggar_beg_no);
	if(Npc_HasItems(hero,itmi_silver) >= 1)
	{
		Info_AddChoice(beg_706_beggar_beg2,"(1 Silbersück geben)",beg_706_beggar_beg_one);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 5)
	{
		Info_AddChoice(beg_706_beggar_beg2,"(5 Silberstücke geben)",beg_706_beggar_beg_five);
	};
	Info_AddChoice(beg_706_beggar_beg2,"Ich habe gerade leider kein Silber dabei",beg_706_beggar_beg_sorry);
};

