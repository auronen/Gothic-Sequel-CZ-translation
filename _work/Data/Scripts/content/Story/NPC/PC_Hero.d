
INSTANCE PC_Hero(C_NPC)

{
	//-------- primary data --------
	name 			= "Ich";
	Npctype			= NPCTYPE_MAIN;
	guild			= GIL_NONE;
	level			= 0;
	voice			= 15;
	id				= 0;
	exp				= 0;
	exp_next		= 500;
	lp				= HERO_START_LP;

	//--------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	80;
	attribute[ATR_HITPOINTS] =		80;

	//-------- protection -----
	protection[PROT_EDGE]	=       0;
	protection[PROT_EDGE]	=       0;
	protection[PROT_BLUNT]	=       0;
	protection[PROT_POINT]	=       0;
	protection[PROT_FIRE]	=       0;
	protection[PROT_MAGIC]	=       0;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual			(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody		(self,"hum_body_Naked0",	5,			1,			"Hum_Head_Pony",	9, 			0,			-1);

	//--------- talents -------------


	//-------- inventory --------


};


