
instance DMH_1303_RANGAR(C_Npc)
{
	name[0] = "Rangar";
	guild = GIL_DEMONHUNTER;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 1303;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,dhtm_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,itmw_demonhunteraxe);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_Start_1303;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_Start_1303()
{
	TA_StandAround(8,0,20,0,"OCR_PALISADES_PLATTFORM_GUARD_RIGHT");
	TA_StandAround(20,0,8,0,"OCR_PALISADES_PLATTFORM_GUARD_RIGHT");
};

