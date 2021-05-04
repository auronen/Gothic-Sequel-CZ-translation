
// ****************
// Neuer NSC
// ****************

prototype Npc_Default (C_NPC)
{

	//-------- abilities --------
	attribute	[ATR_STRENGTH] 	=		5;
	attribute	[ATR_DEXTERITY] =		5;
	attribute	[ATR_MANA_MAX] 	=		0;
	attribute	[ATR_MANA] 		=		0;

	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;

	attribute	[ATR_HITPOINTS_MAX] 	=	30;
	attribute	[ATR_HITPOINTS] 		=	30;

	// Hier noch die Spells anmelden , für ausgrauen (CreateSpell)

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	2000;
};

