
const int AMNT_SHORTBOW = 5;
const int AMNT_RIDERBOW = 10;
const int AMNT_FIELDBOW = 15;
const int AMNT_HUNTINGBOW = 20;
const int AMNT_LONGBOW = 25;
const int AMNT_HEDGEBOW = 30;
const int AMNT_YEWBOW = 35;
const int AMNT_WILLOWBOW = 35;
const int AMNT_ARMYBOW = 40;
const int AMNT_WARBOW = 45;
const int AMNT_STORMBOW = 50;
const int AMNT_LIGHTCROSSBOW = 50;
const int AMNT_CROSSBOW = 75;
const int AMNT_HEAVYCROSSBOW = 100;
const int AMNT_WARCROSSBOW = 150;
const int PROD_SHORTBOW = 1;
const int PROD_RIDERBOW = 1;
const int PROD_FIELDBOW = 1;
const int PROD_HUNTINGBOW = 1;
const int PROD_LONGBOW = 1;
const int PROD_HEDGEBOW = 1;
const int PROD_WILLOWBOW = 1;
const int PROD_ARMYBOW = 1;
const int PROD_WARBOW = 1;
const int PROD_STORMBOW = 1;
const int PROD_LIGHTCROSSBOW = 1;
const int PROD_CROSSBOW = 1;
const int PROD_HEAVYCROSSBOW = 1;
const int PROD_WARCROSSBOW = 1;

const string NAME_ITMI_WOOD = "Holz zur Bogenherstellung";

const int VALUE_WOOD = 1;

const string NAME_ITWR_BOW = "Buch der Kurzbögen";

const int VALUE_BOOK_BOW = 10;

const string NAME_ITWR_LONGBOW = "Buch der Langbögen";

const int VALUE_BOOK_LONGBOW = 10;

const string NAME_ITWR_CROSSBOW = "Buch der Armbrüste";

const int VALUE_BOOK_CROSSBOW = 10;

instance ITMI_FLETCHERWOOD(C_Item)
{
	name = NAME_FLETCHERWOOD;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_FletcherWood.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_FLETCHERKNIFE(C_Item)
{
	name = NAME_FLETCHERKNIFE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_FletcherKnife.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_BOWWOOD(C_Item)
{
	name = NAME_BOWWOOD;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "BOWWOOD.mms";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

