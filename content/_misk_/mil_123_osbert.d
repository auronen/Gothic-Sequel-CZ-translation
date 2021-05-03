
instance MIL_123_OSBERT(C_Npc)
{
	name[0] = "Osbert";
	guild = GIL_MILITIA;
	npcType = npctype_main;
	level = 10;
	voice = 7;
	id = 123;
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
	Mdl_ApplyOverlayMds(self,"humans_arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itmi_silver,16);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItems(self,itfo_meatstew,3);
	CreateInvItems(self,itfo_wine,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_guardebr_123;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_123()
{
	TA_Boss(8,0,10,0,"OCR_TO_MAINGATE");
	TA_Listen(10,0,13,0,"OCC_SHADOWS_CORNER_02");
	TA_SitCampfire(13,0,14,0,"OCC_CENTER_4_PATH2");
	TA_Boss(14,0,8,0,"OCR_TO_MAINGATE");
};

func void rtn_guardebr_123()
{
	ta_guardwp(8,0,14,0,"OCC_BARONS_CENTER");
	ta_guardwp(14,0,20,0,"OCC_BARONS_CENTER");
	ta_guardwp(20,0,2,0,"OCC_BARONS_CENTER");
	ta_guardwp(2,0,8,0,"OCC_BARONS_CENTER");
};

