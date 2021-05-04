// benötigtes Erz, um einen entsprechenden leeren Runenstein herzustellen
const int 		Amnt_Rune					= 50;	// ...aus Erz
const int 		Amnt_BloodRune				= 50;	// ...aus Bluterz
const int 		Amnt_DarkRune				= 50;	// ...aus Dunkelerz

// benötigtes temporäres Mana, um einen entsprechenden leeren Runenstein herzustellen
const int		Mana_Rune					= 10;	// ...aus Erz
const int		Mana_BloodRune				= 20;	// ...aus Bluterz
const int		Mana_DarkRune				= 50;	// ...aus Dunkelerz

// benötigte PERMANENTE Mana, um den entsprechenden Zauber in einen passenden, leeren Runenstein zu binden
const int		ManaPerm_RuneLight			= 1;
const int		ManaPerm_RuneFirebolt       = 1;
const int		ManaPerm_RuneHeal           = 1;
const int		ManaPerm_RuneThunderbolt    = 1;
const int		ManaPerm_RuneWindfist       = 1;
const int		ManaPerm_RuneSleep          = 1;
const int		ManaPerm_RuneCharm          = 2;
const int		ManaPerm_RuneThunderball    = 2;
const int		ManaPerm_RuneIcecube        = 2;
const int		ManaPerm_RunePyrokinesis    = 2;
const int		ManaPerm_RuneDestroyUndead  = 2;
const int		ManaPerm_RuneChainlightning = 2;
const int		ManaPerm_RuneStormfist      = 2;
const int		ManaPerm_RuneTelekinesis    = 2;
const int		ManaPerm_RuneFireball       = 2;
const int		ManaPerm_RuneFireStorm      = 2;
const int		ManaPerm_RuneControl        = 2;
const int		ManaPerm_RuneBreathOfDeath  = 3;
const int		ManaPerm_RuneIcewave        = 3;
const int		ManaPerm_RuneFirerain       = 3;

// Wert eines leeren Runensteins
const int		Value_RuneBlank				= 150;	// ...aus Erz
const int		Value_BloodRuneBlank		= 500;	// ...aus Bluterz
const int		Value_DarkRuneBlank			= 2500;	// ...aus Dunkelerz




INSTANCE ItAr_RuneBlank (C_Item)
{
	name 				=	NAME_BlankRune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual				=	"ItAr_Rune_00.3ds";
	material			=	MAT_STONE;

	description			=	name;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItAr_BloodRuneBlank (C_Item)
{
	name 				=	NAME_BlankBloodRune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BloodRuneBlank;

	visual				=	"ItAr_Rune_00.3ds";
	material			=	MAT_STONE;

	description			=	name;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItAr_DarkRuneBlank (C_Item)
{
	name 				=	NAME_BlankDarkRune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkRuneBlank;

	visual				=	"ItAr_Rune_00.3ds";
	material			=	MAT_STONE;

	description			=	name;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

