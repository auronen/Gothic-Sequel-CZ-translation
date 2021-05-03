
func void B_Orc_ItemHorn()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Orc_ItemHorn");
	if(Npc_HasItems(self,itmi_alarmhorn))
	{
		if(Npc_HasReadiedWeapon(self))
		{
			AI_RemoveWeapon(self);
		};
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itmi_alarmhorn,1);
		};
		AI_UseItemToState(self,itmi_alarmhorn,-1);
	};
};

func void B_Orc_ItemEat()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Orc_ItemEat");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	if(Hlp_Random(10) < 5)
	{
		if(Npc_HasItems(self,itfo_cheese) == 0)
		{
			CreateInvItem(self,itfo_cheese);
		};
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itfo_cheese,1);
		};
		AI_UseItemToState(self,itfo_cheese,-1);
	}
	else
	{
		if(Npc_HasItems(self,itfo_loaf) == 0)
		{
			CreateInvItem(self,itfo_loaf);
		};
		if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
		{
			AI_UseItemToState(self,itfo_loaf,1);
		};
		AI_UseItemToState(self,itfo_loaf,-1);
	};
};

func void B_Orc_ItemPotion()
{
	PrintDebugNpc(PD_TA_FRAME,"B_Orc_ItemPotion");
	if(Npc_HasReadiedWeapon(self))
	{
		AI_RemoveWeapon(self);
	};
	if(!Npc_HasItems(self,itfo_wine))
	{
		CreateInvItem(self,itfo_wine);
	};
	if(Npc_GetBodyState(self) != BS_ITEMINTERACT)
	{
		EquipItem(self,itfo_beer);
		AI_UseItemToState(self,itfo_wine,1);
	};
	AI_UseItemToState(self,itfo_wine,-1);
};

