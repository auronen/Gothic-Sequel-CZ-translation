
instance WRK_222_HELVEGOR(C_Npc)
{
	name[0] = "Helvegor";
	guild = GIL_WORKER;
	npcType = NPCTYPE_TRD_AMBIENT;
	level = 8;
	voice = 1;
	id = 222;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
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
	CreateInvItems(self,itmi_silver,2);
	CreateInvItems(self,itfo_meatbugsoup,1);
	EquipItem(self,itmw_shortsword);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_222;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_222()
{
	ta_bowmaker(8,0,20,0,"OCR_OUTSIDE_HUT_48");
	TA_Sleep(20,0,8,0,"OCR_HUT_53");
};

