// ---------------------------------------------------------
// NPC 'MIL_100_Halvor'
// ---------------------------------------------------------

instance MIL_100_Halvor		(C_NPC)
{


		//-------- primary data --------
		name								=	"Halvor";
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_MAIN;
		level								=	20;
		voice								=	8;
		id									=	100;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	100;
		attribute [ATR_DEXTERITY]			=	75;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	400;
		attribute [ATR_HITPOINTS]			=	400;
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
		Mdl_SetVisualBody					(self, "Hum_Body_CookSmith", 0, 1, "Hum_Head_Fighter", 51, 2, -1); 	
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0); 	

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  2); 	
		Npc_SetTalentSkill					(self, NPC_TALENT_2H,  1); 	

		//-------- inventory -----------
		CreateInvItem						(self, ItKe_Halvor); 	
		CreateInvItems						(self, ItMi_Silver,  20); 	
		CreateInvItems						(self, ItFo_Potion_Health_01,  3); 	
		CreateInvItems						(self, ItFo_MeatStew,  3); 	
		CreateInvItems						(self, ItFo_Loaf,  2); 	
		CreateInvItems						(self, ItFo_Wine,  2); 	
		CreateInvItems						(self, ItLsTorch,  2); 	

		EquipItem							(self, ItMw_MilitiaSword); 	

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_100;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines 
// ---------------------------------------------------------

func void Rtn_start_100		()
{
		TA_Cook								(08, 00, 10, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(10, 00, 10, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(10, 15, 12, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(12, 00, 12, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(12, 15, 14, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(14, 00, 14, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(14, 15, 16, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(16, 00, 16, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(16, 15, 18, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(18, 00, 18, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(18, 15, 20, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(20, 00, 20, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(20, 15, 22, 00, HALVOR_WP_COOKING); 	
		TA_Stay								(22, 00, 22, 15, HALVOR_WP_OUTSIDE); 	
		TA_Cook								(22, 15, 00, 00, HALVOR_WP_COOKING); 	
		TA_Sleep							(00, 00, 08, 00, "OCC_MERCS_RIGHT_ROOM_BED2"); 	
};


