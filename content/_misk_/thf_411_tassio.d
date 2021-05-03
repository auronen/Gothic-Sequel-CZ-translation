
instance THF_411_TASSIO(C_Npc)
{
	name[0] = "Tassio";
	guild = GIL_THIEF;
	npcType = npctype_main;
	level = 4;
	voice = 10;
	id = 411;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 60;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Fighter",46,2,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	CreateInvItems(self,itfo_loaf,1);
	CreateInvItems(self,itfo_beer,2);
	EquipItem(self,itmw_poker);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_411;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_411()
{
	TA_SitCampfire(8,0,20,0,"VP_CAMPFIRE_1");
	TA_SitCampfire(20,0,8,0,"VP_CAMPFIRE_1");
};

