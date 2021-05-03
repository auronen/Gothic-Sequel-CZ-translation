
instance KDF_1101_FEORAS(Npc_Default)
{
	name[0] = "Feoras";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 27;
	voice = 14;
	id = 1101;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 364;
	attribute[ATR_HITPOINTS] = 364;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",5,1,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[15] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	daily_routine = rtn_start_1101;
};


func void rtn_start_1101()
{
	ta_makerune(19,1,7,1,"BF_MAGE1_RUNE");
	ta_makerune(7,1,19,1,"BF_MAGE1_RUNE");
};

