
prototype Mst_Default_Skeleton(C_Npc)
{
	name[0] = "Skelett";
	guild = GIL_SKELETON;
	level = 25;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 35;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 35;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SKELETON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[3] = 1500;
	aivar[4] = 0;
	aivar[5] = 5;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_Skeleton_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body3",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonScout_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_SetVisualBody(self,"Ske_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_SkeletonMage_Visuals()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};


instance Skeleton(Mst_Default_Skeleton)
{
	aivar[22] = id_skeleton;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,itmw_rustysword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonSH(Mst_Default_Skeleton)
{
	aivar[22] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,itmw_witheredaxe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	protection[PROT_FIRE] = 40;
	senses_range = 1000;
	aivar[7] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1000;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[3] = 1000;
	aivar[4] = 0;
	aivar[5] = 5;
	aivar[6] = FALSE;
};

instance SkeletonScout(Mst_Default_Skeleton)
{
	name[0] = "Skelett Späher";
	aivar[22] = id_skeletonscout;
	Set_SkeletonScout_Visuals();
	Npc_SetToFightMode(self,itmw_scythe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Skelett Krieger";
	Set_SkeletonWarrior_Visuals();
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	aivar[22] = id_skeletonwarrior;
	Npc_SetToFightMode(self,itmw_witheredaxe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
};

instance SkeletonMage(Mst_Default_Skeleton)
{
	aivar[22] = id_skeletonmage;
	Set_SkeletonMage_Visuals();
	name[0] = "Skelett Magier";
	guild = GIL_DEMON;
	level = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	fight_tactic = FAI_HUMAN_MAGE;
	CreateInvItem(self,itar_runethunderbolt);
	CreateInvItems(self,itar_scrollsummonskeletons,5);
};

instance SummonedByPC_Skeleton(Mst_Default_Skeleton)
{
	aivar[22] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,itmw_rustysword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[20] = 300;
	aivar[21] = 5;
	aivar[23] = TRUE;
};

instance SummonedByNPC_Skeleton(Mst_Default_Skeleton)
{
	aivar[22] = ID_SKELETON;
	Set_Skeleton_Visuals();
	Npc_SetToFightMode(self,itmw_rustysword);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_Summoned;
};

instance SummonedByPC_SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Skelett Krieger";
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	senses = SENSE_HEAR | SENSE_SEE;
	aivar[22] = ID_SKELETONWARRIOR;
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode(self,itmw_witheredaxe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[20] = 300;
	aivar[21] = 5;
	aivar[23] = TRUE;
};

instance SummonedByNPC_SkeletonWarrior(Mst_Default_Skeleton)
{
	name[0] = "Skelett Krieger";
	level = 30;
	attribute[ATR_STRENGTH] = 120;
	aivar[22] = ID_SKELETONWARRIOR;
	Set_SkeletonWarrior_Visuals();
	Npc_SetToFightMode(self,itmw_witheredaxe);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10;
	start_aistate = ZS_MM_Summoned;
};

