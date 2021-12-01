///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_2_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Wrk_2_Exit_Condition;
	information	=  Infos_Wrk_2_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Wrk_2_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Wrk_2_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_2_HI (C_INFO)
{

	condition		= Infos_Wrk_2_HI_Condition;
	information		= Infos_Wrk_2_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak se daří?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_2_HI_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_2_HI_Info()
{
//	AI_Output (other, self,"Infos_Wrk_2_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Wrk_2_HI_Info_15_01"); //Jak se daří?
//	AI_Output (self, other,"Infos_Wrk_2_HI_Info_01_02"); //Wir müssen einen starken Wall bauen. Nur ein starker Wall kann die Orks aufhalten!
	AI_Output (self, other,"Infos_Wrk_2_HI_Info_01_02"); //Musíme postavit silnou zeď. Jedině silná zeď může skřety zastavit!
};
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_2_CAMP (C_INFO)
{

	condition		= Infos_Wrk_2_CAMP_Condition;
	information		= Infos_Wrk_2_CAMP_Info;
//	description		= "Wie siehts im Lager aus?";
	description		= "Jak to vypadá v táboře?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_2_CAMP_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_2_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Wrk_2_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output (other, self,"Infos_Wrk_2_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Wrk_2_CAMP_Info_01_02"); //Die Miliz beschützt alle die arbeiten.
	AI_Output (self, other,"Infos_Wrk_2_CAMP_Info_01_02"); //Milice chrání každého, kdo pracuje.
//	AI_Output (self, other,"Infos_Wrk_2_CAMP_Info_01_03"); //Aber es gibt auch viele die nicht arbeiten. Die sollen selber zusehen wie sie klarkommen.
	AI_Output (self, other,"Infos_Wrk_2_CAMP_Info_01_03"); //Ale je tu také mnoho těch, kteří nepracují. Ti by měli zvládnout se o sebe postarat sami.

};
/*//////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////-
instance  Infos_Wrk_2_STORY (C_INFO)
{

	condition		= Infos_Wrk_2_STORY_Condition;
	information		= Infos_Wrk_2_STORY_Info;
	description		= "Erzähl mir was über den König";
	permanent 		= TRUE;
};

FUNC int  Infos_Wrk_2_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_2_STORY_Info()
{

	AI_Output (other, self,"Infos_Wrk_2_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output (self, other,"Infos_Wrk_2_STORY_Info_02_02"); //Der König hat sich hier nur einmal im Lager blicken lassen. Weißt du was er uns gesagt hat?
	AI_Output (self, other,"Infos_Wrk_2_STORY_Info_02_03"); //Er hat gesagt wir sollen uns verstecken!
	AI_Output (self, other,"Infos_Wrk_2_STORY_Info_02_04"); //Wer sind wir denn? Figuren in einem Spiel?
};*/

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_2_BOSS (C_INFO)
{

	condition		= Infos_Wrk_2_BOSS_Condition;
	information		= Infos_Wrk_2_BOSS_Info;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo to tu má na starost?";
};

FUNC int  Infos_Wrk_2_BOSS_Condition()
{
	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Wrk_2_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Wrk_2_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Wrk_2_BOSS_Info_15_01"); //Kdo to tu má na starost?
//	AI_Output (self, other,"Infos_Wrk_2_BOSS_Info_01_02"); //Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.
	AI_Output (self, other,"Infos_Wrk_2_BOSS_Info_01_02"); //Bromor. To on je mistr stavitel. Promluv si s ním, jestli chceš.

	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_Bromor);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

};
///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

FUNC VOID B_AssignAmbientInfos_Wrk_2(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);

	Infos_Wrk_2_Exit.npc						= Hlp_GetInstanceID(slf);

	//Infos_Wrk_2_STORY.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_2_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Wrk_2_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_2_BOSS.npc						= Hlp_GetInstanceID(slf);
};