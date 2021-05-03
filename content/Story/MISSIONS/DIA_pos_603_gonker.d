
instance POS_603_GONKER_EXIT(C_Info)
{
	npc = pos_603_gonker;
	nr = 999;
	condition = pos_603_gonker_exit_condition;
	information = pos_603_gonker_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pos_603_gonker_exit_condition()
{
	return TRUE;
};

func void pos_603_gonker_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_603_GONKER_CRAZY(C_Info)
{
	npc = pos_603_gonker;
	nr = 1;
	condition = pos_603_gonker_crazy_condition;
	information = pos_603_gonker_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_603_gonker_crazy_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void pos_603_gonker_crazy_info()
{
	if(GONKER_CRAZY == 0)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_01");	//Ist dir einer gefolgt?
		GONKER_CRAZY = 1;
		AI_PlayAni(self,"T_SEARCH");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 1)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_02");	//Haben sie dich geschickt?
		GONKER_CRAZY = 2;
		AI_PlayAni(self,"T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 2)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_03");	//Sie sind hinter mir her, ich weiß es.
		GONKER_CRAZY = 3;
		AI_PlayAni(self,"T_FORGETIT");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 3)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_04");	//Sie werden mich finden, sie finden jeden.
		GONKER_CRAZY = 4;
		AI_PlayAni(self,"T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_05");	//Hast du sie gesehen? Ich habe sie schon oft gesehen.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_SEARCH");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_06");	//Sie kommen in der Nacht, wenn wir schlafen
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_07");	//Irgendwann kriegen sie dich und dann nehmen sie dich mit.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_DONTKNOW");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_08");	//Sie stecken dich in einen Käfig und fügen dir Schmerzen zu.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_09");	//Sie machen schreckliche Dinge mit dir. Sie qäulen dich.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_IGETYOU");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_10");	//Ich war schon bei ihnen, aber ich bin ihnen entkommen!
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_STAND_2_MAD");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_11");	//Wenn sie mich noch einmal erwischen, werden sie mich töten.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_YES");
		AI_StopProcessInfos(self);
		return;
	};
	if(GONKER_CRAZY == 4)
	{
		AI_Output(self,hero,"Pos_603_CRAZY_00_12");	//Es sind viele. sie sind überall und sie beobachten alles.
		GONKER_CRAZY = 0;
		AI_PlayAni(self,"T_NO");
		AI_StopProcessInfos(self);
		return;
	};
};

