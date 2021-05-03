
instance DMC_801_DEMONIC(C_Npc)
{
	name[0] = NAME_DEMONIC;
	guild = GIL_DEMONIC;
	npcType = npctype_ambient;
	level = 40;
	voice = 8;
	id = 801;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"humans_mage.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Bald",82,1,dmc_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,itmw_2hsword);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = Rtn_start_801;
};


func void Rtn_start_801()
{
	TA_Stay(8,0,20,0,"???");
	TA_Stay(20,0,8,0,"???");
};

