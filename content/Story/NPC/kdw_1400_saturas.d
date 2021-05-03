
instance KDW_1400_SATURAS(Npc_Default)
{
	name[0] = "Saturas";
	npcType = npctype_friend;
	guild = GIL_None;
	level = 29;
	voice = 14;
	id = 1400;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",7,0,kdw_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	daily_routine = Rtn_start_1400;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void Rtn_start_1400()
{
	TA_ReadBook(1,0,5,0,"NC_KDW_CAVE_CENTER");
	TA_ReadBook(5,0,1,0,"NC_KDW_CAVE_CENTER");
};

