//Amulette +Ringe//

INSTANCE ItMi_Amulet_Psi(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	250;

	visual 			=	"ItMi_Amulet_Psi_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

//	description		= "Zeichen der Bruderschaft";
	description		= "Znak Bratrstva";
//	TEXT[0]			= "Dieses alte Amulett war ein Erkennungszeichen";
	TEXT[0]			= "Tento starý amulet byl znakem Bratrstva";
//	TEXT[1]			= "aus den Tagen der Barriere.";
	TEXT[1]			= "z dob, kdy údolí uzavírala Bariéra.";

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

};
/******************************************************************************************/
INSTANCE  Schutzamulett_Feuer(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Feuer;

//	description		= "Amulett der Flammen";
	description		= "Amulet plamenů";

	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Feuer()
	{
	 	self.protection [PROT_FIRE] += 10;
	};


	FUNC VOID UnEquip_Schutzamulett_Feuer()
	{
		self.protection [PROT_FIRE] -= 10;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Waffen(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen;
	on_unequip		=	UnEquip_Schutzamulett_Waffen;

//	description		= "Harnischamulett";
	description		= "Amulet zbroje";

	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 15;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] += 15;
		self.protection [PROT_BLUNT] += 15;
	};


	FUNC VOID UnEquip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] -= 15;
		self.protection [PROT_BLUNT] -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Geschosse;

//	description		= "Amulett der Eichenhaut";
	description		= "Amulet dubové kůže";

	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 15;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] += 15;
	};


	FUNC VOID UnEquip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie;
	on_unequip		=	UnEquip_Schutzamulett_Magie;

//	description		= "Amulett der Geisteskraft";
	description		= "Amulet duchovní síly";

	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 8;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] += 8;
	};

	FUNC VOID UnEquip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] -= 8;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie_Feuer(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=    1000;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Magie_Feuer;

//	description		= "Amulett der Läuterung";
	description		= "Amulet očisty";

	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;
	TEXT[3] 		= NAME_Prot_Magic;
	COUNT[3]		= 8;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie_Feuer()
	{
		self.protection [PROT_MAGIC] += 8;
		self.protection [PROT_FIRE]  += 10;
	};


	FUNC VOID UnEquip_Schutzamulett_Magie_Feuer()
	{
	self.protection [PROT_MAGIC] -= 8;
	self.protection [PROT_FIRE]  -= 10;

	};

/******************************************************************************************/
		INSTANCE  Schutzamulett_Waffen_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Waffen_Geschosse;

//	description		= "Amulett der Steinhaut";
	description		= "Amulet kamenné kůže";

	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 15;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 15;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   += 15;
		self.protection [PROT_BLUNT]  += 15;
		self.protection [PROT_POINT]  += 15;
	};

	FUNC VOID UnEquip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   -= 15;
		self.protection [PROT_BLUNT]  -= 15;
		self.protection [PROT_POINT]  -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Total(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1600;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Total;
	on_unequip		=	UnEquip_Schutzamulett_Total;

//	description		= "Amulett der Erzhaut";
	description		= "Amulet kůže z magické rudy";

	TEXT[1]			= NAME_Prot_Fire;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 8;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 15;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 15;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   += 15;
		self.protection [PROT_BLUNT]  += 15;
		self.protection [PROT_POINT]  += 15;
		self.protection [PROT_FIRE]   += 10;
		self.protection [PROT_MAGIC]  +=  8;

	};

	FUNC VOID UnEquip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   -= 15;
		self.protection [PROT_BLUNT]  -= 15;
		self.protection [PROT_POINT]  -= 15;
		self.protection [PROT_FIRE]   -= 10;
		self.protection [PROT_MAGIC]  -=  8;
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	320;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett;
	on_unequip		=	UnEquip_Gewandtheitsamulett;

//	description		= "Amulett der Wendigkeit";
	description		= "Amulet čilosti";

	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 10;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
	};


	FUNC VOID UnEquip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	480;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett2;
	on_unequip		=	UnEquip_Gewandtheitsamulett2;

//	description		= "Amulett der Geschicklichkeit";
	description		= "Amulet obratnosti";

	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 20;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,20);
	};

	FUNC VOID UnEquip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-20);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	320;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett;
	on_unequip		=	UnEquip_Staerkeamulett;

//	description		= "Amulett der Kraft";
	description		= "Amulet moci";


	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 10;


	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,10);
	};

	FUNC VOID UnEquip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	480;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett2;
	on_unequip		=	UnEquip_Staerkeamulett2;

//	description		= "Amulett der Stärke";
	description		= "Amulet síly";


	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 20;


	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,20);
	};


	FUNC VOID UnEquip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
	};

/******************************************************************************************/
	INSTANCE  Lebensamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	720;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Lebensamulett;
	on_unequip		=	UnEquip_Lebensamulett;

//	description		= "Amulett der Lebenskraft";
	description		= "Amulet života";


	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 30;


	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Lebensamulett()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;

	};


	FUNC VOID UnEquip_Lebensamulett()
	{
		self.attribute [ATR_HITPOINTS_MAX] = self.attribute [ATR_HITPOINTS_MAX] -30;
		if (self.attribute[ATR_HITPOINTS] > 31)
		{
		self.attribute [ATR_HITPOINTS] = self.attribute [ATR_HITPOINTS] -30;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Magie(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	400;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Magie;
	on_unequip		=	UnEquip_Amulett_der_Magie;

//	description		= "Amulett der Magie";
	description		= "Amulet magie";


	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 10;


	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	};

	FUNC VOID UnEquip_Amulett_der_Magie ()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Macht(C_Item)
{
//	name 			=	"Amulett der Macht";
	name 			=	"Amulet moci";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Macht;
	on_unequip		=	UnEquip_Amulett_der_Macht;

//	description		= "Amulett der Macht";
	description		= "Amulet moci";


	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 7;
	TEXT[3] 		= NAME_Bonus_Str;
	COUNT[3]		= 7;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Macht()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,7 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,7 );
	};


	FUNC VOID UnEquip_Amulett_der_Macht ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-7 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,-7 );
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Erleuchtung(C_Item)
{
//	name 			=	"Amulett der Erleuchtung";
	name 			=	"Amulet osvícení";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Erleuchtung;
	on_unequip		=	UnEquip_Amulett_der_Erleuchtung;

//	description		= "Amulett der Erleuchtung";
	description		= "Amulet osvícení";


	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 25;
	TEXT[3] 		= NAME_Bonus_Mana;
	COUNT[3]		= 25;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Erleuchtung()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;

	};


	FUNC VOID UnEquip_Amulett_der_Erleuchtung ()
	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;

		if (self.attribute[ATR_HITPOINTS] > 26)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/

// FIXME: was soll das machen? Dämon beschwören???
INSTANCE  Beschwörungsamulett(C_Item)
{
//	name 			=	"Amulett der Erleuchtung";
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	300;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Beschwörungsamulett;
	on_unequip		=	UnEquip_Beschwörungsamulett;

//	description		= "Dämonenbeschwörung";
	description		= "Amulet vyvolání démona";
//	TEXT[0]			= "Schwarz wie die Seele";
	TEXT[0]			= "Černý jako duše,";
//	TEXT[1]			= "Schwarz wie die Nacht";
	TEXT[1]			= "černý jako noc";
//	TEXT[2]			= "Schwarz wie das Böse";
	TEXT[2]			= "černý jako zloba,";
//	TEXT[3] 		= "Schwarz verheisst Macht";
	TEXT[3] 		= "černá slibuje moc.";

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Beschwörungsamulett()
	{
	
	
	};
	
	
	FUNC VOID UnEquip_Beschwörungsamulett ()
	{
	
	
	};


	