
func int b_getmobguild(var C_Npc manipulator)
{
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_None))
	{
		return GIL_None;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_MILITIA))
	{
		return GIL_MILITIA;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_WORKER))
	{
		return GIL_WORKER;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_MINER))
	{
		return GIL_MINER;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_HEALER))
	{
		return GIL_HEALER;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_THIEF))
	{
		return GIL_THIEF;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_POSSESSED))
	{
		return GIL_POSSESSED;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_BEGGAR))
	{
		return GIL_BEGGAR;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_DEMONIC))
	{
		return GIL_DEMONIC;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_AMAZON))
	{
		return GIL_AMAZON;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_PALADIN))
	{
		return GIL_PALADIN;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_KDF))
	{
		return GIL_KDF;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_BLOODEARTH))
	{
		return GIL_BLOODEARTH;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_DEMONHUNTER))
	{
		return GIL_DEMONHUNTER;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_RSVD_2))
	{
		return GIL_RSVD_2;
	};
	if(Npc_IsDetectedMobOwnedByGuild(manipulator,GIL_RSVD_3))
	{
		return GIL_RSVD_3;
	};
};

