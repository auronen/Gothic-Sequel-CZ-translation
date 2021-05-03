
func void B_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessBody");
	PrintGlobals(PD_ZS_Check);
	if(Npc_GetDistToNpc(self,other) < 1000)
	{
		PrintDebugNpc(PD_ZS_Check,"...Körper näher als 10m!");
		B_FullStop(self);
		AI_StartState(self,ZS_AssessBody,0,"");
	};
};

