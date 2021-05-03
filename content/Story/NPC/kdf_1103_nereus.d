
instance KDF_1103_NEREUS(Npc_Default)
{
	name[0] = "Nereus";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 28;
	voice = 13;
	id = 1103;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 90;
	attribute[ATR_MANA] = 90;
	attribute[ATR_HITPOINTS_MAX] = 376;
	attribute[ATR_HITPOINTS] = 376;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Thief",4,0,kdf_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[15] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	daily_routine = rtn_start_1103;
};


func void rtn_start_1103()
{
	TA_ReadBook(18,50,7,10,"BF_MAGE2_BOOK_1");
	TA_ReadBook(7,10,18,50,"BF_MAGE2_BOOK_1");
};

