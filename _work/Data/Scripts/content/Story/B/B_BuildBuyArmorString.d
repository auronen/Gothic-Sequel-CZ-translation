// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Kettenhemd"
//	- price: 1500
//	- 
//	- Rückgabestring: "Kettenhemd (1500 Silber)"
func string B_BuildBuyArmorString (var C_ITEM armor)
{
	
	var string msg;
	msg = armor.name;
	msg = ConcatStrings(msg,	NAME_BuyArmorPrefix);
	msg	= ConcatStrings(msg,	IntToString (armor.value));
	msg = ConcatStrings(msg,	NAME_BuyArmorPostfix);
	/*
	msg = ConcatStrings(msg,	NAME_BuyArmorEdge);
	msg = ConcatStrings(msg,	IntToString(armor.protection[PROT_EDGE]));
	msg = ConcatStrings(msg,	NAME_BuyArmorPoint);
	msg = ConcatStrings(msg,	IntToString(armor.protection[PROT_POINT]));
	msg = ConcatStrings(msg,	NAME_BuyArmorFire);
	msg = ConcatStrings(msg,	IntToString(armor.protection[PROT_FIRE]));
	msg = ConcatStrings(msg,	NAME_BuyArmorMagic);
	msg = ConcatStrings(msg,	IntToString(armor.protection[PROT_MAGIC]));
	*/
	return msg;
};
