
instance AMZ_900_THORA(C_Npc)
{
	name[0] = "Thora";
	guild = GIL_AMAZON;
	npcType = NPCTYPE_FEMALE;
	level = 35;
	voice = 16;
	id = 900;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 300;
	attribute[ATR_MANA] = 300;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"babe.mds");
	Mdl_SetVisualBody(self,"Bab_Body_Naked2",3,1,"Bab_Head_Amazone.mms",4,0,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_STAFF,2);
	EquipItem(self,itmw_thora_battlestaff);
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = Rtn_start_900;
	senses_range = 2000;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[37] = TRUE;
	aivar[40] = THORA_VICTORIES_START;
};


func void Rtn_start_900()
{
	TA_Stay(6,0,8,0,THORA_WP_OUT);
	TA_Stay(8,0,6,0,THORA_WP_OUT);
};

func void rtn_arenawait_900()
{
	TA_Stay(THORA_OUT_H,THORA_OUT_M,THORA_IN_H,THORA_IN_M,THORA_WP_OUT);
	TA_SitAround(THORA_IN_H,THORA_IN_M,THORA_OUT_H,THORA_OUT_M,"OCR_ARENABATTLE_BENCH");
};

func void rtn_prechamber_900()
{
	TA_SitAround(0,0,12,0,ARENA_WP_RIGHT_CHAMBER);
	TA_SitAround(12,0,0,0,ARENA_WP_RIGHT_CHAMBER);
};

func void rtn_arenafight_900()
{
	ta_arenafight(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenafight(12,0,0,0,ARENA_WP_RIGHT_START);
};

func void rtn_arenanpc_900()
{
	ta_arenanpc(0,0,12,0,ARENA_WP_RIGHT_START);
	ta_arenanpc(12,0,0,0,ARENA_WP_RIGHT_START);
};

func void rtn_guidetobf_900()
{
	TA_GuidePC(0,0,12,0,"OCR_ARENABATTLE_BENCH");
	TA_GuidePC(12,0,0,0,"OCR_ARENABATTLE_BENCH");
};

func void rtn_reporttogarwog_900()
{
	TA_Smalltalk(0,0,12,0,"BF_GARWOG_IN");
	TA_Smalltalk(12,0,0,0,"BF_GARWOG_IN");
};

