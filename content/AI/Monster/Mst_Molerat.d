
prototype Mst_Default_Molerat(C_Npc)
{
	name[0] = "Molerat";
	guild = GIL_MOLERAT;
	aivar[22] = ID_MOLERAT;
	level = 5;
	attribute[ATR_STRENGTH] = 8;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 5;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_Molerat_Visuals()
{
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Molerat(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_moleratgrease,2);
};

instance YMolerat(Mst_Default_Molerat)
{
	name[0] = "junge Molerat";
	level = 4;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	fight_tactic = FAI_MONSTER_COWARD;
	Set_Molerat_Visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfo_muttonraw,1);
};

