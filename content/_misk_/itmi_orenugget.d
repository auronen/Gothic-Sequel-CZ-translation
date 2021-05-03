
const int VALUE_ORENUGGET = 1;
const int VALUE_BLOODORENUGGET = 10;
const int VALUE_DARKORENUGGET = 50;
const int COST_RAWIRON = 20;
const int COST_RAWLONGIRON = 40;
const int VALUE_RAWIRON = 10;
const int VALUE_RAWLONGIRON = 20;
const int VALUE_BLOODRAWLONGIRON = 20;
const int VALUE_DARKRAWLONGIRON = 20;
const int VALUE_HOTIRON = 10;
const int VALUE_HOTLONGIRON = 20;
const int VALUE_BLOODHOTLONGIRON = 20;
const int VALUE_DARKHOTLONGIRON = 20;
const int VALUE_HOTSWORDBLADE = 10;
const int VALUE_HOTAXEBLADE = 10;
const int VALUE_HOTSTUMP = 10;
const int VALUE_HOT2HSWORDBLADE = 20;
const int VALUE_HOT2HAXEBLADE = 20;
const int VALUE_HOT2HSTUMP = 20;
const int VALUE_BLOODHOT2HSWORDBLADE = 20;
const int VALUE_BLOODHOT2HAXEBLADE = 20;
const int VALUE_BLOODHOT2HSTUMP = 20;
const int VALUE_DARKHOT2HSWORDBLADE = 20;
const int VALUE_DARKHOT2HAXEBLADE = 20;
const int VALUE_DARKHOT2HSTUMP = 20;
const int Value_SwordBlade = 10;
const int VALUE_AXEBLADE = 10;
const int VALUE_STUMP = 10;
const int VALUE_2HSWORDBLADE = 20;
const int VALUE_2HAXEBLADE = 20;
const int VALUE_2HSTUMP = 20;
const int VALUE_BLOOD2HSWORDBLADE = 20;
const int VALUE_BLOOD2HAXEBLADE = 20;
const int VALUE_BLOOD2HSTUMP = 20;
const int VALUE_DARK2HSWORDBLADE = 20;
const int VALUE_DARK2HAXEBLADE = 20;
const int VALUE_DARK2HSTUMP = 20;

instance ITMI_ORENUGGET(C_Item)
{
	name = NAME_NUGGET;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ORENUGGET;
	visual = "ItMi_Nugget_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODORENUGGET(C_Item)
{
	name = NAME_BLOODNUGGET;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODORENUGGET;
	visual = "ItMi_Nugget_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKORENUGGET(C_Item)
{
	name = NAME_DARKNUGGET;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKORENUGGET;
	visual = "ItMi_Nugget_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_RAWIRON(C_Item)
{
	name = ConcatStrings(NAME_RAWIRON,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAWIRON;
	visual = "ItMi_SmithSword_Raw_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_RAWLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_RAWLONGIRON,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAWLONGIRON;
	visual = "ItMi_SmithSword_Raw_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODRAWLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_RAWLONGIRON,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODRAWLONGIRON;
	visual = "ItMi_SmithSword_RawBlood_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKRAWLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_RAWLONGIRON,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKRAWLONGIRON;
	visual = "ItMi_SmithSword_RawDark_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOTIRON(C_Item)
{
	name = ConcatStrings(NAME_HOTIRON,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOTIRON;
	visual = "ItMi_SmithSword_Rawhot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOTLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_HOTLONGIRON,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOTLONGIRON;
	visual = "ItMi_SmithSword_Rawhot_03.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODHOTLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_HOTLONGIRON,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODHOTLONGIRON;
	visual = "ItMi_SmithSword_RawhotBlood_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKHOTLONGIRON(C_Item)
{
	name = ConcatStrings(NAME_HOTLONGIRON,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKHOTLONGIRON;
	visual = "ItMi_SmithSword_RawhotDark_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOTSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOTSWORDBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOTSWORDBLADE;
	visual = "ItMi_SmithSword_Bladehot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOTAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOTAXEBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOTAXEBLADE;
	visual = "ItMi_SmithSword_HotAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOTSTUMP(C_Item)
{
	name = ConcatStrings(NAME_HOTSTUMP,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOTSTUMP;
	visual = "ItMi_SmithSword_HotStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOT2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSWORDBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOT2HSWORDBLADE;
	visual = "ItMi_SmithSword_Bladehot_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOT2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HAXEBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOT2HAXEBLADE;
	visual = "ItMi_SmithSword_Hot2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_HOT2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSTUMP,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOT2HSTUMP;
	visual = "ItMi_SmithSword_Hot2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODHOT2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSWORDBLADE,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODHOT2HSWORDBLADE;
	visual = "ItMi_SmithSword_Bladehot_03.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODHOT2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HAXEBLADE,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODHOT2HAXEBLADE;
	visual = "ItMi_SmithSword_HotBlood2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOODHOT2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSTUMP,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOODHOT2HSTUMP;
	visual = "ItMi_SmithSword_HotBlood2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKHOT2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSWORDBLADE,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKHOT2HSWORDBLADE;
	visual = "ItMi_SmithSword_Bladehot_04.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKHOT2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_HOT2HAXEBLADE,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKHOT2HAXEBLADE;
	visual = "ItMi_SmithSword_HotDark2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKHOT2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_HOT2HSTUMP,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKHOT2HSTUMP;
	visual = "ItMi_SmithSword_HotDark2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_SWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_SWORDBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMi_SmithSword_Blade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_AXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_AXEBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_AXEBLADE;
	visual = "ItMi_SmithSword_AxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_STUMP(C_Item)
{
	name = ConcatStrings(NAME_STUMP,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STUMP;
	visual = "ItMi_SmithSword_StumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HSWORDBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_2HSWORDBLADE;
	visual = "ItMi_SmithSword_Blade_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HAXEBLADE,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_2HAXEBLADE;
	visual = "ItMi_SmithSword_2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_2HSTUMP,NAME_ORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_2HSTUMP;
	visual = "ItMi_SmithSword_2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOOD2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HSWORDBLADE,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOOD2HSWORDBLADE;
	visual = "ItMi_SmithSword_Blade_03.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOOD2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HAXEBLADE,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOOD2HAXEBLADE;
	visual = "ItMi_SmithSword_Blood2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_BLOOD2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_2HSTUMP,NAME_BLOODORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BLOOD2HSTUMP;
	visual = "ItMi_SmithSword_Blood2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARK2HSWORDBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HSWORDBLADE,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARK2HSWORDBLADE;
	visual = "ItMi_SmithSword_Blade_04.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARK2HAXEBLADE(C_Item)
{
	name = ConcatStrings(NAME_2HAXEBLADE,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARK2HAXEBLADE;
	visual = "ItMi_SmithSword_Dark2HAxeBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARK2HSTUMP(C_Item)
{
	name = ConcatStrings(NAME_2HSTUMP,NAME_DARKORE);
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARK2HSTUMP;
	visual = "ItMi_SmithSword_Dark2HStumpBlade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

