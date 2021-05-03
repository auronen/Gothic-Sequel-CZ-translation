
prototype Mst_Default_Meatbug(C_Npc)
{
	name[0] = "Fleischwanze";
	guild = GIL_MEATBUG;
	aivar[22] = ID_MEATBUG;
	level = 1;
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = 500;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[17] = OnlyRoutine;
};

func void Set_Meatbug_Visuals()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Meatbug(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_1(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_2(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_3(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_4(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_5(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_6(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_7(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_8(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

instance ACID_MEATBUG_9(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_meatbug,1);
};

