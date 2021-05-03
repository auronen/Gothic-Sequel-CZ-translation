
const int Value_Bugmeat = 1;
const int HP_Bugmeat = 10;
const int VALUE_MOLERATGREASE = 3;
const int Value_Zähne = 5;
const int Value_Krallen = 7;
const int Value_Wolfsfell = 5;
const int Value_Orkhundfell = 7;
const int Value_Panzerplatte = 25;
const int Value_Crawlerzangen = 5;
const int Value_Shadowbeastfell = 50;
const int Value_Lurkerklaue = 7;
const int Value_Lurkerhaut = 12;
const int Value_Sumpfhaihaut = 100;
const int Value_Trollfell = 150;
const int Value_Flügel = 7;
const int Value_Stachel = 12;
const int VALUE_DEMONSTING = 25;
const int Value_Feuerzunge = 200;
const int Value_Sumpfhaizähne = 200;
const int Value_Shadowbeasthorn = 200;
const int Value_Trollhauer = 200;
const int Value_Steinherz = 400;
const int Value_Feuerherz = 400;
const int Value_Eisherz = 400;
const int Value_Eistueck = 50;

instance ITAT_MEATBUG(C_Item)
{
	name = NAME_MEATBUG;
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bugmeat;
	visual = "ItAt_Meatbug_01.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = UseBugmeat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bugmeat;
	change_atr[0] = ATR_HITPOINTS;
	change_value[0] = HP_Bugmeat;
	text[5] = NAME_Value;
	count[5] = Value_Bugmeat;
};


func void UseBugmeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bugmeat);
};


instance ITAT_MOLERATGREASE(C_Item)
{
	name = NAME_MOLERATGREASE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_MOLERATGREASE;
	visual = "ItMi_Alchemy_Moleratlubric_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_TEETH(C_Item)
{
	name = NAME_TEETH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zähne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_WOLF(C_Item)
{
	name = NAME_WOLFFUR;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItAt_Wolf_02(C_Item)
{
	name = NAME_ORKDOGFUR;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_WARAN(C_Item)
{
	name = NAME_WARANTONGUE;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_CLAWS(C_Item)
{
	name = NAME_CLAWS;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_PLATESCRAWLER(C_Item)
{
	name = NAME_CRAWLERPLATES;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = "Die Panzerplatte eines Minecrawler Kriegers";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_MANDIBLESCRAWLER(C_Item)
{
	name = NAME_CRAWLERMANDIBLES;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_SHADOWFUR(C_Item)
{
	name = NAME_SHADOWFUR;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeastfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Fell eines Schattenläufers";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_SHADOWHORN(C_Item)
{
	name = NAME_SHADOWHORN;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = "Horn eines Schattenläufers";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_LURKERCLAW(C_Item)
{
	name = NAME_LURKERCLAW;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_LURKERSKIN(C_Item)
{
	name = NAME_LURKERSKIN;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerhaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_TROLLTHEETH(C_Item)
{
	name = NAME_TROLLTEETH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_TROLLFUR(C_Item)
{
	name = NAME_TROLLFUR;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_SWAMPSHARKSKIN(C_Item)
{
	name = NAME_SWAMPSHARKSKIN;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_SWAMPSHARKTEETH(C_Item)
{
	name = NAME_SWAMPSHARKTEETH;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaizähne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_BLOODFLYWINGS(C_Item)
{
	name = NAME_BLOODFLYWINGS;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flügel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_BLOODFLYSTING(C_Item)
{
	name = NAME_BLOODFLYSTING;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_DEMONSTING(C_Item)
{
	name = NAME_DEMONSTING;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DEMONSTING;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Diese messerscharfen Dornen";
	text[1] = "sind auf allen von Dämonen";
	text[2] = "besessenen Tieren zu finden.";
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITAT_STONEGOLEMHEART(C_Item)
{
	name = NAME_STONEGOLEMHEART;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Steingolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "durch die Luft zu schleudern.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAT_FIREGOLEMHEART(C_Item)
{
	name = NAME_FIREGOLEMHEART;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Feuergolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "in Flammen aufgehen zu lassen.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAT_ICEGOLEMHEART(C_Item)
{
	name = NAME_ICEGOLEMHEART;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Eisgolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "zu Eis erstarren zu lassen.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAT_ICEGOLEMPIECE(C_Item)
{
	name = NAME_ICEGOLEMPIECE;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Stück stammt aus den Überresten";
	text[1] = "eines besiegten Eisgolems.";
	text[4] = NAME_Value;
	count[4] = value;
};

