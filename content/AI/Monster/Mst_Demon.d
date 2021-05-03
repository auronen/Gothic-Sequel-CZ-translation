
prototype Mst_Default_Demon(C_Npc)
{
	name[0] = "Flammendämon";
	guild = GIL_DEMON;
	aivar[22] = ID_DEMON;
	level = 50;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 500;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_Demon;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2800;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[3] = 2000;
	aivar[4] = 3;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_Demon_Visuals()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
};

instance SummonedByPC_Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[20] = 400;
	aivar[21] = 1;
	aivar[23] = TRUE;
};

instance SummonedByNPC_Demon(Mst_Default_Demon)
{
	Set_Demon_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_Summoned;
};

