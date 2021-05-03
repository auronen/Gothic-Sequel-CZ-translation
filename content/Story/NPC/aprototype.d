
instance APROTOTYPE(Npc_Default)
{
	name[0] = "APrototype";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3999;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Npc_SetAttitude(self,ATT_HOSTILE);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_3999;
};


func void rtn_start_3999()
{
	TA_Stand(0,0,12,0,"TEST1");
	TA_Stand(12,0,0,0,"TEST4");
};


instance BPROTOTYPE(Npc_Default)
{
	name[0] = "BPrototype";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3998;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Npc_SetAttitude(self,ATT_HOSTILE);
	fight_tactic = FAI_HUMAN_COWARD;
	daily_routine = rtn_start_30002;
};


func void rtn_start_30002()
{
	TA_Stand(0,0,12,0,"TEST1");
	TA_Stand(12,0,0,0,"TEST4");
};

