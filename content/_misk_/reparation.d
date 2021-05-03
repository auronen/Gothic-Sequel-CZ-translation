
instance REPARATION(C_Info)
{
	nr = 10;
	condition = reparation_condition;
	information = reparation_info;
	description = "Reparationsauftragslösung";
	permanent = TRUE;
	important = TRUE;
};


func int reparation_condition()
{
	PrintDebugNpc(PD_ZS_Check,"Reparation_Condition");
	if(INT_REPARATIONRUNNING && c_npcisinvincible(hero) && b_reperationdone())
	{
		PrintDebugNpc(PD_ZS_Check,"Reparation_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void reparation_info()
{
	Info_ClearChoices(reparation);
	B_Say(self,other,"$REGRETACCEPTED");
	INT_MURDERCOUNT = 0;
	AI_StopProcessInfos(self);
};

func void b_assignreparationdialog(var C_Npc this)
{
	PrintDebugNpc(PD_ZS_Check,"AssignReparationInfos");
	reparation.npc = Hlp_GetInstanceID(this);
};

