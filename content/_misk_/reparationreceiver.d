
instance REPARATIONRECEIVER(C_Info)
{
	nr = 10;
	condition = reparationreceiver_condition;
	information = reparationreceiver_info;
	description = "Reparationsauftragsempfänger";
	permanent = TRUE;
	important = TRUE;
};


func int reparationreceiver_condition()
{
	PrintDebugNpc(PD_ZS_Check,"ReparationReceiver_Condition");
	if(INT_REPARATIONRUNNING && c_npcisinvincible(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"ReparationReceiver_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void reparationreceiver_info()
{
	Info_ClearChoices(reparation);
	B_Say(self,other,"$WHATDOYOUWANT");
	if(Npc_HasItems(other,ItFo_Potion_Health_01) >= 5)
	{
		Info_AddChoice(reparationreceiver,"Ich bin geschickt worden, dir Heiltränke zu überreichen",reparationreceiver_lieb);
	}
	else
	{
		Info_AddChoice(reparationreceiver,"Keine fünf Heiltränke, zum Entschuldigen",reparationreceiver_nogiveaway);
	};
};

func void reparationreceiver_lieb()
{
	B_Say(other,self,"$IWANTTOREGRET");
	CreateInvItems(self,ItFo_Potion_Health_01,5);
	Npc_RemoveInvItems(other,ItFo_Potion_Health_01,5);
	AI_StopProcessInfos(self);
};

func void reparationreceiver_nogiveaway()
{
	AI_StopProcessInfos(self);
};

func void b_assignreparationreceiver(var C_Npc this)
{
	PrintDebugNpc(PD_ZS_Check,"ReparationReceiver_Condition");
	reparationreceiver.npc = Hlp_GetInstanceID(this);
};

