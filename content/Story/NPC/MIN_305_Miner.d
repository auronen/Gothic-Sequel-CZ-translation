// ---------------------------------------------------------
// NPC 'MIN_305_Miner'
// ---------------------------------------------------------

instance MIN_305_Miner		(C_NPC)
{


		//-------- primary data --------
		name								=	NAME_Miner;
		guild								=	GIL_MINER;
		npctype								=	NPCTYPE_AMBIENT;
		level								=	8;
		voice								=	9;
		id									=	305;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	75;
		attribute [ATR_DEXTERITY]			=	50;
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
		Mdl_ApplyOverlayMds					(self, "Humans_Tired.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 3, 1, "Hum_Head_Thief", 71, 0, VLK_ARMOR_M);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_2H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItMi_Silver,  4);
		CreateInvItems						(self, ItFo_Beer,  1);
		CreateInvItems						(self, ItLsTorch,  3);
		CreateInvItems						(self, ItMi_OreNugget,  1);
		CreateInvItems						(self, ItFo_MushroomSoup,  3);

		EquipItem							(self, ItMw_Pickaxe);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_305;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_305		()
{
		TA_StandAround						(08, 00, 20, 00, "OW_E6_14");
		TA_StandAround						(20, 00, 08, 00, "OW_E6_14");
};


