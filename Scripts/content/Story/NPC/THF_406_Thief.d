// ---------------------------------------------------------
// NPC 'THF_406_Thief'
// ---------------------------------------------------------

instance THF_406_Thief		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Thief;
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_AMBIENT;
		level								=	15;
		voice								=	5;
		id									=	406;

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
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "Hum_Head_Fighter", 55, 2, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);
		Npc_SetTalentSkill					(self, NPC_TALENT_BOW,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItAm_Arrow,  50);
		CreateInvItems						(self, ItFo_Loaf,  3);
		CreateInvItems						(self, ItMi_Silver,  11);
		CreateInvItems						(self, ItFo_HerbSoup,  3);
		CreateInvItems						(self, ItFo_Apple,  2);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItMw_Shortsword);
		EquipItem							(self, ItRw_ShortBow);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_406;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_406		()
{
		TA_Boss								(08, 00, 20, 00, "OCR_OUTSIDE_HUT_20");
		TA_Sleep							(20, 00, 08, 00, "OCR_HUT_20");
};

func void Rtn_ArenaSpectator_406		()
{
		TA_ArenaSpectator					(08, 00, 20, 00, "OCR_ARENA_04");
		TA_ArenaSpectator					(20, 00, 08, 00, "OCR_ARENA_04");
};


