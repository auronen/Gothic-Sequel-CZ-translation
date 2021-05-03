
func void b_give_helvegor_chapteritems(var int storychapter)
{
	var C_Npc helvegor;
	helvegor = Hlp_GetNpc(wrk_222_helvegor);
	if(storychapter == 1)
	{
		CreateInvItems(helvegor,itam_arrow,300);
		CreateInvItems(helvegor,itrw_shortbow,3);
		CreateInvItems(helvegor,itrw_riderbow,2);
		CreateInvItems(helvegor,itrw_fieldbow,1);
	};
};

