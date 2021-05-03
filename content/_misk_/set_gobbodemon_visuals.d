
prototype MST_DEFAULT_GOBBODEMON(C_Npc)
{
	name[0] = "untoter Goblin";
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

func void set_gobbodemon_visuals()
{
	Mdl_SetVisual(self,"Gobbo_Demon.mds");
	Mdl_SetVisualBody(self,"Gob_Body_Demon",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GOBBODEMON(MST_DEFAULT_GOBBODEMON)
{
	set_gobbodemon_visuals();
	Npc_SetToFightMode(self,itmw_nailmace);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 35;
};

