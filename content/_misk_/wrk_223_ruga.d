
instance WRK_223_RUGA(C_Npc)
{
	name[0] = "Ruga";
	guild = GIL_WORKER;
	npcType = NPCTYPE_TRD_AMBIENT;
	level = 8;
	voice = 9;
	id = 223;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itmi_silver,50);
	CreateInvItems(self,itfo_meatbugpie,3);
	CreateInvItems(self,itfo_wine,4);
	EquipItem(self,itmw_notchedmace);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_223;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_223()
{
	ta_armormaker(8,0,20,0,"OCR_HUT_45");
	TA_Sleep(20,0,8,0,"OCR_HUT_45");
};

