
func void b_givelp(var int add_lp)
{
	var string msg;
	PrintDebugNpc(PD_ZS_FRAME,"B_GiveLP");
	hero.lp = hero.lp + add_lp;
	msg = NAME_LPGAINED;
	msg = ConcatStrings(msg,IntToString(add_lp));
	ai_printscreen(self,msg,-1,_YPOS_MESSAGE_LPGAINED,FONT_OLD_SMALL,_TIME_MESSAGE_LPGAINED,TEXT_COLOR_WHITE);
};

