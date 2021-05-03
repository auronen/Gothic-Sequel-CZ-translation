
prototype Npc_TestDefault(C_Npc)
{
	name[0] = "Prototype";
	guild = GIL_None;
	level = 1;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] = 5;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 4000;
};

instance ATestmodell(Npc_Default)
{
	name[0] = "ATestmodell";
	slot = " der Kühne";
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
	Npc_SetAttitude(self,ATT_FRIENDLY);
	CreateInvItem(self,itmi_scoop);
	EquipItem(self,helmet);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_3001;
};


func void Rtn_start_3001()
{
	ta_makerune(0,0,12,0,"PT_RUNEMELTER");
	ta_makerune(12,0,0,0,"PT_RUNEMELTER");
};


instance BTestmodell(Npc_TestDefault)
{
	name[0] = "BTestmodell";
	guild = GIL_WORKER;
	level = 20;
	voice = 12;
	id = 3002;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,ebr_armor_h);
	daily_routine = Rtn_start_3002;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void Rtn_start_3002()
{
	TA_StandAround(0,0,12,0,"PT_ANVIL");
	TA_StandAround(12,0,0,0,"PT_ANVIL");
};


instance CTestmodell(Npc_TestDefault)
{
	name[0] = "CTestmodell";
	guild = GIL_HEALER;
	level = 6;
	voice = 11;
	id = 3003;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,ebr_armor_h);
	aivar[34] = AIV_H_HEAL;
	CreateInvItem(self,itmw_club);
	CreateInvItem(self,itmw_ironclub);
	CreateInvItem(self,itmw_club);
	CreateInvItem(self,dmc_armor);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItFo_Potion_Health_01);
	daily_routine = Rtn_start_3003;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void Rtn_start_3003()
{
	TA_StandAround(0,0,12,0,"TEST1");
	TA_StandAround(12,0,0,0,"TEST3");
};


instance DTestmodell(Npc_TestDefault)
{
	name[0] = "DTestmodell";
	slot = "Guru";
	guild = GIL_None;
	level = 6;
	voice = 11;
	id = 3004;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 30;
	attribute[ATR_HITPOINTS] = 30;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,gur_armor_h);
	daily_routine = Rtn_start_3004;
	fight_tactic = FAI_HUMAN_COWARD;
};


func void Rtn_start_3004()
{
	TA_RoastScavenger(12,0,13,0,"OCR_OUTSIDE_ARENA_01");
	TA_RoastScavenger(13,0,12,0,"OCR_OUTSIDE_ARENA_01");
};


instance FTestmodell(Npc_TestDefault)
{
	name[0] = "FTestmodell";
	slot = "Gardist";
	guild = GIL_None;
	level = 5;
	voice = 11;
	id = 3006;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 15;
	attribute[ATR_HITPOINTS] = 15;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,grd_armor_m);
	daily_routine = Rtn_start_3006;
	fight_tactic = 1;
};


func void Rtn_start_3006()
{
	ta_guardfp(0,0,23,59,"WP_STEALWITNESS_2");
};


instance GTestmodell(Npc_TestDefault)
{
	name[0] = "GTestmodell";
	guild = GIL_None;
	level = 6;
	voice = 11;
	id = 3007;
	attribute[ATR_STRENGTH] = 7;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 15;
	attribute[ATR_MANA] = 15;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,kdf_armor_l);
	daily_routine = Rtn_start_3007;
	fight_tactic = 1;
};


func void Rtn_start_3007()
{
	TA_SitAround(0,0,23,59,"WP_STEALWITNESS_1");
};


instance HTestmodell(Npc_TestDefault)
{
	name[0] = "HTestmodell";
	guild = GIL_None;
	level = 6;
	voice = 11;
	id = 3008;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 6;
	attribute[ATR_MANA_MAX] = 15;
	attribute[ATR_MANA] = 15;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,kdf_armor_l);
	daily_routine = Rtn_start_3008;
	fight_tactic = 1;
};


func void Rtn_start_3008()
{
	TA_SitAround(0,0,23,59,"WP_STEAL_1");
};


instance ITestmodell(Npc_TestDefault)
{
	name[0] = "ITestmodell";
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
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,DEFAULT,"Bab_Head_Amazone",DEFAULT,DEFAULT,-1);
	daily_routine = Rtn_start_3009;
};


func void Rtn_start_3009()
{
	TA_Babe_Sweep(0,0,20,0,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	TA_Babe_Sweep(20,0,9,0,"OCC_BARONS_GREATHALL_CENTER_LEFT");
};


instance JTestmodell(Npc_TestDefault)
{
	name[0] = "JTestmodell";
	guild = GIL_None;
	level = 2;
	voice = 11;
	id = 3010;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"Babe.MDS");
	Mdl_SetVisualBody(self,"Bab_body_Naked0",DEFAULT,DEFAULT,"Bab_Head_Hair2",DEFAULT,DEFAULT,-1);
	daily_routine = Rtn_start_3010;
};


func void Rtn_start_3010()
{
	TA_Babe_Sweep(0,0,23,59,"WP_HALLYWAY_2");
};

func void b_saytest()
{
	if(wld_isfpavailinrange(self,"SMALLTALK",100))
	{
		Print("FP in einem Meter Entfernung");
	};
	if(wld_isfpavailinrange(self,"SMALLTALK",200))
	{
		Print("FP in zwei Metern Entfernung");
	};
	if(wld_isfpavailinrange(self,"SMALLTALK",300))
	{
		Print("FP in drei Metern Entfernung");
	};
	if(wld_isfpavailinrange(self,"SMALLTALK",400))
	{
		Print("FP in vier Metern Entfernung");
	};
	if(wld_isfpavailinrange(self,"SMALLTALK",500))
	{
		Print("FP in fünf Metern Entfernung");
	};
};

func void zs_testme()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,b_saytest);
};

func void zs_testme_loop()
{
};

func void zs_testme_end()
{
};


instance SLD1_Testmodell(Npc_TestDefault)
{
	name[0] = "SLD1_Testmodell";
	guild = GIL_None;
	level = 4;
	voice = 4;
	id = 1707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,vlk_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	Wld_AssignRoomToNpc("T2",self);
	Wld_AssignRoomToGuild("T4",GIL_None);
	start_aistate = zs_testme;
};


func void Rtn_start_SLD1_Testmodell()
{
	TA_TestHangAround(0,0,13,0,"x");
	TA_TestHangAround(13,0,0,0,"x");
};


instance SLD2_Testmodell(Npc_TestDefault)
{
	name[0] = "SLD2_Testmodell";
	guild = GIL_None;
	level = 3;
	voice = 4;
	id = 2707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,sld_armor_h);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	start_aistate = ZS_TestHangAround;
};


func void Rtn_start_SLD2_Testmodell()
{
	TA_TestHangAround(0,0,13,0,"X");
	TA_TestHangAround(13,0,0,0,"X");
};


instance SLD3_Testmodell(Npc_TestDefault)
{
	name[0] = "SLD3_Testmodell";
	guild = GIL_None;
	level = 3;
	voice = 4;
	id = 3707;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 10;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",51,DEFAULT,sld_armor_h);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_SLD3_Testmodell;
};


func void Rtn_start_SLD3_Testmodell()
{
	TA_TestHangAround(0,0,13,0,"X");
	TA_TestHangAround(13,0,0,0,"X");
};


instance GRD1_Testmodell(Npc_TestDefault)
{
	name[0] = "GRD1_Testmodell";
	guild = GIL_None;
	level = 3;
	voice = 11;
	id = 1221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,grd_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetAttitude(self,ATT_FRIENDLY);
	daily_routine = Rtn_start_GRD1_Testmodell;
};

instance TestInfo_001_07_700(C_Info)
{
	npc = GRD1_Testmodell;
	nr = 1;
	condition = TestInfo_001_07_700_Condition;
	information = TestInfo_001_07_700_Info;
	important = 0;
};


func int TestInfo_001_07_700_Condition()
{
	return 1;
};

func void TestInfo_001_07_700_Info()
{
	b_setattitude(self,ATT_FRIENDLY);
	AI_Output(self,other,"Global_001_07_00");	//Hey Frischling.
	AI_Output(self,other,"Global_001_07_01");	//Falls Du es noch nicht kapiert hast:
	AI_Output(self,other,"Global_001_07_02");	//Es gibt hier im Knast drei große Lager.
	AI_Output(self,other,"Global_001_07_03");	//Das Alte Lager, das Neue Lager und den Sektentempel.
	AI_Output(self,other,"Global_001_07_05");	//Wenn Du nicht den Erzbaronen im Alten Lager den Arsch abwischen willst, kommst Du zu uns.
};

func void Rtn_start_GRD1_Testmodell()
{
	TA_StandAround(0,0,13,0,"X");
	TA_StandAround(13,0,0,0,"X");
};


instance GRD2_Testmodell(Npc_TestDefault)
{
	name[0] = "GRD2_Testmodell";
	guild = GIL_None;
	level = 3;
	voice = 11;
	id = 2221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,vlk_armor_l);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetAttitude(self,ATT_ANGRY);
	daily_routine = Rtn_start_GRD2_Testmodell;
};


func void Rtn_start_GRD2_Testmodell()
{
	TA_TestHangAround(0,0,13,0,"X");
	TA_TestHangAround(13,0,0,0,"X");
};


instance GRD3_Testmodell(Npc_TestDefault)
{
	name[0] = "GRD3_Testmodell";
	guild = GIL_None;
	level = 3;
	voice = 11;
	id = 3221;
	attribute[ATR_STRENGTH] = 9;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"HumanS_Relaxed.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,2,ebr_armor_h);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_GRD3_Testmodell;
};


func void Rtn_start_GRD3_Testmodell()
{
	TA_TestHangAround(0,0,13,0,"X");
	TA_TestHangAround(13,0,0,0,"X");
};

