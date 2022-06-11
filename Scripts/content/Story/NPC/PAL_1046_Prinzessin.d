instance PAL_1046_Prinzessin		(C_NPC)
{


		//-------- primary data --------
		// name								=	"Prinzessin";
		name								=	"Princezna";
		guild								=	GIL_PALADIN;
		npctype								=	NPCTYPE_FEMALE;
		level								=	35;
		voice								=	16;
		id									=	1046;

		//-------- attributes ----------
		attribute [ATR_STRENGTH]			=	100;
		attribute [ATR_DEXTERITY]			=	100;
		attribute [ATR_MANA_MAX]			=	300;
		attribute [ATR_MANA]				=	300;
		attribute [ATR_HITPOINTS_MAX]		=	400;
		attribute [ATR_HITPOINTS]			=	400;
		attribute [ATR_REGENERATEMANA]		=	0;
		attribute [ATR_REGENERATEHP]		=	0;

		//-------- protection ----------
		protection [PROT_EDGE]				=	100;
		protection [PROT_BLUNT]				=	100;
		protection [PROT_POINT]				=	50;
		protection [PROT_FIRE]				=	50;
		protection [PROT_MAGIC]				=	50;

		protection [PROT_FALL]				=	0;
		protection [PROT_FLY]				=	0;
		protection [PROT_BARRIER]			=	0;

		//-------- visuals -------------
		Mdl_SetVisual						(self, "babe.mds"); 					// basic animation file
		Mdl_SetVisualBody					(self, "Bab_Body_Princess", 3, 1, "Bab_Head_Hair1.mms", 4, 0, -1);
		B_Scale								(self); 								//auto-matching scale with strength
		Mdl_SetModelFatness					(self,  0);

		//-------- talents -------------
		Npc_SetTalentSkill					(self, NPC_TALENT_STAFF,  2);

		//-------- inventory -----------

		

		//-------- ai ------------------
		fight_tactic						=	FAI_HUMAN_MASTER;
		daily_routine						=	Rtn_Start_1046;
		senses_range						=	2000;
		senses								=	SENSE_SEE | SENSE_HEAR | SENSE_SMELL;

		//-- not identified by flex ----
	aivar[AIV_FEMALE]			=	TRUE;
	//aivar[AIV_TALENT_STAFF]	=	TALENT_STAFF_2;
	//aivar[AIV_ARENA_VICTORIES]	=	THORA_VICTORIES_START;


};

// ---------------------------------------------------------
// daily routines
// ---------------------------------------------------------
func void Rtn_Start_1046		()
{
	TA_Stay			(00,00,12,00,	"BF_PRINCESS_1");
	TA_Stay			(12,00,00,00,	"BF_PRINCESS_1");
};
func void Rtn_Bath_1046		()
{
	TA_Bathing_Babe			(00,00,12,00,	"BF_PRINCESS_WASH");
	TA_Bathing_Babe			(12,00,00,00,	"BF_PRINCESS_WASH");
};
func void Rtn_Suicide_1046		()
{
	TA_Stay			(00,00,12,00,	"BF_PRINCESS_SUICIDE");
	TA_Stay			(12,00,00,00,	"BF_PRINCESS_SUICIDE");
};