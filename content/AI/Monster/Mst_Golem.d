
prototype Mst_Default_Golem(C_Npc)
{
	name[0] = "Golem";
	guild = GIL_GOLEM;
	level = 100;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 9999;
	protection[PROT_EDGE] = 9999;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	damagetype = DAM_FLY;
	fight_tactic = FAI_GOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[3] = 1500;
	aivar[4] = 0;
	aivar[5] = 5;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[11] = OnlyRoutine;
};

func void Set_StoneGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_FireGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_IceGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance StoneGolem(Mst_Default_Golem)
{
	name[0] = "Stein Golem";
	aivar[22] = id_stonegolem;
	protection[PROT_BLUNT] = 75;
	Set_StoneGolem_Visuals();
	CreateInvItem(self,itat_stonegolemheart);
	Npc_SetToFistMode(self);
};

instance SummonedByPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Golem";
	aivar[22] = ID_STONEGOLEM;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 75;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[20] = 400;
	aivar[21] = 2;
	aivar[23] = TRUE;
};

instance SummonedByNPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Stein Golem";
	aivar[22] = ID_STONEGOLEM;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	protection[PROT_BLUNT] = 75;
	start_aistate = ZS_MM_Summoned;
};

instance FireGolem(Mst_Default_Golem)
{
	name[0] = "Feuer Golem";
	aivar[22] = id_firegolem;
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 50;
	protection[PROT_MAGIC] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	damagetype = DAM_FIRE;
	CreateInvItem(self,itat_firegolemheart);
};

instance IceGolem(Mst_Default_Golem)
{
	name[0] = "Eis Golem";
	aivar[22] = id_icegolem;
	Set_IceGolem_Visuals();
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_FIRE] = 0;
	damagetype = DAM_BLUNT;
	CreateInvItem(self,itat_icegolemheart);
	CreateInvItem(self,itat_icegolempiece);
	fight_tactic = FAI_HUMAN_MAGE;
};

