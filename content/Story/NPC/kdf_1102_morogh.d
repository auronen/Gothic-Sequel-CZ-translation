
instance KDF_1102_MOROGH(Npc_Default)
{
	name[0] = "Morogh";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 30;
	voice = 14;
	id = 1102;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",84,1,kdf_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[15] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	daily_routine = rtn_start_1102;
};


func void rtn_start_1102()
{
	TA_PotionAlchemy(19,5,6,55,"BF_MAGE1_POTION");
	TA_PotionAlchemy(6,55,19,5,"BF_MAGE1_POTION");
};

