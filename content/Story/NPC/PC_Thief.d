INSTANCE PC_Thief(C_NPC)

{
	//-------- primary data --------
	name 			= "Diego";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_THIEF;
	level			= 999;			// real 25, aber 999 damit er nicht vor dem Troll flieht!
	voice			= 11;
	id				= 1;
	flags			= NPC_FLAG_IMMORTAL;

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
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",		0,			2,			"Hum_Head_Thief", 	15,  		4,	STT_ARMOR_H);


	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	70;
	attribute[ATR_DEXTERITY] 	=	90;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX]=	340;
	attribute[ATR_HITPOINTS] 	=	340;

	protection[PROT_FIRE]		=	1000;

	Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,		1);
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK,		1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE,			6);

	Npc_SetTalentSkill	(self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill	(self, NPC_TALENT_BOW,2);

	//-------- inventory --------

	EquipItem			(self, ItMw_Diego_Sword);
	CreateInvItems		(self, ItAm_Arrow, 100);

	//-------- ai --------
	senses_range				=   2000;
	daily_routine 				= Rtn_start_1;
	fight_tactic 				= FAI_HUMAN_MASTER;
	senses						= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_1 ()
{
	TA_Ebr_HangAround	(00,00, 12,00, DIEGO_WP_THRONE);
	TA_Ebr_HangAround	(12,00, 00,00, DIEGO_WP_THRONE);
};

















