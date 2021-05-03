
func void zs_sitaroundeating()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SitAroundEating");
	B_SetPerception(self);
	if((Npc_GetDistToWP(self,self.wp) > 500) && !C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK,"...zu weit weg vom TA-Startpunkt!");
		AI_Standup(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	};
};

func int zs_sitaroundeating_loop()
{
	var int choice;
	PrintDebugNpc(PD_TA_LOOP,"ZS_SitAroundEating_Loop");
	if(!C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK,"...NSC sitzt noch nicht!");
		if(Wld_IsMobAvailable(self,SCEMENAME_BENCH))
		{
			PrintDebugNpc(PD_TA_CHECK,"...Bank gefunden!");
			AI_UseMob(self,SCEMENAME_BENCH,1);
			self.aivar[7] = 2;
		}
		else if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...Stuhl gefunden!");
			AI_UseMob(self,"CHAIR",1);
			self.aivar[7] = 3;
		}
		else if(Wld_IsMobAvailable(self,"SMALL THRONE"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...kl. Thron gefunden!");
			AI_UseMob(self,"SMALL THRONE",1);
			self.aivar[7] = 4;
		}
		else if(Wld_IsFPAvailable(self,"SIT"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...FP 'SIT' gefunden!");
			B_GotoFP(self,"SIT");
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
			self.aivar[7] = 1;
		}
		else
		{
			PrintDebugNpc(PD_TA_CHECK,"...keine Sitzgelegenheit gefunden!");
			AI_StartState(self,ZS_StandAround,1,"");
			return LOOP_CONTINUE;
		};
	}
	else
	{
		choice = Hlp_Random(100);
		PrintDebugInt(PD_TA_DETAIL,"...Zufallsani-Wurf: ",choice);
		if(self.aivar[10] == TA_IT_NONE)
		{
			if((choice >= 0) && (choice < 100))
			{
				B_ChooseApple(self);
			};
			B_PlayItemRandoms(self);
		}
		else if(choice < 10)
		{
			B_ClearItem(self);
		}
		else
		{
			B_PlayItemRandoms(self);
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sitaroundeating_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SitAroundEating_End");
	C_StopLookAt(self);
	B_ClearItem(self);
	if(self.aivar[7] == 1)
	{
		AI_PlayAni(self,"T_SIT_2_STAND");
		self.aivar[7] = 0;
	}
	else if(self.aivar[7] == 4)
	{
		AI_UseMob(self,"SMALL THRONE",-1);
		self.aivar[7] = 0;
	}
	else if(self.aivar[7] == 2)
	{
		AI_UseMob(self,SCEMENAME_BENCH,-1);
		self.aivar[7] = 0;
	}
	else if(self.aivar[7] == 3)
	{
		AI_UseMob(self,"CHAIR",-1);
		self.aivar[7] = 0;
	};
};

