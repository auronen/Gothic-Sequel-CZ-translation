

 
///////////////////////////////////////////////////////////////////////
//	Info TalamonsRecipeHint
///////////////////////////////////////////////////////////////////////
instance MIL_141_Militia_TALAMONSRECIPEHINT		(C_INFO)
{
	npc		 = 	MIL_141_Militia;
	condition	 = 	MIL_141_Militia_TALAMONSRECIPEHINT_Condition;
	information	 = 	MIL_141_Militia_TALAMONSRECIPEHINT_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_141_Militia_TALAMONSRECIPEHINT_Condition ()
{
	if int_TalamonGetReceipe
	|| int_TalamonRecipeForMoney
	{
		return TRUE;
	};
	return FALSE;
};

func void MIL_141_Militia_TALAMONSRECIPEHINT_Info ()
{
//	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_00_01"); //Du siehst so aus, als ob Du was suchst
	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_00_01"); //Vypadáš, jako bys něco hledal
//	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_15_02"); //Und ...
	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_15_02"); //A ...
	
//	Info_AddChoice	(MIL_141_Militia_TALAMONSRECIPEHINT, "Das geht Dich gar nichts an.", MIL_141_Militia_TALAMONSRECIPEHINT_No );
	Info_AddChoice	(MIL_141_Militia_TALAMONSRECIPEHINT, "To není tvoje starost.", MIL_141_Militia_TALAMONSRECIPEHINT_No );

//	Info_AddChoice	(MIL_141_Militia_TALAMONSRECIPEHINT, "Ich frag mich, ob man irgendwie an den Grund des Brunnens kommt.", MIL_141_Militia_TALAMONSRECIPEHINT_YES );
	Info_AddChoice	(MIL_141_Militia_TALAMONSRECIPEHINT, "Zajímalo by mě, jestli se dá nějak dostat na dno studny.", MIL_141_Militia_TALAMONSRECIPEHINT_YES );



};
func void MIL_141_Militia_TALAMONSRECIPEHINT_YES ()
{
//	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_YES_15_01"); //Ich frag mich, ob man irgendwie an den Grund des Brunnens kommt.
	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_YES_15_01"); //Zajímalo by mě, jestli se dá nějak dostat na dno studny.
//	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_YES_00_02"); //Käme man, aber dafür mußt Du durch unser Quartier und dann in den Keller
	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_YES_00_02"); //Šlo by to, ale to bys musel jít přes naše pokoje a pak do sklepa.
	AI_StopProcessInfos	(self);

};

func void MIL_141_Militia_TALAMONSRECIPEHINT_No ()
{
//	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_No_15_01"); //Das geht Dich gar nichts an.
	AI_Output			(hero, self, "MIL_141_TALAMONSRECIPEHINT_No_15_01"); //To není tvoje starost.
//	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_No_00_02"); //Na gut, ich wollte nur helfen, aber dann hilf Dir doch selbst.
	AI_Output			(self, hero, "MIL_141_TALAMONSRECIPEHINT_No_00_02"); //No dobře, jen jsem chtěl pomoct, ale tak si pomož sám.
	AI_StopProcessInfos	(self);
};










