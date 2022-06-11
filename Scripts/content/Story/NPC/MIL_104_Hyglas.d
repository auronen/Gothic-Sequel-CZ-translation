// ---------------------------------------------------------
// NPC 'MIL_104_Hyglas'
// ---------------------------------------------------------

instance MIL_104_Hyglas		(C_NPC)
{


		//-------- primary data --------
		name								=	"Hyglas";
		guild								=	GIL_MILITIA;
		npctype								=	NPCTYPE_MAIN;
		level								=	20;
		voice								=	8;
		id									=	104;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	25;
		attribute [ATR_DEXTERITY]			=	75;
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
		Mdl_ApplyOverlayMds					(self, "humans_militia.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "hum_head_fighter", 51, 2, GRD_ARMOR_M);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  2);
		Npc_SetTalentSkill					(self, NPC_TALENT_2H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItMi_Silver,  10);
		CreateInvItems						(self, ItFo_MeatStew,  3);
		CreateInvItems						(self, ItFo_Loaf,  2);
		CreateInvItems						(self, ItFo_Wine,  2);
		CreateInvItems						(self, ItLsTorch,  2);

		EquipItem							(self, ItMw_MilitiaSword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_104;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_104		()
{
	TA_Sleep			(00,00,	07,00,	"OCC_MERCS_RIGHT_ROOM_BED1");
	TA_Teaching 	 	(07,00,	18,00,	"OCC_SHADOWS_CORNER_MOVEMENT4");
	TA_SmallTalk		(18,00, 00,00,	"OCC_MAINGATE_TALK");// mit Cassian
};


