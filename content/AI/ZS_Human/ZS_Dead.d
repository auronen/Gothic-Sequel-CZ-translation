
func void ZS_Dead()
{
	var string msg;
	var int random;
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Dead");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	self.aivar[4] = FALSE;
	if(Npc_IsPlayer(self))
	{
		random = Hlp_Random(13);
		if(random == 0)
		{
			msg = _STR_MESSAGE_DEATH0;
		};
		if(random == 1)
		{
			msg = _STR_MESSAGE_DEATH1;
		};
		if(random == 2)
		{
			msg = _STR_MESSAGE_DEATH2;
		};
		if(random == 3)
		{
			msg = _STR_MESSAGE_DEATH3;
		};
		if(random == 4)
		{
			msg = _STR_MESSAGE_DEATH4;
		};
		if(random == 5)
		{
			msg = _STR_MESSAGE_DEATH5;
		};
		if(random == 6)
		{
			msg = _STR_MESSAGE_DEATH6;
		};
		if(random == 7)
		{
			msg = _STR_MESSAGE_DEATH7;
		};
		if(random == 8)
		{
			msg = _STR_MESSAGE_DEATH8;
		};
		if(random == 9)
		{
			msg = _STR_MESSAGE_DEATH9;
		};
		if(random == 10)
		{
			msg = _STR_MESSAGE_DEATH10;
		};
		if(random == 11)
		{
			msg = _STR_MESSAGE_DEATH11;
		};
		if(random == 12)
		{
			msg = _STR_MESSAGE_DEATH12;
		};
		PrintScreen(msg,-1,-1,FONT_OLD_BIG,_TIME_MESSAGE_DEATH);
	};
	if(Npc_IsPlayer(other) || (C_NpcIsHuman(other) && other.aivar[27]) || (C_NpcIsMonster(other) && other.aivar[23]))
	{
		B_DeathXP();
	};
	if(C_NpcIsMonster(self))
	{
		B_GiveDeathInv();
	};
};

