
instance POS_602_HALBERT_EXIT(C_Info)
{
	npc = pos_602_halbert;
	nr = 999;
	condition = pos_602_halbert_exit_condition;
	information = pos_602_halbert_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pos_602_halbert_exit_condition()
{
	return TRUE;
};

func void pos_602_halbert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance POS_602_HALBERT_CRAZY(C_Info)
{
	npc = pos_602_halbert;
	nr = 1;
	condition = pos_602_halbert_crazy_condition;
	information = pos_602_halbert_crazy_info;
	important = TRUE;
	permanent = TRUE;
};


func int pos_602_halbert_crazy_condition()
{
	if(c_npcisinvincible(self))
	{
		return TRUE;
	};
};

func void pos_602_halbert_crazy_info()
{
	if((HALBERT_CRAZY == 0) && Wld_IsTime(4,0,20,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_01");	//Des Tages Licht ist meine Agonie.
		HALBERT_CRAZY = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if((HALBERT_CRAZY == 1) && Wld_IsTime(4,0,20,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_02");	//Der Tag ist eine ewige Qual.
		HALBERT_CRAZY = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if((HALBERT_CRAZY == 2) && Wld_IsTime(4,0,20,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_03");	//Stunde um Stunde Schmerz um Schmerz.
		HALBERT_CRAZY = 0;
		AI_StopProcessInfos(self);
		return;
	};
	if((HALBERT_NIGHT == 0) && Wld_IsTime(20,0,4,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_04");	//Siehst du die Sternbilder?
		AI_Output(self,hero,"POS_602_CRAZY_00_05");	//Sie waren schon da bevor wir waren und sie werden immer sein, wenn wir längst vergangen sind
		HALBERT_NIGHT = 1;
		AI_StopProcessInfos(self);
		return;
	};
	if((HALBERT_NIGHT == 1) && Wld_IsTime(20,0,4,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_06");	//Spürst du die Nacht? Sie währt bereits ewig und sieht niemals das Licht der Sonne.
		HALBERT_NIGHT = 2;
		AI_StopProcessInfos(self);
		return;
	};
	if((HALBERT_NIGHT == 2) && Wld_IsTime(20,0,4,0))
	{
		AI_Output(self,hero,"POS_602_CRAZY_00_07");	//Fühlst du die Dunkelheit?
		AI_Output(self,hero,"POS_602_CRAZY_00_08");	//Sie ist überall, schön und friedlich. Aber die Dunkelheit in dir, nennst du Angst und Zweifel.
		HALBERT_NIGHT = 0;
		AI_StopProcessInfos(self);
		return;
	};
};

