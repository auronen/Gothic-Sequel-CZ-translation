// ---------------------------------------------------------
// NPC 'THF_411_Tassio'
// ---------------------------------------------------------

instance THF_411_Tassio		(C_NPC)
{


		//-------- primary data --------
		name								=	"Tassio";
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_MAIN;
		level								=	4;
		voice								=	10;
		id									=	411;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	30;
		attribute [ATR_DEXTERITY]			=	60;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	100;
		attribute [ATR_HITPOINTS]			=	100;
		attribute [ATR_REGENERATEMANA]		=	0;
		attribute [ATR_REGENERATEHP]		=	0;

		//-------- protection ----------
		protection [PROT_EDGE]				=	0;
		protection [PROT_BLUNT]				=	0;
		protection [PROT_POINT]				=	0;
		protection [PROT_FIRE]				=	0;
		protection [PROT_MAGIC]				=	0;

		protection [PROT_FALL]				=	0;
		protection [PROT_FLY]				=	0;
		protection [PROT_BARRIER]			=	0;

		//-------- visuals -------------
		Mdl_SetVisual						(self, "humans.mds"); 					// basic animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "Hum_Head_Fighter", 46, 2, -1);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------

		//-------- inventory -----------
		CreateInvItems						(self, ItFo_Loaf,  1);
		CreateInvItems						(self, ItFo_Beer,  2);

		EquipItem							(self, ItMw_Poker);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_411;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_411		()
{
		TA_SitCampfire						(08, 00, 20, 00, "VP_CAMPFIRE_1");
		TA_SitCampfire						(20, 00, 08, 00, "VP_CAMPFIRE_1");
};
