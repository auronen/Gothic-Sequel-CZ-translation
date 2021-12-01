// ---------------------------------------------------------
// NPC 'MIL_109_Militia'
// ---------------------------------------------------------

instance MIL_109_Militia		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Militia;
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_GUARD;
		level								=	10;
		voice								=	4;
		id									=	109;

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
		CreateInvItems						(self, ItAm_Arrow,  20);
		CreateInvItems						(self, ItMi_Silver,  9);
		CreateInvItems						(self, ItFo_Potion_Health_01,  1);
		CreateInvItems						(self, ItFo_MeatStew,  4);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItRw_LongBow);
		EquipItem							(self, ItMw_MilitiaSword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_RANGED;
		daily_routine						=	Rtn_start_109;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_109		()
{
		TA_GuardFP							(ARENAEND_H, ARENAEND_M, 11, 00, "OCR_OUTSIDE_ARENA_BARONS_HUT");
		TA_SitAround						(12, 00, 14, 00, "OCR_COOK01_01");
		TA_SitAround						(13, 00, ARENAPRE_H, ARENAPRE_M, "OCR_OUTSIDE_ARENA_HANGAROUND");
		TA_GuardFP							(ARENAPRE_H, ARENAPRE_M, ARENAEND_H, ARENAEND_M, "OCR_ARENA_05");
};


