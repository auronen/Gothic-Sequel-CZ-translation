
instance BEG_702_NABOR_EXIT(C_Info)
{
	npc = beg_702_nabor;
	nr = 999;
	condition = beg_702_nabor_exit_condition;
	information = beg_702_nabor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int beg_702_nabor_exit_condition()
{
	return TRUE;
};

func void beg_702_nabor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_702_NABOR_TIP(C_Info)
{
	npc = beg_702_nabor;
	nr = 1;
	condition = beg_702_nabor_tip_condition;
	information = beg_702_nabor_tip_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was machst du hier?";
};


func int beg_702_nabor_tip_condition()
{
	return TRUE;
};

func int beg_702_nabor_tip_info()
{
	AI_Output(hero,self,"BEG_702_TIP_15_01");	//Was machst du hier?
	AI_Output(self,hero,"BEG_702_TIP_00_02");	//Ich sitze hier und frage mich, ob du der Richtige bist.
	AI_Output(hero,self,"BEG_702_TIP_15_03");	//Der Richtige? Wofür?
	AI_Output(self,hero,"BEG_702_TIP_00_04");	//Der richtige Mann, der eine wertvolle Information für wenig Silber kaufen will. Aber ich glaube, du bist es nicht. Oder doch?
	Info_AddChoice(beg_702_nabor_tip,"Ich bin der Richtige. Her mit der Information.",beg_702_nabor_tip_rightman);
	Info_AddChoice(beg_702_nabor_tip,"Wie teuer ist deine Information?",beg_702_nabor_tip_howmuch);
	Info_AddChoice(beg_702_nabor_tip,"Ich glaube du willst nur schnell ein bisschen Silber abstauben. ",beg_702_nabor_tip_trick);
};

func void beg_702_nabor_tip_trick()
{
	AI_Output(hero,self,"BEG_702_TIP_TRICK_15_01");	//Ich glaube du willst nur schnell ein bisschen Silber abstauben.
	AI_Output(self,hero,"BEG_702_TIP_TRICK_00_02");	//Ich wußte doch das du nicht der Richtige bist.
	AI_StopProcessInfos(self);
};

func void beg_702_nabor_tip_howmuch()
{
	AI_Output(hero,self,"BEG_702_TIP_HOWMUCH_15_01");	//Wie teuer ist deine Information?
	AI_Output(self,hero,"BEG_702_TIP_HOWMUCH_00_02");	//Für dich nur 10 Silberstücke. Wenn du die hast, kommen wir ins Geschäft.
	NABOR_10 = TRUE;
	Info_ClearChoices(beg_702_nabor_tip);
};

func void beg_702_nabor_tip_rightman()
{
	AI_Output(hero,self,"BEG_702_TIP_RIGHTMAN_15_01");	//Ich bin der Richtige. Her mit der Information.
	AI_Output(self,hero,"BEG_702_TIP_RIGHTMAN_00_02");	//Die kostet allerdings 20 Silberstücke. Kein Verhandeln. Kein Feilschen. Sprich mich an, wenn du das Geld hast.
	NABOR_20 = TRUE;
	Info_ClearChoices(beg_702_nabor_tip);
};


instance BEG_702_NABOR_BUYINFO(C_Info)
{
	npc = beg_702_nabor;
	nr = 1;
	condition = beg_702_nabor_buyinfo_condition;
	information = beg_702_nabor_buyinfo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Okay, hier ist dein Silber";
};


func int beg_702_nabor_buyinfo_condition()
{
	if(((Npc_HasItems(hero,itmi_silver) >= 20) && NABOR_20) || ((Npc_HasItems(hero,itmi_silver) >= 10) && NABOR_10))
	{
		return TRUE;
	};
};

func int beg_702_nabor_buyinfo_info()
{
	if(NABOR_20)
	{
		AI_Output(hero,self,"BEG_702_BUYINFO_15_01");	//Okay, hier sind die 20 Silberstücke.
		B_GiveInvItems(hero,self,itmi_silver,20);
	};
	if(NABOR_10)
	{
		AI_Output(hero,self,"BEG_702_BUYINFO_15_02");	//Okay, hier sind die 10 Silberstücke.
		B_GiveInvItems(hero,self,itmi_silver,10);
	};
	AI_Output(self,hero,"BEG_702_BUYINFO_00_03");	//Okay, hier ist die Information. Also hör gut zu: Viele halten uns nur für Bettler. Und das ist gut so.
	AI_Output(self,hero,"BEG_702_BUYINFO_00_04");	//Aber wir sind die Augen und die Ohren dieses Lagers. Alles was hier passiert, jedes krumme Ding das gedreht wird...
	AI_Output(self,hero,"BEG_702_BUYINFO_00_05");	//Wir wissen es.
	AI_Output(self,hero,"BEG_702_BUYINFO_00_06");	//Und wir verwahren dieses Wissen. Und du bist der Mann, der davon profitieren kann.
	AI_Output(hero,self,"BEG_702_BUYINFO_15_07");	//Was meinst du damit?
	AI_Output(self,hero,"BEG_702_BUYINFO_00_08");	//Zeige dich den Bettlern dreimal großzügig. Dann suche Jesper. Er hat dir bestimmt interessante Dinge zu erzählen.
	AI_Output(hero,self,"BEG_702_BUYINFO_15_09");	//Warum erzählst du das gerade mir?
	AI_Output(self,hero,"BEG_702_BUYINFO_00_10");	//Weil du der richtige bist. Und weil wir ja auch davon profitieren , dir unser Wissen zu Verfügung zu stellen. Gegen ein kleines Entgelt...
};


instance BEG_702_NABOR_WHERE(C_Info)
{
	npc = beg_702_nabor;
	nr = 1;
	condition = beg_702_nabor_where_condition;
	information = beg_702_nabor_where_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wo finde ich Jesper?";
};


func int beg_702_nabor_where_condition()
{
	if(Npc_KnowsInfo(hero,beg_702_nabor_buyinfo))
	{
		return TRUE;
	};
};

func void beg_702_nabor_where_info()
{
	AI_Output(hero,self,"BEG_702_WHERE_15_01");	//Wo finde ich Jesper?
	AI_Output(self,hero,"BEG_702_WHERE_00_02");	//Du musst ihn schon alleine finden. Ich nehme an, das wird keine Herausforderung für dich sein.
};

