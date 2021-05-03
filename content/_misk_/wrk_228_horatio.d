
instance WRK_228_HORATIO(C_Npc)
{
	name[0] = "Horatio";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 8;
	voice = 9;
	id = 228;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",99,2,-1);
	Mdl_SetModelFatness(self,0);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_meatbugsoup,2);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_228;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_228()
{
	ta_stonemason(8,0,12,0,"OCR_STONE_03");
	TA_SitCampfire(12,0,15,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	ta_stonemason(15,0,18,0,"OCR_STONE_03");
	TA_SitCampfire(18,0,0,0,"OCR_CAMPFIRE_A_MOVEMENT1");
	TA_Sleep(0,0,8,0,"OCR_HUT_6_A");
};

