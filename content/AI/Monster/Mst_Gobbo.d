
prototype Mst_Default_GreenGobbo(C_Npc)
{
	name[0] = "Goblin";
	guild = GIL_GOBBO;
	aivar[22] = ID_GOBBO;
	level = 6;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 4;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_GreenGobbo_Visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GreenGobboClub(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	fight_tactic = FAI_MONSTER_COWARD;
	Npc_SetToFightMode(self,itmw_club);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 5;
};

instance GreenGobboSword(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	Npc_SetToFightMode(self,itmw_rustysword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

