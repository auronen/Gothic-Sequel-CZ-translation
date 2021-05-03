
instance HLR_501_TALAMON(C_Npc)
{
	name[0] = "Talamon";
	guild = GIL_HEALER;
	npcType = npctype_main;
	level = 40;
	voice = 8;
	id = 501;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_MANA_MAX] = 150;
	attribute[ATR_MANA] = 150;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,0,"Hum_Head_Psionic",8,1,hlrm_armor);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	CreateInvItem(self,itwr_book_healingpotions);
	CreateInvItems(self,itmi_silver,20);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItems(self,ItFo_Potion_Mana_01,3);
	CreateInvItems(self,itfo_ham,3);
	CreateInvItems(self,itmi_salt,10);
	CreateInvItems(self,itpl_swampweed,3);
	CreateInvItems(self,itpl_stoneroot,3);
	CreateInvItems(self,itpl_orcleaf,3);
	CreateInvItems(self,itpl_mountainmoss,3);
	EquipItem(self,itar_runesleep);
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = Rtn_start_501;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_501()
{
	TA_Sleep(0,0,7,0,"OCR_MEDICUS_4_BED3");
	TA_PotionAlchemy(7,0,0,0,"OCR_MEDICUS_TENT_04");
};

