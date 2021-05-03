
instance MURDER(C_Info)
{
	nr = 10;
	condition = murder_condition;
	information = murder_info;
	description = "Dreckiger Mörder";
	permanent = TRUE;
	important = TRUE;
};


func int murder_condition()
{
	PrintDebugNpc(PD_ZS_Check,"Murder_Condition");
	if((INT_MURDERCOUNT == 1) && c_npcisinvincible(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"Murder_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void murder_info()
{
	Info_ClearChoices(murder);
	B_Say(self,other,"$YOUKILLEDMYFRIEND");
};


instance MURDER2(C_Info)
{
	nr = 10;
	condition = murder2_condition;
	information = murder2_info;
	description = "Dreckiger Mörder";
	permanent = TRUE;
	important = TRUE;
};


func int murder2_condition()
{
	PrintDebugNpc(PD_ZS_Check,"Murder_Condition");
	if((INT_MURDERCOUNT >= 2) && c_npcisinvincible(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"Murder_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void murder2_info()
{
	Info_ClearChoices(murder);
	B_Say(self,other,"$YOUKILLEDMYFRIEND");
	AI_StopProcessInfos(self);
	b_setattitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
};

func void b_assignmurderinfos(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_Check,"AssignMurderInfos");
	murder.npc = Hlp_GetInstanceID(slf);
	murder2.npc = Hlp_GetInstanceID(slf);
};

