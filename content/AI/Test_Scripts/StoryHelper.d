
instance SH(Npc_Default)
{
	name[0] = "StoryHelper";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 15;
	id = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	start_aistate = ZS_SH_Hangaround;
};


func void ZS_SH_Hangaround()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_SH_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
};

func void ZS_SH_Hangaround_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_SH_Hangaround_Loop");
};

func void ZS_SH_Hangaround_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_SH_Hangaround_End");
};


instance StoryHelper_Exit(C_Info)
{
	npc = sh;
	nr = 999;
	condition = StoryHelper_Exit_Condition;
	information = StoryHelper_Exit_Info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int StoryHelper_Exit_Condition()
{
	return 1;
};

func void StoryHelper_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance STORYHELPER_INFO1(C_Info)
{
	npc = sh;
	condition = storyhelper_info1_condition;
	information = storyhelper_info1_info;
	important = 0;
	permanent = 1;
	description = "Kapitel 1";
};


func int storyhelper_info1_condition()
{
	return TRUE;
};

func void storyhelper_info1_info()
{
	Info_ClearChoices(storyhelper_info1);
	Info_AddChoice(storyhelper_info1,"ZURÜCK",storyhelper_back1);
	Info_AddChoice(storyhelper_info1,"I: Bei Diego im Haus der Erzbarone",storyhelper_chapter1_beforediego);
	Info_AddChoice(storyhelper_info1,"I: Am Alten Lager angekommen",storyhelper_chapter1_arrivedatoc);
};

func void storyhelper_chapter1_arrivedatoc()
{
	Info_ClearChoices(storyhelper_info1);
	AI_StopProcessInfos(self);
	CreateInvItem(hero,itwr_xardas_letter_sealed);
	B_ExchangeRoutine(amz_900_thora,"ArenaWait");
	SUBCHAPTER = CH1_ARRIVED_AT_OC;
};

func void storyhelper_chapter1_beforediego()
{
	Info_ClearChoices(storyhelper_info1);
	AI_StopProcessInfos(self);
	CreateInvItem(hero,itwr_xardas_letter_sealed);
	B_ExchangeRoutine(amz_900_thora,"ArenaWait");
	SUBCHAPTER = CH1_BEFORE_DIEGO;
};

func void storyhelper_back1()
{
	Info_ClearChoices(storyhelper_info1);
};


instance StoryHelper_INFO2(C_Info)
{
	npc = sh;
	condition = StoryHelper_INFO2_Condition;
	information = StoryHelper_INFO2_Info;
	important = 0;
	permanent = 1;
	description = "Kapitel 2";
};


func int StoryHelper_INFO2_Condition()
{
	return TRUE;
};

func void StoryHelper_INFO2_Info()
{
	Info_ClearChoices(StoryHelper_INFO2);
	Info_AddChoice(StoryHelper_INFO2,"ZURÜCK",StoryHelper_BACK2);
	Info_AddChoice(StoryHelper_INFO2,"II: In der Bergfestung",storyhelper_chapter2_enteredbf);
	Info_AddChoice(StoryHelper_INFO2,"II: Thora überzeugt",storyhelper_chapter2_thoraconvinced);
};

func void storyhelper_chapter2_thoraconvinced()
{
	Info_ClearChoices(StoryHelper_INFO2);
	AI_StopProcessInfos(self);
	CreateInvItem(hero,itwr_xardas_letter);
	B_ExchangeRoutine(amz_900_thora,"ArenaWait");
	B_Kapitelwechsel(2);
	SUBCHAPTER = CH2_THORA_CONVINCED;
};

func void storyhelper_chapter2_enteredbf()
{
	Info_ClearChoices(StoryHelper_INFO2);
	AI_StopProcessInfos(self);
	CreateInvItem(hero,itwr_xardas_letter);
	B_Kapitelwechsel(2);
	B_ExchangeRoutine(amz_900_thora,"ReportToGarwog");
	SUBCHAPTER = CH2_ENTERED_BF;
};

func void StoryHelper_BACK2()
{
	Info_ClearChoices(StoryHelper_INFO2);
};

