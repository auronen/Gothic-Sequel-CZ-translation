
instance THF_410_VITO(C_Npc)
{
	name[0] = "Vito";
	guild = GIL_THIEF;
	npcType = npctype_main;
	level = 10;
	voice = 7;
	id = 410;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Fighter",43,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itfo_cheese,1);
	CreateInvItems(self,itmi_silver,2);
	CreateInvItems(self,itfo_apple,2);
	EquipItem(self,itmw_scythe);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_410;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_410()
{
	TA_SitCampfire(8,0,20,0,"VP_CAMPFIRE_1");
	TA_SitCampfire(20,0,8,0,"VP_CAMPFIRE_1");
};

