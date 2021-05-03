
prototype MST_DEFAULT_TROLLDEMON(C_Npc)
{
	name[0] = "Troll-Dämon";
	guild = GIL_TROLL;
	aivar[22] = ID_TROLL;
	level = 200;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 110;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void set_trolldemon_visuals()
{
	Mdl_SetVisual(self,"Troll_Demon.mds");
	Mdl_SetVisualBody(self,"Tro_Body_Demon",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance TROLLDEMON(MST_DEFAULT_TROLLDEMON)
{
	set_trolldemon_visuals();
	Npc_SetToFistMode(self);
};

