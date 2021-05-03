
instance PC_Mage(C_Npc)
{
	name[0] = "Milten";
	npcType = npctype_friend;
	guild = GIL_None;
	level = 999;
	voice = 2;
	id = 2;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 150;
	attribute[ATR_MANA] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_FIRE] = 1000;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",76,1,kdf_armor_l);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itar_runefireball);
	CreateInvItems(self,itfo_wine,3);
	CreateInvItems(self,ItFo_Potion_Health_02,10);
	CreateInvItems(self,ItFo_Potion_Mana_02,10);
	senses_range = 2000;
	aivar[15] = TRUE;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	daily_routine = rtn_prestart_2;
};


func void rtn_prestart_2()
{
	TA_Stay(0,0,12,0,"BF_PLATEAU_3");
	TA_Stay(12,0,0,0,"BF_PLATEAU_3");
};

func void rtn_Start_2()
{
	ta_meltrune(0,0,2,0,"BF_MAGE1_MELTER");
	ta_makerune(2,0,4,0,"BF_MAGE1_MAKER");
	ta_meltrune(4,0,6,0,"BF_MAGE1_MELTER");
	ta_makerune(6,0,8,0,"BF_MAGE1_MAKER");
	ta_meltrune(8,0,10,0,"BF_MAGE1_MELTER");
	ta_makerune(10,0,12,0,"BF_MAGE1_MAKER");
	ta_meltrune(12,0,14,0,"BF_MAGE1_MELTER");
	ta_makerune(14,0,16,0,"BF_MAGE1_MAKER");
	ta_meltrune(16,0,18,0,"BF_MAGE1_MELTER");
	ta_makerune(18,0,20,0,"BF_MAGE1_MAKER");
	ta_meltrune(20,0,22,0,"BF_MAGE1_MELTER");
	ta_makerune(22,0,0,0,"BF_MAGE1_MAKER");
};

