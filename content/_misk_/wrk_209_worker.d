
instance WRK_209_WORKER(C_Npc)
{
	name[0] = NAME_WORKER;
	guild = GIL_WORKER;
	npcType = npctype_ambient;
	level = 8;
	voice = 11;
	id = 209;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itmi_hammer);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,6);
	CreateInvItems(self,itfo_meatbugsoup,1);
	EquipItem(self,itmw_nailmace);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_209;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_209()
{
	TA_RepairHut(8,0,18,0,"CONSTRUCT_UP_03");
	TA_SitAround(18,0,0,0,"OCR_OUTSIDE_HUT_68_BENCH");
	TA_Sleep(0,0,8,0,"OCR_HUT_69_B");
};

