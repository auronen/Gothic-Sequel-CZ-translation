// This variable is a workaround for a bug -> function Npc_KnowsInfo() doesn't work on permanent = TRUE dialogues
// BF_ prefix is used on all newly introduced variables
const int BF_Mil_9_Boss = FALSE; 

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_9_Exit (C_INFO)
{

	nr			=  999;
	condition	=  Infos_Mil_9_Exit_Condition;
	information	=  Infos_Mil_9_Exit_Info;
	permanent	=  TRUE;
	description = DIALOG_ENDE;
};

FUNC int  Infos_Mil_9_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Infos_Mil_9_Exit_Info()
{
	AI_StopProcessInfos	( self );
};


///////////////////////////////////////////////////////////////////////
//	Info HI
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_9_HI (C_INFO)
{
	condition		= Infos_Mil_9_HI_Condition;
	information		= Infos_Mil_9_HI_Info;
//	description		= "Wie läufts?";
	description		= "Jak to jde?";
	permanent		= TRUE;
};

FUNC int  Infos_Mil_9_HI_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_9_HI_Info()
{
//	AI_Output (other, self,"Infos_Mil_9_HI_Info_15_01"); //Wie läufts?
	AI_Output (other, self,"Infos_Mil_9_HI_Info_15_01"); //Jak to jde?
//	AI_Output (self, other,"Infos_Mil_9_HI_Info_06_02"); //(brummig) jaja, läuft gut.
	AI_Output (self, other,"Infos_Mil_9_HI_Info_06_02"); //(mrzutě) Ale jo, docela dobře.

};

///////////////////////////////////////////////////////////////////////
//	Info FOODGOOD
///////////////////////////////////////////////////////////////////////
instance	Info_Mil_9_FOODGOOD (C_INFO)
{
	condition		= Info_Mil_9_FOODGOOD_Condition;
	information		= Info_Mil_9_FOODGOOD_Info;
	permanent 		= TRUE;
//	description		= "Übles Essen hier! Willst du dir etwas Silber verdienen?";
	description		= "Nechutné jídlo, že? Chceš si vydělat nějaké stříbro?";
};

func int	Info_Mil_9_FOODGOOD_Condition()
{
	if	B_LunchTimeAtHalvors()
	&&	(self.aivar[AIV_DEALDAY] < B_GetDay())
	&&	Npc_KnowsInfo(hero, MIL_100_Halvor_SNAF)
	{
		return TRUE;
	};
};

func void	Info_Mil_9_FOODGOOD_Info()
{
//	AI_Output			(hero, self,"Info_Mil_9_FOODGOOD_15_01"); //Übles Essen hier! Willst du dir etwas Silber verdienen?
	AI_Output			(hero, self,"Info_Mil_9_FOODGOOD_15_01"); //Nechutné jídlo, že? Chceš si vydělat nějaké stříbro?

	if	(Npc_HasItems(hero, ItMi_Silver) >= SNAF_BRIBE_SUM)
	{
//		AI_Output		(self, hero,"Info_Mil_9_FOODGOOD_09_03"); //Was muss ich dafür machen?
		AI_Output		(self, hero,"Info_Mil_9_FOODGOOD_09_03"); //Co pro to musím udělat?
//		AI_Output		(hero, self,"Info_Mil_9_FOODGOOD_15_04"); //Kauf dein Mittagessen ab morgen bei Snaf im Aussenring!
		AI_Output		(hero, self,"Info_Mil_9_FOODGOOD_15_04"); //Od zítřka si začni kupovat oběd u Snafa z vnějšího kruhu!
//		AI_Output		(self, hero,"Info_Mil_9_FOODGOOD_09_05"); //Warum nicht, dort schmeckt es zwar nicht ganz so gut, aber Silber ist Silber!
		AI_Output		(self, hero,"Info_Mil_9_FOODGOOD_09_05"); //Proč ne, nechutná to tam sice tak dobře, ale stříbro je stříbro!
		B_GiveInvItems	(hero, self, ItMi_Silver, SNAF_BRIBE_SUM);

		self.aivar[AIV_DEALDAY] = B_GetDay();

		Snaf_MilitiaBribed = Snaf_MilitiaBribed + 1;
		if	((Snaf_MilitiaBribed + Snaf_MilitiaFrightened) >= SNAF_NEW_CUSTOMERS)
		{
			B_Snaf_NewCustomers();
		};
	}
	else
	{
		B_Say			(self, hero, "$NotEnoughSilver");
	};
};



///////////////////////////////////////////////////////////////////////
//	Info JOIN
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_9_JOIN (C_INFO)
{
	condition		= Infos_Mil_9_JOIN_Condition;
	information		= Infos_Mil_9_JOIN_Info;
//	description		= "Könnt ihr noch einen Mann gebrauchen?";
	description		= "Potřebujete dalšího muže?";
	permanent 		= TRUE;
};

FUNC int  Infos_Mil_9_JOIN_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_9_JOIN_Info()
{
//	AI_Output (other, self,"Infos_Mil_9_JOIN_Info_15_01"); //Könnt ihr noch einen Mann gebrauchen?
	AI_Output (other, self,"Infos_Mil_9_JOIN_Info_15_01"); //Potřebujete dalšího muže?

//	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_02"); //Das solltest du dir gut überlegen. Bei uns ist Disziplin gefordert.
	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_02"); //Měl by sis to dobře rozmyslet. Vyžadujeme disciplínu.
//	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_03"); //Selbst wenn du keine Aufgaben hast, hast du Aufgaben. Jeden Tag musst du dich einmal melden.
	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_03"); //Když už se ti zdá, že nemáš žádné úkoly, najdou se další úkoly. Každý den musíš podávat hlášení.
//	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_04"); //Wenn du das wirklich willst, dann sprich mal mit Cassian. Er ist Leutnant und kümmert sich um die Neuen.
	AI_Output (self, other,"Infos_Mil_9_JOIN_Info_06_04"); //Pokud se k nám opravdu chceš přidat, promluv si s Cassianem. Je to poručík, on se stará o nováčky.
	Info_ClearChoices (Infos_Mil_9_JOIN);


};


///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_9_STORY (C_INFO)
{
	condition		= Infos_Mil_9_STORY_Condition;
	information		= Infos_Mil_9_STORY_Info;
	permanent 		= TRUE;
//	description		= "Erzähl mir was über die Orks";
	description		= "Řekni mi něco o skřetech.";
};

FUNC int  Infos_Mil_9_STORY_Condition()
{
	return TRUE;
};

FUNC void  Infos_Mil_9_STORY_Info()
{
//	AI_Output (other, self,"Infos_Mil_9_STORY_Info_15_01"); //Erzähl mir was über die Orks.
	AI_Output (other, self,"Infos_Mil_9_STORY_Info_15_01"); //Řekni mi něco o skřetech.
//	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_02"); //Man darf nicht den Fehler machen, sie zu unterschätzen. Es sind keine Wilden, gegen die wir da kämpfen.
	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_02"); //Člověk by je neměl podceňovat. Ty bytosti, proti kterým válčíme, nejsou to žádní divoši.
//	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_03"); //Sie haben eine Kultur die wahrscheinlich älter ist, als die der Menschen.
	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_03"); //Mají svou kulturu, která je pravděpodobně starší, než kultura lidí.
//	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_04"); //Aber das gefährliche ist, das sie leben um zu kämpfen. Und sie kämpfen um zu sterben.
	AI_Output (self, other,"Infos_Mil_9_STORY_Info_09_04"); //Ale nebezpečné je to, že žijí, aby bojovali. A bojují, aby zemřeli.
};
///////////////////////////////////////////////////////////////////////
//	Info STORY
///////////////////////////////////////////////////////////////////////
instance  Infos_Mil_9_BOSS (C_INFO)
{

	condition		= Infos_Mil_9_BOSS_Condition;
	information		= Infos_Mil_9_BOSS_Info;
	permanent 		= TRUE;
//	description		= "Wer hat hier das Sagen?";
	description		= "Kdo tomu tady velí?";
};

FUNC int  Infos_Mil_9_BOSS_Condition()
{
	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);

	var C_NPC Cassian; Cassian = Hlp_GetNpc (MIL_119_Cassian);

	var C_NPC Brutus; Brutus = Hlp_GetNpc (MIL_121_Brutus);

	if (Berengar.aivar[AIV_FINDABLE] == FALSE)
	|| (Cassian.aivar[AIV_FINDABLE] == FALSE)
	|| (Brutus.aivar[AIV_FINDABLE] == FALSE)
	{
		return TRUE;
	};
};
FUNC void  Infos_Mil_9_BOSS_Info()
{
//	AI_Output (other, self,"Infos_Mil_9_BOSS_Info_15_01"); //Wer hat hier das Sagen?
	AI_Output (other, self,"Infos_Mil_9_BOSS_Info_15_01"); //Kdo tomu tady velí?
//	AI_Output (self, other,"Infos_Mil_9_BOSS_Info_09_02"); //Hauptmann Berengar führt das Kommando. Er hat zwei Leutnants die seine Befehle weitergeben, Cassian und Brutus.
	AI_Output (self, other,"Infos_Mil_9_BOSS_Info_09_02"); //Kapitán Berengar velí naší jednotce. Má dva poručíky Cassiana a Bruta, kteří předávají jeho rozkazy.
	
	var C_NPC Berengar; Berengar = Hlp_GetNpc (MIL_103_Berengar);
	Berengar.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Cassian; Cassian = Hlp_GetNpc (MIL_119_Cassian);
	Cassian.aivar[AIV_FINDABLE] = TRUE;

	var C_NPC Brutus; Brutus = Hlp_GetNpc (MIL_121_Brutus);
	Brutus.aivar[AIV_FINDABLE] = TRUE;
	
	BF_Mil_9_Boss = TRUE;
};



///////////////////////////////////////////////////////////////////////
//	Zuweisung der Infos zum NSC
///////////////////////////////////////////////////////////////////////
FUNC VOID B_AssignAmbientInfos_Mil_9(var c_NPC slf)
{
	B_AssignFindNpc_MIL (slf);

	Infos_Mil_9_Exit.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_9_HI.npc		= Hlp_GetInstanceID (slf);
	//Infos_Mil_9_JOIN.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_9_STORY.npc	= Hlp_GetInstanceID (slf);
	Infos_Mil_9_BOSS.npc	= Hlp_GetInstanceID (slf);
	Info_Mil_9_FOODGOOD.npc	= Hlp_GetInstanceID (slf);
};
