
instance WRK_202_DYRIAN_EXIT(C_Info)
{
	npc = wrk_202_dyrian;
	nr = 999;
	condition = wrk_202_dyrian_exit_condition;
	information = wrk_202_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int wrk_202_dyrian_exit_condition()
{
	return TRUE;
};

func void wrk_202_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_202_DYRIAN_HI(C_Info)
{
	npc = wrk_202_dyrian;
	condition = wrk_202_dyrian_hi_condition;
	information = wrk_202_dyrian_hi_info;
	description = "Was gibt's Neues?";
	permanent = TRUE;
};


func int wrk_202_dyrian_hi_condition()
{
	return TRUE;
};

func void wrk_202_dyrian_hi_info()
{
	AI_Output(other,self,"Wrk_202_Dyrian_HI_Info_15_01");	//Was gibt's Neues?
	AI_Output(self,other,"Wrk_202_Dyrian_HI_Info_00_02");	//Der König ist hier. Im Tal meine ich, nicht im Lager.
	AI_Output(self,other,"Wrk_202_Dyrian_HI_Info_00_03");	//Ich hoffe nur er macht keinen Mist. Immerhin hat er damals die magische Barriere errichten lassen.
	AI_Output(self,other,"Wrk_202_Dyrian_HI_Info_00_04");	//Wer weiß was er diesmal vorhat...
};

