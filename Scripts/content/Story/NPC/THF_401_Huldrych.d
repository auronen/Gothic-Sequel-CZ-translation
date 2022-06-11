// ---------------------------------------------------------
// NPC 'THF_401_Huldrych'
// ---------------------------------------------------------

instance THF_401_Huldrych		(C_NPC)
{


		//-------- primary data --------
		name								=	"Huldrych";
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_MAIN;
		level								=	20;
		voice								=	5;
		id									=	401;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	20;
		attribute [ATR_DEXTERITY]			=	75;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	80;
		attribute [ATR_HITPOINTS]			=	80;
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

		//-------- inventory -----------
		CreateInvItems						(self, ItAm_Arrow,  20);
		CreateInvItems						(self, ItMi_Silver,  10);
		CreateInvItems						(self, ItFo_HerbSoup,  3);
		CreateInvItems						(self, ItFo_Apple,  2);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItMw_Nailmace);
		EquipItem							(self, ItRw_ShortBow);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_401;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_401		()
{
		TA_StandAround						(08, 00, 12, 00, "OCR_OUTSIDE_HUT_78");
		TA_StandAround						(12, 00, 22, 00, "OCR_OUTSIDE_HUT_78");
		TA_Sleep							(22, 00, 08, 00, "OCR_HUT_78");
};


