
instance THF_400_EDO(C_Npc)
{
	name[0] = "Edo";
	guild = GIL_THIEF;
	npcType = npctype_main;
	level = 20;
	voice = 10;
	id = 400;
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
	CreateInvItem(self,itmi_stomper);
	CreateInvItem(self,itmi_lute);
	CreateInvItems(self,itmi_hammer,3);
	CreateInvItems(self,itmi_scoop,2);
	CreateInvItems(self,itmi_flask,4);
	CreateInvItems(self,ItMiJoint_1,10);
	CreateInvItems(self,itam_arrow,20);
	CreateInvItems(self,itmi_silver,30);
	CreateInvItems(self,itfo_herbsoup,3);
	CreateInvItems(self,itfo_apple,2);
	CreateInvItems(self,itfo_wine,2);
	CreateInvItems(self,itmi_orenugget,EDO_STOLENORE);
	EquipItem(self,itmw_shortsword);
	EquipItem(self,itrw_shortbow);
	fight_tactic = FAI_HUMAN_Strong;
	daily_routine = Rtn_start_400;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void Rtn_start_400()
{
	TA_Sleep(22,30,7,30,"OCR_HUT_46");
	TA_SitAround(7,30,22,30,"OCR_HUT_46C");
};

func void rtn_deal_400()
{
	TA_Sleep(22,30,7,30,EDO_WP_SELL);
	TA_Stay(7,30,22,30,EDO_WP_SELL);
};

