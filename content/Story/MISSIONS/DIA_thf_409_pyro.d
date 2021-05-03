
instance THF_409_PYRO_EXIT(C_Info)
{
	npc = thf_409_pyro;
	nr = 999;
	condition = thf_409_pyro_exit_condition;
	information = thf_409_pyro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int thf_409_pyro_exit_condition()
{
	return TRUE;
};

func void thf_409_pyro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THF_409_PYRO_WHATSUP(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_whatsup_condition;
	information = thf_409_pyro_whatsup_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du den ganzen Tag?";
};


func int thf_409_pyro_whatsup_condition()
{
	if((Npc_GetDistToWP(self,ARENA_WP_CENTER) >= ARENA_CENTER_AREA) && !Npc_KnowsInfo(hero,thf_409_pyro_prettyhot))
	{
		return TRUE;
	};
};

func void thf_409_pyro_whatsup_info()
{
	AI_Output(hero,self,"THF_409_WHATSUP_15_01");	//Was machst du den ganzen Tag?
	AI_Output(self,hero,"THF_409_WHATSUP_05_02");	//Ich warte darauf, dass das Vorprogramm der Arenakämpfe anfängt.
	AI_Output(self,hero,"THF_409_WHATSUP_05_03");	//Dort unterhalte ich die Arenabesucher mit etwas Feuerspuckerei.
	AI_Output(self,hero,"THF_409_WHATSUP_05_04");	//Besuch mich doch mal während des Vorprogramms, wenn dich das interessiert.
	AI_StopProcessInfos(self);
};


instance THF_409_PYRO_PRETTYHOT(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_prettyhot_condition;
	information = thf_409_pyro_prettyhot_info;
	important = FALSE;
	permanent = FALSE;
	description = "Sieht gefährlich aus, was du da machst!";
};


func int thf_409_pyro_prettyhot_condition()
{
	if(Npc_GetDistToWP(self,ARENA_WP_CENTER) < ARENA_CENTER_AREA)
	{
		return TRUE;
	};
};

func void thf_409_pyro_prettyhot_info()
{
	AI_Output(hero,self,"THF_409_PRETTYHOT_15_01");	//Sieht gefährlich aus, was du da machst!
	AI_Output(self,hero,"THF_409_PRETTYHOT_05_02");	//Ist halb so schlimm wie es aussieht. Hab mir bisher erst einmal die Haare versengt!
	AI_Output(self,hero,"THF_409_PRETTYHOT_05_03");	//Die akrobatischen Tricks waren mir allerdings lieber.
	AI_Output(hero,self,"THF_409_PRETTYHOT_15_04");	//Akrobatische Tricks?
	AI_Output(self,hero,"THF_409_PRETTYHOT_05_05");	//Früher habe ich hier während des Vorprogramms etwas Artistik vorgeführt, aber das war den Zuschauern zu langweilig.
	AI_Output(self,hero,"THF_409_PRETTYHOT_05_06");	//Feuerspucken ist einfach dramatischer!
};


instance THF_409_PYRO_WHATACROBAT(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_whatacrobat_condition;
	information = thf_409_pyro_whatacrobat_info;
	important = FALSE;
	permanent = FALSE;
	description = "Welche akrobatischen Tricks hast du vorgeführt?";
};


func int thf_409_pyro_whatacrobat_condition()
{
	if(Npc_KnowsInfo(hero,thf_409_pyro_prettyhot))
	{
		return TRUE;
	};
};

func void thf_409_pyro_whatacrobat_info()
{
	AI_Output(hero,self,"THF_409_WHATACROBAT_15_01");	//Welche akrobatischen Tricks hast du vorgeführt?
	AI_Output(self,hero,"THF_409_WHATACROBAT_05_02");	//Hechtrollen, Saltos und dergleichen...
};


instance THF_409_PYRO_SHOWME(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_showme_condition;
	information = thf_409_pyro_showme_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir diese akrobatischen Tricks auch beibringen?";
};


func int thf_409_pyro_showme_condition()
{
	if(Npc_KnowsInfo(hero,thf_409_pyro_whatacrobat))
	{
		return TRUE;
	};
};

func void thf_409_pyro_showme_info()
{
	AI_Output(hero,self,"THF_409_SHOWME_15_01");	//Kannst du mir diese akrobatischen Tricks auch beibringen?
	AI_Output(self,hero,"THF_409_SHOWME_05_02");	//Ich muss für meinen Lebensunterhalt arbeiten. Also wenn du willst, dass ich dir meine alten Tricks zeige, dann kostet dich das Silber!
	AI_Output(hero,self,"THF_409_SHOWME_15_03");	//Wieviel?
};


instance THF_409_PYRO_LEARNACROBAT(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_learnacrobat_condition;
	information = thf_409_pyro_learnacrobat_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LearnAcrobat,LPCOST_TALENT_ACROBAT,PYRO_COSTACROBAT);
};


func int thf_409_pyro_learnacrobat_condition()
{
	if(Npc_KnowsInfo(hero,thf_409_pyro_showme) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		return TRUE;
	};
};

func void thf_409_pyro_learnacrobat_info()
{
	AI_Output(hero,self,"THF_409_LEARNACROBAT_15_01");	//Zeig mir deine Akrobatischen Tricks!
	if(Npc_HasItems(hero,itmi_silver) < PYRO_COSTACROBAT)
	{
		B_Say(self,hero,"$NotEnoughSilver");
		return;
	};
	if(B_GiveSkill(hero,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		B_GiveInvItems(hero,self,itmi_silver,PYRO_COSTACROBAT);
		AI_Output(self,hero,"THF_409_LEARNACROBAT_05_02");	//Akrobatik ist äußerst vielseitig einsetzbar. Du kannst weiter springen und so Orte erreichen, die andere nicht erreichen können.
		AI_Output(self,hero,"THF_409_LEARNACROBAT_05_03");	//Es hilft dir auch aus einem Kampf schnell weg zu kommen oder die Stellung zu wechseln. So ein Sprung kann dir den Arsch retten.
		AI_Output(self,hero,"THF_409_LEARNACROBAT_05_04");	//Du kannst dich auch bei einem tiefen Sturz besser abfedern und nimmst so weniger Schaden.
		AI_Output(self,hero,"THF_409_LEARNACROBAT_05_05");	//Aber vergiss nicht, wer hoch springt, kann auch tief fallen und unverwundbar macht dich Akrobatik nicht!
	};
};


instance THF_409_PYRO_WHATPLACES(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_whatplaces_condition;
	information = thf_409_pyro_whatplaces_info;
	important = FALSE;
	permanent = TRUE;
	description = "Welche Orte meinst du damit?";
};


func int thf_409_pyro_whatplaces_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 1) && !PYRO_KNOWSPLACES)
	{
		return TRUE;
	};
};

func void thf_409_pyro_whatplaces_info()
{
	AI_Output(hero,self,"THF_409_WHATPLACES_15_01");	//Welche Orte meinst du damit?
	AI_Output(self,hero,"THF_409_WHATPLACES_05_02");	//Was ist dir diese Information wert?
	Info_ClearChoices(thf_409_pyro_whatplaces);
	Info_AddChoice(thf_409_pyro_whatplaces,"Garnichts, du wirst es mir so sagen sonst...",thf_409_pyro_whatplaces_threat);
	Info_AddChoice(thf_409_pyro_whatplaces,"100 Silber",thf_409_pyro_whatplaces_100);
	Info_AddChoice(thf_409_pyro_whatplaces,"50 Silber",thf_409_pyro_whatplaces_50);
};

func void thf_409_pyro_info1()
{
	AI_Output(self,hero,"THF_409_WHATPLACES_Info1_05_01");	//Kennst du den Mauereinsturz bei der Burgschmiede?
	AI_Output(hero,self,"THF_409_WHATPLACES_Info1_15_02");	//Ja!
	AI_Output(self,hero,"THF_409_WHATPLACES_Info1_05_03");	//Niemand kann ohne akrobatische Tricks auf den Mauerrest am Schmiedehaus gelangen.
	PYRO_KNOWSPLACES = TRUE;
};

func void thf_409_pyro_info2()
{
	AI_Output(self,hero,"THF_409_WHATPLACES_Info2_05_01");	//Treiben sich eine Menge Fleischwanzen dort herum, manchmal liegt dort auch anderer Krempel herum!
	AI_Output(self,hero,"THF_409_WHATPLACES_Info2_05_02");	//Gleichs gilt für die Dächer des Gardistenhauses und die Burgschmiede selbst.
	AI_Output(self,hero,"THF_409_WHATPLACES_Info2_05_03");	//Ich begehe diese Dächer von Zeit zu Zeit, denn Elstern lassen dort oben ab und zu mal interessante Dinge fallen, die sie irgendwo stibitzt haben.
};

func void thf_409_pyro_whatplaces_50()
{
	Info_ClearChoices(thf_409_pyro_whatplaces);
	AI_Output(hero,self,"THF_409_WHATPLACES_50_15_01");	//50 Silber
	if(Npc_HasItems(hero,itmi_silver) < 50)
	{
		B_Say(self,hero,"$NotEnoughSilver");
		return;
	};
	B_GiveInvItems(hero,self,itmi_silver,50);
	thf_409_pyro_info1();
};

func void thf_409_pyro_whatplaces_100()
{
	Info_ClearChoices(thf_409_pyro_whatplaces);
	AI_Output(hero,self,"THF_409_WHATPLACES_100_15_01");	//100 Silber
	if(Npc_HasItems(hero,itmi_silver) < 100)
	{
		B_Say(self,hero,"$NotEnoughSilver");
		return;
	};
	B_GiveInvItems(hero,self,itmi_silver,50);
	thf_409_pyro_info1();
	thf_409_pyro_info2();
};

func void thf_409_pyro_whatplaces_threat()
{
	Info_ClearChoices(thf_409_pyro_whatplaces);
	b_adddarkpoints(1);
	B_DrawWeapon(hero,self);
	AI_Output(hero,self,"THF_409_WHATPLACES_THREAT_15_01");	//Garnichts, du wirst es mir so sagen sonst...
	AI_Output(self,hero,"THF_409_WHATPLACES_THREAT_05_02");	//OK, OK, werde nicht gleich ungemütlich! Ein Rüpel wie Brutus ist wirklich genug!
	B_RemoveWeapon(hero);
	AI_Output(hero,self,"THF_409_WHATPLACES_THREAT_15_03");	//Warum nicht gleich so!
	thf_409_pyro_info1();
	AI_StopProcessInfos(self);
};


instance THF_409_PYRO_HOWDY(C_Info)
{
	npc = thf_409_pyro;
	condition = thf_409_pyro_howdy_condition;
	information = thf_409_pyro_howdy_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was macht die Feuerspuckerei?";
};


func int thf_409_pyro_howdy_condition()
{
	if(Npc_KnowsInfo(hero,thf_409_pyro_prettyhot))
	{
		return TRUE;
	};
};

func void thf_409_pyro_howdy_info()
{
	AI_Output(hero,self,"THF_409_HOWDY_15_01");	//Was macht die Feuerspuckerei?
	AI_Output(self,hero,"THF_409_HOWDY_05_02");	//Ich verdiene genug Silber mit einer einzigen Stunde Arbeit pro Tag. Da kann ich mich wirklich nicht beschweren!
	AI_StopProcessInfos(self);
};

