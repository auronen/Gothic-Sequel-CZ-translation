instance MIL_118_Calgor_Exit (C_INFO)
{
	npc			=  MIL_118_Calgor;
	nr			=  999;
	condition	=  MIL_118_Calgor_Exit_Condition;
	information	=  MIL_118_Calgor_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  MIL_118_Calgor_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  MIL_118_Calgor_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance MIL_118_Calgor_HI		(C_INFO)
{
	npc		 = 	MIL_118_Calgor;
	nr		 = 	12;
	condition	 = 	MIL_118_Calgor_HI_Condition;
	information	 = 	MIL_118_Calgor_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tady děláš?";
};

func int MIL_118_Calgor_HI_Condition ()
{
	return TRUE;
};

func void MIL_118_Calgor_HI_Info ()
{
//	AI_Output			(hero, self, "MIL_118_HI_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "MIL_118_HI_15_01"); //Co tady děláš?
//	AI_Output			(self, hero, "MIL_118_HI_08_02"); //Ich bin Calgor, Soldat der ... dieses Haufens.
	AI_Output			(self, hero, "MIL_118_HI_08_02"); //Jsem Calgor, voják ... téhle bandy.
//	AI_Output			(self, hero, "MIL_118_HI_08_03"); //Hier im Lager wimmelt es nur so von Halsabschneidern und Dieben.
	AI_Output			(self, hero, "MIL_118_HI_08_03"); //Tady v táboře se to jenom hemží hrdlořezy a zloději.
//	AI_Output			(self, hero, "MIL_118_HI_08_04"); //Aber niemand tut was dagegen. Ja, wenn der König hier wäre, er würde hier Ordnung und Disziplin reinbringen.
	AI_Output			(self, hero, "MIL_118_HI_08_04"); //Ale nikdo s tím nic nedělá. Jo, kdyby tu byl král, ten by sem přinesl pořádek a disciplínu.
//	AI_Output			(self, hero, "MIL_118_HI_08_05"); //Aber der weiß schon, warum er nicht hier ist, er hat sich um wichtigeres zu kümmern, als um diesen Haufen Gesindel!
	AI_Output			(self, hero, "MIL_118_HI_08_05"); //Ale on ví, proč tady není, má důležitější věci na práci než se starat o tuhle zchátralou bandu!
};



















