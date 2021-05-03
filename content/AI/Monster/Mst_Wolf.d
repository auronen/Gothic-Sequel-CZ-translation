
prototype Mst_Default_Wolf(C_Npc)
{
	name[0] = "Wolf";
	guild = GIL_WOLF;
	aivar[22] = ID_WOLF;
	level = 9;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[3] = 500;
	aivar[4] = 3;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_Wolf_Visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Wolf(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
};

instance OREWOLF(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	aivar[9] = OnlyRoutine;
};

