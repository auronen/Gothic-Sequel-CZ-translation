
instance POS_603_GONKER(C_Npc)
{
	name[0] = "Gonker";
	guild = GIL_POSSESSED;
	npcType = npctype_ambient;
	level = 1;
	voice = 2;
	id = 603;
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
	Mdl_SetModelFatness(self,0);
	CreateInvItems(self,itfo_booze,1);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_603;
};


func void Rtn_start_603()
{
	ta_walkidiot(8,0,9,0,"OCR_GHETTO_3");
	ta_walkidiot(9,0,10,0,"OCR_GHETTO_15");
	ta_walkidiot(10,0,11,0,"OCR_GHETTO_3");
	ta_walkidiot(11,0,12,0,"OCR_GHETTO_15");
	ta_walkidiot(12,0,13,0,"OCR_GHETTO_3");
	ta_walkidiot(13,0,14,0,"OCR_GHETTO_15");
	ta_walkidiot(14,0,15,0,"OCR_GHETTO_3");
	ta_walkidiot(15,0,16,0,"OCR_GHETTO_15");
	ta_walkidiot(16,0,17,0,"OCR_GHETTO_3");
	ta_walkidiot(17,0,18,0,"OCR_GHETTO_15");
	ta_walkidiot(18,0,19,0,"OCR_GHETTO_3");
	ta_walkidiot(19,0,20,0,"OCR_GHETTO_15");
	ta_possessedsleep(20,0,8,0,"OCR_GHETTO_HUT_04");
};

