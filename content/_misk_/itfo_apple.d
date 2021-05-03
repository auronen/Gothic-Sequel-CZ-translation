
const int VALUE_APPLE = 2;
const int HP_APPLE = 12;
const int VALUE_GRAPES = 3;
const int HP_GRAPES = 15;
const int VALUE_LOAF = 2;
const int HP_LOAF = 12;
const int VALUE_MUTTONRAW = 2;
const int HP_MUTTONRAW = 10;
const int VALUE_MUTTON = 3;
const int HP_MUTTON = 20;
const int VALUE_HAM = 5;
const int HP_HAM = 30;
const int VALUE_CHEESE = 3;
const int HP_CHEESE = 15;
const int VALUE_RICE = 2;
const int HP_RICE = 10;
const int VALUE_BEER = 5;
const int HP_BEER = 0;
const int VALUE_WINE = 8;
const int HP_WINE = 0;
const int VALUE_BOOZE = 7;
const int HP_BOOZE = 0;
const int VALUE_SALT = 5;

instance ITFO_APPLE(C_Item)
{
	name = NAME_APPLE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_APPLE;
	visual = "ItFo_Apple_01.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = UseApple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_APPLE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_APPLE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseApple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_APPLE);
};


instance ITFO_GRAPES(C_Item)
{
	name = NAME_GRAPES;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_GRAPES;
	visual = "ItFo_Grapes_01.3ds";
	on_state[0] = usegrapes;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_GRAPES;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_GRAPES;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usegrapes()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_GRAPES);
};


instance ITFO_LOAF(C_Item)
{
	name = NAME_LOAF;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_LOAF;
	visual = "ItFo_Loaf_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = UseLoaf;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_LOAF;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_LOAF;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLoaf()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_LOAF);
};


instance ITFO_MUTTON(C_Item)
{
	name = NAME_MUTTON;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUTTON;
	visual = "ItFo_CookedMutton_01.3ds";
	scemeName = "MEAT";
	on_state[0] = UseMutton;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MUTTON;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MUTTON;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseMutton()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUTTON);
};


instance ITFO_MUTTONRAW(C_Item)
{
	name = NAME_MUTTONRAW;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUTTONRAW;
	visual = "ItFo_RawMutton_01.3ds";
	scemeName = "MEAT";
	on_state[0] = UseMuttonRaw;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MUTTONRAW;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MUTTONRAW;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseMuttonRaw()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUTTONRAW);
};


instance ITFO_HAM(C_Item)
{
	name = NAME_HAM;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HAM;
	visual = "ItFo_mutton_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = useham;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_HAM;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_HAM;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useham()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HAM);
};


instance ITFO_CHEESE(C_Item)
{
	name = NAME_CHEESE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_CHEESE;
	visual = "ItFo_Cheese_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = UseCheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_CHEESE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_CHEESE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseCheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CHEESE);
};


instance ITFO_BEER(C_Item)
{
	name = NAME_BEER;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEER;
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseBeer;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_BEER;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_BEER;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseBeer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEER);
};


instance ITFO_WINE(C_Item)
{
	name = NAME_WINE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WINE;
	visual = "ItFo_Wine_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = UseWine;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_WINE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_WINE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWine()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WINE);
};


instance ITFO_BOOZE(C_Item)
{
	name = NAME_BOOZE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BOOZE;
	visual = "ItFo_Booze_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseBooze;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_BOOZE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_BOOZE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseBooze()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BOOZE);
};


instance ITMI_SALT(C_Item)
{
	name = NAME_SALT;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SALT;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Darf in keiner Speise fehlen!";
	text[4] = NAME_Value;
	count[4] = value;
};

