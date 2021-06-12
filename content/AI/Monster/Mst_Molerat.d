/*************************************************************************
**	Molerat Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Molerat(C_Npc)
{
//	name							=	"Molerat";
	name							=	"Krysokrt";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	5;

//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8;
	attribute	[ATR_DEXTERITY]		=	8;

	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8;
	protection	[PROT_EDGE]			=	8;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------------
	fight_tactic					= FAI_MOLERAT;
//------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PASSIVE;

	aivar[AIV_MM_PercRange]		= 1200;
	aivar[AIV_MM_DrohRange]		= 1000;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]	= 5;
	aivar[AIV_MM_FollowInWater] = FALSE;
//------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};
//------------------------------------------------------------
func void Set_Molerat_Visuals()
{
	Mdl_SetVisual			(self,"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Molerat    															**
*************************************************************************/

INSTANCE Molerat	(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItAt_MoleratGrease,	2);

};



/*************************************************************************
**	junge Molerat   (für Spielstart) 									**
*************************************************************************/

INSTANCE YMolerat	(Mst_Default_Molerat)
{
//	name							=	"junge Molerat";
	name							=	"Mladý krysokrt";
	level							=	4;

	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8;
	protection	[PROT_EDGE]			=	8;

	fight_tactic					= FAI_MONSTER_COWARD;

	Set_Molerat_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFo_MuttonRaw, 1);
};

INSTANCE DMolerat	(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItAt_MoleratGrease,	2);
	
	// This is a bugfix for Diegos 2nd bow skill quest
	CreateInvItems (self, ItFo_MuttonRaw,		2);
	
	// Make them a bit stronger
	const int BF_Multiplier = 2;
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);  // make them a bit bigger
	
	level							=	7; // 70 Exp

//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	8 * BF_Multiplier;
	attribute	[ATR_DEXTERITY]		=	8 * BF_Multiplier;

	attribute	[ATR_HITPOINTS_MAX]	=	40 * BF_Multiplier;
	attribute	[ATR_HITPOINTS]		=	40 * BF_Multiplier;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8 * BF_Multiplier;
	protection	[PROT_EDGE]			=	8 * BF_Multiplier;
	protection	[PROT_POINT]		=	5; 					// make them weaker to arrows
	protection	[PROT_FIRE]			=	5 * BF_Multiplier;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
};
