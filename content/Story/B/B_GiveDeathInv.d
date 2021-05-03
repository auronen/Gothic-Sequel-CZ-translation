
func void B_GiveDeathInv()
{
	if(self.aivar[24])
	{
		return;
	};
	if(Knows_GetTeeth == TRUE)
	{
		if(self.aivar[22] == ID_WOLF)
		{
			CreateInvItems(self,itat_teeth,2);
		};
		if(self.aivar[22] == ID_BLACKWOLF)
		{
			CreateInvItems(self,itat_teeth,2);
		};
		if(self.aivar[22] == ID_SNAPPER)
		{
			CreateInvItems(self,itat_teeth,4);
		};
		if(self.aivar[22] == ID_ORCBITER)
		{
			CreateInvItems(self,itat_teeth,2);
		};
		if(self.aivar[22] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_teeth,4);
		};
		if(self.aivar[22] == ID_BLOODHOUND)
		{
			CreateInvItems(self,itat_teeth,4);
		};
	};
	if(Knows_GetClaws == TRUE)
	{
		if(self.aivar[22] == ID_WARAN)
		{
			CreateInvItems(self,itat_claws,4);
		};
		if(self.aivar[22] == ID_FIREWARAN)
		{
			CreateInvItems(self,itat_claws,4);
		};
		if(self.aivar[22] == ID_SNAPPER)
		{
			CreateInvItems(self,itat_claws,1);
		};
		if(self.aivar[22] == ID_RAZOR)
		{
			CreateInvItems(self,itat_claws,3);
		};
		if(self.aivar[22] == ID_ORCBITER)
		{
			CreateInvItems(self,itat_claws,2);
		};
		if(self.aivar[22] == ID_LURKER)
		{
			CreateInvItems(self,itat_lurkerclaw,2);
		};
	};
	if(Knows_GetFur == TRUE)
	{
		if(self.aivar[22] == ID_WOLF)
		{
			CreateInvItems(self,itat_wolf,1);
		};
		if(self.aivar[22] == ID_BLACKWOLF)
		{
			CreateInvItems(self,ItAt_Wolf_02,1);
		};
		if(self.aivar[22] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_shadowfur,1);
		};
		if(self.aivar[22] == ID_TROLL)
		{
			CreateInvItems(self,itat_trollfur,1);
		};
	};
	if(Knows_GetHide == TRUE)
	{
		if(self.aivar[22] == ID_LURKER)
		{
			CreateInvItems(self,itat_lurkerskin,1);
		};
		if(self.aivar[22] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,itat_swampsharkskin,1);
		};
	};
	if(Knows_GetMCMandibles == TRUE)
	{
		if(self.aivar[22] == ID_MINECRAWLER)
		{
			CreateInvItems(self,itat_mandiblescrawler,1);
		};
		if(self.aivar[22] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,itat_mandiblescrawler,1);
		};
	};
	if(Knows_GetMCPlates == TRUE)
	{
		if(self.aivar[22] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,itat_platescrawler,2);
		};
	};
	if(Knows_GetBFSting == TRUE)
	{
		if(self.aivar[22] == ID_BLOODFLY)
		{
			CreateInvItems(self,itat_bloodflysting,1);
		};
	};
	if(Knows_GetUluMulu == TRUE)
	{
		if(self.aivar[22] == ID_FIREWARAN)
		{
			CreateInvItems(self,itat_waran,1);
		};
		if(self.aivar[22] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,itat_shadowhorn,1);
		};
		if(self.aivar[22] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,itat_swampsharkteeth,3);
		};
		if(self.aivar[22] == ID_TROLL)
		{
			CreateInvItems(self,itat_trolltheeth,2);
		};
	};
	self.aivar[24] = TRUE;
};

