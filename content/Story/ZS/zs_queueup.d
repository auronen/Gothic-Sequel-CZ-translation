
func void zs_queueup()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_QueueUp");
	B_SetPerception(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	if(Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkMode(self,NPC_RUN);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	b_gotonearwp(self,self.wp);
};

func int zs_queueup_loop()
{
	var int zufall;
	PrintDebugNpc(PD_TA_LOOP,"ZS_QueueUp_Loop");
	B_GotoFP(self,"FP_QUEUE");
	zufall = Hlp_Random(100);
	if(zufall >= 90)
	{
		B_Bored(self);
	};
	AI_Wait(self,1);
};

func void zs_queueup_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_QueueUp_End");
};

