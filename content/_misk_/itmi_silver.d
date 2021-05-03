
const int Value_MobsiItem = 3;
const int VALUE_SILVER = 1;
const int VALUE_PLIERS = 50;
const int Value_Dietrich = 10;
const int Value_Schlüssel = 3;
const int Value_Joint1 = 8;
const int Value_Joint2 = 15;
const int Value_Joint3 = 20;
const int Value_Laute = 10;
const int Value_Fackel = 2;
const int Value_Sumpfkraut = 8;

instance ITMI_SILVER(C_Item)
{
	name = NAME_SILVER;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVER;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_PLIERS(C_Item)
{
	name = NAME_PLIERS;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PLIERS;
	visual = "ItMi_Zange.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_LOCKPICK(C_Item)
{
	name = NAME_LOCKPICK;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Dietrich;
	visual = "ItKe_Lockpick_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Dietrich;
};

instance ITKE_KEY1(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

instance ITKE_KEY2(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

instance ITKE_KEY3(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

instance ITKE_KEY4(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

instance ITMI_STOMPER(C_Item)
{
	name = NAME_STOMPER;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Stomper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ITMI_HAMMER(C_Item)
{
	name = NAME_HAMMER;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Hammer_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ITMI_SCOOP(C_Item)
{
	name = NAME_SCOOP;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ITMI_FLASK(C_Item)
{
	name = NAME_LABFLASK;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItFo_Potion_Mana_02.3ds";
	material = MAT_GLAS;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ITLS_TORCHFIRESPIT(C_Item)
{
	name = NAME_TORCHFIRESPIT;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = Value_MobsiItem;
	visual = "ItLsTorchBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_LUTE(C_Item)
{
	name = NAME_LUTE;
	mainflag = ITEM_KAT_NONE;
	value = Value_Laute;
	visual = "ItMi_Lute_01.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = UseLute;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseLute()
{
};


instance ITMI_WEDEL(C_Item)
{
	name = NAME_WHISK;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Wedel_01.3ds";
	material = MAT_LEATHER;
	scemeName = "COOLAIR";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_BRUSH(C_Item)
{
	name = NAME_BRUSH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Brush_01.3ds";
	material = MAT_GLAS;
	scemeName = "BRUSH";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiJoint_1(C_Item)
{
	name = NAME_JOINT1;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_1;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_1()
{
};


instance ItMiJoint_2(C_Item)
{
	name = NAME_JOINT2;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint2;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_2;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_2()
{
};


instance ItMiJoint_3(C_Item)
{
	name = NAME_JOINT3;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_3;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_3()
{
};


instance ItLsTorch(C_Item)
{
	name = NAME_TORCH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[0] = "Bringt Licht in die dunkelsten Ecken!";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = NAME_BURNINGTORCH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ItLsTorchBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
};

instance ItLsTorchburned(C_Item)
{
	name = NAME_TORCHBURNED;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance Fakescroll(C_Item)
{
	name = name_fakescroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_ALARMHORN(C_Item)
{
	name = NAME_ALARMHORN;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITWR_WORLDMAP(C_Item)
{
	name = NAME_WORLDMAP;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap;
	description = name;
	text[0] = "Leider fehlt darauf ein großes Gebiet";
	text[1] = "im Südwesten.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWorldmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_Show(nDocID);
};


instance ITMI_SAW(C_Item)
{
	name = "Säge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Saege.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance FAKEBOOK(C_Item)
{
	name = "FakeBook";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "Buch";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_POS(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

instance ITKE_NABOR(C_Item)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlüssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schlüssel;
};

