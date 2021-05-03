
instance BEG_701_JOSE_EXIT(C_Info)
{
	npc = beg_701_jose;
	nr = 999;
	condition = beg_701_jose_exit_condition;
	information = beg_701_jose_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int beg_701_jose_exit_condition()
{
	return TRUE;
};

func void beg_701_jose_exit_info()
{
	AI_StopProcessInfos(self);
};


instance BEG_701_JOSE_HI(C_Info)
{
	npc = beg_701_jose;
	nr = 1;
	condition = beg_701_jose_hi_condition;
	information = beg_701_jose_hi_info;
	important = FALSE;
	permanent = TRUE;
	description = "Was machst du hier?";
};


func int beg_701_jose_hi_condition()
{
	return TRUE;
};

func void beg_701_jose_hi_info()
{
	AI_Output(hero,self,"BEG_701_HI_15_01");	//Was machst du hier?
	AI_Output(self,hero,"BEG_701_HI_02_02");	//Ich schau mir an wer hier ein und ausgeht. Die Soldaten achten nicht auf alles. Ich schon.
	AI_Output(hero,self,"BEG_701_HI_15_03");	//Und warum?
	AI_Output(self,hero,"BEG_701_HI_02_04");	//Es gibt immer jemanden der bereit ist, für Neuigkeiten zu bezahlen.
};


instance BEG_701_JOSE_NEWS(C_Info)
{
	npc = beg_701_jose;
	nr = 13;
	condition = beg_701_jose_news_condition;
	information = beg_701_jose_news_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und, gibt's was Neues?";
};


func int beg_701_jose_news_condition()
{
	if(Npc_KnowsInfo(hero,beg_701_jose_hi) && (BEGGARS_SECRETS >= 3))
	{
		return TRUE;
	};
};

func void beg_701_jose_news_info()
{
	AI_Output(hero,self,"BEG_701_NEWS_15_01");	//Und, gibt's was Neues?
	AI_Output(self,hero,"BEG_701_NEWS_02_02");	//Es gibt immer was Neues. Bei so viel Verrückten hier...
	AI_Output(hero,self,"BEG_701_NEWS_15_03");	//Wie meinst du das?
	AI_Output(self,hero,"BEG_701_NEWS_02_04");	//Zum Beispiel Bromor. Der Baumeister sammelt Trophäen von Tieren.
	AI_Output(self,hero,"BEG_701_NEWS_02_05");	//Und die meisten anderen trauen sich selber nicht über den Weg. Alles Verrückte!
	AI_Output(self,hero,"BEG_701_NEWS_02_06");	//Und ich bin mittendrin und krieg alles mit. Das ist besser als Arenakämpfe ansehen.
};

