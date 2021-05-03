
instance MIL_103_BERENGAR(C_Npc)
{
	name[0] = "Berengar";
	guild = GIL_MILITIA;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 103;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
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
	Mdl_ApplyOverlayMds(self,"humans_arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itam_arrow,20);
	CreateInvItems(self,itfo_meatbugsoup,8);
	CreateInvItems(self,itfo_loaf,5);
	CreateInvItems(self,itfo_mutton,4);
	CreateInvItems(self,itmi_silver,37);
	CreateInvItems(self,itfo_booze,5);
	CreateInvItems(self,ItLsTorch,7);
	CreateInvItems(self,ItFo_Potion_Health_02,10);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItems(self,itfo_meatstew,3);
	CreateInvItems(self,itfo_wine,2);
	EquipItem(self,itrw_longbow);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_103;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_103()
{
	TA_SitAround(0,0,20,0,"OCC_BARONS_GREATHALL_RIGHT_BACK");
	TA_SitAround(20,0,0,0,"OCC_BARONS_GREATHALL_RIGHT_BACK");
};

