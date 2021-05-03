
instance INFOS_MIL_7_EXIT(C_Info)
{
	nr = 999;
	condition = infos_mil_7_exit_condition;
	information = infos_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int infos_mil_7_exit_condition()
{
	return TRUE;
};

func void infos_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_MIL_7_HI(C_Info)
{
	condition = infos_mil_7_hi_condition;
	information = infos_mil_7_hi_info;
	permanent = TRUE;
	description = "Wie läufts?";
};


func int infos_mil_7_hi_condition()
{
	return TRUE;
};

func void infos_mil_7_hi_info()
{
	AI_Output(other,self,"Infos_Mil_7_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Mil_7_HI_Info_07_02");	//(ärgerlich) Wie läuft was? Hast du nichts zu tun? Dann such dir Arbeit! Es gibt mehr als genug zu tun!
	AI_StopProcessInfos(self);
};


instance INFO_MIL_7_FOODGOOD(C_Info)
{
	condition = info_mil_7_foodgood_condition;
	information = info_mil_7_foodgood_info;
	permanent = TRUE;
	description = "Du bist sicher, dass du Halvor's Frass hier essen willst?";
};


func int info_mil_7_foodgood_condition()
{
	if(b_lunchtimeathalvors() && (self.aivar[31] < b_getday()) && Npc_KnowsInfo(hero,mil_100_halvor_snaf))
	{
		return TRUE;
	};
};

func void info_mil_7_foodgood_info()
{
	AI_Output(hero,self,"Info_Mil_7_FOODGOOD_15_01");	//Du bist sicher, dass du Halvor's Frass hier essen willst?
	AI_Output(self,hero,"Info_Mil_7_FOODGOOD_07_02");	//Ähh... warum, was ist damit!
	AI_Output(hero,self,"Info_Mil_7_FOODGOOD_15_03");	//(konspirativ) Was meinst du wohl WAS für ein Fleisch in diesem Eintopf ist?
	AI_Output(self,hero,"Info_Mil_7_FOODGOOD_07_04");	//(irritiert) Ich habe nie danach gefragt?
	AI_Output(hero,self,"Info_Mil_7_FOODGOOD_15_05");	//(konspirativ) HAST Du dich jemals gefragt, warum im Aussätzigenlager zwar immer neue Leute ankommen, ab es dort trotzdem nicht voller wird?
	AI_Output(self,hero,"Info_Mil_7_FOODGOOD_07_06");	//Du meinst doch nicht etwa....
	AI_Output(hero,self,"Info_Mil_7_FOODGOOD_15_07");	//(unschuldig) Ich habe nichts gesagt! Aber bei Snaf, kann dir sowas nicht passieren!
	AI_Output(self,hero,"Info_Mil_7_FOODGOOD_07_08");	//Was für eine Sauerei! Hätte ich Halvor nicht zugetraut. Bei ihm esse ich jedenfalls nicht mehr!
	self.aivar[31] = b_getday();
	SNAF_MILITIAFRIGHTENED = SNAF_MILITIAFRIGHTENED + 1;
	if((SNAF_MILITIABRIBED + SNAF_MILITIAFRIGHTENED) >= SNAF_NEW_CUSTOMERS)
	{
		b_snaf_newcustomers();
	};
};


instance INFOS_MIL_7_JOIN(C_Info)
{
	condition = infos_mil_7_join_condition;
	information = infos_mil_7_join_info;
	permanent = TRUE;
	description = "Könnt ihr noch einen Mann gebrauchen?";
};


func int infos_mil_7_join_condition()
{
	return TRUE;
};

func void infos_mil_7_join_info()
{
	AI_Output(other,self,"Infos_Mil_4_JOIN_Info_15_01");	//Könnt ihr noch einen Mann gebrauchen?
	AI_Output(self,other,"Infos_Mil_4_JOIN_Info_07_02");	//Du willst zur Miliz? Das kannst du direkt vergessen! Wir nehmen nur fähige Kämpfer auf.
};


instance INFOS_MIL_7_STORY(C_Info)
{
	condition = infos_mil_7_story_condition;
	information = infos_mil_7_story_info;
	permanent = TRUE;
	description = "Erzähl mir was über die Orks";
};


func int infos_mil_7_story_condition()
{
	return TRUE;
};

func void infos_mil_7_story_info()
{
	AI_Output(other,self,"Infos_Mil_7_STORY_ORK_Info_15_01");	//Erzähl mir was über die Orks.
	AI_Output(self,other,"Infos_Mil_7_STORY_ORK_Info_07_02");	//Die Orks haben alle Armeen des Königs aufgrieben. Sie haben alles niedergewalzt was ihnen im Weg stand.
	AI_Output(self,other,"Infos_Mil_7_STORY_ORK_Info_07_03");	//Jetzt lassen sie uns noch ein wenig zappeln und dann sind auch wir dran!
};


instance INFOS_MIL_7_BOSS(C_Info)
{
	condition = infos_mil_7_boss_condition;
	information = infos_mil_7_boss_info;
	permanent = TRUE;
	description = "Wer hat bei euch das Sagen?";
};


func int infos_mil_7_boss_condition()
{
	var C_Npc berengar;
	var C_Npc brutus;
	berengar = Hlp_GetNpc(mil_103_berengar);
	brutus = Hlp_GetNpc(mil_121_brutus);
	if((berengar.aivar[3] == FALSE) || (brutus.aivar[3] == FALSE))
	{
		return TRUE;
	};
};

func void infos_mil_7_boss_info()
{
	var C_Npc berengar;
	var C_Npc brutus;
	AI_Output(other,self,"Infos_Mil_7_BOSS_Info_15_01");	//Wer hat bei euch  das Sagen?
	AI_Output(self,other,"Infos_Mil_7_BOSS_Info_07_02");	//Berengar, der Hauptmann. Aber mit jemanden wie dir wird er nicht reden. Ihm untersteht Leutnant Brutus.
	berengar = Hlp_GetNpc(mil_103_berengar);
	berengar.aivar[3] = TRUE;
	brutus = Hlp_GetNpc(mil_121_brutus);
	brutus.aivar[3] = TRUE;
};

func void b_assignambientinfos_mil_7(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	infos_mil_7_hi.npc = Hlp_GetInstanceID(slf);
	infos_mil_7_story.npc = Hlp_GetInstanceID(slf);
	infos_mil_7_boss.npc = Hlp_GetInstanceID(slf);
	info_mil_7_foodgood.npc = Hlp_GetInstanceID(slf);
};

