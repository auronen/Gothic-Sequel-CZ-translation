
prototype Mst_Default_FireWaran(C_Npc)
{
	name[0] = "Feuerwaran";
	guild = GIL_WARAN;
	aivar[22] = ID_FIREWARAN;
	level = 50;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_FIRE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_FireWaran_Visuals()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_ApplyOverlayMds(self,"Firewaran.mds");
	Mdl_SetVisualBody(self,"War_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance FireWaran(Mst_Default_FireWaran)
{
	Set_FireWaran_Visuals();
	Npc_SetToFistMode(self);
};

