///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////

// Haben keine Exit,weil schon AmbientInfos vorhanden sind!

///////////////////////////////////////////////////////////////////////
//	Info STOP
///////////////////////////////////////////////////////////////////////
instance MIL_139_Militia_STOP		(C_INFO)
{
	npc		 = 	MIL_139_Militia;
	nr		 = 	1;
	condition	 = 	MIL_139_Militia_STOP_Condition;
	information	 = 	MIL_139_Militia_STOP_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int MIL_139_Militia_STOP_Condition ()
{
	if  Npc_IsInRoutine (self,ZS_GuardFP)
	&& (Npc_GetDistToWP (self,"OCR_OUTSIDE_CAMPFIRE_D_1") <= 700)
	&& !Npc_KnowsInfo (hero,MIL_129_Militia_STOP)
	&& !Npc_KnowsInfo (hero,MIL_130_Militia_STOP)
	&& !Npc_KnowsInfo (hero,MIL_140_Militia_STOP)
	{
		return TRUE;
	};
};

func void MIL_139_Militia_STOP_Info ()
{
//	AI_Output			(self, hero, "MIL_139_STOP_00_01"); //HALT! Du betrittst jetzt das Viertel der Kranken!
	AI_Output			(self, hero, "MIL_139_STOP_00_01"); //STÁT! Vstupuješ do čtvrti nemocných!
//	AI_Output			(hero, self, "MIL_139_STOP_15_02"); //Ja und?
	AI_Output			(hero, self, "MIL_139_STOP_15_02"); //No a?
//	AI_Output			(self, hero, "MIL_139_STOP_00_03"); //Ich warne dich nur. Besser ist, du hälst dich von ihnen fern! Sonst könntest du dich anstecken!
	AI_Output			(self, hero, "MIL_139_STOP_00_03"); //Jen tě varuji. Bude lepší, když se od nich budeš držet dále! Jinak by ses mohl nakazit!	
//	AI_Output			(hero, self, "MIL_139_STOP_15_04"); //Ich bin vorsichtig.
	AI_Output			(hero, self, "MIL_139_STOP_15_04"); //Jsem opatrný.
//	AI_Output			(self, hero, "MIL_139_STOP_00_05"); //Das wäre auch klüger. Denn falls du dich ansteckst, darfst du das Viertel der Kranken nicht mehr verlassen!
	AI_Output			(self, hero, "MIL_139_STOP_00_05"); //To by bylo moudré. Pokud by ses nakazil, už bys nesměl čtvrť nemocných opustit!	
	AI_StopProcessInfos	(self);
};


