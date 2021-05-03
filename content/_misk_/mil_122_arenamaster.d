
instance MIL_122_ARENAMASTER(C_Npc)
{
	name[0] = "Arenameister";
	npcType = npctype_main;
	guild = GIL_MILITIA;
	level = 35;
	voice = 12;
	id = 122;
	flags = 0;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	protection[PROT_EDGE] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	Mdl_SetVisual(self,"humans.mds");
	Mdl_ApplyOverlayMds(self,"humans_arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",11,3,ebr_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	EquipItem(self,itmw_arenamaster_sword);
	senses_range = 2000;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = rtn_start_122;
};


func void rtn_start_122()
{
	ta_arenamasterbooth(ARENASTAND_H,ARENASTAND_M,ARENAPRE_H,ARENAPRE_M,"OCR_STAND_WETT");
	ta_arenamasternpcsend(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M,"OCR_STAND_WETT");
	ta_arenamasternpc(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M,"OCR_ARENA_BARONS_HUT");
	ta_arenamastersleep(ARENAEND_H,ARENAEND_M,ARENASTAND_H,ARENASTAND_M,"OCR_ARENA_BARONS_HUT");
};

func void rtn_attendance_122()
{
	ta_arenamasterbooth(ARENASTAND_H,ARENASTAND_M,ARENAPRE_H,ARENAPRE_M,ARENA_WP_THRONE);
	ta_arenamasternpcsend(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M,ARENA_WP_THRONE);
	ta_arenamasternpc(ARENABEGIN_H,ARENABEGIN_M,ARENAEND_H,ARENAEND_M,ARENA_WP_THRONE);
	ta_arenamastersleep(ARENAEND_H,ARENAEND_M,ARENASTAND_H,ARENASTAND_M,ARENA_WP_THRONE);
};

