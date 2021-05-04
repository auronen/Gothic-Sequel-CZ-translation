///////////////////////////////////////////////////////////////////////
//	B_Snaf_NewCustomers
//	-------------------
//	Schickt einige Milizsoldaten der Optik halber zu Snaf's Küche und
//	stellt sie dort in einer Warteschlange auf!
///////////////////////////////////////////////////////////////////////
func void B_Snaf_MilitaExchange()
{
	B_ExchangeRoutine(MIL_107_Militia, "snaf");	// 18 - 24 Uhr
	B_ExchangeRoutine(MIL_131_Militia, "snaf");	// 18 - 24 Uhr
	B_ExchangeRoutine(MIL_133_Militia, "snaf"); // 13 - 16 Uhr
	B_ExchangeRoutine(MIL_134_Militia, "snaf"); // 13 - 16 Uhr
	B_ExchangeRoutine(MIL_135_Militia, "snaf"); // 18 - 24 Uhr
	B_ExchangeRoutine(MIL_136_Militia, "snaf"); // 18 - 24 Uhr
	B_ExchangeRoutine(MIL_139_Militia, "snaf"); // 18 - 24 Uhr
};

func void B_Snaf_NewCustomers()
{
	B_Snaf_MilitaExchange();

	B_LogEntry	(CH1_LearnCooking, "Ich glaube, jetzt habe ich wirklich genug Unruhe unter Halvor's Kundschaft gestiftet. Die ersten Milizsoldaten gehen schon.");
};

func void B_Snaf_NewRecipe()
{
	B_Snaf_MilitaExchange();

	B_LogEntry	(CH1_LearnCooking, "Mit dem neuen Rezept werden bei Snaf schon bald wieder die Leute Schlange stehen.");
};

func void B_Snaf_Salted()
{
	B_Snaf_MilitaExchange();

	B_LogEntry	(CH1_LearnCooking, "Ich fürchte Halvor's Eintopf wird heute nicht besonders gut schmecken... . Die Leute werden in Scharen zu Snaf überlaufen.");
};

