// ---------------------------------------------------------
// NPC 'THF_409_Pyro'
// ---------------------------------------------------------

instance THF_409_Pyro		(C_NPC)
{


		//-------- primary data --------
		name								=	"Pyro";
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_MAIN;
		level								=	15;
		voice								=	5;
		id									=	409;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	40;
		attribute [ATR_DEXTERITY]			=	100;
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
		Mdl_ApplyOverlayMds					(self, "Humans_Relaxed.mds"); 			// overlay animation file
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "Hum_Head_Fighter", 20, 2, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);
		Npc_SetTalentSkill					(self, NPC_TALENT_BOW,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItFo_Cheese,  3);
		CreateInvItems						(self, ItMi_Silver,  10);
		CreateInvItems						(self, ItFo_HerbSoup,  3);
		CreateInvItems						(self, ItFo_Apple,  2);
		CreateInvItems						(self, ItFo_Wine,  2);

		EquipItem							(self, ItMw_Shortsword);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_STRONG;
		daily_routine						=	Rtn_start_409;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_409		()
{
		TA_SitCampfire						(08, 00, ARENAEND_H, ARENAEND_M, "OCR_CAMPFIRE_1_3");
		TA_Sleep							(ARENAEND_H, ARENAEND_M, 08, 00, "OCR_HUT_28");
};

func void Rtn_ArenaSpectator_409		()
{
		TA_Firespit							(ARENAPRE_H, ARENAPRE_M, ARENABEGIN_H, ARENABEGIN_M, "OCR_ARENABATTLE");
		TA_ArenaSpectator					(ARENABEGIN_H, ARENABEGIN_M, ARENAPRE_H, ARENAPRE_M, "OCR_ARENA_09");
};


