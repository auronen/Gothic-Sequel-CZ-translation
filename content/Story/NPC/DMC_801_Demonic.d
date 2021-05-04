instance DMC_801_Demonic (C_NPC)
{
	//-------- primary data --------
	name						=	NAME_Demonic;
	guild						=	GIL_DEMONIC;
	npctype						=	NPCTYPE_AMBIENT;
	level						=	40;
	voice						=	8;
	id							=	801;

	//-------- attributes --------
	attribute[ATR_STRENGTH]		=	100;
	attribute[ATR_DEXTERITY] 	=	100;
	attribute[ATR_MANA_MAX] 	=	100;
	attribute[ATR_MANA] 		=	100;
	attribute[ATR_HITPOINTS_MAX]=	400;
	attribute[ATR_HITPOINTS] 	=	400;

	//-------- protection -----
	protection[PROT_EDGE]	=       0;
	protection[PROT_EDGE]	=       0;
	protection[PROT_BLUNT]	=       0;
	protection[PROT_POINT]	=       0;
	protection[PROT_FIRE]	=       0;
	protection[PROT_MAGIC]	=       0;

	//-------- visuals --------
	Mdl_SetVisual			(self,	"humans.mds");			// basic animation file
	Mdl_ApplyOverlayMds		(self,	"humans_mage.mds");		// overlay animation file
	Mdl_SetVisualBody        (self,    "hum_body_naked0",        0,1,"Hum_Head_Bald",82,1,DMC_ARMOR);
	B_Scale 				(self);							// body width according to strength of character
	Mdl_SetModelFatness 	(self, 0);						// limb fatness

	//-------- talents --------
	Npc_SetTalentSkill		(self, NPC_TALENT_2H,2);

	//-------- inventory --------
	EquipItem				(self, ItMw_2HSword);

	//------------- ai -------------
	senses						=   SENSE_HEAR | SENSE_SEE ;
	senses_range				=   2000;
	fight_tactic				=	FAI_HUMAN_MASTER;
	daily_routine				=	Rtn_start_801;
};

FUNC VOID Rtn_start_801 ()
{
	TA_Stay					(08,00,	20,00,	"???");
	TA_Stay					(20,00,	08,00,	"???");
};







