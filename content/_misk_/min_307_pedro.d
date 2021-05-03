
instance MIN_307_PEDRO(C_Npc)
{
	name[0] = "Pedro";
	guild = GIL_MINER;
	npcType = npctype_ambient;
	level = 15;
	voice = 3;
	id = 307;
	attribute[ATR_STRENGTH] = 75;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 0;
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
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_naked0",3,1,"Hum_Head_Thief",71,0,vlk_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,itmi_coin);
	CreateInvItem(self,itfo_beer);
	CreateInvItems(self,itmi_bloodorenugget,20);
	CreateInvItems(self,itmi_silver,10);
	CreateInvItems(self,itmi_orenugget,10);
	CreateInvItems(self,itfo_mushroomsoup,3);
	CreateInvItems(self,ItLsTorch,3);
	EquipItem(self,itmw_pickaxe);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_307;
	senses_range = 2000;
	senses = SENSE_HEAR | SENSE_SEE;
};


func void rtn_start_307()
{
	TA_Stand(8,0,20,0,"PATH_OC_FOGTOWER02");
	TA_Stand(20,0,8,0,"PATH_OC_FOGTOWER02");
};

