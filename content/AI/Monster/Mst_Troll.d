
prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "Troll";
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

func void Set_Troll_Visuals()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Troll(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
};

instance YoungTroll(Mst_Default_Troll)
{
	name[0] = "junger Troll";
	guild = GIL_TROLL;
	aivar[22] = ID_TROLL;
	level = 100;
	id = mid_youngtroll;
	Set_Troll_Visuals();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	Npc_SetToFistMode(self);
	fight_tactic = FAI_TROLL;
	damagetype = DAM_FLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 3000;
	aivar[AIV_BEENATTACKED] = 2500;
	aivar[3] = 2000;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

