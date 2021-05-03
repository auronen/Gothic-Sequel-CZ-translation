
instance THIEF_EXIT(C_Info)
{
	nr = 999;
	condition = thief_exit_condition;
	information = thief_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int thief_exit_condition()
{
	if(self.aivar[36] > AIV_NODEED)
	{
		return TRUE;
	};
};

func void thief_exit_info()
{
	AI_StopProcessInfos(self);
};


instance THIEF_ANGRY(C_Info)
{
	nr = 10;
	condition = thief_angry_condition;
	information = thief_angry_info;
	description = "Dreckiger Dieb";
	permanent = TRUE;
	important = TRUE;
};


func int thief_angry_condition()
{
	PrintDebugNpc(PD_ZS_Check,"Thief_ANGRY_Condition");
	if((self.aivar[36] > AIV_NODEED) && (Npc_GetPermAttitude(self,other) == ATT_ANGRY) && c_npcisinvincible(hero))
	{
		PrintDebugNpc(PD_ZS_Check,"Thief_ANGRY_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void thief_angry_info()
{
	var string string_buildchoice;
	Info_ClearChoices(thief_angry);
	B_Say(self,other,"$YOUSTOLEFROMME");
	string_buildchoice = ConcatStrings("Tut mir leid! (",b_silveramounttosatisfy_string());
	string_buildchoice = ConcatStrings(string_buildchoice,"Silber geben)");
	Info_AddChoice(thief_angry,string_buildchoice,thief_angry_lieb);
	Info_AddChoice(thief_angry,"(ignorieren)",thief_angry_hauab);
};

func void b_assigntheftinfos(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_Check,"AssignTheftInfos");
	thief_exit.npc = Hlp_GetInstanceID(slf);
	thief_angry.npc = Hlp_GetInstanceID(slf);
};

func void thief_angry_lieb()
{
	var string string_choice;
	PrintDebugNpc(PD_ZS_Check,"Thief_Angry_Lieb");
	if(b_hasplayersilvertosatisfy())
	{
		b_exchangememoryattitude();
	}
	else
	{
		string_choice = ConcatStrings("Nicht genug Silber, ich will ",b_silveramounttosatisfy_string());
		PrintScreen(string_choice,-1,_YPOS_MESSAGE_GIVEN,FONT_OLD_SMALL,_TIME_MESSAGE_GIVEN);
	};
	AI_StopProcessInfos(self);
};

func void thief_angry_hauab()
{
	B_Say(self,other,"$YoullBeSorryForThis");
	AI_StopProcessInfos(self);
	AI_ContinueRoutine(self);
};

func void thief_angry_nomoney()
{
	AI_StopProcessInfos(self);
};

