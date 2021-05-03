
const int DAMAGE_SHORTSWORD = 20;
const int VALUE_SHORTSWORD = 50;
const int STR_SHORTSWORD = 20;
const int DAMAGE_LONGSWORD = 50;
const int VALUE_LONGSWORD = 100;
const int STR_LONGSWORD = 30;
const int DAMAGE_BROADSWORD = 80;
const int VALUE_BROADSWORD = 300;
const int STR_BROADSWORD = 50;
const int DAMAGE_BASTARDSWORD = 90;
const int VALUE_BASTARDSWORD = 500;
const int STR_BASTARDSWORD = 70;
const int DAMAGE_2HSWORD = 120;
const int VALUE_2HSWORD = 1000;
const int STR_2HSWORD = 90;
const int DAMAGE_ORCSWORD = 150;
const int VALUE_ORCSWORD = 5000;
const int STR_ORCSWORD = 100;
const int DAMAGE_HATCHET = 30;
const int VALUE_HATCHET = 100;
const int STR_HATCHET = 30;
const int DAMAGE_BATTLEAXE = 60;
const int VALUE_BATTLEAXE = 200;
const int STR_BATTLEAXE = 60;
const int DAMAGE_DOUBLEBLADEDAXE = 100;
const int VALUE_DOUBLEBLADEDAXE = 500;
const int STR_DOUBLEBLADEDAXE = 120;
const int DAMAGE_BERSERKAXE = 130;
const int VALUE_BERSERKAXE = 1000;
const int STR_BERSERKAXE = 150;
const int DAMAGE_ORCAXE = 160;
const int VALUE_ORCAXE = 5000;
const int STR_ORCAXE = 175;
const int DAMAGE_IRONCLUB = 40;
const int VALUE_IRONCLUB = 100;
const int STR_IRONCLUB = 30;
const int DAMAGE_MACE = 70;
const int VALUE_MACE = 200;
const int STR_MACE = 75;
const int DAMAGE_MORNINGSTAR = 110;
const int VALUE_MORNINGSTAR = 500;
const int STR_MORNINGSTAR = 125;
const int DAMAGE_WARHAMMER = 140;
const int VALUE_WARHAMMER = 1000;
const int STR_WARHAMMER = 175;
const int DAMAGE_ORCHAMMER = 170;
const int VALUE_ORCHAMMER = 5000;
const int STR_ORCHAMMER = 200;
const int DAMAGE_BLOODORE = 100;
const int VALUE_BLOODORE = 100;
const int STR_BLOODORE = 100;
const int DAMAGE_DARKORE = 100;
const int VALUE_DARKORE = 100;
const int STR_DARKORE = 100;
const int DAMAGE_BATTLESTAFF = 100;
const int VALUE_BATTLESTAFF = 1000;
const int STR_BATTLESTAFF = 100;
const int DEX_BATTLESTAFF = 100;
const int DAMAGE_CLUB = 10;
const int VALUE_CLUB = 10;
const int STR_CLUB = 10;
const int DAMAGE_POKER = 10;
const int VALUE_POKER = 10;
const int STR_POKER = 10;
const int DAMAGE_SICKLE = 10;
const int VALUE_SICKLE = 10;
const int STR_SICKLE = 10;
const int DAMAGE_PICKAXE = 10;
const int VALUE_PICKAXE = 10;
const int STR_PICKAXE = 10;
const int DAMAGE_SLEDGEHAMMER = 10;
const int VALUE_SLEDGEHAMMER = 100;
const int STR_SLEDGEHAMMER = 10;
const int DAMAGE_SCYTHE = 10;
const int VALUE_SCYTHE = 10;
const int STR_SCYTHE = 10;
const int DAMAGE_RUSTYSWORD = 10;
const int VALUE_RUSTYSWORD = 10;
const int STR_RUSTYSWORD = 10;
const int DAMAGE_WITHEREDAXE = 10;
const int VALUE_WITHEREDAXE = 10;
const int STR_WITHEREDAXE = 10;
const int DAMAGE_NAILMACE = 10;
const int VALUE_NAILMACE = 10;
const int STR_NAILMACE = 10;
const int DAMAGE_NOTCHEDMACE = 10;
const int VALUE_NOTCHEDMACE = 10;
const int STR_NOTCHEDMACE = 10;
const int DAMAGE_MILITIASWORD = 50;
const int VALUE_MILITIASWORD = 10;
const int STR_MILITIASWORD = 30;
const int DAMAGE_PALADINSWORD = 120;
const int VALUE_PALADINSWORD = 100;
const int STR_PALADINSWORD = 90;
const int DAMAGE_DEMONHUNTERAXE = 130;
const int VALUE_DEMONHUNTERAXE = 100;
const int STR_DEMONHUNTERAXE = 150;
const int DAMAGE_AUXILIARYMACE = 70;
const int VALUE_AUXILIARYMACE = 20;
const int STR_AUXILIARYMACE = 60;

func int b_calcvalue(var int value,var int percentage)
{
	return (value * percentage) / 100;
};

func int b_calcdamage(var int damage,var int percentage)
{
	return (damage * percentage) / 100;
};

func int b_calcstr(var int str,var int percentage)
{
	return (str * percentage) / 100;
};


instance ITMW_SHORTSWORD(C_Item)
{
	name = NAME_SHORTSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD;
	damageTotal = DAMAGE_SHORTSWORD;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SHORTSWORD;
	visual = "ItMw_1H_Sword_Short_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_LONGSWORD(C_Item)
{
	name = NAME_LONGSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_LONGSWORD;
	damageTotal = DAMAGE_LONGSWORD;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_LONGSWORD;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BROADSWORD(C_Item)
{
	name = NAME_BROADSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_BROADSWORD;
	damageTotal = DAMAGE_BROADSWORD;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BROADSWORD;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BASTARDSWORD(C_Item)
{
	name = NAME_BASTARDSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_BASTARDSWORD;
	damageTotal = DAMAGE_BASTARDSWORD;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BASTARDSWORD;
	visual = "ItMw_1H_Sword_Bastard_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2HSWORD(C_Item)
{
	name = NAME_2HSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_2HSWORD;
	damageTotal = DAMAGE_2HSWORD;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_2HSWORD;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ORCSWORD(C_Item)
{
	name = NAME_ORCSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_ORCSWORD;
	damageTotal = DAMAGE_ORCSWORD;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_ORCSWORD;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_HATCHET(C_Item)
{
	name = NAME_HATCHET;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_HATCHET;
	damageTotal = DAMAGE_HATCHET;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_HATCHET;
	visual = "ItMw_1H_Hatchet_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BATTLEAXE(C_Item)
{
	name = NAME_BATTLEAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_BATTLEAXE;
	damageTotal = DAMAGE_BATTLEAXE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BATTLEAXE;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_DOUBLEBLADEDAXE(C_Item)
{
	name = NAME_DOUBLEBLADEDAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_DOUBLEBLADEDAXE;
	damageTotal = DAMAGE_DOUBLEBLADEDAXE;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_DOUBLEBLADEDAXE;
	visual = "ItMw_2H_Axe_heavy_03.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BERSERKAXE(C_Item)
{
	name = NAME_BERSERKAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_BERSERKAXE;
	damageTotal = DAMAGE_BERSERKAXE;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BERSERKAXE;
	visual = "ItMw_2H_Axe_Heavy_04.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ORCAXE(C_Item)
{
	name = NAME_ORCAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_ORCAXE;
	damageTotal = DAMAGE_ORCAXE;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_ORCAXE;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_IRONCLUB(C_Item)
{
	name = NAME_IRONCLUB;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_IRONCLUB;
	damageTotal = DAMAGE_IRONCLUB;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_IRONCLUB;
	visual = "ItMw_1H_Mace_Light_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_MACE(C_Item)
{
	name = NAME_MACE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_MACE;
	damageTotal = DAMAGE_MACE;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_MACE;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_MORNINGSTAR(C_Item)
{
	name = NAME_MORNINGSTAR;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_MORNINGSTAR;
	damageTotal = DAMAGE_MORNINGSTAR;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_MORNINGSTAR;
	visual = "ItMw_1H_Mace_02.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_WARHAMMER(C_Item)
{
	name = NAME_WARHAMMER;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_WARHAMMER;
	damageTotal = DAMAGE_WARHAMMER;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_WARHAMMER;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ORCHAMMER(C_Item)
{
	name = NAME_ORCHAMMER;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_ORCHAMMER;
	damageTotal = DAMAGE_ORCHAMMER;
	damagetype = DAM_BLUNT;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_ORCHAMMER;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_CLUB(C_Item)
{
	name = NAME_CLUB;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_CLUB;
	damageTotal = DAMAGE_CLUB;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_CLUB;
	visual = "ItMw_1H_Club_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_POKER(C_Item)
{
	name = NAME_POKER;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_POKER;
	damageTotal = DAMAGE_POKER;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_POKER;
	visual = "ItMw_1H_Poker_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_SICKLE(C_Item)
{
	name = NAME_SICKLE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SICKLE;
	damageTotal = DAMAGE_SICKLE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SICKLE;
	visual = "ItMw_1H_Sickle_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_PICKAXE(C_Item)
{
	name = NAME_PICKAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	value = VALUE_PICKAXE;
	damageTotal = DAMAGE_PICKAXE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_PICKAXE;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BLOODPICKAXE(C_Item)
{
	name = NAME_PICKAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	value = b_calcvalue(VALUE_PICKAXE,VALUE_BLOODORE);
	damageTotal = b_calcdamage(DAMAGE_PICKAXE,DAMAGE_BLOODORE);
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = b_calcstr(STR_PICKAXE,STR_BLOODORE);
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_SLEDGEHAMMER(C_Item)
{
	name = NAME_SLEDGEHAMMER;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SLEDGEHAMMER;
	damageTotal = DAMAGE_SLEDGEHAMMER;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SLEDGEHAMMER;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_SCYTHE(C_Item)
{
	name = NAME_SCYTHE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SCYTHE;
	damageTotal = DAMAGE_SCYTHE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SCYTHE;
	visual = "ItMw_1H_Scythe_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_RUSTYSWORD(C_Item)
{
	name = "Rostiges Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RUSTYSWORD;
	damageTotal = DAMAGE_RUSTYSWORD;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_RUSTYSWORD;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[4] = NAME_TYPEONEHANDED;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_NAILMACE(C_Item)
{
	name = "Nagelkeule";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAILMACE;
	damageTotal = DAMAGE_NAILMACE;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_NAILMACE;
	visual = "ItMw_1H_Nailmace_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[4] = NAME_TYPEONEHANDED;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_WITHEREDAXE(C_Item)
{
	name = "Verwitterte Axt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_WITHEREDAXE;
	damageTotal = DAMAGE_WITHEREDAXE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_WITHEREDAXE;
	visual = "ItMw_1H_Axe_Old_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[4] = NAME_TYPEONEHANDED;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_NOTCHEDMACE(C_Item)
{
	name = "schartiger Streitkolben";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NOTCHEDMACE;
	damageTotal = DAMAGE_NOTCHEDMACE;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_NOTCHEDMACE;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[4] = NAME_TYPEONEHANDED;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BATTLESTAFF(C_Item)
{
	name = NAME_BATTLESTAFF;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_STAFF;
	material = MAT_METAL;
	value = VALUE_BATTLESTAFF;
	range = 250;
	damageTotal = DAMAGE_BATTLESTAFF;
	damagetype = DAM_BLUNT;
	visual = "ItMw_2H_StaffLong_01.3DS";
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BATTLESTAFF;
	cond_atr[1] = ATR_DEXTERITY;
	cond_value[1] = DEX_BATTLESTAFF;
	description = name;
	text[0] = NAME_TYPESTAFF;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[0];
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_MILITIASWORD(C_Item)
{
	name = NAME_MILITIASWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_MILITIASWORD;
	ownerGuild = GIL_MILITIA;
	damageTotal = DAMAGE_MILITIASWORD;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_MILITIASWORD;
	visual = "ItMw_1H_Sword_Long_02.3DS";
	description = name;
	text[0] = "Nur Milizsoldaten tragen diese Art";
	text[1] = "der Langschwerter.";
	text[2] = NAME_TYPEONEHANDED;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_PALADINSWORD(C_Item)
{
	name = NAME_PALADINSWORD;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_PALADINSWORD;
	ownerGuild = GIL_PALADIN;
	damageTotal = DAMAGE_PALADINSWORD;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_PALADINSWORD;
	visual = "ItMw_2H_Sword_Heavy_03.3DS";
	description = name;
	text[0] = "Nur die Paladine des Königs tragen";
	text[1] = "solche zweihändigen Schwerter.";
	text[2] = NAME_TYPETWOHANDED;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_DEMONHUNTERAXE(C_Item)
{
	name = NAME_DEMONHUNTERAXE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_DEMONHUNTERAXE;
	ownerGuild = GIL_DEMONHUNTER;
	damageTotal = DAMAGE_DEMONHUNTERAXE;
	damagetype = DAM_EDGE;
	range = 150;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_DEMONHUNTERAXE;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[0] = "Die Dämonenjäger führen solche";
	text[1] = "wuchtigen Zweihandäxte.";
	text[2] = NAME_TYPETWOHANDED;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_AUXILIARYMACE(C_Item)
{
	name = NAME_AUXILIARYMACE;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_AUXILIARYMACE;
	damageTotal = DAMAGE_AUXILIARYMACE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_AUXILIARYMACE;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[0] = "Ein Streitkolben wie sie die";
	text[1] = "Hilfstruppen des Königs tragen.";
	text[2] = NAME_TYPEONEHANDED;
	text[3] = NAME_Damage;
	count[2] = damageTotal;
	text[4] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_GRIM_PICKAXE(C_Item)
{
	name = "Grim's Spitzhacke";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	value = VALUE_PICKAXE;
	damageTotal = DAMAGE_PICKAXE;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_PICKAXE;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	owner = min_306_grim;
	description = name;
	text[0] = NAME_TYPETWOHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_GOLIATH_SLEDGEHAMMER(C_Item)
{
	name = "Goliath's Schmiedehammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SLEDGEHAMMER;
	damageTotal = DAMAGE_SLEDGEHAMMER;
	damagetype = DAM_BLUNT;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SLEDGEHAMMER;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	owner = wrk_216_goliath;
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_BRUTUS_LONGSWORD(C_Item)
{
	name = "Brutus' Langschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_LONGSWORD;
	damageTotal = DAMAGE_LONGSWORD;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_LONGSWORD;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	owner = mil_121_brutus;
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_MALGAR_BROADSWORD(C_Item)
{
	name = "Malgar's Breitschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_BROADSWORD;
	damageTotal = DAMAGE_BROADSWORD;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BROADSWORD;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	owner = dmh_1302_malgar;
	description = name;
	text[0] = NAME_TYPEONEHANDED;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_THORA_BATTLESTAFF(C_Item)
{
	name = "Thora's Kampfstab";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_STAFF;
	material = MAT_METAL;
	value = VALUE_BATTLESTAFF;
	range = 250;
	damageTotal = DAMAGE_BATTLESTAFF;
	damagetype = DAM_BLUNT;
	visual = "ItMw_2H_StaffLong_01.3DS";
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_BATTLESTAFF / 2;
	cond_atr[1] = ATR_DEXTERITY;
	cond_value[1] = DEX_BATTLESTAFF / 2;
	owner = amz_900_thora;
	description = name;
	text[0] = NAME_TYPESTAFF;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[0];
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ARENAMASTER_SWORD(C_Item)
{
	name = "Gladiatorenzucht";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD;
	owner = mil_122_arenamaster;
	damageTotal = DAMAGE_SHORTSWORD;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_SHORTSWORD;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	description = name;
	text[0] = "Die persönliche Waffe des Arenameisters";
	text[1] = "ist eher eine Zierwaffe als alles andere.";
	text[2] = NAME_TYPEONEHANDED;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_DIEGO_SWORD(C_Item)
{
	name = "Brutus' Langschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = VALUE_LONGSWORD;
	damageTotal = DAMAGE_LONGSWORD;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[0] = ATR_STRENGTH;
	cond_value[0] = STR_LONGSWORD;
	visual = "ItMw_1H_Sword_Long_05.3DS";
	owner = mil_121_brutus;
	description = name;
	text[0] = "Diego's Langschert ist schlicht aber";
	text[1] = "präzise. Die Waffe eines Meisters.";
	text[2] = NAME_TYPEONEHANDED;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

