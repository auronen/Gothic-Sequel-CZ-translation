
instance PC_FIGHTER_EXIT(C_Info)
{
	npc = PC_Fighter;
	nr = 999;
	condition = pc_fighter_exit_condition;
	information = pc_fighter_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_fighter_exit_condition()
{
	return TRUE;
};

func void pc_fighter_exit_info()
{
	AI_StopProcessInfos(self);
};

