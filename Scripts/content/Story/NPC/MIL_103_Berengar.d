// ---------------------------------------------------------
// NPC 'MIL_103_Berengar'
// ---------------------------------------------------------

instance MIL_103_Berengar		(C_NPC)
{


		//-------- primary data --------
		name								=	"Berengar";
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_MAIN;
		level								=	20;
		voice								=	8;
		id									=	103;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	200;
		attribute [ATR_DEXTERITY]			=	50;
		attribute [ATR_MANA_MAX]			=	0;
		attribute [ATR_MANA]				=	0;
		attribute [ATR_HITPOINTS_MAX]		=	400;
		attribute [ATR_HITPOINTS]			=	400;
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
		Mdl_ApplyOverlayMds					(self, "humans_arrogance.mds"); 		// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "hum_head_fighter", 51, 2, GRD_ARMOR_M);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  2);
		Npc_SetTalentSkill					(self, NPC_TALENT_2H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItAm_Arrow,  20);
		CreateInvItems						(self, ItFo_MeatbugSoup,  8);
		CreateInvItems						(self, ItFo_Loaf,  5);
		CreateInvItems						(self, ItFo_Mutton,  4);
		CreateInvItems						(self, ItMi_Silver,  37);
		CreateInvItems						(self, ItFo_Booze,  5);
		CreateInvItems						(self, ItLsTorch,  7);
		CreateInvItems						(self, ItFo_Potion_Health_02,  10);
		CreateInvItems						(self, ItFo_Potion_Health_01,  3);
		CreateInvItems						(self, ItFo_MeatStew,  3);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItRw_LongBow);
		EquipItem							(self, ItMw_MilitiaSword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_103;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_103		()
{
	TA_SitAround (00,00, 20,00, "OCC_BARONS_GREATHALL_RIGHT_BACK");
	TA_SitAround (20,00, 00,00, "OCC_BARONS_GREATHALL_RIGHT_BACK");
};


