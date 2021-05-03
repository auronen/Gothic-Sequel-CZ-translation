
func void b_snaf_militaexchange()
{
	B_ExchangeRoutine(mil_107_militia,"snaf");
	B_ExchangeRoutine(mil_131_militia,"snaf");
	B_ExchangeRoutine(mil_133_militia,"snaf");
	B_ExchangeRoutine(mil_134_militia,"snaf");
	B_ExchangeRoutine(mil_135_militia,"snaf");
	B_ExchangeRoutine(mil_136_militia,"snaf");
	B_ExchangeRoutine(mil_139_militia,"snaf");
};

func void b_snaf_newcustomers()
{
	b_snaf_militaexchange();
	B_LogEntry(CH1_LEARNCOOKING,"Ich glaube, jetzt habe ich wirklich genug Unruhe unter Halvor's Kundschaft gestiftet. Die ersten Milizsoldaten gehen schon.");
};

func void b_snaf_newrecipe()
{
	b_snaf_militaexchange();
	B_LogEntry(CH1_LEARNCOOKING,"Mit dem neuen Rezept werden bei Snaf schon bald wieder die Leute Schlange stehen.");
};

func void b_snaf_salted()
{
	b_snaf_militaexchange();
	B_LogEntry(CH1_LEARNCOOKING,"Ich fürchte Halvor's Eintopf wird heute nicht besonders gut schmecken... . Die Leute werden in Scharen zu Snaf überlaufen.");
};

