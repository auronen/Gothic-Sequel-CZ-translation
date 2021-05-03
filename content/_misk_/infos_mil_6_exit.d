
instance INFOS_MIL_6_EXIT(C_Info)
{
	nr = 999;
	condition = infos_mil_6_exit_condition;
	information = infos_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int infos_mil_6_exit_condition()
{
	return TRUE;
};

func void infos_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFOS_MIL_6_HI(C_Info)
{
	condition = infos_mil_6_hi_condition;
	information = infos_mil_6_hi_info;
	description = "Wie läufts?";
	permanent = TRUE;
};


func int infos_mil_6_hi_condition()
{
	return TRUE;
};

func void infos_mil_6_hi_info()
{
	AI_Output(other,self,"Infos_Mil_6_HI_Info_15_01");	//Wie läufts?
	AI_Output(self,other,"Infos_Mil_6_HI_Info_06_02");	//Wie es im Krieg halt so läuft. Wenn die Orks kommen, greifen wir an. Wenn nicht, dann warten wir weiter.
};


instance INFO_MIL_6_FOODGOOD(C_Info)
{
	condition = info_mil_6_foodgood_condition;
	information = info_mil_6_foodgood_info;
	permanent = TRUE;
	description = "Ich hab hier etwas Silber, warum isst du ab Morgen nicht einfach bei Snaf?";
};


func int info_mil_6_foodgood_condition()
{
	if(b_lunchtimeathalvors() && (self.aivar[31] < b_getday()) && Npc_KnowsInfo(hero,mil_100_halvor_snaf))
	{
		return TRUE;
	};
};

func void info_mil_6_foodgood_info()
{
	AI_Output(hero,self,"Info_Mil_6_FOODGOOD_15_01");	//Ich hab hier etwas Silber, warum isst du ab Morgen nicht einfach bei Snaf?
	if(Npc_HasItems(hero,itmi_silver) >= SNAF_BRIBE_SUM)
	{
		B_GiveInvItems(hero,self,itmi_silver,SNAF_BRIBE_SUM);
		AI_Output(self,hero,"Info_Mil_6_FOODGOOD_06_03");	//Das ist ein Wort! Halvor's Eintopf schmeckt zwar gut, aber er ist auch ziemlich teuer.
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


instance INFOS_MIL_6_JOIN(C_Info)
{
	condition = infos_mil_6_join_condition;
	information = infos_mil_6_join_info;
	description = "Könnt ihr noch einen Mann gebrauchen?";
	permanent = TRUE;
};


func int infos_mil_6_join_condition()
{
	return TRUE;
};

func void infos_mil_6_join_info()
{
	AI_Output(other,self,"Infos_Mil_6_JOIN_Info_15_01");	//Könnt ihr noch einen Mann gebrauchen?
	if((MILITIA_ANSWER == TRUE) && (other.attribute[ATR_STRENGTH] >= 35) && (Npc_GetTalentSkill(other,NPC_TALENT_1H) >= 1))
	{
		AI_Output(self,other,"Infos_Mil_6_JOIN_Info_06_03");	//Ich glaube du bist soweit. Sprich mal mit Cassian. Einer Aufnahme steht wohl nichts mehr im Weg.
	}
	else if((MILITIA_ANSWER == TRUE) && ((other.attribute[ATR_STRENGTH] < 35) || (Npc_GetTalentSkill(other,NPC_TALENT_1H) == 0)))
	{
		AI_Output(self,other,"Infos_Mil_6_JOIN_Info_06_04");	//Du bist noch nicht soweit. Sprich mit Leutnant Cassian , wenn du trainiert hast!
	}
	else if(MILITIA_ANSWER == FALSE)
	{
		AI_Output(self,other,"Infos_Mil_6_JOIN_Info_06_02");	//Natürlich. Gute Männer können wir immer gebrauchen. Die Frage ist, bist du gut?
		Info_ClearChoices(infos_mil_6_join);
		Info_AddChoice(infos_mil_6_join,"Ich weiß es nicht",infos_mil_6_join_dontknow);
		Info_AddChoice(infos_mil_6_join,"Ich bin der Beste",infos_mil_6_join_best);
		Info_AddChoice(infos_mil_6_join,"Ich  bin verdammt gut",infos_mil_6_join_damngood);
		Info_AddChoice(infos_mil_6_join,"Ich bin gut",infos_mil_6_join_good);
	};
};

func void infos_mil_6_join_dontknow()
{
	AI_Output(other,self,"Infos_Mil_6_JOIN_DONTKNOW_Info_15_01");	//Ich weiß es nicht.
	AI_Output(self,other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_02");	//Wenn du es nicht weißt, wer soll es dann wissen?
	AI_Output(self,other,"Infos_Mil_6_JOIN_DONTKNOW_Info_06_03");	//Ist vielleicht besser, du trainierst noch ne Weile, bevor du uns beitrittst.
	Info_ClearChoices(infos_mil_6_join);
	MILITIA_ANSWER = TRUE;
};

func void infos_mil_6_join_best()
{
	AI_Output(other,self,"Infos_Mil_6_JOIN_BEST_Info_15_01");	//Ich bin der Beste.
	AI_Output(self,other,"Infos_Mil_6_JOIN_BEST_Info_06_02");	//Scheinst ja sehr von dir überzeugt zu sein. Dann wirst du ja auch alleine zurecht kommen.
	Info_ClearChoices(infos_mil_6_join);
	MILITIA_ANSWER = TRUE;
};

func void infos_mil_6_join_damngood()
{
	AI_Output(other,self,"Infos_Mil_6_JOIN_DAMNGOOD_Info_15_01");	//Ich  bin verdammt gut.
	AI_Output(self,other,"Infos_Mil_6_JOIN_DAMNGOOD_Info_06_02");	//Das musst du auch sein, wenn du uns beitreten willst.
	Info_ClearChoices(infos_mil_6_join);
	MILITIA_ANSWER = TRUE;
};

func void infos_mil_6_join_good()
{
	AI_Output(other,self,"Infos_Mil_6_JOIN_GOOD_Info_15_01");	//Ich bin gut.
	AI_Output(self,other,"Infos_Mil_6_JOIN_GOOD_Info_06_02");	//Das wird sich noch zeigen. Sprich mal mit Cassian. Er wird entscheiden, ob du gut genug bist.
	Info_ClearChoices(infos_mil_6_join);
	MILITIA_ANSWER = TRUE;
};


instance INFOS_MIL_6_STORY(C_Info)
{
	condition = infos_mil_6_story_condition;
	information = infos_mil_6_story_info;
	permanent = TRUE;
	description = "Erzähl mir was über die Orks";
};


func int infos_mil_6_story_condition()
{
	return TRUE;
};

func void infos_mil_6_story_info()
{
	AI_Output(other,self,"Infos_Mil_6_STORY_Info_15_01");	//Erzähl mir was über die Orks
	AI_Output(self,other,"Infos_Mil_6_STORY_Info_06_02");	//Sie haben an den Tal- Zugängen Stellung bezogen. Haben sich eingenistet wie die Ratten im Gemäuer.
	AI_Output(self,other,"Infos_Mil_6_STORY_Info_06_03");	//Haben alle Vorteile auf ihrer Seite. Möchte wetten das sie hinter den Bergen einen Haufen Feldlager errichtet haben.
	AI_Output(self,other,"Infos_Mil_6_STORY_Info_06_04");	//Werden wohl ein paar hundert sein. Dreckige Bastarde.
};


instance INFOS_MIL_6_BOSS(C_Info)
{
	condition = infos_mil_6_boss_condition;
	information = infos_mil_6_boss_info;
	permanent = TRUE;
	description = "Wer hat hier das Sagen?";
};


func int infos_mil_6_boss_condition()
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

func void infos_mil_6_boss_info()
{
	var C_Npc berengar;
	var C_Npc cassian;
	AI_Output(other,self,"Infos_Mil_6_BOSS_Info_15_01");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Infos_Mil_6_BOSS_Info_01_02");	//Hauptmann Berengar. Aber halt dich fern von ihm. Er mag keine aufdringlichen Typen! Leutnant Cassian ist für Typen wie dich zuständig!
	berengar = Hlp_GetNpc(mil_103_berengar);
	berengar.aivar[3] = TRUE;
	cassian = Hlp_GetNpc(mil_119_cassian);
	cassian.aivar[3] = TRUE;
};

func void b_assignambientinfos_mil_6(var C_Npc slf)
{
	b_assignfindnpc_wrk(slf);
	infos_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	infos_mil_6_hi.npc = Hlp_GetInstanceID(slf);
	infos_mil_6_story.npc = Hlp_GetInstanceID(slf);
	infos_mil_6_boss.npc = Hlp_GetInstanceID(slf);
	info_mil_6_foodgood.npc = Hlp_GetInstanceID(slf);
};

