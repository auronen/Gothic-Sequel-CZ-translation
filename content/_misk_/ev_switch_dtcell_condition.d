
func int ev_switch_dtcell_condition()
{
	printdebugmobsi("EV_SWITCH_DTCELL_CONDITION");
	PrintScreen(_STR_MESSAGE_DTCELL_NOTYET,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
	return FALSE;
};

func void ev_switch_dtcell_s1()
{
	printdebugmobsi("EV_SWITCH_DTCELL_S1");
};

