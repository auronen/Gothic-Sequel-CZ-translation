
func void b_give_gerion_chapteritems(var int storychapter)
{
	var C_Npc gerion;
	gerion = Hlp_GetNpc(thf_403_gerion);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) > 0) || (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) > 0))
	{
		if(storychapter == 1)
		{
			CreateInvItems(gerion,itke_lockpick,20);
			CreateInvItems(gerion,itam_arrow,200);
			CreateInvItems(gerion,itmi_silver,500);
		};
		if(storychapter == 2)
		{
			CreateInvItems(gerion,itke_lockpick,30);
			CreateInvItems(gerion,itam_arrow,300);
			CreateInvItems(gerion,itmi_silver,750);
		};
	};
};

