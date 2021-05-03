
instance CH(Npc_Default)
{
	name[0] = "CharacterHelper";
	npcType = npctype_main;
	guild = GIL_None;
	level = 10;
	voice = 15;
	id = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	start_aistate = ZS_CH_Hangaround;
};


func void ZS_CH_Hangaround()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CH_Hangaround");
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
};

func void ZS_CH_Hangaround_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_CH_Hangaround_Loop");
};

func void ZS_CH_Hangaround_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_CH_Hangaround_End");
};

func void B_SetHeroExp()
{
	var string Attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = (hero.level * LP_PER_LEVEL) + HERO_START_LP;
	Attributes = "Level Up: Lernpunkte:";
	Attributes = ConcatStrings(Attributes,IntToString(hero.lp));
	Attributes = ConcatStrings(Attributes,"Hitpoints:");
	Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(Attributes,-1,-1,FONT_OLD_BIG,3);
	Snd_Play("LEVELUP");
};

func void B_SetHeroEquipment()
{
	PrintDebugNpc(PD_ZS_Check,"B_SetHeroEquipment");
	CreateInvItems(hero,itam_arrow,100);
	CreateInvItems(hero,itam_bolt,100);
	CreateInvItems(hero,itmi_silver,500);
	CreateInvItems(hero,ItLsTorch,30);
	CreateInvItems(hero,ItFo_Potion_Health_03,10);
	CreateInvItems(hero,ItFo_Potion_Mana_03,10);
	CreateInvItems(hero,itke_lockpick,30);
	CreateInvItems(hero,itwr_worldmap,1);
};

func void B_SetHeroAttributes(var int selection,var int increase,var int LP_Cost)
{
	var string Attributes;
	if(hero.lp >= LP_Cost)
	{
		hero.lp = hero.lp - LP_Cost;
		Npc_ChangeAttribute(hero,selection,increase);
		Attributes = "Lernpunkte:";
		Attributes = ConcatStrings(Attributes,IntToString(hero.lp));
		Attributes = ConcatStrings(Attributes,"Str:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_STRENGTH]));
		Attributes = ConcatStrings(Attributes,"Dex:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_DEXTERITY]));
		Attributes = ConcatStrings(Attributes,"Mana:");
		Attributes = ConcatStrings(Attributes,IntToString(hero.attribute[ATR_MANA_MAX]));
		PrintScreen(Attributes,-1,-1,FONT_OLD_BIG,3);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,FONT_OLD_BIG,2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void B_SetHeroWeapon()
{
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
	B_SetHeroEquipment();
};


instance CH_Exit(C_Info)
{
	npc = ch;
	nr = 999;
	condition = CH_Exit_Condition;
	information = CH_Exit_Info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int CH_Exit_Condition()
{
	return 1;
};

func void CH_Exit_Info()
{
	AI_StopProcessInfos(self);
};

func void CH_Level_BACK()
{
	Info_ClearChoices(CH_Level);
};


instance CH_Level(C_Info)
{
	npc = ch;
	condition = CH_Level_Condition;
	information = CH_Level_Info;
	important = 0;
	permanent = 1;
	description = "Gib mir Level!";
};


func int CH_Level_Condition()
{
	if(hero.level == 0)
	{
		return TRUE;
	};
};

func void CH_Level_Info()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level  1 -  5",CH_Level1);
	Info_AddChoice(CH_Level,"Level  6 - 10",CH_Level6);
	Info_AddChoice(CH_Level,"Level 11 - 15",CH_Level11);
	Info_AddChoice(CH_Level,"Level 16 - 20",CH_Level16);
	Info_AddChoice(CH_Level,"Level 21 - 25",CH_Level21);
	Info_AddChoice(CH_Level,"Level 26 - 30",CH_Level26);
};

func void CH_Level26()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 26",CH_Level_26);
	Info_AddChoice(CH_Level,"Level 27",CH_Level_27);
	Info_AddChoice(CH_Level,"Level 28",CH_Level_28);
	Info_AddChoice(CH_Level,"Level 29",CH_Level_29);
	Info_AddChoice(CH_Level,"Level 30",CH_Level_30);
};

func void CH_Level21()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 21",CH_Level_21);
	Info_AddChoice(CH_Level,"Level 22",CH_Level_22);
	Info_AddChoice(CH_Level,"Level 23",CH_Level_23);
	Info_AddChoice(CH_Level,"Level 24",CH_Level_24);
	Info_AddChoice(CH_Level,"Level 25",CH_Level_25);
};

func void CH_Level16()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 16",CH_Level_16);
	Info_AddChoice(CH_Level,"Level 17",CH_Level_17);
	Info_AddChoice(CH_Level,"Level 18",CH_Level_18);
	Info_AddChoice(CH_Level,"Level 19",CH_Level_19);
	Info_AddChoice(CH_Level,"Level 20",CH_Level_20);
};

func void CH_Level11()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 11",CH_Level_11);
	Info_AddChoice(CH_Level,"Level 12",CH_Level_12);
	Info_AddChoice(CH_Level,"Level 13",CH_Level_13);
	Info_AddChoice(CH_Level,"Level 14",CH_Level_14);
	Info_AddChoice(CH_Level,"Level 15",CH_Level_15);
};

func void CH_Level6()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level  6",CH_Level_6);
	Info_AddChoice(CH_Level,"Level  7",CH_Level_7);
	Info_AddChoice(CH_Level,"Level  8",CH_Level_8);
	Info_AddChoice(CH_Level,"Level  9",CH_Level_9);
	Info_AddChoice(CH_Level,"Level 10",CH_Level_10);
};

func void CH_Level1()
{
	Info_ClearChoices(CH_Level);
	Info_AddChoice(CH_Level,"BACK",CH_Level_BACK);
	Info_AddChoice(CH_Level,"Level 1",CH_Level_1);
	Info_AddChoice(CH_Level,"Level 2",CH_Level_2);
	Info_AddChoice(CH_Level,"Level 3",CH_Level_3);
	Info_AddChoice(CH_Level,"Level 4",CH_Level_4);
	Info_AddChoice(CH_Level,"Level 5",CH_Level_5);
};

func void CH_Level_1()
{
	Info_ClearChoices(CH_Level);
	hero.level = 1;
	hero.attribute[ATR_HITPOINTS_MAX] = 52;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_2()
{
	Info_ClearChoices(CH_Level);
	hero.level = 2;
	hero.attribute[ATR_HITPOINTS_MAX] = 64;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_3()
{
	Info_ClearChoices(CH_Level);
	hero.level = 3;
	hero.attribute[ATR_HITPOINTS_MAX] = 76;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_4()
{
	Info_ClearChoices(CH_Level);
	hero.level = 4;
	hero.attribute[ATR_HITPOINTS_MAX] = 88;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_5()
{
	Info_ClearChoices(CH_Level);
	hero.level = 5;
	hero.attribute[ATR_HITPOINTS_MAX] = 100;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_6()
{
	Info_ClearChoices(CH_Level);
	hero.level = 6;
	hero.attribute[ATR_HITPOINTS_MAX] = 112;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_7()
{
	Info_ClearChoices(CH_Level);
	hero.level = 7;
	hero.attribute[ATR_HITPOINTS_MAX] = 124;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_8()
{
	Info_ClearChoices(CH_Level);
	hero.level = 8;
	hero.attribute[ATR_HITPOINTS_MAX] = 136;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_9()
{
	Info_ClearChoices(CH_Level);
	hero.level = 9;
	hero.attribute[ATR_HITPOINTS_MAX] = 148;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_10()
{
	Info_ClearChoices(CH_Level);
	hero.level = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 160;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_11()
{
	Info_ClearChoices(CH_Level);
	hero.level = 11;
	hero.attribute[ATR_HITPOINTS_MAX] = 172;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_12()
{
	Info_ClearChoices(CH_Level);
	hero.level = 12;
	hero.attribute[ATR_HITPOINTS_MAX] = 184;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_13()
{
	Info_ClearChoices(CH_Level);
	hero.level = 13;
	hero.attribute[ATR_HITPOINTS_MAX] = 196;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_14()
{
	Info_ClearChoices(CH_Level);
	hero.level = 14;
	hero.attribute[ATR_HITPOINTS_MAX] = 208;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_15()
{
	Info_ClearChoices(CH_Level);
	hero.level = 15;
	hero.attribute[ATR_HITPOINTS_MAX] = 220;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_16()
{
	Info_ClearChoices(CH_Level);
	hero.level = 16;
	hero.attribute[ATR_HITPOINTS_MAX] = 232;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_17()
{
	Info_ClearChoices(CH_Level);
	hero.level = 17;
	hero.attribute[ATR_HITPOINTS_MAX] = 244;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_18()
{
	Info_ClearChoices(CH_Level);
	hero.level = 18;
	hero.attribute[ATR_HITPOINTS_MAX] = 256;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_19()
{
	Info_ClearChoices(CH_Level);
	hero.level = 19;
	hero.attribute[ATR_HITPOINTS_MAX] = 268;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_20()
{
	Info_ClearChoices(CH_Level);
	hero.level = 20;
	hero.attribute[ATR_HITPOINTS_MAX] = 280;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_21()
{
	Info_ClearChoices(CH_Level);
	hero.level = 21;
	hero.attribute[ATR_HITPOINTS_MAX] = 292;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_22()
{
	Info_ClearChoices(CH_Level);
	hero.level = 22;
	hero.attribute[ATR_HITPOINTS_MAX] = 304;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_23()
{
	Info_ClearChoices(CH_Level);
	hero.level = 23;
	hero.attribute[ATR_HITPOINTS_MAX] = 316;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_24()
{
	Info_ClearChoices(CH_Level);
	hero.level = 24;
	hero.attribute[ATR_HITPOINTS_MAX] = 328;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_25()
{
	Info_ClearChoices(CH_Level);
	hero.level = 25;
	hero.attribute[ATR_HITPOINTS_MAX] = 340;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_26()
{
	Info_ClearChoices(CH_Level);
	hero.level = 26;
	hero.attribute[ATR_HITPOINTS_MAX] = 352;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_27()
{
	Info_ClearChoices(CH_Level);
	hero.level = 27;
	hero.attribute[ATR_HITPOINTS_MAX] = 364;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_28()
{
	Info_ClearChoices(CH_Level);
	hero.level = 28;
	hero.attribute[ATR_HITPOINTS_MAX] = 376;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_29()
{
	Info_ClearChoices(CH_Level);
	hero.level = 29;
	hero.attribute[ATR_HITPOINTS_MAX] = 388;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};

func void CH_Level_30()
{
	Info_ClearChoices(CH_Level);
	hero.level = 30;
	hero.attribute[ATR_HITPOINTS_MAX] = 400;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	B_SetHeroExp();
	B_SetHeroWeapon();
};


instance CH_Training_STR(C_Info)
{
	npc = ch;
	condition = CH_Training_STR_Condition;
	information = CH_Training_STR_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: Stärke";
};


func int CH_Training_STR_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_STR_Info()
{
	Info_ClearChoices(CH_Training_STR);
	Info_AddChoice(CH_Training_STR,"ZURÜCK",CH_Training_STR_BACK);
	Info_AddChoice(CH_Training_STR,"Stärke (alle restlichen Lernpunkte)",CH_Strength_all);
	Info_AddChoice(CH_Training_STR,"Stärke (für beste Nahkampfwaffe)",CH_Strength_Weapon);
	if(hero.lp >= (20 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_20,20 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength20);
	};
	if(hero.lp >= (10 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_10,10 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength10);
	};
	if(hero.lp >= (5 * LPCOST_ATTRIBUTE_STRENGTH))
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength5);
	};
	if(hero.lp >= LPCOST_ATTRIBUTE_STRENGTH)
	{
		Info_AddChoice(CH_Training_STR,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),CH_Strength1);
	};
};

func void CH_Strength1()
{
	B_SetHeroAttributes(ATR_STRENGTH,1,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength5()
{
	B_SetHeroAttributes(ATR_STRENGTH,5,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength10()
{
	B_SetHeroAttributes(ATR_STRENGTH,10,10 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength20()
{
	B_SetHeroAttributes(ATR_STRENGTH,20,20 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Strength_Weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(CH_Training_STR);
	if(hero.level <= 5)
	{
		value = 11;
	}
	else if(hero.level <= 9)
	{
		value = 17;
	}
	else if(hero.level <= 15)
	{
		value = 26;
	}
	else if(hero.level <= 20)
	{
		value = 52;
	}
	else if(hero.level <= 25)
	{
		value = 62;
	}
	else if(hero.level <= 30)
	{
		value = 78;
	};
	if(hero.attribute[ATR_STRENGTH] < value)
	{
		increase = value - hero.attribute[ATR_STRENGTH];
		B_SetHeroAttributes(ATR_STRENGTH,increase,increase * LPCOST_ATTRIBUTE_STRENGTH);
		AI_EquipBestMeleeWeapon(hero);
	}
	else
	{
		PrintScreen("nötige STR bereits vorhanden",-1,-1,FONT_OLD_BIG,10);
	};
};

func void CH_Strength_all()
{
	B_SetHeroAttributes(ATR_STRENGTH,hero.lp,hero.lp * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(CH_Training_STR);
};

func void CH_Training_STR_BACK()
{
	Info_ClearChoices(CH_Training_STR);
};


instance CH_Training_DEX(C_Info)
{
	npc = ch;
	condition = CH_Training_DEX_Condition;
	information = CH_Training_DEX_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: Geschick";
};


func int CH_Training_DEX_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_DEX_Info()
{
	Info_ClearChoices(CH_Training_DEX);
	Info_AddChoice(CH_Training_DEX,"ZURÜCK",CH_Training_DEX_BACK);
	Info_AddChoice(CH_Training_DEX,"Geschick (alle restlichen Lernpunkte)",CH_Dexterity_all);
	Info_AddChoice(CH_Training_DEX,"Geschick (für beste Fernkampfwaffe)",CH_Dexterity_Weapon);
	if(hero.lp >= 20)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_20,20 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_10,10 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(CH_Training_DEX,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),CH_Dexterity1);
	};
};

func void CH_Dexterity1()
{
	B_SetHeroAttributes(ATR_DEXTERITY,1,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity5()
{
	B_SetHeroAttributes(ATR_DEXTERITY,5,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity10()
{
	B_SetHeroAttributes(ATR_DEXTERITY,10,10 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity20()
{
	B_SetHeroAttributes(ATR_DEXTERITY,20,20 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Dexterity_Weapon()
{
	var int value;
	var int increase;
	Info_ClearChoices(CH_Training_DEX);
	if(hero.level <= 5)
	{
		value = 16;
	}
	else if(hero.level <= 9)
	{
		value = 22;
	}
	else if(hero.level <= 15)
	{
		value = 28;
	}
	else if(hero.level <= 20)
	{
		value = 34;
	}
	else if(hero.level <= 25)
	{
		value = 40;
	}
	else if(hero.level <= 30)
	{
		value = 50;
	};
	if(hero.attribute[ATR_DEXTERITY] < value)
	{
		increase = value - hero.attribute[ATR_DEXTERITY];
		B_SetHeroAttributes(ATR_DEXTERITY,increase,increase * LPCOST_ATTRIBUTE_DEXTERITY);
		AI_EquipBestRangedWeapon(hero);
	}
	else
	{
		PrintScreen("nötige DEX bereits vorhanden",-1,-1,FONT_OLD_BIG,10);
	};
};

func void CH_Dexterity_all()
{
	B_SetHeroAttributes(ATR_DEXTERITY,hero.lp,hero.lp * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(CH_Training_DEX);
};

func void CH_Training_DEX_BACK()
{
	Info_ClearChoices(CH_Training_DEX);
};


instance CH_Training_Mana(C_Info)
{
	npc = ch;
	condition = CH_Training_Mana_Condition;
	information = CH_Training_Mana_Info;
	important = 0;
	permanent = 1;
	description = "ATTRIBUTE: Mana";
};


func int CH_Training_Mana_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Mana_Info()
{
	Info_ClearChoices(CH_Training_Mana);
	Info_AddChoice(CH_Training_Mana,"BACK",CH_Training_Mana_BACK);
	Info_AddChoice(CH_Training_Mana,"Mana (restliche Lernpunkte)",CH_Mana_all);
	if(hero.lp >= 20)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_20,20 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana20);
	};
	if(hero.lp >= 10)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_10,10 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana10);
	};
	if(hero.lp >= 5)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),CH_Mana5);
	};
	if(hero.lp >= 1)
	{
		Info_AddChoice(CH_Training_Mana,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),CH_Mana1);
	};
};

func void CH_Mana1()
{
	B_SetHeroAttributes(ATR_MANA_MAX,1,LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,1,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana5()
{
	B_SetHeroAttributes(ATR_MANA_MAX,5,5 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,5,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana10()
{
	B_SetHeroAttributes(ATR_MANA_MAX,10,10 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,10,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana20()
{
	B_SetHeroAttributes(ATR_MANA_MAX,20,20 * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,20,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Mana_all()
{
	var int lp;
	lp = hero.lp;
	B_SetHeroAttributes(ATR_MANA_MAX,hero.lp,hero.lp * LPCOST_ATTRIBUTE_MANA);
	B_SetHeroAttributes(ATR_MANA,lp,0);
	Info_ClearChoices(CH_Training_Mana);
};

func void CH_Training_Mana_BACK()
{
	Info_ClearChoices(CH_Training_Mana);
};


instance CH_Training_Combat(C_Info)
{
	npc = ch;
	condition = CH_Training_Combat_Condition;
	information = CH_Training_Combat_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Kampf";
};


func int CH_Training_Combat_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Combat_Info()
{
	Info_ClearChoices(CH_Training_Combat);
	Info_AddChoice(CH_Training_Combat,"BACK",CH_Training_Combat_BACK);
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnCrossbow_2,LPCOST_TALENT_CROSSBOW_2,0),CH_CrossbowL2);
	};
	if((hero.lp >= LPCOST_TALENT_CROSSBOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnCrossbow_1,LPCOST_TALENT_CROSSBOW_1,0),CH_CrossbowL1);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,0),CH_BowL2);
	};
	if((hero.lp >= LPCOST_TALENT_STAFF_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_STAFF) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LEARNSTAFF_1,LPCOST_TALENT_STAFF_1,0),ch_staffl1);
	};
	if((hero.lp >= LPCOST_TALENT_STAFF_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_STAFF) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LEARNSTAFF_2,LPCOST_TALENT_STAFF_2,0),ch_staffl2);
	};
	if((hero.lp >= LPCOST_TALENT_BOW_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,0),CH_BowL1);
	};
	if((hero.lp >= LPCOST_TALENT_2H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0),CH_2hL2);
	};
	if((hero.lp >= LPCOST_TALENT_2H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0),CH_2hL1);
	};
	if((hero.lp >= LPCOST_TALENT_1H_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0),CH_1hL2);
	};
	if((hero.lp >= LPCOST_TALENT_1H_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0))
	{
		Info_AddChoice(CH_Training_Combat,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0),CH_1hL1);
	};
};

func void CH_1hL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1);
};

func void CH_1hL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2);
};

func void CH_2hL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1);
};

func void CH_2hL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2);
};

func void ch_staffl1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_STAFF,1,LPCOST_TALENT_STAFF_1);
};

func void ch_staffl2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_STAFF,2,LPCOST_TALENT_STAFF_2);
};

func void CH_BowL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1);
};

func void CH_BowL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2);
};

func void CH_CrossbowL1()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_CROSSBOW,1,LPCOST_TALENT_CROSSBOW_1);
};

func void CH_CrossbowL2()
{
	Info_ClearChoices(CH_Training_Combat);
	B_GiveSkill(hero,NPC_TALENT_CROSSBOW,2,LPCOST_TALENT_CROSSBOW_2);
};

func void CH_Training_Combat_BACK()
{
	Info_ClearChoices(CH_Training_Combat);
};


instance CH_Training_Magic(C_Info)
{
	npc = ch;
	condition = CH_Training_Magic_Condition;
	information = CH_Training_Magic_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Magie";
};


func int CH_Training_Magic_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Magic_Info()
{
	Info_ClearChoices(CH_Training_Magic);
	Info_AddChoice(CH_Training_Magic,"BACK",CH_Training_Magic_BACK);
	if((hero.lp >= LPCOST_TALENT_ALCHEMY_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == TAL_STEP_2))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNALCHEMY_3,LPCOST_TALENT_ALCHEMY_3,0),ch_alchemie3);
	};
	if((hero.lp >= LPCOST_TALENT_ALCHEMY_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == TAL_STEP_1))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNALCHEMY_2,LPCOST_TALENT_ALCHEMY_2,0),ch_alchemie2);
	};
	if((hero.lp >= LPCOST_TALENT_ALCHEMY_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) == 0))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNALCHEMY_1,LPCOST_TALENT_ALCHEMY_1,0),ch_alchemie1);
	};
	if((hero.lp >= LPCOST_TALENT_THAUMATURGY_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == TAL_STEP_2))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNTHAUMATURGY_3,LPCOST_TALENT_ALCHEMY_3,0),ch_thaumaturgy3);
	};
	if((hero.lp >= LPCOST_TALENT_THAUMATURGY_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == TAL_STEP_1))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNTHAUMATURGY_2,LPCOST_TALENT_ALCHEMY_2,0),ch_thaumaturgy2);
	};
	if((hero.lp >= LPCOST_TALENT_THAUMATURGY_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) == 0))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LEARNTHAUMATURGY_1,LPCOST_TALENT_ALCHEMY_1,0),ch_thaumaturgy1);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_6) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0),CH_Magic6);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0),CH_Magic5);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_4) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0),CH_Magic4);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0),CH_Magic3);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0),CH_Magic2);
	};
	if((hero.lp >= LPCOST_TALENT_MAGE_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0))
	{
		Info_AddChoice(CH_Training_Magic,B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0),CH_Magic1);
	};
};

func void CH_Magic1()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1);
	CreateInvItem(hero,itar_runelight);
	CreateInvItem(hero,itar_runefirebolt);
	CreateInvItem(hero,itar_runethunderbolt);
	CreateInvItems(hero,itar_scrolltrfscavenger,10);
	CreateInvItems(hero,itar_scrolltrfmolerat,10);
	CreateInvItems(hero,itar_scrolltrfwaran,10);
};

func void CH_Magic2()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2);
	CreateInvItem(hero,itar_runeheal);
	CreateInvItem(hero,itar_runesleep);
	CreateInvItem(hero,itar_runewindfist);
	CreateInvItems(hero,itar_scrolltrfwolf,10);
	CreateInvItems(hero,itar_scrolltrfbloodfly,10);
	CreateInvItems(hero,itar_scrolltrflurker,10);
};

func void CH_Magic3()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3);
	CreateInvItem(hero,itar_runetelekinesis);
	CreateInvItem(hero,itar_runepyrokinesis);
	CreateInvItem(hero,itar_runeicecube);
	CreateInvItem(hero,itar_runecharm);
	CreateInvItem(hero,itar_runefireball);
	CreateInvItem(hero,itar_runethunderball);
	CreateInvItems(hero,itar_scrolltrfmeatbug,10);
	CreateInvItems(hero,itar_scrolltrfcrawler,10);
	CreateInvItems(hero,itar_scrolltrfsnapper,10);
	CreateInvItems(hero,itar_scrollsummonskeletons,10);
};

func void CH_Magic4()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4);
	CreateInvItem(hero,itar_runecontrol);
	CreateInvItem(hero,itar_runechainlightning);
	CreateInvItem(hero,itar_runestormfist);
	CreateInvItem(hero,itar_runedestroyundead);
	CreateInvItem(hero,itar_runefirestorm);
	CreateInvItems(hero,itar_scrolltrforcdog,10);
	CreateInvItems(hero,itar_scrolltrfshadowbeast,10);
	CreateInvItems(hero,itar_scrollsummongolem,10);
	CreateInvItems(hero,itar_scrollfear,10);
	CreateInvItems(hero,itar_scrollberzerk,10);
	CreateInvItems(hero,itar_scrollshrink,10);
};

func void CH_Magic5()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5);
	CreateInvItem(hero,itar_runeicewave);
	CreateInvItem(hero,itar_runefirerain);
	CreateInvItems(hero,itar_scrollsummondemon,10);
};

func void CH_Magic6()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6);
	CreateInvItem(hero,itar_runebreathofdeath);
	CreateInvItems(hero,itar_scrollarmyofdarkness,10);
};

func void ch_alchemie1()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_ALCHEMY,1,LPCOST_TALENT_ALCHEMY_1);
};

func void ch_alchemie2()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_ALCHEMY,2,LPCOST_TALENT_ALCHEMY_2);
};

func void ch_alchemie3()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_ALCHEMY,3,LPCOST_TALENT_ALCHEMY_3);
};

func void ch_thaumaturgy1()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_THAUMATURGY,1,LPCOST_TALENT_THAUMATURGY_1);
};

func void ch_thaumaturgy2()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_THAUMATURGY,2,LPCOST_TALENT_THAUMATURGY_2);
};

func void ch_thaumaturgy3()
{
	Info_ClearChoices(CH_Training_Magic);
	B_GiveSkill(hero,NPC_TALENT_THAUMATURGY,3,LPCOST_TALENT_THAUMATURGY_3);
};

func void CH_Training_Magic_BACK()
{
	Info_ClearChoices(CH_Training_Magic);
};


instance CH_Training_Thievery(C_Info)
{
	npc = ch;
	condition = CH_Training_Thievery_Condition;
	information = CH_Training_Thievery_Info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Dieb";
};


func int CH_Training_Thievery_Condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void CH_Training_Thievery_Info()
{
	Info_ClearChoices(CH_Training_Thievery);
	Info_AddChoice(CH_Training_Thievery,"BACK",CH_Training_Thievery_BACK);
	if((hero.lp >= LPCOST_TALENT_ACROBAT) && (Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnAcrobat,LPCOST_TALENT_ACROBAT,0),CH_Acrobat);
	};
	if((hero.lp >= LPCOST_TALENT_SNEAK) && (Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0),CH_Sneak);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),CH_Pickpocket2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKPOCKET_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),CH_Pickpocket1);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),CH_Picklock2);
	};
	if((hero.lp >= LPCOST_TALENT_PICKLOCK_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0))
	{
		Info_AddChoice(CH_Training_Thievery,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),CH_Picklock1);
	};
};

func void CH_Picklock1()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1);
};

func void CH_Picklock2()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2);
};

func void CH_Pickpocket1()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1);
};

func void CH_Pickpocket2()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2);
};

func void CH_Sneak()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK);
};

func void CH_Acrobat()
{
	Info_ClearChoices(CH_Training_Thievery);
	B_GiveSkill(hero,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT);
};

func void CH_Training_Thievery_BACK()
{
	Info_ClearChoices(CH_Training_Thievery);
};


instance CH_TRAINING_CRAFT(C_Info)
{
	npc = ch;
	condition = ch_training_craft_condition;
	information = ch_training_craft_info;
	important = 0;
	permanent = 1;
	description = "TALENTE: Handwerk";
};


func int ch_training_craft_condition()
{
	if(hero.lp > 0)
	{
		return TRUE;
	};
};

func void ch_training_craft_info()
{
	Info_ClearChoices(ch_training_craft);
	Info_AddChoice(ch_training_craft,"BACK",ch_training_craft_back);
	if((hero.lp >= LPCOST_TALENT_BOWMAKER_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) == 0))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNBOWMAKER_1,LPCOST_TALENT_BOWMAKER_1,0),ch_bow1);
	};
	if((hero.lp >= LPCOST_TALENT_BOWMAKER_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) == TAL_STEP_1))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNBOWMAKER_2,LPCOST_TALENT_BOWMAKER_2,0),ch_bow2);
	};
	if((hero.lp >= LPCOST_TALENT_BOWMAKER_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) == TAL_STEP_2))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNBOWMAKER_3,LPCOST_TALENT_BOWMAKER_3,0),ch_bow3);
	};
	if((hero.lp >= LPCOST_TALENT_COOK_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_COOK) == 0))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNCOOK_1,LPCOST_TALENT_COOK_1,0),ch_cook1);
	};
	if((hero.lp >= LPCOST_TALENT_COOK_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_COOK) == TAL_STEP_1))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNCOOK_2,LPCOST_TALENT_COOK_2,0),ch_cook2);
	};
	if((hero.lp >= LPCOST_TALENT_COOK_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_COOK) == TAL_STEP_2))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNCOOK_3,LPCOST_TALENT_COOK_3,0),ch_cook3);
	};
	if((hero.lp >= LPCOST_TALENT_SMITH_1) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) == 0))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNSMITH_1,LPCOST_TALENT_SMITH_1,0),ch_smith1);
	};
	if((hero.lp >= LPCOST_TALENT_SMITH_2) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) == 1))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNSMITH_2,LPCOST_TALENT_SMITH_2,0),ch_smith2);
	};
	if((hero.lp >= LPCOST_TALENT_SMITH_3) && (Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) == 2))
	{
		Info_AddChoice(ch_training_craft,B_BuildLearnString(NAME_LEARNSMITH_3,LPCOST_TALENT_SMITH_3,0),ch_smith3);
	};
};

func void ch_smith1()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_SMITH,1,LPCOST_TALENT_SMITH_1);
};

func void ch_smith2()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_SMITH,2,LPCOST_TALENT_SMITH_2);
};

func void ch_smith3()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_SMITH,3,LPCOST_TALENT_SMITH_3);
};

func void ch_training_craft_back()
{
	Info_ClearChoices(ch_training_craft);
};

func void ch_cook1()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_COOK,1,LPCOST_TALENT_COOK_1);
};

func void ch_cook2()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_COOK,2,LPCOST_TALENT_COOK_2);
};

func void ch_cook3()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_COOK,3,LPCOST_TALENT_COOK_3);
};

func void ch_bow1()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_BOWMAKER,1,LPCOST_TALENT_BOWMAKER_1);
};

func void ch_bow2()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_BOWMAKER,2,LPCOST_TALENT_BOWMAKER_2);
};

func void ch_bow3()
{
	Info_ClearChoices(ch_training_craft);
	B_GiveSkill(hero,NPC_TALENT_BOWMAKER,3,LPCOST_TALENT_BOWMAKER_3);
};


instance CH_TRAINING_SMITHKNOWLEDGE(C_Info)
{
	npc = ch;
	condition = ch_training_smithknowledge_condition;
	information = ch_training_smithknowledge_info;
	important = 0;
	permanent = 1;
	description = "WISSEN: Waffenschmieden";
};


func int ch_training_smithknowledge_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		return TRUE;
	};
};

func void ch_training_smithknowledge_info()
{
	Info_ClearChoices(ch_training_smithknowledge);
	Info_AddChoice(ch_training_smithknowledge,"BACK",ch_training_smithknowledge_back);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_ORCHAMMER)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_ORCHAMMER,ch_orchammer);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_WARHAMMER)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_WARHAMMER,ch_warhammer);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_MORNINGSTAR)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_MORNINGSTAR,ch_morningstar);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_MACE)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_MACE,ch_mace);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_IRONCLUB)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_IRONCLUB,ch_ironclub);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_ORCAXE)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_ORCAXE,ch_orcaxe);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_BERSERKAXE)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_BERSERKAXE,ch_berserkaxe);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_DOUBLEBLADEDAXE)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_DOUBLEBLADEDAXE,ch_doublebladedaxe);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_BATTLEAXE)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_BATTLEAXE,ch_battleaxe);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_HATCHET)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_HATCHET,ch_hatchet);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_ORCSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_ORCSWORD,ch_orcsword);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_2HSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_2HSWORD,ch_2hsword);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_BASTARDSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_BASTARDSWORD,ch_bastardsword);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_BROADSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_BROADSWORD,ch_broadsword);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_LONGSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_LONGSWORD,ch_longsword);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) && !KNOWS_SHORTSWORD)
	{
		Info_AddChoice(ch_training_smithknowledge,NAME_SHORTSWORD,ch_shortsword);
	};
};

func void ch_shortsword()
{
	b_learnshortsword();
};

func void ch_longsword()
{
	b_learnlongsword();
};

func void ch_broadsword()
{
	b_learnbroadsword();
};

func void ch_bastardsword()
{
	b_learnbastardsword();
};

func void ch_2hsword()
{
	b_learn2hsword();
};

func void ch_orcsword()
{
	b_learnorcsword();
};

func void ch_hatchet()
{
	b_learnhatchet();
};

func void ch_battleaxe()
{
	b_learnbattleaxe();
};

func void ch_doublebladedaxe()
{
	b_learndoublebladedaxe();
};

func void ch_berserkaxe()
{
	b_learnberserkaxe();
};

func void ch_orcaxe()
{
	b_learnorcaxe();
};

func void ch_ironclub()
{
	b_learnironclub();
};

func void ch_mace()
{
	b_learnmace();
};

func void ch_morningstar()
{
	b_learnmorningstar();
};

func void ch_warhammer()
{
	b_learnwarhammer();
};

func void ch_orchammer()
{
	b_learnorchammer();
};

func void ch_training_smithknowledge_back()
{
	Info_ClearChoices(ch_training_smithknowledge);
};


instance CH_TRAINING_COOKKNOWLEDGE(C_Info)
{
	npc = ch;
	condition = ch_training_cookknowledge_condition;
	information = ch_training_cookknowledge_info;
	important = 0;
	permanent = 1;
	description = "WISSEN: Kochrezepte";
};


func int ch_training_cookknowledge_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1)
	{
		return TRUE;
	};
};

func void ch_training_cookknowledge_info()
{
	Info_ClearChoices(ch_training_cookknowledge);
	Info_AddChoice(ch_training_cookknowledge,"BACK",ch_training_cookknowledge_back);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1) && !KNOWS_RECIPEMEATBUG)
	{
		Info_AddChoice(ch_training_cookknowledge,NAME_RECIPEMEATBUG,ch_meatbug);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1) && !KNOWS_RECIPEHERB)
	{
		Info_AddChoice(ch_training_cookknowledge,NAME_RECIPEHERB,ch_herb);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1) && !KNOWS_RECIPEMUSHROOM)
	{
		Info_AddChoice(ch_training_cookknowledge,NAME_RECIPEMUSHROOM,ch_mushroom);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1) && !KNOWS_RECIPEMEAT)
	{
		Info_AddChoice(ch_training_cookknowledge,NAME_RECIPEMEAT,ch_meat);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= TAL_STEP_1) && !KNOWS_RECIPEMOLERAT)
	{
		Info_AddChoice(ch_training_cookknowledge,NAME_RECIPEMOLERAT,ch_molerat);
	};
};

func void ch_training_cookknowledge_back()
{
	Info_ClearChoices(ch_training_cookknowledge);
};

func void ch_meatbug()
{
	b_learnrecipemeatbug();
};

func void ch_herb()
{
	b_learnrecipeherb();
};

func void ch_mushroom()
{
	b_learnrecipemushroom();
};

func void ch_meat()
{
	b_learnrecipemeat();
};

func void ch_molerat()
{
	b_learnrecipemolerat();
};


instance CH_TRAINING_ALCHEMIEKNOWLEDGE(C_Info)
{
	npc = ch;
	condition = ch_training_alchemieknowledge_condition;
	information = ch_training_alchemieknowledge_info;
	important = 0;
	permanent = 1;
	description = "WISSEN: Alchemie";
};


func int ch_training_alchemieknowledge_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= TAL_STEP_1)
	{
		return TRUE;
	};
};

func void ch_training_alchemieknowledge_info()
{
	Info_ClearChoices(ch_training_alchemieknowledge);
	Info_AddChoice(ch_training_alchemieknowledge,"BACK",ch_training_alchemieknowledge_back);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && !KNOWS_SPEEDPOTIONS)
	{
		Info_AddChoice(ch_training_alchemieknowledge,NAME_BOOKSPEEDPOTIONS,ch_speed);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && !KNOWS_MANAPOTIONS)
	{
		Info_AddChoice(ch_training_alchemieknowledge,NAME_BOOKMANAPOTIONS,ch_mana);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= TAL_STEP_1) && !KNOWS_HEALINGPOTIONS)
	{
		Info_AddChoice(ch_training_alchemieknowledge,NAME_BOOKHEALINGPOTIONS,ch_healing);
	};
};

func void ch_training_alchemieknowledge_back()
{
	Info_ClearChoices(ch_training_alchemieknowledge);
};

func void ch_mana()
{
	b_learnrecipemanapotions();
};

func void ch_healing()
{
	b_learnrecipehealingpotions();
};

func void ch_speed()
{
	b_learnrecipespeedpotions();
};


instance CH_TRAINING_BOWKNOWLEDGE(C_Info)
{
	npc = ch;
	condition = ch_training_bowknowledge_condition;
	information = ch_training_bowknowledge_info;
	important = 0;
	permanent = 1;
	description = "WISSEN: Bogenmachen";
};


func int ch_training_bowknowledge_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= TAL_STEP_1)
	{
		return TRUE;
	};
};

func void ch_training_bowknowledge_info()
{
	Info_ClearChoices(ch_training_bowknowledge);
	Info_AddChoice(ch_training_bowknowledge,"BACK",ch_training_bowknowledge_back);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= TAL_STEP_1) && !KNOWS_RECIPEBOW)
	{
		Info_AddChoice(ch_training_bowknowledge,NAME_ITWR_BOW,ch_bow);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= TAL_STEP_1) && !KNOWS_RECIPELONGBOW)
	{
		Info_AddChoice(ch_training_bowknowledge,NAME_ITWR_LONGBOW,ch_longbow);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= TAL_STEP_1) && !KNOWS_RECIPECROSSBOW)
	{
		Info_AddChoice(ch_training_bowknowledge,NAME_ITWR_CROSSBOW,ch_crossbow);
	};
};

func void ch_training_bowknowledge_back()
{
	Info_ClearChoices(ch_training_bowknowledge);
};

func void ch_bow()
{
	b_learnrecipebow();
};

func void ch_longbow()
{
	b_learnrecipelongbow();
};

func void ch_crossbow()
{
	b_learnrecipecrossbow();
};


instance CH_TRAINING_EQUIPMENT(C_Info)
{
	npc = ch;
	condition = ch_training_equipment_condition;
	information = ch_training_equipment_info;
	important = 0;
	permanent = 1;
	description = "ROHSTOFFE & WERKZEUGE";
};


func int ch_training_equipment_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1) || (Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= 1) || (Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1) || (Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) >= 1) || (Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= 1))
	{
		return TRUE;
	};
};

func void ch_training_equipment_info()
{
	Info_ClearChoices(ch_training_equipment);
	Info_AddChoice(ch_training_equipment,"BACK",ch_training_equipment_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_BOWMAKER) >= 1)
	{
		Info_AddChoice(ch_training_equipment,"...fürs Bogenmachen",ch_training_equipment_bowmaker);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_THAUMATURGY) >= 1)
	{
		Info_AddChoice(ch_training_equipment,"...fürs Runenmachen",ch_training_equipment_thaumaturgy);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) >= 1)
	{
		Info_AddChoice(ch_training_equipment,"...für Alchemie",ch_training_equipment_alchemy);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_COOK) >= 1)
	{
		Info_AddChoice(ch_training_equipment,"...fürs Kochen",ch_training_equipment_cook);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Info_AddChoice(ch_training_equipment,"...fürs Schmieden",ch_training_equipment_smith);
	};
};

func void ch_training_equipment_smith()
{
	Info_ClearChoices(ch_training_equipment);
	CreateInvItems(hero,itmi_pliers,1);
	CreateInvItems(hero,itmw_sledgehammer,1);
	CreateInvItems(hero,itmw_pickaxe,1);
	CreateInvItems(hero,itmi_orenugget,100);
	CreateInvItems(hero,itmi_bloodorenugget,100);
	CreateInvItems(hero,itmi_darkorenugget,100);
};

func void ch_training_equipment_cook()
{
	Info_ClearChoices(ch_training_equipment);
	CreateInvItems(hero,itmi_scoop,1);
	CreateInvItems(hero,itmi_salt,20);
	CreateInvItems(hero,itat_meatbug,10);
	CreateInvItems(hero,itat_moleratgrease,10);
	CreateInvItems(hero,itpl_swampweed,10);
	CreateInvItems(hero,itpl_cavemushroom,10);
	CreateInvItems(hero,itfo_mutton,10);
	CreateInvItems(hero,itfo_loaf,10);
	CreateInvItems(hero,itfo_cheese,10);
	CreateInvItems(hero,itfo_ham,10);
};

func void ch_training_equipment_alchemy()
{
	Info_ClearChoices(ch_training_equipment);
	CreateInvItems(hero,itmi_alcohol,10);
	CreateInvItems(hero,itpl_mountainmoss,10);
	CreateInvItems(hero,itpl_stoneroot,10);
	CreateInvItems(hero,itpl_bloodthistle,10);
	CreateInvItems(hero,itpl_orcleaf,10);
	CreateInvItems(hero,itpl_nightshade,10);
	CreateInvItems(hero,itpl_ravenherb,10);
};

func void ch_training_equipment_thaumaturgy()
{
	Info_ClearChoices(ch_training_equipment);
	CreateInvItems(hero,itmi_pliers,1);
	CreateInvItems(hero,itmw_sledgehammer,1);
	CreateInvItems(hero,itmi_orenugget,100);
	CreateInvItems(hero,itmi_bloodorenugget,100);
	CreateInvItems(hero,itmi_darkorenugget,100);
	CreateInvItems(hero,itar_runeblank,10);
	CreateInvItems(hero,itar_bloodruneblank,10);
	CreateInvItems(hero,itar_darkruneblank,10);
	CreateInvItems(hero,itar_scrolllight,5);
	CreateInvItems(hero,itar_scrollfirebolt,5);
	CreateInvItems(hero,itar_scrollheal,5);
	CreateInvItems(hero,itar_scrollthunderbolt,5);
	CreateInvItems(hero,itar_scrollwindfist,5);
	CreateInvItems(hero,itar_scrollsleep,5);
	CreateInvItems(hero,itar_scrollcharm,5);
	CreateInvItems(hero,itar_scrollthunderball,5);
	CreateInvItems(hero,itar_scrollicecube,5);
	CreateInvItems(hero,itar_scrollpyrokinesis,5);
	CreateInvItems(hero,itar_scrolldestroyundead,5);
	CreateInvItems(hero,itar_scrollchainlightning,5);
	CreateInvItems(hero,itar_scrollstormfist,5);
	CreateInvItems(hero,itar_scrolltelekinesis,5);
	CreateInvItems(hero,itar_scrollfireball,5);
	CreateInvItems(hero,itar_scrollfirestorm,5);
	CreateInvItems(hero,itar_scrollcontrol,5);
	CreateInvItems(hero,itar_scrollbreathofdeath,5);
	CreateInvItems(hero,itar_scrollicewave,5);
	CreateInvItems(hero,itar_scrollfirerain,5);
};

func void ch_training_equipment_bowmaker()
{
	Info_ClearChoices(ch_training_equipment);
	CreateInvItems(hero,itmi_fletcherwood,100);
	CreateInvItems(hero,itmi_fletcherknife,1);
};

func void ch_training_equipment_back()
{
	Info_ClearChoices(ch_training_equipment);
};

