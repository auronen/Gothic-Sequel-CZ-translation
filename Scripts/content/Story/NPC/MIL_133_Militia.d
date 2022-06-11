// ---------------------------------------------------------
// NPC 'MIL_133_Militia'
// ---------------------------------------------------------

instance MIL_133_Militia		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Militia;
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_GUARD;
		level								=	10;
		voice								=	7;
		id									=	133;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	50;
		attribute [ATR_DEXTERITY]			=	50;
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
		Mdl_ApplyOverlayMds					(self, "humans_militia.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "hum_head_fighter", 51, 2, GRD_ARMOR_M);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  2);
		Npc_SetTalentSkill					(self, NPC_TALENT_2H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItMi_Silver,  13);
		CreateInvItems						(self, ItFo_Potion_Health_01,  1);
		CreateInvItems						(self, ItFo_MeatStew,  2);
		CreateInvItems						(self, ItFo_Loaf,  1);
		CreateInvItems						(self, ItFo_Wine,  1);
		CreateInvItems						(self, ItLsTorch,  1);

		EquipItem							(self, ItMw_MilitiaSword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_133;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

FUNC VOID Rtn_start_133 ()// im Wechsel mit 113
{
	TA_Sleep				(02,30,	13,00,	"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
	TA_SitCampfire			(13,00, 16,00,	"OCC_CAMPFIRE_E_1");
	TA_Listen				(16,00,	19,30,	"OCC_SHADOWS_CORNER_MOVEMENT3");
	TA_SitCampfire			(19,30, 02,30,	"OCC_CAMPFIRE_E_1");
};

FUNC VOID Rtn_snaf_133 ()
{
	TA_Sleep				(22,30,	13,00,	"OCC_MERCS_UPPER_RIGHT_ROOM_BED3");
	TA_QueueUp				(13,00, 16,00,	SNAF_WP_QUEUE1);
	TA_Listen				(16,00,	19,30,	"OCC_SHADOWS_CORNER_MOVEMENT3");
	TA_QueueUp				(19,30, 22,30,	SNAF_WP_QUEUE1);
};


