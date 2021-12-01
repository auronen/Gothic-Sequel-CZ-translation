// ---------------------------------------------------------
// NPC 'THF_403_Gerion'
// ---------------------------------------------------------

instance THF_403_Gerion		(C_NPC)
{


		//-------- primary data --------
		name								=	"Gerion";
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_MAIN;
		level								=	20;
		voice								=	11;
		id									=	403;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	75;
		attribute [ATR_DEXTERITY]			=	150;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	350;
		attribute [ATR_HITPOINTS]			=	350;
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
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  2);
		Npc_SetTalentSkill					(self, NPC_TALENT_BOW,  2);

		//-------- inventory -----------
		CreateInvItems						(self, ItAm_Arrow,  50);
		CreateInvItems						(self, ItFo_Loaf,  3);
		CreateInvItems						(self, ItMi_Silver,  40);
		CreateInvItems						(self, ItFo_HerbSoup,  3);
		CreateInvItems						(self, ItFo_Apple,  2);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItMw_Shortsword);
		EquipItem							(self, ItRw_HuntingBow);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_403;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_403		()
{
		TA_SitAround						(08, 00, 22, 00, "OCR_OUTSIDE_HUT_44");
		TA_Sleep							(22, 00, 08, 00, GERION_WP);
};

func void Rtn_gotohut_403		()
{
		TA_GuidePC							(08, 00, 12, 00, GERION_WP);
		TA_GuidePC							(12, 00, 22, 00, GERION_WP);
};


