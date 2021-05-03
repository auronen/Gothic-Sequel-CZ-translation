
instance MIL_101_WYLFERN(C_Npc)
{
	name[0] = "Wylfern";
	guild = GIL_MILITIA;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 101;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 75;
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
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itri_fire_01);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_meatstew,3);
	CreateInvItems(self,itfo_loaf,2);
	CreateInvItems(self,itfo_wine,2);
	CreateInvItems(self,ItLsTorch,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_101;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_101()
{
	TA_PracticeSword(7,0,16,0,"OCC_WELL_RIGHT_MOVEMENT5");
	TA_SitCampfire(16,0,22,0,"OCC_CAMPFIRE_S_1");
	TA_Sleep(22,0,7,0,"OCC_MERCS_UPPER_LEFT_ROOM_BED3");
};

func void rtn_rush_101()
{
	TA_GuidePC(0,0,12,0,"OCC_WELL_RIGHT_MOVEMENT5");
	TA_GuidePC(12,0,0,0,"OCC_WELL_RIGHT_MOVEMENT5");
};

