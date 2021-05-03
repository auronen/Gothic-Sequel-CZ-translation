
prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Blutfliege";
	guild = GIL_BLOODFLY;
	aivar[22] = ID_BLOODFLY;
	level = 7;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 15;
	protection[PROT_EDGE] = 15;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 5;
	aivar[6] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[17] = OnlyRoutine;
};

func void Set_Bloodfly_Visuals()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Bloodfly(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_bloodflywings,2);
};

instance HelpBrothers_Bloodfly(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itat_bloodflywings,2);
	name[0] = "aggressive Blutfliege";
};

