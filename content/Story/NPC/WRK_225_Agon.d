// ---------------------------------------------------------
// NPC 'WRK_225_Agon'
// ---------------------------------------------------------

instance WRK_225_Agon		(C_NPC)
{


		//-------- primary data --------
		name								=	"Agon";
		guild								=	GIL_WORKER;
		npctype								=	NPCTYPE_TRD_AMBIENT;
		level								=	8;
		voice								=	9;
		id									=	225;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	50;
		attribute [ATR_DEXTERITY]			=	50;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	300;
		attribute [ATR_HITPOINTS]			=	300;
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
		Mdl_SetVisualBody					(self, "hum_body_naked0", 2, 1, "Hum_Head_Bald", 71, 4, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------
		CreateInvItem						(self, ItFo_Beer);
		CreateInvItems						(self, ItMi_Silver,  40);
		CreateInvItems						(self, ItFo_MeatbugSoup,  2);

		EquipItem							(self, ItMw_Nailmace);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_225;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_225		()
{
		TA_SmallTalk						(08, 00, 20, 00, "OCR_MERC1");
		TA_Sleep							(20, 00, 08, 00, "OCR_HUT_57");
};


