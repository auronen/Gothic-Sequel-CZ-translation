
func string B_BuildBuyArmorString(var C_Item armor)
{
	var string msg;
	msg = armor.name;
	msg = ConcatStrings(msg,NAME_BuyArmorPrefix);
	msg = ConcatStrings(msg,IntToString(armor.value));
	msg = ConcatStrings(msg,NAME_BuyArmorPostfix);
	return msg;
};

