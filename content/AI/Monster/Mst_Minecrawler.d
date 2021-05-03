
prototype Mst_Default_Minecrawler(C_Npc)
{
	name[0] = "Minecrawler";
	guild = GIL_MINECRAWLER;
	aivar[22] = ID_MINECRAWLER;
	level = 13;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[3] = 1000;
	aivar[4] = 2;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[17] = OnlyRoutine;
};

func void Set_Minecrawler_Visuals()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Crw_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MineCrawler(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
};

instance OC_MINECRAWLER(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 500;
	protection[PROT_EDGE] = 500;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 500;
	aivar[11] = OnlyRoutine;
};

