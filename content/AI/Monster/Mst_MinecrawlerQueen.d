
prototype Mst_Default_MinecrawlerQueen(C_Npc)
{
	name[0] = "Minecrawler Königin";
	guild = GIL_MINECRAWLER;
	aivar[22] = ID_MINECRAWLERQUEEN;
	level = 200;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLERQUEEN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 1;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_MinecrawlerQueen_Visuals()
{
	Mdl_SetVisual(self,"CrwQueen.mds");
	Mdl_SetVisualBody(self,"CrQ_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MinecrawlerQueen(Mst_Default_MinecrawlerQueen)
{
	Set_MinecrawlerQueen_Visuals();
	Npc_SetToFistMode(self);
};

