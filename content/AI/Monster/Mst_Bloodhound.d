
prototype Mst_Default_Bloodhound(C_Npc)
{
	name[0] = "Bluthund";
	guild = GIL_SHADOWBEAST;
	aivar[22] = ID_BLOODHOUND;
	level = 22;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 55;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2500;
	aivar[AIV_BEENATTACKED] = 2000;
	aivar[3] = 1800;
	aivar[4] = 2;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void Set_Bloodhound_Visuals()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Bhd_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Bloodhound(Mst_Default_Bloodhound)
{
	Set_Bloodhound_Visuals();
	Npc_SetToFistMode(self);
};

