///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE WRK_226_Osric_EXIT   (C_INFO)
{
	npc         = WRK_226_Osric;
	nr          = 999;
	condition   = WRK_226_Osric_EXIT_Condition;
	information = WRK_226_Osric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT WRK_226_Osric_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID WRK_226_Osric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance WRK_226_Osric_HI		(C_INFO)
{
	npc		 = 	WRK_226_Osric;
	nr		 = 	1;
	condition	 = 	WRK_226_Osric_HI_Condition;
	information	 = 	WRK_226_Osric_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wer bist du?";
	description	 = 	"Kdo jsi?";
};

func int WRK_226_Osric_HI_Condition ()
{
	return TRUE;
};

func void WRK_226_Osric_HI_Info ()
{
//	AI_Output			(hero, self, "WRK_226_HI_15_01"); //Wer bist du?
	AI_Output			(hero, self, "WRK_226_HI_15_01"); //Kdo jsi?
//	AI_Output			(self, hero, "WRK_226_HI_00_02"); //Ich bin Osric. 
	AI_Output			(self, hero, "WRK_226_HI_00_02"); //Jsem Osric.  
};

///////////////////////////////////////////////////////////////////////
//	Info PFEILE
///////////////////////////////////////////////////////////////////////
instance WRK_226_Osric_PFEILE		(C_INFO)
{
	npc		 = 	WRK_226_Osric;
	nr		 = 	1;
	condition	 = 	WRK_226_Osric_PFEILE_Condition;
	information	 = 	WRK_226_Osric_PFEILE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"...und du schnitzt Pfeile...";
	description	 = 	"...a vyrábíš šípy...";
};

func int WRK_226_Osric_PFEILE_Condition ()
{	
	if Npc_KnowsInfo (hero,WRK_226_Osric_HI)
	{
		return TRUE;
	};
};
func void WRK_226_Osric_PFEILE_Info ()
{
//	AI_Output			(hero, self, "WRK_226_PFEILE_15_01"); //...und du schnitzt Pfeile...
	AI_Output			(hero, self, "WRK_226_PFEILE_15_01"); //...a vyrábíš šípy...
//	AI_Output			(self, hero, "WRK_226_PFEILE_00_02"); //Gut erkannt. 
	AI_Output			(self, hero, "WRK_226_PFEILE_00_02"); //Přesně tak.
};
///////////////////////////////////////////////////////////////////////
//	Info SELL
///////////////////////////////////////////////////////////////////////
instance WRK_226_Osric_SELL		(C_INFO)
{
	npc		 = 	WRK_226_Osric;
	nr		 = 	1;
	condition	 = 	WRK_226_Osric_SELL_Condition;
	information	 = 	WRK_226_Osric_SELL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Verkaufst du auch Pfeile?";
	description	 = 	"A prodáváš ty šípy?";
};

func int WRK_226_Osric_SELL_Condition ()
{
	if Npc_KnowsInfo (hero,WRK_226_Osric_PFEILE)
	{
		return TRUE;
	};
};
func void WRK_226_Osric_SELL_Info ()
{
//	AI_Output			(hero, self, "WRK_226_SELL_15_01"); //Verkaufst du auch Pfeile?
	AI_Output			(hero, self, "WRK_226_SELL_15_01"); //A prodáváš ty šípy?
//	AI_Output			(self, hero, "WRK_226_SELL_00_02"); //Nein.
	AI_Output			(self, hero, "WRK_226_SELL_00_02"); //Ne.
//	AI_Output			(self, hero, "WRK_226_SELL_00_03"); //Aber Helvegor verkauft Bögen und die Pfeile, die ich schnitze.
	AI_Output			(self, hero, "WRK_226_SELL_00_03"); //Ale Helvegor prodává luky a šípy, které vyrábím.
};
///////////////////////////////////////////////////////////////////////
//	Info TRAIN
///////////////////////////////////////////////////////////////////////
instance WRK_226_Osric_TRAIN		(C_INFO)
{
	npc		 = 	WRK_226_Osric;
	nr		 = 	1;
	condition	 = 	WRK_226_Osric_TRAIN_Condition;
	information	 = 	WRK_226_Osric_TRAIN_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kannst du mir beibringen, Pfeile zu schnitzen?";
	description	 = 	"Mohl bys mě naučit, jak šípy vyřezávat?";
};

func int WRK_226_Osric_TRAIN_Condition ()
{
	if Npc_KnowsInfo (hero,WRK_226_Osric_PFEILE)
	{
		return TRUE;
	};
};

func void WRK_226_Osric_TRAIN_Info ()
{
//	AI_Output			(hero, self, "WRK_226_TRAIN_15_01"); //Kannst du mir beibringen, Pfeile zu schnitzen?
	AI_Output			(hero, self, "WRK_226_TRAIN_15_01"); //Mohl bys mě naučit, jak šípy vyřezávat?
//	AI_Output			(self, hero, "WRK_226_TRAIN_00_02"); //Nein, dazu habe ich keine Zeit. 
	AI_Output			(self, hero, "WRK_226_TRAIN_00_02"); //Ne, na to nemám čas.
};
