
func void B_AssessQuietSound()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessQuietSound");
	PrintGlobals(PD_ZS_FRAME);
	if(Snd_IsSourceNpc(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...Geräuschquelle ist SC!");
		if(other.guild == GIL_MEATBUG)
		{
			return;
		};
		if(!Npc_CanSeeSource(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...kann Geräuschquelle nicht sehen!");
			B_AssessSC();
		};
	};
};

