
func int mob_arenabench_condition(var int rightside)
{
	printdebugmobsi("MOB_ARENABENCH_CONDITION");
	if(Npc_IsPlayer(self))
	{
		printdebugmobsi("...SC!");
		if(ARENA_FIGHTSELECTED && ARENA_PLAYERFIGHT && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
		{
			printdebugmobsi("...Vorbereitungszeit für den SC-Gladiator!");
			PrintGlobals(PD_ITEM_MOBSI);
			if((rightside && (GOLIATH_CHALLENGED || MALGAR_CHALLENGED)) || (!rightside && (GRIM_CHALLENGED || BRUTUS_CHALLENGED || THORA_CHALLENGED)))
			{
				printdebugmobsi("...richtige Kammer!");
				return TRUE;
			}
			else
			{
				printdebugmobsi("...falsche Kammer!");
				PrintScreen(_STR_MESSAGE_MOBSI_ARENABENCH_CHAMBER,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
				AI_PlayAni(self,"T_DONTKNOW");
				return FALSE;
			};
		}
		else
		{
			printdebugmobsi("...nur für Gladiatoren!");
			PrintScreen(_STR_MESSAGE_MOBSI_ARENABENCH_GLADIATOR,-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("...NSC!");
		return TRUE;
	};
};

func int mob_arenabench_l_condition()
{
	printdebugmobsi("MOB_ARENABENCH_L_CONDITION");
	return mob_arenabench_condition(FALSE);
};

func int mob_arenabench_r_condition()
{
	printdebugmobsi("MOB_ARENABENCH_R_CONDITION");
	return mob_arenabench_condition(TRUE);
};

func void mob_arenabench_s1()
{
	printdebugmobsi("MOB_ARENABENCH_S1");
	if(Npc_IsPlayer(self) && ARENA_FIGHTSELECTED && ARENA_PLAYERFIGHT && Wld_IsTime(ARENAPRE_H,ARENAPRE_M,ARENABEGIN_H,ARENABEGIN_M))
	{
		printdebugmobsi("...Vorbereitungszeit für den SC-Gladiator!");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[33] = AIV_AM_ARENABENCH;
		self.aivar[24] = TRUE;
		AI_ProcessInfos(self);
	};
};

func void mob_arenabench_l_s1()
{
	printdebugmobsi("MOB_ARENABENCH_L_S1");
	mob_arenabench_s1();
};

func void mob_arenabench_r_s1()
{
	printdebugmobsi("MOB_ARENABENCH_R_S1");
	mob_arenabench_s1();
};


instance MOB_ARENABENCH_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_arenabench_exit_condition;
	information = mob_arenabench_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int mob_arenabench_exit_condition()
{
	if(hero.aivar[33] == AIV_AM_ARENABENCH)
	{
		return TRUE;
	};
};

func void mob_arenabench_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	AI_UseMob(hero,SCEMENAME_ARENABENCH,-1);
};


instance MOB_ARENABENCH1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_arenabench_gotofight_condition;
	information = mob_arenabench_gotofight_info;
	important = FALSE;
	permanent = TRUE;
	description = "(bis zum Kampf warten)";
};


func int mob_arenabench_gotofight_condition()
{
	if(hero.aivar[33] == AIV_AM_ARENABENCH)
	{
		return TRUE;
	};
};

func void mob_arenabench_gotofight_info()
{
	AI_UseMob(hero,SCEMENAME_ARENABENCH,-1);
	ai_snd_play(hero,"ARENAHORN_01");
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	Wld_SetTime(ARENABEGIN_H,ARENABEGIN_M + 1);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	PrintScreen("Du bist hochkonzentriert und bereit für den Kampf!",-1,-1,FONT_OLD_BIG,3);
};

