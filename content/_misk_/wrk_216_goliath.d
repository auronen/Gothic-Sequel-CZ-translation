
instance WRK_216_GOLIATH(C_Npc)
{
	name[0] = "Goliath";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 15;
	voice = 9;
	id = 216;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 120;
	attribute[ATR_HITPOINTS] = 120;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	EquipItem(self,itmw_goliath_sledgehammer);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_Strong;
	aivar[40] = GOLIATH_VICTORIES_START;
	daily_routine = rtn_arenawait_216;
};


func void rtn_arenawait_216()
{
	ta_arenasmalltalk(8,0,22,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_arenasleep(22,0,8,0,"OCR_HUT_21");
};

func void rtn_prechamber_216()
{
	ta_arenasitaround(0,0,12,0,ARENA_WP_LEFT_CHAMBER);
	ta_arenasitaround(12,0,0,0,ARENA_WP_LEFT_CHAMBER);
};

func void rtn_arenafight_216()
{
	ta_arenafight(0,0,12,0,ARENA_WP_LEFT_START);
	ta_arenafight(12,0,0,0,ARENA_WP_LEFT_START);
};

func void rtn_arenanpc_216()
{
	ta_arenanpc(0,0,12,0,ARENA_WP_LEFT_START);
	ta_arenanpc(12,0,0,0,ARENA_WP_LEFT_START);
};

func void rtn_smith_216()
{
	TA_SitCampfire(22,0,8,0,"OCR_CAMPFIRE_A_MOVEMENT3");
	TA_Smith_Cool(8,0,8,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(8,10,8,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(8,20,8,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(8,30,8,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(8,40,8,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(8,50,9,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(9,0,9,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(9,10,9,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(9,20,9,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(9,30,9,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(9,40,9,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(9,50,10,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(10,0,10,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(10,10,10,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(10,20,10,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(10,30,10,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(10,40,10,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(10,50,11,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(11,0,11,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(11,10,11,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(11,20,11,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(11,30,11,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(11,40,11,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(11,50,12,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(12,0,12,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(12,10,12,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(12,20,12,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(12,30,12,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(12,40,12,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(12,50,13,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(13,0,13,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(13,10,13,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(13,20,13,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(13,30,13,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(13,40,13,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(13,50,14,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(14,0,14,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(14,10,14,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(14,20,14,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(14,30,14,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(14,40,14,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(14,50,15,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(15,0,15,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(15,10,15,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(15,20,15,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(15,30,15,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(15,40,15,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(15,50,16,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(16,0,16,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(16,10,16,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(16,20,16,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(16,30,16,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(16,40,16,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(16,50,17,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(17,0,17,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(17,10,17,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(17,20,17,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(17,30,17,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(17,40,17,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(17,50,18,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(18,0,18,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(18,10,18,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(18,20,18,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(18,30,18,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(18,40,18,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(18,50,19,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(19,0,19,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(19,10,19,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(19,20,19,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(19,30,19,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(19,40,19,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(19,50,20,0,GOTMAR_WP_FORGE);
	TA_Smith_Cool(20,0,20,10,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(20,10,20,20,GOTMAR_WP_FORGE);
	TA_Smith_Fire(20,20,20,30,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(20,30,20,40,GOTMAR_WP_FORGE);
	TA_Smith_Cool(20,40,20,50,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(20,50,21,0,GOTMAR_WP_FORGE);
	TA_Smith_Fire(21,0,21,10,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(21,10,21,20,GOTMAR_WP_FORGE);
	TA_Smith_Cool(21,20,21,30,GOTMAR_WP_FORGE);
	TA_Smith_Sharp(21,30,21,40,GOTMAR_WP_FORGE);
	TA_Smith_Fire(21,40,21,50,GOTMAR_WP_FORGE);
	TA_Smith_Anvil(21,50,22,0,GOTMAR_WP_FORGE);
};

