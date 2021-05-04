
instance MIL_135_MILITIA(C_Npc)
{
	name[0] = NAME_MILITIA;
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 6;
	id = 135;
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
	CreateInvItems(self,itfo_meatstew,5);
	CreateInvItems(self,itfo_loaf,3);
	CreateInvItems(self,itfo_wine,4);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_135;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_135()
{
	TA_Sleep(0,0,7,0,"OCC_MERCS_LEFT_ROOM_BED4");
	TA_PracticeSword(7,0,18,0,"OCC_WELL_RIGHT_MOVEMENT");
	TA_SitCampfire(18,0,0,0,"OCC_CAMPFIRE_S_1");
};

func void rtn_snaf_135()
{
	TA_Sleep(0,0,7,0,"OCC_MERCS_LEFT_ROOM_BED4");
	TA_PracticeSword(7,0,18,0,"OCC_WELL_RIGHT_MOVEMENT");
	ta_queueup(18,0,0,0,SNAF_WP_QUEUE2);
};
