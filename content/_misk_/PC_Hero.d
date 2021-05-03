
instance PC_Hero(C_Npc)
{
	name[0] = "Ich";
	npcType = npctype_main;
	guild = GIL_None;
	level = 0;
	voice = 15;
	id = 0;
	exp = 0;
	exp_next = 500;
	lp = HERO_START_LP;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",5,1,"Hum_Head_Pony",9,0,-1);
};

