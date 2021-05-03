
instance INFO_EDO_EXIT(C_Info)
{
	npc = thf_400_edo;
	nr = 999;
	condition = info_edo_exit_condition;
	information = info_edo_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int info_edo_exit_condition()
{
	return TRUE;
};

func void info_edo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_400_EDO_HOWDY(C_Info)
{
	npc = thf_400_edo;
	condition = thf_400_edo_howdy_condition;
	information = thf_400_edo_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was tust du den ganzen Tag?";
};


func int thf_400_edo_howdy_condition()
{
	if(Npc_GetDistToWP(self,EDO_WP_SELL) > 300)
	{
		return TRUE;
	};
};

func void thf_400_edo_howdy_info()
{
	AI_Output(hero,self,"THF_400_HOWDY_15_01");	//Was tust du den ganzen Tag?
	AI_Output(self,hero,"THF_400_HOWDY_00_02");	//Ich geniese die Sonne, wenn sie dann mal schient!
	AI_Output(self,hero,"THF_400_HOWDY_00_03");	//Ansonsten bin ich bemüht, mich nicht zu überanstrengen!
	AI_Output(hero,self,"THF_400_HOWDY_15_04");	//Ja das sehe ich!
	AI_StopProcessInfos(self);
};


instance INFO_EDO_ORE(C_Info)
{
	npc = thf_400_edo;
	condition = info_edo_ore_condition;
	information = info_edo_ore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich komme gerade von Gotmar...";
};


func int info_edo_ore_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_whereore))
	{
		return TRUE;
	};
};

func void info_edo_ore_info()
{
	AI_Output(hero,self,"Info_Edo_ORE_15_01");	//Ich komme gerade von Gotmar...
	AI_Output(self,hero,"Info_Edo_ORE_00_02");	//So? Was will denn dieser Wichtigtuer von einem Schmied?
	AI_Output(hero,self,"Info_Edo_ORE_15_03");	//Er sagt, du hättest Erz von ihm gestohlen!
	AI_Standup(self);
	B_DrawWeapon(self,hero);
	AI_TurnToNPC(self,hero);
	AI_Output(self,hero,"Info_Edo_ORE_00_04");	//WAAAS??? Du nennst mich eine Dieb???
	Info_ClearChoices(info_edo_ore);
	Info_AddChoice(info_edo_ore,"Bist Du denn einer?",info_edo_orestolenyou);
	Info_AddChoice(info_edo_ore,"Nein, Gotmar tut das!",info_edo_orestolenno);
	Info_AddChoice(info_edo_ore,"Ja! Was dagegen?",info_edo_orestolenyes);
};

func void info_edo_orestolenyou()
{
	AI_Output(hero,self,"Info_Edo_ORESTOLENYOU_15_01");	//Bist Du denn einer?
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_02");	//HUA, HUA, HUA,...... du gefällst mir. Bist nicht auf den Kopf gefallen.
	B_RemoveWeapon(self);
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_03");	//(leiser) So ganz unter uns: Dieb zu sein ist eine Ehre, nur reagieren die anderen hier etwas allergisch auf dieses Thema.
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_04");	//Also behalt ich das lieber für mich. Die meisten streberhaften Handwerker hier verstehen einfach nicht, wie man WIRKLICH lebt.
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_05");	//Haben immer nur arbeiten im Kopf.
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_06");	//Ich verrat dir was: Wenn Du an billige Waren kommen willst, dann frage mich danach. Ich habe eine große Auswahl an Dingen aller Art.
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_07");	//(unschuldig) Sind ähem... gebrauchte Dinge. Ihre Vorbesitzter haben sie irgendwann mal... verloren.
	AI_Output(self,hero,"Info_Edo_ORESTOLENYOU_00_08");	//Also dachte ich mir, bevor sie keiner haben will...
	Info_ClearChoices(info_edo_ore);
	EDO_ISDEALER = TRUE;
};

func void info_edo_orestolenno()
{
	Info_ClearChoices(info_edo_ore);
	AI_Output(hero,self,"Info_Edo_ORESTOLENNO_15_01");	//Nein, Gotmar tut das!
	AI_Output(self,hero,"Info_Edo_ORESTOLENNO_00_02");	//Sooooo. Dann richte Gotmar aus, dass er besser aufpassen soll, was er herumerzählt. Hier im Lager können schreckliche Unfälle passiere, vor allem nachts...
	B_RemoveWeapon(self);
	GOTMAR_SCBETRAYED = TRUE;
};

func void info_edo_orestolenyes()
{
	Info_ClearChoices(info_edo_ore);
	AI_Output(hero,self,"Info_Edo_ORESTOLENYES_15_01");	//Ja! Was dagegen?
	AI_Output(self,hero,"Info_Edo_ORESTOLENYES_00_02");	//Na warte, dir werde ich deine Beleidigungen aus der Birne prügeln.
	AI_StopProcessInfos(self);
	B_ChangeGuild(thf_400_edo,GIL_None);
	b_attackproper(self,hero);
	EDO_CALLEDTHIEF = TRUE;
};


instance INFO_EDO_DEALOUTSIDE(C_Info)
{
	npc = thf_400_edo;
	condition = info_edo_dealoutside_condition;
	information = info_edo_dealoutside_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich bin an deinen... gefundenen... Sachen interessiert.";
	trade = TRUE;
};


func int info_edo_dealoutside_condition()
{
	if(EDO_ISDEALER && (Npc_GetDistToWP(self,EDO_WP_SELL) > 300))
	{
		return TRUE;
	};
};

func void info_edo_dealoutside_info()
{
	AI_Output(hero,self,"Info_Edo_DEALOUTSIDE_15_01");	//Ich bin an deinen... gefundenen... Sachen interessiert.
	AI_Output(self,hero,"Info_Edo_DEALOUTSIDE_00_02");	//PSSST, nicht so laut!!!
	AI_Output(self,hero,"Info_Edo_DEALOUTSIDE_00_03");	//Los komm mit!
	TA_BeginOverlay(self);
	TA_Stay(0,0,0,15,EDO_WP_SELL);
	TA_EndOverlay(self);
	AI_StopProcessInfos(self);
};


instance INFO_EDO_DEALINSIDE(C_Info)
{
	npc = thf_400_edo;
	condition = info_edo_dealinside_condition;
	information = info_edo_dealinside_info;
	important = FALSE;
	permanent = TRUE;
	trade = TRUE;
	description = "OK, nun zeig mir deine... gefundenen... Sachen.";
};


func int info_edo_dealinside_condition()
{
	if(EDO_ISDEALER && (Npc_GetDistToWP(self,EDO_WP_SELL) <= 300))
	{
		return TRUE;
	};
};

func void info_edo_dealinside_info()
{
	AI_Output(hero,self,"Info_Edo_DEALINSIDE_15_01");	//OK, nun zeig mir deine... gefundenen... Sachen.
	AI_Output(self,hero,"Info_Edo_DEALINSIDE_00_02");	//Klar, aber halt da draußen die Klappe darüber!
};


instance INFO_EDO_VICTORY(C_Info)
{
	npc = thf_400_edo;
	condition = info_edo_victory_condition;
	information = info_edo_victory_info;
	important = FALSE;
	permanent = FALSE;
	description = "JETZT was dagegen, dass ich dich einen Dieb nenne?";
};


func int info_edo_victory_condition()
{
	if(EDO_CALLEDTHIEF && self.aivar[12])
	{
		return TRUE;
	};
};

func void info_edo_victory_info()
{
	AI_Output(hero,self,"Info_Edo_VICTORY_15_01");	//JETZT was dagegen, dass ich dich einen Dieb nenne?
	AI_Output(self,hero,"Info_Edo_VICTORY_00_02");	//(ängstlich) Beruhig dich! Das war doch nur wegen der anderen hier?
	AI_Output(hero,self,"Info_Edo_VICTORY_15_03");	//Hast du nun Gotmars Erz oder nicht?
	AI_Output(self,hero,"Info_Edo_VICTORY_00_04");	//(ängstlich) Hier nimm es! Ich wusste von Anfang an, dass es mir Unglück bringen würde.
	B_ChangeGuild(thf_400_edo,GIL_THIEF);
	B_GiveInvItems(self,hero,itmi_orenugget,EDO_STOLENORE);
};


instance INFO_EDO_DEFEAT(C_Info)
{
	npc = thf_400_edo;
	condition = info_edo_defeat_condition;
	information = info_edo_defeat_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kann ich denn Erz von dir ...KAUFEN?";
};


func int info_edo_defeat_condition()
{
	if(EDO_CALLEDTHIEF && self.aivar[13])
	{
		return TRUE;
	};
};

func void info_edo_defeat_info()
{
	AI_Output(hero,self,"Info_Edo_DEFEAT_15_01");	//Kann ich denn Erz von dir ...KAUFEN?
	AI_Output(self,hero,"Info_Edo_DEFEAT_00_02");	//Du hast ganz schön Mut mich DA-nach wieder anzusprechen, ha, ha, ha!
	AI_Output(self,hero,"Info_Edo_DEFEAT_00_03");	//(leiser) Pass auf, ich kann dir alle möglichen Waren verkaufen.
	AI_Output(self,hero,"Info_Edo_DEFEAT_00_04");	//Hab sozusagen ein gutes Sortiment auf Lager.
	AI_Output(self,hero,"Info_Edo_DEFEAT_00_05");	//Alles Dinge, die ich irgendwo mal ...gefunden... habe. Deshalb sind sie auch so preiswert.
	EDO_ISDEALER = TRUE;
	B_ChangeGuild(thf_400_edo,GIL_THIEF);
};

