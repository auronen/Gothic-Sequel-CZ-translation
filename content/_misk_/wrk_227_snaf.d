
instance WRK_227_SNAF(C_Npc)
{
	name[0] = "Snaf";
	guild = GIL_WORKER;
	npcType = npctype_main;
	level = 10;
	voice = 9;
	id = 227;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 300;
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_REGENERATEMANA] = 0;
	attribute[ATR_REGENERATEHP] = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FALL] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_BARRIER] = 0;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"Hum_Body_CookSmith",0,1,"Hum_Head_Fighter",81,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_meatbugsoup,2);
	EquipItem(self,itmw_ironclub);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_227;
	senses_range = 2000;
};


func void Rtn_start_227()
{
	TA_Cook(8,0,22,0,"OCR_COOK01_01");
	TA_Sleep(22,0,8,0,"OCR_HUT_35");
};

