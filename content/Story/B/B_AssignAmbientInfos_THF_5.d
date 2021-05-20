instance  Infos_Thf_5_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Thf_5_Exit_Condition;
	information	=  Infos_Thf_5_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Infos_Thf_5_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Thf_5_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
instance  Infos_Thf_5_HI (C_INFO)
{
	
	condition		= Infos_Thf_5_HI_Condition;
	information		= Infos_Thf_5_HI_Info;
//	description		= "Wie läufts?"; 
	description		= "Jak to jde?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_5_HI_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_5_HI_Info()
{
//	AI_Output (other, self,"Infos_Thf_5_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Thf_5_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Thf_5_HI_Info_01_02"); //Mach es wie ich, lebe in den Tag!
	AI_Output (self, other,"Infos_Thf_5_HI_Info_01_02"); //Dělej to jako já, žij naplno každý den!
//	AI_Output (other, self,"Infos_Thf_5_HI_Info_15_03"); //Du scheinst ja richtig gut drauf zu sein.
	AI_Output (other, self,"Infos_Thf_5_HI_Info_15_03"); //Zdá se, že máš opravdu dobrou náladu.
//	AI_Output (self, other,"Infos_Thf_5_HI_Info_01_04"); //Denn jeder Tag könnte dein letzter sein! Wer weiß ob nicht morgen schon die Orks angreifen? 	
	AI_Output (self, other,"Infos_Thf_5_HI_Info_01_04"); //Protože každý den může být tvůj poslední! Kdo ví, třeba skřeti zaútočí zítra?
};  
///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
/*
instance  Infos_Thf_5_STORY (C_INFO)
{
	
	condition		= Infos_Thf_5_STORY_Condition;
	information		= Infos_Thf_5_STORY_Info;
	description		= "Was gibt's Neues?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_5_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Thf_5_STORY_Info()
{
	
	AI_Output (other, self,"Infos_Thf_5_STORY_Info_15_01"); //Was gibt's Neues?
	AI_Output (self, other,"Infos_Thf_5_STORY_Info_05_02"); //Die Orks haben das Tal umzingelt aber warum greifen sie nicht an? 
	AI_Output (self, other,"Infos_Thf_5_STORY_Info_05_03"); //Sie haben bestimmt Angst vor der Lichtsäule. 
	AI_Output (self, other,"Infos_Thf_5_STORY_Info_05_04"); //Solange die Lichtsäule da ist, werden sie nicht angreifen. Hoffe ich zumindest...
};
*/
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance  Infos_Thf_5_CAMP (C_INFO)
{
	
	condition		= Infos_Thf_5_CAMP_Condition;
	information		= Infos_Thf_5_CAMP_Info;
//	description		= "Wie siehts im Lager aus?"; 
	description		= "Jak to vypadá v táboře?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_5_CAMP_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_5_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Thf_5_CAMP_Info_15_01"); //Wie siehts im Lager aus? 
	AI_Output (other, self,"Infos_Thf_5_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Thf_5_CAMP_Info_01_02"); //Die einzige Abwechslung die es hier gibt sind die abendlichen Arenakämpfe.  
	AI_Output (self, other,"Infos_Thf_5_CAMP_Info_01_02"); //Jediným oživením jsou večerní souboje v aréně.
//	AI_Output (self, other,"Infos_Thf_5_CAMP_Info_01_03"); //Den Rest wirst du schon mit der Zeit selber rausfinden.
	AI_Output (self, other,"Infos_Thf_5_CAMP_Info_01_03"); //Na zbytek si časem přijdeš sám.
	
		var C_NPC Nicolos; Nicolos = Hlp_GetNpc (WRK_206_Nicolos); 
	Nicolos.aivar[AIV_FINDABLE] = TRUE;
};  

instance  Infos_Thf_5_BOSS (C_INFO)
{
	
	condition		= Infos_Thf_5_BOSS_Condition;
	information		= Infos_Thf_5_BOSS_Info;
//	description		= "Wer hat hier das Sagen?"; 
	description		= "Kdo to tu má na starost?"; 
};
FUNC int  Infos_Thf_5_BOSS_Condition()
{	
		return TRUE;
};
FUNC void  Infos_Thf_5_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Thf_5_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Thf_5_BOSS_Info_15_01"); //Kdo to tu má na starost?
//	AI_Output (self, other,"Infos_Thf_5_BOSS_Info_01_02"); //Unterschiedlich. Die Arbeiter lassen sich nur was vom Baumeister sagen, die Miliz von ihrem Hauptmann, und der Rest lässt sich von keinem was sagen.
	AI_Output (self, other,"Infos_Thf_5_BOSS_Info_01_02"); //Tak různě. Dělníci poslouchají pouze svého stavebního mistra, milici vede jejich kapitán a zbytek nikoho neposlouchá.
};  

// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Thf_5(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);
	
	Infos_Thf_5_Exit.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_5_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Thf_5_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_5_BOSS.npc						= Hlp_GetInstanceID(slf);
};


