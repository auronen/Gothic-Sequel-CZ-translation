instance KDF_1101_Feoras (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Feoras";
	npctype		=	npctype_main;
	guild 		=	GIL_KDF;      
	level 		=	27;
	voice 		=	14;
	id 			=	1101;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 364;
	attribute[ATR_HITPOINTS] 	= 364;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald", 5, 1, KDF_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);


	//-------- Spells--------                                    
	

	//-------- inventory --------                                    
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1101;

};

FUNC VOID Rtn_start_1101 ()
{
	TA_MakeRune		(19,01,07,01,"BF_MAGE1_RUNE");
	TA_MakeRune		(07,01,19,01,"BF_MAGE1_RUNE");
};





