
instance INFOS_MIL_9_EXIT(C_Info)
{
	nr = 999;
	condition = infos_mil_9_exit_condition;
	information = infos_mil_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int infos_mil_9_exit_condition()
{
	return TRUE;
};

func void infos_mil_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_MIL_9_HI(C_Info)
{
	condition = infos_mil_9_hi_condition;
	information = infos_mil_9_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_mil_9_hi_condition()
{
	return TRUE;
};

func void infos_mil_9_hi_info()
{
	AI_Output(other,self,"Infos_Mil_9_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Mil_9_HI_Info_06_02");	//(brummig) jaja, läuft gut.
};


instance INFO_MIL_9_FOODGOOD(C_Info)
{
	condition = info_mil_9_foodgood_condition;
	information = info_mil_9_foodgood_info;
	permanent = TRUE;
	description = "Übles Essen hier! Willst du dir etwas Silber verdienen?";
};


func int info_mil_9_foodgood_condition()
{
	if(b_lunchtimeathalvors() && (self.aivar[31] < b_getday()) && Npc_KnowsInfo(hero,mil_100_halvor_snaf))
	{
		return TRUE;
	};
};

func void info_mil_9_foodgood_info()
{
	AI_Output(hero,self,"Info_Mil_9_FOODGOOD_15_01");	//Übles Essen hier! Willst du dir etwas Silber verdienen?
	if(Npc_HasItems(hero,itmi_silver) >= SNAF_BRIBE_SUM)
	{
		AI_Output(self,hero,"Info_Mil_9_FOODGOOD_09_03");	//Was muss ich dafür machen?
		AI_Output(hero,self,"Info_Mil_9_FOODGOOD_15_04");	//Kauf dein Mittagessen ab morgen bei Snaf im Aussenring!
		AI_Output(self,hero,"Info_Mil_9_FOODGOOD_09_05");	//Warum nicht, dort schmeckt es zwar nicht ganz so gut, aber Silber ist Silber!
		B_GiveInvItems(hero,self,itmi_silver,SNAF_BRIBE_SUM);
		self.aivar[31] = b_getday();
		SNAF_MILITIABRIBED = SNAF_MILITIABRIBED + 1;
		if((SNAF_MILITIABRIBED + SNAF_MILITIAFRIGHTENED) >= SNAF_NEW_CUSTOMERS)
		{
			b_snaf_newcustomers();
		};
	}
	else
	{
		B_Say(self,hero,"$NotEnoughSilver");
	};
};


instance INFOS_MIL_9_JOIN(C_Info)
{
	condition = infos_mil_9_join_condition;
	information = infos_mil_9_join_info;
	description = "Könnt ihr noch einen Mann gebrauchen?";
	permanent = TRUE;
};


func int infos_mil_9_join_condition()
{
	return TRUE;
};

func void infos_mil_9_join_info()
{
	AI_Output(other,self,"Infos_Mil_9_JOIN_Info_15_01");	//Könnt ihr noch einen Mann gebrauchen?
	AI_Output(self,other,"Infos_Mil_9_JOIN_Info_06_02");	//Das solltest du dir gut überlegen. Bei uns ist Disziplin gefordert.
	AI_Output(self,other,"Infos_Mil_9_JOIN_Info_06_03");	//Selbst wenn du keine Aufgaben hast, hast du Aufgaben. Jeden Tag musst du dich einmal melden.
	AI_Output(self,other,"Infos_Mil_9_JOIN_Info_06_04");	//Wenn du das wirklich willst, dann sprich mal mit Cassian. Er ist Leutnant und kümmert sich um die Neuen.
	Info_ClearChoices(infos_mil_9_join);
};


instance INFOS_MIL_9_STORY(C_Info)
{
	condition = infos_mil_9_story_condition;
	information = infos_mil_9_story_info;
	permanent = TRUE;
	description = "Erzähl mir was über die Orks";
};


func int infos_mil_9_story_condition()
{
	return TRUE;
};

func void infos_mil_9_story_info()
{
	AI_Output(other,self,"Infos_Mil_9_STORY_Info_15_01");	//Erzähl mir was über die Orks.
	AI_Output(self,other,"Infos_Mil_9_STORY_Info_09_02");	//Man darf nicht den Fehler machen, sie zu unterschätzen. Es sind keine Wilden, gegen die wir da kämpfen.
	AI_Output(self,other,"Infos_Mil_9_STORY_Info_09_03");	//Sie haben eine Kultur die wahrscheinlich älter ist, als die der Menschen.
	AI_Output(self,other,"Infos_Mil_9_STORY_Info_09_04");	//Aber das gefährliche ist, das sie leben um zu kämpfen. Und sie kämpfen um zu sterben.
};


instance INFOS_MIL_9_BOSS(C_Info)
{
	condition = infos_mil_9_boss_condition;
	information = infos_mil_9_boss_info;
	permanent = TRUE;
	description = "Wer hat hier das Sagen?";
};


func int infos_mil_9_boss_condition()
{
	var C_Npc berengar;
	var C_Npc cassian;
	var C_Npc brutus;
	berengar = Hlp_GetNpc(mil_103_berengar);
	cassian = Hlp_GetNpc(mil_119_cassian);
	brutus = Hlp_GetNpc(mil_121_brutus);
	if((berengar.aivar[3] == FALSE) || (cassian.aivar[3] == FALSE) || (brutus.aivar[3] == FALSE))
	{
		return TRUE;
	};
};

func void infos_mil_9_boss_info()
{
	var C_Npc berengar;
	var C_Npc cassian;
	var C_Npc brutus;
	AI_Output(other,self,"Infos_Mil_9_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Mil_9_BOSS_Info_09_02");	//Hauptmann Berengar führt das Kommando. Er hat zwei Leutnants die seine Befehle weitergeben, Cassian und Brutus.
	berengar = Hlp_GetNpc(mil_103_berengar);
	berengar.aivar[3] = TRUE;
	cassian = Hlp_GetNpc(mil_119_cassian);
	cassian.aivar[3] = TRUE;
	brutus = Hlp_GetNpc(mil_121_brutus);
	brutus.aivar[3] = TRUE;
};

func void b_assignambientinfos_mil_9(var C_Npc slf)
{
	b_assignfindnpc_mil(slf);
	infos_mil_9_exit.npc = Hlp_GetInstanceID(slf);
	infos_mil_9_hi.npc = Hlp_GetInstanceID(slf);
	infos_mil_9_story.npc = Hlp_GetInstanceID(slf);
	infos_mil_9_boss.npc = Hlp_GetInstanceID(slf);
	info_mil_9_foodgood.npc = Hlp_GetInstanceID(slf);
};

