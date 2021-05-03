
instance WRK_224_IGARAZ(C_Npc)
{
	name[0] = "Igaraz";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 8;
	voice = 2;
	id = 224;
	attribute[ATR_STRENGTH] = 50;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Bald",71,4,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,itfo_beer,7);
	CreateInvItems(self,itfo_mutton,3);
	CreateInvItems(self,itfo_ham,3);
	CreateInvItems(self,itfo_wine,2);
	CreateInvItems(self,itfo_muttonraw,6);
	CreateInvItems(self,itmi_silver,30);
	CreateInvItems(self,itfo_meatbugsoup,2);
	CreateInvItems(self,itfo_mushroomstew,5);
	CreateInvItems(self,itfo_meatpie,3);
	CreateInvItems(self,itfo_loaf,4);
	EquipItem(self,itmw_nailmace);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_prestart_224;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_prestart_224()
{
	TA_Walk(8,0,20,0,IGARAZ_WP);
	TA_Walk(20,0,8,0,IGARAZ_WP);
};

func void Rtn_start_224()
{
	TA_SitAround(8,0,20,0,"OCR_OUTSIDE_MERC1");
	TA_Sleep(20,0,8,0,"OCR_HUT_51");
};

func void rtn_guidearena_224()
{
	TA_GuidePC(8,0,20,0,IGARAZ_WP);
	TA_GuidePC(20,0,8,0,IGARAZ_WP);
};

func void rtn_guidehealer_224()
{
	TA_GuidePC(8,0,20,0,IGARAZ_WP);
	TA_GuidePC(20,0,8,0,IGARAZ_WP);
};

func void rtn_guideworker_224()
{
	TA_GuidePC(8,0,20,0,IGARAZ_WP);
	TA_GuidePC(20,0,8,0,IGARAZ_WP);
};

func void rtn_guidetrader_224()
{
	TA_GuidePC(8,0,20,0,IGARAZ_WP);
	TA_GuidePC(20,0,8,0,IGARAZ_WP);
};

