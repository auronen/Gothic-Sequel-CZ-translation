// ---------------------------------------------------------
// NPC 'MIL_134_Militia'
// ---------------------------------------------------------

instance MIL_134_Militia		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Militia;
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_GUARD;
		level								=	10;
		voice								=	4;
		id									=	134;

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
		CreateInvItems						(self, ItMi_Silver,  10);
		CreateInvItems						(self, ItFo_Wine,  2);
		CreateInvItems						(self, ItLsTorch,  2);

		EquipItem							(self, ItMw_MilitiaSword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_134;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

FUNC VOID Rtn_start_134 ()// im Wechsel zu 114
{
	TA_Sleep				(02,00,	13,00,	"OCC_MERCS_UPPER_RIGHT_ROOM_BED4");
	TA_SitCampfire			(13,00, 16,00,	"OCC_CONVOY_01");
	TA_Listen				(16,00,	17,30,	"OCC_SHADOWS_CORNER");
	TA_SitCampfire			(17,30, 02,00,	"OCC_CONVOY_01");
};

FUNC VOID Rtn_snaf_134 ()
{
	TA_Sleep				(02,00,	13,00,	"OCC_MERCS_UPPER_RIGHT_ROOM_BED4");
	TA_QueueUp				(13,00, 16,00,	SNAF_WP_QUEUE1);
	TA_Listen				(16,00,	17,30,	"OCC_SHADOWS_CORNER");
	TA_SitCampfire			(17,30, 02,00,	"OCC_CONVOY_01");
};



