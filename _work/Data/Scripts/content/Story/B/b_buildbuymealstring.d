// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- amount: 10
//	- text: "Meatbug-Suppe"
//	- price: 10
//	- Rückgabestring: "10 Portionen Meatbugsuppe (100 Silber)"
func string B_BuildBuyMealString (var int amount, var string text, var int price)
{
	var string msg;

	if	(amount == 1)
	{
		msg = ConcatStrings	(IntToString(amount),	NAME_Ration);
	}
	else
	{
		msg = ConcatStrings	(IntToString(amount),	NAME_Rations);
	};

	msg	= ConcatStrings		(msg,					text);
	msg	= ConcatStrings		(msg,					NAME_BuyPrefix);
	msg = ConcatStrings		(msg,					IntToString(price*amount));
	msg = ConcatStrings		(msg,					NAME_BuyPostfix);

	return msg;
};
