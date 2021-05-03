
instance MIL_105_MILITIA(C_Npc)
{
	name[0] = NAME_MILITIA;
	guild = GIL_MILITIA;
	npcType = npctype_guard;
	level = 10;
	voice = 4;
	id = 105;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
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
	Mdl_ApplyOverlayMds(self,"humans_militia.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",0,1,"hum_head_fighter",51,2,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,ItFo_Potion_Health_01,1);
	CreateInvItems(self,itfo_meatstew,3);
	CreateInvItems(self,itfo_loaf,2);
	CreateInvItems(self,itfo_wine,2);
	CreateInvItems(self,ItLsTorch,2);
	EquipItem(self,itmw_militiasword);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_105;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_105()
{
	ta_horn(7,35,7,55,"OCR_TO_HUT_72");
	ta_horn(7,55,8,0,"OCR_OUTSIDE_HUT_68_BENCH2");
	ta_guardfp(8,0,10,0,"OCR_PALISADE_WALK_51");
	TA_GuardPalisade(10,0,12,0,"OCR_PALISADE_WALK_51");
	TA_GuardPalisade(12,0,14,0,"OCR_PALISADE_WALK_51_B");
	TA_GuardPalisade(14,0,16,0,"OCR_PALISADE_WALK_29");
	TA_GuardPalisade(16,0,17,40,"OCR_PALISADE_WALK_28");
	ta_horn(17,40,17,50,"OCR_PALISADE_WALK_51");
	ta_horn(17,50,18,0,"OCR_OUTSIDE_HUT_77_MOVEMENT");
	ta_guardfp(18,0,20,0,"OCR_PALISADE_WALK_51");
	ta_guardfp(20,0,22,0,"OCR_LAKE_2");
	ta_guardfp(22,0,23,0,"OCR_PALISADE_WALK_51");
	TA_GuardPalisade(23,0,0,0,"OCR_PALISADE_WALK_51_B");
	TA_GuardPalisade(0,0,2,0,"OCR_PALISADE_WALK_29");
	TA_GuardPalisade(2,0,4,0,"OCR_PALISADE_WALK_28");
	ta_guardfp(4,0,7,35,"OCR_PALISADE_WALK_51");
};

