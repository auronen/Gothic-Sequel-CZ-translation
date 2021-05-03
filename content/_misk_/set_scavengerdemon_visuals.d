
prototype MST_DEFAULT_SCAVENGERDEMON(C_Npc)
{
	name[0] = "dämonischer Scavenger";
	guild = GIL_SCAVENGER;
	aivar[22] = ID_SCAVENGER;
	level = 15;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 140;
	attribute[ATR_HITPOINTS] = 140;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 15;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[9] = 22;
	aivar[10] = 6;
	aivar[15] = 6;
	aivar[16] = 22;
};

func void set_scavengerdemon_visuals()
{
	Mdl_SetVisual(self,"Scavenger_Demon.mds");
	Mdl_SetVisualBody(self,"Sca_Body_Demon",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SCAVENGERDEMON(MST_DEFAULT_SCAVENGERDEMON)
{
	set_scavengerdemon_visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_demonsting,1);
};

