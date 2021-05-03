
prototype Mst_Default_OrcWarrior(C_Npc)
{
	name[0] = "Ork Krieger";
	guild = GIL_ORCWARRIOR;
	npcType = npctype_guard;
	voice = 17;
	level = 25;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 55;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 700;
	aivar[4] = 5;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = zs_guardfp;
};

func void Set_OrcWarrior_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcWarrior1(Mst_Default_OrcWarrior)
{
	name[0] = "Ork Kämpfer";
	level = 25;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 55;
	attribute[ATR_HITPOINTS_MAX] = 210;
	attribute[ATR_HITPOINTS] = 210;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	EquipItem(self,itmw_orcaxe);
};

instance OrcWarrior2(Mst_Default_OrcWarrior)
{
	name[0] = "Ork Krieger";
	level = 30;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_HITPOINTS_MAX] = 230;
	attribute[ATR_HITPOINTS] = 230;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 35;
	EquipItem(self,itmw_orcaxe);
};

instance OrcWarrior3(Mst_Default_OrcWarrior)
{
	name[0] = "Ork Klankrieger";
	level = 35;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	EquipItem(self,itmw_orcaxe);
};

instance OrcWarrior4(Mst_Default_OrcWarrior)
{
	name[0] = "Ork Tempelkrieger";
	level = 40;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 45;
	EquipItem(self,itmw_orcaxe);
};

