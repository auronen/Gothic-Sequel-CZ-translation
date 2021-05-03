
instance INFOS_MIL_4_EXIT(C_Info)
{
	nr = 999;
	condition = infos_mil_4_exit_condition;
	information = infos_mil_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int infos_mil_4_exit_condition()
{
	return TRUE;
};

func void infos_mil_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_MIL_4_HI(C_Info)
{
	condition = infos_mil_4_hi_condition;
	information = infos_mil_4_hi_info;
	permanent = TRUE;
	description = "Wie läufts?";
};


func int infos_mil_4_hi_condition()
{
	return TRUE;
};

func void infos_mil_4_hi_info()
{
	AI_Output(other,self,"Infos_Mil_4_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Mil_4_HI_Info_04_02");	//Es ist immer dasselbe Spiel Jungchen. Auf der einen Seite stehen wir, auf der anderen der Feind.
	AI_Output(self,other,"Infos_Mil_4_HI_Info_04_03");	//Manchmal verlieren wir, manchmal gewinnen wir.
};


instance INFO_MIL_4_FOODGOOD(C_Info)
{
	condition = info_mil_4_foodgood_condition;
	information = info_mil_4_foodgood_info;
	permanent = TRUE;
	description = "Wie schmeckt das Essen hier?";
};


func int info_mil_4_foodgood_condition()
{
	if(b_lunchtimeathalvors() && !TALAMON_KNOWSTINKINGSALT && Npc_KnowsInfo(hero,mil_100_halvor_snaf))
	{
		return TRUE;
	};
};

func void info_mil_4_foodgood_info()
{
	AI_Output(hero,self,"Info_Mil_4_FOODGOOD_15_01");	//Wie schmeckt das Essen hier?
	AI_Output(self,hero,"Info_Mil_4_FOODGOOD_04_02");	//Halvors Frass kann man wirklich essen.
	AI_Output(self,hero,"Info_Mil_4_FOODGOOD_04_03");	//Aber nur, wenn nicht wieder einer der Jungs hier sich den üblichen Spass erlaubt!
	AI_Output(hero,self,"Info_Mil_4_FOODGOOD_15_04");	//Was für einen Spass?
	AI_Output(self,hero,"Info_Mil_4_FOODGOOD_04_05");	//Sie gehen zu Talamon, dem Alchemiesten und besorgen sich Müffelsalz.
	AI_Output(self,hero,"Info_Mil_4_FOODGOOD_04_06");	//Dann wenn Halvor nicht hinsieht, ab damit in den Kochkessel, und rein zufällig hat dann der Witzbold am diesem Tag überhaupt keinen Hunger!
	B_LogEntry(CH1_LEARNCOOKING,"Es ist schon einmal vorgekommen, dass ein Milizsoldat Halvor's Fleischeintopf aus Spass ungeniesbar machte. Talamon der Alchemist, hat offensichtlich eine ganze Auswahl an Pülverchen für alle möglichen Zwecke!");
	TALAMON_KNOWSTINKINGSALT = TRUE;
};


instance INFOS_MIL_4_JOIN(C_Info)
{
	condition = infos_mil_4_join_condition;
	information = infos_mil_4_join_info;
	permanent = TRUE;
	description = "Könnt ihr noch einen Mann gebrauchen?";
};


func int infos_mil_4_join_condition()
{
	return TRUE;
};

func void infos_mil_4_join_info()
{
	var C_Npc berengar;
	AI_Output(other,self,"Infos_Mil_4_JOIN_Info_15_01");	//Könnt ihr noch einen Mann gebrauchen?
	AI_Output(self,other,"Infos_Mil_4_JOIN_Info_04_02");	//Das obliegt nicht meiner Entscheidung, Jungchen.
	AI_Output(self,other,"Infos_Mil_4_JOIN_Info_04_03");	//Unser Hauptmann Berengar entscheidet das. Aber ich kann dir sagen, was die Bedingungen für eine Aufnahme sind.
	berengar = Hlp_GetNpc(mil_103_berengar);
	berengar.aivar[3] = TRUE;
	Info_ClearChoices(infos_mil_4_join);
	Info_AddChoice(infos_mil_4_join,DIALOG_BACK,infos_mil_4_join_back);
	Info_AddChoice(infos_mil_4_join,"Was sind die Bedingungen?",infos_mil_4_join_condi);
};

func void infos_mil_4_join_back()
{
	Info_ClearChoices(infos_mil_4_join);
};

func void infos_mil_4_join_condi()
{
	AI_Output(other,self,"Infos_Mil_4_JOIN_CONDI_Info_15_01");	//Was sind die Bedingungen?
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_02");	//Es gibt drei Bedingungen, die ein Mann erfüllen muss, um Rekrut bei der Miliz zu werden.
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_03");	//Zunächst musst den Umgang mit einer Waffe beherrschen und einen kräftigen Arm haben. Vorher brauchst du nicht mal mit jemanden darüber sprechen.
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_04");	//Wenn du dich dann zur Miliz meldest, wirst du zur Wache eingeteilt. Das kann alles mögliche bedeuten.
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_05");	//Entweder ein Tor bewachen, Patrouillie gehen, auf der Pallisade stehen, es gibt einen ganzen Haufen Arbeit mit der du beschäftigt werden kannst.
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_06");	//Schlägt dein Herz danach immer noch für die Miliz, dann darfst du gegen einen von uns antreten. Wenn du danach noch stehst, bist du dabei.
	AI_Output(self,other,"Infos_Mil_4_JOIN_CONDI_Info_04_07");	//Aber denke daran, wenn du zur Miliz gehörst, dann ist Schluss mit dem faulen Leben. Dann ist Disziplin gefordert! Jeden Tag Meldung machen!
	Info_ClearChoices(infos_mil_4_join);
};


instance INFOS_MIL_4_STORY(C_Info)
{
	condition = infos_mil_4_story_condition;
	information = infos_mil_4_story_info;
	permanent = TRUE;
	description = "Erzähl mir was über die Orks";
};


func int infos_mil_4_story_condition()
{
	return TRUE;
};

func void infos_mil_4_story_info()
{
	AI_Output(other,self,"Infos_Mil_4_STORY_Info_15_01");	//Erzähl mir was über die Orks.
	AI_Output(self,other,"Infos_Mil_4_STORY_Info_04_03");	//Ich habe schon oft gegen die Orks gekämpft.
	AI_Output(self,other,"Infos_Mil_4_STORY_Info_04_04");	//Früher bei den Grenzkriegen, da haben sie uns auch belagert. Genau wie jetzt.
	AI_Output(self,other,"Infos_Mil_4_STORY_Info_04_05");	//Sie werden auf einen günstigen Moment warten. Und wenn wir nicht damit rechnen, dann werden sei da sein!
};


instance INFOS_MIL_4_BOSS(C_Info)
{
	condition = infos_mil_4_boss_condition;
	information = infos_mil_4_boss_info;
	permanent = TRUE;
	description = "Wer hat hier das Sagen?";
};


func int infos_mil_4_boss_condition()
{
	var C_Npc berengar;
	var C_Npc cassian;
	berengar = Hlp_GetNpc(mil_103_berengar);
	cassian = Hlp_GetNpc(mil_119_cassian);
	if((berengar.aivar[3] == FALSE) || (cassian.aivar[3] == FALSE))
	{
		return TRUE;
	};
};

func void infos_mil_4_boss_info()
{
	var C_Npc berengar;
	var C_Npc cassian;
	AI_Output(other,self,"Infos_Mil_4_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Mil_4_BOSS_Info_04_02");	//Berengar ist unser Hauptmann. Aber du solltest ihm aus dem Weg gehen, glaub mir.
	AI_Output(self,other,"Infos_Mil_4_BOSS_Info_04_03");	//Sprich lieber mit Cassian, das ist sein Leutnant.
	berengar = Hlp_GetNpc(mil_103_berengar);
	berengar.aivar[3] = TRUE;
	cassian = Hlp_GetNpc(mil_119_cassian);
	cassian.aivar[3] = TRUE;
};

func void b_assignambientinfos_mil_4(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_mil_4_exit.npc = Hlp_GetInstanceID(slf);
	infos_mil_4_hi.npc = Hlp_GetInstanceID(slf);
	infos_mil_4_story.npc = Hlp_GetInstanceID(slf);
	infos_mil_4_boss.npc = Hlp_GetInstanceID(slf);
	info_mil_4_foodgood.npc = Hlp_GetInstanceID(slf);
};

