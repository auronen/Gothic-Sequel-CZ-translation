
instance THF_402_KARRAS(C_Npc)
{
	name[0] = "Karras";
	guild = GIL_THIEF;
	npcType = npctype_ambient;
	level = 20;
	voice = 10;
	id = 402;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
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
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"Hum_Head_Fighter",55,2,vlk_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	CreateInvItems(self,itfo_loaf,3);
	CreateInvItems(self,itam_arrow,20);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itfo_herbsoup,3);
	CreateInvItems(self,itfo_apple,2);
	CreateInvItems(self,itfo_wine,2);
	EquipItem(self,itmw_shortsword);
	EquipItem(self,itrw_shortbow);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_402;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_402()
{
	TA_Smalltalk(8,0,22,0,"OCR_OUTSIDE_HUT_25");
	TA_Sleep(22,0,8,0,"OCR_HUT_25");
};

func void rtn_arenaspectator_402()
{
	TA_ArenaSpectator(8,0,20,0,"OCR_ARENA_03");
	TA_ArenaSpectator(20,0,8,0,"OCR_ARENA_03");
};

