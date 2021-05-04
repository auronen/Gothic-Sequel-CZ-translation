//#################################################################################################
//##
//##	Heilwirkung und Kosten von Nahrungsmitteln
//##
//#################################################################################################

const int	Value_Apple			=	 2;		const int	HP_Apple			=	12;
const int	Value_Grapes		=	 3;		const int	HP_Grapes			=	15;
const int	Value_Loaf			=	 2;		const int	HP_Loaf				=	12;
const int	Value_MuttonRaw		=	 2;		const int	HP_MuttonRaw		=	10;
const int	Value_Mutton		=	 3;		const int	HP_Mutton			=	20; // Rohes Fleisch mit Pfanne benutzt
const int	Value_Ham			=	 5;		const int	HP_Ham				=	30; // Schinken ist teuer M.F.
const int	Value_Cheese		=	 3;		const int	HP_Cheese			=	15;
const int	Value_Rice			=	 2;		const int	HP_Rice				=	10;

const int	Value_Beer			=	 5;		const int	HP_Beer				=	 0;
const int	Value_Wine			=	 8;		const int	HP_Wine				=	 0;// Wein ist teuer M.F.
const int	Value_Booze			=	 7;		const int	HP_Booze			=	 0;

const int	Value_Salt			=	 5;





//#################################################################################################
//##
//##	Essbares
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Apfel
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Apple(C_Item)
{
	name 				=	NAME_Apple;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Apple;

	visual 				=	"ItFo_Apple_01.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseApple;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Apple;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Apple;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseApple()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Apple);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Weintrauben
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Grapes(C_Item)
{
	name 				=	NAME_Grapes;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Grapes;

	visual 				=	"ItFo_Grapes_01.3ds";
	on_state[0]         = 	UseGrapes;
	scemeName			=	"FOOD";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Grapes;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Grapes;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	func void UseGrapes ()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Grapes);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Brot
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Loaf(C_Item)
{
	name 				=	NAME_Loaf;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Loaf;

	visual 				=	"ItFo_Loaf_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseLoaf;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Loaf;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Loaf;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseLoaf()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Loaf);
	};

//////////////////////////////////////////////////////////////////////////////////
//	gebratenes Fleisch
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Mutton (C_Item)
{
	name 				=	NAME_Mutton;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Mutton;

	visual 				=	"ItFo_CookedMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMutton;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Mutton;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Mutton;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseMutton()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mutton);
	};

//////////////////////////////////////////////////////////////////////////////////
//	rohes Fleisch
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_MuttonRaw (C_Item)
{
	name 				=	NAME_MuttonRaw;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MuttonRaw;

	visual 				=	"ItFo_RawMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMuttonRaw;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_MuttonRaw;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_MuttonRaw;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseMuttonRaw()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_MuttonRaw);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Schinken
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Ham (C_Item)
{
	name 				=	NAME_Ham;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Ham;

	visual 				=	"ItFo_mutton_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseHam;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Ham;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Ham;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseHam()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Ham);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Käse
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Cheese(C_Item)
{
	name 				=	NAME_Cheese;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Cheese;

	visual 				=	"ItFo_Cheese_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseCheese;

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Cheese;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Cheese;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseCheese()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Cheese);
	};


//#################################################################################################
//##
//##	Trinkbares
//##
//#################################################################################################

//////////////////////////////////////////////////////////////////////////////////
//	Bier
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Beer(C_Item)
{
	name 				=	NAME_Beer;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Beer;

	visual 				=	"ItFo_Beer_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBeer;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]		= HP_Beer;
	change_atr[0]		= ATR_HITPOINTS;				change_value[0]	= HP_Beer;
	TEXT[5]				= NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseBeer()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Wein
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Wine(C_Item)
{
	name 				=	NAME_Wine;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wine;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseWine;
	scemeName			=	"POTION";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Wine;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Wine;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseWine()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Wine);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Schnaps
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItFo_Booze(C_Item)
{
	name 				=	NAME_Booze;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Booze;

	visual 				=	"ItFo_Booze_01.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBooze;
	scemeName			=	"POTION";

	description			=	name;
	TEXT[1]				=	NAME_Bonus_HP;				COUNT[1]		= HP_Booze;
	change_atr[0]		=	ATR_HITPOINTS;				change_value[0]	= HP_Booze;
	TEXT[5]				=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseBooze()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Booze);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Salz
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItMi_Salt (C_Item)
{
	name 				=	NAME_Salt;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Salt;

	visual 				=	"ItMi_Alchemy_Salt_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[0]				=	"Darf in keiner Speise fehlen!";
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

