
prototype Mst_Default_OrcScout(C_Npc)
{
	name[0] = "Orc Jäger";
	guild = GIL_ORCSCOUT;
	npcType = npctype_guard;
	voice = 17;
	level = 20;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_Strong;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2500;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_GuardPatrol;
};

func void Set_OrcScout_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyScout",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcScout(Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals();
	EquipItem(self,itmw_orcsword);
};

instance OrcPeasantEatAndDrink(Mst_Default_OrcScout)
{
	guild = GIL_ORCSCOUT;
	name[0] = "Ork";
	Set_OrcScout_Visuals();
	CreateInvItem(self,itmw_orcsword);
	start_aistate = ZS_Orc_EatAndDrink;
};

instance OrcScoutGYD(Mst_Default_OrcScout)
{
	name[0] = "Orc Späher";
	level = 18;
	attribute[ATR_STRENGTH] = 30;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[3] = 1000;
	aivar[4] = 0;
	aivar[5] = 10;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
	Set_OrcScout_Visuals();
	EquipItem(self,itmw_orcsword);
};

