
instance DMC_800_XARDAS(C_Npc)
{
	name[0] = "Xardas";
	npcType = npctype_friend;
	guild = GIL_DEMONIC;
	level = 30;
	voice = 14;
	id = 800;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",82,1,dmb_armor_m);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	CreateInvItem(self,itar_runewindfist);
	senses_range = 2000;
	daily_routine = rtn_prestart_800;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void rtn_prestart_800()
{
	TA_Stay(6,0,8,0,"DT_LABOURY");
	TA_Stay(8,0,6,0,"DT_LABOURY");
};

func void Rtn_start_800()
{
	TA_PotionAlchemy(6,0,8,0,"DT_E2_05");
	TA_PotionAlchemy(8,0,6,0,"DT_E2_05");
};

func void rtn_reading_800()
{
	TA_ReadBook(6,0,8,0,"DT_E3_07");
	TA_ReadBook(8,0,6,0,"DT_E3_07");
};

func void rtn_escaped_800()
{
	TA_Stay(6,0,8,0,"nowhere");
	TA_Stay(8,0,6,0,"nowhere");
};

