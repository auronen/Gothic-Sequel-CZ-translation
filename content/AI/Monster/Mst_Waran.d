
prototype Mst_Default_Waran(C_Npc)
{
	name[0] = "Waran";
	guild = GIL_WARAN;
	aivar[22] = ID_WARAN;
	level = 8;
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
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1100;
	aivar[3] = 700;
	aivar[4] = 2;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_Waran_Visuals()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Waran(Mst_Default_Waran)
{
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
};

