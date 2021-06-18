instance  Mil_119_Cassian_Exit (C_INFO)
{
	npc			=  Mil_119_Cassian;
	nr			=  999;
	condition	=  Mil_119_Cassian_Exit_Condition;
	information	=  Mil_119_Cassian_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int  Mil_119_Cassian_Exit_Condition()
{
	return TRUE;
};
FUNC VOID  Mil_119_Cassian_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

///////////////////////////////////////////////////////////////////////
//	Info TRAIN
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_HI		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	nr		 = 	12;
	condition	 = 	Mil_119_Cassian_HI_Condition;
	information	 = 	Mil_119_Cassian_HI_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was machst du hier?";
	description	 = 	"Co tady děláš??";
};

func int Mil_119_Cassian_HI_Condition ()
{
	return TRUE;
};

func void Mil_119_Cassian_HI_Info ()
{
//	AI_Output			(hero, self, "Mil_119_HI_15_01"); //Was machst du hier?
	AI_Output			(hero, self, "Mil_119_HI_15_01"); //Co tady děláš?
//	AI_Output			(self, hero, "Mil_119_HI_08_02"); //Ich bin Cassian, erster Leutnant der Miliz. //Nevím, jestli nejde "erster Leutnant" přeložit nějak líp, nemám úroveň B2 v armádní terminologii.
	AI_Output			(self, hero, "Mil_119_HI_08_02"); //Jsem Cassian, první poručík v milici.
//	AI_Output			(self, hero, "Mil_119_HI_08_03"); //Ich sorge dafür, das niemand die Reglen des Lagers bricht.
	AI_Output			(self, hero, "Mil_119_HI_08_03"); //Starám se o to, aby nikdo neporušoval pravidla tábora.
//	AI_Output			(self, hero, "Mil_119_HI_08_04"); //Und ich sorge dafür das die, die es doch tun, es nie wieder tun werden.
	AI_Output			(self, hero, "Mil_119_HI_08_04"); //A taky o to, aby ti, kteří je poruší, už je znovu neporušili.
};
///////////////////////////////////////////////////////////////////////
//	Info BEGINTRAIN
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_BEGINTRAIN		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_BEGINTRAIN_Condition;
	information	 = 	Mil_119_Cassian_BEGINTRAIN_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Diego sagte mir, du trainierst Kämpfer?";
	description	 = 	"Diego mi řekl, že trénuješ bojovníky?";
};

func int Mil_119_Cassian_BEGINTRAIN_Condition ()
{
	if	Npc_KnowsInfo(hero,PC_Thief_NEEDTRAINING)
	&&	Npc_KnowsInfo(hero,Mil_119_Cassian_HI)
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_BEGINTRAIN_Info ()
{
	if	Npc_KnowsInfo(hero, MIL_103_Berengar_ABOUT)
	{
//		AI_Output		(hero, self, "Mil_119_BEGINTRAIN_15_01"); //Hauptmann Berengar sagte mir, du trainierst Kämpfer?
		AI_Output		(hero, self, "Mil_119_BEGINTRAIN_15_01"); //Kapitán Berengar mi řekl, že trénuješ bojovníky?
	}
	else
	{
//		AI_Output		(hero, self, "Mil_119_BEGINTRAIN_15_02"); //Diego sagte mir, du trainierst Kämpfer?
		AI_Output		(hero, self, "Mil_119_BEGINTRAIN_15_02"); //Diego mi řekl, že trénuješ bojovníky??
	};
//	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_03"); //Das ist richtig. Ich sorge dafür, dass die Milizsoldaten kräftig genug sind, wenn die Orks kommen.
	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_03"); //To je pravda. Starám se, aby byli vojáci milice dost silní, až přijdou skřeti.
//	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_04"); //Und sie werden kommen...
	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_04"); //A oni přijdou...
//	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_05"); //Ich kann auch dir zeigen wie du deine Stärke und dein Talent im Umgang mit dem Einhänder verbesserst.
	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_05"); //I tobě můžu ukázat, jak zlepšit svou sílu a boj s jednoručními zbraněmi.
//	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_06"); //Aber im Gegenzug wirst du einige Aufgaben für mich erledigen. Wenn du einverstanden bist, können wir gleich loslegen.
	AI_Output			(self, hero, "Mil_119_BEGINTRAIN_08_06"); //Ale na oplátku pro mě splníš jeden úkol. Jestli souhlasíš, můžeme hned začít.
};

///////////////////////////////////////////////////////////////////////
//	Info WHYSTR
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHYSTR		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_WHYSTR_Condition;
	information	 = 	Mil_119_Cassian_WHYSTR_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Wofür benötige ich Stärke?";
	description	 = 	"K čemu potřebuji sílu?";
};

func int Mil_119_Cassian_WHYSTR_Condition ()
{
	if	Npc_KnowsInfo(hero, Mil_119_Cassian_BEGINTRAIN)
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_WHYSTR_Info ()
{
//	AI_Output			(hero, self, "Mil_119_WHYSTR_15_01"); //Wofür benötige ich Stärke?
	AI_Output			(hero, self, "Mil_119_WHYSTR_15_01"); //K čemu potřebuji sílu?
//	AI_Output			(self, hero, "Mil_119_WHYSTR_08_02"); //Je stärker du bist, desto tiefere Wunden verursachst du mit Nahkampfwaffen.
	AI_Output			(self, hero, "Mil_119_WHYSTR_08_02"); //Čím silnější budeš, tím hlubší rány způsobíš při souboji na blízko.
//	AI_Output			(self, hero, "Mil_119_WHYSTR_08_03"); //Wenn dir erst einmal ein gut gerüsteter Ork gegenübersteht, dann wirst du ihn nur mit grosser Stärke verwunden können.
	AI_Output			(self, hero, "Mil_119_WHYSTR_08_03"); //Až budeš čelit dobře obrněnému skřetovi, zraníš ho jenom s velkou silou.	
//	AI_Output			(self, hero, "Mil_119_WHYSTR_08_04"); //Dazu kommt, dass vor allem die grösseren Nahkampfwaffen so schwer sind, dass du sie nur mit hoher Stärke schwingen kannst.
	AI_Output			(self, hero, "Mil_119_WHYSTR_08_04"); //A navíc především ty větší zbraně na blízko jsou tak silné, že s nimi dokážeš máchat jenom pokud budeš dost silný.	
};

///////////////////////////////////////////////////////////////////////
//	Info WHY1HAND
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHY1HAND		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_WHY1HAND_Condition;
	information	 = 	Mil_119_Cassian_WHY1HAND_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Was nützt mir Talent im Umgang mit Einhändern?";
	description	 = 	"K čemu mi bude talent při boji s jednoručními zbraněmi?";
};

func int Mil_119_Cassian_WHY1HAND_Condition ()
{
	if	Npc_KnowsInfo(hero, Mil_119_Cassian_BEGINTRAIN)
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_WHY1HAND_Info ()
{
//	AI_Output			(hero, self, "Mil_119_WHY1HAND_15_01"); //Was nützt mir Talent im Umgang mit Einhändern?
	AI_Output			(hero, self, "Mil_119_WHY1HAND_15_01"); //K čemu mi bude talent při boji s jednoručními zbraněmi?
//	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_02"); //Je mehr Talent du erlernt hast, desto schneller kannst du mit solchen Waffen zuschlagen.
	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_02"); //Čím většímu talentu se naučíš, tím rychleji budeš moct s takovými zbraněmi bojovat.
//	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_03"); //Talentierte Kämfper können ihre Gegner mit blitzschnellen Schlagkombinationen derart bedrängen, dass diese nicht mehr mal zum Parrieren geschweige denn zum Angreifen kommen.
	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_03"); //Talentovaní bojovníci můžou své protivníky zavalit bleskurychlými kombinacemi úderů tak, že nebudou mít ani šanci je vykrýt, natožpak zaútočit zpátky.
//	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_04"); //Ausserdem wissen nur talentierte Kämpfer, wie sie ungeschütze stellen des Gegners treffen, und so manchmal viel tiefere Wunden reissen als sonst.
	AI_Output			(self, hero, "Mil_119_WHY1HAND_08_04"); //Navíc jen talentovaní bojovníci vědí, jak trefit nechráněná místa protivníka, a tak někdy způsobit hlubší zranění než obvykle.
};



///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
INSTANCE Mil_119_Cassian_Teach(C_INFO)
{
	npc			= Mil_119_Cassian;
	nr			= 10;
	condition	= Mil_119_Cassian_Teach_Condition;
	information	= Mil_119_Cassian_Teach_Info;
	permanent	= 1;
//	description = "Ich will stärker werden";
	description = "Chci být silnější";
};

FUNC INT Mil_119_Cassian_Teach_Condition()
{
	if Npc_KnowsInfo (other,Mil_119_Cassian_BEGINTRAIN)
	{
		return TRUE;
	};
};
FUNC VOID Mil_119_Cassian_Teach_Info()
{
//	AI_Output(other,self,"Mil_119_Cassian_Teach_15_01"); //Ich will stärker werden.
	AI_Output(other,self,"Mil_119_Cassian_Teach_15_01"); //Chci být silnější.

	Info_ClearChoices	(Mil_119_Cassian_Teach);
	Info_AddChoice		(Mil_119_Cassian_Teach,DIALOG_BACK									,Mil_119_Cassian_Teach_BACK);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)	,Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Mil_119_Cassian_Teach_STR_1);

};
func void Mil_119_Cassian_Teach_BACK()
{
	Info_ClearChoices	(Mil_119_Cassian_Teach);
};

func void Mil_119_Cassian_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Mil_119_Cassian_Teach);
	Info_AddChoice		(Mil_119_Cassian_Teach,DIALOG_BACK									,Mil_119_Cassian_Teach_BACK);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Mil_119_Cassian_Teach_STR_1);

};

func void Mil_119_Cassian_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Mil_119_Cassian_Teach);
	Info_AddChoice		(Mil_119_Cassian_Teach,DIALOG_BACK									,Mil_119_Cassian_Teach_BACK);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Mil_119_Cassian_Teach_STR_5);
	Info_AddChoice		(Mil_119_Cassian_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Mil_119_Cassian_Teach_STR_1);

};

///////////////////////////////////////////////////////////////////////
//	Info TRAIN
///////////////////////////////////////////////////////////////////////
INSTANCE Mil_119_Cassian_TRAIN (C_INFO)
{
	npc			= Mil_119_Cassian;
	nr			= 10;
	condition	= Mil_119_Cassian_TRAIN_Condition;
	information	= Mil_119_Cassian_TRAIN_Info;
	permanent	= TRUE;
	description = B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,0);
};

FUNC INT Mil_119_Cassian_TRAIN_Condition()
{
	if	Npc_KnowsInfo(hero,Mil_119_Cassian_BEGINTRAIN)
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};

FUNC VOID Mil_119_Cassian_TRAIN_Info()
{

//	AI_Output				(other,self,"Mil_119_Cassian_TRAIN_15_01"); //Zeig mir den Kampf mit einhändigen Waffen.
	AI_Output				(other,self,"Mil_119_Cassian_TRAIN_15_01"); //Ukaž mi jak bojovat s jednoručními zbraněmi.

	if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
	{
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_02"); //Zunächst halte die Waffe mit einer Hand. Dadurch kannst du schneller zuschlagen.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_02"); //Zaprvé, drž zbraň v jedné ruce. Tak budeš moct rychleji udeřit.
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_03"); //Mit weiten Seitenhieben kannst du dir gefährliche Gegner vom Hals halten.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_03"); //Širokými údery si udržíš nebezpečné protivníky dál od těla.
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_04"); //Und mit einer Kombination von Schlägen kannst du gezielte Attacken durchführen.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_04"); //A kombinací úderů můžeš provést zacílené útoky.
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_05"); //Das wichtigste ist, das du Kampferfahrung sammelst. Da habe ich auch direkt die erste Gelegenheit für dich.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_05"); //Nejdůležitější je, abys získal bojové zkušenosti. A rovnou mám pro tebe první úkol.		
//		AI_Output			(other,self,"Mil_119_Cassian_TRAIN_15_06"); //Lass hören.
		AI_Output			(other,self,"Mil_119_Cassian_TRAIN_15_06"); //Sem s ním.
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_07"); //Du mußt wissen, das es hier im Lager einige Herumtreiber gibt. Faule Hunde, die sich einen Dreck um die Gemeinschaft des Lagers scheren.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_07"); //Určitě víš, že tady v táboře je pár tuláků. Líní psi, kteří pro komunitu v táboře nic nedělají.		
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_08"); //Huldrych ist einer von ihnen. Er wurde beobachtet, wie er sich an den Vorräten des Händlers Agon bedient hat.
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_08"); //Huldrych je jeden z nich. Viděli ho, jak si dopomohl ke zboží obchodníka Agona.		
//		AI_Output			(other,self,"Mil_119_Cassian_TRAIN_15_09"); //Und meine Aufgabe ist ...
		AI_Output			(other,self,"Mil_119_Cassian_TRAIN_15_09"); //A můj úkol je ...
//		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_10"); //Deine Aufgabe ist es, Huldrych das gestohlene Zeug wieder abzunehmen. Verpass ihm eine Lektion. Aber LASS IHM AM LEBEN!
		AI_Output			(self,other,"Mil_119_Cassian_TRAIN_08_10"); //Tvůj úkol je zařídit, aby Huldrych vrátil ukradené zboží. Dej mu lekci. Ale NECH HO NAŽIVU!		

		Log_CreateTopic		(CH1_Train1h, LOG_MISSION);
		Log_SetTopicStatus	(CH1_Train1h,LOG_RUNNING);
//		B_LogEntry			(CH1_Train1h,"Huldrych hat den Händler Agon bestohlen. Cassian hat mich nun beauftragt, zum einen Huldrych eine Lektion zu erteilen und zum anderen Agon sein Eigentum wiederzubringen. Dabei wäre es unklug, Huldrych zu töten!");
		B_LogEntry			(CH1_Train1h,"Huldrych okradl obchodníka Agona. Cassian mě zaúkoloval abych Huldrychovi udělil lekci a přiměl ho vrátit ukradené zboží. Nebylo by moudré při tom Huldrycha zabít!");		

		Cassian_BeatHudrych = LOG_RUNNING;

		// Diebesgut Huldrych in die Tasche stecken
		var C_NPC Huldrych;
		Huldrych = Hlp_GetNpc (THF_401_Huldrych);
		CreateInvItems (Huldrych,ItMi_Silver,100);
		Huldrych.guild  = GIL_NONE;

		AI_StopProcessInfos	( self );
	};


};

///////////////////////////////////////////////////////////////////////
//	Info WHILEHULDRYCH
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_WHILEHULDRYCH		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_WHILEHULDRYCH_Condition;
	information	 = 	Mil_119_Cassian_WHILEHULDRYCH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int Mil_119_Cassian_WHILEHULDRYCH_Condition ()
{
	if Cassian_BeatHudrych == LOG_RUNNING
	&&  C_NPCisinvincible(hero)
	&& !Npc_KnowsInfo (hero,WRK_225_Agon_STOLEN)
	{
		return TRUE;
	};
};
func void Mil_119_Cassian_WHILEHULDRYCH_Info ()
{
//	AI_Output			(self, hero, "Mil_119_Cassian_WHILEHULDRYCH_08_01"); //Vielleicht solltest du zuerst mit Agon sprechen, bevor du zu Huldrych gehst.
	AI_Output			(self, hero, "Mil_119_Cassian_WHILEHULDRYCH_08_01"); //Možná by sis měl nejprve promluvit s Agonem, než půjdeš za Huldrychem.

//	B_LogEntry (CH1_Train1h,"Vielleicht ist es besser, erst mit Agon zu reden, bevor ich zu Huldrych gehe, um einen besseren Überblick der Situation zu bekommen.");
	B_LogEntry (CH1_Train1h,"Možná bude lepší si nejprve promluvit s Agonem, abych získal lepší přehled o situaci, a až pak jít za Huldrychem.");	
	Info_ClearChoices (Mil_119_Cassian_WHILEHULDRYCH);
};

///////////////////////////////////////////////////////////////////////
//	Info FIRSTMISSION
///////////////////////////////////////////////////////////////////////
instance  Mil_119_Cassian_FIRSTMISSION (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_FIRSTMISSION_Condition;
	information		= Mil_119_Cassian_FIRSTMISSION_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Huldrych hat seine Lektion erhalten";
	description		= "Huldrych dostal svou lekci";
};

FUNC int Mil_119_Cassian_FIRSTMISSION_Condition()
{
	var C_NPC Huldrych;
	Huldrych = Hlp_GetNpc (THF_401_Huldrych);

	if (Huldrych.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& Cassian_BeatHudrych == LOG_RUNNING
	&& !Npc_IsDead (Huldrych)
	{
		return TRUE;
	};
};
FUNC void  Mil_119_Cassian_FIRSTMISSION_Info()
{
//	AI_Output			(other, self,"Mil_119_Cassian_FIRSTMISSION_Info_15_01"); //Huldrych hat seine Lektion erhalten
	AI_Output			(other, self,"Mil_119_Cassian_FIRSTMISSION_Info_15_01"); //Huldrych dostal svou lekci
//	AI_Output			(self, other,"Mil_119_Cassian_FIRSTMISSION_Info_08_02"); //Saubere Arbeit. Hoffentlich lernt er daraus.
	AI_Output			(self, other,"Mil_119_Cassian_FIRSTMISSION_Info_08_02"); //Krásná práce. Snad se z ní poučí.

	var C_NPC Huldrych;
	Huldrych = Hlp_GetNpc (THF_401_Huldrych);

	Cassian_BeatHudrych = LOG_SUCCESS;
	Huldrych.guild  = GIL_THIEF;

	B_GiveXP			(XP_HuldrychLektion);

	Log_SetTopicStatus	(CH1_Train1h,LOG_SUCCESS);
//	B_LogEntry			(CH1_Train1h,"Ich habe die Aufgabe zu Cassian's Zufriedenheit erledigt. Huldrych hat seine Lektion erhalten.");
	B_LogEntry			(CH1_Train1h,"Splnil jsem úkol k Cassianově spokojenosti. Huldrych dostal svou lekci.");

};

///////////////////////////////////////////////////////////////////////
//	Info HULDRYCHDEAD
///////////////////////////////////////////////////////////////////////
instance  Mil_119_Cassian_HULDRYCHDEAD (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_HULDRYCHDEAD_Condition;
	information		= Mil_119_Cassian_HULDRYCHDEAD_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Huldrych hat...äh seine Lektion endgültig verstanden";
	description		= "Huldrych...eh, svoji lekci konečně pochopil";
};

FUNC int Mil_119_Cassian_HULDRYCHDEAD_Condition()
{
	var C_NPC Huldrych;
	Huldrych = Hlp_GetNpc (THF_401_Huldrych);

	if Npc_IsDead (Huldrych)
	&& Cassian_BeatHudrych == LOG_RUNNING
	{
		return TRUE;
	};
};
FUNC void  Mil_119_Cassian_HULDRYCHDEAD_Info()
{
//	AI_Output			(other, self,"Mil_119_Cassian_HULDRYCHDEAD_Info_15_01"); //Huldrych hat...äh seine Lektion endgültig verstanden.
	AI_Output			(other, self,"Mil_119_Cassian_HULDRYCHDEAD_Info_15_01"); //Huldrych...eh, svoji lekci konečně pochopil.	
//	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_02"); //Du hast ihn umgebracht. Hatte ich dir nicht gesagt, du sollst ihn nicht umbringen?
	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_02"); //Zabil jsi ho. Neříkal jsem ti snad, abys ho nezabíjel?	
//	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_03"); //Das oberste Gesetz hier im Lager lautete: KEIN MORD! Ein Mord ist ein Grund jemanden aus dem Lager zu verweisen!
	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_03"); //Hlavní pravidlo tady v táboře je: ŽÁDNÉ VRAŽDY! Vražda je důvod k vyhození z tábora!	
//	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_04"); //Wenn du noch einmal jemanden tötest, dann kann dir keiner helfen. Nicht mal Diego, Lester oder ich. Bei aller Freundschaft nicht.
	AI_Output			(self, other,"Mil_119_Cassian_HULDRYCHDEAD_Info_08_04"); //Pokud ještě někoho zabiješ, už ti nikdo nepomůže. Ani Diego, ani Lester, ani já. Ani přes naše přátelství.	

	Cassian_BeatHudrych = LOG_FAILED;
	Log_SetTopicStatus (CH1_Train1h, LOG_FAILED);
//	B_LogEntry (CH1_Train1h,"Es wäre besser gewesen, ich hätte Huldrych nicht umgebracht. In Zukunft sollte ich vorsichtig sein, Mord wird von allen sehr ernst genommen");
	B_LogEntry (CH1_Train1h,"Bylo by lepší, kdybych byl Huldrycha nezabil. Příště bych si měl dát pozor, vražda se tu nebere na lehkou váhu");	
};

///////////////////////////////////////////////////////////////////////
//	Info AGONSSILVER
///////////////////////////////////////////////////////////////////////
instance  Mil_119_Cassian_AGONSSILVER (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_AGONSSILVER_Condition;
	information		= Mil_119_Cassian_AGONSSILVER_Info;
	important		= 0;
	permanent		= 0;
//	description		= "Agon hat sein Silber wieder";
	description		= "Agon má zase svoje stříbro";
};

FUNC int Mil_119_Cassian_AGONSSILVER_Condition()
{
	if Npc_KnowsInfo (hero,WRK_225_Agon_100)
	{
		return TRUE;
	};
};
FUNC void  Mil_119_Cassian_AGONSSILVER_Info()
{
//	AI_Output			(other, self,"Mil_119_Cassian_AGONSSILVER_Info_15_01"); //Agon hat sein Silber wieder.
	AI_Output			(other, self,"Mil_119_Cassian_AGONSSILVER_Info_15_01"); //Agon má zase svoje stříbro.	
//	AI_Output			(self, other,"Mil_119_Cassian_AGONSSILVER_Info_08_02"); //Gut gemacht. Da wird der knausrige Kerl sich aber freuen.
	AI_Output			(self, other,"Mil_119_Cassian_AGONSSILVER_Info_08_02"); //Dobře. Ten lakomec z toho bude mít radost.
	B_GiveXP			(XP_AgonSilver);
};

///////////////////////////////////////////////////////////////////////
//	Info HULDRYCHDEAL
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_HULDRYCHDEAL		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	nr		 = 	15;
	condition	 = 	Mil_119_Cassian_HULDRYCHDEAL_Condition;
	information	 = 	Mil_119_Cassian_HULDRYCHDEAL_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Huldrych hat bekommen, was er verdient!";
	description	 = 	"Huldrych dostal, co si zasloužil!";
};

func int Mil_119_Cassian_HULDRYCHDEAL_Condition ()
{
	var C_NPC Huldrych;
	Huldrych = Hlp_GetNpc (THF_401_Huldrych);

	if	!Huldrych.aivar[AIV_WASDEFEATEDBYSC]
	&&	(Cassian_BeatHudrych == LOG_RUNNING)
	&&	!Npc_IsDead (Huldrych)
	&&	Huldrych_Away
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_HULDRYCHDEAL_Info ()
{
//	AI_Output			(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_01"); //Huldrych hat bekommen, was er verdient!
	AI_Output			(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_01"); //Huldrych dostal, co si zasloužil!
//	AI_Output			(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_02"); //Ich hoffe du hast ihn nicht zu hart rangenommen.
	AI_Output			(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_02"); //Doufám, že jsi na něj nebyl moc tvrdý.
//	AI_Output			(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_03"); //Er hat es verstanden.
	AI_Output			(hero, self, "Mil_119_Cassian_HULDRYCHDEAL_15_03"); //Pochopil to.
//	AI_Output			(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_04"); //Und du weißt jetzt auch, wie die Dinge hier laufen.
	AI_Output			(self, hero, "Mil_119_Cassian_HULDRYCHDEAL_08_04"); //A teď víš, jak to tady chodí.

	var C_NPC Huldrych;
	Huldrych = Hlp_GetNpc (THF_401_Huldrych);

	Cassian_BeatHudrych = LOG_SUCCESS;
	Huldrych.guild  = GIL_THIEF;

	B_GiveXP			(XP_HuldrychDeal);

	Log_SetTopicStatus	(CH1_Train1h,LOG_SUCCESS);
//	B_LogEntry			(CH1_Train1h,"Ich habe ein gutes Geschäft mit Huldrych gemacht. Und niemand hat etwas davon bemerkt. Vielleicht wird mir das noch einmal nützlich sein.");
	B_LogEntry			(CH1_Train1h,"Uzavřel jsem s Huldrychem dobrý obchod. A nikdo si ničeho nevšiml. Třeba se mi to v budoucnu ještě bude hodit.");	
};

///////////////////////////////////////////////////////////////////////
//	Info LEARN1HST2
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_LEARN1HST2		(C_INFO)
{
	npc			 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_LEARN1HST2_Condition;
	information	 = 	Mil_119_Cassian_LEARN1HST2_Info;
	important	 = 	FALSE;
	permanent	 = 	TRUE;

	description	 = 	B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,0);
};

func int Mil_119_Cassian_LEARN1HST2_Condition ()
{
	if	((Cassian_BeatHudrych == LOG_SUCCESS)	|| (Cassian_BeatHudrych == LOG_FAILED))
	&&	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1)
	{
		return TRUE;
	};
};
func void Mil_119_Cassian_LEARN1HST2_Info ()
{
//	AI_Output			(hero, self, "Mil_119_Cassian_LEARN1HST2_15_01"); //Zeig mir mehr über den Kampf mit einhändigen Waffen.
	AI_Output			(hero, self, "Mil_119_Cassian_LEARN1HST2_15_01"); //Nauč mě více o boji s jednoručními zbraněmi.

	if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
	{
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_02"); //Durch die Meisterschaft des einhändigen Kampfes schlägst du schneller und härter zu.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_02"); //Skrz mistrovství boje s jednoručními zbraněmi dokážeš rychleji a silněji udeřit.	
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_03"); //Deine Angriffskombinationen werden geschikter und präziser.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_03"); //Kombinace tvých úderů budou obratnější a preciznější.		
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_04"); //Und die Chance einen kritischen Treffer zu landen wird größer.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_04"); //A šance provést kritický úder bude větší.
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_05"); //Aber es ist der Verstand, der einen guten von einem schlechten Kämpder unterscheidet.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_05"); //Ale mysl je to, co odlišuje dobrého od špatného bojovníka.	
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_06"); //Erkenne die Situation, bewahre einen kühlen Kopf und handel umsichtig.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_06"); //Přečíst situaci, zachovat si chladnou hlavu a jednat s rozmyslem.
//		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_07"); //Denn nur wer die Situation versteht, kann sie lenken und kontrollieren.
		AI_Output			(self, hero, "Mil_119_Cassian_LEARN1HST2_08_07"); //Jenom ten, kdo rozumí situaci, ji může ovlivnit a kontrolovat.

		Mil_119_Cassian_LEARN1HST2.permanent = FALSE;
		Cassian_Info = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_JOB		(C_INFO)
{
	npc		 	 = 	Mil_119_Cassian;
	nr		 	 = 	33;
	condition	 = 	Mil_119_Cassian_JOB_Condition;
	information	 = 	Mil_119_Cassian_JOB_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Hast du noch eine Aufgabe für mich?";
	description	 = 	"Máš pro mě ještě nějaký úkol?";
};

func int Mil_119_Cassian_JOB_Condition ()
{
	if	Cassian_Info
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_JOB_Info ()
{
//	AI_Output			(hero, self, "Mil_119_JOB_15_01"); //Hast du noch eine Aufgabe für mich?
	AI_Output			(hero, self, "Mil_119_JOB_15_01"); //Máš pro mě ještě nějaký úkol?
//	AI_Output			(self, hero, "Mil_119_JOB_08_02"); //Ich nicht, aber Agon hat braucht einen Kämpfer, der ihn beschützt.
	AI_Output			(self, hero, "Mil_119_JOB_08_02"); //Já ne, ale Agon by potřeboval nějakého bojovníka, který ho ochrání.
//	AI_Output			(self, hero, "Mil_119_JOB_08_03"); //Wir versuchen das Gebiet um das Lager herum besetzt zu halten, aber es gibt immer wieder Monster die verdammt nah ans Lager heran kommen.
	AI_Output			(self, hero, "Mil_119_JOB_08_03"); //Snažíme se udržovat oblast okolo tábora čistou, ale vždycky se objeví nějaká další potvora, která se dostane zatraceně blízko k táboru.	
	AI_Output			(self, hero, "Mil_119_JOB_08_04"); //
};

///////////////////////////////////////////////////////////////////////
//	Info BRUTUS
///////////////////////////////////////////////////////////////////////
instance Mil_119_Cassian_BRUTUS		(C_INFO)
{
	npc		 = 	Mil_119_Cassian;
	condition	 = 	Mil_119_Cassian_BRUTUS_Condition;
	information	 = 	Mil_119_Cassian_BRUTUS_Info;
	important	 = 	FALSE;
	permanent	 = 	FALSE;

//	description	 = 	"Brutus lässt dir was ausrichten...";
	description	 = 	"Brutus ti chce něco vzkázat...";	
};

func int Mil_119_Cassian_BRUTUS_Condition ()
{
	if	Npc_KnowsInfo(hero, MIL_121_Brutus_CASSIAN)
	{
		return TRUE;
	};
};

func void Mil_119_Cassian_BRUTUS_Info ()
{
//	AI_Output			(hero, self, "Mil_119_BRUTUS_15_01"); //Brutus lässt dir was ausrichten. Er fordert dich auf, gegen ihn in der Arena zu kämpfen.
	AI_Output			(hero, self, "Mil_119_BRUTUS_15_01"); //Brutus ti chce něco vzkázat. Vyzývá tě, abys proti němu bojoval v aréně.	
//	AI_Output			(self, hero, "Mil_119_BRUTUS_08_02"); //Brutus sollte sich mehr um seine Pflichten als Leutnant der Miliz kümmern.
	AI_Output			(self, hero, "Mil_119_BRUTUS_08_02"); //Brutus by se měl spíše starat o svoje povinnosti jako poručík milice.
//	AI_Output			(self, hero, "Mil_119_BRUTUS_08_03"); //Er hängt den ganzen Tag nur vor der Arena herum und reisst grosse Sprüche.
	AI_Output			(self, hero, "Mil_119_BRUTUS_08_03"); //Jenom se celý den potlouká okolo arény a má plnou hubu keců.
//	AI_Output			(self, hero, "Mil_119_BRUTUS_08_04"); //Er sollte seine Kraft lieber für die Orks aufheben, oder sich um die Milizsoldaten kümmern.
	AI_Output			(self, hero, "Mil_119_BRUTUS_08_04"); //Měl by raději šetřit síly na skřety nebo se starat o vojáky milice	
//	AI_Output			(self, hero, "Mil_119_BRUTUS_08_05"); //Wenn er so weiter macht, wird ihn Berengar über kurz oder lang rausschmeissen.
	AI_Output			(self, hero, "Mil_119_BRUTUS_08_05"); //Pokud to s ním tak půjde dále, dříve či později ho Berengar vyhodí.	
};































/*


instance  Mil_119_Cassian_JOIN (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_JOIN_Condition;
	information		= Mil_119_Cassian_JOIN_Info;
//	description		= "Ich will der Miliz beitreten";
	description		= "Chci se přidat k milici";
	permanent		= TRUE;
};

FUNC int  Mil_119_Cassian_JOIN_Condition()
{
	if	(Npc_KnowsInfo (hero,Infos_Mil_4_JOIN))
	||	(Npc_KnowsInfo (hero,Infos_Mil_6_JOIN))
	||	(Npc_KnowsInfo (hero,Infos_Mil_7_JOIN))
	||	(Npc_KnowsInfo (hero,Infos_Mil_9_JOIN))

	{
		return TRUE;
	};

};
FUNC void  Mil_119_Cassian_JOIN_Info()
{
//	AI_Output (other, self,"Mil_119_Cassian_JOIN_Info_15_01"); //Ich will der Miliz beitreten.
	AI_Output (other, self,"Mil_119_Cassian_JOIN_Info_15_01"); //Chci se přidat k milici.

	if (other.attribute [ATR_STRENGTH] >= 35)// Spieler erfüllt die Bedingung
	&& (Npc_GetTalentSkill (other, NPC_TALENT_1H)>= 1)
	{
//		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_02"); //Gut, deine Fähigkeiten sind ausreichend  für den Eintritt in die Miliz. Aber du musst noch eine Prüfung ablegen. Sag mir Bescheid, wenn du bereit bist.
		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_02"); //Dobře, tvoje schopnosti jsou dostatečné pro přijetí k milici. Ale musíš ještě splnit jednu zkoušku. Dej vědět, až budeš připraven.
		Info_ClearChoices  (Mil_119_Cassian_JOIN);
		// 1 und nicht True, weil die Variable noch weiter hochgezählt wird
		Mil_119_Cassian_JOIN.permanent = FALSE;
	}
	else if (other.attribute [ATR_STRENGTH] < 35)// Spieler hat weder die erforderliche Stärke, noch das Talent
	&& (Npc_GetTalentSkill (other, NPC_TALENT_1H)== 0)
	{
//		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_03"); //Komm wieder, wenn du stärker geworden bist und ein Kampftalent beherrscht.
		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_03"); //Vrať se, až budeš silnější a lepší v boji.
	}
	else if	(other.attribute [ATR_STRENGTH] < 35)// Spieler hat das Talent, aber nicht die Stärke
	&& (Npc_GetTalentSkill (other, NPC_TALENT_1H)>= 1)
	{
//		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_04"); //Du beherrscht den Umgang mit Waffen, aber du bist noch nicht stark genug.
		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_04"); //Dokážeš se ohánět se zbraní, ale ještě nejsi dost silný.
	}
	else if (other.attribute [ATR_STRENGTH] >= 35)// Spieler hat die Stärke, aber nicht das Talent
	&& (Npc_GetTalentSkill (other, NPC_TALENT_1H) < 1)
	{
//		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_05"); //Du bist stark genug, aber du beherrscht noch kein Kampftalent.
		AI_Output (self, other,"Mil_119_Cassian_JOIN_Info_00_05"); //Jsi dost silný, ale ještě moc neumíš bojovat.
	};

};

instance  Mil_119_Cassian_GUARDTEST (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_GUARDTEST_Condition;
	information		= Mil_119_Cassian_GUARDTEST_Info;
//	description		= "Ich bin bereit für die Prüfung";
	description		= "Jsem připraven na zkoušku";
};

FUNC int  Mil_119_Cassian_GUARDTEST_Condition()
{
	if( Militia_FIRST == TRUE)
	{
		return TRUE;
	};
};
FUNC void  Mil_119_Cassian_GUARDTEST_Info()
{
//	AI_Output (other, self,"Mil_119_Cassian_GUARDTEST_Info_15_01"); //Ich bin bereit für die Prüfung.
	AI_Output (other, self,"Mil_119_Cassian_GUARDTEST_Info_15_01"); //Jsem připraven na zkoušku.
//	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_02"); //Gut. Die Hauptaufgabe der Miliz besteht darin das Lager zu bewachen.
	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_02"); //Dobře. Hlavním cílem milice je hlídat tábor.
//	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_03"); //Du wirst mit Soldat Osbert eine Nacht Wache am hinteren Tor schieben.
	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_03"); //Budeš mít noční hlídku u zadní brány s vojákem Osbertem.
//	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_04"); //Melde dich bei ihm. Er wird dich über alles weitere informieren.
	AI_Output (self, other,"Mil_119_Cassian_GUARDTEST_Info_00_04"); //Hlas se u něj. O všem ostatním tě bude informovat.

};

instance  Mil_119_Cassian_LASTTEST (C_INFO)
{
	npc				= Mil_119_Cassian;
	condition		= Mil_119_Cassian_LASTTEST_Condition;
	information		= Mil_119_Cassian_LASTTEST_Info;
//	description		= "Ich habe Wache gehalten";
	description		= "Mám za sebou hlídku";
};

FUNC int  Mil_119_Cassian_LASTTEST_Condition()
{
	return TRUE;
};
FUNC void  Mil_119_Cassian_LASTTEST_Info()
{
//	AI_Output (other, self,"Mil_119_Cassian_LASTTEST_Info_15_01"); //Ich habe Wache gehalten.
	AI_Output (other, self,"Mil_119_Cassian_LASTTEST_Info_15_01"); //Mám za sebou hlídku.
//	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_02"); //Gut. Osbert hat mir ausrichten lassen, das du deine Sache ganz gut gemacht hast.
	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_02"); //Dobrá. Osbert už mi dal vědět, žes odvedl docela dobrou práci.
//	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_03"); //Damit kommen wir dann zu der zweiten Prüfung.(Nachdrücklich) Ein Kampf.
	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_03"); //To nás přivádí k druhému testu. (Důrazně) K boji.
//	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_04"); //Gegen wen?
	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_04"); //Proti komu?
//	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_05"); //Du wirst in der Arena gegen Wylfern antreten. Sprich mit ihm, wenn du soweit bist.
	AI_Output (self, other,"Mil_119_Cassian_LASTTEST_Info_00_05"); //Nastoupíš v aréně proti Wylfernovi. Promluv si s ním, až budeš připraven.

};

*/
















