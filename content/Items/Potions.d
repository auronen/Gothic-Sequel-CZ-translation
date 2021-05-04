// ************************************************************************************************
// Wirkung und Kosten von Tränken
// ************************************************************************************************

// Heilung
const int	Value_HpEssenz			=	 25;	const int	HP_Essenz			=	100;
const int	Value_HpExtrakt			=	 50;	const int	HP_Extrakt			=	200;
const int	Value_HpElixier			=	125;	const int	HP_Elixier			=	500;

// Mana
const int	Value_ManaEssenz		=	 25;	const int	Mana_Essenz			=	 50;
const int	Value_ManaExtrakt		=	 50;	const int	Mana_Extrakt		=	100;
const int	Value_ManaElixier		=	125;	const int	Mana_Elixier		=	250;

// Speed-Potions
const int	Value_Haste1			=	 25;	const int	Time_Haste1			=	60000;	// 1 min.
const int	Value_Haste2			=	 50;	const int	Time_Haste2			=	120000;	// 2 min.
const int	Value_Haste3			=	125;	const int	Time_Haste3			=	300000;	// 5 min.

// Permanente Attribut-Steigerungen
const int	Value_StrEssenz			=	300;	const int	STR_Essenz			=	3;
const int	Value_StrExtrakt		=	500;	const int	STR_Extrakt			=	5;
const int	Value_StrElixier		=	800;	const int	STR_Elixier			=	8;

const int	Value_DexEssenz			=	300;	const int	DEX_Essenz			=	3;
const int	Value_DexExtrakt		=	500;	const int	DEX_Extrakt			=	5;
const int	Value_DexElixier		=	800;	const int	DEX_Elixier			=	8;

// Trank der Macht
const int	Value_StrDex_Macht		=	800;	const int	StrDex_Macht		=	4;

// Trank der Herrschaft
const int	Value_StrDex_Herrschaft	=	1200;	const int	StrDex_Herrschaft	=	6;

const int	Value_HpMaxEssenz		=	500;	const int	HPMax_Essenz		=	5;
const int	Value_HpMaxExtrakt		=	1000;	const int	HPMax_Extrakt		=	10;
const int	Value_HpMaxElixier		=	1500;	const int	HPMax_Elixier		=	15;

const int	Value_ManaMaxEssenz		=	500;	const int	ManaMax_Essenz		=	5;
const int	Value_ManaMaxExtrakt	=	1000;	const int	ManaMax_Extrakt		=	10;
const int	Value_ManaMaxElixier	=	1500;	const int	ManaMax_Elixier		=	15;


/******************************************************************************************/
//	MANATRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_01(C_Item)
{
	name 			=	NAME_ManaPotion1;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;

	visual 			=	"ItFo_Potion_Mana_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseManaPotion;
	scemeName		=	"POTIONFAST";

	description		=	name;
	TEXT[1]			=	NAME_Bonus_Mana;			COUNT[1]		= Mana_Essenz;
	change_atr[0]	= 	ATR_MANA;					change_value[0]	= Mana_Essenz;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseManaPotion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseManaPotion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_02(C_Item)
{
	name 			=	NAME_ManaPotion2;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaExtrakt;

	visual 			=	"ItFo_Potion_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana2Potion;
	scemeName		=	"POTIONFAST";

	description		=	name;
	TEXT[1]			=	NAME_Bonus_Mana;			COUNT[1]		= Mana_Extrakt;
	change_atr[0]	= 	ATR_MANA;					change_value[0]	= Mana_Extrakt;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseMana2Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana2Potion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_03(C_Item)
{
	name 			=	NAME_ManaPotionAll;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana3Potion;
	scemeName		=	"POTIONFAST";

	description		=	name;
	TEXT[1]			=	"Regeneriert Mana vollständig";
	change_atr[0]	= 	ATR_MANA;					change_value[0]	= 999999;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseMana3Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana3Potion");
		Npc_ChangeAttribute	(self,	ATR_MANA,	(self.attribute[ATR_MANA_MAX]-self.attribute[ATR_MANA]));
	};





/******************************************************************************************/
//	HEILTRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpEssenz;

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealthPotion;
	scemeName		=	"POTIONFAST";

	description		=	NAME_HealthPotion1;
	TEXT[1]			=	NAME_Bonus_HP;				COUNT[1]		= HP_Essenz;
	change_atr[0]	= 	ATR_HITPOINTS;				change_value[0]	= HP_Essenz;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseHealthPotion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpExtrakt;

	visual 			=	"ItFo_Potion_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth2Potion;
	scemeName		=	"POTIONFAST";

	description		=	NAME_HealthPotion2;
	TEXT[1]			=	NAME_Bonus_HP;				COUNT[1]		= HP_Extrakt;
	change_atr[0]	= 	ATR_HITPOINTS;				change_value[0]	= HP_Extrakt;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseHealth2Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpElixier;

	visual 			=	"ItFo_Potion_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth3Potion;
	scemeName		=	"POTIONFAST";

	description		=	NAME_HealthPotionAll;
	TEXT[1]			=	"Regeneriert die Gesundheit vollständig";
	change_atr[0]	= 	ATR_HITPOINTS;				change_value[0]	= 999999;
	TEXT[5]			=	NAME_Value;					COUNT[5]		= value;
};

	FUNC VOID UseHealth3Potion()
	{
		PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthPotion");
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	(self.attribute[ATR_HITPOINTS_MAX]-self.attribute[ATR_HITPOINTS]));
	};



/******************************************************************************************/
//STRENGTH

INSTANCE ItFo_Potion_Strength_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrEssenz;

	visual 			=	"ItFo_Potion_Strength_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrengthPotion;
	scemeName		=	"POTIONFAST";

	description			= NAME_StrPotion1;
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]		= STR_Essenz;
	change_atr[0]		= ATR_STRENGTH;					change_value[0]	= STR_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_StrEssenz;
};

	FUNC VOID UseStrengthPotion()
	{
 		B_RaiseAttribute	(ATR_STRENGTH,	STR_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrExtrakt;

	visual 			=	"ItFo_Potion_Strength_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength2Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_StrPotion2;
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]		= STR_Extrakt;
	change_atr[0]		= ATR_STRENGTH;					change_value[0]	= STR_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_StrExtrakt;
};

	FUNC VOID UseStrength2Potion()
	{
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength3Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_StrPotion3;
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]		= STR_Elixier;
	change_atr[0]		= ATR_STRENGTH;					change_value[0]	= STR_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_StrElixier;
};

	FUNC VOID UseStrength3Potion()
	{
		B_RaiseAttribute	(ATR_STRENGTH,	STR_Elixier);
	};




/******************************************************************************************/
//	DEXTERITY

INSTANCE ItFo_Potion_Dex_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexEssenz;

	visual 			=	"ItFo_Potion_Dex_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDexPotion;
	scemeName		=	"POTIONFAST";

	description			= NAME_DexPotion1;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]		= DEX_Essenz;
	change_atr[0]		= ATR_DEXTERITY;				change_value[0]	= DEX_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_DexEssenz;
};

	FUNC VOID UseDexPotion()
	{
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Dex_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexExtrakt;

	visual 			=	"ItFo_Potion_Dex_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex2Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_DexPotion2;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]		= DEX_Extrakt;
	change_atr[0]		= ATR_DEXTERITY;				change_value[0]	= DEX_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_DexExtrakt;
};

	FUNC VOID UseDex2Potion()
	{
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Dex_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexElixier;

	visual 			=	"ItFo_Potion_Dex_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex3Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_DexPotion3;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]		= DEX_Elixier;
	change_atr[0]		= ATR_DEXTERITY;				change_value[0]	= DEX_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_DexElixier;
};

	FUNC VOID UseDex3Potion()
	{
		B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Elixier);
	};


/******************************************************************************************/
// STRENGTH & DEX

INSTANCE ItFo_Potion_Master_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Macht;

	visual 			=	"ItFo_Potion_Master_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMasterPotion;
	scemeName		=	"POTIONFAST";

	description			= NAME_StrDexPotion1;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]		= StrDex_Macht;
	change_atr[0]		= ATR_DEXTERITY;				change_value[0]	= StrDex_Macht;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]		= StrDex_Macht;
	change_atr[1]		= ATR_STRENGTH;					change_value[1]	= StrDex_Macht;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_StrDex_Macht;
};

	FUNC VOID UseMasterPotion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Macht);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Macht);

		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Macht));
		PrintScreen	(msg, -1,-1,FONT_OLD_BIG,_TIME_MESSAGE_RAISEATTRIBUTE);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Master_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Herrschaft;

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMaster2Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_StrDexPotion1;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]		= StrDex_Herrschaft;
	change_atr[0]		= ATR_DEXTERITY;				change_value[0]	= StrDex_Herrschaft;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]		= StrDex_Herrschaft;
	change_atr[1]		= ATR_STRENGTH;					change_value[1]	= StrDex_Herrschaft;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_StrDex_Herrschaft;
};

	FUNC VOID UseMaster2Potion()
	{
		Npc_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Herrschaft);
		Npc_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Herrschaft);

		var string msg;
		msg = ConcatStrings(NAME_RaiseStrDex , IntToString(StrDex_Herrschaft));
		PrintScreen	(msg, -1,-1,FONT_OLD_BIG,_TIME_MESSAGE_RAISEATTRIBUTE);
	};


/******************************************************************************************/
// Hitpoints

INSTANCE ItFo_Potion_Health_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxEssenz;

	visual 			=	"ItFo_Potion_Health_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLifePotion;
	scemeName		=	"POTIONFAST";

	description			= NAME_HealthPermaPotion1;
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]		= HPMax_Essenz;
	change_atr[0]		= ATR_HITPOINTS_MAX;			change_value[0]	= HPMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_HpMaxEssenz;
};

	FUNC VOID UseLifePotion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxExtrakt;

	visual 			=	"ItFo_Potion_Health_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife2Potion;
	scemeName		=	"POTIONFAST";

	description		= NAME_HealthPermaPotion2;
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]		= HPMax_Extrakt;
	change_atr[0]		= ATR_HITPOINTS_MAX;			change_value[0]	= HPMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_HpMaxExtrakt;
};

	FUNC VOID UseLife2Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HpMaxElixier;

	visual 			=	"ItFo_Potion_Health_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife3Potion;
	scemeName		=	"POTIONFAST";

	description		= NAME_HealthPermaPotion3;
	TEXT[1]				= NAME_Bonus_HpMax;				COUNT[1]		= HPMax_Elixier;
	change_atr[0]		= ATR_HITPOINTS_MAX;			change_value[0]	= HPMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_HpMaxElixier;
};

	FUNC VOID UseLife3Potion()
	{
		B_RaiseAttribute	(ATR_HITPOINTS_MAX,	HPMax_Elixier);
	};


/******************************************************************************************/
// MANA

INSTANCE ItFo_Potion_Mana_Perma_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxEssenz;

	visual 			=	"ItFo_Potion_Mana_Perma_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectarPotion;
	scemeName		=	"POTIONFAST";

	description			= NAME_ManaPermaPotion1;
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]		= ManaMax_Essenz;
	change_atr[0]		= ATR_MANA_MAX;					change_value[0]	= ManaMax_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_ManaMaxEssenz;
};

	FUNC VOID UseNectarPotion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Essenz);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxExtrakt;

	visual 			=	"ItFo_Potion_Mana_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar2Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_ManaPermaPotion2;
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]		= ManaMax_Extrakt;
	change_atr[0]		= ATR_MANA_MAX;					change_value[0]	= ManaMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_ManaMaxExtrakt;
};

	FUNC VOID UseNectar2Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Extrakt);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;

	visual 			=	"ItFo_Potion_Mana_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar3Potion;
	scemeName		=	"POTIONFAST";

	description			= NAME_ManaPermaPotion3;
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]		= ManaMax_Elixier;
	change_atr[0]		= ATR_MANA_MAX;					change_value[0]	= ManaMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_ManaMaxElixier;
};

	FUNC VOID UseNectar3Potion()
	{
		B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Elixier);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
	};



/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste1;

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion1;
	scemeName		=	"POTIONFAST";

	description		= NAME_SpeedPotion1;
	TEXT[1]			= "Ermöglicht kurzzeitiges Sprinten ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste1/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion1()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste1);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste2;

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion2;
	scemeName		=	"POTIONFAST";

	description		= NAME_SpeedPotion2;
	TEXT[1]			= "Ermöglicht Sprinten ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste2/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion2()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste2);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste3;

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion3;
	scemeName		=	"POTIONFAST";

	description		= NAME_SpeedPotion3;
	TEXT[1]			= "Ermöglicht längeres Sprinten ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste3/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

	FUNC VOID UseHastePotion3()
	{
		Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste3);
		PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");
	};