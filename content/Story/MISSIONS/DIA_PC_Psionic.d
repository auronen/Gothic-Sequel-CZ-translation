
instance PC_Psionic_Exit(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = PC_Psionic_Exit_Condition;
	information = PC_Psionic_Exit_Info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int PC_Psionic_Exit_Condition()
{
	return TRUE;
};

func void PC_Psionic_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_HALLOAGAIN(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_halloagain_condition;
	information = pc_psionic_halloagain_info;
	important = TRUE;
};


func int pc_psionic_halloagain_condition()
{
	return TRUE;
};

func void pc_psionic_halloagain_info()
{
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_01");	//Hey, ich dachte du wärst tot!
	AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_02");	//Das kommt mir bekannt vor.
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_03");	//Was ist geschehen?
	AI_Output(hero,self,"PC_Psionic_HALLOAGAIN_15_04");	//Der Kampf gegen den Schläfer hat mich geschwächt. Das bedeutet ich muss wieder 'ne Menge lernen.
	AI_Output(self,hero,"PC_Psionic_HALLOAGAIN_23_05");	//Ich kann dir zeigen, wie du deine magische Kraft steigerst und dir die Kreise der Magie lehren.
	b_setattitude(self,ATT_FRIENDLY);
};


instance PC_PSIONIC_FORTRESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = pc_psionic_fortress_condition;
	information = pc_psionic_fortress_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wolltest Du nicht von der Felsenfestung Besitz nehmen?";
};


func int pc_psionic_fortress_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_halloagain))
	{
		return TRUE;
	};
};

func void pc_psionic_fortress_info()
{
	AI_Output(hero,self,"PC_Psionic_FORTRESS_15_01");	//Wolltest Du nicht von der Felsenfestung Besitz nehmen?
	AI_Output(self,hero,"PC_Psionic_FORTRESS_23_02");	//Das wollte ich, aber dann tauchte plätzlich König Rhobar mit seinen Paladinen dort auf, und machte sich in 'meiner' Festung breit.
};


instance PC_PSIONIC_KINGHERE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_kinghere_condition;
	information = pc_psionic_kinghere_info;
	important = FALSE;
	permanent = FALSE;
	description = "König Rhobar ist hier?";
};


func int pc_psionic_kinghere_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_fortress))
	{
		return TRUE;
	};
};

func void pc_psionic_kinghere_info()
{
	AI_Output(hero,self,"PC_Psionic_KINGHERE_15_01");	//König Rhobar ist hier?
	AI_Output(self,hero,"PC_Psionic_KINGHERE_23_02");	//Es ist noch garnicht so lange her, da stand er plötzlich mit seinen Paladinen vor dem Alten Lager.
	AI_Output(self,hero,"PC_Psionic_KINGHERE_23_03");	//Einige düster dreinblickende Magier befanden sich ebenfalls in seinem Gefolge. Nur die Götter wissen, was die hier verloren haben.
	AI_Output(self,hero,"PC_Psionic_KINGHERE_23_04");	//Er nahm kurzerhand die Felsenfestung in Besitz und richtete dort sein Hauptquartier ein!
	AI_Output(self,hero,"PC_Psionic_KINGHERE_23_05");	//Angeblich sucht er irgendetwas hier in der Gegend!
};


instance PC_PSIONIC_KINGWHAT(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_kingwhat_condition;
	information = pc_psionic_kingwhat_info;
	important = FALSE;
	permanent = FALSE;
	description = "Weisst du WAS der König hier sucht?";
};


func int pc_psionic_kingwhat_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_kinghere))
	{
		return TRUE;
	};
};

func void pc_psionic_kingwhat_info()
{
	AI_Output(hero,self,"PC_Psionic_KINGWHAT_15_01");	//Weisst du WAS der König hier sucht?
	AI_Output(self,hero,"PC_Psionic_KINGWHAT_23_02");	//Nein. Sie haben den Zugang zur Felsenfestung regelrecht abgeriegelt.
	AI_Output(self,hero,"PC_Psionic_KINGWHAT_23_03");	//Was immer Rhobar hier sucht, er glaubt es offensichtlich dort zu finden!
	AI_Output(hero,self,"PC_Psionic_KINGWHAT_15_04");	//Merkwürdig...
};


instance PC_PSIONIC_YOUHERE(C_Info)
{
	npc = PC_Psionic;
	nr = 8;
	condition = pc_psionic_youhere_condition;
	information = pc_psionic_youhere_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was tust du hier?";
};


func int pc_psionic_youhere_condition()
{
	return TRUE;
};

func void pc_psionic_youhere_info()
{
	AI_Output(hero,self,"PC_Psionic_YOUHERE_15_01");	//Was tust du hier?
	AI_Output(self,hero,"PC_Psionic_YOUHERE_23_02");	//Ich forsche nach dem alten Wissen der Feuermagier.
	AI_Output(self,hero,"PC_Psionic_YOUHERE_23_03");	//Sie haben zu Zeiten der Barriere schliesslich hier gelebt.
};


instance PC_PSIONIC_IREMEMBER(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_iremember_condition;
	information = pc_psionic_iremember_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie laufen deine Forschungen?";
};


func int pc_psionic_iremember_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_youhere))
	{
		return TRUE;
	};
};

func void pc_psionic_iremember_info()
{
	AI_Output(hero,self,"PC_Psionic_IREMEMBER_15_01");	//Wie laufen deine Forschungen?
	AI_Output(self,hero,"PC_Psionic_IREMEMBER_23_02");	//Der Zusammenbruch der magischen Barriere hat fast alle magischen Artefakte zerstört. Auch die Runen!
	AI_Output(self,hero,"PC_Psionic_IREMEMBER_23_03");	//Aber ich habe einen Weg gefunden, neue Runen herzustellen!
	AI_Output(self,hero,"PC_Psionic_IREMEMBER_23_04");	//Ich sammle das Wissen über die Zaubersprüche der Feuer- und Wassermagier und binde sie in neue Runensteine!
};


instance PC_PSIONIC_TRAINBASIC(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_trainbasic_condition;
	information = pc_psionic_trainbasic_info;
	important = FALSE;
	permanent = FALSE;
	description = "Erkläre mir die Gesetze der Magie ";
};


func int pc_psionic_trainbasic_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_iremember))
	{
		return TRUE;
	};
};

func void pc_psionic_trainbasic_info()
{
	AI_Output(hero,self,"PC_Psionic_TRAINBASIC_Info_15_01");	//Erkläre mir die Gesetze der Magie.
	AI_Output(self,hero,"PC_Psionic_TRAINBASIC_Info_23_02");	//Es ist so, wie du es von früher kennst! Du brauchst entweder eine Spruchrolle oder eine Rune!
	AI_Output(self,hero,"PC_Psionic_TRAINBASIC_Info_23_03");	//Die Benutzung von Spruchrollen und Runen kostet deine magische Kraft. Dein MANA. Die Lebensquelle deiner Sprüche!
	AI_Output(hero,self,"PC_Psionic_TRAINBASIC_Info_15_04");	//Und weiter?
	AI_Output(self,hero,"PC_Psionic_TRAINBASIC_Info_23_05");	//Spruchrollen kann jeder verwenden, der Mana besitzt. Allerding können sie nur einmal verwendet werden und lösen sich danach auf!
	AI_Output(self,hero,"PC_Psionic_TRAINBASIC_Info_23_06");	//Eine Rune dagegen kann man unendlich oft benutzen, allerdings musst du dafür die hohe Kunst der magischen Kreise erlernen!
	AI_Output(self,hero,"PC_Psionic_TRAINBASIC_Info_23_07");	//Das Benutzen von mächtigeren Runen erfordern das Wissen eines höheren Kreises der Magie!
};


instance PC_PSIONIC_MAKERUNES(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_makerunes_condition;
	information = pc_psionic_makerunes_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie stellst du die Runensteine her?";
};


func int pc_psionic_makerunes_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_iremember))
	{
		return TRUE;
	};
};

func void pc_psionic_makerunes_info()
{
	AI_Output(hero,self,"PC_Psionic_MAKERUNES_15_01");	//Wie stellst du die Runensteine her?
	AI_Output(self,hero,"PC_Psionic_MAKERUNES_23_02");	//Es hat mich viel Zeit gekostet. Ich habe Apparaturen nachgebaut, die ich in alten Büchern beschrieben fand!
};


instance PC_PSIONIC_SLEEPERMAGIC(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_sleepermagic_condition;
	information = pc_psionic_sleepermagic_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist aus der Magie des Schläfers geworden?";
};


func int pc_psionic_sleepermagic_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_iremember))
	{
		return TRUE;
	};
};

func void pc_psionic_sleepermagic_info()
{
	AI_Output(hero,self,"PC_Psionic_SLEEPERMAGIC_15_01");	//Was ist aus der Magie des Schläfers geworden?
	AI_Output(self,hero,"PC_Psionic_SLEEPERMAGIC_23_02");	//Diese Magie ist mit dem Schläfer zusammen verschwunden, doch ich bin sicher, seine Zauber können auch ohne seine dämonische Kraft funktionieren.
	AI_Output(self,hero,"PC_Psionic_SLEEPERMAGIC_23_03");	//Ich versuche zur Zeit eine Rune der Telekinese herzustellen, suche aber noch nach einer entsprechenden Spruchrolle.
};


instance PC_PSIONIC_TEACH(C_Info)
{
	npc = PC_Psionic;
	nr = 10;
	condition = pc_psionic_teach_condition;
	information = pc_psionic_teach_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich will meine alten Kräfte wiedergewinnen!";
};


func int pc_psionic_teach_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_trainbasic) && Npc_KnowsInfo(hero,pc_thief_needtraining))
	{
		return TRUE;
	};
};

func void pc_psionic_teach_info()
{
	AI_Output(hero,self,"PC_Psionic_TEACH_Info_15_01");	//Ich will meine alten Kräfte wiedergewinnen!
	AI_Output(hero,self,"PC_Psionic_TEACH_Info_15_02");	//Diego sagt, du könntest mir dabei helfen.
	AI_Output(self,hero,"PC_Psionic_TEACH_Info_23_03");	//Warum nicht, lass uns gleich beginnen.
	Info_ClearChoices(pc_psionic_teach);
	Info_AddChoice(pc_psionic_teach,DIALOG_BACK,pc_psionic_teach_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && Npc_KnowsInfo(hero,pc_psionic_foundhealscroll))
	{
		Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0),pc_psionic_teach_circle2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
	{
		Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0),pc_psionic_teach_circle1);
	};
	Info_AddChoice(pc_psionic_teach,"(Mana steigern)",pc_psionic_teach_man);
};

func void pc_psionic_teach_man()
{
	Info_ClearChoices(pc_psionic_teach);
	Info_AddChoice(pc_psionic_teach,DIALOG_BACK,pc_psionic_teach_back);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_5);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_1);
};

func void pc_psionic_teach_man_1()
{
	B_BuyAttributePoints(hero,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(pc_psionic_teach);
	Info_AddChoice(pc_psionic_teach,DIALOG_BACK,pc_psionic_teach_back);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_5);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_1);
};

func void pc_psionic_teach_man_5()
{
	B_BuyAttributePoints(hero,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(pc_psionic_teach);
	Info_AddChoice(pc_psionic_teach,DIALOG_BACK,pc_psionic_teach_back);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_5);
	Info_AddChoice(pc_psionic_teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),pc_psionic_teach_man_1);
};

func void pc_psionic_teach_back()
{
	Info_ClearChoices(pc_psionic_teach);
};

func void pc_psionic_teach_circle1()
{
	AI_Output(hero,self,"PC_Psionic_TEACH_CIRCLE1_15_01");	//Ich will den ersten Kreis der Magie erlernen.
	if(B_GiveSkill(hero,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_02");	//Es ist mir bereits gelungen, zwei Zauber aus diesem Kreise in Runen zu binden.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_03");	//Der Lichtzauber erhellt die Dunkelheit stockfinsterer Orte und ist zuverlässiger als jede Fackel.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_04");	//Der Feuerpfeil ist eine Angriffsrune die Ziele in Brand stecken kann.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_05");	//Leider sind das die einzigen Zauberformeln der Feuermagier, die ich bisher auftreiben konnte.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_06");	//Soviel ich weiss, gab es einen Zauberspruch der Wassermagier, der mit dem Feuerpfeil verwandt ist: Der Eispfeil.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE1_23_07");	//Leider habe ich nirgendwo eine Spruchrolle darüber auftreiben können.
	};
};

func void pc_psionic_teach_circle2()
{
	AI_Output(hero,self,"PC_Psionic_TEACH_CIRCLE2_15_01");	//Ich will den zweiten Kreis der Magie erlernen.
	if(B_GiveSkill(hero,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE2_23_02");	//Nun da wir mit dem Zauber HEILUNG eine Spruchrolle des zweiten Kreises in Händen halten, erklärt sich das magische Gefüge schon fast von selbst.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE2_23_03");	//Sprich diesen Zauber auf dich selbst, und deine Wunden werden sich wieder verschliessen. Je länger du diesen Zauber aufrechterhälst, desto grösser ist die Heilwirkung, die eintritt.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE2_23_04");	//Hast Du HEILUNG erst einmal verstanden, werden auch andere Zauberformeln des zweiten Kreises kein Hindernis mehr für dich darstellen.
	};
};

func void pc_psionic_teach_circle3()
{
	AI_Output(hero,self,"PC_Psionic_TEACH_CIRCLE3_15_01");	//Ich will den dritten Kreis der Magie erlernen.
	if(B_GiveSkill(hero,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_02");	//Mit dem dritten Kreis kannst du fünf weitere Zauber sprechen.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_03");	//Freundlich stimmen, Feuerball, Telekinese, Eisblock und Pyrokinese.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_04");	//Feuerball und Pyrokinese sind weitere machtvolle Angriffssprüche.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_05");	//Telekinese ermöglicht es dir kleine Gegenstände über Entfernung zu bewegen.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_06");	//Mit Eisblock kannst du einen Gegner einfrieren. Dadurch wird er bewegungsunfähig.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_07");	//Mit dem Zauber Freundlich stimmen, kannst du einen verägerten Feind wieder zur Ruhe bringen.
		AI_Output(self,hero,"PC_Psionic_TEACH_CIRCLE3_23_08");	//Auch Leute die im Begriff sind dich anzugreifen, werden davon ablassen. Versteht sich von selbst, das der Zauber nur auf Menschen wirkt.
	};
};


instance PC_PSIONIC_TEACHRUNEMAKING(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_teachrunemaking_condition;
	information = pc_psionic_teachrunemaking_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst du mir zeigen, wie man Runen herstellt?";
};


func int pc_psionic_teachrunemaking_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_makerunes) && !LESTER_LEARNRUNEMAKING)
	{
		return TRUE;
	};
};

func void pc_psionic_teachrunemaking_info()
{
	AI_Output(hero,self,"PC_Psionic_TEACHRUNEMAKING_15_01");	//Kannst du mir zeigen, wie man Runen herstellt?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0)
	{
		AI_Output(self,hero,"PC_Psionic_TEACHRUNEMAKING_23_02");	//Du musst zumindest das Wissen über den ersten Kreis der Magie haben, sonst kannst du mit den Runen nichts anfangen.
	}
	else
	{
		AI_Output(self,hero,"PC_Psionic_TEACHRUNEMAKING_23_03");	//Sehr gerne. Nun, da du den ersten Kreis der Magie beherrschst, sollte es nicht allzu schwer sein!
		LESTER_LEARNRUNEMAKING = TRUE;
	};
};


instance PC_PSIONIC_LEARNTHAUMATURGY1(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_learnthaumaturgy1_condition;
	information = pc_psionic_learnthaumaturgy1_info;
	important = FALSE;
	permanent = TRUE;
	description = B_BuildLearnString(NAME_LEARNTHAUMATURGY_1,LPCOST_TALENT_THAUMATURGY_1,0);
};


func int pc_psionic_learnthaumaturgy1_condition()
{
	if(LESTER_LEARNRUNEMAKING && (Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == 0))
	{
		return TRUE;
	};
};

func void pc_psionic_learnthaumaturgy1_info()
{
	if(B_GiveSkill(hero,NPC_TALENT_THAUMATURGY,1,LPCOST_TALENT_THAUMATURGY_1))
	{
		AI_Output(self,hero,"PC_Psionic_LEARNTHAUMATURGY1_23_01");	//Runen werden in zwei Stufen hergestellt.
		AI_Output(self,hero,"PC_Psionic_LEARNTHAUMATURGY1_23_02");	//Zuerst musst du am Runenschmelzer  -der kleine Ofen da hinten-  einen leeren Runenstein anfertigen.
		AI_Output(self,hero,"PC_Psionic_LEARNTHAUMATURGY1_23_03");	//In der zweiten Stufe, bindest du die magischen Kräfte einer Zauberspruchrolle in den vorbereiteten Runenstein und erhälst so eine fertige Zauberrune.
		Log_CreateTopic(CH1_LEARNRUNEMAKING,LOG_MISSION);
		Log_SetTopicStatus(CH1_LEARNRUNEMAKING,LOG_RUNNING);
		B_LogEntry(CH1_LEARNRUNEMAKING,"Lester will mir zeigen, wie man selbst Runen herstellt. Ausgangskomponenten sind ein leerer Runenstein, sowie eine Spruchrolle des Zaubers, der in die Rune gebunden werden soll.");
	};
};


instance PC_PSIONIC_RUNESTONE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_runestone_condition;
	information = pc_psionic_runestone_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie stelle ich einen solchen Runenstein her?";
};


func int pc_psionic_runestone_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == 1)
	{
		return TRUE;
	};
};

func void pc_psionic_runestone_info()
{
	AI_Output(hero,self,"PC_Psionic_RUNESTONE_15_01");	//Wie stelle ich einen solchen Runenstein her?
	AI_Output(self,hero,"PC_Psionic_RUNESTONE_23_02");	//Nehme das Erz und halte sie mit einer Schmiedezange in das Feuer. Das flüssige Erz läuft dann in die Form und schon hast du einen leeren Runenstein.
	B_LogEntry(CH1_LEARNRUNEMAKING,"Die Herstellung einer leeren Rune erfordert Erz, dass mit einer Schmiedezange in einen Runenschmelzer gehalten werden muss.");
};


instance PC_PSIONIC_ORE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_ore_condition;
	information = pc_psionic_ore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wie komme ich an Erz?";
};


func int pc_psionic_ore_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_runestone) && (Npc_HasItems(hero,itmi_orenugget) < AMNT_RUNE))
	{
		return TRUE;
	};
};

func void pc_psionic_ore_info()
{
	AI_Output(hero,self,"PC_Psionic_ORE_15_01");	//Wie komme ich an Erz?
	AI_Output(self,hero,"PC_Psionic_ORE_23_02");	//Ich habe es bei Bartok gekauft, gegenüber in der Burgschmiede.
	AI_Output(self,hero,"PC_Psionic_ORE_23_03");	//Doch nun hat auch ihn die Krankheit erwischt!
	if(Npc_KnowsInfo(hero,info_gotmar_othersmith) || Npc_KnowsInfo(hero,info_julius_smith))
	{
		AI_Output(hero,self,"PC_Psionic_ORE_15_04");	//Ich hörte bereits davon!
	};
	B_LogEntry(CH1_LEARNRUNEMAKING,"Lester hat sein Erz bei Bartok dem Burgschmied gekauft. Doch dieser ist einer seltsamen Krankheit verfallen und vegetiert jetzt im Krankenviertel vor sich hin.");
};


instance PC_PSIONIC_PLAGUE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_plague_condition;
	information = pc_psionic_plague_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was für eine Krankheit?";
};


func int pc_psionic_plague_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_ore) && !Npc_KnowsInfo(hero,info_gotmar_othersmith) && !Npc_KnowsInfo(hero,info_julius_smith))
	{
		return TRUE;
	};
};

func void pc_psionic_plague_info()
{
	AI_Output(hero,self,"PC_Psionic_PLAGUE_15_01");	//Was für eine Krankheit?
	AI_Output(self,hero,"PC_Psionic_PLAGUE_23_02");	//Die Opfer verwandeln sich in lebende Tote und reden nur noch wirres Zeug!
	AI_Output(self,hero,"PC_Psionic_PLAGUE_23_03");	//Zwischen dem Arbeiter- und dem Händlerviertel ist das Krankenviertel.
	AI_Output(self,hero,"PC_Psionic_PLAGUE_23_04");	//Bartok wurde auch dort hingebracht. Aber vielleicht findest du in seiner Schmiede noch Erz.
	B_LogEntry(CH1_LEARNRUNEMAKING,"In der verlassenen Burgschmiede kann ich wahrscheinlich etwas Erz finden.");
};


instance PC_PSIONIC_HAVEORE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_haveore_condition;
	information = pc_psionic_haveore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe genug Erz!";
};


func int pc_psionic_haveore_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_runestone) && (Npc_HasItems(hero,itmi_orenugget) >= AMNT_RUNE) && !Npc_KnowsInfo(hero,pc_psionic_maderunestone) && !Npc_HasItems(hero,itar_runeblank))
	{
		return TRUE;
	};
};

func void pc_psionic_haveore_info()
{
	AI_Output(hero,self,"PC_Psionic_HAVEORE_15_01");	//Ich habe genug Erz.
	if(Npc_HasItems(hero,itmi_pliers))
	{
		AI_Output(self,hero,"OUMULTI_HAVEALL_23_00");	//Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
	}
	else
	{
		AI_Output(self,hero,"PC_Psionic_HAVEORE_23_03");	//Dann brauchst du nur noch die Schmiedezange.
	};
	B_GiveXP(XP_LESTER_HAVEORE);
};


instance PC_PSIONIC_HAVEPLIERS(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_havepliers_condition;
	information = pc_psionic_havepliers_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe eine Schmiedezange!";
};


func int pc_psionic_havepliers_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_runestone) && Npc_HasItems(hero,itmi_pliers) && !Npc_KnowsInfo(hero,pc_psionic_maderunestone) && !Npc_HasItems(hero,itar_runeblank))
	{
		return TRUE;
	};
};

func void pc_psionic_havepliers_info()
{
	AI_Output(hero,self,"PC_Psionic_HAVEPLIERS_15_01");	//Ich habe eine Schmiedezange.
	if(Npc_HasItems(hero,itmi_orenugget) >= AMNT_RUNE)
	{
		AI_Output(self,hero,"OUMULTI_HAVEALL_23_02");	//Sehr gut, nun gehe zum Runenschmelzer und stelle eine leere Rune her.
	}
	else
	{
		AI_Output(self,hero,"PC_Psionic_HAVEPLIERS_23_03");	//Gut, nun brauchst du nur noch genügend Erz.
	};
};


instance PC_PSIONIC_MADERUNESTONE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_maderunestone_condition;
	information = pc_psionic_maderunestone_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hier ist mein erster leerer Runenstein!";
};


func int pc_psionic_maderunestone_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_runestone) && Npc_HasItems(hero,itar_runeblank))
	{
		return TRUE;
	};
};

func void pc_psionic_maderunestone_info()
{
	AI_Output(hero,self,"PC_Psionic_MADERUNESTONE_15_01");	//Hier ist mein erster leerer Runenstein.
	AI_Output(self,hero,"PC_Psionic_MADERUNESTONE_23_02");	//Du kannst immer wieder neue herstellen, wenn du genug Erz hast.
	if(Npc_HasItems(hero,itar_scrolllight) || Npc_HasItems(hero,itar_scrollfirebolt))
	{
		AI_Output(self,hero,"PC_Psionic_MADERUNESTONE_23_03");	//Jetzt fehlt dir nur noch eine Spruchrolle.
	}
	else
	{
		AI_Output(self,hero,"PC_Psionic_MADERUNESTONE_23_04");	//Jetzt kannst du deine erste Rune herstellen.
	};
	if(Npc_KnowsInfo(hero,pc_psionic_haveore))
	{
		B_GiveXP(XP_LESTER_MADERUNESTONE);
	}
	else
	{
		B_GiveXP(XP_LESTER_MADERUNESTONE + XP_LESTER_HAVEORE);
	};
};


instance PC_PSIONIC_SCROLL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_scroll_condition;
	information = pc_psionic_scroll_info;
	important = FALSE;
	permanent = FALSE;
	description = "Eine Spruchrolle?";
};


func int pc_psionic_scroll_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == 1) && !Npc_HasItems(hero,itar_scrolllight) && !Npc_HasItems(hero,itar_scrollfirebolt))
	{
		return TRUE;
	};
};

func void pc_psionic_scroll_info()
{
	AI_Output(hero,self,"PC_Psionic_SCROLL_15_01");	//Eine Spruchrolle?
	AI_Output(self,hero,"PC_Psionic_SCROLL_23_02");	//Such mal in den Bücherregalen und Kisten hier herum. Es müssten noch eine Spruchrollen der Feuermagier vorhanden sein.
	AI_Output(self,hero,"PC_Psionic_SCROLL_23_03");	//Leider habe ich bisher keine Spruchrollen der Wassermagier gefunden.
};


instance PC_PSIONIC_WHATWITHSTONE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_whatwithstone_condition;
	information = pc_psionic_whatwithstone_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was mache ich nun mit dem leeren Runenstein?";
};


func int pc_psionic_whatwithstone_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_maderunestone) && !Npc_HasItems(hero,itar_scrolllight) && !Npc_HasItems(hero,itar_scrollfirebolt) && !Npc_KnowsInfo(hero,pc_psionic_havescroll) && !Npc_KnowsInfo(hero,pc_psionic_maderune))
	{
		return TRUE;
	};
};

func void pc_psionic_whatwithstone_info()
{
	AI_Output(hero,self,"PC_Psionic_WHATWITHSTONE_15_01");	//Was mache ich nun mit dem leeren Runenstein?
	AI_Output(self,hero,"PC_Psionic_WHATWITHSTONE_23_02");	//Nun benötigst du eine Spruchrolle. Stöber etwas in den Regalen und Kisten Herum
	AI_Output(self,hero,"PC_Psionic_WHATWITHSTONE_23_03");	//Dort solltest du noch einige einfache Feuerzauber finden.
};


instance PC_PSIONIC_HAVESCROLL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_havescroll_condition;
	information = pc_psionic_havescroll_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe eine Spruchrolle!";
};


func int pc_psionic_havescroll_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_maderunestone) && (Npc_HasItems(hero,itar_scrolllight) || Npc_HasItems(hero,itar_scrollfirebolt)))
	{
		return TRUE;
	};
};

func void pc_psionic_havescroll_info()
{
	AI_Output(hero,self,"PC_Psionic_HAVESCROLL_15_01");	//Ich habe eine Spruchrolle!
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_02");	//Sehr gut, dann kannst du dich jetzt am Runenkreisel versuchen. Er steht oben in der alten Kanzel.
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_03");	//Nimm den leeren Runenstein, lies den Zauber auf der Spruchrolle und fokussiere deine Gedanken dabei auf den Stein im Runenkreisel.
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_04");	//Ein Teil deiner eigenen Mana wird den Zauber in den Runenstein binden.
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_05");	//Allerdings gibt es da einen Effekt den du kennen solltest!
	AI_Output(hero,self,"PC_Psionic_HAVESCROLL_15_06");	//Welchen?
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_07");	//(rezitiert) Um dauerhaftes zu schaffen, muss dauerhaftes gegeben werden!
	AI_Output(hero,self,"PC_Psionic_HAVESCROLL_15_08");	//Was bedeutet das?
	AI_Output(self,hero,"PC_Psionic_HAVESCROLL_23_09");	//Das bedeutet, dass deine Mana, die du in den Runenstein fliessen lässt DAUERHAFT verloren ist!
	AI_Output(hero,self,"PC_Psionic_HAVESCROLL_15_10");	//Ich... verstehe!
	B_GiveXP(XP_LESTER_HAVESCROLL);
	B_LogEntry(CH1_LEARNRUNEMAKING,"Der zweite Schritt in der Runenerschaffung findet am Runenkreisel statt. Der Zauber einer Spruchrolle wird in einen leeren Runenstein gebrannt. Dieser Vorgang kostet mich dauerhafte Mana!");
};


instance PC_PSIONIC_MADERUNE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_maderune_condition;
	information = pc_psionic_maderune_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hier ist meine erste Rune!";
};


func int pc_psionic_maderune_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_maderunestone) && (Npc_HasItems(hero,itar_runelight) || Npc_HasItems(hero,itar_runefirebolt)))
	{
		return TRUE;
	};
};

func void pc_psionic_maderune_info()
{
	AI_Output(hero,self,"PC_Psionic_MADERUNE_15_01");	//Hier ist meine erste Rune!
	AI_Output(self,hero,"PC_Psionic_MADERUNE_23_02");	//Gute Arbeit.
	AI_Output(self,hero,"PC_Psionic_MADERUNE_23_03");	//Mehr weiss ich selbst auch nicht über das Herstellen von Runen. Ich bin immer noch am experimentieren.
	if(Npc_KnowsInfo(hero,pc_psionic_havescroll))
	{
		B_GiveXP(XP_LESTER_MADERUNE);
	}
	else
	{
		B_GiveXP(XP_LESTER_MADERUNE + XP_LESTER_HAVESCROLL);
	};
	B_LogEntry(CH1_LEARNRUNEMAKING,"Ich habe soeben meine erste Rune erschaffen! ");
};


instance PC_PSIONIC_TOGETHER(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_together_condition;
	information = pc_psionic_together_info;
	important = FALSE;
	permanent = FALSE;
	description = "Lass uns die Herstellung der weiteren Runen gemeinsam angehen";
};


func int pc_psionic_together_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_maderune))
	{
		return TRUE;
	};
};

func void pc_psionic_together_info()
{
	AI_Output(hero,self,"PC_Psionic_TOGETHER_15_01");	//Lass uns die Herstellung der weiteren Runen gemeinsam angehen.
	AI_Output(self,hero,"PC_Psionic_TOGETHER_23_02");	//Gut, zusammen werden wir schneller und besser vorankommen.
};


instance PC_PSIONIC_WHATNEXT(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_whatnext_condition;
	information = pc_psionic_whatnext_info;
	important = FALSE;
	permanent = FALSE;
	description = "Du erwähntest vorhin den Zauber EISPFEIL";
};


func int pc_psionic_whatnext_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_together))
	{
		return TRUE;
	};
};

func void pc_psionic_whatnext_info()
{
	AI_Output(hero,self,"PC_Psionic_WHATNEXT_15_01");	//Du erwähntest vorhin den Zauber EISPFEIL
	AI_Output(self,hero,"PC_Psionic_WHATNEXT_23_02");	//Richtig.
	AI_Output(hero,self,"PC_Psionic_WHATNEXT_15_03");	//Ich werde eine Spruchrolle dieses Zaubers auftreiben, dann binden wir ihn in eine Rune.
	AI_Output(self,hero,"PC_Psionic_WHATNEXT_23_04");	//Ein guter Anfang für eine Suche, wäre es, nach dem Verbleib der Wassermagier zu forschen.
	AI_Output(self,hero,"PC_Psionic_WHATNEXT_23_05");	//Vielleicht weiss Horatio, was aus ihnen geworden ist.
	AI_Output(self,hero,"PC_Psionic_WHATNEXT_23_06");	//Er ist der einzige hier im Lager, der zur Zeit der Barriere im Lager der Wassermagier wohnte.
	B_LogEntry(CH1_LEARNRUNEMAKING,"Lester und ich haben beschlossen, den einfachsten Zauber der Wassermagie in eine Rune zu bannen.");
};


instance PC_PSIONIC_HORATIO(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_horatio_condition;
	information = pc_psionic_horatio_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo finde ich diesen Horatio?";
};


func int pc_psionic_horatio_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_whatnext))
	{
		return TRUE;
	};
};

func void pc_psionic_horatio_info()
{
	AI_Output(hero,self,"PC_Psionic_HORATIO_15_01");	//Wo finde ich diesen Horatio?
	AI_Output(self,hero,"PC_Psionic_HORATIO_23_02");	//Er ist einer der Steinklopfer im Arbeiterviertel.
	B_LogEntry(CH1_LEARNRUNEMAKING,"Horatio könnte womöglich etwas über den Verbleib der Wassermagier wissen. Er klopft Steine im Arbeiterviertel.");
};


instance PC_PSIONIC_FOUNDTHUNDERBOLTSCROLL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_foundthunderboltscroll_condition;
	information = pc_psionic_foundthunderboltscroll_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe eine Spruchrolle EISPFEIL gefunden";
};


func int pc_psionic_foundthunderboltscroll_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_whatnext) && Npc_HasItems(hero,itar_scrollthunderbolt) && !LESTER_GOTTHUNDERBOLT)
	{
		return TRUE;
	};
};

func void pc_psionic_foundthunderboltscroll_info()
{
	AI_Output(hero,self,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_15_01");	//Ich habe eine Spruchrolle EISPFEIL gefunden.
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_02");	//Sehr gut. Dann sollten wir gleich loslegen eine Rune daraus zu machen.
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_23_03");	//Gibst du mir eine deiner EISPFEIL-Spruchrollen?
	Info_ClearChoices(pc_psionic_foundthunderboltscroll);
	Info_AddChoice(pc_psionic_foundthunderboltscroll,"Vielleicht später...",pc_psionic_foundthunderboltscroll_no);
	Info_AddChoice(pc_psionic_foundthunderboltscroll,"Hier nimm!",pc_psionic_foundthunderboltscroll_yes);
};

func void pc_psionic_foundthunderboltscroll_yes()
{
	Info_ClearChoices(pc_psionic_foundthunderboltscroll);
	AI_Output(hero,self,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_15_01");	//Hier nimm!
	B_GiveInvItems(hero,self,itar_scrollthunderbolt,1);
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_YES_23_02");	//Danke. Jetzt kann jeder seine eigene EISPFEIL-Rune herstellen.
	B_GiveXP(XP_LESTER_FOUNDTHUNDERBOLT);
	LESTER_GOTTHUNDERBOLT = TRUE;
};

func void pc_psionic_foundthunderboltscroll_no()
{
	Info_ClearChoices(pc_psionic_foundthunderboltscroll);
	AI_Output(hero,self,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_15_01");	//Vielleicht später...
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBOLTSCROLL_NO_23_02");	//Wie du meinst.
	AI_StopProcessInfos(self);
};


instance PC_PSIONIC_FOUNDHEALSCROLL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_foundhealscroll_condition;
	information = pc_psionic_foundhealscroll_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe eine Spruchrolle HEILUNG gefunden!";
};


func int pc_psionic_foundhealscroll_condition()
{
	if(LESTER_GOTTHUNDERBOLT && Npc_HasItems(hero,itar_scrollheal))
	{
		return TRUE;
	};
};

func void pc_psionic_foundhealscroll_info()
{
	AI_Output(hero,self,"PC_Psionic_FOUNDHEALSCROLL_15_01");	//Ich habe eine Spruchrolle HEILUNG gefunden!
	AI_Output(self,hero,"PC_Psionic_FOUNDHEALSCROLL_23_02");	//Sehr interessant, zeig mal her!
	B_UseFakeScroll();
	AI_Output(self,hero,"PC_Psionic_FOUNDHEALSCROLL_23_03");	//Dieser Zauber scheint komplexer als EISPFEIL zu sein! Um ihn in eine Rune binden zu können, musst du erst den zweiten Kreis der Magie erlernen!
	B_GiveXP(XP_LESTER_FOUNDHEAL);
	B_LogEntry(CH1_LEARNRUNEMAKING,"Um die Spruchrolle HEILUNG in eine Rune binden zu können, muss ich den zweiten Kreis der Magie erlernen!");
};


instance PC_PSIONIC_FOUNDTHUNDERBALLSCROLL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_foundthunderballscroll_condition;
	information = pc_psionic_foundthunderballscroll_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe eine Spruchrolle KUGELBLITZ gefunden!";
};


func int pc_psionic_foundthunderballscroll_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_foundhealscroll) && Npc_HasItems(hero,itar_scrollthunderball))
	{
		return TRUE;
	};
};

func void pc_psionic_foundthunderballscroll_info()
{
	AI_Output(hero,self,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_15_01");	//Ich habe eine Spruchrolle KUGELBLITZ gefunden!
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_02");	//Zeig mal her...
	B_GiveInvItems(hero,self,itar_scrollthunderball,1);
	B_UseFakeScroll();
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_03");	//Aha! Verstehe!
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_04");	//Jetzt wird es wirklich heftig! Dies ist ein Wasserzauber aus dem Dritten Kreis.
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_05");	//Solch komplexe Zauber in eine Rune binden zu können erfordert nicht nur das Wissen über den Dritten Kreis sondern auch die Beherrschung der Runenerschaffung auf einer höheren Ebene.
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_06");	//Ich werde in den Büchern über das Schmieden von Runen nachlesen.
	AI_Output(self,hero,"PC_Psionic_FOUNDTHUNDERBALLSCROLL_23_07");	//Besuche mich morgen wieder, bis dahin werde ich hoffentlich wissen, wie wir das anstellen müssen.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"study");
	LESTER_LASTDAY = b_getday();
};


instance PC_PSIONIC_THUNDERBALL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_thunderball_condition;
	information = pc_psionic_thunderball_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hast du über den Zauber KUGELBLITZ etwas herausgefunden?";
};


func int pc_psionic_thunderball_condition()
{
	if(Npc_KnowsInfo(hero,pc_psionic_foundthunderballscroll) && !LESTER_KNOWBLOODORE)
	{
		return TRUE;
	};
};

func void pc_psionic_thunderball_info()
{
	AI_Output(hero,self,"PC_Psionic_THUNDERBALL_15_01");	//Hast du über den Zauber KUGELBLITZ etwas herausgefunden?
	if(Npc_HasItems(self,itar_scrollthunderball))
	{
		if(b_getday() <= LESTER_LASTDAY)
		{
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_02");	//Gib mir Zeit bis morgen, dann weiss ich vielleicht mehr!
		}
		else
		{
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_03");	//Ja, allerdings. Ich bin in einem Buch mit dem Titel THAUMATURGIE für Fortgeschrittene fündig geworden.
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_04");	//Der Prozess für Runen ab dem dritten magischen Kreis ist im Grunde der selbe, allerdings ändern sich die benötigten Materialien.
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_05");	//Leere Runensteine müssen das grössere Potential des Zaubers aufnehmen können und dafür genügt kein normales Erz mehr.
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_06");	//Das Buch spricht von sogenanntem Bluterz.
			AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_07");	//Ich fürchte wir brauchen etwas davon.
			LESTER_KNOWBLOODORE = TRUE;
			Npc_ExchangeRoutine(self,"start");
		};
	}
	else
	{
		AI_Output(self,hero,"PC_Psionic_THUNDERBALL_23_08");	//Irgendwie ist mir die Spruchrolle abhanden gekommen! Seltsam!
		LESTER_LOSTTHUNDERBALL = TRUE;
	};
};


instance PC_PSIONIC_ANOTHERTHUNDERBALL(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_anotherthunderball_condition;
	information = pc_psionic_anotherthunderball_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!";
};


func int pc_psionic_anotherthunderball_condition()
{
	if(LESTER_LOSTTHUNDERBALL && !LESTER_KNOWBLOODORE && Npc_HasItems(hero,itar_scrollthunderball))
	{
		return TRUE;
	};
};

func void pc_psionic_anotherthunderball_info()
{
	AI_Output(hero,self,"PC_Psionic_ANOTHERTHUNDERBALL_15_01");	//Ich habe hier noch eine Spruchrolle KUGELBLITZ für dich!
	B_GiveInvItems(hero,self,itar_scrollthunderball,1);
	AI_Output(self,hero,"PC_Psionic_ANOTHERTHUNDERBALL_23_02");	//Ah, sehr gut.
};


instance PC_PSIONIC_FINDBLOODORE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_findbloodore_condition;
	information = pc_psionic_findbloodore_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wo kann ich solches Bluterz finden?";
};


func int pc_psionic_findbloodore_condition()
{
	if(LESTER_KNOWBLOODORE)
	{
		return TRUE;
	};
};

func void pc_psionic_findbloodore_info()
{
	AI_Output(hero,self,"PC_Psionic_FINDBLOODORE_15_01");	//Wo kann ich solches Bluterz finden?
	AI_Output(self,hero,"PC_Psionic_FINDBLOODORE_23_02");	//Da habe ich nicht die geringste Ahnung.
	AI_Output(self,hero,"PC_Psionic_FINDBLOODORE_23_03");	//Waffenschmiede und Minenarbeiter haben normalerweise mit Erz zu tun.
	AI_Output(self,hero,"PC_Psionic_FINDBLOODORE_23_04");	//Vielleicht kommst du auf diesem Weg weiter.
	Npc_ExchangeRoutine(self,"start");
	B_LogEntry(CH1_LEARNRUNEMAKING,"Um Zauber des dritten Kreises in Runen zu binden wird ein besonderes Erz, sogenanntes BLUTERZ benötigt.");
	Log_CreateTopic(CH1_BLOODORE,LOG_MISSION);
	Log_SetTopicStatus(CH1_BLOODORE,LOG_RUNNING);
	B_LogEntry(CH1_BLOODORE,"Waffenschmiede und Minenarbeiter haben normalerweise mit Erz zu tun, vielleicht können mir diese Leute etwas über das sogenannte BLUTERZ erzählen.");
};


instance PC_PSIONIC_SEARCHRECIPE(C_Info)
{
	npc = PC_Psionic;
	condition = pc_psionic_searchrecipe_condition;
	information = pc_psionic_searchrecipe_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich suche nach einer Rezeptur...";
};


func int pc_psionic_searchrecipe_condition()
{
	if(Npc_KnowsInfo(hero,hlr_501_talamon_recipeformoney) && !Npc_KnowsInfo(hero,hlr_501_talamon_hasrecipe))
	{
		return TRUE;
	};
};

func void pc_psionic_searchrecipe_info()
{
	AI_Output(hero,self,"PC_Psionic_SEARCHRECIPE_15_01");	//Ich suche nach einer Rezeptur für ein Mittel gegen Wahnsinn.
	AI_Output(hero,self,"PC_Psionic_SEARCHRECIPE_15_02");	//Die Feuermagier sollen eine solche Rezeptur erforscht haben, aber ich kann hier im Magierhaus nichts finden!
	AI_Output(self,hero,"PC_Psionic_SEARCHRECIPE_23_03");	//Hmmm... ich kann mich dunkel an eine solche Rezeptur erinnern.
	AI_Output(self,hero,"PC_Psionic_SEARCHRECIPE_23_04");	//Aber ich habe sie nicht mehr.
	AI_Output(hero,self,"PC_Psionic_SEARCHRECIPE_15_05");	//Wer hat sie denn?
	AI_Output(self,hero,"PC_Psionic_SEARCHRECIPE_23_06");	//Ich habe alle Schriftstücke, die ich nicht brauchte an Agon den Händler verkauft, vielleicht hat er sie ja noch.
	if(!Npc_KnowsInfo(hero,wrk_225_agon_welcome))
	{
		AI_Output(hero,self,"PC_Psionic_SEARCHRECIPE_15_07");	//Wo finde ich diesen Agon?
		AI_Output(self,hero,"PC_Psionic_SEARCHRECIPE_23_08");	//Er hat einen Stand im Händlerviertel. Im Aussenring. Aber sei vorsichtig, er ist ein ziemlich übler Kerl.
	};
	B_LogEntry(CH1_LEARNALCHEMY,"Ich komme auf der Suche nach der Rezeptur für Talamon langsam weiter. Lester hat sie an Agon im Händlerviertel verkauft.");
};

