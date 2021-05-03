
instance POS_601_PASKARA_EXIT(C_Info)
{
	npc = pos_601_paskara;
	nr = 999;
	condition = pos_601_paskara_exit_condition;
	information = pos_601_paskara_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pos_601_paskara_exit_condition()
{
	return TRUE;
};

func void pos_601_paskara_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_601_PASKARA_CRAZY(C_Info)
{
	npc = pos_601_paskara;
	nr = 1;
	condition = pos_601_paskara_crazy_condition;
	information = pos_601_paskara_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_601_paskara_crazy_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void pos_601_paskara_crazy_info()
{
	if(PASKARA_CRAZY == 0)
	{
		AI_Output(self,hero,"POS_601_CRAZY_00_01");	//Ist das Leben nicht beschissen?
		PASKARA_CRAZY = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if(PASKARA_CRAZY == 1)
	{
		AI_Output(self,hero,"POS_601_CRAZY_00_02");	//Das Leben ist nur eine Qual bis zum Tod. Und danach kommt nichts mehr.
		PASKARA_CRAZY = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if(PASKARA_CRAZY == 2)
	{
		AI_Output(self,hero,"POS_601_CRAZY_00_03");	//Alles vergeht. Alles verschimmelt. Alles verdorrt. Alles leidet. Alles stirbt.
		PASKARA_CRAZY = 3;
		AI_StopProcessInfos(self);
		return;
	};
	if(PASKARA_CRAZY == 3)
	{
		AI_Output(self,hero,"POS_601_CRAZY_00_04");	//Dasein des Schmerzes    Tot geborener Mensch
		PASKARA_CRAZY = 4;
		AI_StopProcessInfos(self);
		return;
	};
	if(PASKARA_CRAZY == 4)
	{
		AI_Output(self,hero,"POS_601_CRAZY_00_05");	//Kaltes Fleisch         Geqäulter Geist       Tote Seele
		PASKARA_CRAZY = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

