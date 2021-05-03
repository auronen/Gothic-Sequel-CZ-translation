
instance WRK_203_BROMOR_EXIT(C_Info)
{
	npc = wrk_203_bromor;
	nr = 999;
	condition = wrk_203_bromor_exit_condition;
	information = wrk_203_bromor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int wrk_203_bromor_exit_condition()
{
	return TRUE;
};

func void wrk_203_bromor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance WRK_203_BROMOR_HI(C_Info)
{
	npc = wrk_203_bromor;
	condition = wrk_203_bromor_hi_condition;
	information = wrk_203_bromor_hi_info;
	description = "Was machst du hier?";
};


func int wrk_203_bromor_hi_condition()
{
	return TRUE;
};

func void wrk_203_bromor_hi_info()
{
	AI_Output(other,self,"WRK_203_Bromor_HI_Info_15_01");	//Was machst du hier?
	AI_Output(self,other,"WRK_203_Bromor_HI_Info_00_02");	//Ich bin der Baumeister. Ich muss mich um die Arbeiter und die Organisation kümmern.
	AI_Output(self,other,"WRK_203_Bromor_HI_Info_00_03");	//Zur Zeit arbeiten wir am Aussenwall. Das ist das Wichtigste. Suchst du Arbeit?
	Info_ClearChoices(wrk_203_bromor_hi);
	Info_AddChoice(wrk_203_bromor_hi,"Nein, ich bin nur interessiert",wrk_203_bromor_hi_no);
	Info_AddChoice(wrk_203_bromor_hi,"Ja, ich suche Arbeit",wrk_203_bromor_hi_yes);
};

func void wrk_203_bromor_hi_yes()
{
	AI_Output(other,self,"WRK_203_Bromor_HI_YES_Info_15_01");	//Ja, ich suche Arbeit.
	AI_Output(self,other,"WRK_203_Bromor_HI_YES_Info_00_02");	//Im Moment habe ich keine Arbeit für dich. Frag mal Diego. Oder die Jungs von der Miliz. So einen wie dich können die bestimmt brauchen.
	Info_ClearChoices(wrk_203_bromor_hi);
};

func void wrk_203_bromor_hi_no()
{
	AI_Output(other,self,"WRK_203_Bromor_HI_NO_Info_15_01");	//Nein, ich bin nur interessiert.
	AI_Output(self,other,"WRK_203_Bromor_HI_NO_Info_00_02");	//Als wir hier ankamen, lag das halbe Lager in Schutt und Asche.
	AI_Output(self,other,"WRK_203_Bromor_HI_NO_Info_00_03");	//Aber wir haben nicht die Hände in den Schoß gelegt, sondern Material beschafft und losgelegt.
	AI_Output(self,other,"WRK_203_Bromor_HI_NO_Info_00_04");	//Ja, wir haben schon eine ganze Menge geschafft.
	Info_ClearChoices(wrk_203_bromor_hi);
};


instance WRK_203_BROMOR_HOW(C_Info)
{
	npc = wrk_203_bromor;
	nr = 12;
	condition = wrk_203_bromor_how_condition;
	information = wrk_203_bromor_how_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie kommt ihr voran?";
};


func int wrk_203_bromor_how_condition()
{
	if(Npc_KnowsInfo(hero,wrk_203_bromor_hi))
	{
		return TRUE;
	};
};

func void wrk_203_bromor_how_info()
{
	AI_Output(hero,self,"WRK_203_HOW_15_01");	//Wie kommt ihr voran?
	AI_Output(self,hero,"WRK_203_HOW_09_02");	//Es ist zum Kotzen! Wir hinken unserem Zeitplan um drei Wochen hinterher!
	AI_Output(self,hero,"WRK_203_HOW_09_03");	//Jedem Arbeiter muss ich genau sagen, was er machen soll, sonst bringen die es fertig und reissen den Wall ein, anstatt ihn aufzubauen!
	AI_Output(self,hero,"WRK_203_HOW_09_04");	//Die meisten hier halten mich für einen 'Sklaventreiber'. Aber die Arbeit muss gemacht werden und die Jungs arbeiten.
};


instance WRK_203_BROMOR_TROPHYS(C_Info)
{
	npc = wrk_203_bromor;
	nr = 23;
	condition = wrk_203_bromor_trophys_condition;
	information = wrk_203_bromor_trophys_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich hörte, du sammelst Trophäen?";
};


func int wrk_203_bromor_trophys_condition()
{
	if(Npc_KnowsInfo(hero,beg_701_jose_news))
	{
		return TRUE;
	};
};

func void wrk_203_bromor_trophys_info()
{
	AI_Output(hero,self,"WRK_203_TROPHYS_15_01");	//Ich hörte, du sammelst Trophäen?
	AI_Output(self,hero,"WRK_203_TROPHYS_09_02");	//Das stimmt. Aber nicht dieses Wolfs- und Scavenger Zeug. Davon habe ich schon genug.
	AI_Output(self,hero,"WRK_203_TROPHYS_09_03");	//Aber wenn du mir ein SchattenläuferHorn oder -Fell bringst, dafür zahle ich hundert Silberstücke!
};


instance WRK_203_BROMOR_TRADE(C_Info)
{
	npc = wrk_203_bromor;
	nr = 44;
	condition = wrk_203_bromor_trade_condition;
	information = wrk_203_bromor_trade_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe hier was für dich";
};


func int wrk_203_bromor_trade_condition()
{
	if(Npc_KnowsInfo(hero,wrk_203_bromor_trophys) && ((BROMOR_SHADOWHORN == FALSE) || (BROMOR_SHADOWFUR == FALSE)) && ((Npc_HasItems(hero,itat_shadowfur) >= 1) || (Npc_HasItems(hero,itat_shadowhorn) >= 1)))
	{
		return TRUE;
	};
};

func void wrk_203_bromor_trade_info()
{
	AI_Output(hero,self,"WRK_203_TRADE_15_01");	//Ich habe hier was für dich.
	if(BROMOR_SHADOWFUR == FALSE)
	{
		Info_AddChoice(wrk_203_bromor_trade,"Fell geben",wrk_203_bromor_trade_fur);
	};
	if(BROMOR_SHADOWHORN == FALSE)
	{
		Info_AddChoice(wrk_203_bromor_trade,"Horn geben",wrk_203_bromor_trade_horn);
	};
};

func void wrk_203_bromor_trade_horn()
{
	AI_Output(hero,self,"WRK_203_TRADE_HORN_15_01");	//Hier ist das Horn eines Schattenläufers.
	B_GiveInvItems(hero,self,itat_shadowhorn,1);
	AI_Output(self,hero,"WRK_203_TRADE_HORN_09_02");	//Weißt du eigentlich, wie lange ich danach suche?
	AI_Output(self,hero,"WRK_203_TRADE_HORN_09_03");	//Hier ist dein Silber, du hast es dir verdient!
	B_GiveInvItems(self,hero,itmi_silver,100);
	BROMOR_SHADOWHORN = TRUE;
};

func void wrk_203_bromor_trade_fur()
{
	AI_Output(hero,self,"WRK_203_TRADE_FUR_15_01");	//Ich habe hier das Fell eines Schattenläufers.
	B_GiveInvItems(hero,self,itat_shadowfur,1);
	AI_Output(self,hero,"WRK_203_TRADE_FUR_09_02");	//Ausgezeichnet. Dann sollst du auch dein Silber bekommen.
	B_GiveInvItems(self,hero,itmi_silver,100);
	BROMOR_SHADOWFUR = TRUE;
};


instance WRK_203_BROMOR_RASSMUSON(C_Info)
{
	npc = wrk_203_bromor;
	nr = 12;
	condition = wrk_203_bromor_rassmuson_condition;
	information = wrk_203_bromor_rassmuson_info;
	important = FALSE;
	permanent = FALSE;
	description = "Rassmuson will abhauen!";
};


func int wrk_203_bromor_rassmuson_condition()
{
	if((KNOWS_RASSMUSON == TRUE) || Npc_KnowsInfo(hero,wrk_212_rassmuson_hi))
	{
		return TRUE;
	};
};

func void wrk_203_bromor_rassmuson_info()
{
	AI_Output(hero,self,"WRK_203_RASSMUSON_15_01");	//Rassmuson will abhauen!
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_02");	//Warum erzähslt du mir das? Willst du dich mit mir gut stellen?
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_03");	//Glaubst du etwa, ich sehe nicht, das er nicht arbeitet?
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_04");	//Hast du geglaubt, ich würde dich belohnen, wenn du mir das erzählst?
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_05");	//Manche nennen mich einen Sklaventreiber. Vielleicht bin ich manchmal zu hart mit den Jungs.
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_06");	//Aber Typen wie du, bringen mich zum Kotzen! Du hast keinen Anstand, kein Ehrgefühl und keinen Stolz.
	AI_Output(self,hero,"WRK_203_RASSMUSON_09_07");	//Geh mir aus den Augen, du schmieriger Wicht!
	b_setattitude(self,ATT_ANGRY);
};

