
instance MIL_120_JULIUS(C_Npc)
{
	name[0] = "Julius";
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 8;
	id = 120;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
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
	CreateInvItems(self,itmi_silver,7);
	CreateInvItems(self,itfo_loaf,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_120;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_120()
{
	TA_SitAround(7,0,0,0,"OCC_STABLE_BACK_2");
	TA_Smalltalk(0,0,7,0,"OCC_STABLE_ENTRANCE_INSERT");
};
