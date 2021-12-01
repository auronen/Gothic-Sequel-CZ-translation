// ************************************************************************************************
// Wert von Tiertrophäen
// ************************************************************************************************

// Werte der Trophäen
const int	Value_Bugmeat			=	1;		const int	HP_Bugmeat			=	10;
const int	Value_MoleratGrease		=	3;
const int	Value_Zähne				=	5;
const int	Value_Krallen			=	7;
const int	Value_Wolfsfell			=	5;
const int	Value_Orkhundfell		=	7;
const int	Value_Panzerplatte		=	25;
const int	Value_Crawlerzangen		=	5;
const int	Value_Shadowbeastfell	=	50;
const int	Value_Lurkerklaue		=	7;
const int	Value_Lurkerhaut		=	12;
const int	Value_Sumpfhaihaut		=	100;
const int	Value_Trollfell			=	150;
const int	Value_Flügel			=	7;	// Bloodfly
const int	Value_Stachel			=	12;	// Bloodfly
const int	Value_DemonSting		=	25;	// Dämonische tiere

// Durch Ulu-Mulu freigeschaltet
// bei Auftragsvergabe werden je 3 neue Monster gespawnt
const int	Value_Feuerzunge		=	200;
const int	Value_Sumpfhaizähne		=	200;
const int	Value_Shadowbeasthorn	=	200;
const int	Value_Trollhauer		=	200;

// Golems beim Dämonenbeschwörer
const int	Value_Steinherz			=	400;
const int	Value_Feuerherz			=	400;
const int	Value_Eisherz			=	400;
const int	Value_Eistueck			=	50;


/*
So in der Tasche
----------------
ItAt_Meatbug 	//Meatbug			Körper (Essen)		(Item-Instanz in Food.d)
ItFo_MuttonRaw		//Scavenger			2 Bollen			OK
					//Molerats			2 Bollen			OK
					//Shadowbeast		4 Bollen			OK

ItAt_BloodflyWings 	//Bloodfly			Flügel				OK

Durch Jäger freigeschaltet (noch nicht verteilt)
--------------------------
ItAt_Teeth 		//Wolf				2 Zähne				OK
					//Schwarzer Wolf	2 Zähne				OK
					//Snapper			10 Zähne			OK
					//Orcbiter			2 Zähne				OK
					//Shadowbeast		4 Zähne				OK
					//Bloodhound		4 Zähne				OK
//--------------------------------------------------------------
ItAt_Claws 		//Waran				4 Klauen			OK
					//Feuerechse		4 Klauen			OK
					//Snapper			3 Klauen			OK
					//Razor				3 Klauen			OK
					//Beisser			2 Klauen			OK
ItAt_LurkerClaw 		//Lurker 			2 Klauen			OK
//--------------------------------------------------------------
ItAt_Wolf 		//Wolf	 			Wolfsfell			OK
ItAt_Wolf_02 		//Orkhund	 		Orkhundfell			OK
ItAt_ShadowFur 		//Shadowbeast		Shadowbeast-Fell	OK
ItAt_TrollFur 		//Troll				Trollfell			OK
//--------------------------------------------------------------
ItAt_SwampsharkSkin 	//Sumpfhai			Haut des Sumpfhais	OK
ItAt_LurkerSkin 		//Lurker			Haut des Lurkers	OK

Durch Templer / Kalom freigeschaltet (noch nicht verteilt)
------------------------------------
ItAt_MandiblesCrawler 	//Crawler		 	Zangen				OK
ItAt_BloodflySting 	//Bloodfly			Stachel				OK

Durch ORG_855_Wolf freigeschaltet
------------------------
ItAt_PlatesCrawler 	//Crawler			Panzerplatten		OK

Durch Ulu-Mulu freigeschaltet
-----------------------------
ItAt_Waran 		//Feuerechse		Flammenzunge		OK
ItAt_SwampsharkTeeth 	//Sumpfhai			Zähne des Sumpfhais	OK
ItAt_ShadowHorn 		//Shadowbeast		Horn				OK
ItAt_TrollTheeth 		//Troll				Hauer				OK
*/

/******************************************************************************************/
INSTANCE ItAt_Meatbug (C_Item)
{
	name 				=	NAME_MeatBug;

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Bugmeat;

	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat;

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]		= HP_Bugmeat;
	change_atr[0]		= ATR_HITPOINTS;				change_value[0]	= HP_Bugmeat;
	TEXT[5]				= NAME_Value;					COUNT[5]		= Value_Bugmeat;

};

	FUNC VOID UseBugmeat()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Bugmeat);
	};

//////////////////////////////////////////////////////////////////////////////////
//	Moleratfett
//////////////////////////////////////////////////////////////////////////////////
INSTANCE ItAt_MoleratGrease (C_Item)
{
	name 				=	NAME_MoleratGrease;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MoleratGrease;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";
	material 			=	MAT_CLAY;

	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_Teeth (C_Item)
{
	name 				=	NAME_Teeth;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Zähne;

	visual 				=	"ItAt_Teeth_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_Wolf (C_Item)
{
	name 				=	NAME_WolfFur;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wolfsfell;

	visual 				=	"ItAt_Wolf_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Wolf_02 (C_Item)
{
	name 				=	NAME_OrkDogFur;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Orkhundfell;

	visual 				=	"ItAt_Wolf_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Waran (C_Item)
{
	name 				=	NAME_WaranTongue;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Feuerzunge;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Claws (C_Item)
{
	name 				=	NAME_Claws;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krallen;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_PlatesCrawler (C_Item)
{
	name 				=	NAME_CrawlerPlates;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Panzerplatte;

	visual 				=	"ItAt_Crawler_02.3DS";
	material 			=	MAT_WOOD;

//	description			= "Die Panzerplatte eines Minecrawler Kriegers";
	description			= "Krunýř válečníka důlních červů";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_MandiblesCrawler (C_Item)
{
	name 				=	NAME_CrawlerMandibles;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Crawlerzangen;

	visual 				=	"ItAt_Crawler_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_ShadowFur (C_Item)
{
	name 				=	NAME_ShadowFur;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeastfell;

	visual 				=	"ItAt_Shadowbeast_01.3DS";
	material 			=	MAT_LEATHER;

//	description			= "Fell eines Schattenläufers";
	description			= "Kožešina stínové šelmy";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_ShadowHorn (C_Item)
{
	name 				=	NAME_ShadowHorn;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Shadowbeasthorn;

	visual 				=	"ItAt_Shadowbeast_02.3DS";
	material 			=	MAT_LEATHER;

//	description			= "Horn eines Schattenläufers";
	description			= "Roh stínové šelmy";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_LurkerClaw (C_Item)
{
	name 				=	NAME_LurkerClaw;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerklaue;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_LurkerSkin (C_Item)
{
	name 				=	NAME_LurkerSkin;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lurkerhaut;

	visual 				=	"ItAt_Lurker_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_TrollTheeth (C_Item)
{
	name 				=	NAME_TrollTeeth;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollhauer;

	visual 				=	"ItAt_Troll_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_TrollFur (C_Item)
{
	name 				=	NAME_TrollFur;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollfell;

	visual 				=	"ItAt_Troll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SwampsharkSkin (C_Item)
{
	name 				=	NAME_SwampsharkSkin;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaihaut;

	visual 				=	"ItAt_Swampshark_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SwampsharkTeeth (C_Item)
{
	name 				=	NAME_SwampsharkTeeth;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaizähne;

	visual 				=	"ItAt_Swampshark_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_BloodflyWings (C_Item)
{
	name 				=	NAME_BloodflyWings;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Flügel;

	visual 				=	"ItAt_Bloodfly_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_BloodflySting (C_Item)
{
	name 				=	NAME_BloodflySting;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stachel;

	visual 				=	"ItAt_Bloodfly_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_DemonSting (C_Item)
{
	name 				=	NAME_DemonSting;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DemonSting;

	visual 				=	"ItAt_Bloodfly_02.3DS";
	material 			=	MAT_LEATHER;

	description			=	name;
//	TEXT[0]				=	"Diese messerscharfen Dornen";
//	TEXT[1]				=	"sind auf allen von Dämonen";
//	TEXT[2]				=	"besessenen Tieren zu finden.";
	TEXT[0]				=	"Tyto ostny, ostré jako břitva,";
	TEXT[1]				=	"jsou k nalezení na všech";
	TEXT[2]				=	"posedlých zvířatech.";

	TEXT[4]				=	NAME_Value;					COUNT[4]	= value;
};



/******************************************************************************************/
INSTANCE ItAt_StoneGolemHeart (C_Item)
{
	name 				=	NAME_StonegolemHeart;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_WINDFIST;

	value 				=	Value_Steinherz;

	visual 				=	"ItAt_StoneGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
//	TEXT[0]				= "Dieses Herz stammt aus den Überresten";
//	TEXT[1]				= "eines besiegten Steingolems.";
//	TEXT[2]				= "Es hat die Kraft, einen Gegner";
//	TEXT[3]				= "durch die Luft zu schleudern.";
	TEXT[0]				= "Toto je srdce vyjmuté ze zbytků";
	TEXT[1]				= "poraženého kamenného golema.";
	TEXT[2]				= "Má moc odmrštit nepřátele";
	TEXT[3]				= "do vzduchu.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_FireGolemHeart (C_Item)
{
	name 				=	NAME_FiregolemHeart;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	Value_Feuerherz;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
//	TEXT[0]				= "Dieses Herz stammt aus den Überresten";
//	TEXT[1]				= "eines besiegten Feuergolems.";
//	TEXT[2]				= "Es hat die Kraft, einen Gegner";
//	TEXT[3]				= "in Flammen aufgehen zu lassen.";
	TEXT[0]				= "Toto je srdce vyjmuté ze zbytků";
	TEXT[1]				= "poraženého ohnivého golema.";
	TEXT[2]				= "Má moc zapálit nepřítele.";

	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolemHeart (C_Item)
{
	name 				=	NAME_IcegolemHeart;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_ICECUBE;

	value 				=	Value_Eisherz;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
//	TEXT[0]				= "Dieses Herz stammt aus den Überresten";
//	TEXT[1]				= "eines besiegten Eisgolems.";
//	TEXT[2]				= "Es hat die Kraft, einen Gegner";
//	TEXT[3]				= "zu Eis erstarren zu lassen.";
	TEXT[0]				= "Toto je srdce vyjmuté ze zbytků";
	TEXT[1]				= "poraženého ledového golema.";
	TEXT[2]				= "Má moc zmrazit nepřítele.";

	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolemPiece (C_Item)
{
	name 				=	NAME_IcegolemPiece;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_THUNDERBOLT;

	value 				=	Value_Eistueck;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	500;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
//	TEXT[0]				= "Dieses Stück stammt aus den Überresten";
//	TEXT[1]				= "eines besiegten Eisgolems.";
	TEXT[0]				= "Toto je kousek";
	TEXT[1]				= "poraženého ledového golema.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
