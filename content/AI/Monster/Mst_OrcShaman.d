
prototype Mst_Default_OrcShaman(C_Npc)
{
	name[0] = "Ork Schamane";
	guild = GIL_ORCSHAMAN;
	npcType = npctype_guard;
	level = 50;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_Orc_Pray;
	aivar[11] = OnlyRoutine;
};

func void Set_OrcShaman_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance OrcShaman(Mst_Default_OrcShaman)
{
	Set_OrcShaman_Visuals();
	CreateInvItem(self,itar_runefireball);
	EquipItem(self,ItRwOrcstaff);
};

