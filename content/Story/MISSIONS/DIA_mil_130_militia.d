///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////

// Haben keine Exit,weil schon AmbientInfos vorhanden sind!

///////////////////////////////////////////////////////////////////////
//	Info STOP
///////////////////////////////////////////////////////////////////////
instance MIL_130_Militia_STOP		(C_INFO)
{
	npc		 = 	MIL_130_Militia;
	nr		 = 	1;
	condition	 = 	MIL_130_Militia_STOP_Condition;
	information	 = 	MIL_130_Militia_STOP_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_130_Militia_STOP_Condition ()
{
	if  Npc_IsInRoutine (self,ZS_GuardFP)
	&& (Npc_GetDistToWP (self,"OCR_TO_GHETTO_2") <= 700)
	&& !Npc_KnowsInfo (hero,MIL_129_Militia_STOP)
	{
		return TRUE;
	};
};

func void MIL_130_Militia_STOP_Info ()
{
//	AI_Output			(self, hero, "MIL_130_STOP_00_01"); //HALT! Du betrittst jetzt das Viertel der Kranken!
	AI_Output			(self, hero, "MIL_130_STOP_00_01"); //STÁT! Vstupuješ do čtvrti nemocných!
//	AI_Output			(hero, self, "MIL_130_STOP_15_02"); //Ja und?
	AI_Output			(hero, self, "MIL_130_STOP_15_02"); //No a?
//	AI_Output			(self, hero, "MIL_130_STOP_00_03"); //Niemand weiß, was es mit der Krankheit auf sich hat. Besser du hälst dich fern von diesen Gestalten!
	AI_Output			(self, hero, "MIL_130_STOP_00_03"); //Nikdo neví, co je to za nemoc. Raději se odsud drž dále!
//	AI_Output			(hero, self, "MIL_130_STOP_15_04"); //Ich bin vorsichtig.
	AI_Output			(hero, self, "MIL_130_STOP_15_04"); //Já jsem opatrný.
	AI_StopProcessInfos	(self);
};







