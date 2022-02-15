///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=	PC_Psionic;
	nr			=	999;
	condition	=	PC_Psionic_Exit_Condition;
	information	=	PC_Psionic_Exit_Info;
	important	=	FALSE;
	permanent	=	TRUE;
	description =	DIALOG_ENDE;
};

FUNC int  PC_Psionic_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	AI_StopProcessInfos	( self );
};







//#####################################################################
//##
//##
//##						BEGRÜSSUNG
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info HALLOAGAIN
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HALLOAGAIN (C_INFO)
{
	npc			=	PC_Psionic;
	condition	=	PC_Psionic_HALLOAGAIN_Condition;
	information	=	PC_Psionic_HALLOAGAIN_Info;
	important	=	TRUE;

};

FUNC int  PC_Psionic_HALLOAGAIN_Condition()
{
	return	TRUE;
};

func void  PC_Psionic_HALLOAGAIN_Info()
{
//	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_01"); //Hey, ich dachte du wärst tot!
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_01"); //Hej, myslel jsem, že jsi mrtvý!
//	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_02"); //Das kommt mir bekannt vor.
	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_02"); //To už jsem někdy slyšel.
//	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_03"); //Was ist geschehen?
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_03"); //Co se stalo?
//	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_04"); //Der Kampf gegen den Schläfer hat mich geschwächt. Das bedeutet ich muss wieder 'ne Menge lernen.
	AI_Output(hero, self, "PC_Psionic_HALLOAGAIN_15_04"); //Boj proti Spáči mě oslabil. To znamená, že se toho budu muset zase hodně naučit.
//	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_05"); //Ich kann dir zeigen, wie du deine magische Kraft steigerst und dir die Kreise der Magie lehren.
	AI_Output(self, hero, "PC_Psionic_HALLOAGAIN_23_05"); //Můžu ti ukázat, jak posílit svou magickou moc a také tě uvést do kruhů magie.

	B_SetAttitude		(self,	ATT_FRIENDLY);
};

///////////////////////////////////////////////////////////////////////
//	Info FORTRESS
///////////////////////////////////////////////////////////////////////
instance  PC_Psionic_FORTRESS(C_INFO)
{
	npc				=	PC_Psionic;
	nr				=	5;
	condition		=	PC_Psionic_FORTRESS_Condition;
	information		=	PC_Psionic_FORTRESS_Info;
	important		=	FALSE;
	permanent		=	FALSE;
//	description		=	"Wolltest Du nicht von der Felsenfestung Besitz nehmen?";
	description 	= 	"Nechtěl jsi se zmocnit Horské pevnosti?";
};

FUNC int  PC_Psionic_FORTRESS_Condition()
{
	if	Npc_KnowsInfo(hero,PC_Psionic_HALLOAGAIN )
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_FORTRESS_Info()
{
//	AI_Output			(hero, self, "PC_Psionic_FORTRESS_15_01"); //Wolltest Du nicht von der Felsenfestung Besitz nehmen?
	AI_Output			(hero, self, "PC_Psionic_FORTRESS_15_01"); //Nechtěl jsi se zmocnit Horské pevnosti?
//	AI_Output			(self, hero, "PC_Psionic_FORTRESS_23_02"); //Das wollte ich, aber dann tauchte plätzlich König Rhobar mit seinen Paladinen dort auf, und machte sich in 'meiner' Festung breit.
	AI_Output			(self, hero, "PC_Psionic_FORTRESS_23_02"); //To jsem chtěl, ale pak se tam najednou objevil král Rhobar se svými paladiny a trochu se v 'mojí' pevnosti roztáhli.
};

///////////////////////////////////////////////////////////////////////
//	Info KINGHERE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_KINGHERE		(C_INFO)
{
	npc				= 	PC_Psionic;
	condition		= 	PC_Psionic_KINGHERE_Condition;
	information		= 	PC_Psionic_KINGHERE_Info;
	important		= 	FALSE;
	permanent		= 	FALSE;

//	description		= 	"König Rhobar ist hier?";
	description		= 	"Král Rhobar je tady?";
};

func int PC_Psionic_KINGHERE_Condition ()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_FORTRESS)
	{
		return TRUE;
	};
};

func void PC_Psionic_KINGHERE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_KINGHERE_15_01"); //König Rhobar ist hier?
	AI_Output			(hero, self, "PC_Psionic_KINGHERE_15_01"); //Král Rhobar je tady?
//	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_02"); //Es ist noch garnicht so lange her, da stand er plötzlich mit seinen Paladinen vor dem Alten Lager.
	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_02"); //Nebylo to tak dávno, co náhle stál se svými paladiny před Starým táborem.
//	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_03"); //Einige düster dreinblickende Magier befanden sich ebenfalls in seinem Gefolge. Nur die Götter wissen, was die hier verloren haben.
	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_03"); //V jeho doprovodu přišli i nějací zasmušilí mágové. Jen bohové vědí, co tu pohledávají.
//	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_04"); //Er nahm kurzerhand die Felsenfestung in Besitz und richtete dort sein Hauptquartier ein!
	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_04"); //Krátce nato obsadil Horskou pevnost a zřídil si tam své velitelství!
//	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_05"); //Angeblich sucht er irgendetwas hier in der Gegend!
	AI_Output			(self, hero, "PC_Psionic_KINGHERE_23_05"); //Zřejmě tady něco v okolí hledá!
};

///////////////////////////////////////////////////////////////////////
//	Info KINGWHAT
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_KINGWHAT		(C_INFO)
{
	npc				= 	PC_Psionic;
	condition		= 	PC_Psionic_KINGWHAT_Condition;
	information		= 	PC_Psionic_KINGWHAT_Info;
	important		= 	FALSE;
	permanent		= 	FALSE;

//	description		= 	"Weisst du WAS der König hier sucht?";
	description		= 	"Nevíš, CO tady král hledá?";
};

func int PC_Psionic_KINGWHAT_Condition ()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_KINGHERE)
	{
		return TRUE;
	};
};

func void PC_Psionic_KINGWHAT_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_KINGWHAT_15_01"); //Weisst du WAS der König hier sucht?
	AI_Output			(hero, self, "PC_Psionic_KINGWHAT_15_01"); //Nevíš, CO tady král hledá?
//	AI_Output			(self, hero, "PC_Psionic_KINGWHAT_23_02"); //Nein. Sie haben den Zugang zur Felsenfestung regelrecht abgeriegelt.
	AI_Output			(self, hero, "PC_Psionic_KINGWHAT_23_02"); //Ne. Vchod do Horské pevnosti řádně uzavřeli.
//	AI_Output			(self, hero, "PC_Psionic_KINGWHAT_23_03"); //Was immer Rhobar hier sucht, er glaubt es offensichtlich dort zu finden!
	AI_Output			(self, hero, "PC_Psionic_KINGWHAT_23_03"); //Ať už Rhobar hledá cokoliv, očividně doufá, že to najde právě tam!
//	AI_Output			(hero, self, "PC_Psionic_KINGWHAT_15_04"); //Merkwürdig...
	AI_Output			(hero, self, "PC_Psionic_KINGWHAT_15_04"); //Zvláštní...
};

///////////////////////////////////////////////////////////////////////
//	Info YOUHERE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_YOUHERE		(C_INFO)
{
	npc			= 	PC_Psionic;
	nr			=	8;
	condition	= 	PC_Psionic_YOUHERE_Condition;
	information	= 	PC_Psionic_YOUHERE_Info;
	important	= 	FALSE;
	permanent	= 	FALSE;

//	description	= 	"Was tust du hier?";
	description	= 	"Co tu děláš?";
};

func int PC_Psionic_YOUHERE_Condition ()
{
	return TRUE;
};

func void PC_Psionic_YOUHERE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_YOUHERE_15_01"); //Was tust du hier?
	AI_Output			(hero, self, "PC_Psionic_YOUHERE_15_01"); //Co tu děláš?
//	AI_Output			(self, hero, "PC_Psionic_YOUHERE_23_02"); //Ich forsche nach dem alten Wissen der Feuermagier.
	AI_Output			(self, hero, "PC_Psionic_YOUHERE_23_02"); //Pátrám po starém vědění Mágů ohně.
//	AI_Output			(self, hero, "PC_Psionic_YOUHERE_23_03"); //Sie haben zu Zeiten der Barriere schliesslich hier gelebt.
	AI_Output			(self, hero, "PC_Psionic_YOUHERE_23_03"); //Koneckonců, žili tu v době Bariéry.
};

///////////////////////////////////////////////////////////////////////
//	Info IREMEMBER
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_IREMEMBER		(C_INFO)
{
	npc		 	= 	PC_Psionic;
	condition	= 	PC_Psionic_IREMEMBER_Condition;
	information	= 	PC_Psionic_IREMEMBER_Info;
	important	= 	FALSE;
	permanent	= 	FALSE;

//	description	= 	"Wie laufen deine Forschungen?";
	description	= 	"Jak jde pátrání?";
};

func int PC_Psionic_IREMEMBER_Condition ()
{
	if	Npc_KnowsInfo(hero,PC_Psionic_YOUHERE)
	{
		return TRUE;
	};
};

func void PC_Psionic_IREMEMBER_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_IREMEMBER_15_01"); //Wie laufen deine Forschungen?
	AI_Output			(hero, self, "PC_Psionic_IREMEMBER_15_01"); //Jak jde pátrání?
//	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_02"); //Der Zusammenbruch der magischen Barriere hat fast alle magischen Artefakte zerstört. Auch die Runen!
	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_02"); //Pád magické Bariéry zničil všechny magické artefakty. Dokonce i runy!
//	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_03"); //Aber ich habe einen Weg gefunden, neue Runen herzustellen!
	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_03"); //Ale já našel způsob, jak vytvořit runy nové!
//	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_04"); //Ich sammle das Wissen über die Zaubersprüche der Feuer- und Wassermagier und binde sie in neue Runensteine!
	AI_Output			(self, hero, "PC_Psionic_IREMEMBER_23_04"); //Sbírám poznatky o kouzlech mágů Ohně i Vody a vkládám je do nových runových kamenů.
};


///////////////////////////////////////////////////////////////////////
//	Info TRAINBASIC
///////////////////////////////////////////////////////////////////////
instance  PC_Psionic_TRAINBASIC (C_INFO)
{
	npc				=	PC_Psionic;
	condition		=	PC_Psionic_TRAINBASIC_Condition;
	information		=	PC_Psionic_TRAINBASIC_Info;
	important		=	FALSE;
	permanent		=	FALSE;
//	description		=	"Erkläre mir die Gesetze der Magie ";
	description		=	"Objasni mi magické zákony.";
};

FUNC int  PC_Psionic_TRAINBASIC_Condition()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_IREMEMBER)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_TRAINBASIC_Info()
{
//	AI_Output (hero, self,"PC_Psionic_TRAINBASIC_Info_15_01"); //Erkläre mir die Gesetze der Magie.
	AI_Output (hero, self,"PC_Psionic_TRAINBASIC_Info_15_01"); //Objasni mi magické zákony.
//	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_02"); //Es ist so, wie du es von früher kennst! Du brauchst entweder eine Spruchrolle oder eine Rune!
	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_02"); //Je to tak, jak to už znáš z dřívějška. Potřebuješ buď svitek nebo runu.
//	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_03"); //Die Benutzung von Spruchrollen und Runen kostet deine magische Kraft. Dein MANA. Die Lebensquelle deiner Sprüche!
	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_03"); //Používání magických svitků a run stojí magickou sílu. Tvojí MANU. Živoucí zdroj tvých zaříkadel!
//	AI_Output (hero, self,"PC_Psionic_TRAINBASIC_Info_15_04"); //Und weiter?
	AI_Output (hero, self,"PC_Psionic_TRAINBASIC_Info_15_04"); //A dál?
//	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_05"); //Spruchrollen kann jeder verwenden, der Mana besitzt. Allerding können sie nur einmal verwendet werden und lösen sich danach auf!
	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_05"); //Kouzelný svitek může použít každý, kdo má manu. Nicméně použity mohou být jen jednou, po té ztrácí svou sílu.
//	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_06"); //Eine Rune dagegen kann man unendlich oft benutzen, allerdings musst du dafür die hohe Kunst der magischen Kreise erlernen!
	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_06"); //Naproti tomu runy lze používat opakovaně, ale musíš proto ovládnout vysoké umění magických kruhů.
//	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_07"); //Das Benutzen von mächtigeren Runen erfordern das Wissen eines höheren Kreises der Magie!
	AI_Output (self, hero,"PC_Psionic_TRAINBASIC_Info_23_07"); //Použití mocnějších run si žádá poznání vyšších kruhů magie.
};

///////////////////////////////////////////////////////////////////////
//	Info MAKERUNES
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MAKERUNES		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_MAKERUNES_Condition;
	information	 = 	PC_Psionic_MAKERUNES_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie stellst du die Runensteine her?";
	description	 = 	"Jak vyrábíš runové kameny?";
};

func int PC_Psionic_MAKERUNES_Condition ()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_IREMEMBER)
	{
		return TRUE;
	};
};

func void PC_Psionic_MAKERUNES_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_MAKERUNES_15_01"); //Wie stellst du die Runensteine her?
	AI_Output			(hero, self, "PC_Psionic_MAKERUNES_15_01"); //Jak vyrábíš runové kameny?
//	AI_Output			(self, hero, "PC_Psionic_MAKERUNES_23_02"); //Es hat mich viel Zeit gekostet. Ich habe Apparaturen nachgebaut, die ich in alten Büchern beschrieben fand!
	AI_Output			(self, hero, "PC_Psionic_MAKERUNES_23_02"); //To mě stálo hodně času! Postavil jsem zařízení, které bylo popsané ve starých knihách.
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEPERMAGIC
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SLEEPERMAGIC		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_SLEEPERMAGIC_Condition;
	information	 = 	PC_Psionic_SLEEPERMAGIC_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was ist aus der Magie des Schläfers geworden?";
	description	 = 	"Co se stalo se Spáčovou magií?";
};

func int PC_Psionic_SLEEPERMAGIC_Condition ()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_IREMEMBER)
	{
		return TRUE;
	};
};

func void PC_Psionic_SLEEPERMAGIC_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_SLEEPERMAGIC_15_01"); //Was ist aus der Magie des Schläfers geworden?
	AI_Output			(hero, self, "PC_Psionic_SLEEPERMAGIC_15_01"); //Co se stalo se Spáčovou magií?
//	AI_Output			(self, hero, "PC_Psionic_SLEEPERMAGIC_23_02"); //Diese Magie ist mit dem Schläfer zusammen verschwunden, doch ich bin sicher, seine Zauber können auch ohne seine dämonische Kraft funktionieren.
	AI_Output			(self, hero, "PC_Psionic_SLEEPERMAGIC_23_02"); //Tato magie zmizela společně se Spáčem, ale jsem si jistý, že jeho kouzla mohou fungovat i bez jeho démonické síly.
//	AI_Output			(self, hero, "PC_Psionic_SLEEPERMAGIC_23_03"); //Ich versuche zur Zeit eine Rune der Telekinese herzustellen, suche aber noch nach einer entsprechenden Spruchrolle.
	AI_Output			(self, hero, "PC_Psionic_SLEEPERMAGIC_23_03"); //Občas se pokouším vyrobit runu telekineze. Stále sháním odpovídající svitek.
};










//#####################################################################
//##
//##
//##						MANA & KREISE LERNEN
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance  PC_Psionic_TEACH (C_INFO)
{
	npc				=	PC_Psionic;
	nr				=	10;
	condition		=	PC_Psionic_TEACH_Condition;
	information		=	PC_Psionic_TEACH_Info;
	important		=	FALSE;
	permanent		=	TRUE;
//	description		=	"Ich will meine alten Kräfte wiedergewinnen!";
	description		=	"Chci znovu získat mé staré schopnosti!";
};

FUNC int  PC_Psionic_TEACH_Condition()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_TRAINBASIC)
	&&	Npc_KnowsInfo (hero,PC_Thief_NEEDTRAINING)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_TEACH_Info()
{
//	AI_Output			(hero, self,"PC_Psionic_TEACH_Info_15_01"); //Ich will meine alten Kräfte wiedergewinnen!
	AI_Output			(hero, self,"PC_Psionic_TEACH_Info_15_01"); //IChci znovu získat mé staré schopnosti!
//	AI_Output			(hero, self,"PC_Psionic_TEACH_Info_15_02"); //Diego sagt, du könntest mir dabei helfen.
	AI_Output			(hero, self,"PC_Psionic_TEACH_Info_15_02"); //Diego říká, že mi s tím můžeš pomoci.
//	AI_Output			(self, hero,"PC_Psionic_TEACH_Info_23_03"); //Warum nicht, lass uns gleich beginnen.
	AI_Output			(self, hero,"PC_Psionic_TEACH_Info_23_03"); //Proč ne, můžeme rovnou začít.

	Info_ClearChoices	(PC_Psionic_TEACH);
	Info_AddChoice		(PC_Psionic_TEACH,	DIALOG_BACK,													PC_Psionic_TEACH_BACK);
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	{
		//Info_AddChoice	(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0),	PC_Psionic_TEACH_CIRCLE3);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&&	Npc_KnowsInfo(hero, PC_Psionic_FOUNDHEALSCROLL)
	{
		Info_AddChoice	(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0),	PC_Psionic_TEACH_CIRCLE2);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice	(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0),	PC_Psionic_TEACH_CIRCLE1);
	};
	//Info_AddChoice		(PC_Psionic_TEACH,	"(Mana steigern)",												PC_Psionic_TEACH_MAN);
	Info_AddChoice		(PC_Psionic_TEACH,	"(Zvýšit manu)",												PC_Psionic_TEACH_MAN);
};

FUNC VOID PC_Psionic_TEACH_MAN()
{
	Info_ClearChoices	(PC_Psionic_TEACH);
	Info_AddChoice		(PC_Psionic_TEACH,	DIALOG_BACK,													PC_Psionic_TEACH_BACK);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_5,5*LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_5);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_1,LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_1);
};

FUNC VOID PC_Psionic_TEACH_MAN_1()
{
	B_BuyAttributePoints(hero, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(PC_Psionic_TEACH);
	Info_AddChoice		(PC_Psionic_TEACH,	DIALOG_BACK,													PC_Psionic_TEACH_BACK);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_5,5*LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_5);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_1,LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_1);
};

FUNC VOID PC_Psionic_TEACH_MAN_5()
{
	B_BuyAttributePoints(hero, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(PC_Psionic_TEACH);
	Info_AddChoice		(PC_Psionic_TEACH,	DIALOG_BACK,													PC_Psionic_TEACH_BACK);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_5,5*LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_5);
	Info_AddChoice		(PC_Psionic_TEACH,	B_BuildLearnString(NAME_LearnMANA_1,LPCOST_ATTRIBUTE_MANA,0),	PC_Psionic_TEACH_MAN_1);
};

FUNC VOID PC_Psionic_TEACH_BACK()
{
	Info_ClearChoices	(PC_Psionic_TEACH);
};

FUNC VOID PC_Psionic_TEACH_CIRCLE1()
{
//	AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE1_15_01"); //Ich will den ersten Kreis der Magie erlernen.
	AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE1_15_01"); //Chci poznat první kruh magie.

	if (B_GiveSkill(hero,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_02"); //Es ist mir bereits gelungen, zwei Zauber aus diesem Kreise in Runen zu binden.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_02"); //Už se mi podařilo vložit dvě kouzla tohoto kruhu do runových kamenů.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_03"); //Der Lichtzauber erhellt die Dunkelheit stockfinsterer Orte und ist zuverlässiger als jede Fackel.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_03"); //Kouzlo světla prosvětluje temnotu černých míst a je spolehlivější než kterákoliv pochodeň.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_04"); //Der Feuerpfeil ist eine Angriffsrune die Ziele in Brand stecken kann.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_04"); //Ohnivý šíp je útočná runa, která může cíle zapálit.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_05"); //Leider sind das die einzigen Zauberformeln der Feuermagier, die ich bisher auftreiben konnte.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_05"); //Bohužel to jsou jediné kouzelné formule ohnivých mágů, kterých jsem zatím schopen.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_06"); //Soviel ich weiss, gab es einen Zauberspruch der Wassermagier, der mit dem Feuerpfeil verwandt ist: Der Eispfeil.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_06"); //Pokud vím, bylo ještě jedno kouzlo mágů Vody, příbuzné ohnivému šípu: Ledový šíp.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_07"); //Leider habe ich nirgendwo eine Spruchrolle darüber auftreiben können.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE1_23_07"); //Bohužel, nepodařilo se mi nikde získat jeho svitek.
	};
};

FUNC VOID PC_Psionic_TEACH_CIRCLE2()
{
	//AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE2_15_01"); //Ich will den zweiten Kreis der Magie erlernen.
	AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE2_15_01"); //Chci poznat druhý kruh magie.

	if (B_GiveSkill(hero,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_02"); //Nun da wir mit dem Zauber HEILUNG eine Spruchrolle des zweiten Kreises in Händen halten, erklärt sich das magische Gefüge schon fast von selbst.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_02"); //A nyní, když tu máme svitek kouzla LÉČENÍ z druhého kruhu, odhalí se nám jeho magická struktura úplně sama.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_03"); //Sprich diesen Zauber auf dich selbst, und deine Wunden werden sich wieder verschliessen. Je länger du diesen Zauber aufrechterhälst, desto grösser ist die Heilwirkung, die eintritt.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_03"); //Použij toto kouzlo sám na sebe - a tvá zranění budou znovu zacelena. Čím déle toto kouzlo udržuješ, tím větší jsou léčivé účinky, které poskytuje.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_04"); //Hast Du HEILUNG erst einmal verstanden, werden auch andere Zauberformeln des zweiten Kreises kein Hindernis mehr für dich darstellen.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE2_23_04"); //Jakmile jsi jednou porozuměl LÉČENÍ, nebudou ti ani další kouzelné formule druhého kruhu žádnou překážkou.
	};
};

FUNC VOID PC_Psionic_TEACH_CIRCLE3()
{
	//AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE3_15_01"); //Ich will den dritten Kreis der Magie erlernen.
	AI_Output			(hero,self,"PC_Psionic_TEACH_CIRCLE3_15_01"); //Chci poznat třetí kruh magie.

	if (B_GiveSkill(hero,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_02"); //Mit dem dritten Kreis kannst du fünf weitere Zauber sprechen.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_02"); //Se vstupem do třetího kruhu jsi schopen ovládat dalších pět kouzel.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_03"); //Freundlich stimmen, Feuerball, Telekinese, Eisblock und Pyrokinese.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_03"); //Přátelství, ohnivá koule, telekineze, ledový blok a pyrokineze.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_04"); //Feuerball und Pyrokinese sind weitere machtvolle Angriffssprüche.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_04"); //Ohnivá koule a pyrokineze jsou další z mocných útočných kouzel.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_05"); //Telekinese ermöglicht es dir kleine Gegenstände über Entfernung zu bewegen.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_05"); //Telekineze ti umožní zmocnit se předmětu bez překonání vzdálenosti.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_06"); //Mit Eisblock kannst du einen Gegner einfrieren. Dadurch wird er bewegungsunfähig.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_06"); //Ledovým blokem můžeš protivníka zmrazit. Nebude tak schopen pohybu.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_07"); //Mit dem Zauber Freundlich stimmen, kannst du einen verägerten Feind wieder zur Ruhe bringen.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_07"); //Kouzlo přátelství dovede znovu uklidnit rozzuřeného nepřítele.
		//AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_08"); //Auch Leute die im Begriff sind dich anzugreifen, werden davon ablassen. Versteht sich von selbst, das der Zauber nur auf Menschen wirkt.
		AI_Output		(self, hero, "PC_Psionic_TEACH_CIRCLE3_23_08"); //I lidé, kteří by tě obyčejně napadli, od toho upustí. Ale pamatuj, že kouzlo působí pouze na lidi!
	};
};








//#####################################################################
//##
//##
//##						TUTORIAL-MISSIONEN
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info TEACHRUNEMAKING
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TEACHRUNEMAKING		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_TEACHRUNEMAKING_Condition;
	information	 = 	PC_Psionic_TEACHRUNEMAKING_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Kannst du mir zeigen, wie man Runen herstellt?";
	description	 = 	"Ukážeš mi, jak se vyrábí runy?";
};

func int PC_Psionic_TEACHRUNEMAKING_Condition ()
{
	if	Npc_KnowsInfo (hero,PC_Psionic_MAKERUNES)
	&&	!Lester_LearnRunemaking
	{
		return TRUE;
	};
};

func void PC_Psionic_TEACHRUNEMAKING_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_TEACHRUNEMAKING_15_01"); //Kannst du mir zeigen, wie man Runen herstellt?
	AI_Output			(hero, self, "PC_Psionic_TEACHRUNEMAKING_15_01"); //Ukážeš mi, jak se vyrábí runy?
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 0)
	{
//		AI_Output		(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_02"); //Du musst zumindest das Wissen über den ersten Kreis der Magie haben, sonst kannst du mit den Runen nichts anfangen.
		AI_Output		(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_02"); //Nejprve potřebuješ mít znalost alespoň prvního kruhu magie, bez toho nemůžeš s runami začít.
	}
	else
	{
//		AI_Output		(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_03"); //Sehr gerne. Nun, da du den ersten Kreis der Magie beherrschst, sollte es nicht allzu schwer sein!
		AI_Output		(self, hero, "PC_Psionic_TEACHRUNEMAKING_23_03"); //Velmi rád. Nyní, když jsi vstoupil do prvního kruhu magie, nebude to příliš těžké.

		Lester_LearnRunemaking = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LEARNTHAUMATURGY1
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_LEARNTHAUMATURGY1		(C_INFO)
{
	npc		 	= 	PC_Psionic;
	condition	 = 	PC_Psionic_LEARNTHAUMATURGY1_Condition;
	information	 = 	PC_Psionic_LEARNTHAUMATURGY1_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_LearnThaumaturgy_1,LPCOST_TALENT_THAUMATURGY_1,0);
};

func int PC_Psionic_LEARNTHAUMATURGY1_Condition ()
{
	if	Lester_LearnRunemaking
	&&	(Npc_GetTalentSkill (hero, NPC_TALENT_thaumaturgy) == 0)
	{
		return TRUE;
	};
};

func void PC_Psionic_LEARNTHAUMATURGY1_Info ()
{
	if (B_GiveSkill(hero,NPC_TALENT_thaumaturgy , 1, LPCOST_TALENT_THAUMATURGY_1))
	{
//		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_01"); //Runen werden in zwei Stufen hergestellt.
		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_01"); //Runy připravujeme ve dvou krocích.
//		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_02"); //Zuerst musst du am Runenschmelzer  -der kleine Ofen da hinten-  einen leeren Runenstein anfertigen.
		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_02"); //Nejprve musíš v peci na výrobu runových kamenů - ta malá pec tam vzadu - vyrobit čistý runový kámen.
//		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_03"); //In der zweiten Stufe, bindest du die magischen Kräfte einer Zauberspruchrolle in den vorbereiteten Runenstein und erhälst so eine fertige Zauberrune.
		AI_Output			(self, hero, "PC_Psionic_LEARNTHAUMATURGY1_23_03"); //V druhé fázi vážeš magickou sílu kouzelného svitku k připravenému kameni a získáváš tak kouzelnou runu.

		Log_CreateTopic		(CH1_LearnRuneMaking, LOG_MISSION);
		Log_SetTopicStatus	(CH1_LearnRuneMaking, LOG_RUNNING);
//		B_LogEntry			(CH1_LearnRuneMaking, "Lester will mir zeigen, wie man selbst Runen herstellt. Ausgangskomponenten sind ein leerer Runenstein, sowie eine Spruchrolle des Zaubers, der in die Rune gebunden werden soll.");
		B_LogEntry			(CH1_LearnRuneMaking, "Lester mi ukázal, jak se vyrábí runy. Potřebuji čistý runový kámen a svitek kouzla, které má být do runy vloženo.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RUNESTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_RUNESTONE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_RUNESTONE_Condition;
	information	 = 	PC_Psionic_RUNESTONE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie stelle ich einen solchen Runenstein her?";
	description	 = 	"Jak takový runový kámen vyrobím?";
};

func int PC_Psionic_RUNESTONE_Condition ()
{
	if	(Npc_GetTalentSkill (hero, NPC_TALENT_thaumaturgy) == 1)
	{
		return TRUE;
	};
};

func void PC_Psionic_RUNESTONE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_RUNESTONE_15_01"); //Wie stelle ich einen solchen Runenstein her?
	AI_Output			(hero, self, "PC_Psionic_RUNESTONE_15_01"); //Jak takový runový kámen vyrobím?
//	AI_Output			(self, hero, "PC_Psionic_RUNESTONE_23_02"); //Nehme das Erz und halte sie mit einer Schmiedezange in das Feuer. Das flüssige Erz läuft dann in die Form und schon hast du einen leeren Runenstein.
	AI_Output			(self, hero, "PC_Psionic_RUNESTONE_23_02"); //Vezmi rudu do kleští a vlož ji do ohně. Tekutá ruda potom musí přetéct do formy a runový kámen je hotový.

//	B_LogEntry		(CH1_LearnRuneMaking, "Die Herstellung einer leeren Rune erfordert Erz, dass mit einer Schmiedezange in einen Runenschmelzer gehalten werden muss.");
	B_LogEntry		(CH1_LearnRuneMaking, "Výroba runového kamene vyžaduje magickou rudu, která musí být kovářskými kleštěmi držena v runové peci.");
};

///////////////////////////////////////////////////////////////////////
//	Info ORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_ORE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_ORE_Condition;
	information	 = 	PC_Psionic_ORE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wie komme ich an Erz?";
	description	 = 	"Jak přijdu k nějaké rudě?";
};

func int PC_Psionic_ORE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&&	(Npc_HasItems(hero, ItMi_OreNugget) < Amnt_Rune)
	{
		return TRUE;
	};
};

func void PC_Psionic_ORE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_ORE_15_01"); //Wie komme ich an Erz?
	AI_Output			(hero, self, "PC_Psionic_ORE_15_01"); //Jak přijdu k nějaké rudě?
//	AI_Output			(self, hero, "PC_Psionic_ORE_23_02"); //Ich habe es bei Bartok gekauft, gegenüber in der Burgschmiede.
	AI_Output			(self, hero, "PC_Psionic_ORE_23_02"); //Koupil jsem ji u Bartoka, naproti v hradní kovárně.
//	AI_Output			(self, hero, "PC_Psionic_ORE_23_03"); //Doch nun hat auch ihn die Krankheit erwischt!
	AI_Output			(self, hero, "PC_Psionic_ORE_23_03"); //Ale teď už i on onemocněl!

	if	Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH)
	||	Npc_KnowsInfo(hero, Info_Julius_SMITH)
	{
//		AI_Output		(hero, self, "PC_Psionic_ORE_15_04"); //Ich hörte bereits davon!
		AI_Output		(hero, self, "PC_Psionic_ORE_15_04"); //O tom jsem už slyšel.
	};

//	B_LogEntry		(CH1_LearnRuneMaking, "Lester hat sein Erz bei Bartok dem Burgschmied gekauft. Doch dieser ist einer seltsamen Krankheit verfallen und vegetiert jetzt im Krankenviertel vor sich hin.");
	B_LogEntry		(CH1_LearnRuneMaking, "Lester koupil rudu u Bartoka v hradní kovárně. Ten ale onemocněl a odpočívá ve čtvrti nemocných.");
};

///////////////////////////////////////////////////////////////////////
//	Info PLAGUE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_PLAGUE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_PLAGUE_Condition;
	information	 = 	PC_Psionic_PLAGUE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was für eine Krankheit?";
	description	 = 	"Co je to za nemoc?";
};

func int PC_Psionic_PLAGUE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_ORE)
	&&	!Npc_KnowsInfo(hero, Info_Gotmar_OTHERSMITH)
	&&	!Npc_KnowsInfo(hero, Info_Julius_SMITH)
	{
		return TRUE;
	};
};

func void PC_Psionic_PLAGUE_Info ()
{
//	AI_Output	(hero, self, "PC_Psionic_PLAGUE_15_01"); //Was für eine Krankheit?
	AI_Output	(hero, self, "PC_Psionic_PLAGUE_15_01"); //Co je to za nemoc?
//	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_02"); //Die Opfer verwandeln sich in lebende Tote und reden nur noch wirres Zeug!
	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_02"); //Nemocní se mění v živé mrtvé a vykládají pouze zmatené věci!
//	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_03"); //Zwischen dem Arbeiter- und dem Händlerviertel ist das Krankenviertel.
	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_03"); //Mezi dělnickou a obchodnickou čtvrtí je čtvrť nemocných.
//	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_04"); //Bartok wurde auch dort hingebracht. Aber vielleicht findest du in seiner Schmiede noch Erz.
	AI_Output	(self, hero, "PC_Psionic_PLAGUE_23_04"); //Bartoka tam také odnesli. Ale možná bys mohl v jeho kovárně ještě nějakou rudu najít.

//	B_LogEntry	(CH1_LearnRuneMaking, "In der verlassenen Burgschmiede kann ich wahrscheinlich etwas Erz finden.");
	B_LogEntry	(CH1_LearnRuneMaking, "V opuštěné hradní kovárně bych možná mohl najít trochu rudy.");
};

///////////////////////////////////////////////////////////////////////
//	Info HAVEORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVEORE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_HAVEORE_Condition;
	information	 = 	PC_Psionic_HAVEORE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe genug Erz!";
	description	 = 	"Mám dostatek rudy!";
};

func int PC_Psionic_HAVEORE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&&	(Npc_HasItems(hero, ItMi_OreNugget) >= Amnt_Rune)
	&&	!Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&&	!Npc_HasItems(hero, ItAr_RuneBlank)
	{
		return TRUE;
	};
};

func void PC_Psionic_HAVEORE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_HAVEORE_15_01"); //Ich habe genug Erz.
	AI_Output			(hero, self, "PC_Psionic_HAVEORE_15_01"); //Mám dostatek rudy!
	if	Npc_HasItems(hero, ItMi_Pliers)
	{
//		AI_Output		(self, hero, "OUMULTI_HAVEALL_23_00"); //Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
		AI_Output		(self, hero, "OUMULTI_HAVEALL_23_00"); //Velmi dobře, teď jdi k peci na výrobu runových kamenů a jeden čistý vyrob.
	}
	else
	{
//		AI_Output		(self, hero, "PC_Psionic_HAVEORE_23_03"); //Dann brauchst du nur noch die Schmiedezange.
		AI_Output		(self, hero, "PC_Psionic_HAVEORE_23_03"); //Pak také potřebuješ kovářské kleště.
	};

	B_GiveXP	(XP_Lester_HaveOre);
};

///////////////////////////////////////////////////////////////////////
//	Info HAVEPLIERS
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVEPLIERS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_HAVEPLIERS_Condition;
	information	 = 	PC_Psionic_HAVEPLIERS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe eine Schmiedezange!";
	description	 = 	"Mám kovářské kleště!";
};

func int PC_Psionic_HAVEPLIERS_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&&	Npc_HasItems(hero, ItMi_Pliers)
	&&	!Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&&	!Npc_HasItems(hero, ItAr_RuneBlank)
	{
		return TRUE;
	};
};

func void PC_Psionic_HAVEPLIERS_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_HAVEPLIERS_15_01"); //Ich habe eine Schmiedezange.
	AI_Output			(hero, self, "PC_Psionic_HAVEPLIERS_15_01"); //Mám kovářské kleště!
	if	(Npc_HasItems(hero, ItMi_OreNugget) >= Amnt_Rune)
	{
//		AI_Output		(self, hero, "OUMULTI_HAVEALL_23_02"); //Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
		AI_Output		(self, hero, "OUMULTI_HAVEALL_23_02"); //Skvěle. Jdi k peci na výrobu runových kamenů a vlož tam čistou runu.
	}
	else
	{
//		AI_Output		(self, hero, "PC_Psionic_HAVEPLIERS_23_03"); //Gut, nun brauchst du nur noch genügend Erz.
		AI_Output		(self, hero, "PC_Psionic_HAVEPLIERS_23_03"); //Dobře, teď už jen potřebuješ dostatek rudy.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MADERUNESTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MADERUNESTONE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_MADERUNESTONE_Condition;
	information	 = 	PC_Psionic_MADERUNESTONE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Hier ist mein erster leerer Runenstein!";
	description	 = 	"Tady mám svůj první čistý runový kámen!";
};

func int PC_Psionic_MADERUNESTONE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_RUNESTONE)
	&&	Npc_HasItems(hero, ItAr_RuneBlank)
	{
		return TRUE;
	};
};

func void PC_Psionic_MADERUNESTONE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_MADERUNESTONE_15_01"); //Hier ist mein erster leerer Runenstein.
	AI_Output			(hero, self, "PC_Psionic_MADERUNESTONE_15_01"); //Tady mám svůj první čistý runový kámen!
//	AI_Output			(self, hero, "PC_Psionic_MADERUNESTONE_23_02"); //Du kannst immer wieder neue herstellen, wenn du genug Erz hast.
	AI_Output			(self, hero, "PC_Psionic_MADERUNESTONE_23_02"); //Vždycky si můžeš vyrobit další, když budeš mít dost rudy.

	if	Npc_HasItems(hero, ItAr_ScrollLight)
	||	Npc_HasItems(hero, ItAr_ScrollFirebolt)
	{
//			AI_Output	(self, hero, "PC_Psionic_MADERUNESTONE_23_03"); //Jetzt fehlt dir nur noch eine Spruchrolle.
			AI_Output	(self, hero, "PC_Psionic_MADERUNESTONE_23_03"); //Teď už ti chybí jen kouzelný svitek.
	}
	else
	{
//		AI_Output		(self, hero, "PC_Psionic_MADERUNESTONE_23_04"); //Jetzt kannst du deine erste Rune herstellen.
		AI_Output		(self, hero, "PC_Psionic_MADERUNESTONE_23_04"); //Teď můžeš vytvořit svou první runu.
	};

	if Npc_KnowsInfo(hero, PC_Psionic_HAVEORE)
	{
		B_GiveXP	(XP_Lester_MadeRunestone);
	}
	else
	{
		B_GiveXP	(XP_Lester_MadeRunestone + XP_Lester_HaveOre);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SCROLL		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_SCROLL_Condition;
	information	 = 	PC_Psionic_SCROLL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Eine Spruchrolle?";
	description	 = 	"Eine Spruchrolle?";
};

func int PC_Psionic_SCROLL_Condition ()
{
	if	(Npc_GetTalentSkill (hero, NPC_TALENT_thaumaturgy) == 1)
	&&	!Npc_HasItems(hero, ItAr_ScrollLight)
	&&	!Npc_HasItems(hero, ItAr_ScrollFirebolt)
	{
		return TRUE;
	};
};

func void PC_Psionic_SCROLL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_SCROLL_15_01"); //Eine Spruchrolle?
	AI_Output			(hero, self, "PC_Psionic_SCROLL_15_01"); //Svitek?
//	AI_Output			(self, hero, "PC_Psionic_SCROLL_23_02"); //Such mal in den Bücherregalen und Kisten hier herum. Es müssten noch eine Spruchrollen der Feuermagier vorhanden sein.
	AI_Output			(self, hero, "PC_Psionic_SCROLL_23_02"); //Prohledej regály a bedny tady kolem. Ještě tu musely zbýt nějaké svitky po mázích Ohně.
//	AI_Output			(self, hero, "PC_Psionic_SCROLL_23_03"); //Leider habe ich bisher keine Spruchrollen der Wassermagier gefunden.
	AI_Output			(self, hero, "PC_Psionic_SCROLL_23_03"); //Bohužel jsem tu zatím nenašel jediný svitek mágů Vody.
};

///////////////////////////////////////////////////////////////////////
//	Info WHATWITHSTONE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_WHATWITHSTONE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_WHATWITHSTONE_Condition;
	information	 = 	PC_Psionic_WHATWITHSTONE_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Was mache ich nun mit dem leeren Runenstein?";
	description	 = 	"Co mám teď dělat s čistým runovým kamenem?";
};

func int PC_Psionic_WHATWITHSTONE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&&	!Npc_HasItems(hero, ItAr_ScrollLight)
	&&	!Npc_HasItems(hero, ItAr_ScrollFirebolt)
	&&	!Npc_KnowsInfo(hero, PC_Psionic_HAVESCROLL)
	&&	!Npc_KnowsInfo(hero, PC_Psionic_MADERUNE)
	{
		return TRUE;
	};
};

func void PC_Psionic_WHATWITHSTONE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_WHATWITHSTONE_15_01"); //Was mache ich nun mit dem leeren Runenstein?
	AI_Output			(hero, self, "PC_Psionic_WHATWITHSTONE_15_01"); //Co mám teď dělat s čistým runovým kamenem?
//	AI_Output			(self, hero, "PC_Psionic_WHATWITHSTONE_23_02"); //Nun benötigst du eine Spruchrolle. Stöber etwas in den Regalen und Kisten Herum
	AI_Output			(self, hero, "PC_Psionic_WHATWITHSTONE_23_02"); //Teď potřebuješ svitek. Vyhrab něco z regálů a krabic tady kolem.
//	AI_Output			(self, hero, "PC_Psionic_WHATWITHSTONE_23_03"); //Dort solltest du noch einige einfache Feuerzauber finden.
	AI_Output			(self, hero, "PC_Psionic_WHATWITHSTONE_23_03"); //Měly by tam být pořád nějaká jednoduchá ohnivá kouzla.
};



///////////////////////////////////////////////////////////////////////
//	Info HAVESCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HAVESCROLL		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_HAVESCROLL_Condition;
	information	 = 	PC_Psionic_HAVESCROLL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe eine Spruchrolle!";
	description	 = 	"Mám svitek!";
};

func int PC_Psionic_HAVESCROLL_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&&	(Npc_HasItems(hero, ItAr_ScrollLight) || Npc_HasItems(hero, ItAr_ScrollFirebolt))
	{
		return TRUE;
	};
};

func void PC_Psionic_HAVESCROLL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_01"); //Ich habe eine Spruchrolle!
	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_01"); //Mám svitek!
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_02"); //Sehr gut, dann kannst du dich jetzt am Runenkreisel versuchen. Er steht oben in der alten Kanzel.
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_02"); //Velice dobře, nyní to můžeš vyzkoušet na runovém stole. Stojí nahoře ve staré kazatelně.
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_03"); //Nimm den leeren Runenstein, lies den Zauber auf der Spruchrolle und fokussiere deine Gedanken dabei auf den Stein im Runenkreisel.
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_03"); //Vezmi čistý runový kámen, přečti kouzlo na svitku a soustřeď své myšlenky na kámen v runovém stole.
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_04"); //Ein Teil deiner eigenen Mana wird den Zauber in den Runenstein binden.
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_04"); //Část tvé vlastní many sváže kouzlo s runovým kamenem.
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_05"); //Allerdings gibt es da einen Effekt den du kennen solltest!
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_05"); //Každopádně, je tu jeden efekt, který ty sám znáš.
//	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_06"); //Welchen?
	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_06"); //Který?
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_07"); //(rezitiert) Um dauerhaftes zu schaffen, muss dauerhaftes gegeben werden!
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_07"); //(recituje) Abys zvládl stálé, sám se stálým musíš stát!
//	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_08"); //Was bedeutet das?
	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_08"); //Co to znamená?
//	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_09"); //Das bedeutet, dass deine Mana, die du in den Runenstein fliessen lässt DAUERHAFT verloren ist!
	AI_Output			(self, hero, "PC_Psionic_HAVESCROLL_23_09"); //To znamená, že tvoje mana, kterou do kamene vložíš, bude ztracena.
//	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_10"); //Ich... verstehe!
	AI_Output			(hero, self, "PC_Psionic_HAVESCROLL_15_10"); //Já... rozumím!

	B_GiveXP		(XP_Lester_HaveScroll);
//	B_LogEntry		(CH1_LearnRunemaking, "Der zweite Schritt in der Runenerschaffung findet am Runenkreisel statt. Der Zauber einer Spruchrolle wird in einen leeren Runenstein gebrannt. Dieser Vorgang kostet mich dauerhafte Mana!");
	B_LogEntry		(CH1_LearnRunemaking, "Druhý krok výroby runy se odehrává na runovém stole. Do čistého runového kamene bude přeneseno kouzlo svitku. Tento postup mě stojí trvalou manu!");
};

///////////////////////////////////////////////////////////////////////
//	Info MADERUNE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_MADERUNE		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_MADERUNE_Condition;
	information	 = 	PC_Psionic_MADERUNE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Hier ist meine erste Rune!";
	description	 = 	"Tady je má první runa!";
};

func int PC_Psionic_MADERUNE_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_MADERUNESTONE)
	&&	(Npc_HasItems(hero, ItAr_RuneLight) || Npc_HasItems(hero, ItAr_RuneFirebolt))
	{
		return TRUE;
	};
};

func void PC_Psionic_MADERUNE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_MADERUNE_15_01"); //Hier ist meine erste Rune!
	AI_Output			(hero, self, "PC_Psionic_MADERUNE_15_01"); //Tady je má první runa!
//	AI_Output			(self, hero, "PC_Psionic_MADERUNE_23_02"); //Gute Arbeit.
	AI_Output			(self, hero, "PC_Psionic_MADERUNE_23_02"); //Dobrá práce.
//	AI_Output			(self, hero, "PC_Psionic_MADERUNE_23_03"); //Mehr weiss ich selbst auch nicht über das Herstellen von Runen. Ich bin immer noch am experimentieren.
	AI_Output			(self, hero, "PC_Psionic_MADERUNE_23_03"); //Více už sám o výrobě run nevím. Pořád ještě experimentuji.

	if	Npc_KnowsInfo(hero, PC_Psionic_HAVESCROLL)
	{
		B_GiveXP		(XP_Lester_MadeRune);
	}
	else
	{
		B_GiveXP		(XP_Lester_MadeRune + XP_Lester_HaveScroll);
	};

//	B_LogEntry			(CH1_LearnRunemaking, "Ich habe soeben meine erste Rune erschaffen!");
	B_LogEntry			(CH1_LearnRunemaking, "Právě jsem vyrobil svou první runu!");
};

///////////////////////////////////////////////////////////////////////
//	Info TOGETHER
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_TOGETHER		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_TOGETHER_Condition;
	information	 = 	PC_Psionic_TOGETHER_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Lass uns die Herstellung der weiteren Runen gemeinsam angehen";
	description	 = 	"Co kdybychom pokračovali ve výrobě run společně?";
};

func int PC_Psionic_TOGETHER_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_MADERUNE)
	{
		return TRUE;
	};
};

func void PC_Psionic_TOGETHER_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_TOGETHER_15_01"); //Lass uns die Herstellung der weiteren Runen gemeinsam angehen.
	AI_Output			(hero, self, "PC_Psionic_TOGETHER_15_01"); //Co kdybychom pokračovali ve výrobě run společně?
//	AI_Output			(self, hero, "PC_Psionic_TOGETHER_23_02"); //Gut, zusammen werden wir schneller und besser vorankommen.
	AI_Output			(self, hero, "PC_Psionic_TOGETHER_23_02"); //Dobře. Společně můžeme pokračovat rychleji a lépe.
};

///////////////////////////////////////////////////////////////////////
//	Info WHATNEXT
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_WHATNEXT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_WHATNEXT_Condition;
	information	 = 	PC_Psionic_WHATNEXT_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Du erwähntest vorhin den Zauber EISPFEIL";
	description	 = 	"Zmiňoval jsi kouzlo LEDOVÝ ŠÍP.";
};

func int PC_Psionic_WHATNEXT_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_TOGETHER)
	{
		return TRUE;
	};
};

func void PC_Psionic_WHATNEXT_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_WHATNEXT_15_01"); //Du erwähntest vorhin den Zauber EISPFEIL
	AI_Output			(hero, self, "PC_Psionic_WHATNEXT_15_01"); //Zmiňoval jsi kouzlo LEDOVÝ ŠÍP.
//	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_02"); //Richtig.
	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_02"); //Správně.
//	AI_Output			(hero, self, "PC_Psionic_WHATNEXT_15_03"); //Ich werde eine Spruchrolle dieses Zaubers auftreiben, dann binden wir ihn in eine Rune.
	AI_Output			(hero, self, "PC_Psionic_WHATNEXT_15_03"); //Seženu svitek toho kouzla, a pak ho přeneseme do runy.
//	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_04"); //Ein guter Anfang für eine Suche, wäre es, nach dem Verbleib der Wassermagier zu forschen.
	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_04"); //Nejlepší začátek pro hledání by asi bylo prozkoumat místo pobytu mágů Vody.
//	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_05"); //Vielleicht weiss Horatio, was aus ihnen geworden ist.
	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_05"); //Horatio možná bude vědět, co se s nimi stalo.
//	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_06"); //Er ist der einzige hier im Lager, der zur Zeit der Barriere im Lager der Wassermagier wohnte.
	AI_Output			(self, hero, "PC_Psionic_WHATNEXT_23_06"); //Je tady u nás v táboře jediný, kdo za časů Bariéry žil v jejich táboře.

//	B_LogEntry		(CH1_LearnRunemaking, "Lester und ich haben beschlossen, den einfachsten Zauber der Wassermagie in eine Rune zu bannen.");
	B_LogEntry		(CH1_LearnRunemaking, "Rozhodli jsme se s Lesterem umístit do runy nejjednodušší kouzlo magie Vody.");
};

///////////////////////////////////////////////////////////////////////
//	Info HORATIO
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_HORATIO		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_HORATIO_Condition;
	information	 = 	PC_Psionic_HORATIO_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo finde ich diesen Horatio?";
	description	 = 	"Kde bych našel toho Horatia?";
};

func int PC_Psionic_HORATIO_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT)
	{
		return TRUE;
	};
};

func void PC_Psionic_HORATIO_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_HORATIO_15_01"); //Wo finde ich diesen Horatio?
	AI_Output			(hero, self, "PC_Psionic_HORATIO_15_01"); //Kde bych našel toho Horatia?
//	AI_Output			(self, hero, "PC_Psionic_HORATIO_23_02"); //Er ist einer der Steinklopfer im Arbeiterviertel.
	AI_Output			(self, hero, "PC_Psionic_HORATIO_23_02"); //Je to jeden z kameníků v dělnické čtvrti.

//	B_LogEntry		(CH1_LearnRunemaking, "Horatio könnte womöglich etwas über den Verbleib der Wassermagier wissen. Er klopft Steine im Arbeiterviertel.");
	B_LogEntry		(CH1_LearnRunemaking, "Horatio by mohl vědět něco o tom, co zůstalo po mázích Vody. Je to kameník z dělnické čtvrti.");
};


///////////////////////////////////////////////////////////////////////
//	Info FOUNDTHUNDERBOLTSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDTHUNDERBOLTSCROLL		(C_INFO)
{
	npc		 		= 	PC_Psionic;
	condition		= 	PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Condition;
	information		= 	PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Info;
	important		= 	FALSE;
	permanent		= 	TRUE;

//	description		=	"Ich habe eine Spruchrolle EISPFEIL gefunden";
	description		=	"Našel jsem svitek LEDOVÉHO ŠÍPU.";
};

func int PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_WHATNEXT)
	&&	Npc_HasItems(hero, ItAr_ScrollThunderbolt)
	&&	!Lester_GotThunderbolt
	{
		return TRUE;
	};
};

func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_15_01"); //Ich habe eine Spruchrolle EISPFEIL gefunden.
	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_15_01"); //Našel jsem svitek LEDOVÉHO ŠÍPU.
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_02"); //Sehr gut. Dann sollten wir gleich loslegen eine Rune daraus zu machen.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_02"); //Velmi dobře. Tak bychom měli ihned začít s výrobou runy.
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_03"); //Gibst du mir eine deiner EISPFEIL-Spruchrollen?
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_03"); //Dáš mi ten svitek LEDOVÉHO ŠÍPU?

	Info_ClearChoices	(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
//	Info_AddChoice		(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Vielleicht später...", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO );
	Info_AddChoice		(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Možná později...", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO );
//	Info_AddChoice		(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Hier nimm!", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES );
	Info_AddChoice		(PC_Psionic_FOUNDTHUNDERBOLTSCROLL, "Tady je!", PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES );
};
func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES ()
{
	Info_ClearChoices	(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
//	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_15_01"); //Hier nimm!
	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_15_01"); //Tady je!
	B_GiveInvItems		(hero, self, ItAr_ScrollThunderbolt, 1);
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_23_02"); //Danke. Jetzt kann jeder seine eigene EISPFEIL-Rune herstellen.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_23_02"); //Díky. Teď si můžeme každý vyrobit vlastní runu LEDOVÉHO ŠÍPU.

	B_GiveXP			(XP_Lester_FoundThunderbolt);

	Lester_GotThunderbolt = TRUE;
};

func void PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO ()
{
	Info_ClearChoices	(PC_Psionic_FOUNDTHUNDERBOLTSCROLL);
//	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_15_01"); //Vielleicht später...
	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_15_01"); //Možná později...
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_23_02"); //Wie du meinst.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_23_02"); //Jak myslíš.
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDHEALSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDHEALSCROLL		(C_INFO)
{
	npc		 	 = 	PC_Psionic;
	condition	 = 	PC_Psionic_FOUNDHEALSCROLL_Condition;
	information	 = 	PC_Psionic_FOUNDHEALSCROLL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe eine Spruchrolle HEILUNG gefunden!";
	description	 = 	"Našel jsem svitek LÉČENÍ!";
};

func int PC_Psionic_FOUNDHEALSCROLL_Condition ()
{
	if	Lester_GotThunderbolt
	&&	Npc_HasItems(hero, ItAr_ScrollHeal)
	{
		return TRUE;
	};
};

func void PC_Psionic_FOUNDHEALSCROLL_Info ()
{
//	AI_Output		(hero, self, "PC_Psionic_FOUNDHEALSCROLL_15_01"); //Ich habe eine Spruchrolle HEILUNG gefunden!
	AI_Output		(hero, self, "PC_Psionic_FOUNDHEALSCROLL_15_01"); //Našel jsem svitek LÉČENÍ!
//	AI_Output		(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_02"); //Sehr interessant, zeig mal her!
	AI_Output		(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_02"); //Velmi zajímavé, ukaž mi ho!
	B_UseFakeScroll	();
//	AI_Output		(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_03"); //Dieser Zauber scheint komplexer als EISPFEIL zu sein! Um ihn in eine Rune binden zu können, musst du erst den zweiten Kreis der Magie erlernen!
	AI_Output		(self, hero, "PC_Psionic_FOUNDHEALSCROLL_23_03"); //Tohle kouzlo vypadá komplikovaněji než LEDOVÝ ŠÍP. Abys do něj mohl runu vložit, musíš nejprve poznat druhý kruh magie!

	B_GiveXP		(XP_Lester_FoundHeal);
//	B_LogEntry		(CH1_LearnRunemaking, "Um die Spruchrolle HEILUNG in eine Rune binden zu können, muss ich den zweiten Kreis der Magie erlernen!");
	B_LogEntry		(CH1_LearnRunemaking, "Abych mohl přenést svitek LÉČENÍ do runy, musím nejprve poznat druhý kruh magie.");
};

///////////////////////////////////////////////////////////////////////
//	Info FOUNDTHUNDERBALLSCROLL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FOUNDTHUNDERBALLSCROLL		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_FOUNDTHUNDERBALLSCROLL_Condition;
	information	 = 	PC_Psionic_FOUNDTHUNDERBALLSCROLL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe eine Spruchrolle KUGELBLITZ gefunden!";
	description	 = 	"Mám svitek KULOVÉHO BLESKU!";
};

func int PC_Psionic_FOUNDTHUNDERBALLSCROLL_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_FOUNDHEALSCROLL)
	&&	Npc_HasItems(hero, ItAr_ScrollThunderball)
	{
		return TRUE;
	};
};

func void PC_Psionic_FOUNDTHUNDERBALLSCROLL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_15_01"); //Ich habe eine Spruchrolle KUGELBLITZ gefunden!
	AI_Output			(hero, self, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_15_01"); //Mám svitek KULOVÉHO BLESKU!
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_02"); //Zeig mal her...
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_02"); //Ukaž mi ho...
	B_GiveInvItems		(hero, self, ItAr_ScrollThunderball, 1);
	B_UseFakeScroll		();
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_03"); //Aha! Verstehe!
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_03"); //Aha! Rozumím!
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_04"); //Jetzt wird es wirklich heftig! Dies ist ein Wasserzauber aus dem Dritten Kreis.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_04"); //Tohle bude doopravdy užitečné! Je to kouzlo mágů Vody ze třetího kruhu.
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_05"); //Solch komplexe Zauber in eine Rune binden zu können erfordert nicht nur das Wissen über den Dritten Kreis sondern auch die Beherrschung der Runenerschaffung auf einer höheren Ebene.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_05"); //Přenést takto komplikované kouzlo do runy nevyžaduje pouze znalost třetího kruhu magie, ale také ovládnutí mistrovství tvorby run na vyšší úrovni.
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_06"); //Ich werde in den Büchern über das Schmieden von Runen nachlesen.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_06"); //Zkusím o tom něco nastudovat z knih o tvorbě run.
//	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_07"); //Besuche mich morgen wieder, bis dahin werde ich hoffentlich wissen, wie wir das anstellen müssen.
	AI_Output			(self, hero, "PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_07"); //Přijď sem za mnou zítra, to už bych snad mohl vědět, co budeme muset všechno provést.
	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "study");

	Lester_LastDay = B_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Info THUNDERBALL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_THUNDERBALL		(C_INFO)
{
	npc		 = 	PC_Psionic;
	condition	 = 	PC_Psionic_THUNDERBALL_Condition;
	information	 = 	PC_Psionic_THUNDERBALL_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

//	description	 = 	"Hast du über den Zauber KUGELBLITZ etwas herausgefunden?";
	description	 = 	"Povedlo se ti zjistit něco o kouzlu KULOVÉHO BLESKU?";
};

func int PC_Psionic_THUNDERBALL_Condition ()
{
	if	Npc_KnowsInfo(hero, PC_Psionic_FOUNDTHUNDERBALLSCROLL)
	&&	!Lester_KnowBloodore
	{
		return TRUE;
	};
};

func void PC_Psionic_THUNDERBALL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_THUNDERBALL_15_01"); //Hast du über den Zauber KUGELBLITZ etwas herausgefunden?
	AI_Output			(hero, self, "PC_Psionic_THUNDERBALL_15_01"); //Povedlo se ti zjistit něco o kouzlu KULOVÉHO BLESKU?

	if	Npc_HasItems(self, ItAr_ScrollThunderball)
	{
		if	(B_GetDay() <= Lester_LastDay)
		{
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_02"); //Gib mir Zeit bis morgen, dann weiss ich vielleicht mehr!
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_02"); //Dej mi čas do zítřka, pak budu snad vědět něco více.
		}
		else
		{
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_03"); //Ja, allerdings. Ich bin in einem Buch mit dem Titel THAUMATURGIE für Fortgeschrittene fündig geworden.
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_03"); //Ano, ovšem. V knize s názvem DIVOTVORBA jsem našel pokročilé techniky.
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_04"); //Der Prozess für Runen ab dem dritten magischen Kreis ist im Grunde der selbe, allerdings ändern sich die benötigten Materialien.
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_04"); //Proces je s runami od třetího kruhu výše v základu stejný, ačkoliv se liší požadované materiály.
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_05"); //Leere Runensteine müssen das grössere Potential des Zaubers aufnehmen können und dafür genügt kein normales Erz mehr.
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_05"); //Čistý runový kámen musí moci získat silnější potenciál kouzla a k tomu mu už nestačí běžná ruda.
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_06"); //Das Buch spricht von sogenanntem Bluterz.
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_06"); //Kniha hovoří o takzvané krvavé rudě.
//			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_07"); //Ich fürchte wir brauchen etwas davon.
			AI_Output	(self, hero, "PC_Psionic_THUNDERBALL_23_07"); //Obávám se, že budeme potřebovat právě tu.
			Lester_KnowBloodore = TRUE;

			Npc_ExchangeRoutine	(self, "start");
		};
	}
	else
	{
//		AI_Output		(self, hero, "PC_Psionic_THUNDERBALL_23_08"); //Irgendwie ist mir die Spruchrolle abhanden gekommen! Seltsam!
		AI_Output		(self, hero, "PC_Psionic_THUNDERBALL_23_08"); //Nějak se mi ztratil ten svitek! Zvláštní!
		Lester_LostThunderball = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ANOTHERTHUNDERBALL
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_ANOTHERTHUNDERBALL		(C_INFO)
{
	npc		 	 = 	PC_Psionic;
	condition	 = 	PC_Psionic_ANOTHERTHUNDERBALL_Condition;
	information	 = 	PC_Psionic_ANOTHERTHUNDERBALL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!";
	description	 = 	"Mám tu pro tebe ještě jeden svitek KULOVÉHO BLESKU.";
};

func int PC_Psionic_ANOTHERTHUNDERBALL_Condition ()
{
	if	Lester_LostThunderball
	&&	!Lester_KnowBloodore
	&&	Npc_HasItems(hero, ItAr_ScrollThunderball)
	{
		return TRUE;
	};
};

func void PC_Psionic_ANOTHERTHUNDERBALL_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_ANOTHERTHUNDERBALL_15_01"); //Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!
	AI_Output			(hero, self, "PC_Psionic_ANOTHERTHUNDERBALL_15_01"); //Mám tu pro tebe ještě jeden svitek KULOVÉHO BLESKU.
	B_GiveInvItems		(hero, self, ItAr_ScrollThunderball, 1);
//	AI_Output			(self, hero, "PC_Psionic_ANOTHERTHUNDERBALL_23_02"); //Ah, sehr gut.
	AI_Output			(self, hero, "PC_Psionic_ANOTHERTHUNDERBALL_23_02"); //Ah, výborně.

};

///////////////////////////////////////////////////////////////////////
//	Info FINDBLOODORE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_FINDBLOODORE		(C_INFO)
{
	npc		 	 = 	PC_Psionic;
	condition	 = 	PC_Psionic_FINDBLOODORE_Condition;
	information	 = 	PC_Psionic_FINDBLOODORE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wo kann ich solches Bluterz finden?";
	description	 = 	"Kde mohu najít nějakou krvavou rudu?";
};

func int PC_Psionic_FINDBLOODORE_Condition ()
{
	if	Lester_KnowBloodore
	{
		return TRUE;
	};
};

func void PC_Psionic_FINDBLOODORE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_FINDBLOODORE_15_01"); //Wo kann ich solches Bluterz finden?
	AI_Output			(hero, self, "PC_Psionic_FINDBLOODORE_15_01"); //Kde mohu najít nějakou krvavou rudu?
//	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_02"); //Da habe ich nicht die geringste Ahnung.
	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_02"); //O tom nemám nejmenší tušení.
//	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_03"); //Waffenschmiede und Minenarbeiter haben normalerweise mit Erz zu tun.
	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_03"); //Kováři a kopáči mají většinou co do činění s rudou.
//	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_04"); //Vielleicht kommst du auf diesem Weg weiter.
	AI_Output			(self, hero, "PC_Psionic_FINDBLOODORE_23_04"); //Třeba se ti o tom podaří časem něco zjistit.

	Npc_ExchangeRoutine	(self, "start");

//	B_LogEntry			(CH1_LearnRuneMaking, "Um Zauber des dritten Kreises in Runen zu binden wird ein besonderes Erz, sogenanntes BLUTERZ benötigt.");
	B_LogEntry			(CH1_LearnRuneMaking, "Abych svázal s runou kouzla třetího kruhu, potřebuji k tomu zvláštní rudu - takzvanou KRVAVOU RUDU.");

	Log_CreateTopic		(CH1_Bloodore,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_Bloodore,	LOG_RUNNING);
//	B_LogEntry 			(CH1_Bloodore, "Waffenschmiede und Minenarbeiter haben normalerweise mit Erz zu tun, vielleicht können mir diese Leute etwas über das sogenannte BLUTERZ erzählen.");
	B_LogEntry 			(CH1_Bloodore, "S rudou mívají co dělat kováři a kopáči, možná by mi tihle lidé mohli o té KRVAVÉ RUDĚ něco říct.");
};







//#####################################################################
//##
//##
//##					REZEPTUR FÜR TALAMON
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info SEARCHRECIPE
///////////////////////////////////////////////////////////////////////
instance PC_Psionic_SEARCHRECIPE		(C_INFO)
{
	npc		 	 = 	PC_Psionic;
	condition	 = 	PC_Psionic_SEARCHRECIPE_Condition;
	information	 = 	PC_Psionic_SEARCHRECIPE_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Ich suche nach einer Rezeptur...";
	description	 = 	"Hledám jistý recept...";
};

func int PC_Psionic_SEARCHRECIPE_Condition ()
{
	if	Npc_KnowsInfo (hero,HLR_501_Talamon_RECIPEFORMONEY)
	&&	!Npc_KnowsInfo (hero,HLR_501_Talamon_HASRECIPE)
	{
		return TRUE;
	};
};

func void PC_Psionic_SEARCHRECIPE_Info ()
{
//	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_01"); //Ich suche nach einer Rezeptur für ein Mittel gegen Wahnsinn.
	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_01"); //Hledám recept na prostředek proti šílenství.
//	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_02"); //Die Feuermagier sollen eine solche Rezeptur erforscht haben, aber ich kann hier im Magierhaus nichts finden!
	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_02"); //Mágové Ohně museli nějaký takový recept mít, ale nemůžu tady v Domě mágů nic najít!
//	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_03"); //Hmmm... ich kann mich dunkel an eine solche Rezeptur erinnern.
	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_03"); //Hmmm... matně si na takový recept vzpomínám.
//	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_04"); //Aber ich habe sie nicht mehr.
	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_04"); //Ale už ho nemám.
//	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_05"); //Wer hat sie denn?
	AI_Output			(hero, self, "PC_Psionic_SEARCHRECIPE_15_05"); //A kdo ho teda má?
//	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_06"); //Ich habe alle Schriftstücke, die ich nicht brauchte an Agon den Händler verkauft, vielleicht hat er sie ja noch.
	AI_Output			(self, hero, "PC_Psionic_SEARCHRECIPE_23_06"); //Veškeré spisy, které jsem nepotřeboval, jsem prodal obchodníku Agonovi, možná je ještě má.

	if	!Npc_KnowsInfo(hero,WRK_225_Agon_WELCOME)
	{
//		AI_Output		(hero, self, "PC_Psionic_SEARCHRECIPE_15_07"); //Wo finde ich diesen Agon?
		AI_Output		(hero, self, "PC_Psionic_SEARCHRECIPE_15_07"); //Kde bych našel tohohle Agona?
//		AI_Output		(self, hero, "PC_Psionic_SEARCHRECIPE_23_08"); //Er hat einen Stand im Händlerviertel. Im Aussenring. Aber sei vorsichtig, er ist ein ziemlich übler Kerl.
		AI_Output		(self, hero, "PC_Psionic_SEARCHRECIPE_23_08"); //Má stánek v Obchodnické čtvrti. Ve vnějším okruhu. Ale dej pozor, je to celkem mizera.
	};

//	B_LogEntry			(CH1_LearnAlchemy, "Ich komme auf der Suche nach der Rezeptur für Talamon langsam weiter. Lester hat sie an Agon im Händlerviertel verkauft.");
	B_LogEntry			(CH1_LearnAlchemy, "Trochu jsem s hledáním receptu pro Talomona pokročil. Lester ho prodal Agonovi z Obchodnické čtvrti.");
};
