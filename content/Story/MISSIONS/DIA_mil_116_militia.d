
instance MIL_116_MILITIA_WAIT(C_Info)
{
	npc = mil_116_militia;
	nr = 12;
	condition = mil_116_militia_wait_condition;
	information = mil_116_militia_wait_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_116_militia_wait_condition()
{
	if(SUBCHAPTER < CH1_ARRIVED_AT_OC)
	{
		return TRUE;
	};
};

func void mil_116_militia_wait_info()
{
	AI_Output(self,hero,"MIL_116_WAIT_06_01");	//Hey, wo willst du hin?
	Info_AddChoice(mil_116_militia_wait,"Ich suche meinen alten Freund Diego.",mil_116_militia_wait_trouble);
	Info_AddChoice(mil_116_militia_wait,"Ich will ins Lager.",mil_116_militia_wait_camp);
};

func void mil_116_militia_wait_camp()
{
	AI_Output(hero,self,"MIL_116_WAIT_CAMP_15_01");	//Ich will ins Lager.
	AI_Output(self,hero,"MIL_116_WAIT_CAMP_06_02");	//Auf der Flucht vor den Orks , wie?
	AI_Output(self,hero,"MIL_116_WAIT_CAMP_06_03");	//Damit das eine mal klar ist, hier drin wird gearbeitet und trainiert.
	AI_Output(self,hero,"MIL_116_WAIT_CAMP_06_04");	//Wenn du vorhast Ärger zu machen, kannst du direkt wieder gehen.
	SUBCHAPTER = CH1_ARRIVED_AT_OC;
	AI_StopProcessInfos(self);
};

func void mil_116_militia_wait_trouble()
{
	AI_Output(hero,self,"MIL_116_WAIT_TROUBLE_15_01");	//Ich suche meinen alten Freund Diego.
	AI_Output(self,hero,"MIL_116_WAIT_TROUBLE_06_02");	//Schon wieder einer, der meint ein Freund von Diego zu sein.
	AI_Output(self,hero,"MIL_116_WAIT_TROUBLE_06_03");	//Damit das klar ist, Bürschchen. Diego ist hier der Boss im Lager und er hat bestimmt keine Zeit, mit jedem dahergelaufenen Penner zu reden.
	AI_Output(hero,self,"MIL_116_WAIT_TROUBLE_15_04");	//Und wo finde ich nun ...euren Boss?
	AI_Output(self,hero,"MIL_116_WAIT_TROUBLE_06_05");	//Er hält Rat im alten Erzbaronhaus innerhalb der Burg. Und nun zieh Leine!
	SUBCHAPTER = CH1_ARRIVED_AT_OC;
	AI_StopProcessInfos(self);
};


instance MIL_116_MILITIA_DEFEAT(C_Info)
{
	npc = mil_116_militia;
	nr = 12;
	condition = mil_116_militia_defeat_condition;
	information = mil_116_militia_defeat_info;
	important = TRUE;
	permanent = TRUE;
};


func int mil_116_militia_defeat_condition()
{
	if(Npc_KnowsInfo(hero,mil_116_militia_wait) && (self.aivar[13] == TRUE) && c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void mil_116_militia_defeat_info()
{
	AI_Output(self,hero,"MIL_116_DEFEAT_06_01");	//Willst du noch 'ne Runde?
};


instance MIL_116_MILITIA_ORECAVE(C_Info)
{
	npc = mil_116_militia;
	nr = 1;
	condition = mil_116_militia_orecave_condition;
	information = mil_116_militia_orecave_info;
	important = FALSE;
	permanent = FALSE;
	description = "Weisst du was von einer Molerat-Höhle hier in der Nähe?";
};


func int mil_116_militia_orecave_condition()
{
	if(Npc_KnowsInfo(hero,info_gotmar_whereore3))
	{
		return TRUE;
	};
};

func void mil_116_militia_orecave_info()
{
	AI_Output(hero,self,"MIL_116_ORECAVE_15_01");	//Weisst du was von einer Molerat-Höhle hier in der Nähe?
	AI_Output(self,hero,"MIL_116_ORECAVE_06_02");	//Siehst du da drüben die Brücke über den Fluss?
	AI_Output(hero,self,"MIL_116_ORECAVE_15_03");	//Ja!
	AI_Output(self,hero,"MIL_116_ORECAVE_06_04");	//Links davon ist eine Höhle in der sich solche Biester eingenistet haben.
	AI_Output(self,hero,"MIL_116_ORECAVE_06_05");	//Diese Viecher sind ziemlich hinterhältig. Beobachten einen nur und beissen genau in dem Moment zu, in dem man selbst zum Schlag ausholen will.
};

