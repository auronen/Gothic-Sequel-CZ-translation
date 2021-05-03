
const int AMNT_GREENNOVICE = 1;
const int AMNT_BLACKWISE = 2;
const int AMNT_DREAMCALL = 3;

func int mob_stomper_hasbasics()
{
	printdebugmobsi("MOB_Stomper_HasBasics");
	if((hero.aivar[33] == AIV_AM_STOMPER) && (Npc_HasItems(hero,itmi_stomper) >= 1))
	{
		printdebugmobsi("MOB_Cauldron_HasBasics ... TRUE");
		return TRUE;
	}
	else
	{
		printdebugmobsi("MOB_Cauldron_HasBasics ... FALSE");
		return FALSE;
	};
};

func int mob_stomper_canproducegreennovice()
{
	printdebugmobsi("Mob_Stomper_CanProduceGreen");
	if((Npc_HasItems(self,itpl_swampweed) >= AMNT_GREENNOVICE) && mob_stomper_hasbasics())
	{
		printdebugmobsi("Mob_Stomper_CanProduceGreen ... True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Stomper_CanProduceGreen ...False");
		return FALSE;
	};
};

func int mob_stomper_canproduceblackwise()
{
	printdebugmobsi("Mob_Stomper_CanProduceBlackWise");
	if((Npc_HasItems(self,itpl_swampweed) >= AMNT_BLACKWISE) && mob_stomper_hasbasics())
	{
		printdebugmobsi("Mob_Stomper_CanProduceBlackWise ...True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Stomper_CanProduceBlackWise...False");
		return FALSE;
	};
};

func int mob_stomper_canproducedreamcall()
{
	printdebugmobsi("Mob_Stomper_CanProduceDreamCall");
	if((Npc_HasItems(self,itpl_swampweed) >= AMNT_DREAMCALL) && mob_stomper_hasbasics())
	{
		printdebugmobsi("Mob_Stomper_CanProduceDreamCall True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Stomper_CanProduceDreamCall ...False");
		return FALSE;
	};
};

func int mob_stomper_canproduce()
{
	printdebugmobsi("Mob_Stomper_CanProduce");
	if(mob_stomper_canproducegreennovice() || mob_stomper_canproduceblackwise() || mob_stomper_canproducedreamcall())
	{
		printdebugmobsi("Mob_Stomper_CanProduce ...True");
		return TRUE;
	}
	else
	{
		printdebugmobsi("Mob_Stomper_CanProduce ...False");
		return FALSE;
	};
};

func string mob_stomper_getcantstring()
{
	printdebugmobsi("MOB_Stomper_GetCantString");
	if(Npc_HasItems(self,itmi_stomper) < 1)
	{
		printdebugmobsi("MOB_Stomper_GetCantString... no Tool");
		return _STR_MESSAGE_MOBSI_STOMPER_TOOL;
	}
	else
	{
		printdebugmobsi("MOB_Stomper_GetCantString no Material");
		return _STR_MESSAGE_MOBSI_STOMPER_MAT;
	};
};


instance MOB_STOMPER_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = mob_stomper_hasbasics;
	information = mob_stomper_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func void mob_stomper_exit_info()
{
	AI_StopProcessInfos(hero);
	hero.aivar[24] = FALSE;
	ai_removeitemfromslot(self,"ZS_LEFTHAND");
	ai_removeitemfromslot(self,"ZS_RIGHTHAND");
	AI_UseMob(self,SCEMENAME_STOMPER,-1);
};

func void mob_stomper_autoexit()
{
	printdebugmobsi("MOB_Stomper_AutoExit");
	if(!mob_stomper_canproduce())
	{
		mob_stomper_exit_info();
	};
};

func void mob_produce_greennovice()
{
	b_produceitem(1,4707,NAME_JOINT1,AMNT_GREENNOVICE,5069);
	mob_stomper_autoexit();
};

func void mob_produce_blackwise()
{
	b_produceitem(1,4709,NAME_JOINT2,AMNT_BLACKWISE,5069);
	mob_stomper_autoexit();
};

func void mob_produce_dreamcall()
{
	b_produceitem(1,4711,NAME_JOINT3,AMNT_DREAMCALL,5069);
	mob_stomper_autoexit();
};


instance MOB_STOMPER(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_stomper_canproducegreennovice;
	information = mob_stomperdialog_info;
	important = 0;
	permanent = 1;
	description = "Grünen Novicen rollen";
};


func void mob_stomperdialog_info()
{
	mob_produce_greennovice();
};

func void mob_stomper_back()
{
	Info_ClearChoices(mob_stomper);
};


instance MOB_STOMPER_BLACKWISE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_stomper_canproduceblackwise;
	information = mob_stomper_blackwisedialog_info;
	important = 0;
	permanent = 1;
	description = "Schwarzen Weisen rollen";
};


func void mob_stomper_blackwisedialog_info()
{
	mob_produce_blackwise();
};


instance MOB_STOMPER_DREAMCALL(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = mob_stomper_canproducedreamcall;
	information = mob_stomper_dreamcalldialog_info;
	important = 0;
	permanent = 1;
	description = "Traumruf rollen";
};


func void mob_stomper_dreamcalldialog_info()
{
	mob_produce_dreamcall();
};

func int mob_stomper_condition()
{
	printdebugmobsi("MOB_Stomper_CONDITION");
	self.aivar[33] = AIV_AM_STOMPER;
	if(Npc_IsPlayer(self))
	{
		if(mob_stomper_canproduce())
		{
			printdebugmobsi("MOB_Stomper_CONDITION...TRUE");
			return TRUE;
		}
		else
		{
			PrintScreen(mob_stomper_getcantstring(),-1,_YPOS_MESSAGE_MOBSI,FONT_OLD_SMALL,_TIME_MESSAGE_MOBSI);
			AI_PlayAni(self,"T_DONTKNOW");
			printdebugmobsi("MOB_Stomper_CONDITION...FALSE");
			return FALSE;
		};
	}
	else
	{
		printdebugmobsi("MOB_Stomper_CONDITION...TRUE");
		return TRUE;
	};
};

func void mob_stomper_s1()
{
	printdebugmobsi("MOB_Stomper_S1");
	if(B_CompareNpcInstance(self,hero))
	{
		printdebugmobsi("...vom SC benutzt");
		PrintGlobals(PD_ITEM_MOBSI);
		self.aivar[24] = TRUE;
		self.aivar[33] = AIV_AM_STOMPER;
		AI_ProcessInfos(self);
	};
};

