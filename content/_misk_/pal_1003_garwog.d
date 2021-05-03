
instance PAL_1003_GARWOG(C_Npc)
{
	name[0] = "Garwog";
	guild = GIL_PALADIN;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 1003;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,pals_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,itmw_paladinsword);
	EquipItem(self,itrw_heavycrossbow);
	CreateInvItems(self,itam_bolt,100);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_1003;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_1003()
{
	TA_Boss(0,0,12,0,"BF_GARWOG_OUT");
	TA_Boss(12,0,0,0,"BF_GARWOG_OUT");
};

func void rtn_reportfromthora_1003()
{
	TA_Smalltalk(0,0,12,0,"BF_GARWOG_IN");
	TA_Smalltalk(12,0,0,0,"BF_GARWOG_IN");
};

