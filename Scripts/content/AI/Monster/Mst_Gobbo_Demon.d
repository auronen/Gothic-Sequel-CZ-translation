/*************************************************************************
**	Gobbo-Demon Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_GobboDemon(C_NPC)
{
//	name							=	"untoter Goblin";
	name							=	"Nemrtvý goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLACKGOBBO;
	level							=	12;
//------------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;

	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------------
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
//------------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------------------
	fight_tactic	=	FAI_GOBBO;
//------------------------------------------------------------------
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	3000;		// 30m

	aivar[AIV_MM_Behaviour]		= PACKHUNTER;

	aivar[AIV_MM_PercRange]		= 1500;
	aivar[AIV_MM_DrohRange]		= 1200;
	aivar[AIV_MM_AttackRange]	= 700;
	aivar[AIV_MM_DrohTime]		= 4;
	aivar[AIV_MM_FollowTime]	= 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
//------------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};
//------------------------------------------------------------------
func void Set_GobboDemon_Visuals()
{
	Mdl_SetVisual			(self,	"Gobbo_Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body_Demon", Default,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	untoter Gobblin														**
*************************************************************************/

INSTANCE GobboDemon	(Mst_Default_GobboDemon)
{
	Set_GobboDemon_Visuals();
	Npc_SetToFightMode (self, ItMw_Nailmace);
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 35; // da technisch im Faustkampf
};
