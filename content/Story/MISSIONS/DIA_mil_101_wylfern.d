
instance MIL_101_WYLFERN_EXIT(C_Info)
{
	npc = mil_101_wylfern;
	nr = 999;
	condition = mil_101_wylfern_exit_condition;
	information = mil_101_wylfern_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mil_101_wylfern_exit_condition()
{
	return TRUE;
};

func void mil_101_wylfern_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_101_WYLFERN_NEUTRAL(C_Info)
{
	npc = mil_101_wylfern;
	nr = 33;
	condition = mil_101_wylfern_neutral_condition;
	information = mil_101_wylfern_neutral_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int mil_101_wylfern_neutral_condition()
{
	return TRUE;
};

func void mil_101_wylfern_neutral_info()
{
	AI_Output(hero,self,"MIL_101_NEUTRAL_15_01");	//Was machst du hier?
	AI_Output(self,hero,"MIL_101_NEUTRAL_08_02");	//Ich bin Wylfern, Rekrut der Miliz.
	AI_Output(self,hero,"MIL_101_NEUTRAL_08_03");	//Als angehender Milizsoldat hat man immer viel zu tun. Wenn man nicht gerade Wache hält, muss man trainieren.
	AI_Output(self,hero,"MIL_101_NEUTRAL_08_04");	//Wir kümmern uns um alles, was für die anderen zu gefährlich ist.
	AI_Output(self,hero,"MIL_101_NEUTRAL_08_05");	//Ja, es ist ganz schön hart, aber ich bin stolz dabeisein zu dürfen!
};


instance MIL_101_WYLFERN_HI(C_Info)
{
	npc = mil_101_wylfern;
	nr = 12;
	condition = mil_101_wylfern_hi_condition;
	information = mil_101_wylfern_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du warst in der Mine?";
};


func int mil_101_wylfern_hi_condition()
{
	if(Npc_KnowsInfo(hero,wrk_200_gotmar_needbloodore) || Npc_KnowsInfo(hero,mil_101_sylvester_sword))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_hi_info()
{
	AI_Output(hero,self,"MIL_101_HI_15_01");	//Du warst in der Mine?
	AI_Output(self,hero,"MIL_101_HI_08_02");	//Ja, das ist richtig. Ich hab bis vor ein paar Wochen in der Mine gearbeitet.
	AI_Output(self,hero,"MIL_101_HI_08_03");	//Aber dann bekam ich den Auftrag zwei Schürfer zum Lager zu bringen.
	AI_Output(self,hero,"MIL_101_HI_08_04");	//Wir haben uns auf den Weg gemacht, aus Vorsicht sind wir Nachts gegangen.
	AI_Output(self,hero,"MIL_101_HI_08_05");	//Kurz vor dem Lager haben uns die Orks überfallen. Sie kamen wie aus dem Nichts,... wir hatten keine Chance.
	AI_Output(self,hero,"MIL_101_HI_08_06");	//Nur Sylvester und ich konnten uns retten. Aber Pedro haben sie erwischt.
};


instance MIL_101_WYLFERN_RUSH(C_Info)
{
	npc = mil_101_wylfern;
	nr = 11;
	condition = mil_101_wylfern_rush_condition;
	information = mil_101_wylfern_rush_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo hat der Überfall stattgefunden?";
};


func int mil_101_wylfern_rush_condition()
{
	if(Npc_KnowsInfo(hero,mil_101_wylfern_hi))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_rush_info()
{
	AI_Output(hero,self,"MIL_101_RUSH_15_01");	//Wo hat der Überfall stattgefunden?
	AI_Output(self,hero,"MIL_101_RUSH_08_02");	//Am Waldrand. Willst du dahin?
	AI_Output(hero,self,"MIL_101_RUSH_15_03");	//Ja, ich brauche unbedingt Bluterz. Vielleicht finde ich da noch was.
	AI_Output(self,hero,"MIL_101_RUSH_08_04");	//Du wirst die Stelle alleine nicht finden.
	AI_Output(hero,self,"MIL_101_RUSH_15_05");	//Deshalb wirst du mich begleiten.
	AI_Output(self,hero,"MIL_101_RUSH_08_06");	//Was ich? Nein, vergiss es. Ich gehe dort nicht mehr hin!
	Info_ClearChoices(mil_101_wylfern_rush);
	Info_AddChoice(mil_101_wylfern_rush,"Dann beschreib mir wenigstens den Weg",mil_101_wylfern_rush_way);
	Info_AddChoice(mil_101_wylfern_rush,"Du bist halt ein Feigling...",mil_101_wylfern_rush_fear);
	Info_AddChoice(mil_101_wylfern_rush,"Ich zahl dir dreissig Silberstücke",mil_101_wylfern_rush_30);
	Info_AddChoice(mil_101_wylfern_rush,"Ich zahl dir zehn Silberstücke",mil_101_wylfern_rush_10);
};

func void mil_101_wylfern_rush_10()
{
	AI_Output(hero,self,"MIL_101_RUSH_20_15_01");	//Ich zahl dir zehn Silberstücke.
	AI_Output(self,hero,"MIL_101_RUSH_20_08_02");	//Nicht für alles Geld des Lagers würde ich da wieder hingehen!
	Info_ClearChoices(mil_101_wylfern_rush);
	WYLFERN_AGAIN = LOG_RUNNING;
};

func void mil_101_wylfern_rush_30()
{
	AI_Output(hero,self,"MIL_101_RUSH_30_15_01");	//Ich zahl dir dreissig Silberstücke.
	AI_Output(self,hero,"MIL_101_RUSH_30_08_02");	//Hmmm.. okay, wenn du mir das Silber gibst, bringe ich dich hin.
	WYLFERN_SILVER = LOG_RUNNING;
	Info_ClearChoices(mil_101_wylfern_rush);
};

func void mil_101_wylfern_rush_fear()
{
	AI_Output(hero,self,"MIL_101_RUSH_FEAR_15_01");	//Du bist halt ein Feigling...
	AI_Output(self,hero,"MIL_101_RUSH_FEAR_08_02");	//Was, du nennst mich einen Feigling? Ich bin Rekrut der Miliz. Ich bin nicht feige!
	AI_Output(hero,self,"MIL_101_RUSH_FEAR_15_03");	//Dann bring mich zum Ort des Überfalls!
	AI_Output(self,hero,"MIL_101_RUSH_FEAR_08_04");	//		-SEUFZ-
	AI_Output(self,hero,"MIL_101_RUSH_FEAR_08_05");	//Na gut, ich werde dich hinbringen.
	WYLFERN_SEARCH = LOG_RUNNING;
	Info_ClearChoices(mil_101_wylfern_rush);
};

func void mil_101_wylfern_rush_way()
{
	AI_Output(hero,self,"MIL_101_RUSH_WAY_15_01");	//Dann beschreib mir wenigstens den Weg.
	AI_Output(self,hero,"MIL_101_RUSH_WAY_08_02");	//Verlasse das Lager durch den Haupteingang und wende ich nach rechts.
	AI_Output(self,hero,"MIL_101_RUSH_WAY_08_03");	//Folge dem Weg, bis du zum Wald kommst.
	AI_Output(self,hero,"MIL_101_RUSH_WAY_08_04");	//Dort verlässt du den Weg und folgst rechterhand dem Waldrand, bis du im Wald den Hügel siehst.
	AI_Output(self,hero,"MIL_101_RUSH_WAY_08_05");	//Hinter dem Hügel, da haben sie uns angegriffen!
	Info_ClearChoices(mil_101_wylfern_rush);
};


instance MIL_101_WYLFERN_WAREZ(C_Info)
{
	npc = mil_101_wylfern;
	nr = 12;
	condition = mil_101_wylfern_warez_condition;
	information = mil_101_wylfern_warez_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hattet ihr Erz dabei?";
};


func int mil_101_wylfern_warez_condition()
{
	if(Npc_KnowsInfo(hero,mil_101_wylfern_hi))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_warez_info()
{
	AI_Output(hero,self,"MIL_101_WAREZ_15_01");	//Hattet ihr Erz dabei?
	AI_Output(self,hero,"MIL_101_WAREZ_08_02");	//Sylvester und Pedro hatten beide Erz dabei.
};


instance MIL_101_WYLFERN_AGAIN(C_Info)
{
	npc = mil_101_wylfern;
	nr = 23;
	condition = mil_101_wylfern_again_condition;
	information = mil_101_wylfern_again_info;
	important = FALSE;
	permanent = FALSE;
	description = "Dann beschreib mir wenigstens den Weg";
};


func int mil_101_wylfern_again_condition()
{
	if(WYLFERN_AGAIN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void mil_101_wylfern_again_info()
{
	AI_Output(hero,self,"MIL_101_AGAIN_15_01");	//Dann beschreibe mir wenigstens den Weg.
	AI_Output(self,hero,"MIL_101_AGAIN_08_02");	//Verlasse das Lager durch den Haupteingang und wende ich nach rechts.
	AI_Output(self,hero,"MIL_101_AGAIN_08_03");	//Folge dem Weg, bis du zum Wald kommst.
	AI_Output(self,hero,"MIL_101_AGAIN_08_04");	//Dort verlässt du den Weg und folgst rechterhand dem Waldrand, bis du im Wald den Hügel siehst.
	AI_Output(self,hero,"MIL_101_AGAIN_08_05");	//Hinter dem Hügel, da haben sie uns angegriffen!
};


instance MIL_101_WYLFERN_GUIDE(C_Info)
{
	npc = mil_101_wylfern;
	nr = 12;
	condition = mil_101_wylfern_guide_condition;
	information = mil_101_wylfern_guide_info;
	important = FALSE;
	permanent = FALSE;
	description = "Lass uns zum Ort des Überfalls gehen";
};


func int mil_101_wylfern_guide_condition()
{
	if(Npc_KnowsInfo(hero,mil_101_wylfern_rush) && (WYLFERN_SEARCH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_guide_info()
{
	AI_Output(hero,self,"MIL_101_GUIDE_15_01");	//Lass uns zum Ort des Überfalls gehen.
	AI_Output(self,hero,"MIL_101_GUIDE_08_02");	//Gut, dann folge mir. Aber ich werde dich nur hinbringen, nichts weiter!
	AI_Output(self,hero,"MIL_101_GUIDE_08_03");	//Sollten wir uns unterwegs verlieren, treffen wir und am besten hier im Burghof wieder.
	b_guidepc(self,"RUSH","PATH_OC_FOGTOWER02");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC1");
	Wld_InsertNpc(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc(Wolf,"FP_ROAM_OW_WOLF2_WALD_OC5");
};


instance MIL_101_WYLFERN_SILVERGUIDE(C_Info)
{
	npc = mil_101_wylfern;
	nr = 23;
	condition = mil_101_wylfern_silverguide_condition;
	information = mil_101_wylfern_silverguide_info;
	important = FALSE;
	permanent = FALSE;
	description = "Lass uns zum Ort des Überfalls gehen";
};


func int mil_101_wylfern_silverguide_condition()
{
	if(Npc_KnowsInfo(hero,mil_101_wylfern_rush) && (WYLFERN_SILVER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_silverguide_info()
{
	AI_Output(hero,self,"MIL_101_SILVERGUIDE_15_01");	//Lass uns zum Ort des Überfalls gehen. Ich habe das Silber.
	if(Npc_HasItems(hero,itmi_silver) >= 30)
	{
		AI_Output(self,hero,"MIL_101_SILVERGUIDE_08_02");	//Alles klar, aber ich werde dich nur hinbringen, nichts weiter.
		b_guidepc(self,"RUSH","PATH_OC_FOGTOWER02");
		AI_StopProcessInfos(self);
		mil_101_wylfern_silverguide.permanent = FALSE;
	};
	if(Npc_HasItems(hero,itmi_silver) < 30)
	{
		AI_Output(self,hero,"MIL_101_SILVERGUIDE_08_03");	//Komm wieder, wenn du dreissig Silberstücke hast!
		mil_101_wylfern_silverguide.permanent = TRUE;
	};
};


instance MIL_101_WYLFERN_RUSHHOUR(C_Info)
{
	npc = mil_101_wylfern;
	condition = mil_101_wylfern_rushhour_condition;
	information = mil_101_wylfern_rushhour_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_101_wylfern_rushhour_condition()
{
	if((Npc_GetDistToWP(self,"PATH_OC_FOGTOWER02") <= 500) && Npc_IsInRoutine(self,ZS_GuidePC))
	{
		return TRUE;
	};
};

func void mil_101_wylfern_rushhour_info()
{
	AI_Output(self,hero,"MIL_101_RUSHHOUR_08_01");	//Okay, hier war es. Du solltest dich beeilen, es ist nicht sicher hier.
	AI_Output(self,hero,"MIL_101_RUSHHOUR_08_02");	//Ich gehe wieder zurück ins Lager.
	b_leavepc(self,"START");
	AI_StopProcessInfos(self);
};

