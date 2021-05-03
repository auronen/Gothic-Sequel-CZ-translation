
func void B_AssessSC()
{
	var C_Npc her;
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessSc");
	if(Npc_CanSeeNpcFreeLOS(self,other) || self.aivar[37])
	{
		PrintDebugNpc(PD_ZS_Check,"...SC sichtbar!");
		her = Hlp_GetNpc(PC_Hero);
		if(!B_CompareNpcInstance(her,hero) && Npc_IsInState(self,ZS_GuardPassage))
		{
			if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY)
			{
				B_FullStop(self);
				B_Say(self,other,"$NOWWAIT");
				B_IntruderAlert(self,other);
				B_SetAttackReason(self,AIV_AR_INTRUDER);
				b_attackproper(self,other);
			};
		};
		if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
		{
			B_CheckStolenEquipment();
		};
		if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
		{
			B_CheckForImportantInfo(self,other);
		};
		if(C_NpcIsInFightMode(other))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC im Kampfmodus!");
			B_AssessFighter();
			return;
		};
		if(!C_BodyStateContains(other,BS_SNEAK))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC schleicht NICHT!");
			if((Npc_IsInRoutine(self,zs_guardwp) || Npc_IsInRoutine(self,zs_guardfp)) && (Npc_GetDistToNpc(self,other) < HAI_DIST_GUARDOBSERVEINTRUDER))
			{
				AI_StartState(self,ZS_ObserveIntruder,1,"");
				return;
			};
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_OBSERVEINTRUDER)
			{
				PrintDebugNpc(PD_ZS_Check,"...SC in ObserveIntruder-Reichweite!");
				B_ObserveIntruder();
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_Check,"...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};
	};
	if((hero.aivar[19] == AIV_GPS_FIRSTWARN) || (hero.aivar[19] == AIV_GPS_LASTWARN))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC wurde von Durchgangswachen verwarnt!");
		PrintDebugInt(PD_ZS_Check,"hero.aivar[AIV_GUARDPASSAGE_STATUS] = ",hero.aivar[19]);
		if(Npc_IsInState(self,ZS_GuardPassage) && (Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_RESET))
		{
			PrintDebugNpc(PD_ZS_Check,"...Status für Durchgangswachen zurücksetzen!");
			hero.aivar[19] = AIV_GPS_BEGIN;
		};
	};
};

