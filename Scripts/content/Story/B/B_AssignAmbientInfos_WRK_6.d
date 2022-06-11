

	instance  Infos_Wrk_6_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Wrk_6_Exit_Condition;
	information	=  Infos_Wrk_6_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Wrk_6_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Wrk_6_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_6_HI (C_INFO)
{

	condition		= Infos_Wrk_6_HI_Condition;
	information		= Infos_Wrk_6_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak se ti daří?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_6_HI_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_6_HI_Info()
{
//		AI_Output (other, self,"Infos_Wrk_6_HI_Info_15_01"); //Wie läufts?
		AI_Output (other, self,"Infos_Wrk_6_HI_Info_15_01"); //Jak se ti daří?
//		AI_Output (self, other,"Infos_Wrk_6_HI_Info_06_02"); //Viel Arbeit, wenig Schlaf. Wenigstens haben wir noch Bier.
		AI_Output (self, other,"Infos_Wrk_6_HI_Info_06_02"); //Hodně práce, málo spánku. Alespoň, že máme nějaké pivo.

};
///////////////////////////////////////////////////////////////////////
//	Info CAMP
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_6_CAMP (C_INFO)
{

	condition		= Infos_Wrk_6_CAMP_Condition;
	information		= Infos_Wrk_6_CAMP_Info;
//	description		= "Wie siehts im Lager aus?";
	description		= "Jak to vypadá v táboře?";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_6_CAMP_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_6_CAMP_Info()
{
//	AI_Output (other, self,"Infos_Wrk_6_CAMP_Info_15_01"); //Wie siehts im Lager aus?
	AI_Output (other, self,"Infos_Wrk_6_CAMP_Info_15_01"); //Jak to vypadá v táboře?
//	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_02"); //Wir Arbeiter verstärken den Wall. Wir sorgen dafür das die Orks hier nicht reinspazieren werden.
	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_02"); //My dělníci zesilujeme zeď. Staráme se o to, aby sem skřeti jednoduše neprolezli.
//	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_03"); //Und wenn sie es versuchen sollten, wird ihnen die Miliz ganz schön einheizen.
	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_03"); //A pokud by se o to měli pokusit, milice jim pěkně zavaří!
//	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_04"); //Die Heiler kümmern sich um die Aussätzigen. Und wenn du was brauchst, das Händlerviertel ist hinter der Arena.
	AI_Output (self, other,"Infos_Wrk_6_CAMP_Info_06_04"); //Léčitelé se starají o nemocné. A pokud něco potřebuješ, čtvrť obchodníků je za arénou.

};
/*//////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_6_STORY (C_INFO)
{

	condition		= Infos_Wrk_6_STORY_Condition;
	information		= Infos_Wrk_6_STORY_Info;
	description		= "Erzähl mir was über den König";
	permanent		= TRUE;
};

FUNC int  Infos_Wrk_6_STORY_Condition()
{
	return TRUE;
};
FUNC void  Infos_Wrk_6_STORY_Info()
{
	AI_Output (other, self,"Infos_Wrk_6_STORY_Info_15_01"); //Erzähl mir was über den König.
	AI_Output (self, other,"Infos_Wrk_6_STORY_Info_06_02"); //Der König hat die Hosen voll! Sitzt in der Felsenfestung anstatt mit seinen Paladinen hier ins Lager zu kommen.
	AI_Output (self, other,"Infos_Wrk_6_STORY_Info_06_03"); //Gemeinsam hätten wir eine Chance gegen die Orks, aber so wie es aussieht, werden die Orks einfach das ganze Tal überrennen!
};
*/

///////////////////////////////////////////////////////////////////////
//	Info BOSS
///////////////////////////////////////////////////////////////////////
instance  Infos_Wrk_6_BOSS (C_INFO)
{

	condition		= Infos_Wrk_6_BOSS_Condition;
	information		= Infos_Wrk_6_BOSS_Info;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo tu má hlavní slovo?";
};

FUNC int  Infos_Wrk_6_BOSS_Condition()
{	var C_NPC Dyrian; Dyrian = Hlp_GetNpc (WRK_202_DYRIAN);

	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_BROMOR);
	if	(Bromor.aivar[AIV_FINDABLE] == FALSE)
	&&	(Dyrian.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Wrk_6_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Wrk_6_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Wrk_6_BOSS_Info_15_01"); //Kdo tu má hlavní slovo?
//	AI_Output (self, other,"Infos_Wrk_6_BOSS_Info_06_02"); //Bromor und Dyrian. Der Baumeister und der Zimmermann. Die beiden kümmern sich um uns und das Lager.
	AI_Output (self, other,"Infos_Wrk_6_BOSS_Info_06_02"); //Bromor a Dyrian. Mistr stavitel a tesař. Oba se starají o nás a o náš tábor.

	var C_NPC Bromor; Bromor = Hlp_GetNpc (WRK_203_BROMOR);
	Bromor.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Dyrian; Dyrian = Hlp_GetNpc (WRK_202_DYRIAN);
	Dyrian.aivar[AIV_FINDABLE] = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	 Zuweisung
///////////////////////////////////////////////////////////////////////

FUNC VOID B_AssignAmbientInfos_Wrk_6(var c_NPC slf)
{
	B_AssignFindNpc_WRK (slf);


	Infos_Wrk_6_Exit.npc						= Hlp_GetInstanceID(slf);

	Infos_Wrk_6_HI.npc							= Hlp_GetInstanceID(slf);
	Infos_Wrk_6_CAMP.npc						= Hlp_GetInstanceID(slf);
	Infos_Wrk_6_BOSS.npc						= Hlp_GetInstanceID(slf);
	//Infos_Wrk_6_STORY.npc						= Hlp_GetInstanceID(slf);
};

