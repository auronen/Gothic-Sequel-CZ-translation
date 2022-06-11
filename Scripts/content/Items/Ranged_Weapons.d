//-------- Bögen --------
const int	Damage_ShortBow		=	10;		const int	Value_ShortBow		=	100;	const int	Dex_ShortBow		=	20;
const int	Damage_RiderBow		=	15;		const int	Value_RiderBow		=	150;	const int	Dex_RiderBow		=	25;
const int	Damage_FieldBow		=	20;		const int	Value_FieldBow		=	200;    const int	Dex_FieldBow		=	30;
const int	Damage_HuntingBow	=	25;		const int	Value_HuntingBow	=	250;    const int	Dex_HuntingBow	    =	35;
const int	Damage_LongBow		=	30;		const int	Value_LongBow		=	300;	const int	Dex_LongBow		    =	40;
const int	Damage_HedgeBow		=	35;		const int	Value_HedgeBow		=	400;	const int	Dex_HedgeBow		=	45;
const int	Damage_YewBow		=	40;		const int	Value_YewBow		=	500;	const int	Dex_YewBow		    =	50;
const int	Damage_ArmyBow		=	45;		const int	Value_ArmyBow		=	750;	const int	Dex_ArmyBow		    =	60;
const int	Damage_WarBow		=	50;		const int	Value_WarBow		=	1000;	const int	Dex_WarBow		    =	80;
const int	Damage_StormBow		=	60;		const int	Value_StormBow		=	1500;	const int	Dex_StormBow		=	100;

//-------- Armbrüste --------
const int	Damage_LightCrossbow=	40;		const int	Value_LightCrossbow	=	750;	const int	Dex_LightCrossbow   =	40;
const int	Damage_Crossbow		=	50;		const int	Value_Crossbow		=	1000;	const int	Dex_Crossbow		=	50;
const int	Damage_HeavyCrossbow=	60;		const int	Value_HeavyCrossbow	=	1500;	const int	Dex_HeavyCrossbow   =	60;
const int	Damage_WarCrossbow	=	70;		const int	Value_WarCrossbow	=	2000;	const int	Dex_WarCrossbow	    =	70;






//KURZBOGEN//
INSTANCE ItRw_ShortBow (C_Item)
{
	name 				=	NAME_ShortBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_Shortbow;

	damageTotal			=	Damage_Shortbow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;

	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_Shortbow;
	visual 				=	"ItRw_Bow_Small_01.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;				COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;						COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_RiderBow (C_Item)
{
	name 				=	NAME_RiderBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_RiderBow;

	damageTotal			=	Damage_RiderBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_RiderBow;
	visual 				=	"ItRw_Bow_Small_02.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_FieldBow (C_Item)
{
	name 				=	NAME_FieldBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_FieldBow;

	damageTotal			=	Damage_FieldBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_FieldBow;
	visual 				=	"ItRw_Bow_Small_03.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_HuntingBow (C_Item)
{
	name 				=	NAME_HuntingBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_HuntingBow;

	damageTotal			=	Damage_HuntingBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_HuntingBow;
	visual 				=	"ItRw_Bow_Small_04.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
//LANGBOGEN//
/******************************************************************************************/
INSTANCE ItRw_LongBow (C_Item)
{
	name 				=	NAME_LongBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_LongBow;

	damageTotal			=	Damage_LongBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_LongBow;
	visual 				=	"ItRw_Bow_Long_01.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_HedgeBow (C_Item)
{
	name 				=	NAME_HedgeBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_HedgeBow;

	damageTotal			=	Damage_HedgeBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_HedgeBow;
	visual 				=	"ItRw_Bow_Long_02.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_YewBow (C_Item)
{
	name 				=	NAME_YewBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_YewBow;

	damageTotal			=	Damage_YewBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_YewBow;
	visual 				=	"ItRw_Bow_Long_03.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_ArmyBow (C_Item)
{
	name 				=	NAME_ArmyBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_ArmyBow;

	damageTotal			=	Damage_ArmyBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_ArmyBow;
	visual 				=	"ItRw_Bow_Long_07.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};



/******************************************************************************************/
//KRIEGSBOGEN//
/******************************************************************************************/
INSTANCE ItRw_WarBow (C_Item)
{
	name 				=	NAME_WarBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD|ITEM_MULTI;

	value 				=	Value_WarBow;

	damageTotal			=	Damage_WarBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_WarBow;
	visual 				=	"ItRw_Bow_War_01.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_StormBow (C_Item)
{
	name 				=	NAME_StormBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_StormBow;

	damageTotal			=	Damage_StormBow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Arrow;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_StormBow;
	visual 				=	"ItRw_Bow_War_03.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeBow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};






/******************************************************************************************/
//ARMBRUST//
/******************************************************************************************/
INSTANCE ItRw_LightCrossBow(C_Item)
{
	name 				=	NAME_LightCrossBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_LightCrossbow;

	damageTotal			= 	Damage_LightCrossbow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Bolt;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_LightCrossbow;
	visual 				=	"ItRwCrossbow1.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeCrossbow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_CrossBow(C_Item)
{
	name 				=	NAME_CrossBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_Crossbow;

	damageTotal			= 	Damage_Crossbow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Bolt;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_Crossbow;
	visual 				=	"ItRwCrossbow2.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeCrossbow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_HeavyCrossBow(C_Item)
{
	name 				=	NAME_HeavyCrossBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_HeavyCrossbow;

	damageTotal			= 	Damage_HeavyCrossbow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Bolt;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_HeavyCrossbow;
	visual 				=	"ItRwCrossbow3.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeCrossbow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItRw_WarCrossBow(C_Item)
{
	name 				=	NAME_WarCrossBow;

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	Value_WarCrossbow;

	damageTotal			= 	Damage_WarCrossbow;
	damagetype			=	DAM_POINT;
	munition			=	ItAm_Bolt;
	cond_atr[0]   		= 	ATR_DEXTERITY;
	cond_value[0]  		= 	Dex_WarCrossbow;
	visual 				=	"ItRwCrossbow4.mms";

	description			=	name;
	TEXT[0]				=	NAME_TypeCrossbow;
	TEXT[2]				=	NAME_Damage;				COUNT[2]	= damageTotal;
	TEXT[3] 			=	NAME_Dex_needed;			COUNT[3]	= cond_value[0];
	TEXT[5]				=	NAME_Value;					COUNT[5]	= value;
};


/******************************************************************************************/
//MUNITION//
/******************************************************************************************/
INSTANCE ItAm_Arrow(C_Item)
{
	name 				=	NAME_Arrow;

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Arrow_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[0];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAm_Bolt(C_Item)
{
	name 				=	NAME_Bolt;

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Bolt_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[0];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


/********************************************************************************/
// Orc-Schamane (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwOrcstaff (C_Item)
{
	name 				=	"Grachtnakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[0];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


/********************************************************************************/
// Untoter Orc-Priester (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwUdOrcstaff (C_Item)
{
	name 				=	"ShaBaNakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[0];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
