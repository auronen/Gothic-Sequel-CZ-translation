
const int PD_TA_FRAME = 1;
const int PD_TA_LOOP = 2;
const int PD_TA_CHECK = 3;
const int PD_TA_DETAIL = 4;
const int PD_ZS_FRAME = 6;
const int PD_ZS_LOOP = 7;
const int PD_ZS_Check = 8;
const int PD_ZS_DETAIL = 9;
const int PD_MST_FRAME = 11;
const int PD_MST_LOOP = 12;
const int PD_MST_CHECK = 13;
const int PD_MST_DETAIL = 14;
const int PD_ORC_FRAME = 16;
const int PD_ORC_LOOP = 17;
const int PD_ORC_CHECK = 18;
const int PD_ORC_DETAIL = 19;
const int PD_MISSION = 21;
const int PD_CUTSCENE = 22;
const int PD_SPELL = 23;
const int PD_ITEM_MOBSI = 24;
const int PD_MAGIC = 25;

func void PrintDebugNpc(var int type,var string text)
{
	var string pipe;
	var int instance_id;
	var string inst_id;
	instance_id = self.id;
	inst_id = IntToString(instance_id);
	pipe = ConcatStrings("### ",self.name);
	pipe = ConcatStrings(pipe,"(");
	pipe = ConcatStrings(pipe,inst_id);
	pipe = ConcatStrings(pipe,")");
	pipe = ConcatStrings(pipe," ### -> ");
	pipe = ConcatStrings(pipe,text);
	PrintDebugInstCh(type,pipe);
};

func void printdebugmobsi(var string text)
{
	var string pipe;
	var int instance_id;
	var string inst_id;
	instance_id = self.id;
	inst_id = IntToString(instance_id);
	pipe = ConcatStrings("### ",self.name);
	pipe = ConcatStrings(pipe,"(");
	pipe = ConcatStrings(pipe,inst_id);
	pipe = ConcatStrings(pipe,")");
	pipe = ConcatStrings(pipe," ### -> ");
	pipe = ConcatStrings(pipe,text);
	PrintDebugCh(PD_ITEM_MOBSI,pipe);
};

func void PrintGlobals(var int channel)
{
	var string pipe;
	PrintDebugNpc(channel,"PrintGlobals");
	if(Hlp_IsValidNpc(self))
	{
		pipe = ConcatStrings("...self:   ",self.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(other))
	{
		pipe = ConcatStrings("...other:  ",other.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(victim))
	{
		pipe = ConcatStrings("...victim: ",victim.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(hero))
	{
		pipe = ConcatStrings("...hero:   ",hero.name);
		PrintDebugNpc(channel,pipe);
	};
	if(Hlp_IsValidItem(item))
	{
		pipe = ConcatStrings("...item:   ",item.name);
		PrintDebugNpc(channel,pipe);
	};
};

func void PrintGuild(var int channel,var int guild)
{
	PrintDebugNpc(channel,"PrintGuild");
	if(guild == GIL_None)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_NONE");
	};
	if(guild == GIL_MILITIA)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_MILITIA");
	};
	if(guild == GIL_WORKER)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_WORKER");
	};
	if(guild == GIL_HEALER)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_HEALER");
	};
	if(guild == GIL_THIEF)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_THIEF");
	};
	if(guild == GIL_POSSESSED)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_POSSESSED");
	};
	if(guild == GIL_BEGGAR)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_BEGGAR");
	};
	if(guild == GIL_DEMONIC)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_DEMONIC");
	};
	if(guild == GIL_AMAZON)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_AMAZON");
	};
	if(guild == GIL_PALADIN)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_PALADIN");
	};
	if(guild == GIL_KDF)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_KDF		");
	};
	if(guild == GIL_BLOODEARTH)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_BLOODEARTH");
	};
	if(guild == GIL_MINER)
	{
		PrintDebugNpc(channel,"...Gilde: GIL_MINER");
	};
};

func void PrintAttitudes(var int channel)
{
	var int temp_attitude;
	var int perm_attitude;
	PrintDebugNpc(channel,"PrintAttitudes");
	temp_attitude = Npc_GetAttitude(self,hero);
	perm_attitude = Npc_GetPermAttitude(self,hero);
	if(temp_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_HOSTILE");
	};
	if(temp_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_ANGRY");
	};
	if(temp_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_NEUTRAL");
	};
	if(temp_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel,"TempAttitude == ATT_FRIENDLY");
	};
	if(perm_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_HOSTILE");
	};
	if(perm_attitude == ATT_ANGRY)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_ANGRY");
	};
	if(perm_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_NEUTRAL");
	};
	if(perm_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc(channel,"PermAttitude == ATT_FRIENDLY");
	};
};

func void PrintDebugInt(var int channel,var string preText,var int value)
{
	var string printText;
	printText = IntToString(value);
	printText = ConcatStrings(preText,printText);
	PrintDebugNpc(channel,printText);
};

func void PrintDebugString(var int channel,var string preText,var string text)
{
	PrintDebugNpc(channel,ConcatStrings(preText,text));
};

func void printarenastatus(var int channel)
{
	var string pipe;
	PrintDebugNpc(channel,"PrintArenaStatus");
	PrintDebugInt(channel,"...Grim_Challenged: ",GRIM_CHALLENGED);
	PrintDebugInt(channel,"...Goliath_Challenged: ",GOLIATH_CHALLENGED);
	PrintDebugInt(channel,"...Brutus_Challenged: ",BRUTUS_CHALLENGED);
	PrintDebugInt(channel,"...Malgar_Challenged: ",MALGAR_CHALLENGED);
	PrintDebugInt(channel,"...Thora_Challenged: ",THORA_CHALLENGED);
	PrintDebugInt(channel,"...Arenamaster_FirstDay: ",ARENAMASTER_FIRSTDAY);
	PrintDebugInt(channel,"...Arenamaster_Accepted: ",ARENAMASTER_ACCEPTED);
	PrintDebugInt(channel,"...Arena_NpcFight: ",ARENA_NPCFIGHT);
	PrintDebugInt(channel,"...Arena_NpcCombo: ",ARENA_NPCCOMBO);
	PrintDebugInt(channel,"...Arena_NpcComboLast: ",ARENA_NPCCOMBOLAST);
	PrintDebugInt(channel,"...Arena_PlayerFight: ",ARENA_PLAYERFIGHT);
	PrintDebugInt(channel,"...Arena_PlayerHasCome: ",ARENA_PLAYERHASCOME);
	PrintDebugInt(channel,"...Arena_PlayerPrize: ",ARENA_PLAYERPRIZE);
	PrintDebugInt(channel,"...Arena_PlayerHasWonToday: ",ARENA_PLAYERHASWONTODAY);
	PrintDebugInt(channel,"...Arena_PrizeBefore: ",ARENA_PRIZEBEFORE);
	PrintDebugInt(channel,"...Arena_FightSelected: ",ARENA_FIGHTSELECTED);
	PrintDebugInt(channel,"...Arena_FightDay: ",ARENA_FIGHTDAY);
	PrintDebugInt(channel,"...Arena_FightRunning: ",ARENA_FIGHTRUNNING);
	PrintDebugInt(channel,"...Arena_SelectDay: ",ARENA_SELECTDAY);
	PrintDebugInt(channel,"...Arena_AbortFight: ",ARENA_ABORTFIGHT);
	PrintDebugInt(channel,"...Arena_PlayerShirked: ",ARENA_PLAYERSHIRKED);
	PrintDebugInt(channel,"...Arena_PlayerStoleWeapon: ",ARENA_PLAYERSTOLEWEAPON);
	PrintDebugInt(channel,"...Arena_PlayerUsedMagic: ",ARENA_PLAYERUSEDMAGIC);
	PrintDebugInt(channel,"...Arena_PlayerUsedBow: ",ARENA_PLAYERUSEDBOW);
	PrintDebugInt(channel,"...Arena_PlayerKilled: ",ARENA_PLAYERKILLED);
	PrintDebugInt(channel,"...Arena_PlayerBanned: ",ARENA_PLAYERBANNED);
	PrintDebugInt(channel,"...Arena_GatesClosed: ",ARENA_PLAYERUSEDBOW);
};

