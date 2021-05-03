
func string b_buildmelterstring(var int amount,var string ore,var string product)
{
	var string msg;
	msg = ConcatStrings(product," (");
	msg = ConcatStrings(msg,IntToString(amount));
	msg = ConcatStrings(msg," ");
	msg = ConcatStrings(msg,ore);
	msg = ConcatStrings(msg,")");
	return msg;
};

func string b_buildanvilstring(var string raw,var string ore,var string product)
{
	var string msg;
	msg = ConcatStrings(product,ore);
	msg = ConcatStrings(msg,NAME_SMITH_ANVIL);
	return msg;
};

func string b_buildcoolstring(var string raw,var string ore,var string product)
{
	var string msg;
	msg = ConcatStrings(product,ore);
	msg = ConcatStrings(msg,NAME_SMITH_COOL);
	return msg;
};

func string b_buildsharpstring(var string raw,var string ore,var string product)
{
	var string msg;
	msg = ConcatStrings(product,ore);
	msg = ConcatStrings(msg,NAME_SMITH_SHARP);
	return msg;
};

