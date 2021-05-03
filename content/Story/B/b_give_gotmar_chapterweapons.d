
func void b_give_gotmar_chapterweapons(var int storychapter)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(wrk_200_gotmar);
	if(storychapter == 1)
	{
		CreateInvItems(npc,itmi_pliers,2);
		CreateInvItems(npc,itmw_sledgehammer,2);
		CreateInvItems(npc,itmi_rawiron,10);
		CreateInvItems(npc,itmi_silver,250);
		CreateInvItems(npc,itmi_bloodorenugget,5);
	}
	else if(storychapter == 2)
	{
		CreateInvItems(npc,itmi_pliers,1);
		CreateInvItems(npc,itmw_sledgehammer,1);
		CreateInvItems(npc,itmi_rawiron,25);
		CreateInvItems(npc,itmi_silver,750);
	}
	else if(storychapter == 3)
	{
	}
	else if(storychapter == 4)
	{
	};
};

