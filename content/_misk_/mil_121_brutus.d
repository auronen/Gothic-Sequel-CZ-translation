
instance MIL_121_BRUTUS(C_Npc)
{
	name[0] = "Brutus";
	npcType = npctype_main;
	guild = GIL_MILITIA;
	level = 25;
	voice = 6;
	id = 121;
	flags = 0;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",48,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,itmw_brutus_longsword);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_Strong;
	aivar[40] = BRUTUS_VICTORIES_START;
	daily_routine = rtn_arenawait_121;
};


func void rtn_arenawait_121()
{
	ta_arenasitcampfire(7,0,8,0,"OCR_CAMPFIRE_I_3");
	ta_arenasmith_sharp(8,0,12,0,"OCR_CAMPFIRE_I_1");
	ta_arenasitcampfire(12,0,14,0,"OCR_CAMPFIRE_I_3");
	ta_arenasmith_sharp(14,0,16,0,"OCR_CAMPFIRE_I_1");
	ta_arenasitcampfire(16,0,17,0,"OCR_CAMPFIRE_I_3");
	ta_arenasmith_sharp(17,0,19,0,"OCR_CAMPFIRE_I_1");
	ta_arenasleep(19,0,7,0,"OCC_MERCS_LEFT_ROOM_BED5");
};

func void rtn_prechamber_121()
{
	ta_arenasitaround(0,0,12,0,ARENA_WP_RIGHT_CHAMBER);
	ta_arenasitaround(12,0,0,0,ARENA_WP_RIGHT_CHAMBER);
};

func void rtn_arenafight_121()
{
	ta_arenafight(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenafight(12,0,0,0,ARENA_WP_RIGHT_START);
};

func void rtn_arenanpc_121()
{
	ta_arenanpc(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenanpc(12,0,0,0,ARENA_WP_RIGHT_START);
};

