INSTANCE MIL_122_Arenamaster (C_NPC)
// PlayerInstanz
{
	//-------- primary data	--------
	name						=	"Arenameister";
	Npctype						=	NPCTYPE_MAIN;
	guild						=	GIL_MILITIA;
	level						=	35;
	voice						=	12;
	id							=	122;
	flags						=	0;

	//-------- attributes --------
	attribute[ATR_STRENGTH]		=	150;
	attribute[ATR_DEXTERITY]	=	100;
	attribute[ATR_MANA_MAX]		=	0;
	attribute[ATR_MANA]			=	0;
	attribute[ATR_HITPOINTS_MAX]=	500;
	attribute[ATR_HITPOINTS]	=	500;

	//-------- protection -----
	protection[PROT_EDGE]	=		0;
	protection[PROT_EDGE]	=		0;
	protection[PROT_BLUNT]	=		0;
	protection[PROT_POINT]	=		0;
	protection[PROT_FIRE]	=		0;
	protection[PROT_MAGIC]	=		0;

	//-------- visuals --------
	Mdl_SetVisual			(self,	"humans.mds");			// basic animation file
	Mdl_ApplyOverlayMds		(self,	"humans_arrogance.mds");	// overlay animation file
	Mdl_SetVisualBody		 (self,	   "hum_body_Naked0",		 0,1,"Hum_Head_FatBald",11,3,EBR_ARMOR_M);
	B_Scale					(self);							// body	width according	to strength	of character
	Mdl_SetModelFatness		(self, 2);						// limb	fatness

	//-------- talents --------
	Npc_SetTalentSkill		(self, NPC_TALENT_1H,2);

	//-------- inventory --------
	EquipItem				(self, ItMw_Arenamaster_Sword);

	//-------------	ai -------------
	senses_range				=	2000;
	senses						=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	fight_tactic				=	FAI_HUMAN_MASTER;
	daily_routine				=	Rtn_start_122;
};

FUNC VOID Rtn_start_122	()
{
	// steht hinter	dem	Arena-Wett-Tisch
	TA_ArenaMasterBooth		(ARENASTAND_H,ARENASTAND_M,	ARENAPRE_H,ARENAPRE_M,		"OCR_STAND_WETT");

	// steht hinter	dem	Arena-Wett-Tisch
	TA_ArenaMasterNpcSend	(ARENAPRE_H,ARENAPRE_M,		ARENABEGIN_H,ARENABEGIN_M,	"OCR_STAND_WETT");

	// überwacht den aktuellen Arena-Kampf
	TA_ArenaMasterNpc		(ARENABEGIN_H,ARENABEGIN_M,	ARENAEND_H,ARENAEND_M,		"OCR_ARENA_BARONS_HUT");

	// schläft in seiner Hütte
	TA_ArenaMasterSleep		(ARENAEND_H,ARENAEND_M,		ARENASTAND_H,ARENASTAND_M,	"OCR_ARENA_BARONS_HUT");
};

func void Rtn_Attendance_122 ()
{
	// Beendung	der	Arenateilnahme,	wenn der SC	tagsüber wiederkommt
	TA_ArenaMasterBooth		(ARENASTAND_H,ARENASTAND_M,	ARENAPRE_H,ARENAPRE_M,		ARENA_WP_THRONE);

	// Beendung	der	Arenateilnahme,	wenn der SC	während	der	Vorprogrammphase wiederkommt
	TA_ArenaMasterNpcSend	(ARENAPRE_H,ARENAPRE_M,		ARENABEGIN_H,ARENABEGIN_M,	ARENA_WP_THRONE);

	// überwacht den aktuellen Arena-Kampf
	TA_ArenaMasterNpc		(ARENABEGIN_H,ARENABEGIN_M,	ARENAEND_H,ARENAEND_M,		ARENA_WP_THRONE);

	// Beendung	der	Arenateilnahme,	wenn der SC	zur	Schlafenszeit wiederkommt
	TA_ArenaMasterSleep		(ARENAEND_H,ARENAEND_M,		ARENASTAND_H,ARENASTAND_M,	ARENA_WP_THRONE);
};


