INSTANCE MIL_121_Brutus	(C_NPC)
// PlayerInstanz
{
	//-------- primary data	--------
	name						=	"Brutus";
	Npctype						=	NPCTYPE_MAIN;
	guild						=	GIL_MILITIA;// VORSICHT: Muß auch in der B_Arena_UnselectFight() geändert werden!!!
	level						=	25;
	voice						=	6;
	id							=	121;
	flags						=	0;

	//-------- attributes --------
	attribute[ATR_STRENGTH]		=	60;
	attribute[ATR_DEXTERITY]	=	75;
	attribute[ATR_MANA_MAX]		=	0;
	attribute[ATR_MANA]			=	0;
	attribute[ATR_HITPOINTS_MAX]=	200;
	attribute[ATR_HITPOINTS]	=	200;

	//-------- protection -----
	protection[PROT_EDGE]	=		0;
	protection[PROT_BLUNT]	=		0;
	protection[PROT_POINT]	=		0;
	protection[PROT_FIRE]	=		0;
	protection[PROT_MAGIC]	=		0;

	//-------- visuals --------
	Mdl_SetVisual			(self,	"humans.mds");			// basic animation file
	Mdl_ApplyOverlayMds		(self,	"humans_militia.mds");	// overlay animation file
	Mdl_SetVisualBody		 (self,	   "hum_body_naked0",		 0,1,"hum_head_fighter",48,2,GRD_ARMOR_M);
	B_Scale					(self);							// body	width according	to strength	of character
	Mdl_SetModelFatness		(self, 2);						// limb	fatness

	//-------- talents --------
	Npc_SetTalentSkill		(self, NPC_TALENT_1H,1);

	//-------- inventory --------
	EquipItem				(self, ItMw_Brutus_Longsword);
	//!!! SN: sonst, leeres	Inventory, da Arenakämpfer !!!

	//-------------	ai -------------
	senses						=	SENSE_HEAR | SENSE_SEE ;
	senses_range				=	2000;
	fight_tactic				=	FAI_HUMAN_STRONG;
	aivar[AIV_ARENA_VICTORIES]	=	BRUTUS_VICTORIES_START;
	daily_routine				=	Rtn_ArenaWait_121;
};

func void Rtn_ArenaWait_121	()
{
	// sitzt vor dem Arenaeingang und wartet auf die Herausforderung des SCs
	TA_ArenaSitCampfire		(07,00,	08,00,	"OCR_CAMPFIRE_I_3");
	TA_ArenaSmith_Sharp		(08,00,	12,00,	"OCR_CAMPFIRE_I_1");
	TA_ArenaSitCampfire		(12,00,	14,00,	"OCR_CAMPFIRE_I_3");
	TA_ArenaSmith_Sharp		(14,00,	16,00,	"OCR_CAMPFIRE_I_1");
	TA_ArenaSitCampfire		(16,00,	17,00,	"OCR_CAMPFIRE_I_3");
	TA_ArenaSmith_Sharp		(17,00,	19,00,	"OCR_CAMPFIRE_I_1");

	TA_ArenaSleep			(19,00,	07,00,	"OCC_MERCS_LEFT_ROOM_BED5");
};

func void Rtn_PreChamber_121 ()
{
	// Warten auf den Kampf in der Vorbereitungskammer
	TA_ArenaSitAround		(00,00,	12,00,	ARENA_WP_RIGHT_CHAMBER);
	TA_ArenaSitAround		(12,00,	00,00,	ARENA_WP_RIGHT_CHAMBER);
};

func void Rtn_ArenaFight_121 ()
{
	// Arenakampf gegen	den	Spieler
	TA_ArenaFight		(00,00,	12,00,	ARENA_WP_RIGHT_START);
	TA_ArenaFight		(12,00,	00,00,	ARENA_WP_RIGHT_START);
};

func void Rtn_ArenaNpc_121 ()
{
	// Arenakampf gegen	einen NSC
	TA_ArenaNpc			(00,00,	12,00,	ARENA_WP_RIGHT_START);
	TA_ArenaNpc			(12,00,	00,00,	ARENA_WP_RIGHT_START);
};



