
func void b_give_agon_chapteritems(var int storychapter)
{
	var C_Npc agon;
	agon = Hlp_GetNpc(wrk_225_agon);
	if(storychapter == 1)
	{
		CreateInvItems(agon,itmi_salt,100);
		CreateInvItems(agon,itat_meatbug,20);
		CreateInvItems(agon,itat_moleratgrease,20);
		CreateInvItems(agon,itpl_swampweed,20);
		CreateInvItems(agon,itpl_cavemushroom,20);
		CreateInvItems(agon,itfo_mutton,20);
		CreateInvItems(agon,itfo_loaf,30);
		CreateInvItems(agon,itfo_cheese,30);
		CreateInvItems(agon,itfo_ham,30);
		CreateInvItems(agon,itfo_apple,5);
		CreateInvItems(agon,itfo_grapes,3);
		CreateInvItems(agon,ItLsTorch,20);
		CreateInvItems(agon,itmi_pliers,2);
		CreateInvItems(agon,itmw_sledgehammer,2);
		CreateInvItems(agon,itmi_orenugget,20);
		CreateInvItems(agon,itmi_bloodorenugget,2);
		CreateInvItems(agon,ItFo_Potion_Health_01,6);
		CreateInvItems(agon,ItFo_Potion_Mana_01,6);
		CreateInvItems(agon,ItFo_Potion_Health_02,3);
		CreateInvItems(agon,ItFo_Potion_Mana_02,3);
		CreateInvItems(agon,itmi_silver,400);
	};
};

