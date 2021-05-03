
instance PC_Mini(C_Npc)
{
	name[0] = "Mini";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",77,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_COWARD;
};

instance OverlayTestmodell(C_Npc)
{
	name[0] = "ATestmodell";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"Humans_drunken.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Sprint.mds");
	fight_tactic = FAI_HUMAN_COWARD;
};

instance BathBabe(C_Npc)
{
	name[0] = "Badenixe";
	guild = GIL_None;
	level = 3;
	voice = 11;
	id = 3009;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 7;
	attribute[ATR_DEXTERITY] = 11;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 13;
	attribute[ATR_HITPOINTS] = 13;
	Mdl_SetVisual(self,"BABE.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,1,"Bab_Head_Hair1",3,DEFAULT,-1);
	start_aistate = ZS_Bathing_Babe;
};

instance MK_CAPTAINITEM(C_Npc)
{
	name[0] = "Captain Item";
	guild = GIL_None;
	level = 30;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 60;
	attribute[ATR_MANA] = 60;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",77,DEFAULT,-1);
	CreateInvItem(self,itmi_rawlongiron);
	CreateInvItem(self,itmi_bloodrawlongiron);
	CreateInvItem(self,itmi_darkrawlongiron);
	CreateInvItem(self,itmi_hotiron);
	CreateInvItem(self,itmi_hotlongiron);
	CreateInvItem(self,itmi_bloodhotlongiron);
	CreateInvItem(self,itmi_darkhotlongiron);
	CreateInvItem(self,itmi_hotswordblade);
	CreateInvItem(self,itmi_hot2hswordblade);
	CreateInvItem(self,itmi_darkhot2hswordblade);
	CreateInvItem(self,itmi_bloodhot2hswordblade);
	CreateInvItem(self,itmi_swordblade);
	CreateInvItem(self,itmi_2hswordblade);
	CreateInvItem(self,itmi_dark2hswordblade);
	CreateInvItem(self,itmi_blood2hswordblade);
};

instance MK_MOBBER(C_Npc)
{
	name[0] = "Mobber";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",77,DEFAULT,-1);
	EquipItem(self,Gewandtheitsamulett);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = mk_mobber_01;
};


func void mk_mobber_01()
{
	TA_StandAround(0,0,7,0,"PT_1");
	TA_Cook(7,0,8,0,"PT_CAULDRON");
	TA_Smith_Fire(8,0,8,30,"PT_FIRE");
	TA_Smith_Anvil(8,30,9,0,"PT_ANVIL");
	TA_Smith_Cool(9,0,9,30,"PT_COOL");
	TA_Smith_Sharp(9,30,10,0,"PT_SHARP");
	ta_armormaker(10,0,11,0,"PT_ARMORSTAND");
	ta_sawwood(11,0,12,0,"PT_SAWWOOD");
	TA_Smoke(12,0,12,30,"PT_2");
	TA_StandAround(12,30,0,0,"PT_1");
};


instance INFO_MKMOBBER_1(C_Info)
{
	npc = mk_mobber;
	condition = info_mkmobber_1_condition;
	information = info_mkmobber_1_info;
	important = FALSE;
	permanent = TRUE;
	description = "MK_MOBBER Test";
};


func int info_mkmobber_1_condition()
{
	return TRUE;
};

func void info_mkmobber_1_info()
{
	Info_ClearChoices(info_mkmobber_1);
	Info_AddChoice(info_mkmobber_1,"Ende",info_mkmobber_1_ende);
	Info_AddChoice(info_mkmobber_1,"Hau dich hin!",info_mkmobber_1_sleep);
	Info_AddChoice(info_mkmobber_1,"Gib mir all dein Gold",info_mkmobber_1_wldinsert);
	Info_AddChoice(info_mkmobber_1,"AI-PrintScreen",info_mkmobber_1_print);
	Info_AddChoice(info_mkmobber_1,"Benutz Amulett",info_mkmobber_1_equip);
	Info_AddChoice(info_mkmobber_1,"Geh einen rauchen",info_mkmobber_1_smoke);
	Info_AddChoice(info_mkmobber_1,"Benutze Labor",info_mkmobber_1_taoverlay);
};

func void info_mkmobber_1_ende()
{
	AI_StopProcessInfos(self);
};

func void info_mkmobber_1_taoverlay()
{
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	TA_PotionAlchemy(0,0,0,10,"PT_LAB");
	TA_EndOverlay(self);
};

func void info_mkmobber_1_smoke()
{
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	TA_Smoke(0,0,0,5,"PT_CAULDRON");
	TA_EndOverlay(self);
};

func void info_mkmobber_1_equip()
{
	AI_StopProcessInfos(self);
	AI_DropItem(self,Gewandtheitsamulett);
};

func void info_mkmobber_1_print()
{
	AI_StopProcessInfos(self);
	AI_PlayAni(self,"R_LEGSHAKE");
	ai_printscreen(self,"Ich hab nen Krampf!",-1,_YPOS_MESSAGE_REFUSEACTION,FONT_OLD_SMALL,_TIME_MESSAGE_REFUSEACTION,TEXT_COLOR_GREEN);
	AI_PlayAni(self,"R_SCRATCHHEAD");
	ai_printscreen(self,"Das hat gejuckt!",-1,_YPOS_MESSAGE_REFUSEACTION + 1,FONT_OLD_SMALL,_TIME_MESSAGE_REFUSEACTION,TEXT_COLOR_RED);
	AI_PlayAni(self,"R_SCRATCHRSHOULDER");
	ai_snd_play(self,"LogEntry");
	AI_Dodge(self);
	AI_Dodge(self);
	AI_Dodge(self);
	ai_printscreen(self,"Hier gibts zuviel Läuse!",-1,_YPOS_MESSAGE_REFUSEACTION + 2,FONT_OLD_SMALL,_TIME_MESSAGE_REFUSEACTION,TEXT_COLOR_BLUE);
	ai_snd_play3d(self,self,"LogEntry");
};

func void info_mkmobber_1_wldinsert()
{
	AI_StopProcessInfos(self);
	wld_insertitems(itmi_silver,10,"PT_1");
	wld_insertitems(itmi_silver,30,"PT_2");
};

func void info_mkmobber_1_sleep()
{
	AI_StopProcessInfos(self);
	TA_BeginOverlay(self);
	TA_Sleep(0,0,1,0,"PT_BED");
	TA_EndOverlay(self);
};

