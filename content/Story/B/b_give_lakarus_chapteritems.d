
func void b_give_lakarus_chapteritems(var int storychapter)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(beg_704_lakarus);
	if(storychapter == 1)
	{
		CreateInvItems(npc,itpl_swampweed,5);
		CreateInvItems(npc,itmi_silver,5);
	}
	else if(storychapter == 2)
	{
		CreateInvItems(npc,itpl_swampweed,12);
		CreateInvItems(npc,itmi_silver,10);
	}
	else if(storychapter == 3)
	{
	}
	else if(storychapter == 4)
	{
	};
};

