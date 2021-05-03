
instance MIL_133_MILITIA(C_Npc)
{
	name[0] = NAME_MILITIA;
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 7;
	id = 133;
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
	CreateInvItems(self,itmi_silver,13);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItems(self,itfo_meatstew,2);
	CreateInvItems(self,itfo_loaf,1);
	CreateInvItems(self,itfo_wine,1);
	CreateInvItems(self,ItLsTorch,1);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_133;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_133()
{
	TA_Sleep(2,30,13,0,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
	TA_SitCampfire(13,0,16,0,"OCC_CAMPFIRE_E_1");
	TA_Listen(16,0,19,30,"OCC_SHADOWS_CORNER_MOVEMENT3");
	TA_SitCampfire(19,30,2,30,"OCC_CAMPFIRE_E_1");
};

func void rtn_snaf_133()
{
	TA_Sleep(22,30,13,0,"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
	ta_queueup(13,0,16,0,SNAF_WP_QUEUE1);
	TA_Listen(16,0,19,30,"OCC_SHADOWS_CORNER_MOVEMENT3");
	ta_queueup(19,30,22,30,SNAF_WP_QUEUE1);
};

