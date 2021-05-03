
instance BEG_705_BEGGAR(C_Npc)
{
	name[0] = NAME_BEGGAR;
	guild = GIL_BEGGAR;
	npcType = npctype_ambient;
	level = 10;
	voice = 2;
	id = 705;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",2,2,"Hum_Head_Bald",5,1,beg_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	CreateInvItem(self,itfo_moleratsoup);
	CreateInvItem(self,itfo_booze);
	CreateInvItems(self,itmi_silver,3);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_705;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_705()
{
	TA_SitAround(8,0,20,0,"OCR_HUT_27");
	TA_Sleep(20,0,8,0,"OCR_HUT_24");
};

func void rtn_arenaspectator_705()
{
	TA_ArenaSpectator(8,0,20,0,"OCR_ARENA_06");
	TA_ArenaSpectator(20,0,8,0,"OCR_ARENA_06");
};

