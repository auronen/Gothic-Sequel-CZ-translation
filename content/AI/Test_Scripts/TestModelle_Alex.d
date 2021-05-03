
instance OverlayHuman(C_Npc)
{
	name[0] = "OverlayHuman";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_1hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_2hST2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_BowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds(self,"Humans_CBowT2.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_ApplyOverlayMds(self,"Humans_drunken.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Sprint.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Torch.mds");
	Mdl_ApplyOverlayMds(self,"Humans_Flee.mds");
};

instance OverlayOrc(C_Npc)
{
	name[0] = "Orc Rockefeller";
	guild = GIL_ORCWARRIOR;
	level = 4;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_HITPOINTS_MAX] = 20;
	attribute[ATR_HITPOINTS] = 20;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	Mdl_SetVisual(self,"orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head",DEFAULT,DEFAULT,-1);
	Mdl_ApplyOverlayMds(self,"Orc_Drunken.mds");
	Mdl_ApplyOverlayMds(self,"Orc_Torch.mds");
};

instance POS1(C_Npc)
{
	name[0] = "testbesessener";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_possessed",0,0,"Hum_Head_Bald",21,2,-1);
};

instance POS2(C_Npc)
{
	name[0] = "testbesessener";
	guild = GIL_None;
	level = 10;
	voice = 11;
	id = 3001;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 7;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 18;
	attribute[ATR_HITPOINTS] = 18;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_possessed",0,0,"Hum_Head_Bald",22,2,-1);
};

instance PRINCESS(Npc_Default)
{
	name[0] = "Princess";
	npcType = NPCTYPE_FEMALE;
	guild = GIL_AMAZON;
	level = 35;
	voice = 16;
	id = 900;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_MANA_MAX] = 300;
	attribute[ATR_MANA] = 300;
	attribute[ATR_HITPOINTS_MAX] = 900;
	attribute[ATR_HITPOINTS] = 900;
	aivar[37] = TRUE;
	Mdl_SetVisual(self,"babe.mds");
	Mdl_SetVisualBody(self,"Bab_Body_Princess",3,1,"Bab_Head_Hair1.mms",1,0,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	fight_tactic = FAI_HUMAN_Strong;
};

