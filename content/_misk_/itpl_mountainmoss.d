
const int VALUE_MOUTAINMOSS = 2;
const int HP_MOUTAINMOSS = 5;
const int VALUE_STONEROOT = 2;
const int HP_STONEROOT = 0;
const int VALUE_BLOODTHISTLE = 2;
const int HP_BLOODTHISTLE = -10;
const int VALUE_ORCLEAF = 2;
const int MANA_ORCLEAF = 1;
const int VALUE_RAVENHERB = 10;
const int MANA_RAVENHERB = 3;
const int VALUE_NIGHTSHADE = 25;
const int MANA_NIGHTSHADE = 10;
const int VALUE_CAVEMUSHROOM = 2;
const int HP_CAVEMUSHROOM = 10;
const int VALUE_SWAMPWEED = 5;
const int MANA_SWAMPWEED = 5;
const int VALUE_WOODBERRY = 3;
const int HP_WOODBERRY = 20;
const int VALUE_FLAMEBERRY = 6;
const int HP_FLAMEBERRY = 40;
const int VALUE_TROLLBERRY = 10;
const int HP_TROLLBERRY = -1000;

instance ITPL_MOUNTAINMOSS(C_Item)
{
	name = NAME_MOUNTAINMOSS;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MOUTAINMOSS;
	visual = "ItFo_Plants_mountainmoos_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usemountainmoss;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_MOUTAINMOSS;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_MOUTAINMOSS;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usemountainmoss()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseMountainMoss");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MOUTAINMOSS);
};


instance ITPL_STONEROOT(C_Item)
{
	name = NAME_STONEROOT;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STONEROOT;
	visual = "ItFo_Plants_Stoneroot_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usestoneroot;
	scemeName = "FOOD";
	description = name;
	text[0] = "Diese Pflanze wirkt wie ein starkes";
	text[1] = "Schlafmittel!";
	text[3] = NAME_Bonus_HP;
	count[1] = HP_STONEROOT;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_STONEROOT;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usestoneroot()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseStoneroot");
	AI_StartState(self,ZS_Unconscious,1,"");
};


instance ITPL_BLOODTHISTLE(C_Item)
{
	name = NAME_BLOODTHISTLE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BLOODTHISTLE;
	visual = "ItFo_Plants_Seraphis_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usebloodthistle;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_BLOODTHISTLE;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_BLOODTHISTLE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usebloodthistle()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseBloodThistle");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BLOODTHISTLE);
};


instance ITPL_ORCLEAF(C_Item)
{
	name = NAME_ORCLEAF;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_ORCLEAF;
	visual = "ItFo_Plants_Herb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useorcleaf;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = MANA_ORCLEAF;
	change_atr[0] = ATR_MANA;
	change_value[0] = MANA_ORCLEAF;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useorcleaf()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseOrcLeaf");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ORCLEAF);
};


instance ITPL_RAVENHERB(C_Item)
{
	name = NAME_RAVENHERB;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RAVENHERB;
	visual = "ItFo_Plants_Herb_02.3ds";
	material = MAT_WOOD;
	on_state[0] = useravenherb;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = MANA_RAVENHERB;
	change_atr[0] = ATR_MANA;
	change_value[0] = MANA_RAVENHERB;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useravenherb()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseRavenHerb");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_RAVENHERB);
};


instance ITPL_NIGHTSHADE(C_Item)
{
	name = NAME_NIGHTSHADE;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_NIGHTSHADE;
	visual = "ItFo_Plants_Herb_03.3ds";
	material = MAT_WOOD;
	on_state[0] = usenightshade;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = MANA_NIGHTSHADE;
	change_atr[0] = ATR_MANA;
	change_value[0] = MANA_NIGHTSHADE;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usenightshade()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseNightshade");
	Npc_ChangeAttribute(self,ATR_MANA,MANA_NIGHTSHADE);
};


instance ITPL_CAVEMUSHROOM(C_Item)
{
	name = NAME_CAVEMUSHROOM;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_CAVEMUSHROOM;
	visual = "ItFo_Plants_mushroom_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usecavemushroom;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_CAVEMUSHROOM;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_CAVEMUSHROOM;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usecavemushroom()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseCaveMushroom");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CAVEMUSHROOM);
};


instance ITPL_SWAMPWEED(C_Item)
{
	name = NAME_SWAMPWEED;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SWAMPWEED;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useswampweed;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = MANA_SWAMPWEED;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = MANA_SWAMPWEED;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useswampweed()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseSwampweed");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,MANA_SWAMPWEED);
};


instance ITPL_WOODBERRY(C_Item)
{
	name = NAME_WOODBERRY;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WOODBERRY;
	visual = "ItFo_Plants_Berrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usewoodberry;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_WOODBERRY;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_WOODBERRY;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usewoodberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseWoodberry");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WOODBERRY);
};


instance ITPL_FLAMEBERRY(C_Item)
{
	name = NAME_FLAMEBERRY;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FLAMEBERRY;
	visual = "ItFo_Plants_Flameberry_01.3ds";
	material = MAT_WOOD;
	on_state[0] = useflameberry;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_FLAMEBERRY;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_FLAMEBERRY;
	text[5] = NAME_Value;
	count[5] = value;
};


func void useflameberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseFlameberry");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FLAMEBERRY);
};


instance ITPL_TROLLBERRY(C_Item)
{
	name = NAME_TROLLBERRY;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_TROLLBERRY;
	visual = "ItFo_Plants_Trollberrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usetrollberry;
	scemeName = "FOOD";
	description = name;
	text[1] = "Diese Beeren sind für Menschen";
	text[2] = "hochgradig giftig!";
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_TROLLBERRY;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usetrollberry()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseTrollberry");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_TROLLBERRY);
};

