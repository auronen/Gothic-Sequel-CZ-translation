
func string b_buildprizestring(var int prize)
{
	var string msg;
	msg = ConcatStrings(IntToString(prize),NAME_PRIZEPOSTFIX);
	return msg;
};

