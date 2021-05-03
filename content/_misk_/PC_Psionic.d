
instance PC_Psionic(C_Npc)
{
	name[0] = "Lester";
	npcType = npctype_friend;
	guild = GIL_None;
	level = 999;
	voice = 23;
	id = 4;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	protection[PROT_FIRE] = 1000;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Bald",17,2,nov_armor_m);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	daily_routine = Rtn_start_4;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 1500;
};


func void Rtn_start_4()
{
	TA_PotionAlchemy(0,0,12,0,"OCC_CHAPEL_RIGHT_ROOM");
	TA_PotionAlchemy(12,0,0,0,"OCC_CHAPEL_RIGHT_ROOM");
};

func void rtn_study_4()
{
	TA_ReadBook(0,0,12,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_ReadBook(12,0,0,0,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

