
func string b_buildbuystring(var string text,var int price)
{
	var string msg;
	msg = ConcatStrings(text,NAME_BUYPREFIX);
	msg = ConcatStrings(msg,IntToString(price));
	msg = ConcatStrings(msg,NAME_BUYPOSTFIX);
	return msg;
};

