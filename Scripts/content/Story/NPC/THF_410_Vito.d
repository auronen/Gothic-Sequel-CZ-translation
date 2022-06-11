// ---------------------------------------------------------
// NPC 'THF_410_Vito'
// ---------------------------------------------------------

instance THF_410_Vito		(C_NPC)
{


		//-------- primary data --------
		name								=	"Vito";
		guild								=	GIL_THIEF;
		npctype								=	NPCTYPE_MAIN;
		level								=	10;
		voice								=	7;
		id									=	410;

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
		Mdl_SetVisualBody					(self, "hum_body_naked0", 0, 1, "Hum_Head_Fighter", 43, 2, VLK_ARMOR_L);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_1H,  1);

		//-------- inventory -----------
		CreateInvItems						(self, ItFo_Cheese,  1);
		CreateInvItems						(self, ItMi_Silver,  2);
		CreateInvItems						(self, ItFo_Apple,  2);

		EquipItem							(self, ItMw_Scythe);

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_COWARD;
		daily_routine						=	Rtn_start_410;
		senses_range						=	2000;
		senses								=	SENSE_HEAR | SENSE_SEE;



};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------

func void Rtn_start_410		()
{
		TA_SitCampfire						(08, 00, 20, 00, "VP_CAMPFIRE_1");
		TA_SitCampfire						(20, 00, 08, 00, "VP_CAMPFIRE_1");
};
