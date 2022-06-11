//////////////////////////////////////////////////////////////////////////
//	B_TransferItems
//	===============
//	Überträgt das 'item' von 'other' zu 'self'. In 'amount' muß die
//	Anzahl der zu übertragenden Items übergeben werden.
//////////////////////////////////////////////////////////////////////////
func void B_TransferItems (var int amount)
{
	PrintDebugNpc		(PD_ZS_CHECK,	"...B_TransferItem");

	var int transferItem;
	transferItem = Hlp_GetInstanceID(item); 

	B_PunderInvItems		(other, self, transferItem, amount);

	if (item.munition == ItAm_Arrow)
	{
		CreateInvItems	(self,	ItAm_Arrow,	20);
	};

	if (item.munition == ItAm_Bolt)
	{
		CreateInvItems	(self,	ItAm_Bolt,	20);
	};
};

//////////////////////////////////////////////////////////////////////////
//	B_CheckItem
//	===========
//	Überprüft den Inventoryslot 'slot' in der 'category' und ruft
//	bei Bedarf B_TransferItem() auf.
//	-> benötigt 'self' und 'other'
//	-> initialisiert 'item' selbst
//	-> return: 	- FALSE, wenn kein item genommen wurde
//				- TRUE, wenn item genommen wurde
//////////////////////////////////////////////////////////////////////////
func int B_CheckItem (var int category, var int slot)
{
	PrintDebugNpc		(PD_ZS_CHECK,	"B_CheckItem");

	var string printText;
	printText = IntToString		(slot);

	if 		(category == INV_WEAPON )	{	printText = ConcatStrings("...found INV_WEAPON_",		printText);	}
	else if	(category == INV_ARMOR	)	{	printText = ConcatStrings("...found INV_ARMOR_",		printText);	}	
	else if (category == INV_RUNE	)	{	printText = ConcatStrings("...found INV_RUNE_",			printText);	}
	//else if (category == INV_POTIONS)	{	printText = ConcatStrings("...found INV_POTIONS_",		printText);	}
	else if (category == INV_FOOD	)	{	printText = ConcatStrings("...found INV_FOOD_",			printText);	}
	else if (category == INV_DOC	)	{	printText = ConcatStrings("...found INV_DOC_",			printText);	}    
	else if (category == INV_MISC	)	{	printText = ConcatStrings("...found INV_MISC_",			printText);	}
	else								{	printText = ConcatStrings("...found unknown category #",printText);	};
	
	var int count;  
	count = Npc_GetInvItemBySlot(other, category,slot);  			// initialisiert 'item' und gibt Anzahl zurück
	PrintDebugNpc(PD_ZS_DETAIL, IntToString(count));
	
	if (count > 0)
	{
		PrintDebugNpc(PD_ZS_CHECK, printText);
		// JP: Wenn ein Nsc mich beim klauen erwischt hat und ich genug Silber habe wird, dieses transferiert 
		// und die Attitüde zurück auf neutral gesetzt
		if  self.aivar[AIV_THEFTWITTNESS]
		&& (Npc_GetPermAttitude	(self, other) == ATT_ANGRY)
		&& B_HasPlayerSilverToSatisfy ()
		&& Hlp_IsItem	(item, ItMi_Silver)
		{
			
			PrintDebugNpc		(PD_ZS_CHECK,	"B_CheckItem ... genug Silber nach Diebstahl");
			B_ExchangeMemoryAttitude ();
			return TRUE;
		};
		if  self.aivar[AIV_BEENATTACKED]
		&& (Npc_GetPermAttitude	(self, other) == ATT_ANGRY)
		&& B_HasPlayerSilverToSatisfy ()
		&& Hlp_IsItem	(item, ItMi_Silver)
		{
			PrintDebugNpc		(PD_ZS_CHECK,	"B_CheckItem ... genug Silber nach Diebstahl");
			B_ExchangeMemoryAttitude ();
			return TRUE;
		};
		// CS NEU: Nimmt personalisierte Waffen
		if (Npc_OwnedByNpc(item,self))
		{
			B_TransferItems(1);
			return TRUE;
		};
	};
	

	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_Plunder
//	=========
//	Durchsucht alle Inventoryslots, überprüft, welche Gegenstände er
//	haben will, und nimmt sie sich. Durchsucht werden:
//
//	alt:
//	----
//	-  6 Slots Waffen
//	-  2 Slots Rüstungen
//	-  ? Slots Runen & Scrolls
//	-  ? Slots Artefakte
//	- 15 Slots Nahrung
//	- 15 Slots Verschiedenes
//
//	neu:
//	----
//	- Dem Opfer wird die Hälfte des vorhandenen Erzes abgenommen.
//
//	-> Gibt Anzahl der geplünderten Gegenstände zurück.
//////////////////////////////////////////////////////////////////////////
func int B_Plunder	()
{
	PrintDebugNpc( PD_ZS_CHECK, "B_Plunder" );

	var int	amountPlundered;
	amountPlundered = 0;
	
	//-------- Durchsuchen der WEAPONS ---------
	// Zurückgenommene Waffen werden nicht mitangegeben bei amountPlundered, da sich die SVMs dabei nur auf Erz beziehen.
	// Z.Zt. ist INV_MAX_WEAPONS noch auf 6
	
	B_CheckItem(INV_WEAPON,	0	);
	B_CheckItem(INV_WEAPON,	1	);
	B_CheckItem(INV_WEAPON,	2	);
	B_CheckItem(INV_WEAPON,	3	);
	B_CheckItem(INV_WEAPON,	4	);
	B_CheckItem(INV_WEAPON,	5	);
	B_CheckItem(INV_WEAPON,	6	);

	//-------- Durchsuchen von MISC ---------
	if(	B_CheckItem(INV_MISC,	0	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	1	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	2	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	3	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	4	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	5	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	6	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	7	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	8	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	9	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	10	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	11	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	12	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	13	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	14	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	15	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	16	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	17	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	18	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	19	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	20	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	21	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	22	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	23	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	24	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	25	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	26	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	27	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	28	) )	{ amountPlundered = amountPlundered + 1; };
	if(	B_CheckItem(INV_MISC,	29	) )	{ amountPlundered = amountPlundered + 1; };
	
	//-------- Anzahl geplünderter Items ausgeben ---------
	PrintDebugInt(PD_ZS_CHECK, "...Anzahl geplünderter Items: ", amountPlundered);

	//-------- Rückgabewert ---------
	return amountPlundered;
};