INSTANCE HELMET(C_ITEM)
{
//  name 					=	"Test Helm";
	name 					=	"Testovací helma";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	ITEM_AMULET;

	value 					=	100;

	wear 					=	WEAR_HEAD;

// Fixme: INV-Visual muß noch erstellt werden
	visual 					=	"ItHe_EbrHelmet.3ds";

	//visual_change 			=	"Hum_DHTS_ARMOR.asc";
	
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	on_equip		=	Equip_TestHelmet;
	on_unequip		=	UnEquip_TestHelmet;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID Equip_TestHelmet()
{
 	self.protection [PROT_EDGE]		+=	1500;
	self.protection [PROT_BLUNT] 	+= 	1500;
	self.protection [PROT_POINT] 	+=  1500;
	self.protection [PROT_FIRE] 	+= 	1500;
	self.protection [PROT_MAGIC] 	+= 	1500;
};


FUNC VOID UnEquip_TestHelmet()
{
 	self.protection [PROT_EDGE]		-=	1500;
	self.protection [PROT_BLUNT] 	-= 	1500;
	self.protection [PROT_POINT] 	-=  1500;
	self.protection [PROT_FIRE] 	-= 	1500;
	self.protection [PROT_MAGIC] 	-= 	1500;
};

