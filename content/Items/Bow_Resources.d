const int		Amnt_ShortBow		= 5;
const int		Amnt_RiderBow		= 10;
const int		Amnt_FieldBow		= 15;
const int		Amnt_HuntingBow		= 20;
const int		Amnt_LongBow		= 25;
const int		Amnt_HedgeBow		= 30;
const int		Amnt_YewBow			= 35;
const int		Amnt_WillowBow		= 35;
const int		Amnt_ArmyBow		= 40;
const int		Amnt_WarBow			= 45;
const int		Amnt_StormBow		= 50;

const int		Amnt_LightCrossBow	= 50;
const int		Amnt_CrossBow		= 75;
const int		Amnt_HeavyCrossBow	= 100;
const int		Amnt_WarCrossBow	= 150;

const int		Prod_ShortBow		= 1;
const int		Prod_RiderBow		= 1;
const int		Prod_FieldBow		= 1;
const int		Prod_HuntingBow		= 1;
const int		Prod_LongBow		= 1;
const int		Prod_HedgeBow		= 1;
const int		Prod_WillowBow		= 1;
const int		Prod_YewBow			= 1;
const int		Prod_ArmyBow		= 1;
const int		Prod_WarBow			= 1;
const int		Prod_StormBow		= 1;

const int		Prod_LightCrossBow	= 1;
const int		Prod_CrossBow		= 1;
const int		Prod_HeavyCrossBow	= 1;
const int		Prod_WarCrossBow	= 1;



//const string 	NAME_ItMi_Wood		= "Holz zur Bogenherstellung";
const string 	NAME_ItMi_Wood		= "Dřevo na výrobu luků";
const int		VAlue_Wood			= 1;

//const string 	NAME_ItWr_Bow		= "Buch der Kurzbögen";
const string 	NAME_ItWr_Bow		= "Kniha krátkých luků";
const int		VAlue_Book_Bow		= 10;

//const string 	NAME_ItWr_LongBow	= "Buch der Langbögen";
const string 	NAME_ItWr_LongBow	= "Kniha dlouhých luků";
const int		VAlue_Book_LongBow	= 10;

//const string 	NAME_ItWr_CrossBow	= "Buch der Armbrüste";
const string 	NAME_ItWr_CrossBow	= "Kniha kuší";
const int		VAlue_Book_CrossBow	= 10;

/******************************************************************************************/

INSTANCE ItMi_FletcherWood (C_Item)
{
	name 				=	NAME_FletcherWood;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_FletcherWood.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};


INSTANCE ItMi_FletcherKnife (C_Item)
{
	name 				=	NAME_FletcherKnife;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_FletcherKnife.3DS";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItMi_BowWood (C_Item)
{
	name 				=	NAME_BowWood;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"BOWWOOD.mms";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};



