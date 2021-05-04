// ---------------------------------------------------------
// NPC 'WRK_205_Ryan'	Pflanzensucher/Waldläufer
// ---------------------------------------------------------

instance NON_1401_Ryan		(C_NPC)
{


		//-------- primary data --------
		name								=	"Ryan";
		guild								=	GIL_NONE;
		npctype								=	NPCTYPE_AMBIENT;
		level								=	8;
		voice								=	9;
		id									=	1401;

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
		Mdl_ApplyOverlayMds					(self, "Humans_tired.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 2, 1, "Hum_Head_Bald", 71, 4, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------
		CreateInvItem						(self, ItFo_Beer);
		CreateInvItems						(self, ItFo_MuttonRaw,  100);
		CreateInvItems						(self, ItMi_Silver,  40);
		CreateInvItems						(self, ItFo_MeatbugSoup,  2);

		EquipItem							(self, ItRw_RiderBow);
		EquipItem							(self, ItMw_Nailmace);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_1401;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

// Prestart begegnet dem Spieler auf dem Startparcour

func void Rtn_start_1401		()
{
		TA_SitAround						(08, 00, 23, 00, "OCR_OUTSIDE_HUT_55_BENCH");
		TA_SitAround						(23, 00, 08, 00, "OCR_OUTSIDE_HUT_55_BENCH");
};


