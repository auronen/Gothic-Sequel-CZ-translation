
const int DAMAGE_SHORTBOW = 10;
const int VALUE_SHORTBOW = 100;
const int DEX_SHORTBOW = 20;
const int DAMAGE_RIDERBOW = 15;
const int VALUE_RIDERBOW = 150;
const int DEX_RIDERBOW = 25;
const int DAMAGE_FIELDBOW = 20;
const int VALUE_FIELDBOW = 200;
const int DEX_FIELDBOW = 30;
const int DAMAGE_HUNTINGBOW = 25;
const int VALUE_HUNTINGBOW = 250;
const int DEX_HUNTINGBOW = 35;
const int DAMAGE_LONGBOW = 30;
const int VALUE_LONGBOW = 300;
const int DEX_LONGBOW = 40;
const int DAMAGE_HEDGEBOW = 35;
const int VALUE_HEDGEBOW = 400;
const int DEX_HEDGEBOW = 45;
const int DAMAGE_YEWBOW = 40;
const int VALUE_YEWBOW = 500;
const int DEX_YEWBOW = 50;
const int DAMAGE_ARMYBOW = 45;
const int VALUE_ARMYBOW = 750;
const int DEX_ARMYBOW = 60;
const int DAMAGE_WARBOW = 50;
const int VALUE_WARBOW = 1000;
const int DEX_WARBOW = 80;
const int DAMAGE_STORMBOW = 60;
const int VALUE_STORMBOW = 1500;
const int DEX_STORMBOW = 100;
const int DAMAGE_LIGHTCROSSBOW = 40;
const int VALUE_LIGHTCROSSBOW = 750;
const int DEX_LIGHTCROSSBOW = 40;
const int DAMAGE_CROSSBOW = 50;
const int VALUE_CROSSBOW = 1000;
const int DEX_CROSSBOW = 50;
const int DAMAGE_HEAVYCROSSBOW = 60;
const int VALUE_HEAVYCROSSBOW = 1500;
const int DEX_HEAVYCROSSBOW = 60;
const int DAMAGE_WARCROSSBOW = 70;
const int VALUE_WARCROSSBOW = 2000;
const int DEX_WARCROSSBOW = 70;

instance ITRW_SHORTBOW(C_Item)
{
	name = NAME_SHORTBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_SHORTBOW;
	damageTotal = DAMAGE_SHORTBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_SHORTBOW;
	visual = "ItRw_Bow_Small_01.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_RIDERBOW(C_Item)
{
	name = NAME_RIDERBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_RIDERBOW;
	damageTotal = DAMAGE_RIDERBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_RIDERBOW;
	visual = "ItRw_Bow_Small_02.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_FIELDBOW(C_Item)
{
	name = NAME_FIELDBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_FIELDBOW;
	damageTotal = DAMAGE_FIELDBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_FIELDBOW;
	visual = "ItRw_Bow_Small_03.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_HUNTINGBOW(C_Item)
{
	name = NAME_HUNTINGBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_HUNTINGBOW;
	damageTotal = DAMAGE_HUNTINGBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_HUNTINGBOW;
	visual = "ItRw_Bow_Small_04.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_LONGBOW(C_Item)
{
	name = NAME_LONGBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_LONGBOW;
	damageTotal = DAMAGE_LONGBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_LONGBOW;
	visual = "ItRw_Bow_Long_01.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_HEDGEBOW(C_Item)
{
	name = NAME_HEDGEBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_HEDGEBOW;
	damageTotal = DAMAGE_HEDGEBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_HEDGEBOW;
	visual = "ItRw_Bow_Long_02.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_YEWBOW(C_Item)
{
	name = NAME_YEWBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_YEWBOW;
	damageTotal = DAMAGE_YEWBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_YEWBOW;
	visual = "ItRw_Bow_Long_03.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_ARMYBOW(C_Item)
{
	name = NAME_ARMYBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_ARMYBOW;
	damageTotal = DAMAGE_ARMYBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_ARMYBOW;
	visual = "ItRw_Bow_Long_07.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_WARBOW(C_Item)
{
	name = NAME_WARBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD | ITEM_MULTI;
	value = VALUE_WARBOW;
	damageTotal = DAMAGE_WARBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_WARBOW;
	visual = "ItRw_Bow_War_01.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_STORMBOW(C_Item)
{
	name = NAME_STORMBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_STORMBOW;
	damageTotal = DAMAGE_STORMBOW;
	damagetype = DAM_POINT;
	munition = itam_arrow;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_STORMBOW;
	visual = "ItRw_Bow_War_03.mms";
	description = name;
	text[1] = NAME_TYPEBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_LIGHTCROSSBOW(C_Item)
{
	name = NAME_LIGHTCROSSBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_LIGHTCROSSBOW;
	damageTotal = DAMAGE_LIGHTCROSSBOW;
	damagetype = DAM_POINT;
	munition = itam_bolt;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_LIGHTCROSSBOW;
	visual = "ItRwCrossbow1.mms";
	description = name;
	text[1] = NAME_TYPECROSSBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_CROSSBOW(C_Item)
{
	name = NAME_CROSSBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_CROSSBOW;
	damageTotal = DAMAGE_CROSSBOW;
	damagetype = DAM_POINT;
	munition = itam_bolt;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_CROSSBOW;
	visual = "ItRwCrossbow2.mms";
	description = name;
	text[1] = NAME_TYPECROSSBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_HEAVYCROSSBOW(C_Item)
{
	name = NAME_HEAVYCROSSBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_HEAVYCROSSBOW;
	damageTotal = DAMAGE_HEAVYCROSSBOW;
	damagetype = DAM_POINT;
	munition = itam_bolt;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_HEAVYCROSSBOW;
	visual = "ItRwCrossbow3.mms";
	description = name;
	text[1] = NAME_TYPECROSSBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_WARCROSSBOW(C_Item)
{
	name = NAME_WARCROSSBOW;
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = VALUE_WARCROSSBOW;
	damageTotal = DAMAGE_WARCROSSBOW;
	damagetype = DAM_POINT;
	munition = itam_bolt;
	cond_atr[0] = ATR_DEXTERITY;
	cond_value[0] = DEX_WARCROSSBOW;
	visual = "ItRwCrossbow4.mms";
	description = name;
	text[1] = NAME_TYPECROSSBOW;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[0];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAM_ARROW(C_Item)
{
	name = NAME_ARROW;
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 1;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAM_BOLT(C_Item)
{
	name = NAME_BOLT;
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 1;
	visual = "ItAm_Bolt_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwOrcstaff(C_Item)
{
	name = "Grachtnakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwUdOrcstaff(C_Item)
{
	name = "ShaBaNakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

