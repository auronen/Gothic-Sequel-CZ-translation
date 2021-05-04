// ---------------------------------------------------------
// NPC 'HLR_501_Talamon'
// ---------------------------------------------------------

instance HLR_501_Talamon		(C_NPC)
{


		//-------- primary data --------
		name								=	"Talamon";
		guild								=	GIL_HEALER;
		npctype								=	NPCTYPE_MAIN;
		level								=	40;
		voice								=	8;
		id									=	501;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	50;
		attribute [ATR_DEXTERITY]			=	75;
		attribute [ATR_MANA_MAX]			=	150;
		attribute [ATR_MANA]				=	150;
		attribute [ATR_HITPOINTS_MAX]		=	250;
		attribute [ATR_HITPOINTS]			=	250;
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
		Mdl_ApplyOverlayMds					(self, "Humans_Mage.mds"); 				// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 0, "Hum_Head_Psionic", 8, 1, HLRM_ARMOR);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_MAGE,  4);

		//-------- inventory -----------
		CreateInvItem						(self, ItFo_Potion_Health_02);
		CreateInvItem						(self, ItFo_Potion_Mana_02);
		CreateInvItem						(self, ItWr_Book_HealingPotions);
		CreateInvItems						(self, ItMi_Silver,  20);
		CreateInvItems						(self, ItFo_Potion_Health_01,  3);
		CreateInvItems						(self, ItFo_Potion_Mana_01,  3);
		CreateInvItems						(self, ItFo_Ham,  3);
		CreateInvItems						(self, ItMi_Salt,  10);
		CreateInvItems						(self, ItPl_Swampweed,  3);
		CreateInvItems						(self, ItPl_Stoneroot,  3);
		CreateInvItems						(self, ItPl_OrcLeaf,  3);
		CreateInvItems						(self, ItPl_MountainMoss,  3);

		EquipItem							(self, ItAr_RuneSleep);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_MAGE;
		daily_routine						=	Rtn_start_501;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_501		()
{
		TA_Sleep							(00, 00, 07, 00, "OCR_MEDICUS_4_BED3");
		TA_PotionAlchemy					(07, 00, 00, 00, "OCR_MEDICUS_TENT_04");
};


