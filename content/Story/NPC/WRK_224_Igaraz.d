// ---------------------------------------------------------
// NPC 'WRK_224_Igaraz'
// ---------------------------------------------------------

instance WRK_224_Igaraz		(C_NPC)
{


		//-------- primary data --------
		name								=	"Igaraz";
		guild								=	GIL_WORKER;
		npctype								=	NPCTYPE_MAIN;
		level								=	8;
		voice								=	2;
		id									=	224;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	50;
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
		Mdl_SetVisualBody					(self, "hum_body_naked0", 2, 1, "Hum_Head_Bald", 71, 4, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItFo_Beer,  7);
		CreateInvItems						(self, ItFo_Mutton,  3);
		CreateInvItems						(self, ItFo_Ham,  3);
		CreateInvItems						(self, ItFo_Wine,  2);
		CreateInvItems						(self, ItFo_MuttonRaw,  6);
		CreateInvItems						(self, ItMi_Silver,  30);
		CreateInvItems						(self, ItFo_MeatbugSoup,  2);
		CreateInvItems						(self, ItFo_MushroomStew,  5);
		CreateInvItems						(self, ItFo_MeatPie,  3);
		CreateInvItems						(self, ItFo_Loaf,  4);

		EquipItem							(self, ItMw_Nailmace);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_Prestart_224;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_Prestart_224		()
{
		TA_Walk								(08, 00, 20, 00, IGARAZ_WP);
		TA_Walk								(20, 00, 08, 00, IGARAZ_WP);
};

func void Rtn_start_224		()
{
		TA_SitAround						(08, 00, 20, 00, "OCR_OUTSIDE_MERC1");
		TA_Sleep							(20, 00, 08, 00, "OCR_HUT_51");
};

func void Rtn_guidearena_224		()
{
		TA_GuidePC							(08, 00, 20, 00, IGARAZ_WP);
		TA_GuidePC							(20, 00, 08, 00, IGARAZ_WP);
};

func void Rtn_guideHealer_224		()
{
		TA_GuidePC							(08, 00, 20, 00, IGARAZ_WP);
		TA_GuidePC							(20, 00, 08, 00, IGARAZ_WP);
};

func void Rtn_guideworker_224		()
{
		TA_GuidePC							(08, 00, 20, 00, IGARAZ_WP);
		TA_GuidePC							(20, 00, 08, 00, IGARAZ_WP);
};

func void Rtn_guidetrader_224		()
{
		TA_GuidePC							(08, 00, 20, 00, IGARAZ_WP);
		TA_GuidePC							(20, 00, 08, 00, IGARAZ_WP);
};


