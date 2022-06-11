//Ringe//
	instance ItRi_Fire_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Fire_01;
	on_unequip				=	UnEquip_ItRi_Fire_01;

//	description				= " Flammenschutzring";
	description				= "Prsten plamenné ochrany";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= 3;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Fire_01()
	{
		self.protection [PROT_FIRE] 		+=  3;
	};

	FUNC VOID UnEquip_ItRi_Fire_01()
	{
	self.protection [PROT_FIRE] 		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Fire_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Fire_02;
	on_unequip				=	UnEquip_ItRi_Fire_02;

//	description				= "Schutz vor Feuer";
	description				= "Ochrana před ohněm";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= 5;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Fire_02()
	{
	self.protection [PROT_FIRE] 		+=  5;
	};

	FUNC VOID UnEquip_ItRi_Fire_02()
	{
	self.protection [PROT_FIRE] 		-=  5;
	};

/******************************************************************************************/
	INSTANCE ItRi_Point_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Point_01;
	on_unequip				=	UnEquip_ItRi_Point_01;

//	description				= "Ring der Holzhaut";
	description				= "Prsten dřevěné kůže";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= 5;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Point_01()
	{
	self.protection [PROT_POINT] 		+=  5;
	};

	FUNC VOID UnEquip_ItRi_Point_01()
	{
	self.protection [PROT_POINT] 		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Point_02(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Point_02;
	on_unequip				=	UnEquip_ItRi_Point_02;

//	description				= "Ring der Steinhaut";
	description				= "Prsten kamenné kůže";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Point;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;	
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Point_02()
	{
	self.protection [PROT_POINT] 		+=  10;
	};

	FUNC VOID UnEquip_ItRi_Point_02()
	{
	self.protection [PROT_POINT] 		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Edge_01(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_ItRi_Edge_01;
	on_unequip				=	UnEquip_ItRi_Edge_01;

//	description				= "Ring der Eisenhaut";
	description				= "Prsten železné kůže";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 5;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Edge_01()
	{
	self.protection [PROT_EDGE] 		+=  5;
	self.protection [PROT_BLUNT]		+=  5;
	};

	FUNC VOID UnEquip_ItRi_Edge_01()
	{
	self.protection [PROT_EDGE] 		-=  5;
	self.protection [PROT_BLUNT]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Waffen2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Waffen2;
	on_unequip				=	UnEquip_Schutzring_Waffen2;

//	description				= "Ring der Erzhaut";
	description				= "Prsten kůže z magické rudy";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Waffen2()
	{
	self.protection [PROT_EDGE] 		+=  10;
	self.protection [PROT_BLUNT]		+=  10;
	};

	FUNC VOID UnEquip_Schutzring_Waffen2()
	{
	self.protection [PROT_EDGE] 		-=  10;
	self.protection [PROT_BLUNT]		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie1(C_ITEM)
{
	name 					=	"Ring ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1;
	on_unequip				=	UnEquip_Schutzring_Magie1;

//	description					= "Ring der Geisteskraft";
	description					= "Prsten duchovní síly";
	//TEXT[0]					= "";
	//TEXT[1]					= "";
	////COUNT[1]				= ;
	TEXT[2]						= NAME_Prot_Magic;
	COUNT[2]					= 1;
	//TEXT[3] 					= "";
	////COUNT[3]				= ;
	//TEXT[4]					= "";
	////COUNT[4]				= ;
	TEXT[5]						= NAME_Value;
	COUNT[5]					= value;
};

	FUNC VOID Equip_Schutzring_Magie1()
	{
	self.protection [PROT_MAGIC] 		+=  1;
	};


	FUNC VOID UnEquip_Schutzring_Magie1()
	{
	self.protection [PROT_MAGIC] 		-=  1;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2;
	on_unequip				=	UnEquip_Schutzring_Magie2;

//	description				= "Ring der Verteidigung";
	description				= "Prsten obrany";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 3;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Magie2()
	{
	self.protection [PROT_EDGE] 		+=  3;
	self.protection [PROT_BLUNT]		+=  3;
	};

	FUNC VOID UnEquip_Schutzring_Magie2()
	{
	self.protection [PROT_EDGE] 		-=  3;
	self.protection [PROT_BLUNT]		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie1_Fire1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1_Fire1;
	on_unequip				=	UnEquip_Schutzring_Magie1_Fire1;

//	description				= "Ring der Läuterung";
	description				= "Prsten očisty";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= 1;
	TEXT[3] 				= NAME_Prot_Fire;
	COUNT[3]				= 3;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Magie1_Fire1()
	{
	self.protection [PROT_MAGIC] 		+=  1;
	self.protection [PROT_FIRE]		+=  3;
	};

	FUNC VOID UnEquip_Schutzring_Magie1_Fire1()
	{
	self.protection [PROT_MAGIC] 		-=  1;
	self.protection [PROT_FIRE]		-=  3;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Magie2_Fire2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2_Fire2;
	on_unequip				=	UnEquip_Schutzring_Magie2_Fire2;

//	description				= "Ring der Unbezwingbarkeit";
	description				= "Prsten nepřemožitelnosti";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Magic;
	COUNT[2]				= 3;
	TEXT[3] 				= NAME_Prot_Fire;
	COUNT[3]				= 5;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Magie2_Fire2()
	{
	self.protection [PROT_MAGIC] 	+=  3;
	self.protection [PROT_FIRE]		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Magie2_Fire2()
	{
	self.protection [PROT_MAGIC] 	-=  3;
	self.protection [PROT_FIRE]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Geschosse1_Waffen1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Geschosse1_Waffen1;
	on_unequip				= 	UnEquip_Schutzring_Geschosse1_Waffen1;

//	description				= "Ring der Standhaftigkeit";
	description				= "Prsten vytrvalosti";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 5;
	TEXT[3] 				= NAME_Prot_Point;
	COUNT[3]				= 5;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Geschosse1_Waffen1()
	{
	self.protection [PROT_EDGE] 		+=  5;
	self.protection [PROT_BLUNT]		+=  5;
	self.protection [PROT_POINT]		+=  5;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse1_Waffen1()
	{
	self.protection [PROT_EDGE] 		-=  5;
	self.protection [PROT_BLUNT]		-=  5;
	self.protection [PROT_POINT]		-=  5;
	};
	
/******************************************************************************************/
	INSTANCE ItRi_Point_02_Waffen2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_ItRi_Point_02_Waffen2;
	on_unequip				= 	UnEquip_ItRi_Point_02_Waffen2;

//	description				= "Ring der Unantastbarkeit";
	description				= "Prsten nezranitelnosti";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Prot_Edge;
	COUNT[2]				= 10;
	TEXT[3] 				= NAME_Prot_Point;
	COUNT[3]				= 10;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_ItRi_Point_02_Waffen2()
	{
	self.protection [PROT_EDGE] 		+=  10;
	self.protection [PROT_BLUNT]		+=  10;
	self.protection [PROT_POINT]		+=  10;
	};

	FUNC VOID UnEquip_ItRi_Point_02_Waffen2()
	{
	self.protection [PROT_EDGE] 		-=  10;
	self.protection [PROT_BLUNT]		-=  10;
	self.protection [PROT_POINT]		-=  10;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Total1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total1;
	on_unequip				= 	UnEquip_Schutzring_Total1;

//	description				= "Ring der Unbezwingbarkeit";
	description				= "Prsten menší nepřemožitelnosti";
	//TEXT[0]				= "";
	TEXT[1]					= NAME_Prot_Magic;
	COUNT[1]				= 1;
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= 3;
	TEXT[3] 				= NAME_Prot_Point;
	COUNT[3]				= 5;
	TEXT[4]					= NAME_Prot_Edge;
	COUNT[4]				= 5;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 	+=   5;
	self.protection [PROT_BLUNT]	+=   5;
	self.protection [PROT_POINT]	+=   5;
 	self.protection [PROT_FIRE]     +=   3;
	self.protection [PROT_MAGIC]    +=   1;
	};

	FUNC VOID UnEquip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 		-=   5;
	self.protection [PROT_BLUNT]		-=   5;
	self.protection [PROT_POINT]		-=   5;
 	self.protection [PROT_FIRE]      -=   3;
	self.protection [PROT_MAGIC]     -=   1;
	};
	
/******************************************************************************************/
	INSTANCE Schutzring_Total2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	1000;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total2;
	on_unequip				= 	UnEquip_Schutzring_Total2;

//	description				= "Ring der Unbesiegbarkeit";
	description				= "Prsten větší nepřemožitelnosti";
	//TEXT[0]				= "";
	TEXT[1]					= NAME_Prot_Magic;
	COUNT[1]				= 3;
	TEXT[2]					= NAME_Prot_Fire;
	COUNT[2]				= 5;
	TEXT[3] 				= NAME_Prot_Point;
	COUNT[3]				= 10;
	TEXT[4]					= NAME_Prot_Edge;
	COUNT[4]				= 10;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	+=   10;
	self.protection [PROT_BLUNT]	+=   10;
	self.protection [PROT_POINT]	+=   10;
 	self.protection [PROT_FIRE]     +=   5;
	self.protection [PROT_MAGIC]    +=   3;
	};

	FUNC VOID UnEquip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	-=   10;
	self.protection [PROT_BLUNT]	-=   10;
	self.protection [PROT_POINT]	-=   10;
 	self.protection [PROT_FIRE]     -=   5;
	self.protection [PROT_MAGIC]    -=   3;
	};
	
/******************************************************************************************/
		INSTANCE Ring_des_Geschicks(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks;
	on_unequip				=	UnEquip_Ring_des_Geschicks;

//	description				= "Ring der Gewandtheit";
	description				= "Prsten menší obratnosti";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Dex;
	COUNT[2]				= 5;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_des_Geschicks()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5 );
	};


	FUNC VOID UnEquip_Ring_des_Geschicks()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-5 );
	};
	
/******************************************************************************************/
	INSTANCE Ring_des_Geschicks2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks2;
	on_unequip				=	UnEquip_Ring_des_Geschicks2;

//	description				= "Ring der Geschicklichkeit";
	description				= "Prsten větší obratnosti";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Dex;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_des_Geschicks2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,10 );
	};


	FUNC VOID UnEquip_Ring_des_Geschicks2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-10 );
	};

/******************************************************************************************/
		INSTANCE Ring_des_Lebens(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	180;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens;
	on_unequip				=	UnEquip_Ring_des_Lebens;

	description				= "Prsten zdraví";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_des_Lebens()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 10; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 10;
	};

	FUNC VOID UnEquip_Ring_des_Lebens()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 10;
		if self.attribute [ATR_HITPOINTS]> 11
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 10;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Ring_des_Lebens2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	360;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens2;
	on_unequip				=	UnEquip_Ring_des_Lebens2;
//	description				= "Ring des Lebendigkeit";
	description				= "Prsten života";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_HP;
	COUNT[2]				= 20;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
	};

	FUNC VOID UnEquip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 20; 
		
		if self.attribute [ATR_HITPOINTS]> 21
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 20;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Staerkering(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItMi_Ring_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Staerkering;
	on_unequip				=	UnEquip_Staerkering;

//	description				= "Ring der Kraft";
	description				= "Prsten síly";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 5;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Staerkering()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,5 );
	};

	FUNC VOID UnEquip_Staerkering()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-5 );
	};
	
/******************************************************************************************/
	INSTANCE Staerkering2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;

	on_equip				=	Equip_Staerkering2;
	on_unequip				=	UnEquip_Staerkering2;

//	description				= "Ring der Stärke";
	description				= "Prsten větší síly";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Staerkering2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,10 );
	};

	FUNC VOID UnEquip_Staerkering2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, -10 );
	};

/******************************************************************************************/
	INSTANCE Ring_der_Magie(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItMi_Ring_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Magie;
	on_unequip				=	UnEquip_Ring_der_Magie;

//	description				= "Ring der Magie";
	description				= "Prsten magie";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= 10;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	};


	FUNC VOID UnEquip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	};
	
/******************************************************************************************/
		INSTANCE Ring_der_Erleuchtung(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Erleuchtung;
	on_unequip				=	UnEquip_Ring_der_Erleuchtung;

//	description				= "Ring der Erleuchtung";
	description				= "Prsten osvícení";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Mana;
	COUNT[2]				= 15;
	TEXT[3] 				= NAME_Bonus_HP;
	COUNT[3]				= 15;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Ring_der_Erleuchtung()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 15;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 15;
		
	};


	FUNC VOID UnEquip_Ring_der_Erleuchtung()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 15;
		
		if (self.attribute [ATR_HITPOINTS] > 16)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 15;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
	INSTANCE Machtring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	300;

	visual 					=	"ItMi_Ring_03.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Machtring;
	on_unequip				=	UnEquip_Machtring;

//	description				= "Ring der Macht";
	description				= "Prsten moci";
	//TEXT[0]				= "";
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]					= NAME_Bonus_Str;
	COUNT[2]				= 4;
	TEXT[3] 				= NAME_Bonus_Dex;
	COUNT[3]				= 4;
	//TEXT[4]				= "";
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID Equip_Machtring()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH, 4);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, 4);
	};

	FUNC VOID UnEquip_Machtring()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,- 4);
		Npc_ChangeAttribute(self,ATR_DEXTERITY, -4);
	};
		