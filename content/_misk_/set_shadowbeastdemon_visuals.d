
prototype MST_DEFAULT_SHADOWBEASTDEMON(C_Npc)
{
	name[0] = "Schattenläufer-Dämon";
	guild = GIL_SHADOWBEAST;
	aivar[22] = ID_SHADOWBEAST;
	level = 40;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[7] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[3] = 700;
	aivar[4] = 4;
	aivar[5] = 10;
	aivar[6] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[13] = OnlyRoutine;
};

func void set_shadowbeastdemon_visuals()
{
	Mdl_SetVisual(self,"Shadow_Demon.mds");
	Mdl_SetVisualBody(self,"Sha_Body_Demon",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SHADOWBEASTDEMON(Mst_Default_Shadowbeast)
{
	set_shadowbeastdemon_visuals();
	Npc_SetToFistMode(self);
};

