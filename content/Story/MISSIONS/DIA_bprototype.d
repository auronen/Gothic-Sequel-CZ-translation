
instance DIA_PROTOTYPE1_EXIT(C_Info)
{
	npc = bprototype;
	nr = 3998;
	condition = dia_prototype1_exit_condition;
	information = dia_prototype1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_prototype1_exit_condition()
{
	return 1;
};

func void dia_prototype1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PROTOTYPE1_SETTOFOLLOW(C_Info)
{
	npc = aprototype;
	nr = 3998;
	condition = dia_prototype1_settofollow_condition;
	information = dia_prototype1_settofollow_info;
	permanent = 1;
	description = "HIermit läuft der Nsc mir nach";
};


func int dia_prototype1_settofollow_condition()
{
	return 1;
};

func void rtn_prototype1_settofollow_3998()
{
	PrintDebugNpc(PD_ZS_FRAME,"Prototype1_SetToFollow");
	self.aivar[27] = 1;
	STRING_STAYWP = Npc_GetNearestWP(self);
	TA_FollowPC(0,0,12,0,STRING_STAYWP);
	TA_FollowPC(12,0,0,0,STRING_STAYWP);
};

func void dia_prototype1_settofollow_info()
{
	Npc_ExchangeRoutine(self,"PROTOTYPE1_SETTOFOLLOW");
};


instance DIA_PROTOTYPE1_SETTOTA_STAY(C_Info)
{
	npc = bprototype;
	nr = 3999;
	condition = dia_prototype1_settota_stay_condition;
	information = dia_prototype1_settota_stay_info;
	permanent = 1;
	description = "DIA_Prototype1_SetToTA_Stay";
};


func int dia_prototype1_settota_stay_condition()
{
	return 1;
};

func void rtn_prototype1_setwaitingwp_3999()
{
	PrintDebugNpc(PD_ZS_FRAME,"Prototype1_SetWaitingWP");
	PrintDebugNpc(PD_ZS_FRAME,STRING_STAYWP);
	TA_Stand(0,0,12,0,STRING_STAYWP);
	TA_Stand(12,0,0,0,STRING_STAYWP);
};

func void dia_prototype1_settota_stay_info()
{
	STRING_STAYWP = Npc_GetNearestWP(self);
	self.aivar[27] = 0;
	PrintDebugNpc(PD_ZS_FRAME,STRING_STAYWP);
	B_Say(self,other,"DIA_PROTOTYPE_SETTOTASTAY_11_00");
	Npc_ExchangeRoutine(self,"PROTOTYPE1_SETWAITINGWP");
};

