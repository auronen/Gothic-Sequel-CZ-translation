
func void B_GotoWPNextToNpc(var C_Npc slf,var C_Npc oth)
{
	var string waypoint;
	PrintDebugNpc(PD_ZS_DETAIL,"B_GotoWPNextToNpc");
	waypoint = Npc_GetNextWP(oth);
	AI_GotoWP(slf,waypoint);
};

func int C_LookAtNpc(var C_Npc slf,var C_Npc oth)
{
	AI_LookAtNpc(slf,oth);
	PrintDebugNpc(PD_ZS_DETAIL,"C_LookAtNpc");
	return 1;
};

func int C_StopLookAt(var C_Npc slf)
{
	AI_StopLookAt(slf);
	PrintDebugNpc(PD_ZS_DETAIL,"C_StopLookAt");
	return 1;
};

func void B_SmartTurnToNpc(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_SmartTurnToNpc");
	if(!(C_BodyStateContains(slf,BS_SIT) || C_BodyStateContains(slf,BS_ITEMINTERACT) || C_BodyStateContains(slf,BS_MOBINTERACT) || C_BodyStateContains(slf,BS_MOBINTERACT_INTERRUPT)))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...sitzt nicht und ist nicht am Mobsi");
		if(!Npc_CanSeeNpc(slf,oth))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel nicht sehen!");
			AI_TurnToNPC(slf,oth);
		}
		else
		{
			C_LookAtNpc(slf,oth);
		};
	};
};

func void B_Say(var C_Npc slf,var C_Npc oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_Say: ",text);
	PrintDebugNpc(PD_ZS_FRAME,pipe);
	if(B_CompareNpcInstance(slf,hero))
	{
		B_SmartTurnToNpc(oth,slf);
	}
	else
	{
		B_SmartTurnToNpc(slf,oth);
	};
	AI_OutputSVM(slf,oth,text);
};

func void B_SayOverlay(var C_Npc slf,var C_Npc oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_SayOverlay: ",text);
	PrintDebugNpc(PD_ZS_FRAME,pipe);
	B_SmartTurnToNpc(slf,oth);
	AI_OutputSVM_Overlay(slf,oth,text);
};

func void B_StandUp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_StandUp");
	if(slf.aivar[7] == 1)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...Ground");
		AI_PlayAni(slf,"T_SIT_2_STAND");
		slf.aivar[7] = 0;
	}
	else if(slf.aivar[7] == 4)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"Throne");
		AI_UseMob(slf,"SMALL THRONE",-1);
		slf.aivar[7] = 0;
	}
	else if(slf.aivar[7] == 2)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"Bench");
		AI_UseMob(slf,SCEMENAME_BENCH,-1);
		slf.aivar[7] = 0;
	}
	else if(slf.aivar[7] == 3)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"Chair");
		AI_UseMob(slf,"CHAIR",-1);
		slf.aivar[7] = 0;
	};
};

func void B_CallComrades()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_CallComrades");
	B_SayOverlay(self,NULL,"$COMRADESHELP");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void B_CallGuards()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_CallGuards");
	B_SayOverlay(self,NULL,"$HELP");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void B_IntruderAlert(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_IntruderAlert");
	B_SayOverlay(slf,NULL,"$IntruderAlert");
	Npc_SendPassivePerc(slf,PERC_ASSESSWARN,slf,oth);
};

func void B_FullStop(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_FullStop");
	Npc_ClearAIQueue(npc);
	if((wld_getinteractmobstate(self,SCEMENAME_BENCH) == 1) || (wld_getinteractmobstate(self,SCEMENAME_BED) == 1) || (wld_getinteractmobstate(self,SCEMENAME_BEDLOW) == 1) || (wld_getinteractmobstate(self,SCEMENAME_BEDHIGH) == 1))
	{
		AI_Standup(npc);
	}
	else
	{
		AI_StandupQuick(npc);
	};
};

func void B_ResetTempAttitude(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_ResetTempAttitude");
	Npc_SetTempAttitude(slf,Npc_GetPermAttitude(slf,hero));
};

func void B_WhirlAround(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_WhirlAround");
	if(Npc_CanSeeNpc(slf,oth))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...KANN Ziel sehen!");
		AI_TurnToNPC(slf,oth);
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel NICHT sehen!");
		AI_WhirlAround(slf,oth);
	};
};

func void B_DropWeapon(var C_Npc slf)
{
	var C_Item itm;
	var int itemid;
	PrintDebugNpc(PD_ZS_DETAIL,"B_DropWeapon");
	itm = Npc_GetReadiedWeapon(slf);
	if(Hlp_IsValidItem(itm))
	{
		itemid = Hlp_GetInstanceID(itm);
		PrintDebugNpc(PD_ZS_DETAIL,itm.name);
		AI_DropItem(slf,itemid);
	};
};

func void B_RegainDroppedWeapon(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_RegainDroppedWeapon");
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_NF) || Wld_DetectItem(slf,ITEM_KAT_FF))
	{
		PrintDebugString(PD_ZS_Check,"...Waffe entdeckt : ",item.name);
		if(!Npc_IsPlayer(slf) && (Npc_GetDistToItem(slf,item) < HAI_DIST_REGAINDROPPEDWEAPON))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC hebt seine Waffen wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestMeleeWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
		};
	};
};

func void B_RegainDroppedArmor(var C_Npc slf)
{
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_ARMOR))
	{
		if(!Npc_IsPlayer(slf))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC hebt seine Rüstung wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestArmor(slf);
		};
	};
};

func void B_GotoFP(var C_Npc slf,var string fp)
{
	PrintDebugNpc(PD_TA_LOOP,"B_GotoFP");
	if(!Npc_IsOnFP(slf,fp))
	{
		PrintDebugString(PD_TA_CHECK,"...nicht auf passendem Freepoint ",fp);
		if(Wld_IsFPAvailable(slf,fp))
		{
			PrintDebugString(PD_TA_CHECK,"Gehe zu Freepoint ",fp);
			AI_SetWalkMode(slf,NPC_WALK);
			AI_GotoFP(slf,fp);
			AI_AlignToFP(slf);
		}
		else
		{
			AI_SetWalkMode(slf,NPC_WALK);
			AI_GotoWP(slf,slf.wp);
			AI_GotoFP(slf,fp);
			AI_AlignToFP(slf);
		};
	}
	else
	{
		AI_AlignToFP(slf);
	};
};

func void b_runtofp(var C_Npc slf,var string fp)
{
	PrintDebugNpc(PD_TA_LOOP,"B_RuntoFP");
	if(!Npc_IsOnFP(slf,fp))
	{
		PrintDebugString(PD_TA_CHECK,"...nicht auf passendem Freepoint: ",fp);
		if(Wld_IsNextFPAvailable(slf,fp))
		{
			PrintDebugString(PD_TA_CHECK,"Gehe zu Freepoint: ",fp);
			AI_SetWalkMode(slf,NPC_RUN);
			AI_GotoNextFP(slf,fp);
			AI_AlignToFP(slf);
		}
		else
		{
			AI_SetWalkMode(slf,NPC_RUN);
			AI_GotoWP(slf,slf.wp);
			AI_GotoNextFP(slf,fp);
			AI_AlignToFP(slf);
		};
	}
	else
	{
		AI_AlignToFP(slf);
	};
};

func void b_gotonearwp(var C_Npc slf,var string wp)
{
	PrintDebugNpc(PD_TA_LOOP,"B_GotoNearWP");
	if(Npc_GetDistToWP(slf,wp) > 400)
	{
		PrintDebugString(PD_TA_CHECK,"...zu weit weg von Waypoint: ",wp);
		AI_SetWalkMode(slf,NPC_WALK);
		AI_GotoWP(slf,wp);
	};
};

func void b_runtonearwp(var C_Npc slf,var string wp)
{
	PrintDebugNpc(PD_TA_LOOP,"B_RuntoNearWP");
	if(Npc_GetDistToWP(slf,wp) > 400)
	{
		PrintDebugString(PD_TA_CHECK,"...zu weit weg von Waypoint: ",wp);
		AI_SetWalkMode(slf,NPC_RUN);
		AI_GotoWP(slf,wp);
	};
};

func void B_StopGotoHero()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_StopGotoHero");
	if(Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...Kollision mit Spieler!");
		Npc_PercDisable(self,PERC_MOVENPC);
		B_FullStop(self);
	};
};

func void B_SetAttackReason(var C_Npc slf,var int reason)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetAttackReason");
	slf.aivar[26] = reason;
};

func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	var int itemInstance;
	PrintDebugNpc(PD_ZS_DETAIL,"B_KillNpc");
	npc = Hlp_GetNpc(npcInstance);
	npc.flags = 0;
	Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	if(Npc_GetInvItemBySlot(npc,INV_WEAPON,1))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 1 gefunden!");
		itemInstance = Hlp_GetInstanceID(item);
		Npc_RemoveInvItem(npc,itemInstance);
	};
	if(Npc_GetInvItemBySlot(npc,INV_WEAPON,2))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 2 gefunden!");
		itemInstance = Hlp_GetInstanceID(item);
		Npc_RemoveInvItem(npc,itemInstance);
	};
};

func void B_UseFakeScroll()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	CreateInvItem(self,Fakescroll);
	AI_UseItemToState(self,Fakescroll,1);
	AI_Wait(self,3);
	AI_UseItemToState(self,Fakescroll,-1);
};

func void b_usefakebook(var C_Npc user)
{
	if(C_BodyStateContains(user,BS_SIT))
	{
		AI_Standup(user);
		AI_TurnToNPC(user,hero);
	};
	CreateInvItem(user,fakebook);
	AI_UseItemToState(user,fakebook,1);
	AI_Wait(user,3);
	AI_UseItemToState(user,fakebook,-1);
};

func void B_ChangeGuild(var int npcInstance,var int newGuild)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ChangeGuild");
	npc = Hlp_GetNpc(npcInstance);
	Npc_SetTrueGuild(npc,newGuild);
	npc.guild = newGuild;
};

func void B_ExchangeRoutine(var int npcInstance,var string newRoutine)
{
	var C_Npc npc;
	var int selfinstance;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ExchangeRoutine");
	npc = Hlp_GetNpc(npcInstance);
	selfinstance = Hlp_GetInstanceID(self);
	Npc_ExchangeRoutine(npc,newRoutine);
	if((npcInstance != selfinstance) && !c_npcisinvincible(npc))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...NICHT für 'self' ausgeführt!");
		AI_ContinueRoutine(npc);
	};
};

func int b_npcisnear(var C_Npc slf,var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_NpcIsNear");
	npc = Hlp_GetNpc(npcInstance);
	if(Npc_GetDistToNpc(slf,npc) <= HAI_DIST_NPCISNEAR)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void B_LogEntry(var string topic,var string entry)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_LogEntry");
	Log_AddEntry(topic,entry);
	ai_snd_play(self,"LogEntry");
	ai_printscreen(self,NAME_NewLogEntry,-1,_YPOS_MESSAGE_LOGENTRY,FONT_OLD_SMALL,_TIME_MESSAGE_LOGENTRY,TEXT_COLOR_WHITE);
};

func void b_setimmortal(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetImmortal");
	npc = Hlp_GetNpc(npcInstance);
	npc.flags = npc.flags | NPC_FLAG_IMMORTAL;
};

func void B_ClearImmortal(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ClearImmortal");
	npc = Hlp_GetNpc(npcInstance);
	npc.flags = npc.flags - NPC_FLAG_IMMORTAL;
};

func void B_SetNpcType(var int npcInstance,var int newNpctype)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetNpcType");
	npc = Hlp_GetNpc(npcInstance);
	npc.npcType = newNpctype;
};

func void B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var int int_itemcountnsc;
	var string msg;
	PrintDebugNpc(PD_ZS_DETAIL,"B_GiveInvItems");
	if(Hlp_IsValidNpc(giver))
	{
		if(Npc_IsPlayer(giver))
		{
			Npc_RemoveInvItems(giver,itemInstance,amount);
		}
		else
		{
			int_itemcountnsc = Npc_HasItems(giver,itemInstance);
			if(Hlp_GetInstanceID(itmi_silver) == itemInstance)
			{
				PrintDebugNpc(PD_ZS_Check,"Silber");
			};
			Npc_RemoveInvItems(giver,itemInstance,int_itemcountnsc);
		};
	};
	if(Hlp_IsValidNpc(taker))
	{
		CreateInvItems(taker,itemInstance,amount);
	};
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == itmi_silver)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_SILVER_GIVEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		}
		else if(amount == 1)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEM_GIVEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		}
		else
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_GIVEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == itmi_silver)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_SILVER_TAKEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_TAKEN,FONT_OLD_SMALL,_TIME_MESSAGE_TAKEN,TEXT_COLOR_WHITE);
		}
		else if(amount == 1)
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEM_TAKEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_TAKEN,FONT_OLD_SMALL,_TIME_MESSAGE_TAKEN,TEXT_COLOR_WHITE);
		}
		else
		{
			msg = ConcatStrings(IntToString(amount),_STR_MESSAGE_ITEMS_TAKEN);
			ai_printscreen(giver,msg,-1,_YPOS_MESSAGE_TAKEN,FONT_OLD_SMALL,_TIME_MESSAGE_TAKEN,TEXT_COLOR_WHITE);
		};
	};
};

func void b_punderinvitems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string msg;
	PrintDebugNpc(PD_ZS_DETAIL,"B_PlunderInvItems");
	if(Hlp_IsValidNpc(giver))
	{
		Npc_RemoveInvItems(giver,itemInstance,amount);
	};
	if(Hlp_IsValidNpc(taker))
	{
		CreateInvItems(taker,itemInstance,amount);
	};
	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == itmi_silver)
		{
			msg = taker.name[0];
			msg = ConcatStrings(msg," hat ");
			msg = ConcatStrings(msg,IntToString(amount));
			msg = ConcatStrings(msg,_STR_MESSAGE_SILVER_PLUNDERED);
			ai_printscreen(taker,msg,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		}
		else if(amount == 1)
		{
			msg = taker.name[0];
			msg = ConcatStrings(msg," hat ");
			msg = ConcatStrings(msg,IntToString(amount));
			msg = ConcatStrings(msg,_STR_MESSAGE_ITEM_PLUNDERED);
			ai_printscreen(taker,msg,-1,_YPOS_MESSAGE_GIVEN - 10,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		}
		else
		{
			msg = taker.name[0];
			msg = ConcatStrings(msg," hat ");
			msg = ConcatStrings(msg,IntToString(amount));
			msg = ConcatStrings(msg,_STR_MESSAGE_ITEMS_PLUNDERED);
			ai_printscreen(taker,msg,-1,_YPOS_MESSAGE_GIVEN - 20,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN,TEXT_COLOR_WHITE);
		};
	};
};

func int B_CheckForImportantInfo(var C_Npc slf,var C_Npc oth)
{
	var C_Npc her;
	PrintDebugNpc(PD_ZS_FRAME,"B_CheckForImportantInfo");
	if((oth.aivar[24] == FALSE) && C_NpcIsHuman(oth))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC spricht nicht!");
		her = Hlp_GetNpc(PC_Hero);
		if(Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC steckt im Körper eines anderen!");
			return FALSE;
		};
		if(Npc_CheckInfo(slf,1))
		{
			PrintDebugNpc(PD_ZS_Check,"...wichtige Info zu vergeben!");
			PrintDebugNpc(PD_ZS_Check,"...SC springt nicht oder NSC ist Durchgangswache!");
			if(!C_BodyStateContains(oth,BS_FALL))
			{
				PrintDebugNpc(PD_ZS_Check,"...fällt nicht!");
				if(!C_BodyStateContains(oth,BS_SWIM))
				{
					PrintDebugNpc(PD_ZS_Check,"...schwimmt nicht!");
					if(!C_BodyStateContains(oth,BS_DIVE))
					{
						PrintDebugNpc(PD_ZS_Check,"...taucht nicht!");
						hero.aivar[15] = TRUE;
						B_FullStop(oth);
						if(C_BodyStateContains(slf,BS_SIT) || !Npc_CanSeeNpc(slf,oth))
						{
							Npc_ClearAIQueue(slf);
							AI_Standup(slf);
						}
						else
						{
						};
						AI_StartState(slf,ZS_Talk,1,"");
						Npc_PercDisable(slf,PERC_ASSESSFIGHTER);
						return TRUE;
					};
				};
			};
		};
	};
	return FALSE;
};

func void b_setattitude(var C_Npc slf,var int att)
{
	var string string_screentext;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetAttitude");
	Npc_SetTempAttitude(slf,att);
	Npc_SetPermAttitude(slf,att);
	if(att == ATT_FRIENDLY)
	{
		string_screentext = slf.name[0];
		string_screentext = ConcatStrings(string_screentext," ist freundlich.");
		printscreencolored(string_screentext,-1,_YPOS_MESSAGE_GIVEN + 2,FONT_OLD_SMALL,_TIME_MESSAGE_CHANGEATTITUDE,TEXT_COLOR_GREEN);
	};
	if(att == ATT_NEUTRAL)
	{
		string_screentext = slf.name[0];
		string_screentext = ConcatStrings(string_screentext," ist neutral.");
		printscreencolored(string_screentext,-1,_YPOS_MESSAGE_GIVEN + 2,FONT_OLD_SMALL,_TIME_MESSAGE_CHANGEATTITUDE,TEXT_COLOR_WHITE);
	};
	if(att == ATT_ANGRY)
	{
		string_screentext = slf.name[0];
		string_screentext = ConcatStrings(string_screentext," ist verärgert.");
		printscreencolored(string_screentext,-1,_YPOS_MESSAGE_GIVEN + 2,FONT_OLD_SMALL,_TIME_MESSAGE_CHANGEATTITUDE,TEXT_COLOR_YELLOW);
	};
	if(att == ATT_HOSTILE)
	{
		string_screentext = slf.name[0];
		string_screentext = ConcatStrings(string_screentext," ist feindlich.");
		printscreencolored(string_screentext,-1,_YPOS_MESSAGE_GIVEN + 2,FONT_OLD_SMALL,_TIME_MESSAGE_CHANGEATTITUDE,TEXT_COLOR_RED);
	};
};

func void B_InitGuildAttitudes()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_InitGuildAttitudes");
	Wld_ExchangeGuildAttitudes("GIL_ATTITUDES");
};

func void B_PracticeCombat(var string waypoint)
{
	PrintDebugNpc(PD_ZS_FRAME,"B_PracticeCombat");
};

func void b_printleveltoolow(var int level)
{
	var string msg;
	PrintDebugNpc(PD_ZS_FRAME,"B_PrintLevelTooLow");
	msg = ConcatStrings(_STR_MESSAGE_LEVELTOOLOW,IntToString(level));
	ai_printscreen(self,msg,-1,_YPOS_MESSAGE_LEVELTOOLOW,FONT_OLD_BIG,_TIME_MESSAGE_LEVELTOOLOW,TEXT_COLOR_WHITE);
};

func void b_pointandshout(var C_Npc pointer,var C_Npc pointedat,var string shout)
{
	AI_TurnToNPC(pointer,pointedat);
	AI_PointAtNpc(pointer,pointedat);
	B_Say(pointer,pointedat,shout);
	AI_StopPointAt(pointer);
};

func void b_attackquick(var C_Npc me,var C_Npc enemy)
{
	Npc_SetTarget(me,enemy);
	AI_StartState(me,ZS_Attack,0,"");
};

func void b_attackproper(var C_Npc me,var C_Npc enemy)
{
	Npc_SetTarget(me,enemy);
	AI_StartState(me,ZS_Attack,1,"");
};

func void b_punish(var C_Npc me,var C_Npc enemy,var int reason)
{
	me.aivar[26] = reason;
	Npc_SetTarget(me,enemy);
	AI_StartState(me,ZS_ProclaimAndPunish,1,"");
};

func string b_concatthreestrings(var string text1,var string text2,var string text3)
{
	var string msg;
	msg = ConcatStrings(text1,text2);
	msg = ConcatStrings(msg,text3);
	return msg;
};

func string b_concatfourstrings(var string text1,var string text2,var string text3,var string text4)
{
	var string msg;
	msg = ConcatStrings(text1,text2);
	msg = ConcatStrings(msg,text3);
	msg = ConcatStrings(msg,text4);
	return msg;
};

func string b_concatfivestrings(var string text1,var string text2,var string text3,var string text4,var string text5)
{
	var string msg;
	msg = ConcatStrings(text1,text2);
	msg = ConcatStrings(msg,text3);
	msg = ConcatStrings(msg,text4);
	msg = ConcatStrings(msg,text5);
	return msg;
};

func int b_getday()
{
	return Wld_GetDay() + 1;
};

