
instance HELMET(C_Item)
{
	name = "Test Helm";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_AMULET;
	value = 100;
	wear = WEAR_HEAD;
	visual = "ItHe_EbrHelmet.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_testhelmet;
	on_unequip = unequip_testhelmet;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_testhelmet()
{
	self.protection[PROT_EDGE] += 1500;
	self.protection[PROT_BLUNT] += 1500;
	self.protection[PROT_POINT] += 1500;
	self.protection[PROT_FIRE] += 1500;
	self.protection[PROT_MAGIC] += 1500;
};

func void unequip_testhelmet()
{
	self.protection[PROT_EDGE] -= 1500;
	self.protection[PROT_BLUNT] -= 1500;
	self.protection[PROT_POINT] -= 1500;
	self.protection[PROT_FIRE] -= 1500;
	self.protection[PROT_MAGIC] -= 1500;
};

