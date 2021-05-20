instance  Infos_Thf_10_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Thf_10_Exit_Condition;
	information	=  Infos_Thf_10_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Infos_Thf_10_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Thf_10_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
instance  Infos_Thf_10_HI (C_INFO)
{
	
	condition		= Infos_Thf_10_HI_Condition;
	information		= Infos_Thf_10_HI_Info;
//	description		= "Wie läufts?"; 
	description		= "Jak to jde?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_10_HI_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_10_HI_Info()
{
//	AI_Output (other, self,"Infos_Thf_10_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Thf_10_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Thf_10_HI_Info_01_02"); //Wenn du überleben willst, dann verlasse nicht das Lager. Draussen gibt es nichts, was es wert wäre sein Leben dafür aufs Spiel zu setzen! 
	AI_Output (self, other,"Infos_Thf_10_HI_Info_01_02"); //Pokud chceš žít, neopouštěj tábor. Venku není nic, za co stojí nasazovat život.
	
};  
///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
/*
instance  Infos_Thf_10_STORY (C_INFO)
{
	
	condition		= Infos_Thf_10_STORY_Condition;
	information		= Infos_Thf_10_STORY_Info;
	description		= "Was gibt's Neues?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_10_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Thf_10_STORY_Info()
{
	
	AI_Output (other, self,"Infos_Thf_10_STORY_Info_15_01"); //Was gibt's Neues?
	AI_Output (self, other,"Infos_Thf_10_STORY_Info_10_02"); //Der König ist mit seinen verbliebenden Leuten ins Tal gekommen.
	AI_Output (self, other,"Infos_Thf_10_STORY_Info_10_03"); //Und ich weiß auch warum. Überleg doch mal.
	AI_Output (self, other,"Infos_Thf_10_STORY_Info_10_04"); //Die Feuermagier untersuchen diese Lichtsäule, weil sie ihre Macht als Waffe im Kampf mit den Orks benutzen wollen!
	AI_Output (self, other,"Infos_Thf_10_STORY_Info_10_05"); //Und wenn du überleben willst, dann bleibe hier im Lager!
};
*/
instance  Infos_Thf_10_CAMP (C_INFO)
{
	
	condition		= Infos_Thf_10_CAMP_Condition;
	information		= Infos_Thf_10_CAMP_Info;
//	description		= "Wie siehts im Lager aus?"; 
	description		= "Jak to vypadá v táboře?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_10_CAMP_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_10_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Thf_10_CAMP_Info_15_01"); //Wie siehts im Lager aus? 
	AI_Output (other, self,"Infos_Thf_10_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Thf_10_CAMP_Info_01_02"); //Wenn du dich mit Snaf dem Koch gutstellst, dann kriegst du eine warme Mahlzeit am Tag.
	AI_Output (self, other,"Infos_Thf_10_CAMP_Info_01_02"); //Pokud budeš dobře vycházet s kuchařem Snafem, dostaneš od něj každý den teplé jídlo.
//	AI_Output (self, other,"Infos_Thf_10_CAMP_Info_01_03"); //Ansonsten gilt, verhalte dich ruhig und mache keinen Ärger!
	AI_Output (self, other,"Infos_Thf_10_CAMP_Info_01_03"); //Jinak zachovej klid a nedělej potíže!
	
		var C_NPC Nicolos; Nicolos = Hlp_GetNpc (WRK_206_Nicolos); 
	Nicolos.aivar[AIV_FINDABLE] = TRUE;
};  

instance  Infos_Thf_10_BOSS (C_INFO)
{
	
	condition		= Infos_Thf_10_BOSS_Condition;
	information		= Infos_Thf_10_BOSS_Info;
//	description		= "Wer hat hier das Sagen?"; 
	description		= "Kdo je tu šéf?"; 
};
FUNC int  Infos_Thf_10_BOSS_Condition()
{	
		return TRUE;
};
FUNC void  Infos_Thf_10_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Thf_10_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Thf_10_BOSS_Info_15_01"); //Kdo je tu šéf?
//	AI_Output (self, other,"Infos_Thf_10_BOSS_Info_01_02"); //Niemand hat mir etwas zu sagen.
	AI_Output (self, other,"Infos_Thf_10_BOSS_Info_01_02"); //Mně nikdo nešéfuje.
	

	
};  

// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Thf_10(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);
	
	Infos_Thf_10_Exit.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_10_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Thf_10_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_10_BOSS.npc						= Hlp_GetInstanceID(slf);
};


