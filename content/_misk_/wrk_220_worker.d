
instance WRK_220_WORKER(C_Npc)
{
	name[0] = NAME_WORKER;
	guild = GIL_WORKER;
	npcType = npctype_ambient;
	level = 8;
	voice = 1;
	id = 220;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_booze);
	CreateInvItems(self,itmi_silver,6);
	CreateInvItems(self,itfo_meatbugsoup,1);
	EquipItem(self,itmw_club);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_220;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_220()
{
	ta_stonemason(12,0,15,0,"OCR_STONE_03");
	TA_SitCampfire(15,0,23,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	TA_Sleep(23,0,12,0,"OCR_HUT_7_C");
};

