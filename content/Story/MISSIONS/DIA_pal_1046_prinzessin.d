
instance PAL_1046_PRINZESSIN_EXIT(C_Info)
{
	npc = pal_1046_prinzessin;
	nr = 999;
	condition = pal_1046_prinzessin_exit_condition;
	information = pal_1046_prinzessin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pal_1046_prinzessin_exit_condition()
{
	return TRUE;
};

func void pal_1046_prinzessin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance PAL_1046_PRINZESSIN_HI(C_Info)
{
	npc = pal_1046_prinzessin;
	nr = 1;
	condition = pal_1046_prinzessin_hi_condition;
	information = pal_1046_prinzessin_hi_info;
	important = TRUE;
	permanent = FALSE;
};


func int pal_1046_prinzessin_hi_condition()
{
	return TRUE;
};

func void pal_1046_prinzessin_hi_info()
{
	AI_Output(self,hero,"PAL_1046_HI_16_01");	//
	AI_Output(self,hero,"PAL_1046_HI_16_02");	//
	AI_Output(self,hero,"PAL_1046_HI_16_03");	//
	AI_Output(hero,self,"PAL_1046_HI_15_04");	//
	AI_Output(self,hero,"PAL_1046_HI_16_05");	//
};


instance PAL_1046_PRINZESSIN_BATH(C_Info)
{
	npc = pal_1046_prinzessin;
	nr = 2;
	condition = pal_1046_prinzessin_bath_condition;
	information = pal_1046_prinzessin_bath_info;
	important = FALSE;
	permanent = FALSE;
	description = "Geh baden!";
};


func int pal_1046_prinzessin_bath_condition()
{
	return TRUE;
};

func void pal_1046_prinzessin_bath_info()
{
	AI_Output(hero,self,"PAL_1046_BATH_15_01");	//
	AI_Output(self,hero,"PAL_1046_BATH_16_02");	//
	AI_Output(self,hero,"PAL_1046_BATH_16_03");	//
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BATH");
};


instance PAL_1046_PRINZESSIN_LOVE(C_Info)
{
	npc = pal_1046_prinzessin;
	nr = 1;
	condition = pal_1046_prinzessin_love_condition;
	information = pal_1046_prinzessin_love_info;
	important = FALSE;
	permanent = FALSE;
	description = "Zieh dich aus und leg dich hin!";
};


func int pal_1046_prinzessin_love_condition()
{
	return TRUE;
};

func void pal_1046_prinzessin_love_info()
{
	AI_Output(hero,self,"PAL_1046_LOVE_15_01");	//
	AI_Output(self,hero,"PAL_1046_LOVE_16_02");	//
	AI_Output(hero,self,"PAL_1046_LOVE_15_03");	//
};


instance PAL_1046_PRINZESSIN_SUICIDE(C_Info)
{
	npc = pal_1046_prinzessin;
	nr = 3;
	condition = pal_1046_prinzessin_suicide_condition;
	information = pal_1046_prinzessin_suicide_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du bist über, Bitch! ";
};


func int pal_1046_prinzessin_suicide_condition()
{
	return TRUE;
};

func void pal_1046_prinzessin_suicide_info()
{
	AI_Output(hero,self,"PAL_1046_SUICIDE_15_01");	//
	AI_Output(self,hero,"PAL_1046_SUICIDE_16_02");	//
	AI_Output(self,hero,"PAL_1046_SUICIDE_16_03");	//
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUICIDE");
};

