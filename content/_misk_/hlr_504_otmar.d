
instance HLR_504_OTMAR(C_Npc)
{
	name[0] = "Otmar";
	guild = GIL_HEALER;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 504;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",3,1,"Hum_Head_Psionic",8,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,2);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItMiJoint_3);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_ham,3);
	CreateInvItems(self,itmi_salt,10);
	CreateInvItems(self,itpl_swampweed,3);
	CreateInvItems(self,itfo_beer,3);
	CreateInvItems(self,ItMiJoint_1,3);
	CreateInvItems(self,ItMiJoint_2,2);
	EquipItem(self,itmw_club);
	fight_tactic = FAI_HUMAN_MAGE;
	daily_routine = Rtn_start_504;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_504()
{
	TA_HerbAlchemy(7,0,0,0,"OCR_MEDICUS_HUT_1");
	TA_Sleep(0,0,7,0,"OCR_MEDICUS_HUT_1");
};

