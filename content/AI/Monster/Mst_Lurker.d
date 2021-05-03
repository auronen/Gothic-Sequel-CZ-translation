
prototype Mst_Default_Lurker(C_Npc)
{
	name[0] = "Lurker";
	guild = GIL_LURKER;
	aivar[22] = ID_LURKER;
	level = 17;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_Lurker_Visuals()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Lurker(Mst_Default_Lurker)
{
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
};

