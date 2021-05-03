
instance MIL_109_MILITIA(C_Npc)
{
	name[0] = NAME_MILITIA;
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 4;
	id = 109;
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
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itam_arrow,20);
	CreateInvItems(self,itmi_silver,9);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItems(self,itfo_meatstew,4);
	CreateInvItems(self,itfo_wine,2);
	EquipItem(self,itrw_longbow);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_RANGED;
	daily_routine = Rtn_start_109;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_109()
{
	ta_guardfp(ARENAEND_H,ARENAEND_M,11,0,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_SitAround(12,0,14,0,"OCR_COOK01_01");
	TA_SitAround(13,0,ARENAPRE_H,ARENAPRE_M,"OCR_OUTSIDE_ARENA_HANGAROUND");
	ta_guardfp(ARENAPRE_H,ARENAPRE_M,ARENAEND_H,ARENAEND_M,"OCR_ARENA_05");
};

