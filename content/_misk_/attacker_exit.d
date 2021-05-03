
instance ATTACKER_EXIT(C_Info)
{
	nr = 999;
	condition = attacker_exit_condition;
	information = attacker_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int attacker_exit_condition()
{
	if(self.aivar[AIV_BEENATTACKED] > AIV_NODEED)
	{
		return TRUE;
	};
};

func void attacker_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ATTACKER_ANGRY(C_Info)
{
	nr = 10;
	condition = attacker_angry_condition;
	information = attacker_angry_info;
	permanent = TRUE;
	important = TRUE;
};


func int attacker_angry_condition()
{
	PrintDebugNpc(PD_ZS_Check,"Attacker_ANGRY_Condition");
	if((self.aivar[AIV_BEENATTACKED] > AIV_NODEED) && (Npc_GetPermAttitude(self,other) == ATT_ANGRY) && c_npcisinvincible(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"Attacker_Angry_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void attacker_angry_info()
{
	var string string_buildchoice;
	Info_ClearChoices(attacker_angry);
	B_Say(self,other,"$YOUATTACKEDME");
	string_buildchoice = ConcatStrings("Tut mir leid! (",b_silveramounttosatisfy_string());
	string_buildchoice = ConcatStrings(string_buildchoice,"Silber geben)");
	Info_AddChoice(attacker_angry,string_buildchoice,attacker_angry_lieb);
	Info_AddChoice(attacker_angry,"(ignorieren)",attacker_angry_hauab);
};

func void b_assigndamageinfos(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_Check,"AssignDamageInfos");
	attacker_exit.npc = Hlp_GetInstanceID(slf);
	attacker_angry.npc = Hlp_GetInstanceID(slf);
};

func void attacker_angry_lieb()
{
	var string string_choice;
	PrintDebugNpc(PD_ZS_Check,"Attacker_Angry_Lieb");
	if(b_hasplayersilvertosatisfy())
	{
		B_Say(self,other,"$LetsForgetOurLittleFight");
		b_exchangememoryattitude();
	}
	else
	{
		string_choice = ConcatStrings("Nicht genug Silber, ich will ",b_silveramounttosatisfy_string());
		PrintScreen(string_choice,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN);
	};
	AI_StopProcessInfos(self);
};

func void attacker_angry_hauab()
{
	B_Say(self,other,"$YoullBeSorryForThis");
	AI_StopProcessInfos(self);
	AI_ContinueRoutine(self);
};

func void attacker_angry_nomoney()
{
	AI_StopProcessInfos(self);
};

