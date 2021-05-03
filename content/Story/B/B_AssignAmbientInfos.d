
func void B_AssignAmbientInfos(var C_Npc amb_self)
{
	if((amb_self.npcType == npctype_ambient) || (amb_self.npcType == npctype_guard))
	{
		if(amb_self.guild == GIL_WORKER)
		{
			if(amb_self.voice == 1)
			{
				b_assignambientinfos_wrk_1(amb_self);
			}
			else if(amb_self.voice == 2)
			{
				b_assignambientinfos_wrk_2(amb_self);
			}
			else if(amb_self.voice == 6)
			{
				b_assignambientinfos_wrk_6(amb_self);
			}
			else if(amb_self.voice == 11)
			{
				b_assignambientinfos_wrk_11(amb_self);
			};
		}
		else if(amb_self.guild == GIL_MILITIA)
		{
			if(amb_self.voice == 4)
			{
				b_assignambientinfos_mil_4(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_mil_7(amb_self);
			}
			else if(amb_self.voice == 6)
			{
				b_assignambientinfos_mil_6(amb_self);
			}
			else if(amb_self.voice == 9)
			{
				b_assignambientinfos_mil_9(amb_self);
			};
		}
		else if(amb_self.guild == GIL_THIEF)
		{
			if(amb_self.voice == 5)
			{
				b_assignambientinfos_thf_5(amb_self);
			}
			else if(amb_self.voice == 10)
			{
				b_assignambientinfos_thf_10(amb_self);
			}
			else if(amb_self.voice == 11)
			{
				b_assignambientinfos_thf_11(amb_self);
			};
		};
	};
	if((amb_self.npcType == Npctype_MINE_Ambient) || (amb_self.npcType == NpcType_MINE_Guard))
	{
		if(amb_self.guild == GIL_MINER)
		{
			if(amb_self.voice == 1)
			{
				b_assignambientinfos_mine_min_1(amb_self);
			}
			else if(amb_self.voice == 4)
			{
				b_assignambientinfos_mine_min_4(amb_self);
			}
			else if(amb_self.voice == 9)
			{
				b_assignambientinfos_mine_min_9(amb_self);
			};
		}
		else if(amb_self.guild == GIL_MILITIA)
		{
			if(amb_self.voice == 4)
			{
				b_assignambientinfos_mine_mil_4(amb_self);
			}
			else if(amb_self.voice == 7)
			{
				b_assignambientinfos_mine_mil_7(amb_self);
			}
			else if(amb_self.voice == 8)
			{
				b_assignambientinfos_mine_mil_8(amb_self);
			};
		};
	};
	if(amb_self.npcType == NPCTYPE_OW_AMBIENT)
	{
		if(amb_self.guild == GIL_WORKER)
		{
			if(amb_self.voice == 2)
			{
				b_assignambientinfos_ow_wrk_2(amb_self);
			}
			else if(amb_self.voice == 3)
			{
				b_assignambientinfos_ow_wrk_3(amb_self);
			}
			else if(amb_self.voice == 4)
			{
				b_assignambientinfos_ow_wrk_4(amb_self);
			};
		};
	};
};

