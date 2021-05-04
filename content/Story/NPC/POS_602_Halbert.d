instance POS_602_Halbert (C_NPC)
{
	//-------- primary data --------
	name						=	"Halbert";
	guild						=	GIL_POSSESSED;
	npctype						=	NPCTYPE_AMBIENT;
	level						=	1;
	voice						=	2;
	id							=	602;

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
	Mdl_SetVisualBody        (self,    "hum_body_possessed",    0,0,"Hum_Head_Bald",21,3,-1);
	B_Scale 				(self);							// body width according to strength of character
	Mdl_SetModelFatness 	(self,	1);					// limb fatness

	//-------- talents --------

	//-------- inventory --------
	CreateInvItems			(self,	ItFo_Booze,				1);
	

	//------------- ai -------------
	senses						=   SENSE_HEAR | SENSE_SEE ;
	senses_range				=   2000;
	fight_tactic				=	FAI_HUMAN_COWARD;
	daily_routine				=	Rtn_start_602;
};

FUNC VOID Rtn_start_602 ()
{
	TA_PossessedSleep		 				(08,00,	20,00,	"OCR_GHETTO_HUT_03");

	TA_WalkIdiot 			 		(20,00,	21,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(21,00,	22,00,	"OCR_GHETTO_15");
	TA_WalkIdiot			 		(22,00,	23,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(23,00,	00,00,	"OCR_GHETTO_15");
	TA_WalkIdiot			 		(00,00,	01,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(01,00,	02,00,	"OCR_GHETTO_15");
	TA_WalkIdiot			 		(02,00,	03,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(03,00,	04,00,	"OCR_GHETTO_15");
	TA_WalkIdiot			 		(04,00,	05,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(05,00,	06,00,	"OCR_GHETTO_15");
	TA_WalkIdiot			 		(06,00,	07,00,	"OCR_GHETTO_3");
	TA_WalkIdiot			 		(07,00,	08,00,	"OCR_GHETTO_15");
};







