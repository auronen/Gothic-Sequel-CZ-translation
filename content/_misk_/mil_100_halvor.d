
instance MIL_100_HALVOR(C_Npc)
{
	name[0] = "Halvor";
	guild = GIL_MILITIA;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 100;
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
	Mdl_SetVisualBody(self,"Hum_Body_CookSmith",0,1,"Hum_Head_Fighter",51,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itke_halvor);
	CreateInvItems(self,itmi_silver,20);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItems(self,itfo_meatstew,3);
	CreateInvItems(self,itfo_loaf,2);
	CreateInvItems(self,itfo_wine,2);
	CreateInvItems(self,ItLsTorch,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_100;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_100()
{
	TA_Cook(8,0,10,0,HALVOR_WP_COOKING);
	TA_Stay(10,0,10,15,HALVOR_WP_OUTSIDE);
	TA_Cook(10,15,12,0,HALVOR_WP_COOKING);
	TA_Stay(12,0,12,15,HALVOR_WP_OUTSIDE);
	TA_Cook(12,15,14,0,HALVOR_WP_COOKING);
	TA_Stay(14,0,14,15,HALVOR_WP_OUTSIDE);
	TA_Cook(14,15,16,0,HALVOR_WP_COOKING);
	TA_Stay(16,0,16,15,HALVOR_WP_OUTSIDE);
	TA_Cook(16,15,18,0,HALVOR_WP_COOKING);
	TA_Stay(18,0,18,15,HALVOR_WP_OUTSIDE);
	TA_Cook(18,15,20,0,HALVOR_WP_COOKING);
	TA_Stay(20,0,20,15,HALVOR_WP_OUTSIDE);
	TA_Cook(20,15,22,0,HALVOR_WP_COOKING);
	TA_Stay(22,0,22,15,HALVOR_WP_OUTSIDE);
	TA_Cook(22,15,0,0,HALVOR_WP_COOKING);
	TA_Sleep(0,0,8,0,"OCC_MERCS_RIGHT_ROOM_BED2");
};

