
func void b_explored(var int xp)
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Explored");
	PrintScreen(_STR_MESSAGE_EXPLO,-1,_YPOS_MESSAGE_EXPLO,FONT_OLD_BIG,_TIME_MESSAGE_EXPLO);
	Snd_Play("Goodie");
	B_GiveXP(xp);
};

