
instance KDF_1100_CATMAOL(Npc_Default)
{
	name[0] = "Catmaol";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 25;
	voice = 12;
	id = 1100;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 90;
	attribute[ATR_MANA] = 90;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",6,1,kdf_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[15] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	daily_routine = rtn_start_1100;
};


func void rtn_start_1100()
{
	TA_Stay(22,0,7,0,"BF_THRONE_MAGE");
	TA_Stay(7,0,22,0,"BF_THRONE_MAGE");
};

