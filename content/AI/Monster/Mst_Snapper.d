
prototype Mst_Default_Snapper(C_Npc)
{
	name[0] = "Snapper";
	guild = GIL_SNAPPER;
	aivar[22] = ID_SNAPPER;
	level = 22;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2200;
	aivar[AIV_BEENATTACKED] = 1800;
	aivar[3] = 1500;
	aivar[4] = 3;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_Snapper_Visuals()
{
	Mdl_SetVisual(self,"Snapper.mds");
	Mdl_SetVisualBody(self,"Sna_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Snapper(Mst_Default_Snapper)
{
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);
};

instance HURTSNAPPER(Mst_Default_Snapper)
{
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_HITPOINTS] = 20;
};

