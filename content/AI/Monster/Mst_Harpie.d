
prototype Mst_Default_Harpie(C_Npc)
{
	name[0] = "Harpie";
	guild = GIL_DEMON;
	aivar[22] = ID_HARPIE;
	level = 20;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 85;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Demon;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 2500;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[3] = 2000;
	aivar[4] = 3;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_Harpie_Visuals()
{
	Mdl_SetVisual(self,"Harpie.mds");
	Mdl_SetVisualBody(self,"Har_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Harpie(Mst_Default_Harpie)
{
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
};

