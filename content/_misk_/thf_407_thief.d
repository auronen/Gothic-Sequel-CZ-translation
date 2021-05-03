
instance THF_407_THIEF(C_Npc)
{
	name[0] = NAME_THIEF;
	guild = GIL_THIEF;
	npcType = npctype_ambient;
	level = 15;
	voice = 10;
	id = 407;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
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
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Fighter",55,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	CreateInvItems(self,itfo_cheese,3);
	CreateInvItems(self,itam_arrow,13);
	CreateInvItems(self,itmi_silver,9);
	CreateInvItems(self,itfo_herbsoup,1);
	EquipItem(self,itmw_shortsword);
	EquipItem(self,itrw_shortbow);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = rtn_start_407;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_407()
{
	TA_PlayTune(8,0,ARENAEND_H,ARENAEND_M,"OCR_OUTSIDE_ARENA_01");
	TA_Sleep(ARENAEND_H,ARENAEND_M,8,0,"OCR_HUT_30");
};

func void rtn_arenaspectator_407()
{
	TA_PlayTune(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M,"OCR_ARENABATTLE_TRAIN2");
	TA_ArenaSpectator(ARENABEGIN_H,ARENABEGIN_M,ARENAPRE_H,ARENAPRE_M,"OCR_ARENA_08");
};

