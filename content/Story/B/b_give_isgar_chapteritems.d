
func void b_give_isgar_chapteritems(var int storychapter)
{
	var C_Npc isgar;
	isgar = Hlp_GetNpc(hlr_502_isgar);
	if(storychapter == 1)
	{
		CreateInvItems(isgar,itpl_mountainmoss,20);
		CreateInvItems(isgar,itpl_bloodthistle,20);
		CreateInvItems(isgar,itpl_stoneroot,20);
		CreateInvItems(isgar,itpl_orcleaf,20);
		CreateInvItems(isgar,itpl_ravenherb,10);
		CreateInvItems(isgar,itpl_nightshade,5);
		CreateInvItems(isgar,itmi_alcohol,50);
		CreateInvItems(isgar,ItFo_Potion_Health_01,8);
		CreateInvItems(isgar,ItFo_Potion_Mana_01,8);
		CreateInvItems(isgar,ItFo_Potion_Health_02,4);
		CreateInvItems(isgar,ItFo_Potion_Mana_02,4);
		CreateInvItems(isgar,ItFo_Potion_Health_03,2);
		CreateInvItems(isgar,ItFo_Potion_Mana_03,2);
		CreateInvItems(isgar,ItFo_Potion_Health_Perma_01,2);
		CreateInvItems(isgar,itmi_silver,250);
	};
};

