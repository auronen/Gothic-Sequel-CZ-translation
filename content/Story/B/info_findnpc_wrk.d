
instance INFO_FINDNPC_WRK(C_Info)
{
	nr = 900;
	condition = info_findnpc_wrk_condition;
	information = info_findnpc_wrk_info;
	permanent = 1;
	description = "Wo finde ich...";
};


func int info_findnpc_wrk_condition()
{
	if(Npc_KnowsInfo(hero,infos_wrk_1_boss) || Npc_KnowsInfo(hero,infos_wrk_6_boss) || Npc_KnowsInfo(hero,infos_wrk_11_boss))
	{
		return TRUE;
	};
};

func void info_findnpc_wrk_info()
{
	var C_Npc bromor;
	var C_Npc gotmar;
	Info_ClearChoices(info_findnpc_wrk);
	Info_AddChoice(info_findnpc_wrk,DIALOG_BACK,info_findnpc_wrk_back);
	bromor = Hlp_GetNpc(wrk_203_bromor);
	if(bromor.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_wrk,"...Bromor?",info_findnpc_wrk_bromor);
	};
	gotmar = Hlp_GetNpc(wrk_200_gotmar);
	if(gotmar.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_wrk,"...Gotmar?",info_findnpc_wrk_gotmar);
	};
};

func void info_findnpc_wrk_back()
{
	Info_ClearChoices(info_findnpc_wrk);
};

func void info_findnpc_wrk_bromor()
{
	var C_Npc bromor;
	AI_Output(other,self,"Info_FindNPC_Bromor_15_00");	//Wo finde ich Bromor?
	bromor = Hlp_GetNpc(wrk_203_bromor);
	if((self.guild == GIL_WORKER) && (self.npcType == npctype_ambient))
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Bromor_01_01");	//Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Bromor_02_01");	//Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Bromor_06_01");	//Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};
		if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Bromor_11_01");	//Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
		};
	};
	Info_ClearChoices(info_findnpc_wrk);
};

func void info_findnpc_wrk_gotmar()
{
	var C_Npc gotmar;
	AI_Output(other,self,"Info_FindNPC_Gotmar_15_00");	//Wo finde ich Gotmar?
	gotmar = Hlp_GetNpc(wrk_200_gotmar);
	if((self.guild == GIL_WORKER) && (self.npcType == npctype_ambient))
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_01_01");	//Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
		};
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_02_01");	//Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
		};
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_06_01");	//Vorne am Lagereingang steht die Schmiede. Folge einfach dem Lärm.
		};
		if(self.voice == 11)
		{
			AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_11_01");	//Neben dem Haupteingang ist die Schmiede. Und wo die Schmiede ist, ist der Schmied nicht fern.
		};
	};
	Info_ClearChoices(info_findnpc_wrk);
};

func void b_assignfindnpc_wrk(var C_Npc slf)
{
	info_findnpc_wrk.npc = Hlp_GetInstanceID(slf);
};

