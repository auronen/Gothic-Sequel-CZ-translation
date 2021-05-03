
func int mob_armorstand_condition()
{
	if(Npc_IsPlayer(self))
	{
		AI_PlayAni(self,"T_DONTKNOW");
		return FALSE;
	}
	else
	{
		return TRUE;
	};
};

