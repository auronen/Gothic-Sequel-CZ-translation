// ---------------------------------------------------------
// NPC 'WRK_203_Bromor'
// ---------------------------------------------------------

instance WRK_203_Bromor		(C_NPC)
{


		//-------- primary data --------
		name								=	"Bromor";
		guild								=	GIL_WORKER;
		npctype								=	NPCTYPE_MAIN;
		level								=	10;
		voice								=	9;
		id									=	203;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	100;
		attribute [ATR_DEXTERITY]			=	50;
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
		Mdl_ApplyOverlayMds					(self, "Humans_militia.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 2, 1, "Hum_Head_Bald", 71, 4, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  3);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------
		CreateInvItem						(self, ItFo_Beer);
		CreateInvItems						(self, ItMi_Silver,  14);
		CreateInvItems						(self, ItFo_MeatbugSoup,  2);

		EquipItem							(self, ItMw_Nailmace);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_203;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_203		()
{
		TA_StudyScroll						(08, 00, 08, 05, "OCR_LAKE_1");
		TA_StudyScroll						(08, 05, 08, 15, "OCR_LAKE_3");
		TA_StudyScroll						(08, 15, 08, 25, "OCR_LAKE_9");
		TA_StudyScroll						(08, 25, 08, 35, "OCR_LAKE_6");
		TA_StudyScroll						(08, 35, 09, 00, "OCR_OUTSIDE_HUT_77_MOVEMENT");
		TA_StudyScroll						(09, 00, 09, 05, "OCR_LAKE_1");
		TA_StudyScroll						(09, 05, 09, 15, "OCR_LAKE_3");
		TA_StudyScroll						(09, 15, 09, 25, "OCR_LAKE_9");
		TA_StudyScroll						(09, 25, 09, 35, "OCR_LAKE_6");
		TA_StudyScroll						(09, 35, 10, 00, "OCR_OUTSIDE_HUT_77_MOVEMENT");
		TA_StudyScroll						(10, 00, 10, 05, "OCR_LAKE_1");
		TA_StudyScroll						(10, 05, 10, 15, "OCR_LAKE_3");
		TA_StudyScroll						(10, 15, 10, 25, "OCR_LAKE_9");
		TA_StudyScroll						(10, 25, 10, 35, "OCR_LAKE_6");
		TA_StudyScroll						(10, 35, 11, 00, "OCR_OUTSIDE_HUT_77_MOVEMENT");
		TA_Boss								(11, 00, 14, 00, "OCR_WASH_1");
		TA_StudyScroll						(14, 00, 14, 05, "OCR_LAKE_1");
		TA_StudyScroll						(14, 05, 14, 15, "OCR_LAKE_3");
		TA_StudyScroll						(14, 15, 14, 25, "OCR_LAKE_9");
		TA_StudyScroll						(14, 25, 14, 35, "OCR_LAKE_6");
		TA_StudyScroll						(14, 35, 15, 00, "OCR_OUTSIDE_HUT_77_MOVEMENT");
		TA_Boss								(15, 00, 19, 30, "OCR_WASH_1");
		TA_Sleep							(19, 30, 08, 00, "OCR_HUT_8");
};


