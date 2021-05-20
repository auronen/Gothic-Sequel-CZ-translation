func void B_BuyAttributePoints (var C_NPC typ, var int ATR, var int AtrPlus)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;
	if 		(ATR == ATR_STRENGTH)	{	Typ_Atr = typ.attribute[ATR_STRENGTH];	}
	else if (ATR == ATR_DEXTERITY)	{	Typ_Atr = typ.attribute[ATR_DEXTERITY];	}
	else if (ATR == ATR_MANA_MAX)	{	Typ_Atr = typ.attribute[ATR_MANA_MAX];	};

	// --------- Steigern oder verbieten
	var string AtrPlusSTRING; AtrPlusSTRING	= IntToString(AtrPlus);
	var string PrintSTRING;

	if (!(typ.lp < AtrPlus))
	{
		if (Typ_Atr + AtrPlus <= 100)
		{
			typ.lp = typ.lp - AtrPlus;

			if (ATR == ATR_STRENGTH)
			{
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
//				PrintString = ConcatStrings("Stärke + ", AtrPlusSTRING);
				PrintString = ConcatStrings("Síla + ", AtrPlusSTRING);
				PrintScreen	(PrintSTRING, -1,-1,FONT_OLD_BIG,1);
			}
			else if (ATR == ATR_DEXTERITY)
			{
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
//				PrintString = ConcatStrings("Geschicklichkeit + ", AtrPlusSTRING);
				PrintString = ConcatStrings("Obratnost + ", AtrPlusSTRING);
				PrintScreen	(PrintSTRING, -1,-1,FONT_OLD_BIG,1);
			}
			else if (ATR == ATR_MANA_MAX)
			{
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
				PrintString = ConcatStrings("Mana + ", AtrPlusSTRING);
				PrintScreen	(PrintString, -1,-1,FONT_OLD_BIG,1);
			};
		}
		else
		{
//			PrintScreen	("Keine Steigerung über Maximum 100!", -1,-1,FONT_OLD_BIG,1);
			PrintScreen	("Nelze zvýšit přes maximální hodnotu 100!", -1,-1,FONT_OLD_BIG,1);
			B_Say (self, other, "$NOLEARNOVERMAX");
		};
	}
	else
	{
//		PrintScreen	("Zu wenig Lernpunkte!", -1,-1,FONT_OLD_BIG,1);
		PrintScreen	("Málo zkušenostních bodů!", -1,-1,FONT_OLD_BIG,1);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};
};
