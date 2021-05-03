
instance POS_600_JURGI_EXIT(C_Info)
{
	npc = pos_600_jurgi;
	nr = 999;
	condition = pos_600_jurgi_exit_condition;
	information = pos_600_jurgi_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pos_600_jurgi_exit_condition()
{
	return 1;
};

func void pos_600_jurgi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_600_JURGI_CRAZY(C_Info)
{
	npc = pos_600_jurgi;
	nr = 1;
	condition = pos_600_jurgi_crazy_condition;
	information = pos_600_jurgi_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_600_jurgi_crazy_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void pos_600_jurgi_crazy_info()
{
	if(JURGI_CRAZY == 0)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_01");	//Wohl denen die da gehen und sehen, denn sie sind es...äh..sie sind es...die sehen!
		JURGI_CRAZY = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if(JURGI_CRAZY == 1)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_02");	//Wahrlich ich sage dir ein Mann der ein Haus baut  ist ein Mann der...äh...Dinge hat,
		AI_Output(self,hero,"POS_600_CRAZY_00_03");	//die er braucht, er braucht diese Dinge, denn ohne diese Dinge äh...hat er sie nicht.
		JURGI_CRAZY = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if(JURGI_CRAZY == 2)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_04");	//Denn der Himmel öffnete sich und das Wasser ergoss sich über die Häupter von...
		AI_Output(self,hero,"POS_600_CRAZY_00_05");	//äh...allen die gesehen hatten...äh,...wie sie gingen und woher sie kamen.
		JURGI_CRAZY = 3;
		AI_StopProcessInfos(self);
		return;
	};
	if(JURGI_CRAZY == 3)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_06");	//Und sie hatten kleine Truhen mit noch kleineren Schachteln, in denen die winzigkleinen ...
		AI_Output(self,hero,"POS_600_CRAZY_00_07");	//wirklich wirklich winzigkleinen Dinge lagen, mit denen eigentlich niemand so recht wußte...
		AI_Output(self,hero,"POS_600_CRAZY_00_08");	//was er sagen wollte...äh...sie waren sehr klein - Winzig.
		JURGI_CRAZY = 4;
		AI_StopProcessInfos(self);
		return;
	};
	if(JURGI_CRAZY == 4)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_09");	//Und der Himmel wird sich blutrot färben und die Herrscharen werden kommen auf Rössern die schwarz wie die Nacht sind!
		AI_Output(self,hero,"POS_600_CRAZY_00_10");	//Und es wird eine große Not unter denen geben die nicht ...äh... diese kleinen Truhen haben.
		JURGI_CRAZY = 5;
		AI_StopProcessInfos(self);
		return;
	};
	if(JURGI_CRAZY == 5)
	{
		AI_Output(self,hero,"POS_600_CRAZY_00_11");	//Wahrlich ich frage dich : Was nützt ein Brunnen ohne Wasser? Was ist ein Vogel der nicht fliegt?
		AI_Output(self,hero,"POS_600_CRAZY_00_12");	//Aha! Also frage dich selber warum und vor allem  WAS in diesen kleinen Truhen ist...äh....
		JURGI_CRAZY = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

