
instance MIL_123_OSBERT_EXIT(C_Info)
{
	npc = mil_123_osbert;
	nr = 999;
	condition = mil_123_osbert_exit_condition;
	information = mil_123_osbert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mil_123_osbert_exit_condition()
{
	return TRUE;
};

func void mil_123_osbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_123_OSBERT_GOTCHA(C_Info)
{
	npc = mil_123_osbert;
	condition = mil_123_osbert_gotcha_condition;
	information = mil_123_osbert_gotcha_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_123_osbert_gotcha_condition()
{
	if((!Npc_HasItems(hero,itke_jail) >= 1) && !Npc_KnowsInfo(hero,mil_123_osbert_thief) && Npc_KnowsInfo(hero,pc_thief_startraining_thief))
	{
		return TRUE;
	};
};

func void mil_123_osbert_gotcha_info()
{
	AI_Output(self,hero,"MIL_123_GOTCHA_00_01");	//Halt! Was hast du hier zu suchen?
	AI_Output(hero,self,"MIL_123_GOTCHA_15_02");	//Ich seh mich nur mal um.
	AI_Output(self,hero,"MIL_123_GOTCHA_00_03");	//Umsehen- okay. Aber halt die Flossen still. Wenn du versuchst irgendwas mitgehen zu lassen, dann bekommst du Ärger.
	AI_Output(hero,self,"MIL_123_GOTCHA_15_04");	//Kein Problem, ich steck schon nichts ein...
	AI_TurnAway(hero,self);
	AI_Output(hero,self,"MIL_123_GOTCHA_15_05");	//(halblaut) ...und wenn, dann würdest du es sowieso nicht mitkriegen...
	AI_StopProcessInfos(self);
};


instance MIL_123_OSBERT_THIEF(C_Info)
{
	npc = mil_123_osbert;
	condition = mil_123_osbert_thief_condition;
	information = mil_123_osbert_thief_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_123_osbert_thief_condition()
{
	if(Npc_HasItems(hero,itke_jail))
	{
		return TRUE;
	};
};

func void mil_123_osbert_thief_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"MIL_123_THIEF_00_01");	//Hab ich dich erwischt! Du hast doch bestimmt was mitgenommen!
	B_GiveInvItems(hero,self,itke_jail,1);
	AI_Output(self,hero,"MIL_123_THIEF_00_02");	//Aha! Der Kerkerschlüssel, wußte ich es doch! Der bleibt hier! Und du verschwindest jetzt besser!
	B_LogEntry(CH1_TRAINSNEAK,"Verdammt, jetzt hat Osbert den Schlüssel. Ich sollte Gerion darüber informieren.");
	AI_StopProcessInfos(self);
};


instance MIL_123_OSBERT_HI(C_Info)
{
	npc = mil_123_osbert;
	nr = 23;
	condition = mil_123_osbert_hi_condition;
	information = mil_123_osbert_hi_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was gibt's Neues?";
};


func int mil_123_osbert_hi_condition()
{
	return TRUE;
};

func void mil_123_osbert_hi_info()
{
	AI_Output(hero,self,"MIL_123_HI_15_01");	//Was gibt's Neues?
	AI_Output(self,hero,"MIL_123_HI_07_02");	//Pass auf Bürschchen, mag ja sein das du ein Freund von Diego bist,...
	AI_Output(self,hero,"MIL_123_HI_07_03");	//...aber wenn ich dich beim Rumschnüffeln erwische, dann bist du dran!
};

