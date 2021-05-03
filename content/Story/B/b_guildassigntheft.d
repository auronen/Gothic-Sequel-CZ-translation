
func void b_guildassigntheft()
{
	PrintDebugNpc(PD_ZS_Check,"B_GuildAssignTheft");
	if(self.guild == GIL_MILITIA)
	{
		INT_THEFT_GIL_MILITIA = INT_THEFT_GIL_MILITIA + 1;
	};
	if(self.guild == GIL_WORKER)
	{
		INT_THEFT_GIL_WORKER = INT_THEFT_GIL_WORKER + 1;
	};
	if(self.guild == GIL_MINER)
	{
		INT_THEFT_GIL_MINER = INT_THEFT_GIL_MINER + 1;
	};
	if(self.guild == GIL_HEALER)
	{
		INT_THEFT_GIL_HEALER = INT_THEFT_GIL_HEALER + 1;
	};
	if(self.guild == GIL_THIEF)
	{
		INT_THEFT_GIL_THIEF = INT_THEFT_GIL_THIEF + 1;
	};
	if(self.guild == GIL_POSSESSED)
	{
		INT_THEFT_GIL_POSSESSED = INT_THEFT_GIL_POSSESSED + 1;
	};
	if(self.guild == GIL_BEGGAR)
	{
		INT_THEFT_GIL_BEGGAR = INT_THEFT_GIL_BEGGAR + 1;
	};
	if(self.guild == GIL_DEMONIC)
	{
		INT_THEFT_GIL_DEMONIC = INT_THEFT_GIL_DEMONIC + 1;
	};
	if(self.guild == GIL_AMAZON)
	{
		INT_THEFT_GIL_AMAZON = INT_THEFT_GIL_AMAZON + 1;
	};
	if(self.guild == GIL_PALADIN)
	{
		INT_THEFT_GIL_PALADIN = INT_THEFT_GIL_PALADIN + 1;
	};
	if(self.guild == GIL_KDF)
	{
		INT_THEFT_GIL_KDF = INT_THEFT_GIL_KDF + 1;
	};
	if(self.guild == GIL_BLOODEARTH)
	{
		INT_THEFT_GIL_BLOODEARTH = INT_THEFT_GIL_BLOODEARTH + 1;
	};
	if(self.guild == GIL_DEMONHUNTER)
	{
		INT_THEFT_GIL_DEMONHUNTER = INT_THEFT_GIL_DEMONHUNTER + 1;
	};
	if(self.guild == GIL_RSVD_2)
	{
		INT_THEFT_GIL_RSVD2 = INT_THEFT_GIL_RSVD2 + 1;
	};
	if(self.guild == GIL_RSVD_3)
	{
		INT_THEFT_GIL_RSVD3 = INT_THEFT_GIL_RSVD3 + 1;
	};
	if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
	{
		b_setattitude(self,ATT_ANGRY);
	};
	self.aivar[36] = self.aivar[36] + 1;
};

