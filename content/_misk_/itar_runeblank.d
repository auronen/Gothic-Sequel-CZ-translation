
const int AMNT_RUNE = 50;
const int AMNT_BLOODRUNE = 50;
const int AMNT_DARKRUNE = 50;
const int MANA_RUNE = 10;
const int MANA_BLOODRUNE = 20;
const int MANA_DARKRUNE = 50;
const int MANAPERM_RUNELIGHT = 1;
const int MANAPERM_RUNEFIREBOLT = 1;
const int MANAPERM_RUNEHEAL = 1;
const int MANAPERM_RUNETHUNDERBOLT = 1;
const int MANAPERM_RUNEWINDFIST = 1;
const int MANAPERM_RUNESLEEP = 1;
const int MANAPERM_RUNECHARM = 2;
const int MANAPERM_RUNETHUNDERBALL = 2;
const int MANAPERM_RUNEICECUBE = 2;
const int MANAPERM_RUNEPYROKINESIS = 2;
const int MANAPERM_RUNEDESTROYUNDEAD = 2;
const int MANAPERM_RUNECHAINLIGHTNING = 2;
const int MANAPERM_RUNESTORMFIST = 2;
const int MANAPERM_RUNETELEKINESIS = 2;
const int MANAPERM_RUNEFIREBALL = 2;
const int MANAPERM_RUNEFIRESTORM = 2;
const int MANAPERM_RUNECONTROL = 2;
const int MANAPERM_RUNEBREATHOFDEATH = 3;
const int MANAPERM_RUNEICEWAVE = 3;
const int MANAPERM_RUNEFIRERAIN = 3;
const int VALUE_RUNEBLANK = 150;
const int VALUE_BLOODRUNEBLANK = 500;
const int VALUE_DARKRUNEBLANK = 2500;

instance ITAR_RUNEBLANK(C_Item)
{
	name = NAME_BLANKRUNE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RUNEBLANK;
	visual = "ItAr_Rune_00.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_BLOODRUNEBLANK(C_Item)
{
	name = NAME_BLANKBLOODRUNE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODRUNEBLANK;
	visual = "ItAr_Rune_00.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_DARKRUNEBLANK(C_Item)
{
	name = NAME_BLANKDARKRUNE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKRUNEBLANK;
	visual = "ItAr_Rune_00.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

