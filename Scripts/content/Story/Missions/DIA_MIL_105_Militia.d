/*
instance MIL_105_Militia_Exit (C_INFO)
{
	npc			= MIL_105_Militia;
	nr			=  999;
	condition	= MIL_105_Militia_Exit_Condition;
	information	= MIL_105_Militia_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int MIL_105_Militia_Exit_Condition()
{
	return 1;
};

FUNC VOID MIL_105_Militia_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


instance MIL_105_Militia_CRAWLERINSIDE (C_INFO)
{
	npc				=MIL_105_Militia;
	condition		=MIL_105_Militia_CRAWLERINSIDE_Condition;
	information		=MIL_105_Militia_CRAWLERINSIDE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int MIL_105_Militia_CRAWLERINSIDE_Condition()
{
	if (LearnBow_2 == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void MIL_105_Militia_CRAWLERINSIDE_Info()
{
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_01"); //Warte! Willst du runter in den Keller gehen?
	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_01"); //Čekej! Chceš jít dolů do sklepa?
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_02"); //Hatte ich eigentlich vor.
	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_02"); //Vlastně jsem chtěl.
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_03"); //Das ist keine gute Idee. Da unten hat sich ein Crawler eingenistet. Der hat schon einen von uns zerstückelt.
	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_03"); //To není dobrý nápad. Tam dole se usídlil důlní červ. Jednoho z nás už rozsápal.
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_04"); //Deshalb gehe ich da runter. Ich töte das Biest.
	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_04"); //Proto tam chci jít. Zabiju tu potvoru.
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_05"); //Du? Weißt du überhaupt wie so ein Crawler aussieht?
	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_05"); //Ty? Víš vůbec, jak takový důlní červ vypadá?
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_06"); //Ja, ich habe schon mal ein paar gesehen.
	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_06"); //Jo, už jsem jich pár viděl.
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_07"); //Na dann hoffe ich, das die Götter dir einen schnellen Tod schenken. Klingen verletzen das Vieh nämlich nicht.
	AI_Output (self, other,"MIL_105_Wache_CRAWLERINSIDE_Info_00_07"); //Doufám, že ti bohové dopřejí rychlou smrt. ??? // Tu druhou větu fakt nechápu.
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_08"); //Fang schon mal an zu beten. Ich töte inzwischen den Crawler.
	AI_Output (other, self,"MIL_105_Wache_CRAWLERINSIDE_Info_15_08"); //Tak už se začni modlit. Já mezitím toho důlního červa zabiju.
};

instance MIL_105_Militia_CRAWLERDEAD (C_INFO)
{
	npc				=MIL_105_Militia;
	condition		=MIL_105_Militia_CRAWLERDEAD_Condition;
	information		=MIL_105_Militia_CRAWLERDEAD_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Der Crawler wird niemanden mehr angreifen";
	description		= "Ten červ už nikoho nenapadne";
};

FUNC int MIL_105_Militia_CRAWLERDEAD_Condition()
{
	var C_NPC Crawler;
	Crawler = Hlp_GetNpc (OC_Minecrawler);

	if Npc_IsDead (Crawler)
	{
		return 1;
	};

};
FUNC void MIL_105_Militia_CRAWLERDEAD_Info()
{
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERDEAD_Info_15_01"); //Der Crawler wird niemanden mehr angreifen.
	AI_Output (other, self,"MIL_105_Wache_CRAWLERDEAD_Info_15_01"); //Ten červ už nikoho nenapadne.
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERDEAD_Info_00_02"); //Du hast in besiegt ?! Wegen dem schnellen Tod, das war nicht so gemeint. Freut mich das du noch lebst.
	AI_Output (self, other,"MIL_105_Wache_CRAWLERDEAD_Info_00_02"); //Tys ho porazil ?! To s tou rychlou smrtí, nemyslel jsem to tak. Jsem rád, že jsi naživu.

	Info_ClearChoices (MIL_105_MiLitia_CRAWLERDEAD);
//	Info_AddChoice (MIL_105_MiLitia_CRAWLERDEAD,"Geht mir auch so",MIL_105_MiLitia_CRAWLERDEAD_friendly);
	Info_AddChoice (MIL_105_MiLitia_CRAWLERDEAD,"Já taky",MIL_105_MiLitia_CRAWLERDEAD_friendly);
//	Info_AddChoice (MIL_105_MiLitia_CRAWLERDEAD,"Geh mir aus den Augen, Feigling!",MIL_105_MiLitia_CRAWLERDEAD_bastard);
	Info_AddChoice (MIL_105_MiLitia_CRAWLERDEAD,"Zmiz mi z očí, zbabělče",MIL_105_MiLitia_CRAWLERDEAD_bastard);

};

FUNC VOID MIL_105_Militia_CRAWLERDEAD_friendly()
{
//	AI_Output			(other, self,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_01"); //Geht mir auch so.
	AI_Output			(other, self,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_01"); //Já taky.
//	AI_Output			(self, other,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_02"); //Trink einen auf das Wohl des Gefallenen. Wenn du mal Hilfe brauchst, ich kenne die Jungs von der Miliz.
	AI_Output			(self, other,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_02"); //Napijme se za padlé. Až budeš někdy potřebovat pomoc, znám se s chlapy z milice.

	CreateInvItems		(self,ItFo_Beer,1);
	B_GiveInvItems		(self, other, ItFo_Beer,1);

//	AI_Output			(other, self,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_03"); //Ich werde darauf zurückkommen. Hast du auch einen Namen?
	AI_Output			(other, self,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_15_03"); //Beru tě za slovo. Máš nějaké jméno?
//	AI_Output			(self, other,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_04"); //Nenn mich Pablo.
	AI_Output			(self, other,"MIL_105_Wache_CRAWLERDEAD_friendly_Info_00_04"); //Říkej mi Pablo.

	self.name = "PABLO";
};

FUNC VOID MIL_105_Militia_CRAWLERDEAD_bastard()
{
//	AI_Output (other, self,"MIL_105_Wache_CRAWLERDEAD_bastard_Info_15_01"); //Geh mir aus den Augen, Feigling!
	AI_Output (other, self,"MIL_105_Wache_CRAWLERDEAD_bastard_Info_15_01"); //Zmiz mi z očí, zbabělče!
//	AI_Output (self, other,"MIL_105_Wache_CRAWLERDEAD_bastard_Info_00_02"); //Du nennst mich einen Feigling? Du schaffst dir keine Freunde hier. Aber die braucht jemand wie du auch nicht.
	AI_Output (self, other,"MIL_105_Wache_CRAWLERDEAD_bastard_Info_00_02"); //Ty mě nazýváš zbabělcem? To si tu neuděláš moc přátel. Ale oni taky nepotřebují někoho jako jsi ty.

};

*/
