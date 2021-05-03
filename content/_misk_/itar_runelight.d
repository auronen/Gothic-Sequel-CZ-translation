
instance ITAR_RUNELIGHT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_42.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	mag_circle = 1;
	description = NAME_LIGHT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLLIGHT(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItAr_Scroll_32.3DS";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_LIGHT;
	description = NAME_LIGHT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEFIREBOLT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_23.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	mag_circle = 1;
	description = NAME_FIREBOLT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLFIREBOLT(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItAr_Scroll_35.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBOLT;
	description = NAME_FIREBOLT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEFIREBALL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_26.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	mag_circle = 3;
	description = NAME_FIREBALL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLFIREBALL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_27.3DS";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBALL;
	description = NAME_FIREBALL;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEFIRESTORM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_24.3ds";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	mag_circle = 4;
	description = NAME_FIRESTORM;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLFIRESTORM(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_28.3DS";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRESTORM;
	description = NAME_FIRESTORM;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = ConcatStrings(NAME_Dam_Fire,NAME_PerMana);
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEFIRERAIN(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1300;
	visual = "ItAr_Rune_25.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	mag_circle = 5;
	description = NAME_FIRERAIN;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLFIRERAIN(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 130;
	visual = "ItAr_Scroll_36.3DS";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRERAIN;
	description = NAME_FIRERAIN;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNETELEPORT1(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_38.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport1;
	description = NAME_TELEPORT1;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_SCROLLTELEPORT1(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_38.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport1;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = NAME_TELEPORT1;
	text[0] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
	text[2] = "Dieser Teleportzauber ist nicht wie andere.";
	text[3] = "Er scheint mehr als nur Mana zu benötigen!";
};

instance ITAR_RUNETELEPORT2(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_40.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport2;
	description = NAME_TELEPORT2;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_SCROLLTELEPORT2(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_37.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = NAME_TELEPORT2;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_RUNETELEPORT3(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_41.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport3;
	description = NAME_TELEPORT3;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
	text[3] = "Diese Rune teleportiert direkt in den";
	text[4] = "Turm von Xardas dem Dämonenbeschwörer.";
};

instance ITAR_SCROLLTELEPORT3(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_40.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport3;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = NAME_TELEPORT3;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_RUNETELEPORT5(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_39.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport5;
	description = NAME_TELEPORT4;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_SCROLLTELEPORT5(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_STONE;
	spell = SPL_Teleport5;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = NAME_TELEPORT4;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITAR_RUNEHEAL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_27.3ds";
	material = MAT_STONE;
	spell = SPL_HEAL;
	mag_circle = 2;
	description = NAME_HEAL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = "Heilung pro Mana";
	count[1] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLHEAL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_HEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = NAME_HEAL;
	text[1] = "Heilung pro Mana";
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFBLOODFLY(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_BLOODFLY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_BLOODFLY;
	description = NAME_TRF_BLOODFLY;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFCRAWLER(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_04.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_CRAWLER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_CRAWLER;
	description = NAME_TRF_CRAWLER;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFLURKER(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_02.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_LURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_LURKER;
	description = NAME_TRF_LURKER;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_LURKER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFMEATBUG(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_03.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MEATBUG;
	description = NAME_TRF_MEATBUG;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFMOLERAT(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_05.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_MOLERAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MOLERAT;
	description = NAME_TRF_MOLERAT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFORCDOG(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_11.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_ORCDOG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_ORCDOG;
	description = NAME_TRF_ORCDOG;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFSCAVENGER(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_07.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SCAVENGER;
	description = NAME_TRF_SCAVENGER;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFSHADOWBEAST(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_06.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SHADOWBEAST;
	description = NAME_TRF_SHADOWBEAST;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFSNAPPER(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_SNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SNAPPER;
	description = NAME_TRF_SNAPPER;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFWARAN(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_10.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WARAN;
	description = NAME_TRF_WARAN;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WARAN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTRFWOLF(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItAr_Scroll_09.3DS";
	material = MAT_STONE;
	spell = SPL_TRF_WOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WOLF;
	description = NAME_TRF_WOLF;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WOLF;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNECHAINLIGHTNING(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_18.3ds";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	mag_circle = 4;
	description = NAME_CHAINLIGHTNING;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLCHAINLIGHTNING(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_20.3DS";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	description = NAME_CHAINLIGHTNING;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNETHUNDERBOLT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_19.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	mag_circle = 1;
	description = NAME_THUNDERBOLT;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTHUNDERBOLT(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_41.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBOLT;
	description = NAME_THUNDERBOLT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNETHUNDERBALL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_20.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	mag_circle = 3;
	description = NAME_THUNDERBALL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = ConcatStrings(NAME_Dam_Magic,NAME_PerMana);
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTHUNDERBALL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBALL;
	description = NAME_THUNDERBALL;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = ConcatStrings(NAME_Dam_Magic,NAME_PerMana);
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEICECUBE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_21.3ds";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	mag_circle = 3;
	description = NAME_ICECUBE;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = "Schaden";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLICECUBE(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_25.3DS";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICECUBE;
	description = NAME_ICECUBE;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = "Schaden";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEICEWAVE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_22.3ds";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	mag_circle = 5;
	description = NAME_ICEWAVE;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = "Schaden";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLICEWAVE(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_30.3DS";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICEWAVE;
	description = NAME_ICEWAVE;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = "Schaden";
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSUMMONDEMON(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 550;
	visual = "ItAr_Scroll_18.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONDEMON;
	description = NAME_SUMMONDEMON;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSUMMONSKELETONS(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONSKELETON;
	description = NAME_SUMMONSKELETON;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSUMMONGOLEM(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 450;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_STONE;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONGOLEM;
	description = NAME_SUMMONGOLEM;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLARMYOFDARKNESS(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 666;
	visual = "ItAr_Scroll_29.3DS";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ARMYOFDARKNESS;
	description = NAME_ARMYOFDARKNESS;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEDESTROYUNDEAD(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_15.3ds";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	mag_circle = 4;
	description = NAME_DESTROYUNDEAD;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLDESTROYUNDEAD(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_26.3DS";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_DESTROYUNDEAD;
	description = NAME_DESTROYUNDEAD;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEWINDFIST(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_06.3ds";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	mag_circle = 2;
	description = NAME_WINDFIST;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLWINDFIST(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_12.3DS";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_WINDFIST;
	description = NAME_WINDFIST;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNESTORMFIST(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_07.3ds";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	mag_circle = 4;
	description = NAME_STORMFIST;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSTORMFIST(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_17.3DS";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_STORMFIST;
	description = NAME_STORMFIST;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = ConcatStrings(NAME_Dam_Fly,NAME_PerMana);
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNETELEKINESIS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_05.3ds";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	mag_circle = 3;
	description = NAME_TELEKINESIS;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLTELEKINESIS(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_13.3DS";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = NAME_TELEKINESIS;
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNECHARM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_10.3ds";
	material = MAT_STONE;
	spell = SPL_CHARM;
	mag_circle = 3;
	description = NAME_CHARM;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLCHARM(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_19.3DS";
	material = MAT_STONE;
	spell = SPL_CHARM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_CHARM;
	description = NAME_CHARM;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNESLEEP(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_09.3ds";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	mag_circle = 2;
	description = NAME_SLEEP;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSLEEP(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SLEEP;
	description = NAME_SLEEP;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEPYROKINESIS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_04.3ds";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	mag_circle = 3;
	description = NAME_PYROKINESIS;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLPYROKINESIS(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_33.3DS";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = NAME_PYROKINESIS;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNECONTROL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_02.3ds";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	mag_circle = 4;
	description = NAME_CONTROL;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLCONTROL(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_08.3DS";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 30;
	description = NAME_CONTROL;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLFEAR(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItAr_Scroll_34.3DS";
	material = MAT_STONE;
	spell = SPL_FEAR;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FEAR;
	description = NAME_FEAR;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FEAR;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLBERZERK(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_22.3DS";
	material = MAT_STONE;
	spell = SPL_BERZERK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_BERZERK;
	description = NAME_BERZERK;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_RUNEBREATHOFDEATH(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1500;
	visual = "ItAr_Rune_21.3ds";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	mag_circle = 6;
	description = NAME_BREATHOFDEATH;
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BREATHOFDEATH;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLBREATHOFDEATH(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_22.3DS";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_BREATHOFDEATH;
	description = NAME_BREATHOFDEATH;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_SCROLLSHRINK(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItAr_Scroll_15.3DS";
	material = MAT_STONE;
	spell = SPL_SHRINK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SHRINK;
	description = NAME_SHRINK;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SHRINK;
	text[5] = NAME_Value;
	count[5] = value;
};

