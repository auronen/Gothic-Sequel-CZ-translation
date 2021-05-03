
func void zs_studyscroll()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_StudyScroll");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_studyscroll_loop()
{
	var int studyscratch;
	PrintDebugNpc(PD_TA_LOOP,"ZS_StudyScroll_Loop");
	B_UseFakeScroll();
	studyscratch = Hlp_Random(100);
	if(studyscratch >= 80)
	{
		AI_PlayAni(self,"R_SCRATCHHEAD");
		AI_Wait(self,1);
	}
	else if(studyscratch >= 60)
	{
		AI_PlayAni(self,"R_LEGSHAKE");
		AI_Wait(self,1);
	}
	else if(studyscratch >= 40)
	{
		AI_PlayAni(self,"R_SCRATCHLSHOULDER");
		AI_Wait(self,1);
	}
	else if(studyscratch >= 20)
	{
		AI_PlayAni(self,"R_SCRATCHEGG");
		AI_Wait(self,1);
	}
	else
	{
		AI_PlayAni(self,"R_SCRATCHRSHOULDER");
		AI_Wait(self,1);
	};
};

func void zs_studyscroll_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_StudyScroll_End");
};

