
func string b_buildbuymealstring(var int amount,var string text,var int price)
{
	var string msg;
	if(amount == 1)
	{
		msg = ConcatStrings(IntToString(amount),NAME_RATION);
	}
	else
	{
		msg = ConcatStrings(IntToString(amount),NAME_RATIONS);
	};
	msg = ConcatStrings(msg,text);
	msg = ConcatStrings(msg,NAME_BUYPREFIX);
	msg = ConcatStrings(msg,IntToString(price * amount));
	msg = ConcatStrings(msg,NAME_BUYPOSTFIX);
	return msg;
};

