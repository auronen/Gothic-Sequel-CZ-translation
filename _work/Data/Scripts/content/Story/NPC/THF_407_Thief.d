// ---------------------------------------------------------
// NPC 'THF_407_Thief'
// ---------------------------------------------------------

instance THF_407_Thief		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Thief;
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_AMBIENT;
		level								=	15;
		voice								=	10;
		id									=	407;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	40;
		attribute [ATR_DEXTERITY]			=	100;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	150;
		attribute [ATR_HITPOINTS]			=	150;
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
		Mdl_ApplyOverlayMds					(self, "Humans_Relaxed.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "Hum_Head_Fighter", 55, 2, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);
		Npc_SetTalentSkill					(self, NPC_TALENT_BOW,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItFo_Cheese,  3);
		CreateInvItems						(self, ItAm_Arrow,  13);
		CreateInvItems						(self, ItMi_Silver,  9);
		CreateInvItems						(self, ItFo_HerbSoup,  1);

		EquipItem							(self, ItMw_Shortsword);
		EquipItem							(self, ItRw_ShortBow);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_407;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_407		()
{
		TA_PlayTune							(08, 00, ARENAEND_H, ARENAEND_M, "OCR_OUTSIDE_ARENA_01");
		TA_Sleep							(ARENAEND_H, ARENAEND_M, 08, 00, "OCR_HUT_30");
};

func void Rtn_ArenaSpectator_407		()
{
		TA_PlayTune							(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M, "OCR_ARENABATTLE_TRAIN2");
		TA_ArenaSpectator					(ARENABEGIN_H, ARENABEGIN_M, ARENAPRE_H, ARENAPRE_M, "OCR_ARENA_08");
};


