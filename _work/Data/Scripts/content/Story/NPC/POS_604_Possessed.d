instance POS_604_Possessed (C_NPC)
{
	//-------- primary data --------
	name						=	NAME_Possessed;
	guild						=	GIL_POSSESSED;
	npctype						=	NPCTYPE_AMBIENT;
	level						=	1;
	voice						=	2;
	id							=	604;

	//-------- attributes --------
	attribute[ATR_STRENGTH]		=	10;
	attribute[ATR_DEXTERITY] 	=	10;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	attribute[ATR_HITPOINTS_MAX]=	40;
	attribute[ATR_HITPOINTS] 	=	40;

	//-------- protection -----
	protection[PROT_EDGE]	=       0;
	protection[PROT_EDGE]	=       0;
	protection[PROT_BLUNT]	=       0;
	protection[PROT_POINT]	=       0;
	protection[PROT_FIRE]	=       0;
	protection[PROT_MAGIC]	=       0;

	//-------- visuals --------
	Mdl_SetVisual			(self,	"humans.mds");			// basic animation file
	Mdl_ApplyOverlayMds		(self,	"Humans_Tired.mds");	// overlay animation file
	Mdl_SetVisualBody        (self,    "hum_body_possessed",    0,0,"Hum_Head_Bald",22,3,-1);
	B_Scale 				(self);							// body width according to strength of character
	Mdl_SetModelFatness 	(self,	0);					// limb fatness

	//-------- talents --------

	//-------- inventory --------
	CreateInvItems			(self,	ItFo_Booze,				1);
	

	//------------- ai -------------
	senses						=   SENSE_HEAR | SENSE_SEE ;
	senses_range				=   2000;
	fight_tactic				=	FAI_HUMAN_COWARD;
	daily_routine				=	Rtn_start_604;
};

FUNC VOID Rtn_start_604 ()
{
	TA_WalkIdiot			(08,00,	20,00,	"OC_MOAT_20");
	TA_PossessedSleep		(20,00,	08,00,	"OCR_GHETTO_HUT_05");

};







