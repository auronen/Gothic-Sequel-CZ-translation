
func int Spell_Logic_Teleport3(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Teleport3");
	if(manaInvested >= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self,TELEPORT3_WP);
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		AI_UnreadySpell(self);
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

