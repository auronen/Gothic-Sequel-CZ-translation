//-------- Schwerter --------
const int	Damage_Shortsword		=	20;		const int	Value_Shortsword		=	50;	    const int	Str_Shortsword		=	20;
const int	Damage_Longsword		=	50;		const int	Value_Longsword			=	100;    const int	Str_Longsword		=	30;
const int	Damage_Broadsword		=	80;		const int	Value_Broadsword		=	300;    const int	Str_Broadsword		=	50;
const int	Damage_Bastardsword		=	90;		const int	Value_Bastardsword		=	500;	const int	Str_Bastardsword	=	70;
const int	Damage_2HSword			=	120;	const int	Value_2HSword			=	1000;	const int	Str_2HSword			=	90;
const int	Damage_OrcSword			=	150;	const int	Value_OrcSword			=	5000;	const int	Str_OrcSword		=	100;

//-------- Äxte --------
const int	Damage_Hatchet			=	30;		const int	Value_Hatchet			=	100;    const int	Str_Hatchet			=	30;
const int	Damage_Battleaxe		=	60;		const int	Value_Battleaxe			=	200;    const int	Str_Battleaxe		=	60;
const int	Damage_DoublebladedAxe	=	100;	const int	Value_DoublebladedAxe	=	500;	const int	Str_DoublebladedAxe	=	120;
const int	Damage_BerserkAxe		=	130;	const int	Value_BerserkAxe		=	1000;	const int	Str_BerserkAxe		=	150;
const int	Damage_OrcAxe			=	160;	const int	Value_OrcAxe			=	5000;	const int	Str_OrcAxe			=	175;

//-------- Stumpfwaffen --------
const int	Damage_IronClub			=	40;		const int	Value_IronClub			=	100;    const int	Str_IronClub		=	30;
const int	Damage_Mace				=	70;		const int	Value_Mace				=	200;    const int	Str_Mace			=	75;
const int	Damage_Morningstar		=	110;	const int	Value_Morningstar		=	500;	const int	Str_Morningstar		=	125;
const int	Damage_Warhammer		=	140;	const int	Value_Warhammer			=	1000;	const int	Str_Warhammer		=	175;
const int	Damage_OrcHammer		=	170;	const int	Value_OrcHammer			=	5000;	const int	Str_OrcHammer		=	200;

//-------- Erz --------
const int	Damage_BloodOre			=	100;	const int	Value_BloodOre			=	100;    const int	Str_BloodOre		=	100;
const int	Damage_DarkOre			=	100;	const int	Value_DarkOre			=	100;	const int	Str_DarkOre			=	100;

//-------- Kampfstäbe --------
const int	Damage_Battlestaff		=	100;	const int	Value_Battlestaff		=	1000;	const int	Str_Battlestaff		=	100;		const int	Dex_Battlestaff		=	100;

//-------- provisorische Waffen --------
const int	Damage_Club				=	10;		const int	Value_Club				=	10; 	const int	Str_Club			=	10;
const int	Damage_Poker			=	10;		const int	Value_Poker				=	10;     const int	Str_Poker			=	10;
const int	Damage_Sickle			=	10;		const int	Value_Sickle			=	10;     const int	Str_Sickle			=	10;
const int	Damage_Pickaxe			=	10;		const int	Value_Pickaxe			=	10;     const int	Str_Pickaxe			=	10;
const int	Damage_Sledgehammer		=	10;		const int	Value_Sledgehammer		=	100;    const int	Str_Sledgehammer	=	10;
const int	Damage_Scythe			=	10;		const int	Value_Scythe			=	10;     const int	Str_Scythe			=	10;
const int	Damage_RustySword		=	10;		const int	Value_RustySword		=	10;		const int	Str_RustySword		=	10;
const int	Damage_WitheredAxe		=	10;		const int	Value_WitheredAxe		=	10;		const int	Str_WitheredAxe		=	10;
const int	Damage_Nailmace			=	10;		const int	Value_Nailmace			=	10;		const int	Str_Nailmace		=	10;
const int	Damage_NotchedMace		=	10;		const int	Value_NotchedMace		=	10;		const int	Str_NotchedMace		=	10;

//-------- Gildenwaffen --------
const int	Damage_MilitiaSword		=	50;		const int	Value_MilitiaSword		=	10;		const int	Str_MilitiaSword	=	30;
const int	Damage_PaladinSword		=	120;	const int	Value_PaladinSword		=	100;	const int	Str_PaladinSword	=	90;
const int	Damage_DemonHunterAxe	=	130;	const int	Value_DemonHunterAxe	=	100;	const int	Str_DemonHunterAxe	=	150;
const int	Damage_AuxiliaryMace	=	70;		const int	Value_AuxiliaryMace		=	20;		const int	Str_AuxiliaryMace	=	60;





//////////////////////////////////////////////////////////////////////////////////
//	B_CalcValue
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcValue (var int value, var int percentage)
{
	return	((value*percentage)/100);
};

//////////////////////////////////////////////////////////////////////////////////
//	B_CalcDamage
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcDamage (var int damage, var int percentage)
{
	return	((damage*percentage)/100);
};

//////////////////////////////////////////////////////////////////////////////////
//	B_CalcStr
//////////////////////////////////////////////////////////////////////////////////
func int B_CalcStr (var int str, var int percentage)
{
	return	((str*percentage)/100);
};










//*********************************************************************************
//
//
//		S C H W E R T E R
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Kurzschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Shortsword (C_Item)
{
	name				=	NAME_Shortsword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Shortsword;

	damageTotal			=	Damage_Shortsword;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Shortsword;
	visual				=	"ItMw_1H_Sword_Short_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Langschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Longsword	(C_Item)
{
	name				=	NAME_Longsword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Longsword;

	damageTotal			=	Damage_Longsword;
	damagetype			=	DAM_EDGE;
	range				=	120;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Longsword;
	visual				=	"ItMw_1H_Sword_Long_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Breitschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Broadsword (C_Item)
{
	name				=	NAME_Broadsword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Broadsword;

	damageTotal			=	Damage_Broadsword;
	damagetype			=	DAM_EDGE;
	range				=	130;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Broadsword;
	visual				=	"ItMw_1H_Sword_Broad_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



//////////////////////////////////////////////////////////////////////////////////
//	Bastardschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Bastardsword (C_Item)
{
	name				=	NAME_Bastardsword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Bastardsword;

	damageTotal			=	Damage_Bastardsword;
	damagetype			=	DAM_EDGE;
	range				=	130;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Bastardsword;
	visual				=	"ItMw_1H_Sword_Bastard_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Zweihänder
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_2HSword (C_Item)
{
	name				=	NAME_2HSword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_2HSword;

	damageTotal			=	Damage_2HSword;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_2HSword;
	visual				=	"ItMw_2H_Sword_Heavy_02.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Orkschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Orcsword (C_Item)
{
	name				=	NAME_Orcsword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_OrcSword;

	damageTotal			=	Damage_OrcSword;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_OrcSword;
	visual				=	"ItMw_2H_OrcSword_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};








//*********************************************************************************
//
//
//		Ä X T E
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Beil
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Hatchet (C_Item)
{
	name				=	NAME_Hatchet;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Hatchet;

	damageTotal			=	Damage_Hatchet;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Hatchet;
	visual				=	"ItMw_1H_Hatchet_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Streitaxt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Battleaxe	(C_Item)
{
	name				=	NAME_Battleaxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Battleaxe;

	damageTotal			=	Damage_Battleaxe;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Battleaxe;
	visual				=	"ItMw_1H_Axe_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



//////////////////////////////////////////////////////////////////////////////////
//	Doppelblattaxt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_DoublebladedAxe (C_Item)
{
	name				=	NAME_DoublebladedAxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_DoublebladedAxe;

	damageTotal			=	Damage_DoublebladedAxe;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_DoublebladedAxe;
	visual				=	"ItMw_2H_Axe_heavy_03.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Berserkeraxt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_BerserkAxe (C_Item)
{
	name				=	NAME_BerserkAxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_WOOD;

	value				=	Value_BerserkAxe;

	damageTotal			=	Damage_BerserkAxe;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_BerserkAxe;
	visual				=	"ItMw_2H_Axe_Heavy_04.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Orkaxt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Orcaxe (C_Item)
{
	name				=	NAME_Orcaxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_OrcAxe;

	damageTotal			=	Damage_OrcAxe;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_OrcAxe;
	visual				=	"ItMw_2H_OrcAxe_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};







//*********************************************************************************
//
//
//		S T U M P F W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Eisenkeule
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_IronClub (C_Item)
{
	name				=	NAME_IronClub;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_IronClub;

	damageTotal			=	Damage_IronClub;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_IronClub;
	visual				=	"ItMw_1H_Mace_Light_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



//////////////////////////////////////////////////////////////////////////////////
//	Streitkolben
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Mace (C_Item)
{
	name 				=	NAME_Mace;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;
	material 			=	MAT_METAL;

	value 				=	Value_Mace;

	damageTotal			=   Damage_Mace;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_Mace;
	visual				=	"ItMw_1H_Mace_War_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



//////////////////////////////////////////////////////////////////////////////////
//	Morgenstern
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Morningstar (C_Item)
{
	name				=	NAME_Morningstar;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Morningstar;

	damageTotal			=	Damage_Morningstar;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Morningstar;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	=	damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	=	cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	=	value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Kriegshammer
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Warhammer	(C_Item)
{
	name				=	NAME_Warhammer;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Warhammer;

	damageTotal			=	Damage_Warhammer;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Warhammer;
	visual				=	"ItMw_2H_OrcMace_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};





//////////////////////////////////////////////////////////////////////////////////
//	Orkhammer
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_OrcHammer	(C_Item)
{
	name				=	NAME_OrcHammer;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_OrcHammer;

	damageTotal			=	Damage_OrcHammer;
	damagetype			=	DAM_BLUNT;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_OrcHammer;
	visual				=	"ItMw_2H_OrcMace_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};















//*********************************************************************************
//
//
//		PROVISORISCHE WAFFEN
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Keule
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Club (C_Item)
{
	name				=	NAME_Club;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE;
	material			=	MAT_WOOD;

	value				=	Value_Club;

	damageTotal			=	Damage_Club;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Club;
	visual				=	"ItMw_1H_Club_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schürhaken
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Poker	(C_Item)
{
	name				=	NAME_Poker;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD;
	material			=	MAT_METAL;

	value				=	Value_Poker;

	damageTotal			=	Damage_Poker;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Poker;
	visual				=	"ItMw_1H_Poker_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Sichel
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Sickle (C_Item)
{
	name				=	NAME_Sickle;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE;
	material			=	MAT_METAL;

	value				=	Value_Sickle;

	damageTotal			=	Damage_Sickle;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Sickle;
	visual				=	"ItMw_1H_Sickle_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Spitzhacke
//	- Auch für Mobsi-Benutzung (PickOre)
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Pickaxe (C_Item)
{
	name				=	NAME_Pickaxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE;

	value				=	Value_Pickaxe;

	damageTotal			=	Damage_Pickaxe;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Pickaxe;
	visual				=	"ItMw_2H_Pickaxe_01.3DS";
	material			=	MAT_WOOD;

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMw_BloodPickaxe	(C_Item)
{
	name				=	NAME_Pickaxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE;

	value				=	B_CalcValue(Value_Pickaxe, Value_BloodOre);

	damageTotal			=	B_CalcDamage(Damage_Pickaxe, Damage_BloodOre);
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	B_CalcStr(Str_Pickaxe, Str_BloodOre);
	visual				=	"ItMw_2H_Pickaxe_01.3DS";
	material			=	MAT_METAL;

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schmiedehammer
//	- Auch für Mobsi-Benutzung (Schmieden)
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Sledgehammer (C_Item)
{
	name				=	NAME_Sledgehammer;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE;
	material			=	MAT_WOOD;

	value				=	Value_Sledgehammer;

	damageTotal			=	Damage_Sledgehammer;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Sledgehammer;
	visual				=	"ItMw_1H_Sledgehammer_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Sense
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Scythe (C_Item)
{
	name				=	NAME_Scythe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE;
	material			=	MAT_WOOD;

	value				=	Value_Scythe;

	damageTotal			=	Damage_Scythe;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Scythe;
	visual				=	"ItMw_1H_Scythe_01.3DS";

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	rostiges Schwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_RustySword (C_Item)
{
//	name 				=	"Rostiges Schwert";
	name 				=	"Rezavý meč";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_RustySword;

	damageTotal			= 	Damage_RustySword;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_RustySword;
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	TEXT[0]				= NAME_TypeOneHanded;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[0];
	TEXT[4] 			= NAME_TypeOneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Nagelkeule
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Nailmace (C_Item)
{
//	name 				=	"Nagelkeule";
	name 				=	"Ostnatý kyj";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Nailmace;

	damageTotal			= 	Damage_Nailmace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_Nailmace;
	visual 				=	"ItMw_1H_Nailmace_01.3DS";

	description			= name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[0];
	TEXT[4] 			= NAME_TypeOneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Verwitterte Axt
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_WitheredAxe (C_Item)
{
//	name 				=	"Verwitterte Axt";
	name 				=	"Rozpadlá sekyra";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_WitheredAxe;

	damageTotal     	=   Damage_WitheredAxe;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_WitheredAxe;
	visual 				=	"ItMw_1H_Axe_Old_01.3DS";

	description			= name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[0];
	TEXT[4] 			= NAME_TypeOneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Schartiger Streitkolben
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_NotchedMace (C_Item)
{
//	name 				=	"schartiger Streitkolben";
	name 				=	"Zubatý palcát";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_NotchedMace;

	damageTotal			=   Damage_NotchedMace;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_NotchedMace;
	visual 				=	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[0];
	TEXT[4] 			= NAME_TypeOneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

















//*********************************************************************************
//
//
//		K A M P F S T Ä B E
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Kampfstab
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_BattleStaff (C_Item)
{
	name				=	NAME_Battlestaff;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_STAFF;
	material			=	MAT_METAL;

	value				=	Value_Battlestaff;

	range				= 	250;

	damageTotal			=	Damage_Battlestaff;
	damageType			=	DAM_BLUNT;
	visual				=	"ItMw_2H_StaffLong_01.3DS";

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_BattleStaff;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	Dex_BattleStaff;

	description			=	name;
	TEXT[0] 			=	NAME_TypeStaff;
	TEXT[1]				=	NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			=	NAME_Str_needed;				COUNT[2]	= cond_value[0];
	TEXT[3] 			=	NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[5]				=	NAME_Value;						COUNT[5]	= value;
};








//*********************************************************************************
//
//
//		G i l d e n  -   W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Milizschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_MilitiaSword	(C_Item)
{
	name				=	NAME_MilitiaSword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_MilitiaSword;
	ownerGuild			=	GIL_MILITIA;

	damageTotal			=	Damage_MilitiaSword;
	damagetype			=	DAM_EDGE;
	range				=	120;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_MilitiaSword;
	visual				=	"ItMw_1H_Sword_Long_02.3DS";

	description			=	name;
//	TEXT[0]				=	"Nur Milizsoldaten tragen diese Art";
//	TEXT[1]				=	"der Langschwerter.";
	TEXT[0]				=	"Pouze příslušníci milice nosí";
	TEXT[1]				=	"tento typ dlouhého meče.";
	TEXT[2]				=	NAME_TypeOneHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[3]	= damageTotal;
	TEXT[4]				=	NAME_Str_needed;			COUNT[4]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Paladin-Zweihänder
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_PaladinSword (C_Item)
{
	name				=	NAME_PaladinSword;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_PaladinSword;
	ownerGuild			=	GIL_PALADIN;

	damageTotal			=	Damage_PaladinSword;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_PaladinSword;
	visual				=	"ItMw_2H_Sword_Heavy_03.3DS";

	description			=	name;
//	TEXT[0]				=	"Nur die Paladine des Königs tragen";
//	TEXT[1]				=	"solche zweihändigen Schwerter.";
	TEXT[0]				=	"Pouze královi paladinové";
	TEXT[1]				=	"nosí tento obouruční meč.";
	TEXT[2]				=	NAME_TypeTwoHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[3]	= damageTotal;
	TEXT[4]				=	NAME_Str_needed;			COUNT[4]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Dämonenjäger-Axt
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_DemonhunterAxe (C_Item)
{
	name				=	NAME_DemonhunterAxe;

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE|ITEM_MULTI;
	material			=	MAT_WOOD;

	value				=	Value_DemonhunterAxe;
	ownerGuild			=	GIL_DEMONHUNTER;

	damageTotal			=	Damage_DemonhunterAxe;
	damagetype			=	DAM_EDGE;
	range				=	150;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_DemonhunterAxe;
	visual				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			=	name;
//	TEXT[0]				=	"Die Dämonenjäger führen solche";
//	TEXT[1]				=	"wuchtigen Zweihandäxte.";
	TEXT[0]				=	"Lovci démonů používají tyto";
	TEXT[1]				=	"masivní obouruční sekyry.";
	TEXT[2]				=	NAME_TypeTwoHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[3]	= damageTotal;
	TEXT[4]				=	NAME_Str_needed;			COUNT[4]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Streitkolben der Hilfstruppen
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_AuxiliaryMace (C_Item)
{
	name 				=	NAME_AuxiliaryMace;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;
	material 			=	MAT_METAL;

	value 				=	Value_AuxiliaryMace;

	damageTotal			=   Damage_AuxiliaryMace;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_AuxiliaryMace;
	visual				=	"ItMw_1H_Mace_War_02.3DS";

	description			=	name;
//	TEXT[0]				=	"Ein Streitkolben wie sie die";
//	TEXT[1]				=	"Hilfstruppen des Königs tragen.";
	TEXT[0]				=	"Palcát, který používají";
	TEXT[1]				=	"pomocné královy jendotky.";
	TEXT[2]				=	NAME_TypeOneHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[4] 			=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};











//*********************************************************************************
//
//
//		p e r s ö n l i c h e     W A F F E N
//
//
//*********************************************************************************

//////////////////////////////////////////////////////////////////////////////////
//	Grims Spitzhacke
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Grim_Pickaxe (C_Item)
{
//	name				=	"Grim's Spitzhacke";
	name				=	"Grimův krumpáč";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_2HD_AXE;

	value				=	Value_Pickaxe;

	damageTotal			=	Damage_Pickaxe;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Pickaxe;
	visual				=	"ItMw_2H_Pickaxe_01.3DS";
	material			=	MAT_WOOD;

	owner				=	MIN_306_Grim;

	description			=	name;
	TEXT[0]				=	NAME_TypeTwoHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Goliath's Schmiedehammer
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Goliath_Sledgehammer (C_Item)
{
//	name				=	"Goliath's Schmiedehammer";
	name				=	"Goliášovo kovářské kladivo";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_AXE;
	material			=	MAT_WOOD;

	value				=	Value_Sledgehammer;

	damageTotal			=	Damage_Sledgehammer;
	damagetype			=	DAM_BLUNT;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Sledgehammer;
	visual				=	"ItMw_1H_Sledgehammer_01.3DS";

	owner				=	WRK_216_Goliath;

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Brutus' Langschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Brutus_Longsword	(C_Item)
{
//	name				=	"Brutus' Langschwert";
	name				=	"Brutův dlouhý meč";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Longsword;

	damageTotal			=	Damage_Longsword;
	damagetype			=	DAM_EDGE;
	range				=	120;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Longsword;
	visual				=	"ItMw_1H_Sword_Long_01.3DS";

	owner				=	MIL_121_Brutus;

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Malgar's Breitschwert
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Malgar_Broadsword (C_Item)
{
//	name				=	"Malgar's Breitschwert";
	name				=	"Malgarův široký meč";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Broadsword;

	damageTotal			=	Damage_Broadsword;
	damagetype			=	DAM_EDGE;
	range				=	130;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Broadsword;
	visual				=	"ItMw_1H_Sword_Broad_01.3DS";

	owner				=	DMH_1302_Malgar;

	description			=	name;
	TEXT[0]				=	NAME_TypeOneHanded;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3]				=	NAME_Str_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Thora's Kampfstab
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Thora_BattleStaff (C_Item)
{
//	name				=	"Thora's Kampfstab";
	name				=	"Thořina bojová hůl";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_STAFF;
	material			=	MAT_METAL;

	value				=	Value_Battlestaff;

	range				= 	250;

	damageTotal			=	Damage_Battlestaff;
	damageType			=	DAM_BLUNT;
	visual				=	"ItMw_2H_StaffLong_01.3DS";

	cond_atr[0]   		= 	ATR_STRENGTH;
	cond_value[0]  		= 	Str_BattleStaff/2;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	Dex_BattleStaff/2;

	owner				=	AMZ_900_Thora;

	description			=	name;
	TEXT[0] 			=	NAME_TypeStaff;
	TEXT[1]				=	NAME_Damage;					COUNT[1]	= damageTotal;
	TEXT[2] 			=	NAME_Str_needed;				COUNT[2]	= cond_value[0];
	TEXT[3] 			=	NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[5]				=	NAME_Value;						COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Kurzschwert des Arenameisters
//////////////////////////////////////////////////////////////////////////////////
instance ItMw_Arenamaster_Sword (C_Item)
{
//	name				=	"Gladiatorenzucht";
	name				=	"Cvičitel gladiátorů";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Shortsword;
	owner				=	MIL_122_Arenamaster;

	damageTotal			=	Damage_Shortsword;
	damagetype			=	DAM_EDGE;
	range				=	100;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Shortsword;
	visual				=	"ItMw_1H_Sword_Short_05.3DS";

	description			=	name;
//	TEXT[0]				=	"Die persönliche Waffe des Arenameisters";
//	TEXT[1]				=	"ist eher eine Zierwaffe als alles andere.";
	TEXT[0]				=	"Osobní zbraň mistra arény.";
	TEXT[1]				=	"Spíš na parádu než na cokoliv jiného.";
	TEXT[2]				=	NAME_TypeOneHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[3]	= damageTotal;
	TEXT[4]				=	NAME_Str_needed;			COUNT[4]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

//////////////////////////////////////////////////////////////////////////////////
//	Diego's Langschwert
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMw_Diego_Sword	(C_Item)
{
//	name				=	"Brutus' Langschwert";
	name				=	"Diegův dlouhý meč";

	mainflag			=	ITEM_KAT_NF;
	flags				=	ITEM_SWD|ITEM_MULTI;
	material			=	MAT_METAL;

	value				=	Value_Longsword;

	damageTotal			=	Damage_Longsword;
	damagetype			=	DAM_EDGE;
	range				=	120;

	cond_atr[0]			=	ATR_STRENGTH;
	cond_value[0]		=	Str_Longsword;
	visual				=	"ItMw_1H_Sword_Long_05.3DS";

//	owner				=	MIL_121_Brutus;
	owner				=	PC_Thief;

	description			=	name;
//	TEXT[0]				=	"Diego's Langschert ist schlicht aber";
//	TEXT[1]				=	"präzise. Die Waffe eines Meisters.";
	TEXT[0]				=	"Diegův dlouhý meč je jednoduchý, ale velice ";
	TEXT[1]				=	"precizně vyhotovený meč. Zbraň mistra!";
	TEXT[2]				=	NAME_TypeOneHanded;
	TEXT[3]				=	NAME_Damage;				COUNT[3]	= damageTotal;
	TEXT[4]				=	NAME_Str_needed;			COUNT[4]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};











	