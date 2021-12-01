// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Spitzhacke"
//	- price: 1500
//	- Rückgabestring: "Spitzhacke (20 Silber)"
func string B_BuildBuyString (var string text, var int price)
{
	var string msg;
	
	msg	= ConcatStrings(text,	NAME_BuyPrefix);
	msg = ConcatStrings(msg,	IntToString(price));
	msg = ConcatStrings(msg,	NAME_BuyPostfix);

	return msg;
};
