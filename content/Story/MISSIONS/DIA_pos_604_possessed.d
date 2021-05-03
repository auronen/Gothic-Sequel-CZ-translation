
instance POS_604_POSSESSED_EXIT(C_Info)
{
	npc = pos_604_possessed;
	nr = 999;
	condition = pos_604_possessed_exit_condition;
	information = pos_604_possessed_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pos_604_possessed_exit_condition()
{
	return TRUE;
};

func void pos_604_possessed_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_604_POSSESSED_CRAZY(C_Info)
{
	npc = pos_604_possessed;
	nr = 1;
	condition = pos_604_possessed_crazy_condition;
	information = pos_604_possessed_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_604_possessed_crazy_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void pos_604_possessed_crazy_info()
{
	if(POS_CRAZY == 0)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_01");	//Nein, nein geht weg, geht alle weg!
		POS_CRAZY = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if(POS_CRAZY == 1)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_02");	//Lasst mich in Ruhe, verschwindet!
		POS_CRAZY = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if(POS_CRAZY == 2)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_03");	//AUUUUUUUUUU !!!!
		POS_CRAZY = 3;
		AI_StopProcessInfos(self);
		return;
	};
	if(POS_CRAZY == 3)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_04");	//Was wollt ihr denn, ich habe euch nichts getan!
		POS_CRAZY = 4;
		AI_StopProcessInfos(self);
		return;
	};
	if(POS_CRAZY == 4)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_05");	//Seid still, oh dieser schreckliche Lärm!
		POS_CRAZY = 5;
		AI_StopProcessInfos(self);
		return;
	};
	if(POS_CRAZY == 5)
	{
		AI_Output(self,hero,"POS_604_CRAZY_00_06");	//(schreit)  RUHE RUHE ICH SAGTE RUUUUUUUHHÄÄÄÄÄÄÄÄ !!!!
		POS_CRAZY = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

