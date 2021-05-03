
instance MIL_141_MILITIA_TALAMONSRECIPEHINT(C_Info)
{
	npc = mil_141_militia;
	condition = mil_141_militia_talamonsrecipehint_condition;
	information = mil_141_militia_talamonsrecipehint_info;
	important = TRUE;
	permanent = FALSE;
};


func int mil_141_militia_talamonsrecipehint_condition()
{
	if(INT_TALAMONGETRECEIPE || INT_TALAMONRECIPEFORMONEY)
	{
		return TRUE;
	};
	return FALSE;
};

func void mil_141_militia_talamonsrecipehint_info()
{
	AI_Output(self,hero,"MIL_141_TALAMONSRECIPEHINT_00_01");	//Du siehst so aus, als ob Du was suchst
	AI_Output(hero,self,"MIL_141_TALAMONSRECIPEHINT_15_02");	//Und ...
	Info_AddChoice(mil_141_militia_talamonsrecipehint,"Das geht Dich gar nichts an.",mil_141_militia_talamonsrecipehint_no);
	Info_AddChoice(mil_141_militia_talamonsrecipehint,"Ich frag mich, ob man irgendwie an den Grund des Brunnens kommt.",mil_141_militia_talamonsrecipehint_yes);
};

func void mil_141_militia_talamonsrecipehint_yes()
{
	AI_Output(hero,self,"MIL_141_TALAMONSRECIPEHINT_YES_15_01");	//Ich frag mich, ob man irgendwie an den Grund des Brunnens kommt.
	AI_Output(self,hero,"MIL_141_TALAMONSRECIPEHINT_YES_00_02");	//Käme man, aber dafür mußt Du durch unser Quartier und dann in den Keller
	AI_StopProcessInfos(self);
};

func void mil_141_militia_talamonsrecipehint_no()
{
	AI_Output(hero,self,"MIL_141_TALAMONSRECIPEHINT_No_15_01");	//Das geht Dich gar nichts an.
	AI_Output(self,hero,"MIL_141_TALAMONSRECIPEHINT_No_00_02");	//Na gut, ich wollte nur helfen, aber dann hilf Dir doch selbst.
	AI_StopProcessInfos(self);
};

