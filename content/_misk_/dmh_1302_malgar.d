
instance DMH_1302_MALGAR(C_Npc)
{
	name[0] = "Malgar";
	npcType = npctype_main;
	guild = GIL_DEMONHUNTER;
	level = 30;
	voice = 11;
	id = 1302;
	flags = 0;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",50,2,dhtm_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_malgar_broadsword);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_Strong;
	aivar[40] = MALGAR_VICTORIES_START;
	daily_routine = rtn_arenawait_1302;
};


func void rtn_arenawait_1302()
{
	ta_arenasitcampfire(6,0,22,0,"OCR_CAMPFIRE_I_2");
	ta_arenastay(22,0,6,0,"CONSTRUCT_UP_03");
};

func void rtn_prechamber_1302()
{
	ta_arenasitaround(0,0,12,0,ARENA_WP_LEFT_CHAMBER);
	ta_arenasitaround(12,0,0,0,ARENA_WP_LEFT_CHAMBER);
};

func void rtn_arenafight_1302()
{
	ta_arenafight(0,0,12,0,ARENA_WP_LEFT_START);
	ta_arenafight(12,0,0,0,ARENA_WP_LEFT_START);
};

func void rtn_arenanpc_1302()
{
	ta_arenanpc(0,0,12,0,ARENA_WP_LEFT_START);
	ta_arenanpc(12,0,0,0,ARENA_WP_LEFT_START);
};

