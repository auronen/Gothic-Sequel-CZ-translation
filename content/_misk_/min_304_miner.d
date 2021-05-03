
instance MIN_304_MINER(C_Npc)
{
	name[0] = NAME_MINER;
	guild = GIL_MINER;
	npcType = npctype_ambient;
	level = 8;
	voice = 9;
	id = 304;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
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
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",3,1,"Hum_Head_Thief",71,0,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itfo_loaf,4);
	CreateInvItems(self,itmi_silver,11);
	CreateInvItems(self,itfo_beer,1);
	CreateInvItems(self,ItLsTorch,3);
	CreateInvItems(self,itmi_orenugget,12);
	CreateInvItems(self,itfo_mushroomsoup,1);
	EquipItem(self,itmw_pickaxe);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_304;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_304()
{
	TA_StandAround(8,0,20,0,"OW_E6_14");
	TA_StandAround(20,0,8,0,"OW_E6_14");
};

