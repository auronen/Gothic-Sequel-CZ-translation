
func string b_buildrunemelterstring(var string rune,var int oreamount,var string orename)
{
	var string msg;
	msg = ConcatStrings(rune," giessen (");
	msg = ConcatStrings(msg,IntToString(oreamount));
	msg = ConcatStrings(msg," ");
	msg = ConcatStrings(msg,orename);
	msg = ConcatStrings(msg,")");
	return msg;
};

func string b_buildrunemakerstring(var string spell,var string rune,var int neededmana)
{
	var string msg;
	msg = ConcatStrings(spell,"-");
	msg = ConcatStrings(msg,rune);
	msg = ConcatStrings(msg," erschaffen (");
	msg = ConcatStrings(msg,IntToString(neededmana));
	msg = ConcatStrings(msg," dauerhafte Mana)");
	return msg;
};

