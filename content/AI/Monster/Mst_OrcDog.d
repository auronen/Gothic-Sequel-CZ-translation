
prototype Mst_Default_OrcDog(C_Npc)
{
	name[0] = "Orc-Hund";
	guild = GIL_ORCDOG;
	aivar[22] = ID_BLACKWOLF;
	level = 12;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORCDOG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1800;
	aivar[3] = 1500;
	aivar[4] = 5;
	aivar[5] = 15;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_OrcDog_Visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Dog_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance OrcDog(Mst_Default_OrcDog)
{
	Set_OrcDog_Visuals();
	Npc_SetToFistMode(self);
};

