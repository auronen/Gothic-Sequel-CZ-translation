// *************************************************************************
// 									FIND NPC
// *************************************************************************

INSTANCE Info_FindNPC_WRK(C_INFO)
{
	nr			= 900;
	condition	= Info_FindNPC_WRK_Condition;
	information	= Info_FindNPC_WRK_Info;
	permanent	= 1;
//	description = "Wo finde ich...";
	description = "Kde najdu...";
};                       

FUNC INT Info_FindNPC_WRK_Condition()
{
	if ((Npc_KnowsInfo (hero,Infos_Wrk_1_BOSS))
	||(Npc_KnowsInfo (hero,Infos_Wrk_6_BOSS))
	||(Npc_KnowsInfo (hero,Infos_Wrk_11_BOSS)) ) // Info erscheint erst, wenn der Spieler den Namen schon mal gehört hat
	{
		return TRUE;
	};
};
FUNC VOID Info_FindNPC_WRK_Info()
{
	Info_ClearChoices(Info_FindNPC_WRK);
	Info_AddChoice(Info_FindNPC_WRK, DIALOG_BACK, Info_FindNPC_WRK_BACK);

	
	VAR C_NPC Bromor;		Bromor	= Hlp_GetNpc(WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_WRK, "...Bromor?", Info_FindNPC_WRK_Bromor);
		Info_AddChoice(Info_FindNPC_WRK, "...Bromora?", Info_FindNPC_WRK_Bromor);
	};
	VAR C_NPC Gotmar;		Gotmar	= Hlp_GetNpc(WRK_200_Gotmar);
	if (Gotmar.aivar[AIV_FINDABLE] == TRUE)
	{
//		Info_AddChoice(Info_FindNPC_WRK, "...Gotmar?", Info_FindNPC_WRK_Gotmar);
		Info_AddChoice(Info_FindNPC_WRK, "...Gotmara?", Info_FindNPC_WRK_Gotmar);
	};
	
};

FUNC VOID Info_FindNPC_WRK_BACK()
{
	Info_ClearChoices(Info_FindNPC_WRK);
};

// **********************
// 			Bromor
// **********************

FUNC VOID Info_FindNPC_WRK_Bromor()
{
//	AI_Output(other,self,"Info_FindNPC_Bromor_15_00"); //Wo finde ich Bromor?
	AI_Output(other,self,"Info_FindNPC_Bromor_15_00"); //Kde najdu Bromora?

	VAR C_NPC Bromor;		Bromor	= Hlp_GetNpc(WRK_203_Bromor);
	
	
	
		if (self.guild 	 == GIL_WORKER)
		&& (self.npctype == NPCTYPE_AMBIENT)
		{
			if (self.voice == 1)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_01_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_01_01"); //Tam, kde se pracuje. Přes den postává poblíž pódia.
			};
			if (self.voice == 2)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_02_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_02_01"); //Tam, kde se pracuje. Přes den postává poblíž pódia.
			};
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_06_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_06_01"); //Tam, kde se pracuje. Přes den postává poblíž pódia.
			};
			if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_11_01"); //Dort wo gearbeitet wird. Er steht tagsüber in der Nähe der Bühne.
				AI_Output(self,other,"Info_FindNPC_WRK_Bromor_11_01"); //Tam, kde se pracuje. Přes den postává poblíž pódia.
			};
			
		};

	Info_ClearChoices(Info_FindNPC_WRK);
};

FUNC VOID Info_FindNPC_WRK_Gotmar()
{
//	AI_Output(other,self,"Info_FindNPC_Gotmar_15_00"); //Wo finde ich Gotmar?
	AI_Output(other,self,"Info_FindNPC_Gotmar_15_00"); //Kde najdu Gotmara?

	VAR C_NPC Gotmar;		Gotmar	= Hlp_GetNpc(WRK_200_Gotmar);
	
	
	
		if (self.guild 	 == GIL_WORKER)
		&& (self.npctype == NPCTYPE_AMBIENT)
		{
			if (self.voice == 1)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_01_01"); //Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_01_01"); //Když přijdeš do tábora, kovárna stojí na pravo od brány. Gotmar v ní pracuje celý den.
			};
			if (self.voice == 2)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_02_01"); //Wenn du ins Lager reinkommst, ist auf der rechten Seite die Schmiede. Gotmar ist dort den ganzen Tag beschäftigt.
				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_02_01"); //Když přijdeš do tábora, kovárna stojí na pravo od brány. Gotmar v ní pracuje celý den.
			};
			if (self.voice == 6)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_06_01"); //Vorne am Lagereingang steht die Schmiede. Folge einfach dem Lärm.
				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_06_01"); //Před branou do tábora stojí kovárna. Jednoduše jdi za hlukem.
			};
			if (self.voice == 11)
			{
//				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_11_01"); //Neben dem Haupteingang ist die Schmiede. Und wo die Schmiede ist, ist der Schmied nicht fern. 
				AI_Output(self,other,"Info_FindNPC_WRK_Gotmar_11_01"); //Vedle hlavního vchodu do tábora stojí kovárna. A kde je kovárna, kovář nebude daleko.
			};
		};

	Info_ClearChoices(Info_FindNPC_WRK);
};
// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignFindNpc_WRK (VAR C_NPC slf)
{
	Info_FindNPC_WRK.npc = Hlp_GetInstanceID(slf);
};
