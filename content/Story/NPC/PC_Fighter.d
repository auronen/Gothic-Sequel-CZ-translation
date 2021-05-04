INSTANCE PC_Fighter (C_NPC)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Gorn";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_DEMONHUNTER;
	level			= 999;			// real 15, aber 999 damit er nicht flieht!
	voice			= 9;
	id				= 3;
	flags			= NPC_FLAG_IMMORTAL;

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	80;
	attribute[ATR_DEXTERITY] 	=	40;
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	22;
	attribute[ATR_HITPOINTS] 	=	22;

	protection[PROT_FIRE]		=	1000;

	//-------- protection -----
	protection[PROT_EDGE]	=       0;
	protection[PROT_EDGE]	=       0;
	protection[PROT_BLUNT]	=       0;
	protection[PROT_POINT]	=       0;
	protection[PROT_FIRE]	=       0;
	protection[PROT_MAGIC]	=       0;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	Armor
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	0,			3,			"Hum_Head_Fighter", 	13,			0,			DHTM_ARMOR);

	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");

	//-------- talents --------
	Npc_SetTalentSkill	(self,	NPC_TALENT_PICKPOCKET,	1);		Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,	60);
	Npc_SetTalentSkill	(self,	NPC_TALENT_SNEAK,		1);
	Npc_SetTalentSkill	(self,	NPC_TALENT_PICKLOCK,	1);		Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,	60);

	Npc_SetTalentSkill	(self,	NPC_TALENT_1H,			2);
	Npc_SetTalentSkill	(self,	NPC_TALENT_2H,			2);

	//-------- inventory --------
	EquipItem (self,ItMw_DoublebladedAxe);

	//-------- ai --------
	senses						=   SENSE_HEAR | SENSE_SEE ;
	senses_range				=   2000;
	fight_tactic = FAI_HUMAN_STRONG;

	daily_routine = Rtn_start_3;
};

FUNC VOID Rtn_Start_3 ()
{
	TA_StandAround 	(00,00,	12,00,"OCC_FIGHTTRAINING");
	TA_StandAround	(12,00, 00,00,"OCC_FIGHTTRAINING");

};




