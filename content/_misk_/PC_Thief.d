
instance PC_Thief(C_Npc)
{
	name[0] = "Diego";
	npcType = npctype_friend;
	guild = GIL_THIEF;
	level = 999;
	voice = 11;
	id = 1;
	flags = NPC_FLAG_IMMORTAL;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",15,4,stt_armor_h);
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 340;
	attribute[ATR_HITPOINTS] = 340;
	protection[PROT_FIRE] = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,itmw_diego_sword);
	CreateInvItems(self,itam_arrow,100);
	senses_range = 2000;
	daily_routine = Rtn_Start_1;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
};


func void Rtn_Start_1()
{
	TA_Ebr_HangAround(0,0,12,0,DIEGO_WP_THRONE);
	TA_Ebr_HangAround(12,0,0,0,DIEGO_WP_THRONE);
};

