
instance HLR_503_ODO(C_Npc)
{
	name[0] = "Odo";
	guild = GIL_HEALER;
	npcType = npctype_main;
	level = 20;
	voice = 8;
	id = 503;
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
	Mdl_SetModelFatness(self,1);
	CreateInvItem(self,ItMiJoint_3);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItems(self,itfo_ham,3);
	CreateInvItems(self,itmi_salt,10);
	CreateInvItems(self,itpl_swampweed,4);
	CreateInvItems(self,ItMiJoint_1,3);
	CreateInvItems(self,ItMiJoint_2,2);
	EquipItem(self,itmw_club);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = Rtn_start_503;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_503()
{
	TA_Stay(8,0,20,0,"OCR_TO_GHETTO_3");
	TA_Stay(20,0,8,0,"OCR_TO_GHETTO_3");
};

