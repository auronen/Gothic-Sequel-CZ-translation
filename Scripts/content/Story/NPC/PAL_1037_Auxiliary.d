// ---------------------------------------------------------
// NPC 'PAL_1037_Auxiliary'
// ---------------------------------------------------------

instance PAL_1037_Auxiliary		(C_NPC)
{


		//-------- primary data --------
		name								=	Name_Auxiliary;
		guild								=	GIL_PALADIN;
		npctype								=	NPCTYPE_GUARD;
		level								=	10;
		voice								=	6;
		id									=	1037;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	60;
		attribute [ATR_DEXTERITY]			=	60;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	200;
		attribute [ATR_HITPOINTS]			=	200;
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
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "hum_head_fighter", 51, 2, PALL_ARMOR);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------

		EquipItem							(self, ItMw_AuxiliaryMace);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_1037;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_1037		()
{
		TA_SitAround						(08, 00, 20, 00, "VP_RESERVE");
		TA_SitAround						(20, 00, 08, 00, "VP_RESERVE");
};