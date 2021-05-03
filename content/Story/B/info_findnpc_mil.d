
instance INFO_FINDNPC_MIL(C_Info)
{
	nr = 900;
	condition = info_findnpc_mil_condition;
	information = info_findnpc_mil_info;
	permanent = TRUE;
	description = "Wo finde ich...";
};


func int info_findnpc_mil_condition()
{
	if(Npc_KnowsInfo(hero,infos_mil_4_boss) || Npc_KnowsInfo(hero,infos_mil_6_boss) || Npc_KnowsInfo(hero,infos_mil_7_boss) || Npc_KnowsInfo(hero,infos_mil_9_boss))
	{
		return TRUE;
	};
};

func void info_findnpc_mil_info()
{
	var C_Npc berengar;
	var C_Npc brutus;
	var C_Npc halvor;
	var C_Npc cassian;
	Info_ClearChoices(info_findnpc_mil);
	Info_AddChoice(info_findnpc_mil,DIALOG_BACK,info_findnpc_mil_back);
	berengar = Hlp_GetNpc(mil_103_berengar);
	if(berengar.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_mil,"...Berengar?",info_findnpc_mil_berengar);
	};
	brutus = Hlp_GetNpc(mil_121_brutus);
	if(brutus.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_mil,"...Brutus?",info_findnpc_mil_brutus);
	};
	halvor = Hlp_GetNpc(mil_100_halvor);
	if(halvor.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_mil,"...Halvor?",info_findnpc_mil_halvor);
	};
	cassian = Hlp_GetNpc(mil_119_cassian);
	if(cassian.aivar[3] == TRUE)
	{
		Info_AddChoice(info_findnpc_mil,"...Cassian?",info_findnpc_mil_cassian);
	};
};

func void info_findnpc_mil_back()
{
	Info_ClearChoices(info_findnpc_mil);
};

func void info_findnpc_mil_berengar()
{
	var C_Npc berengar;
	AI_Output(other,self,"Info_FindNPC_Berengar_15_00");	//Wo finde ich Berengar?
	berengar = Hlp_GetNpc(mil_103_berengar);
	if((self.guild == GIL_MILITIA) && (self.npcType == npctype_guard))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Berengar_04_01");	//Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Berengar_06_01");	//Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Berengar_07_01");	//Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Berengar_09_01");	//Tagsüber im Burginnenhof. Allerdings solltest du ihm lieber fernbleiben. Er ist leicht reizbar!
		};
	};
	Info_ClearChoices(info_findnpc_mil);
};

func void info_findnpc_mil_brutus()
{
	var C_Npc brutus;
	AI_Output(other,self,"Info_FindNPC_Brutus_15_00");	//Wo finde ich Brutus?
	brutus = Hlp_GetNpc(mil_121_brutus);
	if((self.guild == GIL_MILITIA) && (self.npcType == npctype_guard))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Brutus_04_01");	//Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Brutus_06_01");	//Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Brutus_07_01");	//Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Brutus_09_01");	//Er hängt die meiste Zeit bei der Arena rum. Er trägt auch Kämpfe aus.
		};
	};
	Info_ClearChoices(info_findnpc_mil);
};

func void info_findnpc_mil_halvor()
{
	var C_Npc halvor;
	AI_Output(other,self,"Info_FindNPC_Halvor_15_00");	//Wo finde ich Cassian?
	halvor = Hlp_GetNpc(mil_100_halvor);
	if((self.guild == GIL_MILITIA) && (self.npcType == npctype_guard))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Halvor_04_01");	//Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Halvor_06_01");	//Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Halvor_07_01");	//Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Halvor_09_01");	//Im Burghof ganz rechts ist die Küche. Das ist sein Reich.
		};
	};
	Info_ClearChoices(info_findnpc_mil);
};

func void info_findnpc_mil_cassian()
{
	var C_Npc cassian;
	AI_Output(other,self,"Info_FindNPC_Halvor_15_00");	//Wo finde ich Cassian?
	cassian = Hlp_GetNpc(mil_119_cassian);
	if((self.guild == GIL_MILITIA) && (self.npcType == npctype_guard))
	{
		if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Cassian_04_01");	//Tagsüber trainiert er im Burghof.
		}
		else if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Cassian_06_01");	//Tagsüber trainiert er im Burghof.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Cassian_07_01");	//Tagsüber trainiert er im Burghof.
		}
		else if(self.voice == 9)
		{
			AI_Output(self,other,"Info_FindNPC_MIL_Cassian_09_01");	//Tagsüber trainiert er im Burghof.
		};
	};
	Info_ClearChoices(info_findnpc_mil);
};

func void b_assignfindnpc_mil(var C_Npc slf)
{
	info_findnpc_mil.npc = Hlp_GetInstanceID(slf);
};

