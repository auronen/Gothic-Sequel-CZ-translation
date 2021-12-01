instance  Infos_Thf_11_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Thf_11_Exit_Condition;
	information	=  Infos_Thf_11_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Infos_Thf_11_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Thf_11_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
instance  Infos_Thf_11_HI (C_INFO)
{
	
	condition		= Infos_Thf_11_HI_Condition;
	information		= Infos_Thf_11_HI_Info;
//	description		= "Wie läufts?"; 
	description		= "Jak to tady chodí?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_11_HI_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_11_HI_Info()
{
//	AI_Output (other, self,"Infos_Thf_11_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Thf_11_HI_Info_15_01"); //Jak to tady chodí?
//	AI_Output (self, other,"Infos_Thf_11_HI_Info_01_02"); //Ich sage dir wie es läuft. Jeder für sich und du für dich. Pass auf dich auf, denn sonst tut es keiner!
	AI_Output (self, other,"Infos_Thf_11_HI_Info_01_02"); //Já ti řeknu, jak to tady chodí. Každý sám za sebe, ty sám za sebe. Buď na sebe opatrný, nikdo jiný to za tebe neudělá!

		
};  
///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
/*
instance  Infos_Thf_11_STORY (C_INFO)
{
	
	condition		= Infos_Thf_11_STORY_Condition;
	information		= Infos_Thf_11_STORY_Info;
	description		= "Was gibt's Neues?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_11_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Thf_11_STORY_Info()
{
	
	AI_Output (other, self,"Infos_Thf_11_STORY_Info_15_01"); //Was gibt's Neues?
	AI_Output (self, other,"Infos_Thf_11_STORY_Info_11_02"); //Ich weiß nicht, was mir mehr Angst macht. Das wir von Orks umzingelt sind...
	AI_Output (self, other,"Infos_Thf_11_STORY_Info_11_03"); //...oder das in unserer unmittelbaren Nähe eine riesige Lichtsäule in den Himmel ragt...
};
*/
instance  Infos_Thf_11_CAMP (C_INFO)
{
	
	condition		= Infos_Thf_11_CAMP_Condition;
	information		= Infos_Thf_11_CAMP_Info;
//	description		= "Wie siehts im Lager aus?"; 
	description		= "Jak to vypadá v táboře?"; 
	permanent		= TRUE;
};

FUNC int  Infos_Thf_11_CAMP_Condition()
{	
	return TRUE;
};
FUNC void  Infos_Thf_11_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Thf_11_CAMP_Info_15_01"); //Wie siehts im Lager aus? 
	AI_Output (other, self,"Infos_Thf_11_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Thf_11_CAMP_Info_01_02"); //Halte dich fern von den Arbeitern und den Kranken. Da gibt es nichts zu holen. 
	AI_Output (self, other,"Infos_Thf_11_CAMP_Info_01_02"); //Drž se dál od dělníků a nemocných. Nemají nic, co by se dalo šlohnout.
//	AI_Output (self, other,"Infos_Thf_11_CAMP_Info_01_03"); //Geh der Miliz aus dem Weg, wenn einer von ihnen in der Nähe ist, verhalte dich ruhig und provoziere sie nicht!
	AI_Output (self, other,"Infos_Thf_11_CAMP_Info_01_03"); //Hlavně nepřekážej milici. Pokud je nějaký člen milice ve tvojí blízkosti, buď v klidu a hlavně ho neporvokuj!
};  

instance  Infos_Thf_11_BOSS (C_INFO)
{
	
	condition		= Infos_Thf_11_BOSS_Condition;
	information		= Infos_Thf_11_BOSS_Info;
//	description		= "Wer hat hier das Sagen?"; 
	description		= "Kdo to tady vede?"; 
};
FUNC int  Infos_Thf_11_BOSS_Condition()
{	
		return TRUE;
};
FUNC void  Infos_Thf_11_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Thf_11_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Thf_11_BOSS_Info_15_01"); //Kdo to tady vede?
//	AI_Output (self, other,"Infos_Thf_11_BOSS_Info_01_02"); //Diego ist der Anführer des Lagers. Auf sein Wort hören jeder im Lager.  
	AI_Output (self, other,"Infos_Thf_11_BOSS_Info_01_02"); //Diego je šéf tábora. Na jeho slovo tu každý dá.
	
	var C_NPC Diego; Diego = Hlp_GetNpc (PC_THIEF); 
	Diego.aivar[AIV_FINDABLE] = TRUE;
	
};  

// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Thf_11(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);
	
	Infos_Thf_11_Exit.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_11_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Thf_11_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Thf_11_BOSS.npc						= Hlp_GetInstanceID(slf);
};


