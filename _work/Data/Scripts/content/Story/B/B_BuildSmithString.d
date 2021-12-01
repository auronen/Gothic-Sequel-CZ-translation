// Baut den Menüstring für das Einschmelzen des Erzes im Schmelzofen zusammen
func string B_BuildMelterString (var int amount, var string ore, var string product)
{
	var string msg;
	
	msg	= ConcatStrings(product,	" (");
	msg = ConcatStrings(msg,		IntToString(amount));
	msg = ConcatStrings(msg,		" ");
	msg = ConcatStrings(msg,		ore);
	msg = ConcatStrings(msg,		")");

	return msg;
};


// Baut den Menüstring für das Schmieden am Amboss zusammen
func string B_BuildAnvilString (var string raw, var string ore, var string product)
{
	var string msg;
	
	msg	= ConcatStrings(product,	ore);
	msg = ConcatStrings(msg,	NAME_Smith_Anvil);
	//msg = ConcatStrings(msg,	" (1 ");
	//msg = ConcatStrings(msg,	raw);
	//msg = ConcatStrings(msg,	")");

	return msg;
};


// Baut den Menüstring für das abkühlen der Waffe im Wassereimer zusammen
func string B_BuildCoolString (var string raw, var string ore, var string product)
{
	var string msg;
	
	msg	= ConcatStrings(product,	ore);
	msg = ConcatStrings(msg,	NAME_Smith_Cool);
	//msg = ConcatStrings(msg,	" (1 ");
	//msg = ConcatStrings(msg,	raw);
	//msg = ConcatStrings(msg,	")");

	return msg;
};

// Baut den Menüstring für das Schärfen der Klinge am Schleifstein zusammen
func string B_BuildSharpString (var string raw, var string ore, var string product)
{
	var string msg;
	
	msg	= ConcatStrings(product,	ore);
	msg = ConcatStrings(msg,	NAME_Smith_Sharp);
	//msg = ConcatStrings(msg,	" (1 ");
	//msg = ConcatStrings(msg,	raw);
	//msg = ConcatStrings(msg,	")");

	return msg;
};


