
const int LP_PER_LEVEL = 10;
const int HP_PER_LEVEL = 12;
const int XP_PER_LEVEL_UNCONSCIOUS = 5;
const int XP_PER_LEVEL_DEAD = 10;

func void B_GiveXP(var int add_xp)
{
	var string msg;
	PrintDebugNpc(PD_ZS_FRAME,"B_GiveXP");
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	hero.exp = hero.exp + add_xp;
	msg = NAME_XPGained;
	msg = ConcatStrings(msg,IntToString(add_xp));
	ai_printscreen(self,msg,-1,_YPOS_MESSAGE_XPGAINED,FONT_OLD_SMALL,_TIME_MESSAGE_XPGAINED,TEXT_COLOR_WHITE);
	if(hero.exp >= hero.exp_next)
	{
		hero.level = hero.level + 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + HP_PER_LEVEL;
		hero.lp = hero.lp + LP_PER_LEVEL;
		ai_snd_play(self,"LevelUp");
		ai_printscreen(self,NAME_LevelUp,-1,_YPOS_MESSAGE_LEVELUP,FONT_OLD_BIG,_TIME_MESSAGE_LEVELUP,TEXT_COLOR_WHITE);
	};
};

func void B_DeathXP()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_DeathXP");
	PrintGlobals(PD_ZS_Check);
	if((C_NpcIsHuman(self) && Npc_WasInState(self,ZS_Unconscious)) || self.aivar[23])
	{
		PrintDebugNpc(PD_ZS_Check,"...Opfer ist bewußtloser Mensch oder beschwörtes Monster!");
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		if(C_NpcIsHuman(other) && other.aivar[27])
		{
			B_GiveXP((self.level * XP_PER_LEVEL_DEAD) / 2);
		}
		else
		{
			B_GiveXP(self.level * XP_PER_LEVEL_DEAD);
		};
	};
};

func void B_UnconciousXP()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_UnconciousXP");
	PrintGlobals(PD_ZS_Check);
	if(!C_NpcIsHuman(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...erster Sieg!");
		B_GiveXP(self.level * XP_PER_LEVEL_DEAD);
	};
};

