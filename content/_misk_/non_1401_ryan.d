
instance NON_1401_RYAN(C_Npc)
{
	name[0] = "Ryan";
	guild = GIL_None;
	npcType = npctype_ambient;
	level = 8;
	voice = 9;
	id = 1401;
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
	Mdl_ApplyOverlayMds(self,"Humans_tired.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itfo_muttonraw,100);
	CreateInvItems(self,itmi_silver,40);
	CreateInvItems(self,itfo_meatbugsoup,2);
	EquipItem(self,itrw_riderbow);
	EquipItem(self,itmw_nailmace);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_1401;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_1401()
{
	TA_SitAround(8,0,23,0,"OCR_OUTSIDE_HUT_55_BENCH");
	TA_SitAround(23,0,8,0,"OCR_OUTSIDE_HUT_55_BENCH");
};

