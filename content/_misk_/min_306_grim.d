
instance MIN_306_GRIM(C_Npc)
{
	name[0] = "Grim";
	guild = GIL_MINER;
	npcType = npctype_main;
	level = 1;
	voice = 10;
	id = 306;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",61,4,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_grim_pickaxe);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[40] = GRIM_VICTORIES_START;
	daily_routine = rtn_arenawait_306;
};


func void rtn_arenawait_306()
{
	ta_arenasmalltalk(8,0,22,0,"OCR_SMALLTALK_A_OC_ARENA");
	ta_arenasleep(22,0,8,0,"OCR_HUT_32");
};

func void rtn_prechamber_306()
{
	ta_arenasitaround(0,0,12,0,ARENA_WP_RIGHT_CHAMBER);
	ta_arenasitaround(12,0,0,0,ARENA_WP_RIGHT_CHAMBER);
};

func void rtn_arenafight_306()
{
	ta_arenafight(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenafight(12,0,0,0,ARENA_WP_RIGHT_START);
};

func void rtn_arenanpc_306()
{
	ta_arenanpc(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenanpc(12,0,0,0,ARENA_WP_RIGHT_START);
};

