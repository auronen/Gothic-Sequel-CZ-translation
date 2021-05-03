
instance WRK_203_BROMOR(C_Npc)
{
	name[0] = "Bromor";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 10;
	voice = 9;
	id = 203;
	attribute[ATR_STRENGTH] = 100;
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
	Mdl_ApplyOverlayMds(self,"Humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,3);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,14);
	CreateInvItems(self,itfo_meatbugsoup,2);
	EquipItem(self,itmw_nailmace);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_203;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_203()
{
	ta_studyscroll(8,0,8,5,"OCR_LAKE_1");
	ta_studyscroll(8,5,8,15,"OCR_LAKE_3");
	ta_studyscroll(8,15,8,25,"OCR_LAKE_9");
	ta_studyscroll(8,25,8,35,"OCR_LAKE_6");
	ta_studyscroll(8,35,9,0,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	ta_studyscroll(9,0,9,5,"OCR_LAKE_1");
	ta_studyscroll(9,5,9,15,"OCR_LAKE_3");
	ta_studyscroll(9,15,9,25,"OCR_LAKE_9");
	ta_studyscroll(9,25,9,35,"OCR_LAKE_6");
	ta_studyscroll(9,35,10,0,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	ta_studyscroll(10,0,10,5,"OCR_LAKE_1");
	ta_studyscroll(10,5,10,15,"OCR_LAKE_3");
	ta_studyscroll(10,15,10,25,"OCR_LAKE_9");
	ta_studyscroll(10,25,10,35,"OCR_LAKE_6");
	ta_studyscroll(10,35,11,0,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	TA_Boss(11,0,14,0,"OCR_WASH_1");
	ta_studyscroll(14,0,14,5,"OCR_LAKE_1");
	ta_studyscroll(14,5,14,15,"OCR_LAKE_3");
	ta_studyscroll(14,15,14,25,"OCR_LAKE_9");
	ta_studyscroll(14,25,14,35,"OCR_LAKE_6");
	ta_studyscroll(14,35,15,0,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	TA_Boss(15,0,19,30,"OCR_WASH_1");
	TA_Sleep(19,30,8,0,"OCR_HUT_8");
};

