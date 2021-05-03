
instance BEG_705_BEGGAR_EXIT(C_Info)
{
	npc = beg_705_beggar;
	nr = 999;
	condition = beg_705_beggar_exit_condition;
	information = beg_705_beggar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int beg_705_beggar_exit_condition()
{
	return TRUE;
};

func void beg_705_beggar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_705_BEGGAR_BEG(C_Info)
{
	npc = beg_705_beggar;
	nr = 1;
	condition = beg_705_beggar_beg_condition;
	information = beg_705_beggar_beg_info;
	important = TRUE;
	permanent = FALSE;
};


func int beg_705_beggar_beg_condition()
{
	if(Npc_GetDistToNpc(self,hero) <= 600)
	{
		return TRUE;
	};
};

func void beg_705_beggar_beg_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"BEG_705_BEG_00_01");	//Hey, du hast doch bestimmt ein bisschen Silber für mich...!?
	Info_ClearChoices(beg_705_beggar_beg);
	Info_AddChoice(beg_705_beggar_beg,"Nein, verpiss dich!",beg_705_beggar_beg_no);
	if(Npc_HasItems(hero,itmi_silver) >= 1)
	{
		Info_AddChoice(beg_705_beggar_beg,"(1 Silbersück geben)",beg_705_beggar_beg_one);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 5)
	{
		Info_AddChoice(beg_705_beggar_beg,"(5 Silberstücke geben)",beg_705_beggar_beg_five);
	};
	Info_AddChoice(beg_705_beggar_beg,"Ich habe gerade leider kein Silber dabei",beg_705_beggar_beg_sorry);
};

func void beg_705_beggar_beg_no()
{
	AI_Output(hero,self,"BEG_700_BEG_NO_15_01");	//Nein, verpiss dich!
	Info_ClearChoices(beg_705_beggar_beg);
	AI_StopProcessInfos(self);
};

func void beg_705_beggar_beg_five()
{
	AI_Output(hero,self,"BEG_700_BEG_FIVE_15_01");	//Hier, nimm diese 5 Silberstücke.
	B_GiveInvItems(hero,self,itmi_silver,5);
	AI_Output(self,hero,"BEG_700_BEG_FIVE_00_02");	//Danke Mann, vielleicht können wir Bettler dir ja auch mal helfen...
	BEGGARS_SECRETS = BEGGARS_SECRETS + 1;
	Info_ClearChoices(beg_705_beggar_beg);
	AI_StopProcessInfos(self);
};

func void beg_705_beggar_beg_sorry()
{
	AI_Output(hero,self,"BEG_700_BEG_SORRY_15_01");	//Ich habe gerade leider kein Silber dabei.
	AI_StopProcessInfos(self);
};

func void beg_705_beggar_beg_one()
{
	AI_Output(hero,self,"BEG_700_BEG_ONE_15_01");	//Hier, nimm dieses Silberstück.
	B_GiveInvItems(hero,self,itmi_silver,1);
	AI_Output(self,hero,"BEG_700_BEG_ONE_00_02");	//Damit hast du mir wirklich geholfen.
	Info_ClearChoices(beg_705_beggar_beg);
	AI_StopProcessInfos(self);
};


instance BEG_705_BEGGAR_BEG2(C_Info)
{
	npc = beg_705_beggar;
	nr = 1;
	condition = beg_705_beggar_beg2_condition;
	information = beg_705_beggar_beg2_info;
	important = TRUE;
	permanent = TRUE;
};


func int beg_705_beggar_beg2_condition()
{
	if(c_npcisinvincible(hero) && Npc_KnowsInfo(hero,beg_705_beggar_beg))
	{
		return TRUE;
	};
};

func void beg_705_beggar_beg2_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"BEG_705_BEG_00_01");	//Hey, du hast doch bestimmt ein bisschen Silber für mich...!?
	Info_ClearChoices(beg_705_beggar_beg);
	Info_AddChoice(beg_705_beggar_beg2,"Nein, verpiss dich!",beg_705_beggar_beg_no);
	if(Npc_HasItems(hero,itmi_silver) >= 1)
	{
		Info_AddChoice(beg_705_beggar_beg2,"(1 Silbersück geben)",beg_705_beggar_beg_one);
	};
	if(Npc_HasItems(hero,itmi_silver) >= 5)
	{
		Info_AddChoice(beg_705_beggar_beg2,"(5 Silberstücke geben)",beg_705_beggar_beg_five);
	};
	Info_AddChoice(beg_705_beggar_beg2,"Ich habe gerade leider kein Silber dabei",beg_705_beggar_beg_sorry);
};

