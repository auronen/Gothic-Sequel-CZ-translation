
instance POS_604_POSSESSED(C_Npc)
{
	name[0] = NAME_POSSESSED;
	guild = GIL_POSSESSED;
	npcType = npctype_ambient;
	level = 1;
	voice = 2;
	id = 604;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_possessed",0,0,"Hum_Head_Bald",22,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	CreateInvItems(self,itfo_booze,1);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_604;
};


func void Rtn_start_604()
{
	ta_walkidiot(8,0,20,0,"OC_MOAT_20");
	ta_possessedsleep(20,0,8,0,"OCR_GHETTO_HUT_05");
};

