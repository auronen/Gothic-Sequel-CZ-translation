
instance POS_602_HALBERT(C_Npc)
{
	name[0] = "Halbert";
	guild = GIL_POSSESSED;
	npcType = npctype_ambient;
	level = 1;
	voice = 2;
	id = 602;
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
	Mdl_SetVisualBody(self,"hum_body_possessed",0,0,"Hum_Head_Bald",21,3,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,1);
	CreateInvItems(self,itfo_booze,1);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_602;
};


func void Rtn_start_602()
{
	ta_possessedsleep(8,0,20,0,"OCR_GHETTO_HUT_03");
	ta_walkidiot(20,0,21,0,"OCR_GHETTO_3");
	ta_walkidiot(21,0,22,0,"OCR_GHETTO_15");
	ta_walkidiot(22,0,23,0,"OCR_GHETTO_3");
	ta_walkidiot(23,0,0,0,"OCR_GHETTO_15");
	ta_walkidiot(0,0,1,0,"OCR_GHETTO_3");
	ta_walkidiot(1,0,2,0,"OCR_GHETTO_15");
	ta_walkidiot(2,0,3,0,"OCR_GHETTO_3");
	ta_walkidiot(3,0,4,0,"OCR_GHETTO_15");
	ta_walkidiot(4,0,5,0,"OCR_GHETTO_3");
	ta_walkidiot(5,0,6,0,"OCR_GHETTO_15");
	ta_walkidiot(6,0,7,0,"OCR_GHETTO_3");
	ta_walkidiot(7,0,8,0,"OCR_GHETTO_15");
};

