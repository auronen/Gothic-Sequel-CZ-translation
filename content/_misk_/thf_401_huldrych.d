
instance THF_401_HULDRYCH(C_Npc)
{
	name[0] = "Huldrych";
	guild = GIL_THIEF;
	npcType = npctype_main;
	level = 20;
	voice = 5;
	id = 401;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
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
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Fighter",55,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	CreateInvItems(self,itam_arrow,20);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_herbsoup,3);
	CreateInvItems(self,itfo_apple,2);
	CreateInvItems(self,itfo_wine,2);
	EquipItem(self,itmw_nailmace);
	EquipItem(self,itrw_shortbow);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_401;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_401()
{
	TA_StandAround(8,0,12,0,"OCR_OUTSIDE_HUT_78");
	TA_StandAround(12,0,22,0,"OCR_OUTSIDE_HUT_78");
	TA_Sleep(22,0,8,0,"OCR_HUT_78");
};

