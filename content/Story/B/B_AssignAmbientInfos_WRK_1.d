///////////////////////////////////////////////////////////////////////
//	Info Exit
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_1_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Wrk_1_Exit_Condition;
	information	=  Infos_Wrk_1_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Wrk_1_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Wrk_1_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
///////////////////////////////////////////////////////////////////////
//	Info Special für Gerüstjungs
///////////////////////////////////////////////////////////////////////
instance Wrk_207_Worker_STEP (C_INFO)
{
	npc				= Wrk_207_Worker;
	condition		= Wrk_207_Worker_STEP_Condition;
	information		= Wrk_207_Worker_STEP_Info;
	important		= TRUE;
	permanent		= TRUE;
};

FUNC int  Wrk_207_Worker_STEP_Condition()
{
	if C_NPCisinvincible(self)
	&& (Npc_GetDistToWP (self, "OCR_PALISADE_WALK_51B")<= 500)
	{
		return TRUE;
	};
};
func void  Wrk_207_Worker_STEP_Info()
{
//	AI_Output (self, other,"Wrk_207_Worker_STEP_Info_15_01"); //Pass auf, das du nicht runterfällst!
	AI_Output (self, other,"Wrk_207_Worker_STEP_Info_15_01"); //Dej pozor, ať nespadneš dolů!
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_1_HI (C_INFO)
{

	condition		= Infos_Wrk_1_HI_Condition;
	information		= Infos_Wrk_1_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak to jde?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_1_HI_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_1_HI_Info()
{
//	AI_Output (other, self,"Infos_Wrk_1_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Wrk_1_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Wrk_1_HI_Info_01_02"); //Es gibt viel zu tun. Wir müssen vorbereitet sein, falls die Orks kommen.
	AI_Output (self, other,"Infos_Wrk_1_HI_Info_01_02"); //Máme hrozně moc práce. Musíme být připraveni, až přijdou skřeti.
//	AI_Output (other, self,"Infos_Wrk_1_HI_Info_15_03"); //Was meinst du mit Vorbereiten?
	AI_Output (other, self,"Infos_Wrk_1_HI_Info_15_03"); //Jak to myslíš 'připraveni'?
//	AI_Output (self, other,"Infos_Wrk_1_HI_Info_01_04"); //Einen stabilen Wallschutz aufbauen, Waffen schmieden und Vorräte anlegen. Wir müssen in jeder Hinsicht vorbereitet sein. Jeder von uns. Du solltest dich auch vorbereiten.
	AI_Output (self, other,"Infos_Wrk_1_HI_Info_01_04"); //Myslím: Vybudovat stabilní obrannou zeď, vyrobit zbraně a naskladnit zásoby. Musíme být připraveni po všech stránkách. Každý z nás musí být připraven. Měl by ses také začít připravovat.

};
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_1_CAMP (C_INFO)
{

	condition		= Infos_Wrk_1_CAMP_Condition;
	information		= Infos_Wrk_1_CAMP_Info;
//	description		= "Wie siehts im Lager aus?";
	description		= "Jak to vypadá v táboře?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_1_CAMP_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_1_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Wrk_1_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output (other, self,"Infos_Wrk_1_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_02"); //Es könnte besser laufen, wenn mehr Leute arbeiten würden.  Es gibt einfach zuviel Gesindel.
	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_02"); //Mohlo by být lépe, kdyby pracovalo více lidí. Máme tu jednoduše moc chamtivců.
//	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_03"); //Das sie faul sind ist eine Sache, aber die sind auch feige. Und damit werden sie für uns völlig wertlos.
	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_03"); //To, že jsou líní je jedna věc, ale oni jsou také zbabělí. A takoví lidé pro nás nejsou velkým přínosem.
//	AI_Output (other, self,"Infos_Wrk_1_CAMP_Info_15_04"); //Verstehe. Gerade jetzt ist jeder Mann wichtig.
	AI_Output (other, self,"Infos_Wrk_1_CAMP_Info_15_04"); //Chápej. Každý muž je právě teď velice důležitý.
//	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_05"); //Die nicht! Dieses Diebespack, diese faulen Hunde, soll Beliar sie alle holen!
	AI_Output (self, other,"Infos_Wrk_1_CAMP_Info_01_05"); //Ale oni ne! Tahle zlodějská banda, tihle líní psi, ať si je všechny vezme Beliar!

};
/*//////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////-
instance  Infos_Wrk_1_STORY (C_INFO)
{

	condition		= Infos_Wrk_1_STORY_Condition;
	information		= Infos_Wrk_1_STORY_Info;
	description		= "Erzähl mir was über...";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_1_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_1_STORY_Info()
{
	AI_Output (other, self,"Infos_Wrk_1_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output (self, other,"Infos_Wrk_1_STORY_Info_01_02"); //Der König sitzt mit seinen Paladinen in der Felsenfestung.
	AI_Output (self, other,"Infos_Wrk_1_STORY_Info_01_03"); //Er hat uns im Stich gelassen. Es ist ihm egal ob wir leben oder sterben.
};
*/

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_1_BOSS (C_INFO)
{

	condition		= Infos_Wrk_1_BOSS_Condition;
	information		= Infos_Wrk_1_BOSS_Info;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo tomu tady šéfuje?";
};

FUNC int  Infos_Wrk_1_BOSS_Condition()
{
	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_Bromor);
	if (Bromor.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Wrk_1_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Wrk_1_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Wrk_1_BOSS_Info_15_01"); //Kdo tomu tady šéfuje?
//	AI_Output (self, other,"Infos_Wrk_1_BOSS_Info_01_02"); //Bromor. Er ist der Baumeister. Sprich mit ihm, wenn du was willst.
	AI_Output (self, other,"Infos_Wrk_1_BOSS_Info_01_02"); //Bromor. To on je mistr stavitel. Promluv si s ním, jestli chceš.

	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_Bromor);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

};
///////////////////////////////////////////////////////////////////////
//	Zuweisung
///////////////////////////////////////////////////////////////////////

FUNC VOID B_AssignAmbientInfos_Wrk_1(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);

	Infos_Wrk_1_Exit.npc						= Hlp_GetInstanceID(slf);

	//Infos_Wrk_1_STORY.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_1_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Wrk_1_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_1_BOSS.npc						= Hlp_GetInstanceID(slf);
};