
instance WRK_219_BOTHOLO(C_Npc)
{
	name[0] = "Botholo";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 8;
	voice = 6;
	id = 217;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,3);
	CreateInvItems(self,itfo_meatbugsoup,1);
	EquipItem(self,itmw_club);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_219;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_219()
{
	ta_stonemason(8,0,18,0,"OCR_STONE_02");
	TA_SitCampfire(18,0,0,0,"OCR_OUTSIDE_HUT_69");
	TA_Sleep(0,0,8,0,"OCR_HUT_71_B");
};

