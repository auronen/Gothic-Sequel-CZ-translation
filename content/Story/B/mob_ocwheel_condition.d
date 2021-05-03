
func int mob_ocwheel_condition()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_OCWHEEL_CONDITION");
	PrintGlobals(PD_ITEM_MOBSI);
	AI_PlayAni(self,"T_DONTKNOW");
	PrintScreen(_STR_MESSAGE_WHEEL_JAMMED,-1,_YPOS_MESSAGE_REFUSEACTION,FONT_OLD_SMALL,_TIME_MESSAGE_REFUSEACTION);
	return FALSE;
};

func int mob_ocwheel_s0()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_OCWHEEL_S0");
};

func int mob_ocwheel_s1()
{
	PrintDebugCh(PD_ITEM_MOBSI,"### MOB_OCWHEEL_S1");
};

