///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance  PC_Fighter_Exit (C_INFO)
{
	npc			=  PC_Fighter;
	nr			=  999;
	condition	=  PC_Fighter_Exit_Condition;
	information	=  PC_Fighter_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  PC_Fighter_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  PC_Fighter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};









/*


INSTANCE PC_Fighter_TRAIN2 (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 10;
	condition	= PC_Fighter_TRAIN2_Condition;
	information	= PC_Fighter_TRAIN2_Info;
	permanent	= 1;
	description = B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,0);
};

FUNC INT PC_Fighter_TRAIN2_Condition()
{
	if (Npc_KnowsInfo(hero,PC_Fighter_FIRSTMISSION))
	{
		return 1;
	};
};

FUNC VOID PC_Fighter_TRAIN2_Info()
{
//	AI_Output			(other,self,"PC_Fighter_TRAIN2_Info_15_00"); //Ich will den Kampf mit einhändigen Waffen perfekt beherrschen.
	AI_Output			(other,self,"PC_Fighter_TRAIN2_Info_15_00"); //Chtěl bych perfektně zvládnout boj s jednoručními zbraněmi.

	if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
	{
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_01"); //Ein gute Absicht. Egal was du lernst, lerne es richtig.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_01"); //To je dobrý záměr. Ať se učíš cokoliv, nauč se to pořádně.
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_02"); //Kampfhaltung und Schlag- Kombinationen wirst du mit der Zeit schon beherrschen.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_02"); //Bojový postoj a kombinace úderů si postupem času osvojíš.
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_03"); //Es gibt verschiedene Kampftechniken. Du kannst den Gegener ständig umkreisen und gezielt zuschlagen. Aber davon bin ich kein Freund.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_03"); //Existují různé techniky boje. Můžeš kroužit kolem protivníka a pak cíleně zaútočit. Ale toho nejsem příznivcem.
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_04"); //Ich schlage zu und falls es notwendig ist, schlage ich nochmal. Bis er am Boden liegt. Dann den nächsten.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_04"); //Prostě nepřítele praštím, a pokud je to nutné, tak ho praštím ještě jednou. Dokud neleží na zemi. A pak se jde na dalšího.
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_05"); //So kämpfe ich. Schnell und hart. Alles andere ist Frauentanz.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_05"); //Tak bojuju já. Rychle a tvrdě. Cokoliv jiného je tanec pro ženské.
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_06"); //Zeig mir mal wie du die Keule schwingst. Es gibt zwei Jungs vonner Miliz, die schlagen sich zu gerne mit den Arbeitern. Verpasse ihnen eine Lektion!
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_06"); //Ukaž mi ještě, jak mácháš kyjem. Jsou tady dva hoši z milice, kteří se rádi perou s dělníky. Uděl jim lekci!
//	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_07"); //Die beiden Typen heissen 106 und 107. Mach sie fertig, aber bring sie nicht um. //Tady je to nedokončené. Hádám, že když je tohle všechno šedé, není to ve finální verzi.
	AI_Output			(self,other,"PC_Fighter_TRAIN2_Info_22_07"); //Ti chlápci se jmenují 106 a 107. Dej jim co proto, ale nezabíjej je.
	CreateInvItem (self, ItFo_Beer);
	AI_UseItem (self, ItFo_Beer);

	PC_Fighter_TRAIN2.permanent = 0;

	};


};

// Kampf mit Zweihändigen Waffen

instance  PC_Fighter_ZWEIHAND1 (C_INFO)
{
	npc				= PC_Fighter;
	condition		= PC_Fighter_ZWEIHAND1_Condition;
	information		= PC_Fighter_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0);
};

FUNC int  PC_Fighter_ZWEIHAND1_Condition()
{
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
		&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)

	{
		return 1;
	};

};
FUNC void  PC_Fighter_ZWEIHAND1_Info()
{

//	AI_Output			(other, self,"PC_Fighter_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.
	AI_Output			(other, self,"PC_Fighter_ZWEIHAND1_Info_15_01"); //Chci se naučit zacházet s obouručními zbraněmi.


	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_09_02"); //Nun, dann will ich dir mal ein paar Takte erzählen.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_09_02"); //No, pak ti řeknu pár věcí.

		CreateInvItem (self, ItFo_Beer);
		AI_UseItem (self, ItFo_Beer);

//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_03"); //Zweihänder das sind die richtigen Waffen. Ich selber bevorzuge meine Axt, aber auch die Schwerter schneiden gute Wunden.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_03"); //Obouruční zbraně, to jsou ty pravé zbraně. Sám upřednostňuji svoji sekyru, ale meče taky umí zasadit pěknou ránu.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_04"); //Für so einen Zweihänder brauchst du ordentlich Stärke. Erst dann kannst du die tödlichen Schläge durchziehen.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_04"); //Na takovou obouručku potřebuješ pořádnou sílu. Teprve potom můžeš rozdávat smrtící rány.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_05"); //Ich habe schon viele Kerle gesehen die stolz einen Zweihänder trugen, aber nicht mal eine Kombination schlagen konnten.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_05"); //Už jsem viděl dost chlápků, kteří hrdě nosili obouručku, ale nezvládli s ní ani pár kombinací.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_06"); //Klar, es geht auch ohne Kombinationen. Wenn du die Waffe nur seitlich schwingst, bremst du die Bewegungen deines Opfers. // Konec je trochu volněji přeložen, ale myslím, že lepší než doslovně.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_06"); //Jasně, jde to i bez kombinací. Pokud zbraní jenom mácháš ze strany na stranu, tvoje oběť se nemůže přiblížit.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_07"); //Drei, vier kräftige Schläge und jeder Mann geht zu Boden. Deshalb liebe ich diese Waffen.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND1_Info_22_07"); //Stačí tři, čtyři mocné údery a každý člověk jde k zemi. Proto tyhle zbraně miluju.

		PC_Fighter_ZWEIHAND1.permanent = 0;
	};
};
//-------------------------------------------------------------------------
//				ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  PC_Fighter_ZWEIHAND2 (C_INFO)
{
	npc				= PC_Fighter;
	condition		= PC_Fighter_ZWEIHAND2_Condition;
	information		= PC_Fighter_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0);
};

FUNC int  PC_Fighter_ZWEIHAND2_Condition()
{
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)

	{
		return TRUE;
	};

};
FUNC void  PC_Fighter_ZWEIHAND2_Info()
{
//	AI_Output			(other, self,"PC_Fighter_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.
	AI_Output			(other, self,"PC_Fighter_ZWEIHAND2_Info_15_01"); //Chěl bych se dozvědět více o obouručním boji.

	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_02"); //Das große Waffen großen Schaden machen weißt du ja bereits.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_02"); //Už víš, že velké zbraně působí velké škody.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_03"); //Ich kannte mal einen Typen der konnte stundenlang von Kombinationen und Blockhaltungen sprechen.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_03"); //Kdysi jsem znal chlápka, který dokázal celé hodiny mluvit o kombinacích úderů a jak správně blokovat. 
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_04"); //Eines Tages, als er wieder am Feuer saß und erzählte, stand einer auf und erschlug ihn.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_04"); //Jednoho dne, když zase seděl u ohně a vykecával se, jeden chlápek vstal a zabil ho.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_05"); //Sei immer vorbereitet und auf der Hut. Erwarte nichts und rechne mit allem.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_05"); //Buď vždy připraven a ve střehu. Nečekej na nic a počítej se vším.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_06"); //Lerne deine Waffe kennen und benutze sie dafür, wofür sie da ist.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_06"); //Poznej svoji zbraň a používej ji na to, k čemu je určená.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_07"); //Und wenn du schon den Löffel abgibst, dann nimm soviele Bastarde mit, wie du kriegen kannst.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_07"); //A když už máš natáhnout bačkory, vem co nejvíce bastardů s sebou.
//		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_08"); //Soviel dazu.
		AI_Output			(self, other,"PC_Fighter_ZWEIHAND2_Info_22_08"); //Takže tak.

		CreateInvItem (self, ItFo_Beer);
		AI_UseItem (self, ItFo_Beer);

		PC_Fighter_ZWEIHAND2.permanent = 0 ;
	};
};
*/
/*------------------------------------------------------------------------
							ARMBRUST TALK
------------------------------------------------------------------------*/
/*
instance  PC_Fighter_CROSSBOW (C_INFO)
{
	npc				= PC_Fighter;
	condition		= PC_Fighter_CROSSBOW_Condition;
	information		= PC_Fighter_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnCrossbow_1,LPCOST_TALENT_CROSSBOW_1,0);
};

FUNC int  PC_Fighter_CROSSBOW_Condition()
{
	if  (Npc_GetTalentSkill (other, NPC_TALENT_BOW) == 2)
	&&	(Npc_KnowsInfo(other,PC_Fighter_NEEDTRAINING))
	{
		return TRUE;
	};
};
FUNC void  PC_Fighter_CROSSBOW_Info()
{
//	AI_Output			(other, self,"PC_Fighter_CROSSBOW_OK_15_01"); //Zeig mir den Umgang mit der Armbrust.
	AI_Output			(other, self,"PC_Fighter_CROSSBOW_OK_15_01"); //Ukaž mi zacházení s kuší.

	if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
	{
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_02"); //Gut, fangen wir direkt an. Die Armbrust ist eine Waffe mit Zukunft.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_02"); //Dobře, začněme hned. Kuše, to je zbraň budoucnosti.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_03"); //Die Mechanik macht es sogar einer Frau möglich, dir einen Bolzen durch den Schädel zu jagen.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_03"); //Mechanika umožňuje dokonce i ženské, aby ti vpálila šipku skrz lebku.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_04"); //Allerdings haben die Frauen nicht die Kraft die Armbrust wieder zu spannen. HAHAHA
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_04"); //Ovšem ženy nemají sílu kuši pak znovu natáhnout. HAHAHA
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_05"); //Wie auch immer,es ist immer wieder der gleiche Vorgang: Spannen, Bolzen einlegen, zielen und durchziehen.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_05"); //Jde vždycky o ten samý proces: Natáhnout, vložit šipku, zamířit, a vypálit.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_06"); //Denk daran, die Armbrust ist eine Fernkampfwaffe. Setze sie nur ein, wenn deine Opfer in entsprechender Entfernung sind.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_06"); //Pamatuj, že kuše je zbraň na dálku. Používej ji jenom když je tvoje oběť v dostatečné vzdálenosti.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_07"); //Du kannst auch direkt mal was für mich tun.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_07"); //Rovnou pro mě můžeš něco udělat.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_08"); //Mehrere Blutfliegen haben am hinteren Lagertor einen Arbeiter angegriffen. Erledige sie mit deinen Bolzen!
		AI_Output			(self, other,"PC_Fighter_CROSSBOW_OK_09_08"); //Nekolik krvavých much zaútočila na dělníka u zadní brány. Prošpikuj je šipkama!

		PC_Fighter_CROSSBOW.permanent = 0;
	};

};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2
------------------------------------------------------------------------*/
/*
instance  PC_Fighter_CROSSBOW2 (C_INFO)
{
	npc			= PC_Fighter;
	condition		= PC_Fighter_CROSSBOW2_Condition;
	information		= PC_Fighter_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnCrossbow_2,LPCOST_TALENT_CROSSBOW_2,0);
};

FUNC int  PC_Fighter_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1)
	{
		return TRUE;
	};

};
FUNC void  PC_Fighter_CROSSBOW2_Info()
{
//	AI_Output			(other, self,"PC_Fighter_CROSSBOW2_OK_15_01"); //Ich will die Meisterschaft mit der Armbrust lernen.
	AI_Output			(other, self,"PC_Fighter_CROSSBOW2_OK_15_01"); //Chtěl bych kuši zvládnout mistrovsky.

	if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
	{
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_02"); //So, du willst ein Meister werden?
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_02"); //Tak ty chceš být mistrem?
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_03"); //Sieh zu das du nicht mit einer leichten Armbrust rumläufst, sondern besorge dir die Teile, die ordentlich Löcher reissen.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_03"); //Koukej, abys kolem nepobíhal s lehkou kuší, ale obstarej si kousek, kterým způsobíš pořádné krátery.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_04"); //Wenn du gegen mehrere Gegner kämpfst, dann arbeite mit schnellen Zielwechseln. So kannst du sie aufhalten.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_04"); //Když bojuješ s více nepřáteli, pracuj na rychlém střídání cílů. Tím je můžeš zastavit.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_05"); //Und sorge dafür das du immer genug Bolzen hast. Wenn die ersten Schüsse nicht ausreichen, um dein Opfer zu töten, jage soviele hinterher, wie du brauchst. // U toho konce si nejsem jistý.
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_05"); //A postarej se, abys měl vždycky dost šipek. Pokud první šipky nestačí, aby tvoji oběť zabily, no tak jich vystřel tolik, kolik bude potřeba.
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_06"); //Bolzen sind billig und deine Haut ist teuer. Denk daran wenn du im Wald stehst und keine Bolzen mehr hast. HAHAHA
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_06"); //Šipky jsou levné a tvoje kůže je drahá. Vzpomeň si na to, až budeš stát v lese a dojdou ti šipky. HAHAHA
//		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_07"); //Die Blutfliegen müssen irgendwo ein Nest haben. Finde es und lösche die gesamte Brut aus!
		AI_Output			(self, other,"PC_Fighter_CROSSBOW2_OK_09_07"); //Krvavé mouchy tu někde musí mít hnízdo. Najdi ho a vypráskej všechnu tu havěť!
		CreateInvItem (self, ItFo_Beer);
		AI_UseItem (self, ItFo_Beer);
		PC_Fighter_CROSSBOW2.permanent = 0;
	};

};
*/














