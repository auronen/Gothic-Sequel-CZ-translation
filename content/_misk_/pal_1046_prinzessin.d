
instance PAL_1046_PRINZESSIN(C_Npc)
{
	name[0] = "Prinzessin";
	guild = GIL_PALADIN;
	npcType = NPCTYPE_FEMALE;
	level = 35;
	voice = 16;
	id = 1046;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 300;
	attribute[ATR_MANA] = 300;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"babe.mds");
	Mdl_SetVisualBody(self,"Bab_Body_Princess",3,1,"Bab_Head_Hair1.mms",4,0,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_STAFF,2);
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = rtn_start_1046;
	senses_range = 2000;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[37] = TRUE;
};


func void rtn_start_1046()
{
	TA_Stay(0,0,12,0,"BF_PRINCESS_1");
	TA_Stay(12,0,0,0,"BF_PRINCESS_1");
};

func void rtn_bath_1046()
{
	TA_Bathing_Babe(0,0,12,0,"BF_PRINCESS_WASH");
	TA_Bathing_Babe(12,0,0,0,"BF_PRINCESS_WASH");
};

func void rtn_suicide_1046()
{
	TA_Stay(0,0,12,0,"BF_PRINCESS_SUICIDE");
	TA_Stay(12,0,0,0,"BF_PRINCESS_SUICIDE");
};

