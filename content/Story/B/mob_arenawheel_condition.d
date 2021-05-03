
func int mob_arenawheel_condition()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_ARENAWHEEL_CONDITION");
	PrintGlobals(PD_ITEM_MOBSI);
	if(Npc_IsPlayer(self))
	{
		PrintDebugCh(PD_ITEM_MOBSI,"### ...nur Arenameister");
		AI_PlayAni(self,"T_DONTKNOW");
		PrintScreen(_STR_MESSAGE_ARENAWHEEL,-1,_YPOS_MESSAGE_REFUSEACTION,FONT_OLD_SMALL,_TIME_MESSAGE_REFUSEACTION);
		return FALSE;
	}
	else
	{
		PrintDebugCh(PD_ITEM_MOBSI,"### ...OK");
		return TRUE;
	};
};

func int mob_arenawheel_s0()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_ARENAWHEEL_S0");
};

func int mob_arenawheel_s1()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_ARENAWHEEL_S1");
	if(ARENA_GATESCLOSED)
	{
		ARENA_GATESCLOSED = FALSE;
		PrintDebugCh(PD_ITEM_MOBSI,"### ...gates opened");
	}
	else
	{
		ARENA_GATESCLOSED = TRUE;
		PrintDebugCh(PD_ITEM_MOBSI,"### ...gates closed");
	};
};

