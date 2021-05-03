
prototype Mst_Default_BlackGobbo(C_Npc)
{
	name[0] = "schwarzer Goblin";
	guild = GIL_GOBBO;
	aivar[22] = ID_BLACKGOBBO;
	level = 12;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[3] = 700;
	aivar[4] = 4;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_BlackGobbo_Visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BlackGobboMace(Mst_Default_BlackGobbo)
{
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,itmw_nailmace);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 35;
};

instance BlackGobboWarrior(Mst_Default_BlackGobbo)
{
	level = 15;
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,itmw_notchedmace);
	attribute[ATR_STRENGTH] = 60 + 30;
	attribute[ATR_HITPOINTS_MAX] = 105;
	attribute[ATR_HITPOINTS] = 105;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	name[0] = "Goblin Krieger";
};

