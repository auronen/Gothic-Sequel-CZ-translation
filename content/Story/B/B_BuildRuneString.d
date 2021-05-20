// Baut den Menüstring für das schmelzen von Erz zu einer leeren Rune
func string B_BuildRunemelterString (var string rune, var int oreAmount, var string oreName)
{
	var string msg;

//	msg	= ConcatStrings(rune,	" giessen (");
	msg	= ConcatStrings(rune,	" odlít (");
	msg = ConcatStrings(msg,	IntToString(oreAmount));
	msg = ConcatStrings(msg,	" ");
	msg = ConcatStrings(msg,	oreName);
	msg = ConcatStrings(msg,	")");

	return msg;
};


// Baut den Menüstring für das Binden einer Scroll in einen leeren Runenstein
func string B_BuildRunemakerString (var string spell, var string rune, var int neededMana)
{
	var string msg;

//	msg	= ConcatStrings(spell,	"-");
//	msg = ConcatStrings(msg,	rune);
//	msg = ConcatStrings(msg,	" erschaffen (");
//	msg = ConcatStrings(msg,	IntToString(neededMana));
//	msg = ConcatStrings(msg,	" dauerhafte Mana)");
	msg = ConcatStrings("Vytvořit runu - ", spell);
	msg = ConcatStrings(msg,	" (");
	msg = ConcatStrings(msg,	IntToString(neededMana));
	msg = ConcatStrings(msg,	" maximální magické energie)");

	return msg;
};


