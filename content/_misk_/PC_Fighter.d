
instance PC_Fighter(C_Npc)
{
	name[0] = "Gorn";
	npcType = npctype_friend;
	guild = GIL_DEMONHUNTER;
	level = 999;
	voice = 9;
	id = 3;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 22;
	attribute[ATR_HITPOINTS] = 22;
	protection[PROT_FIRE] = 1000;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,dhtm_armor);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	EquipItem(self,itmw_doublebladedaxe);
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = 2000;
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_Start_3;
};


func void Rtn_Start_3()
{
	TA_StandAround(0,0,12,0,"OCC_FIGHTTRAINING");
	TA_StandAround(12,0,0,0,"OCC_FIGHTTRAINING");
};

