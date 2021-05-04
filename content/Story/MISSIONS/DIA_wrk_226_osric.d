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

	description	 = 	"Wer bist du?";
};

func int WRK_226_Osric_HI_Condition ()
{
	return TRUE;
};

func void WRK_226_Osric_HI_Info ()
{
	AI_Output			(hero, self, "WRK_226_HI_15_01"); //Wer bist du?
	AI_Output			(self, hero, "WRK_226_HI_00_02"); //Ich bin Osric. 
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

	description	 = 	"...und du schnitzt Pfeile...";
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
	AI_Output			(hero, self, "WRK_226_PFEILE_15_01"); //...und du schnitzt Pfeile...
	AI_Output			(self, hero, "WRK_226_PFEILE_00_02"); //Gut erkannt. 
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

	description	 = 	"Verkaufst du auch Pfeile?";
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
	AI_Output			(hero, self, "WRK_226_SELL_15_01"); //Verkaufst du auch Pfeile?
	AI_Output			(self, hero, "WRK_226_SELL_00_02"); //Nein.
	AI_Output			(self, hero, "WRK_226_SELL_00_03"); //Aber Helvegor verkauft Bögen und die Pfeile, die ich schnitze.
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

	description	 = 	"Kannst du mir beibringen, Pfeile zu schnitzen?";
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
	AI_Output			(hero, self, "WRK_226_TRAIN_15_01"); //Kannst du mir beibringen, Pfeile zu schnitzen?
	AI_Output			(self, hero, "WRK_226_TRAIN_00_02"); //Nein, dazu habe ich keine Zeit. 
};












