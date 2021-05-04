//********************************************************************************
//
//	Material fürs Schmieden
//
//********************************************************************************

// Erznuggets
const int	Value_OreNugget				=	1;
const int	Value_BloodOreNugget		=	10;
const int	Value_DarkOreNugget			=	50;

// Ergiebigkeit
const int	Cost_RawIron				=	20;		// benötigte Erznuggets
const int	Cost_RawLongIron			=	40;		// benötigte Erznuggets

// Roheisen
const int	Value_RawIron				=	10;
const int	Value_RawLongIron			=	20;
const int	Value_BloodRawLongIron		=	(Value_RawLongIron		*	Value_BloodOre	) / 100;
const int	Value_DarkRawLongIron		=	(Value_RawLongIron		*	Value_DarkOre	) / 100;

// glühender Roheisen
const int	Value_HotIron				=	10;
const int	Value_HotLongIron			=	20;
const int	Value_BloodHotLongIron		=	(Value_HotLongIron		*	Value_BloodOre	) / 100;
const int	Value_DarkHotLongIron		=	(Value_HotLongIron		*	Value_DarkOre	) / 100;

// glühende Klingen
const int	Value_HotSwordBlade			=	10;
const int	Value_HotAxeBlade			=	10;
const int	Value_HotStump				=	10;
const int	Value_Hot2HSwordBlade		=	20;
const int	Value_Hot2HAxeBlade			=	20;
const int	Value_Hot2HStump			=	20;

// glühende Bluterz-Klingen
const int	Value_BloodHot2HSwordBlade	=	(Value_Hot2HSwordBlade	*	Value_BloodOre) / 100;
const int	Value_BloodHot2HAxeBlade	=	(Value_Hot2HAxeBlade	*	Value_BloodOre) / 100;
const int	Value_BloodHot2HStump		=	(Value_Hot2HStump		*	Value_BloodOre) / 100;

// glühende Dunkelerz-Klingen
const int	Value_DarkHot2HSwordBlade	=	(Value_Hot2HSwordBlade	*	Value_DarkOre) / 100;
const int	Value_DarkHot2HAxeBlade		=	(Value_Hot2HAxeBlade	*	Value_DarkOre) / 100;
const int	Value_DarkHot2HStump		=	(Value_Hot2HStump		*	Value_DarkOre) / 100;

// Klingen
const int	Value_SwordBlade			=	10;
const int	Value_AxeBlade				=	10;
const int	Value_Stump					=	10;
const int	Value_2HSwordBlade			=	20;
const int	Value_2HAxeBlade			=	20;
const int	Value_2HStump				=	20;

// Bluterz-Klingen
const int	Value_Blood2HSwordBlade		=	(Value_2HSwordBlade		*	Value_BloodOre) / 100;
const int	Value_Blood2HAxeBlade		=	(Value_2HAxeBlade		*	Value_BloodOre) / 100;
const int	Value_Blood2HStump			=	(Value_2HStump			*	Value_BloodOre) / 100;

// Dunkelerz-Klingen
const int	Value_Dark2HSwordBlade		=	(Value_2HSwordBlade		*	Value_DarkOre) / 100;
const int	Value_Dark2HAxeBlade		=	(Value_2HAxeBlade		*	Value_DarkOre) / 100;
const int	Value_Dark2HStump			=	(Value_2HStump			*	Value_DarkOre) / 100;







//////////////////////////////////////////////////////////////////////////////////
//	Erznuggets
//////////////////////////////////////////////////////////////////////////////////
instance ItMi_OreNugget (C_Item)
{
	name 				=	NAME_Nugget;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_OreNugget;

	visual 				=	"ItMi_Nugget_01.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMi_BloodOreNugget (C_Item)
{
	name 				=	NAME_BloodNugget;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodOreNugget;

	visual 				=	"ItMi_Nugget_02.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMi_DarkOreNugget (C_Item)
{
	name 				=	NAME_DarkNugget;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkOreNugget;

	visual 				=	"ItMi_Nugget_03.3ds";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	Roheisen
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_RawIron (C_Item)
{
	name 				=	ConcatStrings(NAME_RawIron, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_RawIron;

	visual 				=	"ItMi_SmithSword_Raw_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMi_RawLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_RawLongIron, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_RawLongIron;

	visual 				=	"ItMi_SmithSword_Raw_02.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_BloodRawLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_RawLongIron, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodRawLongIron;

	visual 				=	"ItMi_SmithSword_RawBlood_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_DarkRawLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_RawLongIron, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkRawLongIron;

	visual 				=	"ItMi_SmithSword_RawDark_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	glühende Roheisen
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_HotIron (C_Item)
{
	name 				=	ConcatStrings(NAME_HotIron, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HotIron;

	visual 				=	"ItMi_SmithSword_Rawhot_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMi_HotLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_HotLongIron, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HotLongIron;

	visual 				=	"ItMi_SmithSword_Rawhot_03.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_BloodHotLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_HotLongIron, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodHotLongIron;

	visual 				=	"ItMi_SmithSword_RawhotBlood_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_DarkHotLongIron (C_Item)
{
	name 				=	ConcatStrings(NAME_HotLongIron, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkHotLongIron;

	visual 				=	"ItMi_SmithSword_RawhotDark_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


//////////////////////////////////////////////////////////////////////////////////
//	glühende Klingen
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_HotSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_HotSwordBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HotSwordBlade;

	visual 				=	"ItMi_SmithSword_Bladehot_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_HotAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_HotAxeBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HotAxeBlade;

	visual 				=	"ItMi_SmithSword_HotAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_HotStump (C_Item)
{
	name 				=	ConcatStrings(NAME_HotStump, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HotStump;

	visual 				=	"ItMi_SmithSword_HotStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Hot2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HSwordBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hot2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Bladehot_02.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Hot2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HAxeBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hot2HAxeBlade;

	visual 				=	"ItMi_SmithSword_Hot2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Hot2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HStump, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hot2HStump;

	visual 				=	"ItMi_SmithSword_Hot2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

instance ItMi_BloodHot2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HSwordBlade, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodHot2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Bladehot_03.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_BloodHot2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HAxeBlade, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodHot2HAxeBlade;

	visual 				=	"ItMi_SmithSword_HotBlood2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_BloodHot2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HStump, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodHot2HStump;

	visual 				=	"ItMi_SmithSword_HotBlood2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


instance ItMi_DarkHot2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HSwordBlade, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkHot2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Bladehot_04.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_DarkHot2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HAxeBlade, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkHot2HAxeBlade;

	visual 				=	"ItMi_SmithSword_HotDark2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_DarkHot2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_Hot2HStump, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkHot2HStump;

	visual 				=	"ItMi_SmithSword_HotDark2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



//////////////////////////////////////////////////////////////////////////////////
//	Klingen
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_SwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_SwordBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordBlade;

	visual 				=	"ItMi_SmithSword_Blade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_AxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_AxeBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_AxeBlade;

	visual 				=	"ItMi_SmithSword_AxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Stump (C_Item)
{
	name 				=	ConcatStrings(NAME_Stump, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stump;

	visual 				=	"ItMi_SmithSword_StumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HSwordBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Blade_02.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HAxeBlade, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_2HAxeBlade;

	visual 				=	"ItMi_SmithSword_2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_2HStump, NAME_Ore);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_2HStump;

	visual 				=	"ItMi_SmithSword_2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


instance ItMi_Blood2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HSwordBlade, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Blood2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Blade_03.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Blood2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HAxeBlade, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Blood2HAxeBlade;

	visual 				=	"ItMi_SmithSword_Blood2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Blood2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_2HStump, NAME_BloodOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Blood2HStump;

	visual 				=	"ItMi_SmithSword_Blood2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


instance ItMi_Dark2HSwordBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HSwordBlade, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dark2HSwordBlade;

	visual 				=	"ItMi_SmithSword_Blade_04.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Dark2HAxeBlade (C_Item)
{
	name 				=	ConcatStrings(NAME_2HAxeBlade, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dark2HAxeBlade;

	visual 				=	"ItMi_SmithSword_Dark2HAxeBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_Dark2HStump (C_Item)
{
	name 				=	ConcatStrings(NAME_2HStump, NAME_DarkOre);

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Dark2HStump;

	visual 				=	"ItMi_SmithSword_Dark2HStumpBlade_01.3DS";
	material 			=	MAT_METAL;

	description			=	name;
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



