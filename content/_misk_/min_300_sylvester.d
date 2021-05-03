
instance MIN_300_SYLVESTER(C_Npc)
{
	name[0] = "Sylvester";
	guild = GIL_MINER;
	npcType = npctype_ambient;
	level = 15;
	voice = 3;
	id = 300;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",2,1,"Hum_Head_Thief",71,0,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itmw_pickaxe);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,5);
	CreateInvItems(self,itfo_meatbugsoup,2);
	CreateInvItems(self,itfo_herbsoup,2);
	CreateInvItems(self,itmi_bloodorenugget,30);
	CreateInvItems(self,itmi_orenugget,10);
	CreateInvItems(self,itfo_mushroomsoup,1);
	CreateInvItems(self,ItLsTorch,5);
	EquipItem(self,itmw_pickaxe);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_Start_300;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_Start_300()
{
	TA_SitAround(8,0,20,0,"OCR_OUTSIDE_ARENA_BENCH1");
	TA_SitAround(20,0,8,0,"OCR_OUTSIDE_ARENA_BENCH1");
};

func void rtn_follow_300()
{
	TA_FollowPC(8,0,20,0,"OCR_OUTSIDE_ARENA_BENCH1");
	TA_FollowPC(20,0,8,0,"OCR_OUTSIDE_ARENA_BENCH1");
};

func void rtn_pick_300()
{
	TA_PickOre(8,0,20,0,"OW_CAVE1_OREWOLF_4");
	TA_SitAround(20,0,8,0,"OCR_OUTSIDE_ARENA_BENCH1");
};

