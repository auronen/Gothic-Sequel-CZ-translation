
instance  Infos_Wrk_11_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Wrk_11_Exit_Condition;
	information	=  Infos_Wrk_11_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Wrk_11_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Wrk_11_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_11_HI (C_INFO)
{

	condition		= Infos_Wrk_11_HI_Condition;
	information		= Infos_Wrk_11_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak to jde?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_11_HI_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_11_HI_Info()
{
//	AI_Output (other, self,"Infos_Wrk_11_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Wrk_11_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_02"); //Gut. Es gibt zwar noch genug Arbeit, aber wir haben schon eine starke Verteidigung.
	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_02"); //Dobře. Ještě nám zbývá notný kus práce, ale obranu už máme silnou.
//	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_03"); //Das gibt den Männern Mut. Und den werden sie brauchen, falls die Orks angreifen.
	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_03"); //To dává chlapům odvahu. A že ji budou potřebovat, až skřeti z zaútočí.
//	AI_Output (other, self,"Infos_Wrk_11_HI_Info_15_04"); //Und werden die Orks angreifen?
	AI_Output (other, self,"Infos_Wrk_11_HI_Info_15_04"); //A skřeti zaútočí?
//	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_05"); //Wenn es soweit ist, werden wir es wissen.
	AI_Output (self, other,"Infos_Wrk_11_HI_Info_11_05"); //Až přijde čas, tak se to dozvíme.

};
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_11_CAMP (C_INFO)
{

	condition		= Infos_Wrk_11_CAMP_Condition;
	information		= Infos_Wrk_11_CAMP_Info;
//	description		= "Wie siehts im Lager aus?";
	description		= "A jak to vypadá v táboře?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_11_CAMP_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_11_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Wrk_11_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output (other, self,"Infos_Wrk_11_CAMP_Info_15_01"); //A jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_02"); //Seit unserer Ankunft hier sind wir damit beschäftigt das Lager wieder aufzubauen.
	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_02"); //Od našho příjezdu jsme se zabývali přestavbou tábora.
//	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_03"); //Und die Arbeit geht voran. Die Orks werden sich ihre Schädel am Wall einrennen!
	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_03"); //A práce pokračují. Skřeti naběhnou hlavou přímo do zdi!
//	AI_Output (other, self,"Infos_Wrk_11_CAMP_Info_15_04"); //Glaubst du, sie werden bald angreifen?
	AI_Output (other, self,"Infos_Wrk_11_CAMP_Info_15_04"); //Myslíš, že brzy zaútočí?
//	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_05"); //Natürlich. Wozu machen wir uns sonst die ganze Arbeit?
	AI_Output (self, other,"Infos_Wrk_11_CAMP_Info_11_05"); //Samozřejmě. Proč bychom tu všechnu tuhle práci jinak dělali?


};
/*//////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_11_STORY (C_INFO)
{

	condition		= Infos_Wrk_11_STORY_Condition;
	information		= Infos_Wrk_11_STORY_Info;
	description		= "Erzähl mir was über den König";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_11_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_11_STORY_Info()
{

	AI_Output (other, self,"Infos_Wrk_11_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output (self, other,"Infos_Wrk_11_STORY_Info_11_02"); //Der König hat bestimmt einen Plan.
	AI_Output (self, other,"Infos_Wrk_11_STORY_Info_11_03"); //Der ist nicht hier, weil er vor den Orks geflohen ist, sondern weil er weiß, das er sie hier besiegen kann.
	AI_Output (self, other,"Infos_Wrk_11_STORY_Info_11_04"); //Der König wird uns schon alle beschützen!
};
*/
///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_11_BOSS (C_INFO)
{

	condition		= Infos_Wrk_11_BOSS_Condition;
	information		= Infos_Wrk_11_BOSS_Info;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo tomu tady velí?";
};

FUNC int  Infos_Wrk_11_BOSS_Condition()
{
	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_BROMOR);
	var C_NPC Dyrian; Dyrian = Hlp_GetNpc (WRK_202_DYRIAN);

	if (Bromor.aivar[AIV_FINDABLE] == FALSE)
	&& (Dyrian.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Wrk_11_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Wrk_11_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Wrk_11_BOSS_Info_15_01"); //Kdo tomu tady velí?
//	AI_Output (self, other,"Infos_Wrk_11_BOSS_Info_11_02"); //Gotmar der Schmied und Bromor der Baumeister. Die beiden haben das Kommando.
	AI_Output (self, other,"Infos_Wrk_11_BOSS_Info_11_02"); //Kovář Gotmar a Bromor, mistr stavitel. Oba dva tady rozhodují.

	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_BROMOR);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Gotmar; Gotmar = Hlp_GetNpc (WRK_200_GOTMAR);
	Gotmar.aivar[AIV_FINDABLE] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

FUNC VOID B_AssignAmbientInfos_Wrk_11(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);

	Infos_Wrk_11_Exit.npc						= Hlp_GetInstanceID(slf);
	//Infos_Wrk_11_STORY.npc						= Hlp_GetInstanceID(slf);

	Infos_Wrk_11_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Wrk_11_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_11_BOSS.npc						= Hlp_GetInstanceID(slf);
};
	