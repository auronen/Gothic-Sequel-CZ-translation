
func void C_ZSInit()
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_ZSInit");
	self.aivar[9] = 0;
	C_StopLookAt(self);
	if(c_npcisinvincible(self))
	{
		self.aivar[24] = FALSE;
		hero.aivar[24] = FALSE;
	};
};

func void C_Orc_ZSInit()
{
	Npc_SetPercTime(self,2);
	self.aivar[9] = 0;
};

