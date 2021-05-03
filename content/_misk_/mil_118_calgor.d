
instance MIL_118_CALGOR(C_Npc)
{
	name[0] = "Calgor";
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 8;
	id = 118;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
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
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itmi_silver,11);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItems(self,itfo_meatstew,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_118;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_118()
{
	TA_Stand(6,0,10,0,"OCR_TO_HUT_22");
	TA_SitAround(10,0,12,0,"OCR_COOK01_01");
	TA_Stand(13,0,ARENAPRE_H,ARENAPRE_M,"OCR_OUTSIDE_HUT_29");
	ta_guardfp(ARENAPRE_H,ARENAPRE_M,ARENAEND_H,ARENAEND_M,"OCR_ARENA_02");
	TA_SitAround(ARENAEND_H,ARENAEND_M,6,0,"OCR_OUTSIDE_ARENA_HANGAROUND");
};

