//#################################################################################################
//##
//##	Heilwirkung und Kosten von Pflanzen
//##
//#################################################################################################

// alchemistisch genutzte Pflanzen
const int	Value_MoutainMoss	=	2;			const int	HP_MoutainMoss		=	 5;
const int	Value_Stoneroot		=	2;			const int	HP_Stoneroot		=	 0;
const int	Value_BloodThistle	=	2;			const int	HP_BloodThistle		=  -10;
const int	Value_OrcLeaf		=	2;			const int	Mana_OrcLeaf		=	 1;
const int	Value_RavenHerb		=	10;			const int	Mana_RavenHerb		=	 3;
const int	Value_Nightshade	=	25;			const int	Mana_Nightshade		=	10;


// beim Kochen benutzte Pflanzen
const int	Value_CaveMushroom	=	2;			const int	HP_CaveMushroom		=	10;
const int	Value_Swampweed		=	5;			const int	Mana_Swampweed		=	 5;


// sonstige Pflanzen
const int	Value_Woodberry		=	3;			const int	HP_Woodberry		=	20;
const int	Value_Flameberry	=	6;			const int	HP_Flameberry		=	40;
const int	Value_Trollberry	=	10;			const int	HP_Trollberry		=	-1000;






//#################################################################################################
//##
//##	alchemistisch genutzte Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Bergmoos
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_MountainMoss(C_Item)
{
	name 				=	NAME_MountainMoss;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MoutainMoss;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseMountainMoss;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MoutainMoss;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MoutainMoss;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseMountainMoss ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseMountainMoss");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MoutainMoss);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Steinwurzel
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Stoneroot(C_Item)
{
	name 				=	NAME_Stoneroot;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stoneroot;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   UseStoneroot;
	scemeName			=	"FOOD";

	description			=	name;
//	TEXT[0]				=	"Diese Pflanze wirkt wie ein starkes";
	TEXT[0]				=	"Tyto rostliny působí jako";
//	TEXT[1]				=	"Schlafmittel!";
	TEXT[1]				=	"silný uspávací prostředek!";
	TEXT[3]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Stoneroot;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Stoneroot;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseStoneroot ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseStoneroot");
		AI_StartState		(self,	ZS_Unconscious, 1, "");
	};

//////////////////////////////////////////////////////////////////////////////////
//	Blutdistel
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_BloodThistle(C_Item)
{
	name 				=	NAME_BloodThistle;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodThistle;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   UseBloodThistle;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_BloodThistle;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_BloodThistle;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseBloodThistle ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseBloodThistle");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_BloodThistle);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Orkblatt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_OrcLeaf(C_Item)
{
	name 				=	NAME_OrcLeaf;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_OrcLeaf;

	visual 				=	"ItFo_Plants_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseOrcLeaf;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_Mana;			COUNT[1]		= Mana_OrcLeaf;
	change_atr[0]		=	ATR_MANA;					change_value[0]	= Mana_OrcLeaf;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseOrcLeaf ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseOrcLeaf");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_OrcLeaf);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Rabenkraut
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_RavenHerb(C_Item)
{
	name 				=	NAME_RavenHerb;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_RavenHerb;

	visual 				=	"ItFo_Plants_Herb_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	UseRavenHerb;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_Mana;			COUNT[1]		= Mana_RavenHerb;
	change_atr[0]		=	ATR_MANA;					change_value[0]	= Mana_RavenHerb;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseRavenHerb ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseRavenHerb");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_RavenHerb);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Nachtschatten
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Nightshade(C_Item)
{
	name 				=	NAME_Nightshade;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nightshade;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         =   UseNightshade;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_Mana;			COUNT[1]		= Mana_Nightshade;
	change_atr[0]		=	ATR_MANA;					change_value[0]	= Mana_Nightshade;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseNightshade ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseNightshade");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Nightshade);
	};





//#################################################################################################
//##
//##	beim Kochen benutzte Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Höhlenpilz
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_CaveMushroom(C_Item)
{
	name 				=	NAME_CaveMushroom;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CaveMushroom;

	visual 				=	"ItFo_Plants_mushroom_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   UseCaveMushroom;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_CaveMushroom;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_CaveMushroom;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseCaveMushroom ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseCaveMushroom");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_CaveMushroom);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Sumpfkraut
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Swampweed(C_Item)
{
	name 				=	NAME_Swampweed;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Swampweed;

	visual 				=	"ItMi_Plants_Swampherb_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseSwampweed;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= Mana_SwampWeed;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= Mana_SwampWeed;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseSwampweed ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseSwampweed");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	Mana_SwampWeed);
	};



//#################################################################################################
//##
//##	sonstige Pflanzen
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Waldbeere
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Woodberry(C_ITEM)
{
	name 				=	NAME_Woodberry	;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Woodberry;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseWoodberry;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Woodberry;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Woodberry;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

	func void UseWoodberry ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseWoodberry");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Woodberry);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Flammbeere
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Flameberry(C_Item)
{
	name 				=	NAME_Flameberry;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Flameberry;

	visual 				=	"ItFo_Plants_Flameberry_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseFlameberry;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Flameberry;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Flameberry;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseFlameberry ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseFlameberry");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Flameberry);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Trollkirsche
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItPl_Trollberry(C_Item)
{
	name 				=	NAME_Trollberry;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollberry;

	visual 				=	"ItFo_Plants_Trollberrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseTrollberry;
	scemeName			=	"FOOD";

	description			=	name;
//	TEXT[1]				=	"Diese Beeren sind für Menschen";
	TEXT[1]				=	"Tyto bobule jsou pro lidi";
//	TEXT[2]				=	"hochgradig giftig!";
	TEXT[2]				=	"nesmírně jedovaté!";
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Trollberry;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseTrollberry ()
	{
		PrintDebugNpc 		(PD_ITEM_MOBSI, "UseTrollberry");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Trollberry);
	};



