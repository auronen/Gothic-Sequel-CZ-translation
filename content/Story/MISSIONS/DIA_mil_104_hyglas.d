
instance MIL_104_HYGLAS_EXIT(C_Info)
{
	npc = mil_104_hyglas;
	nr = 999;
	condition = mil_104_hyglas_exit_condition;
	information = mil_104_hyglas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mil_104_hyglas_exit_condition()
{
	return TRUE;
};

func void mil_104_hyglas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance MIL_104_HYGLAS_HI(C_Info)
{
	npc = mil_104_hyglas;
	nr = 33;
	condition = mil_104_hyglas_hi_condition;
	information = mil_104_hyglas_hi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie läuft's?";
};


func int mil_104_hyglas_hi_condition()
{
	return TRUE;
};

func void mil_104_hyglas_hi_info()
{
	AI_Output(hero,self,"MIL_104_HI_15_01");	//Wie läuft's?
	AI_Output(self,hero,"MIL_104_HI_08_02");	//Die Magier sind an allem schuld. Erst errichten sie eine riesige Barriere und sie wird größer als sie planen.
	AI_Output(self,hero,"MIL_104_HI_08_03");	//Das muss man sich mal vorstellen! Ich meine, die pfuschen mit Mächten herum, die sie nicht mal verstehen!
	AI_Output(self,hero,"MIL_104_HI_08_04");	//Und nicht genug damit, dann sprengen sie das Teil und alles wird zerstört! Und wieder einmal pfuschen sie mit Mächten herum, die sie nicht verstehen!
	AI_Output(self,hero,"MIL_104_HI_08_06");	//Die werden uns noch alle umbringen.
	AI_Output(self,hero,"MIL_104_HI_08_07");	//Du sagst ja gar nichts. Wie siehst du das denn?
	Info_AddChoice(mil_104_hyglas_hi,"Die Frage ist doch, was machst du mit diesem Wissen?",mil_104_hyglas_hi_what);
	Info_AddChoice(mil_104_hyglas_hi,"Du bist ein Spinner",mil_104_hyglas_hi_idiot);
	Info_AddChoice(mil_104_hyglas_hi,"Du hast Recht! Die Magier sind an allem Schuld! ",mil_104_hyglas_hi_mage);
	Info_AddChoice(mil_104_hyglas_hi,"Das interessiert mich nicht",mil_104_hyglas_hi_dontknow);
};

func void mil_104_hyglas_hi_dontknow()
{
	AI_Output(hero,self,"MIL_104_HI_DONTKNOW_15_01");	//Das interessiert mich nicht.
	AI_Output(self,hero,"MIL_104_HI_DONTKNOW_08_02");	//Oh, ... na dann steck deinen Kopf in den Sand und verharre solange, bis du stirbst
	AI_StopProcessInfos(self);
};

func void mil_104_hyglas_hi_mage()
{
	AI_Output(hero,self,"MIL_104_HI_MAGE_15_01");	//Du hast Recht! Die Magier sind an allem Schuld!
	AI_Output(self,hero,"MIL_104_HI_MAGE_08_02");	//Was ich sage. Denk daran wenn du einen Magier triffst, denn es geht um unser aller Leben!
	AI_StopProcessInfos(self);
};

func void mil_104_hyglas_hi_idiot()
{
	AI_Output(hero,self,"MIL_104_HI_IDIOT_15_01");	//Du bist ein Spinner.
	AI_Output(self,hero,"MIL_104_HI_IDIOT_08_02");	//Ich hätte dich für schlauer gehalten.
	AI_StopProcessInfos(self);
};

func void mil_104_hyglas_hi_what()
{
	AI_Output(hero,self,"MIL_104_HI_WHAT_15_01");	//Die Frage ist doch, was machst du mit diesem Wissen?
	AI_Output(self,hero,"MIL_104_HI_WHAT_08_02");	//Genau. Das ist die entscheidene Frage. Was tun wir?
	AI_Output(self,hero,"MIL_104_HI_WHAT_08_03");	//Sie alle umbringen? Das kann nicht der Weg sein.
	Info_ClearChoices(mil_104_hyglas_hi);
	Info_AddChoice(mil_104_hyglas_hi,"Ich habe keine Ahnung",mil_104_hyglas_hi_what_dontknow);
	Info_AddChoice(mil_104_hyglas_hi,"Zuerst mal müssen wir an sie rankommen",mil_104_hyglas_hi_what_first);
	Info_AddChoice(mil_104_hyglas_hi,"Wir sollten sie alle umbringen!",mil_104_hyglas_hi_what_killemall);
};

func void mil_104_hyglas_hi_what_killemall()
{
	AI_Output(hero,self,"MIL_104_HI_WHAT_KILLEMALL_15_01");	//Wir sollten sie alle umbringen!
	AI_Output(self,hero,"MIL_104_HI_WHAT_KILLEMALL_08_02");	//Das ist 'ne geniale Idee. Die ist so genial, die sollte man eigentlich in Gold aufwiegen.
	AI_Output(self,hero,"MIL_104_HI_WHAT_KILLEMALL_08_03");	//Nur für den Fall das du es versuchen solltest, es war nett dich gekannt zu haben.
	AI_StopProcessInfos(self);
};

func void mil_104_hyglas_hi_what_first()
{
	AI_Output(hero,self,"MIL_104_Hyglas_HI_WHAT_FIRST_15_01");	//Zuerst mal müssen wir an sie rankommen.
	AI_Output(self,hero,"MIL_104_Hyglas_HI_WHAT_FIRST_08_02");	//Ja, aber dahin zu gehen kann ziemlich gefährlich sein.
	AI_Output(hero,self,"MIL_104_Hyglas_HI_WHAT_FIRST_15_03");	//Ich denke, die Wege der Magier und mein Weg werden sich bald kreuzen, deshalb werde ich mich um sie kümmern.
	AI_Output(self,hero,"MIL_104_Hyglas_HI_WHAT_FIRST_08_04");	//Wenn du Hilfe brauchst, du kannst auf mich zählen!
	B_GiveXP(XP_HYGLAS);
	Log_CreateTopic(CH1_HYGLAS,LOG_MISSION);
	Log_SetTopicStatus(CH1_HYGLAS,LOG_RUNNING);
	B_LogEntry(CH1_HYGLAS,"Wenn sich der Weg der Magier mit meinem Weg kreuzt,werde ich herausfinden was sie vorhaben. Falls es Schwierigkeiten gibt, wird Hyglas mir beistehen.");
	b_setattitude(self,ATT_FRIENDLY);
	AI_StopProcessInfos(self);
};

func void mil_104_hyglas_hi_what_dontknow()
{
	AI_Output(hero,self,"MIL_104_HI_WHAT_DONTKNOW_15_01");	//Ich habe keine Ahnung.
	AI_Output(self,hero,"MIL_104_HI_WHAT_DONTKNOW_08_02");	//Tja, dann werde ich mich wohl alleine darum kümmern.
	AI_StopProcessInfos(self);
};


instance MIL_104_HYGLAS_MILITIA(C_Info)
{
	npc = mil_104_hyglas;
	nr = 23;
	condition = mil_104_hyglas_militia_condition;
	information = mil_104_hyglas_militia_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wodurch zeichnet sich ein guter Soldat aus?";
};


func int mil_104_hyglas_militia_condition()
{
	return TRUE;
};

func void mil_104_hyglas_militia_info()
{
	AI_Output(hero,self,"MIL_104_MILITIA_15_01");	//Wodurch zeichnet sich ein guter Soldat aus?
	AI_Output(self,hero,"MIL_104_MILITIA_08_02");	//Ein Soldat ist ein Kämpfer. Er ist Beschützer derer, die nicht kämpfen.
	AI_Output(self,hero,"MIL_104_MILITIA_08_03");	//Soldat zu sein, bedeutet mehr, als eine zeitlang eine Waffe zu tragen. Es ist der Weg des Lebens, den du wählst.
	AI_Output(self,hero,"MIL_104_MILITIA_08_04");	//Und wenn du dein Leben danach ausrichtest, wirst du ein guter Soldat.
	AI_Output(self,hero,"MIL_104_MILITIA_08_05");	//Ausserdem kann man gegen eine Menge Leute kämpfen!
};

