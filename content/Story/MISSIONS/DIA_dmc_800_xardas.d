
instance DMC_800_XARDAS_EXIT(C_Info)
{
	npc = dmc_800_xardas;
	nr = 999;
	condition = dmc_800_xardas_exit_condition;
	information = dmc_800_xardas_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dmc_800_xardas_exit_condition()
{
	return TRUE;
};

func void dmc_800_xardas_exit_info()
{
	if(chapter == 1)
	{
		Npc_ExchangeRoutine(self,"START");
	};
	AI_StopProcessInfos(self);
};


instance DMC_800_XARDAS_BACK(C_Info)
{
	npc = dmc_800_xardas;
	nr = 1;
	condition = dmc_800_xardas_back_condition;
	information = dmc_800_xardas_back_info;
	permanent = FALSE;
	description = "(Startsatz)";
};


func int dmc_800_xardas_back_condition()
{
	if(SUBCHAPTER < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void dmc_800_xardas_back_info()
{
	b_story_printstart();
	b_setattitude(self,ATT_FRIENDLY);
	AI_Output(self,hero,"DMC_800_BACK_14_01");	//...und das ist alles was passiert ist, seit du verschüttet wurdest.
	AI_Output(hero,self,"DMC_800_BACK_15_02");	//Du warst doch auch im Tempel, als ich gegen den Schläfer kämpfte.
	AI_Output(self,hero,"DMC_800_BACK_14_03");	//Ich konnte mit letzter Kraft entkommen, bevor der Tempel einstürzte.
	AI_Output(self,hero,"DMC_800_BACK_14_04");	//Seitdem habe ich nach dir gesucht.
	Info_AddChoice(dmc_800_xardas_back,"Jetzt wird das Tal also von den Orcs belagert.",dmc_800_xardas_back_problem);
};

func void dmc_800_xardas_back_problem()
{
	AI_Output(hero,self,"DMC_800_BACK_PROBLEM_15_01");	//Jetzt wird das Tal also von den Orcs belagert und wir sitzen immer noch fest.
	AI_Output(self,hero,"DMC_800_BACK_PROBLEM_14_02");	//So ist es. Aber das ist leider noch nicht unser schlimmstes Problem.
	Info_ClearChoices(dmc_800_xardas_back);
};


instance DMC_800_XARDAS_QUEST(C_Info)
{
	npc = dmc_800_xardas;
	nr = 2;
	condition = dmc_800_xardas_quest_condition;
	information = dmc_800_xardas_quest_info;
	important = FALSE;
	permanent = FALSE;
	description = "Von welchem Problem sprichst du?";
};


func int dmc_800_xardas_quest_condition()
{
	if(Npc_KnowsInfo(hero,dmc_800_xardas_back))
	{
		return TRUE;
	};
};

func void dmc_800_xardas_quest_info()
{
	AI_Output(hero,self,"DMC_800_QUEST_15_01");	//Von welchem Problem sprichst du?
	AI_Output(self,hero,"DMC_800_QUEST_14_02");	//Der Schläfer versucht von der Dämonenwelt in unsere Welt zurückzukehren. Wenn ihm das gelingt wird er ein ganzes Heer von Dämonen mit sich führen.
	AI_Output(hero,self,"DMC_800_QUEST_15_03");	//Aber wie? Das Tor zur Dämonenwelt ist zerstört.
	AI_Output(self,hero,"DMC_800_QUEST_14_04");	//Das magische Gefüge der Kolonie wurde durch die Zerstörung der Barriere geschwächt.
	AI_Output(self,hero,"DMC_800_QUEST_14_05");	//Schon bald könnte das gesamte Tal ein Tor zur Dämonenwelt sein!
	Info_AddChoice(dmc_800_xardas_quest,"Was können wir dagegen tun?",dmc_800_xardas_quest_stop);
	Log_CreateTopic(CH1_DEMONTHREAT,LOG_MISSION);
	Log_SetTopicStatus(CH1_DEMONTHREAT,LOG_RUNNING);
	B_LogEntry(CH1_DEMONTHREAT,"Der Schläfer versucht aus der Dämonenwelt in unsere Welt zurückzukommen. Er muss unter allen Umständen aufgehalten werden, sonst waren alle meine Bemühungen umsonst.");
};

func void dmc_800_xardas_quest_stop()
{
	AI_Output(hero,self,"DMC_800_QUEST_STOP_15_01");	//Was können wir dagegen tun?
	AI_Output(self,hero,"DMC_800_QUEST_STOP_14_02");	//Was wir auch schon zuvor getan haben. Uns den Dämonen entgegestellen!
	AI_Output(self,hero,"DMC_800_QUEST_STOP_14_03");	//Aber zuvor musst du wieder an Kraft gewinnen und verlernte Fähigkeiten zurückerlangen.
	AI_Output(self,hero,"DMC_800_QUEST_STOP_14_04");	//Begib dich ins Alte Lager. Dort ist der geeignete Ort dafür.
	AI_Output(hero,self,"DMC_800_QUEST_STOP_15_05");	//Aber warum ausgerechnet ich?
	AI_Output(self,hero,"DMC_800_QUEST_STOP_14_06");	//Niemand ist besser geeignet als Du. Vertrau mir!
	B_LogEntry(CH1_DEMONTHREAT,"Bevor ich der dämonischen Bedrohung begegnen kann, muss ich meine verlernten Fähigkeiten zurückerlernen und wieder in Form kommen. Das Alte Lager ist der geeignete Ort dafür.");
};


instance DMC_800_XARDAS_WHERE(C_Info)
{
	npc = dmc_800_xardas;
	nr = 5;
	condition = dmc_800_xardas_where_condition;
	information = dmc_800_xardas_where_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wann und wo werden die Dämonen durchbrechen?";
};


func int dmc_800_xardas_where_condition()
{
	if(Npc_KnowsInfo(hero,dmc_800_xardas_quest))
	{
		return TRUE;
	};
};

func void dmc_800_xardas_where_info()
{
	AI_Output(hero,self,"DMC_800_WHERE_15_01");	//Wann und wo werden die Dämonen durchbrechen?
	AI_Output(self,hero,"DMC_800_WHERE_14_02");	//Es kann überall im Tal passieren. Ich weiß noch nichts genaues.
	AI_Output(self,hero,"DMC_800_WHERE_14_03");	//Aber ich werde Ort und Zeitpunkt herausfinden.
};


instance DMC_800_XARDAS_LEAVING(C_Info)
{
	npc = dmc_800_xardas;
	nr = 6;
	condition = dmc_800_xardas_leaving_condition;
	information = dmc_800_xardas_leaving_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie kann ich deinen Turm verlassen? ";
};


func int dmc_800_xardas_leaving_condition()
{
	if(Npc_KnowsInfo(hero,dmc_800_xardas_quest))
	{
		return TRUE;
	};
};

func void dmc_800_xardas_leaving_info()
{
	AI_Output(hero,self,"DMC_800_LEAVING_15_01");	//Wie kann ich deinen Turm verlassen? Du hast nicht zufällig eine Treppe einbauen lassen?
	AI_Output(self,hero,"DMC_800_LEAVING_14_02");	//Ich werde dich zum Alten Lager teleportieren. Sag mir, wenn du bereit bist.
	AI_Output(self,hero,"DMC_800_LEAVING_14_03");	//Aber sei vorsichtig. Es ist sehr gefährlich ausserhalb des Lagers.
};


instance DMC_800_XARDAS_TELEPORT(C_Info)
{
	npc = dmc_800_xardas;
	nr = 5;
	condition = dmc_800_xardas_teleport_condition;
	information = dmc_800_xardas_teleport_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich bin bereit für die Teleportation.";
};


func int dmc_800_xardas_teleport_condition()
{
	if(Npc_KnowsInfo(hero,dmc_800_xardas_leaving))
	{
		return TRUE;
	};
};

func void dmc_800_xardas_teleport_info()
{
	AI_Output(hero,self,"DMC_800_TELEPORT_15_01");	//Ich bin bereit für die Teleportation.
	AI_Output(self,hero,"DMC_800_TELEPORT_14_02");	//Ich gebe dir eine Botschaft für Diego, deinen alten Weggefährten, mit. Er ist mittlerweile der Anführer der Flüchtlinge im Alten Lager.
	B_GiveInvItems(self,hero,itwr_xardas_letter_sealed,1);
	AI_Output(self,hero,"DMC_800_TELEPORT_14_03");	//Übergebe ihm das Schriftstück und folge seinem Rat. Er wird wissen, was zu tun ist.
	AI_Output(self,hero,"DMC_800_TELEPORT_14_04");	//Mache dich nun bereit.
	AI_Output(hero,self,"DMC_800_TELEPORT_15_05");	//Wir sehen uns wieder!
	B_LogEntry(CH1_DEMONTHREAT,"Xardas gab mir eine Botschaft für Diego. Mein alter Weggefährte ist mittlerweile der Anführer des Alten Lagers. Er wird mich beraten und weiss was zu tun ist.");
	AI_StopProcessInfos(self);
	AI_PlayAni(hero,"T_STAND_2_TELEPORT");
	AI_Wait(hero,3);
	AI_Teleport(hero,TELEPORT4_WP);
	AI_PlayAni(hero,"T_TELEPORT_2_STAND");
	self.aivar[24] = FALSE;
	hero.aivar[24] = FALSE;
};

